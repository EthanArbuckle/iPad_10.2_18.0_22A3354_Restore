@implementation MFMessageDetails

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageDetails;
  -[MFMessageDetails dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p libraryID=%u uid=%u flags=0x%x>"), NSStringFromClass(v4), self, self->libraryID, self->uid, self->messageFlags);
}

- (BOOL)isEqual:(id)a3
{
  unsigned int libraryID;
  objc_super v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    libraryID = self->libraryID;
    return libraryID == objc_msgSend(a3, "libraryID");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFMessageDetails;
    return -[MFMessageDetails isEqual:](&v7, sel_isEqual_, a3);
  }
}

- (BOOL)isLibraryMessage
{
  return 1;
}

- (unint64_t)hash
{
  return (0x4F1BBCD880000000 * (unint64_t)self->libraryID) >> 32;
}

- (id)remoteID
{
  return (id)EFStringWithInt();
}

- (id)messageID
{
  return (id)EFStringWithInt();
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)-[MFMessageLibrary mailboxUidForMessage:](self->library, "mailboxUidForMessage:", self);
}

- (BOOL)deleted
{
  return (LOBYTE(self->messageFlags) >> 1) & 1;
}

- (BOOL)read
{
  return self->messageFlags & 1;
}

- (BOOL)isKnownToHaveAttachments
{
  int messageFlags;

  messageFlags = self->messageFlags;
  return (unsigned __int16)messageFlags >> 10 && (unsigned __int16)messageFlags >> 10 != 63;
}

- (BOOL)flagged
{
  return (LOBYTE(self->messageFlags) >> 4) & 1;
}

- (BOOL)senderVIP
{
  return BYTE3(self->messageFlags) & 1;
}

- (id)copyMessageInfo
{
  uint64_t libraryID;
  uint64_t mailboxID;
  uint64_t dateReceived;
  uint64_t dateSent;
  int64_t messageIDHash;
  int64_t conversationHash;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  MFMessageInfo *v12;
  uint64_t v14;
  MFMessageInfo *v15;

  v15 = [MFMessageInfo alloc];
  libraryID = self->libraryID;
  mailboxID = self->mailboxID;
  dateReceived = self->dateReceived;
  dateSent = self->dateSent;
  conversationHash = self->conversationHash;
  messageIDHash = self->messageIDHash;
  v9 = -[MFMessageDetails read](self, "read");
  v10 = -[MFMessageDetails isKnownToHaveAttachments](self, "isKnownToHaveAttachments");
  v11 = -[MFMessageDetails flagged](self, "flagged");
  BYTE3(v14) = -[MFMessageDetails senderVIP](self, "senderVIP");
  BYTE2(v14) = v11;
  BYTE1(v14) = v10;
  LOBYTE(v14) = v9;
  v12 = -[MFMessageInfo initWithUid:mailboxID:messageID:dateReceivedInterval:dateSentInterval:conversationHash:read:knownToHaveAttachments:flagged:isVIP:](v15, "initWithUid:mailboxID:messageID:dateReceivedInterval:dateSentInterval:conversationHash:read:knownToHaveAttachments:flagged:isVIP:", libraryID, mailboxID, messageIDHash, dateReceived, dateSent, conversationHash, v14);
  -[MFMessageInfo setUidIsLibraryID:](v12, "setUidIsLibraryID:", 1);
  return v12;
}

- (unsigned)uid
{
  return self->uid;
}

- (unsigned)libraryID
{
  return self->libraryID;
}

- (unsigned)mailboxID
{
  return self->mailboxID;
}

- (int64_t)messageIDHash
{
  return self->messageIDHash;
}

- (unint64_t)messageFlags
{
  return self->messageFlags;
}

- (unsigned)dateReceivedInterval
{
  return self->dateReceived;
}

- (unsigned)dateSentInterval
{
  return self->dateSent;
}

- (int64_t)conversationHash
{
  return self->conversationHash;
}

- (NSString)externalID
{
  return self->externalID;
}

@end
