@implementation MFDataMessageStore

- (MFDataMessageStore)initWithData:(id)a3
{
  id v5;
  MFDataMessageStore *v6;
  MFDataMessageStore *v7;
  MFDataMessageStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFDataMessageStore;
  v6 = -[MFMessageStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (id)storagePath
{
  return self->_storagePath;
}

- (void)setStoragePath:(id)a3
{
  NSString *v4;
  NSString *storagePath;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  storagePath = self->_storagePath;
  self->_storagePath = v4;

}

- (void)setMessageClass:(Class)a3
{
  self->_messageClass = a3;
}

- (id)message
{
  objc_class *messageClass;
  id v4;

  messageClass = self->_messageClass;
  if (!messageClass)
  {
    messageClass = (objc_class *)objc_opt_class();
    self->_messageClass = messageClass;
  }
  v4 = objc_alloc_init(messageClass);
  objc_msgSend(v4, "setMessageStore:", self);
  return v4;
}

- (id)account
{
  return 0;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  id v5;
  unint64_t v6;
  NSUInteger v7;
  char v8;
  unint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[16];

  v5 = a3;
  v6 = -[NSData bytes](self->_data, "bytes");
  v7 = -[NSData length](self->_data, "length");
  if (v7)
  {
    v8 = 0;
    v9 = ~v6;
    while (1)
    {
      v11 = *(unsigned __int8 *)v6++;
      v10 = v11;
      if ((v8 & 1) != 0 && v10 == 10)
        break;
      v8 = (v10 == 10) & ~v8;
      --v9;
      if (!--v7)
        goto LABEL_6;
    }
    +[MFData dataWithBytes:length:](MFData, "dataWithBytes:length:", -[NSData bytes](self->_data, "bytes"), -(uint64_t)v9 - (unint64_t)-[NSData bytes](self->_data, "bytes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1ABB13000, v12, OS_LOG_TYPE_DEFAULT, "#Warning NSDataMessageStore: couldn't find body", v15, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 0;
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  id v9;
  unint64_t v10;
  NSUInteger v11;
  char v12;
  uint64_t v13;
  char *v14;
  int v15;
  NSObject *v17;
  void *v18;
  __int16 v20[8];

  v9 = a3;
  if (a5)
    *a5 = 0;
  v10 = -[NSData bytes](self->_data, "bytes");
  v11 = -[NSData length](self->_data, "length");
  if (v11)
  {
    v12 = 0;
    v13 = -(uint64_t)v11;
    v14 = (char *)(v10 + 1);
    while (1)
    {
      v15 = *(v14 - 1);
      if ((v12 & 1) != 0 && v15 == 10)
        break;
      v12 = (v15 == 10) & ~v12;
      ++v14;
      if (__CFADD__(v13++, 1))
        goto LABEL_9;
    }
    if (a4)
      *a4 = 1;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, ~v10 + -[NSData bytes](self->_data, "bytes") - v13, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    MFLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 0;
      _os_log_impl(&dword_1ABB13000, v17, OS_LOG_TYPE_DEFAULT, "#Warning NSDataMessageStore: couldn't find body", (uint8_t *)v20, 2u);
    }

    v18 = 0;
    if (a4)
      *a4 = 0;
  }

  return v18;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  return a4;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  return a4;
}

- (id)_cachedBodyDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  -[MFDataMessageStore bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:](self, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  return a3;
}

- (id)mailboxUid
{
  return self->_mailboxUid;
}

- (BOOL)messageCanBeTriaged:(id)a3
{
  return 0;
}

- (void)setMailboxUid:(id)a3
{
  objc_storeStrong(&self->_mailboxUid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mailboxUid, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
