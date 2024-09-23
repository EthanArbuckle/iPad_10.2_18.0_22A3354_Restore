@implementation MFIMAPMessageWithCache

- (id)messageData
{
  NSData *v3;
  uint64_t v4;
  objc_super v6;

  if (-[MFIMAPMessage isPartial](self, "isPartial"))
    v3 = 0;
  else
    v3 = self->_messageData;
  if (-[MFIMAPMessage isPartial](self, "isPartial"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MFIMAPMessageWithCache;
    -[MFIMAPMessageWithCache messageData](&v6, sel_messageData);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSData *)v4;
  }
  return v3;
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4
{
  _BOOL8 v4;
  NSData *v7;
  NSData *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v7 = (NSData *)a3;
  v8 = v7;
  if (self->_messageData != v7)
  {
    if (v7)
    {
      v10 = -[NSData mf_rangeOfRFC822HeaderData](v7, "mf_rangeOfRFC822HeaderData");
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSData mf_subdataWithRange:](v8, "mf_subdataWithRange:", v10, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460C8]), "initWithHeaderData:encoding:", v11, -[MFIMAPMessageWithCache preferredEncoding](self, "preferredEncoding"));
        if (v12)
          -[MFIMAPMessageWithCache setHeaders:](self, "setHeaders:", v12);

      }
    }
    objc_storeStrong((id *)&self->_messageData, a3);
    v13.receiver = self;
    v13.super_class = (Class)MFIMAPMessageWithCache;
    -[MFIMAPMessage setIsPartial:](&v13, sel_setIsPartial_, v4);
  }

}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  NSData *messageData;
  id v10;
  BOOL result;
  objc_super v12;

  messageData = self->_messageData;
  if (messageData)
  {
    if (a4)
      *a4 = -[NSData length](messageData, "length", a3, a4, a5, a6);
    if (a5)
      *a5 = 1;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", self->_messageData);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v10;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MFIMAPMessageWithCache;
    return -[MFIMAPMessageWithCache messageDataHolder:messageSize:isComplete:downloadIfNecessary:](&v12, sel_messageDataHolder_messageSize_isComplete_downloadIfNecessary_, a3, a4, a5, a6);
  }
  return result;
}

- (BOOL)isMessageContentsLocallyAvailable
{
  if (self->_messageData)
    return !-[MFIMAPMessage isPartial](self, "isPartial");
  else
    return 0;
}

- (ECMessageHeaders)headers
{
  return (ECMessageHeaders *)self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (id)headerData
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[MFIMAPMessageWithCache messageData](self, "messageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (!v3
    || (v4 = objc_msgSend(v3, "mf_rangeOfRFC822HeaderData"), v4 == 0x7FFFFFFFFFFFFFFFLL)
    || (objc_msgSend(v5, "mf_subdataWithRange:", v4, v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)MFIMAPMessageWithCache;
    -[MFIMAPMessageWithCache headerData](&v9, sel_headerData, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (EDMessageCategorizationResult)categorizationResult
{
  return self->_categorizationResult;
}

- (void)setCategorizationResult:(id)a3
{
  objc_storeStrong((id *)&self->_categorizationResult, a3);
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorizationResult, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end
