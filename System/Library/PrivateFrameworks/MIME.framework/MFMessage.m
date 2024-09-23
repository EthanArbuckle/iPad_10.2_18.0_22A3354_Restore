@implementation MFMessage

+ (Class)dataMessageStoreToUse
{
  return (Class)objc_opt_class();
}

+ (id)messageWithRFC822Data:(id)a3
{
  objc_msgSend(a1, "messageWithRFC822Data:withParentPart:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)messageWithRFC822Data:(id)a3 withParentPart:(id)a4
{
  objc_msgSend(a1, "messageWithRFC822Data:withParentPart:generateMessageIDHash:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)messageWithRFC822Data:(id)a3 forMailboxUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "dataMessageStoreToUse")), "initWithData:", v6);
  objc_msgSend(v8, "setMailboxUid:", v7);
  objc_msgSend(a1, "setMessageClassForStore:", v8);
  objc_msgSend(v8, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-attach-RFC822"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMessageURL:", v14);

  return v9;
}

+ (id)messageWithRFC822Data:(id)a3 withParentPart:(id)a4 generateMessageIDHash:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "dataMessageStoreToUse")), "initWithData:", v8);
  objc_msgSend(a1, "setMessageClassForStore:", v10);
  objc_msgSend(v10, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setParentPart:", v9);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-attach-RFC822"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMessageURL:", v16);

  if (v5 && !objc_msgSend(v11, "messageIDHash"))
  {
    objc_msgSend(v11, "headers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessageIDHash:", MFMessageIDHashFromHeaders(v17, 1));

  }
  objc_msgSend(v11, "headers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstHeaderForKey:", *MEMORY[0x1E0D1E638]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v19);
    objc_msgSend(v11, "setDocumentID:", v20);

  }
  return v11;
}

+ (void)setMessageClassForStore:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setMessageClass:", objc_opt_class());

}

- (MFMessage)init
{
  MFMessage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessage;
  result = -[MFMessage init](&v3, sel_init);
  if (result)
  {
    result->_preferredEncoding = -1;
    atomic_store(0, &result->_generationNumber);
  }
  return result;
}

- (BOOL)strongParentPart
{
  void *v2;
  BOOL v3;

  -[MFMessage strongParentPartReference](self, "strongParentPartReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setStrongParentPart:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  if (a3)
  {
    -[MFMessage parentPart](self, "parentPart");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  -[MFMessage setStrongParentPartReference:](self, "setStrongParentPartReference:", v5);
  if (v3)

}

- (void)setParentPart:(id)a3
{
  objc_storeWeak((id *)&self->_parentPart, a3);
  -[MFMessage setStrongParentPart:](self, "setStrongParentPart:", a3 != 0);
}

- (id)_privacySafeDescription
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  _MFLockGlobalLock();
  LODWORD(v3) = self->_dateReceivedInterval;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MFUnlockGlobalLock();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[MFMessage conversationID](self, "conversationID");
  EFStringWithInt64();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EFStringWithInt64();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p> ConversationID:%@ messageID:%@ received:%@"), v6, self, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
    -[MFMessage description](self, "description");
  else
    -[MFMessage _privacySafeDescription](self, "_privacySafeDescription");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (MFMessageStore)messageStore
{
  MFMessageStore *v3;

  _MFLockGlobalLock();
  v3 = self->_store;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setMessageStore:(id)a3
{
  MFMessageStore *v5;
  id v6;

  v6 = a3;
  _MFLockGlobalLock();
  v5 = self->_store;
  objc_storeStrong((id *)&self->_store, a3);
  _MFUnlockGlobalLock();

}

- (id)headers
{
  void *v3;
  void *v4;

  -[MFMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headersForMessage:fetchIfNotAvailable:", self, _ECIsNetworkActivityAllowed());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MFMessageHeaders)headersIfAvailable
{
  void *v3;
  void *v4;

  -[MFMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headersForMessage:fetchIfNotAvailable:", self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFMessageHeaders *)v4;
}

- (id)messageBody
{
  void *v3;
  void *v4;

  -[MFMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self, _ECIsNetworkActivityAllowed(), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)messageBodyIfAvailable
{
  void *v3;
  void *v4;

  -[MFMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)messageBodyUpdatingFlags:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self, _ECIsNetworkActivityAllowed(), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)messageBodyIfAvailableUpdatingFlags:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self, 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  id v23;

  v6 = a6;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  -[MFMessage messageStore](self, "messageStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  if (v6)
    v12 = _ECIsNetworkActivityAllowed();
  else
    v12 = 0;
  objc_msgSend(v11, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:didDownload:", self, &v23, a5, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (!v14)
  {
    if (v6)
      v15 = _ECIsNetworkActivityAllowed();
    else
      v15 = 0;
    objc_msgSend(v11, "headerDataForMessage:downloadIfNecessary:", self, v15);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v14)
    v16 = v13 == 0;
  else
    v16 = 1;
  v17 = !v16;
  if (!v16)
  {
    v18 = objc_msgSend(v14, "length");
    v19 = objc_msgSend(v13, "length") + v18;
    if (a4)
      *a4 = v19;
    if (a3)
    {
      +[MFMutableData dataWithCapacity:](MFMutableData, "dataWithCapacity:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendData:", v14);
      objc_msgSend(v20, "appendData:", v13);
      objc_msgSend(v20, "mf_makeImmutable");
      v21 = objc_retainAutorelease(v20);
      *a3 = v21;

    }
  }

  return v17;
}

- (id)messageDataIsPartial:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MFMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", self, 0, a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MFMessage messageStore](self, "messageStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerDataForMessage:downloadIfNecessary:", self, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[MFMutableData dataWithCapacity:](MFMutableData, "dataWithCapacity:", objc_msgSend(v8, "length") + objc_msgSend(v6, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendData:", v8);
      objc_msgSend(v9, "appendData:", v6);
      objc_msgSend(v9, "mf_makeImmutable");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)messageDataIsComplete:(BOOL *)a3 downloadIfNecessary:(BOOL)a4
{
  id v5;

  v5 = 0;
  -[MFMessage messageData:messageSize:isComplete:downloadIfNecessary:](self, "messageData:messageSize:isComplete:downloadIfNecessary:", &v5, 0, a3, a4);
  return v5;
}

- (id)messageData
{
  return -[MFMessage messageDataIsComplete:downloadIfNecessary:](self, "messageDataIsComplete:downloadIfNecessary:", 0, 1);
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;

  v6 = a6;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  -[MFMessage messageStore](self, "messageStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  if (v6)
    v12 = _ECIsNetworkActivityAllowed();
  else
    v12 = 0;
  objc_msgSend(v11, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:didDownload:", self, &v23, a5, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (!v14)
  {
    if (v6)
      v15 = _ECIsNetworkActivityAllowed();
    else
      v15 = 0;
    objc_msgSend(v11, "headerDataForMessage:downloadIfNecessary:", self, v15);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v14)
    v16 = v13 == 0;
  else
    v16 = 1;
  v17 = !v16;
  if (!v16)
  {
    v18 = objc_msgSend(v14, "length");
    v19 = objc_msgSend(v13, "length");
    if (a4)
      *a4 = v19 + v18;
    if (a3)
    {
      +[MFDataHolder dataHolderWithData:](MFDataHolder, "dataHolderWithData:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addData:", v13);
      v21 = objc_retainAutorelease(v20);
      *a3 = v21;

    }
  }

  return v17;
}

- (id)messageDataHolderIsComplete:(BOOL *)a3 downloadIfNecessary:(BOOL)a4
{
  id v5;

  v5 = 0;
  -[MFMessage messageDataHolder:messageSize:isComplete:downloadIfNecessary:](self, "messageDataHolder:messageSize:isComplete:downloadIfNecessary:", &v5, 0, a3, a4);
  return v5;
}

- (id)messageDataHolder
{
  return -[MFMessage messageDataHolderIsComplete:downloadIfNecessary:](self, "messageDataHolderIsComplete:downloadIfNecessary:", 0, 1);
}

- (id)dataConsumerForMimePart:(id)a3
{
  return 0;
}

- (unint64_t)messageSize
{
  unint64_t v3;

  v3 = 0;
  -[MFMessage messageData:messageSize:isComplete:downloadIfNecessary:](self, "messageData:messageSize:isComplete:downloadIfNecessary:", 0, &v3, 0, 1);
  return v3;
}

- (unint64_t)fileSize
{
  return 0;
}

- (id)preferredEmailAddressToReplyWith
{
  return 0;
}

- (id)messageID
{
  return 0;
}

- (void)setMessageURL:(id)a3
{
  objc_storeStrong((id *)&self->_messageURL, a3);
}

- (id)messageURL
{
  void *v3;
  void *v4;
  void *v5;
  NSURL *messageURL;
  NSURL **p_messageURL;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSURL *v12;

  -[MFMessage parentPart](self, "parentPart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  p_messageURL = &self->_messageURL;
  messageURL = self->_messageURL;
  if (!messageURL)
  {
    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0C99E98];
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessage messageID](self, "messageID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("x-attach://%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLWithString:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)p_messageURL, v5);
    messageURL = *p_messageURL;
  }
  v12 = messageURL;

  return v12;
}

- (int64_t)messageIDHash
{
  int64_t messageIDHeaderHash;
  int64_t v5;
  void *v6;

  _MFLockGlobalLock();
  messageIDHeaderHash = self->_messageIDHeaderHash;
  if (messageIDHeaderHash == 0x7FFFFFFFFFFFFFFFLL || messageIDHeaderHash == 0)
    v5 = 0;
  else
    v5 = self->_messageIDHeaderHash;
  _MFUnlockGlobalLock();
  if (!messageIDHeaderHash)
  {
    if (-[MFMessage isMessageContentsLocallyAvailable](self, "isMessageContentsLocallyAvailable"))
    {
      -[MFMessage headers](self, "headers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v6);

      _MFLockGlobalLock();
      if (self->_messageIDHeaderHash == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 0;
      else
        v5 = self->_messageIDHeaderHash;
      _MFUnlockGlobalLock();
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)messageIDHeaderHash
{
  int64_t v2;
  void *v3;

  v2 = -[MFMessage messageIDHash](self, "messageIDHash");
  v3 = 0;
  if (v2 && v2 != 0x7FFFFFFFFFFFFFFFLL)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithHash:", v2);
  return v3;
}

- (id)messageIDHeader
{
  NSString *v3;
  void *v4;
  void *v5;

  _MFLockGlobalLock();
  v3 = self->_cachedMessageIDHeader;
  _MFUnlockGlobalLock();
  if (!v3)
  {
    -[MFMessage headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage setMessageIDHeader:](self, "setMessageIDHeader:", v5);

    _MFLockGlobalLock();
    v3 = self->_cachedMessageIDHeader;
    _MFUnlockGlobalLock();
  }
  return v3;
}

- (void)setMessageIDHeader:(id)a3
{
  NSString *v4;
  NSString *cachedMessageIDHeader;
  id v6;

  v6 = a3;
  _MFLockGlobalLock();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  cachedMessageIDHeader = self->_cachedMessageIDHeader;
  self->_cachedMessageIDHeader = v4;

  _MFUnlockGlobalLock();
}

- (id)messageIDHeaderInFortyBytesOrLess
{
  void *v2;
  id v3;
  void *v4;

  -[MFMessage messageIDHeader](self, "messageIDHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("@")) == 37)
  {
    objc_msgSend(v2, "substringWithRange:", 1, 36);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v2, "length") < 0x29)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "substringToIndex:", 40);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (int64_t)_messageIDHeaderHashIvar
{
  int64_t messageIDHeaderHash;

  -[MFMessage messageIDHash](self, "messageIDHash");
  _MFLockGlobalLock();
  messageIDHeaderHash = self->_messageIDHeaderHash;
  _MFUnlockGlobalLock();
  return messageIDHeaderHash;
}

- (NSURL)externalReference
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[MFMessage messageID](self, "messageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessage externalID](self, "externalID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v7, "setScheme:", *MEMORY[0x1E0D1DB98]);
    objc_msgSend(v7, "setHost:", CFSTR("message"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPath:", v8);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("uuid"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueryItems:", v10);

    objc_msgSend(v7, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v6;
}

- (BOOL)isMessageContentsLocallyAvailable
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[MFMessage path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v4, "fileExistsAtPath:", v5);

  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1;
  }
  return v6;
}

- (unint64_t)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (BOOL)calculatedNumberOfAttachments
{
  return *((_BYTE *)self + 160) & 1;
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  ECSubject *subject;
  NSString *senderAddressComment;
  NSArray *sender;
  NSArray *to;
  NSArray *cc;
  NSArray *bcc;

  if (self->_preferredEncoding != a3)
  {
    self->_preferredEncoding = a3;
    _MFLockGlobalLock();
    subject = self->_subject;
    self->_subject = 0;

    senderAddressComment = self->_senderAddressComment;
    self->_senderAddressComment = 0;

    sender = self->_sender;
    self->_sender = 0;

    to = self->_to;
    self->_to = 0;

    cc = self->_cc;
    self->_cc = 0;

    bcc = self->_bcc;
    self->_bcc = 0;

    _MFUnlockGlobalLock();
  }
}

- (BOOL)_doesDateAppearToBeSane:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSince1970");
    v6 = v5 > 160736400.0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_copyDateFromReceivedHeadersInHeaders:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copyHeadersForKey:", *MEMORY[0x1E0D1E5B8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR(";"), 4);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v9, "substringFromIndex:", v10 + v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "mf_copyDateInCommonFormatsWithString:", v12);

        if (v13)
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v13 = 0;
  }

  if (!-[MFMessage _doesDateAppearToBeSane:](self, "_doesDateAppearToBeSane:", v13))
  {

    v13 = 0;
  }

  return v13;
}

- (id)_copyDateFromDateHeaderInHeaders:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "copyFirstHeaderForKey:", *MEMORY[0x1E0D1E560]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "mf_copyDateInCommonFormatsWithString:", v4);
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  if (!-[MFMessage _doesDateAppearToBeSane:](self, "_doesDateAppearToBeSane:", v6))
  {

    v6 = 0;
  }

  return v6;
}

- (void)_setDateReceivedFromHeaders:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[MFMessage _copyDateFromReceivedHeadersInHeaders:](self, "_copyDateFromReceivedHeadersInHeaders:");
  if (v4 || (v4 = -[MFMessage _copyDateFromDateHeaderInHeaders:](self, "_copyDateFromDateHeaderInHeaders:", v7)) != 0)
  {
    v5 = 0;
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v5 = 1;
  }
  objc_msgSend(v6, "timeIntervalSince1970");
  -[MFMessage setDateReceivedAsTimeIntervalSince1970:](self, "setDateReceivedAsTimeIntervalSince1970:");
  if (v5)

}

- (void)_setDateSentFromHeaders:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[MFMessage _copyDateFromDateHeaderInHeaders:](self, "_copyDateFromDateHeaderInHeaders:");
  if (v4
    || (v4 = -[MFMessage _copyDateFromReceivedHeadersInHeaders:](self, "_copyDateFromReceivedHeadersInHeaders:", v7)) != 0)
  {
    v5 = 0;
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v5 = 1;
  }
  objc_msgSend(v6, "timeIntervalSince1970");
  -[MFMessage setDateSentAsTimeIntervalSince1970:](self, "setDateSentAsTimeIntervalSince1970:");
  if (v5)

}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  id v4;
  ECSubject *subject;
  NSArray *sender;
  NSString *contentType;
  NSArray *cc;
  NSArray *to;
  NSArray *bcc;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  ECAngleBracketIDHash *listIDHash;
  unsigned int dateSentInterval;
  unsigned int dateReceivedInterval;
  id v30;

  v4 = a3;
  _MFLockGlobalLock();
  subject = self->_subject;
  sender = self->_sender;
  contentType = self->_contentType;
  to = self->_to;
  cc = self->_cc;
  bcc = self->_bcc;
  dateSentInterval = self->_dateSentInterval;
  dateReceivedInterval = self->_dateReceivedInterval;
  listIDHash = self->_listIDHash;
  _MFUnlockGlobalLock();
  if (subject)
  {
    v11 = 0;
    if (sender)
      goto LABEL_3;
  }
  else
  {
    v19 = objc_msgSend(v4, "copyFirstHeaderForKey:", *MEMORY[0x1E0D1E5F8]);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E7A0]), "initWithString:", v19);
    -[MFMessage setSubject:](self, "setSubject:", v20);

    v11 = (__CFString *)v19;
    if (sender)
    {
LABEL_3:
      v12 = v11;
      if (!to)
        goto LABEL_4;
LABEL_19:
      v13 = v12;
      if (!cc)
        goto LABEL_20;
      goto LABEL_8;
    }
  }
  v12 = (__CFString *)objc_msgSend(v4, "copyAddressListForSender");

  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFMessage setSender:](self, "setSender:", v21);
  if (v12)
  {
    if (to)
      goto LABEL_19;
  }
  else
  {

    if (to)
      goto LABEL_19;
  }
LABEL_4:
  v13 = (__CFString *)objc_msgSend(v4, "copyAddressListForTo");

  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFMessage setTo:](self, "setTo:", v14);
  if (!v13)
  {

    if (!cc)
      goto LABEL_20;
LABEL_8:
    v15 = v13;
    if (!bcc)
      goto LABEL_9;
LABEL_24:
    v16 = v15;
    if (contentType)
      goto LABEL_13;
    goto LABEL_25;
  }
  if (cc)
    goto LABEL_8;
LABEL_20:
  v15 = (__CFString *)objc_msgSend(v4, "copyAddressListForCc");

  v22 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFMessage setCc:](self, "setCc:", v22);
  if (v15)
  {
    if (bcc)
      goto LABEL_24;
  }
  else
  {

    if (bcc)
      goto LABEL_24;
  }
LABEL_9:
  v16 = (__CFString *)objc_msgSend(v4, "copyAddressListForBcc");

  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFMessage setBcc:](self, "setBcc:", v17);
  if (v16)
  {
    if (contentType)
    {
LABEL_13:
      v18 = v16;
      goto LABEL_38;
    }
  }
  else
  {

    if (contentType)
      goto LABEL_13;
  }
LABEL_25:
  v23 = (void *)objc_msgSend(v4, "copyFirstStringValueForKey:", *MEMORY[0x1E0D1E558]);

  if (v23)
  {
    v30 = 0;
    +[MFMimePart parseContentTypeHeader:type:subtype:](MFMimePart, "parseContentTypeHeader:type:subtype:", v23, &v30, 0);
    v18 = (__CFString *)v30;
  }
  else
  {
    v18 = 0;
  }
  if (v18)
    v24 = v18;
  else
    v24 = &stru_1E5AA1FC8;
  -[MFMessage setContentType:](self, "setContentType:", v24);

LABEL_38:
  if (!dateReceivedInterval)
    -[MFMessage _setDateReceivedFromHeaders:](self, "_setDateReceivedFromHeaders:", v4);
  if (!dateSentInterval)
    -[MFMessage _setDateSentFromHeaders:](self, "_setDateSentFromHeaders:", v4);
  if (!listIDHash)
  {
    objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D1E590]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithAngleBracketID:", v25);
    -[MFMessage setListIDHash:](self, "setListIDHash:", v26);

  }
}

- (ECSubject)subject
{
  ECSubject *v3;
  void *v4;

  _MFLockGlobalLock();
  v3 = self->_subject;
  _MFUnlockGlobalLock();
  if (!v3)
  {
    -[MFMessage headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v4);

    _MFLockGlobalLock();
    v3 = self->_subject;
    _MFUnlockGlobalLock();
  }
  return v3;
}

- (ECSubject)subjectIfAvailable
{
  ECSubject *v3;

  _MFLockGlobalLock();
  v3 = self->_subject;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setSubject:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_subject, a3);
  _MFUnlockGlobalLock();

}

- (NSDate)dateReceived
{
  unsigned int dateReceivedInterval;
  void *v4;
  void *v5;

  _MFLockGlobalLock();
  dateReceivedInterval = self->_dateReceivedInterval;
  if (!dateReceivedInterval)
  {
    _MFUnlockGlobalLock();
    -[MFMessage headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v4);

    _MFLockGlobalLock();
    dateReceivedInterval = self->_dateReceivedInterval;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)dateReceivedInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MFUnlockGlobalLock();
  return (NSDate *)v5;
}

- (NSDate)dateSent
{
  unsigned int dateSentInterval;
  void *v4;

  _MFLockGlobalLock();
  dateSentInterval = self->_dateSentInterval;
  _MFUnlockGlobalLock();
  if (!dateSentInterval)
  {
    -[MFMessage headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v4);

    _MFLockGlobalLock();
    dateSentInterval = self->_dateSentInterval;
    _MFUnlockGlobalLock();
  }
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)dateSentInterval);
}

- (void)setDateReceivedAsTimeIntervalSince1970:(double)a3
{
  _MFLockGlobalLock();
  self->_dateReceivedInterval = a3;
  _MFUnlockGlobalLock();
}

- (double)dateReceivedAsTimeIntervalSince1970
{
  unsigned int dateReceivedInterval;
  void *v4;

  dateReceivedInterval = self->_dateReceivedInterval;
  if (!dateReceivedInterval)
  {
    -[MFMessage headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v4);

    return (double)self->_dateReceivedInterval;
  }
  return (double)dateReceivedInterval;
}

- (BOOL)needsDateReceived
{
  return self->_dateReceivedInterval == 0;
}

- (double)dateSentAsTimeIntervalSince1970
{
  unsigned int dateSentInterval;
  void *v4;

  _MFLockGlobalLock();
  dateSentInterval = self->_dateSentInterval;
  _MFUnlockGlobalLock();
  if (!dateSentInterval)
  {
    -[MFMessage headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v4);

    _MFLockGlobalLock();
    dateSentInterval = self->_dateSentInterval;
    _MFUnlockGlobalLock();
  }
  return (double)dateSentInterval;
}

- (void)setDateSentAsTimeIntervalSince1970:(double)a3
{
  _MFLockGlobalLock();
  self->_dateSentInterval = a3;
  _MFUnlockGlobalLock();
}

- (id)contentType
{
  MFMessage *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  _MFLockGlobalLock();
  v3 = v2->_contentType;
  _MFUnlockGlobalLock();
  if (!v3)
  {
    -[MFMessage headers](v2, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](v2, "loadCachedHeaderValuesFromHeaders:", v4);

    _MFLockGlobalLock();
    v3 = v2->_contentType;
    _MFUnlockGlobalLock();
  }

  return v3;
}

- (void)setContentType:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *contentType;
  id v9;

  v9 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v9 && v4)
  {
    objc_msgSend(v4, "uniquedString:", v9);
    v6 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v6;
  }

  _MFLockGlobalLock();
  v7 = (NSString *)objc_msgSend(v9, "copy");
  contentType = self->_contentType;
  self->_contentType = v7;

  _MFUnlockGlobalLock();
}

- (id)senders
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __20__MFMessage_senders__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 1, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __20__MFMessage_senders__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 72);
}

- (id)sendersIfCached
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__MFMessage_sendersIfCached__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __28__MFMessage_sendersIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 72);
}

- (id)firstSender
{
  void *v2;
  void *v3;

  -[MFMessage senders](self, "senders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setSender:(id)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *sender;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  _MFLockGlobalLock();
  if ((objc_msgSend(v14, "isEqual:", self->_sender) & 1) == 0)
  {
    _MFUnlockGlobalLock();
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v14;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v8);
          -[MFMessage messageStore](self, "messageStore");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && v9)
          {
            objc_msgSend(v10, "uniquedString:", v9);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v12;
          }

          -[NSArray addObject:](v4, "addObject:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    _MFLockGlobalLock();
    sender = self->_sender;
    self->_sender = v4;

  }
  _MFUnlockGlobalLock();

}

- (id)senderAddressComment
{
  NSString **p_senderAddressComment;
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  _MFLockGlobalLock();
  p_senderAddressComment = &self->_senderAddressComment;
  v4 = self->_senderAddressComment;
  _MFUnlockGlobalLock();
  if (!v4)
  {
    -[MFMessage firstSender](self, "firstSender");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emailAddressValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v5, "stringValue");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    if (objc_msgSend(v10, "length"))
    {
      -[MFMessage messageStore](self, "messageStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && v10)
      {
        objc_msgSend(v11, "uniquedString:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = v10;
      }

      v14 = v13;
      _MFLockGlobalLock();
      if (!*p_senderAddressComment)
        objc_storeStrong((id *)p_senderAddressComment, v13);
      v10 = v14;
      _MFUnlockGlobalLock();
    }
    else
    {
      v14 = 0;
    }

    v4 = (NSString *)v14;
  }
  return v4;
}

- (NSArray)to
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __15__MFMessage_to__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 1, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __15__MFMessage_to__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (NSArray)toIfCached
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__MFMessage_toIfCached__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 0, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __23__MFMessage_toIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (void)setTo:(id)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *to;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  _MFLockGlobalLock();
  if ((objc_msgSend(v14, "isEqual:", self->_to) & 1) == 0)
  {
    _MFUnlockGlobalLock();
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v14;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v8);
          -[MFMessage messageStore](self, "messageStore");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && v9)
          {
            objc_msgSend(v10, "uniquedString:", v9);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v12;
          }

          -[NSArray addObject:](v4, "addObject:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    _MFLockGlobalLock();
    to = self->_to;
    self->_to = v4;

  }
  _MFUnlockGlobalLock();

}

- (NSArray)cc
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __15__MFMessage_cc__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 1, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __15__MFMessage_cc__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

- (NSArray)ccIfCached
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__MFMessage_ccIfCached__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 0, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __23__MFMessage_ccIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

- (void)setCc:(id)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *cc;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  _MFLockGlobalLock();
  if ((objc_msgSend(v14, "isEqual:", self->_cc) & 1) == 0)
  {
    _MFUnlockGlobalLock();
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v14;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v8);
          -[MFMessage messageStore](self, "messageStore");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && v9)
          {
            objc_msgSend(v10, "uniquedString:", v9);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v12;
          }

          -[NSArray addObject:](v4, "addObject:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    _MFLockGlobalLock();
    cc = self->_cc;
    self->_cc = v4;

  }
  _MFUnlockGlobalLock();

}

- (NSArray)bcc
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __16__MFMessage_bcc__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 1, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __16__MFMessage_bcc__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

- (NSArray)bccIfCached
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__MFMessage_bccIfCached__block_invoke;
  v3[3] = &unk_1E5AA12C0;
  v3[4] = self;
  _cachedIvarLoadFromHeaders(self, 0, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __24__MFMessage_bccIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

- (void)setBcc:(id)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *bcc;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  _MFLockGlobalLock();
  if ((objc_msgSend(v14, "isEqual:", self->_bcc) & 1) == 0)
  {
    _MFUnlockGlobalLock();
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v14;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v8);
          -[MFMessage messageStore](self, "messageStore");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && v9)
          {
            objc_msgSend(v10, "uniquedString:", v9);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v12;
          }

          -[NSArray addObject:](v4, "addObject:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    _MFLockGlobalLock();
    bcc = self->_bcc;
    self->_bcc = v4;

  }
  _MFUnlockGlobalLock();

}

- (int64_t)conversationID
{
  int64_t conversationID;

  _MFLockGlobalLock();
  conversationID = self->_conversationID;
  _MFUnlockGlobalLock();
  return conversationID;
}

- (void)setMessageIDHash:(int64_t)a3
{
  _MFLockGlobalLock();
  self->_messageIDHeaderHash = a3;
  _MFUnlockGlobalLock();
}

- (void)setConversationID:(int64_t)a3
{
  _MFLockGlobalLock();
  if (self->_conversationID != a3)
    self->_conversationID = a3;
  _MFUnlockGlobalLock();
}

- (ECAngleBracketIDHash)listIDHash
{
  ECAngleBracketIDHash *listIDHash;
  void *v4;
  ECAngleBracketIDHash *v5;
  ECAngleBracketIDHash *v6;
  ECAngleBracketIDHash *v7;

  _MFLockGlobalLock();
  listIDHash = self->_listIDHash;
  _MFUnlockGlobalLock();
  if (!listIDHash)
  {
    -[MFMessage headersIfAvailable](self, "headersIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v4);

    _MFLockGlobalLock();
    listIDHash = self->_listIDHash;
    if (listIDHash)
      v5 = listIDHash;
    _MFUnlockGlobalLock();
  }
  if (-[ECAngleBracketIDHash int64Value](listIDHash, "int64Value"))
    v6 = listIDHash;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)setListIDHash:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_listIDHash, a3);
  _MFUnlockGlobalLock();

}

- (NSString)externalID
{
  NSString *v3;

  _MFLockGlobalLock();
  v3 = self->_externalID;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setExternalID:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_externalID, a3);
  _MFUnlockGlobalLock();

}

- (NSUUID)documentID
{
  NSUUID *v3;

  _MFLockGlobalLock();
  v3 = self->_documentID;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setDocumentID:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_documentID, a3);
  _MFUnlockGlobalLock();

}

- (NSString)summary
{
  NSString *v3;

  _MFLockGlobalLock();
  v3 = self->_summary;
  _MFUnlockGlobalLock();
  return v3;
}

- (id)uniqueArray:(id)a3 withStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "uniquedString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)setMessageInfo:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceivedTimeIntervalSince1970:(double)a8 dateSentTimeIntervalSince1970:(double)a9 messageIDHash:(int64_t)a10 conversationID:(int64_t)a11 summary:(id)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v25 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a12;
  -[MFMessage setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:](self, "setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:", v25, v20, v21, v22, v23, v24, a8, a9);
  -[MFMessage setConversationID:](self, "setConversationID:", a11);
  -[MFMessage setMessageIDHash:](self, "setMessageIDHash:", a10);

}

- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10
{
  uint64_t v10;

  LODWORD(v10) = 15;
  -[MFMessage setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:withOptions:](self, "setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:withOptions:", a3, a4, a5, a6, a7, a10, a8, a9, v10);
}

- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10 withOptions:(unsigned int)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  ECSubject *v29;
  ECSubject *subject;
  NSArray *v31;
  NSArray *to;
  NSArray *v33;
  NSArray *cc;
  NSArray *v35;
  NSArray *bcc;
  NSArray *v37;
  NSArray *sender;
  NSString *v39;
  NSString *summary;
  id v41;

  v41 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = (NSString *)a10;
  -[MFMessage messageStore](self, "messageStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (v19)
    {
      -[MFMessage uniqueArray:withStore:](self, "uniqueArray:withStore:", v19, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v19 = (id)v25;
    }
    if (v20)
    {
      -[MFMessage uniqueArray:withStore:](self, "uniqueArray:withStore:", v20, v24);
      v26 = objc_claimAutoreleasedReturnValue();

      v20 = (id)v26;
    }
    if (v21)
    {
      -[MFMessage uniqueArray:withStore:](self, "uniqueArray:withStore:", v21, v24);
      v27 = objc_claimAutoreleasedReturnValue();

      v21 = (id)v27;
    }
    if (v22)
    {
      -[MFMessage uniqueArray:withStore:](self, "uniqueArray:withStore:", v22, v24);
      v28 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v28;
    }
  }
  _MFLockGlobalLock();
  self->_dateSentInterval = a9;
  self->_dateReceivedInterval = a8;
  if ((a11 & 1) != 0)
  {
    v29 = (ECSubject *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E7A0]), "initWithString:", v41);
    subject = self->_subject;
    self->_subject = v29;

  }
  if ((a11 & 2) != 0)
  {
    if ((-[NSArray isEqual:](self->_to, "isEqual:", v19) & 1) == 0)
    {
      v31 = (NSArray *)objc_msgSend(v19, "copy");
      to = self->_to;
      self->_to = v31;

    }
    if ((-[NSArray isEqual:](self->_cc, "isEqual:", v20) & 1) == 0)
    {
      v33 = (NSArray *)objc_msgSend(v20, "copy");
      cc = self->_cc;
      self->_cc = v33;

    }
    if ((-[NSArray isEqual:](self->_bcc, "isEqual:", v21) & 1) == 0)
    {
      v35 = (NSArray *)objc_msgSend(v21, "copy");
      bcc = self->_bcc;
      self->_bcc = v35;

    }
  }
  if ((a11 & 4) != 0 && (-[NSArray isEqual:](self->_sender, "isEqual:", v22) & 1) == 0)
  {
    v37 = (NSArray *)objc_msgSend(v22, "copy");
    sender = self->_sender;
    self->_sender = v37;

  }
  if ((a11 & 8) != 0 && self->_summary != v23)
  {
    v39 = (NSString *)-[NSString copy](v23, "copy");
    summary = self->_summary;
    self->_summary = v39;

  }
  _MFUnlockGlobalLock();

}

- (BOOL)updateSubjectFromEncryptedContent
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[MFMessage headersIfAvailable](self, "headersIfAvailable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstHeaderForKey:", *MEMORY[0x1E0D1E558]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v15 = 0;
      goto LABEL_16;
    }
    v20 = 0;
    v21 = 0;
    v5 = +[MFMimePart parseContentTypeHeader:type:subtype:](MFMimePart, "parseContentTypeHeader:type:subtype:", v4, &v21, &v20);
    v6 = v21;
    v7 = v20;
    if (!v5
      || !objc_msgSend(v6, "isEqualToString:", CFSTR("application"))
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("pkcs7-mime")) & 1) == 0)
    {
      v15 = 0;
LABEL_14:

LABEL_16:
      return v15;
    }
    -[MFMessage messageBodyIfAvailableUpdatingFlags:](self, "messageBodyIfAvailableUpdatingFlags:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
LABEL_26:

      goto LABEL_14;
    }
    objc_msgSend(v8, "topLevelPart");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      v15 = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v9, "decodeIfNecessary");
    v19 = 0;
    v11 = (id)objc_msgSend(v10, "decryptedMessageBodyIsEncrypted:isSigned:", &v19, 0);
    objc_msgSend(v10, "wrappedSubject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[MFMessage subject](self, "subject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v12);

      if ((v14 & 1) == 0)
      {
        if (v19)
        {
          -[MFMessage setSubject:](self, "setSubject:", v12);
          v15 = 1;
LABEL_24:

          goto LABEL_25;
        }
        MFLogGeneral();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[MFMessage messageIDHeader](self, "messageIDHeader");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessage updateSubjectFromEncryptedContent].cold.1(v18, buf, v17);
        }

      }
    }
    v15 = 0;
    goto LABEL_24;
  }
  return 0;
}

- (void)setMessagePropertiesFromMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "senders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "to");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bcc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subjectString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dateReceivedAsTimeIntervalSince1970");
  v11 = v10;
  objc_msgSend(v17, "dateSentAsTimeIntervalSince1970");
  v13 = v12;
  v14 = objc_msgSend(v17, "_messageIDHeaderHashIvar");
  v15 = objc_msgSend(v17, "conversationID");
  objc_msgSend(v17, "summary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessage setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:](self, "setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:", v9, v5, v6, v7, v4, v16, v11, v13);
  -[MFMessage setConversationID:](self, "setConversationID:", v15);
  -[MFMessage setMessageIDHash:](self, "setMessageIDHash:", v14);

}

- (unsigned)uid
{
  return 0;
}

- (id)path
{
  return 0;
}

- (id)persistentID
{
  return 0;
}

- (id)bodyData
{
  void *v3;
  void *v4;

  -[MFMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", self, 0, 0, _ECIsNetworkActivityAllowed());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bodyDataIsComplete:(BOOL *)a3
{
  return -[MFMessage bodyDataIsComplete:isPartial:](self, "bodyDataIsComplete:isPartial:", a3, 0);
}

- (id)bodyDataIsComplete:(BOOL *)a3 isPartial:(BOOL *)a4
{
  return -[MFMessage bodyDataIsComplete:isPartial:downloadIfNecessary:](self, "bodyDataIsComplete:isPartial:downloadIfNecessary:", a3, a4, 1);
}

- (id)bodyDataIsComplete:(BOOL *)a3 isPartial:(BOOL *)a4 downloadIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  -[MFMessage messageStore](self, "messageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v10 = _ECIsNetworkActivityAllowed();
  else
    v10 = 0;
  objc_msgSend(v9, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", self, a3, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSData)headerData
{
  return (NSData *)-[MFMessage headerDataDownloadIfNecessary:](self, "headerDataDownloadIfNecessary:", 1);
}

- (NSData)headerDataIfAvailable
{
  return (NSData *)-[MFMessage headerDataDownloadIfNecessary:](self, "headerDataDownloadIfNecessary:", 0);
}

- (id)headerDataDownloadIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = _ECIsNetworkActivityAllowed();
  else
    v6 = 0;
  objc_msgSend(v5, "headerDataForMessage:downloadIfNecessary:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForMimePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("__MIME_PART_DECODE_DOWNLOAD"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[MFMessage messageStore](self, "messageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = _ECIsNetworkActivityAllowed();
  else
    v10 = 0;
  objc_msgSend(v9, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v4, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v9, location, length, a5, _ECIsNetworkActivityAllowed(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  _BOOL4 v8;
  NSUInteger length;
  NSUInteger location;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a6;
  length = a4.length;
  location = a4.location;
  v13 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v15 = _ECIsNetworkActivityAllowed();
  else
    v15 = 0;
  objc_msgSend(v14, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v13, location, length, a5, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)fetchDataForMimePart:(id)a3 inRange:(_NSRange)a4 withConsumer:(id)a5 isComplete:(BOOL *)a6 downloadIfNecessary:(BOOL)a7
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  MFProgressFilterDataConsumer *v15;
  void *v16;
  MFProgressFilterDataConsumer *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  char v22;
  _QWORD v23[2];

  v7 = a7;
  length = a4.length;
  location = a4.location;
  v23[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v22 = 0;
  v15 = [MFProgressFilterDataConsumer alloc];
  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MFBaseFilterDataConsumer initWithConsumers:](v15, "initWithConsumers:", v16);

  -[MFMessage messageStore](self, "messageStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v19 = _ECIsNetworkActivityAllowed();
  else
    v19 = 0;
  objc_msgSend(v18, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", v13, location, length, a6, v17, v19, &v22);

  v20 = v22 != 0;
  return v20;
}

- (id)dataPathForMimePart:(id)a3
{
  return 0;
}

- (void)calculateAttachmentInfoFromBody:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __int16 v7;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)self + 160) & 1) == 0)
  {
    if (v4
      || (-[MFMessage messageBodyUpdatingFlags:](self, "messageBodyUpdatingFlags:", 0),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = 0;
      v6 = objc_msgSend(v5, "numberOfAttachmentsSigned:encrypted:", (char *)&v7 + 1, &v7);
      -[MFMessage setNumberOfAttachments:isSigned:isEncrypted:](self, "setNumberOfAttachments:isSigned:isEncrypted:", v6, HIBYTE(v7), v7);
      *((_BYTE *)self + 160) |= 1u;
    }
  }

}

- (void)setNumberOfAttachments:(unint64_t)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;

  v5 = a5;
  v6 = a4;
  -[MFMessage messageStore](self, "messageStore");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfAttachments:isSigned:isEncrypted:forMessage:", a3, v6, v5, self);

}

- (void)setNumberOfAttachments:(unint64_t)a3
{
  self->_numberOfAttachments = a3;
}

- (void)setGenerationNumber:(unint64_t)a3
{
  atomic_store(a3, &self->_generationNumber);
}

- (unint64_t)generationNumber
{
  return atomic_load(&self->_generationNumber);
}

- (int64_t)generationCompare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = -[MFMessage generationNumber](self, "generationNumber");
  v6 = objc_msgSend(v4, "generationNumber");
  if (v6 > v5)
    v7 = -1;
  else
    v7 = v6 < v5;

  return v7;
}

- (id)defaultAlternativeInPart:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAlternativeForPart:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestAlternativeInPart:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestAlternativeForPart:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canBeTriaged
{
  MFMessage *v2;
  void *v3;

  v2 = self;
  -[MFMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "messageCanBeTriaged:", v2);

  return (char)v2;
}

- (BOOL)isLibraryMessage
{
  return 0;
}

- (id)additionalHeadersForReply
{
  return 0;
}

- (id)additionalHeadersForForward
{
  return 0;
}

- (MFMimePart)parentPart
{
  return (MFMimePart *)objc_loadWeakRetained((id *)&self->_parentPart);
}

- (MFMimePart)strongParentPartReference
{
  return self->_strongParentPartReference;
}

- (void)setStrongParentPartReference:(id)a3
{
  objc_storeStrong((id *)&self->_strongParentPartReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_strongParentPartReference, 0);
  objc_storeStrong((id *)&self->_cachedMessageIDHeader, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_destroyWeak((id *)&self->_parentPart);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_listIDHash, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_senderAddressComment, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)updateSubjectFromEncryptedContent
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB13000, log, OS_LOG_TYPE_ERROR, "Signed message has protected header that does not match outer header: %{public}@", buf, 0xCu);

}

@end
