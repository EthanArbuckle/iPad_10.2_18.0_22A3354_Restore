@implementation MFIMAPMessage

- (MFIMAPMessage)initWithFlags:(unint64_t)a3 size:(unint64_t)a4 uid:(unsigned int)a5
{
  MFIMAPMessage *v8;
  MFIMAPMessage *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFIMAPMessage;
  v8 = -[MFIMAPMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MFMailMessage setMessageFlags:](v8, "setMessageFlags:", a3);
    v9->_size = a4;
    v9->_uid = a5;
  }
  return v9;
}

- (id)_privacySafeDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFIMAPMessage;
  -[MFIMAPMessage _privacySafeDescription](&v7, sel__privacySafeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPMessage remoteID](self, "remoteID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" remoteID:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)messageSize
{
  return self->_size;
}

- (id)messageID
{
  __int128 v2;
  const char *v3;
  int v4;
  char __str[16];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v2;
  v7 = v2;
  if ((self->super._messageFlags & 0x400000000) != 0)
    v3 = "temp-";
  else
    v3 = "";
  v4 = snprintf(__str, 0x1FuLL, "%s%u", v3, self->_uid);
  return (id)(id)CFStringCreateWithBytes(0, (const UInt8 *)__str, v4, 0x600u, 0);
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unint64_t)uniqueRemoteId
{
  return self->_uniqueRemoteId;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  self->_uniqueRemoteId = a3;
}

- (BOOL)isPartial
{
  return (BYTE4(self->super._messageFlags) >> 2) & 1;
}

- (void)setIsPartial:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)isMessageContentsLocallyAvailable
{
  return 0;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  objc_super v3;

  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 != -1) << 35);
  v3.receiver = self;
  v3.super_class = (Class)MFIMAPMessage;
  -[MFIMAPMessage setPreferredEncoding:](&v3, sel_setPreferredEncoding_);
}

- (BOOL)hasTemporaryUid
{
  return BYTE4(self->super._messageFlags) & 1;
}

- (id)remoteID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uid);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteMailboxURL
{
  void *v2;
  void *v3;

  -[MFMailMessage mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
