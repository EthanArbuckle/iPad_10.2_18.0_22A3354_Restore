@implementation FTiMessageRequestMMCSDownloadToken

- (FTiMessageRequestMMCSDownloadToken)init
{
  FTiMessageRequestMMCSDownloadToken *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  v2 = -[IDSMessage init](&v6, sel_init);
  if (v2)
  {
    IMGetiMessageSettings();
    v3 = 0;
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBaseMessage setTopic:](v2, "setTopic:", v4);

    -[IDSBaseMessage setWantsResponse:](v2, "setWantsResponse:", 1);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  v4 = -[IDSMessage copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[FTiMessageRequestMMCSDownloadToken owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOwner:", v5);

  -[IDSBaseMessage topic](self, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopic:", v6);

  -[FTiMessageRequestMMCSDownloadToken responseAuthToken](self, "responseAuthToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseAuthToken:", v7);

  -[FTiMessageRequestMMCSDownloadToken responseRequestorID](self, "responseRequestorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseRequestorID:", v8);

  -[FTiMessageRequestMMCSDownloadToken signature](self, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSignature:", v9);

  objc_msgSend(v4, "setContentVersion:", -[FTiMessageRequestMMCSDownloadToken contentVersion](self, "contentVersion"));
  -[FTiMessageRequestMMCSDownloadToken contentHeaders](self, "contentHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentHeaders:", v10);

  -[FTiMessageRequestMMCSDownloadToken authURLString](self, "authURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthURLString:", v11);

  -[FTiMessageRequestMMCSDownloadToken responseContentBody](self, "responseContentBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseContentBody:", v12);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[FTiMessageRequestMMCSDownloadToken setOwner:](self, "setOwner:", 0);
  -[FTiMessageRequestMMCSDownloadToken setResponseAuthToken:](self, "setResponseAuthToken:", 0);
  -[FTiMessageRequestMMCSDownloadToken setResponseRequestorID:](self, "setResponseRequestorID:", 0);
  -[FTiMessageRequestMMCSDownloadToken setSignature:](self, "setSignature:", 0);
  -[FTiMessageRequestMMCSDownloadToken setContentHeaders:](self, "setContentHeaders:", 0);
  -[FTiMessageRequestMMCSDownloadToken setAuthURLString:](self, "setAuthURLString:", 0);
  -[FTiMessageRequestMMCSDownloadToken setResponseContentBody:](self, "setResponseContentBody:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  -[FTiMessageRequestMMCSDownloadToken dealloc](&v3, sel_dealloc);
}

- (int64_t)command
{
  return 151;
}

- (int64_t)responseCommand
{
  return 151;
}

- (id)requiredKeys
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", CFSTR("mO"));
  objc_msgSend(v2, "addObject:", CFSTR("mS"));
  return v2;
}

- (id)messageBody
{
  void *v3;
  __CFDictionary *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  -[IDSMessage messageBody](&v27, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFDictionary *)objc_msgSend(v3, "mutableCopy");

  -[FTiMessageRequestMMCSDownloadToken owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CFDictionarySetValue(v4, CFSTR("mO"), v5);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      sub_22D99506C(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[FTiMessageRequestMMCSDownloadToken signature](self, "signature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    CFDictionarySetValue(v4, CFSTR("mS"), v14);
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      sub_22D994FE0(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FTiMessageRequestMMCSDownloadToken contentVersion](self, "contentVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v4, CFSTR("cV"), v23);

  -[FTiMessageRequestMMCSDownloadToken contentHeaders](self, "contentHeaders");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue(v4, CFSTR("cH"), v24);

  -[FTiMessageRequestMMCSDownloadToken authURLString](self, "authURLString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    CFDictionarySetValue(v4, CFSTR("mR"), v25);

  return v4;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("mA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[FTiMessageRequestMMCSDownloadToken setResponseAuthToken:](self, "setResponseAuthToken:", v5);
  objc_msgSend(v4, "objectForKey:", CFSTR("mU"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[FTiMessageRequestMMCSDownloadToken setResponseRequestorID:](self, "setResponseRequestorID:", v6);
  objc_msgSend(v4, "objectForKey:", CFSTR("cV"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTiMessageRequestMMCSDownloadToken setResponseContentVersion:](self, "setResponseContentVersion:", (int)objc_msgSend(v7, "intValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("cB"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTiMessageRequestMMCSDownloadToken setResponseContentBody:](self, "setResponseContentBody:", v8);

  if (_IMWillLog())
  {
    v18[0] = CFSTR("mA");
    -[FTiMessageRequestMMCSDownloadToken responseAuthToken](self, "responseAuthToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v18[1] = CFSTR("mU");
    -[FTiMessageRequestMMCSDownloadToken responseRequestorID](self, "responseRequestorID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v18[2] = CFSTR("cV");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FTiMessageRequestMMCSDownloadToken responseContentVersion](self, "responseContentVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    v18[3] = CFSTR("cB");
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[FTiMessageRequestMMCSDownloadToken responseContentBody](self, "responseContentBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@B"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setOwner:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSString)responseAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setResponseAuthToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (NSString)responseRequestorID
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setResponseRequestorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(int64_t)a3
{
  self->_contentVersion = a3;
}

- (NSString)contentHeaders
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setContentHeaders:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (NSString)authURLString
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAuthURLString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 384);
}

- (NSData)responseContentBody
{
  return (NSData *)objc_getProperty(self, a2, 392, 1);
}

- (void)setResponseContentBody:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 392);
}

- (int64_t)responseContentVersion
{
  return self->_responseContentVersion;
}

- (void)setResponseContentVersion:(int64_t)a3
{
  self->_responseContentVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseContentBody, 0);
  objc_storeStrong((id *)&self->_authURLString, 0);
  objc_storeStrong((id *)&self->_contentHeaders, 0);
  objc_storeStrong((id *)&self->_responseRequestorID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_responseAuthToken, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
