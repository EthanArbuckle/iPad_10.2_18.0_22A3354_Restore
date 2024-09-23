@implementation FTiMessageRequestMMCSUploadToken

- (FTiMessageRequestMMCSUploadToken)init
{
  FTiMessageRequestMMCSUploadToken *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTiMessageRequestMMCSUploadToken;
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

- (void)dealloc
{
  objc_super v3;

  -[FTiMessageRequestMMCSUploadToken setResponseAuthToken:](self, "setResponseAuthToken:", 0);
  -[FTiMessageRequestMMCSUploadToken setResponseRequestURL:](self, "setResponseRequestURL:", 0);
  -[FTiMessageRequestMMCSUploadToken setResponseRequestorID:](self, "setResponseRequestorID:", 0);
  -[FTiMessageRequestMMCSUploadToken setLength:](self, "setLength:", 0);
  -[IDSBaseMessage setTopic:](self, "setTopic:", 0);
  -[FTiMessageRequestMMCSUploadToken setSignature:](self, "setSignature:", 0);
  -[FTiMessageRequestMMCSUploadToken setContentBody:](self, "setContentBody:", 0);
  -[FTiMessageRequestMMCSUploadToken setContentHeaders:](self, "setContentHeaders:", 0);
  -[FTiMessageRequestMMCSUploadToken setResponseContentHeaders:](self, "setResponseContentHeaders:", 0);
  -[FTiMessageRequestMMCSUploadToken setSenderID:](self, "setSenderID:", 0);
  -[FTiMessageRequestMMCSUploadToken setDestinationID:](self, "setDestinationID:", 0);
  -[FTiMessageRequestMMCSUploadToken setAnonymousSenderID:](self, "setAnonymousSenderID:", 0);
  -[FTiMessageRequestMMCSUploadToken setSessionToken:](self, "setSessionToken:", 0);
  -[FTiMessageRequestMMCSUploadToken setPushToken:](self, "setPushToken:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  -[FTiMessageRequestMMCSUploadToken dealloc](&v3, sel_dealloc);
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  v4 = -[IDSMessage copyWithZone:](&v19, sel_copyWithZone_, a3);
  -[FTiMessageRequestMMCSUploadToken responseAuthToken](self, "responseAuthToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseAuthToken:", v5);

  -[FTiMessageRequestMMCSUploadToken responseRequestURL](self, "responseRequestURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseRequestURL:", v6);

  -[FTiMessageRequestMMCSUploadToken responseRequestorID](self, "responseRequestorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseRequestorID:", v7);

  -[FTiMessageRequestMMCSUploadToken length](self, "length");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLength:", v8);

  -[FTiMessageRequestMMCSUploadToken signature](self, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSignature:", v9);

  -[FTiMessageRequestMMCSUploadToken contentBody](self, "contentBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentBody:", v10);

  -[FTiMessageRequestMMCSUploadToken contentHeaders](self, "contentHeaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentHeaders:", v11);

  objc_msgSend(v4, "setContentVersion:", -[FTiMessageRequestMMCSUploadToken contentVersion](self, "contentVersion"));
  -[FTiMessageRequestMMCSUploadToken responseContentHeaders](self, "responseContentHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseContentHeaders:", v12);

  objc_msgSend(v4, "setResponseContentVersion:", -[FTiMessageRequestMMCSUploadToken responseContentVersion](self, "responseContentVersion"));
  -[FTiMessageRequestMMCSUploadToken senderID](self, "senderID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderID:", v13);

  -[FTiMessageRequestMMCSUploadToken destinationID](self, "destinationID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationID:", v14);

  -[FTiMessageRequestMMCSUploadToken anonymousSenderID](self, "anonymousSenderID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnonymousSenderID:", v15);

  -[FTiMessageRequestMMCSUploadToken sessionToken](self, "sessionToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionToken:", v16);

  -[FTiMessageRequestMMCSUploadToken pushToken](self, "pushToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPushToken:", v17);

  return v4;
}

- (int64_t)command
{
  return 150;
}

- (int64_t)responseCommand
{
  return 150;
}

- (id)requiredKeys
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", CFSTR("mS"));
  objc_msgSend(v2, "addObject:", CFSTR("mL"));
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  -[IDSMessage messageBody](&v32, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFDictionary *)objc_msgSend(v3, "mutableCopy");

  -[FTiMessageRequestMMCSUploadToken signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CFDictionarySetValue(v4, CFSTR("mS"), v5);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      sub_22D994FE0(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[FTiMessageRequestMMCSUploadToken length](self, "length");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    CFDictionarySetValue(v4, CFSTR("mL"), v14);
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      sub_22D9950F8(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FTiMessageRequestMMCSUploadToken contentVersion](self, "contentVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v4, CFSTR("cV"), v23);

  -[FTiMessageRequestMMCSUploadToken contentHeaders](self, "contentHeaders");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue(v4, CFSTR("cH"), v24);

  -[FTiMessageRequestMMCSUploadToken contentBody](self, "contentBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    CFDictionarySetValue(v4, CFSTR("cB"), v25);

  -[FTiMessageRequestMMCSUploadToken pushToken](self, "pushToken");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    CFDictionarySetValue(v4, CFSTR("t"), v26);

  -[FTiMessageRequestMMCSUploadToken anonymousSenderID](self, "anonymousSenderID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v4, CFSTR("sI"), v27);

  -[FTiMessageRequestMMCSUploadToken sessionToken](self, "sessionToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue(v4, CFSTR("sT"), v28);

  -[FTiMessageRequestMMCSUploadToken senderID](self, "senderID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    CFDictionarySetValue(v4, CFSTR("sP"), v29);

  -[FTiMessageRequestMMCSUploadToken destinationID](self, "destinationID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    CFDictionarySetValue(v4, CFSTR("tP"), v30);

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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("mA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[FTiMessageRequestMMCSUploadToken setResponseAuthToken:](self, "setResponseAuthToken:", v5);
  objc_msgSend(v4, "objectForKey:", CFSTR("mR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[FTiMessageRequestMMCSUploadToken setResponseRequestURL:](self, "setResponseRequestURL:", v6);
  objc_msgSend(v4, "objectForKey:", CFSTR("mU"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[FTiMessageRequestMMCSUploadToken setResponseRequestorID:](self, "setResponseRequestorID:", v7);
  objc_msgSend(v4, "objectForKey:", CFSTR("cV"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTiMessageRequestMMCSUploadToken setResponseContentVersion:](self, "setResponseContentVersion:", (int)objc_msgSend(v8, "intValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("cH"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTiMessageRequestMMCSUploadToken setResponseContentHeaders:](self, "setResponseContentHeaders:", v9);

  objc_msgSend(v4, "objectForKey:", CFSTR("cB"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTiMessageRequestMMCSUploadToken setResponseContentBody:](self, "setResponseContentBody:", v10);

  if (_IMWillLog())
  {
    v22[0] = CFSTR("mA");
    -[FTiMessageRequestMMCSUploadToken responseAuthToken](self, "responseAuthToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v21;
    v22[1] = CFSTR("mU");
    -[FTiMessageRequestMMCSUploadToken responseRequestorID](self, "responseRequestorID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v20;
    v22[2] = CFSTR("mR");
    -[FTiMessageRequestMMCSUploadToken responseRequestURL](self, "responseRequestURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v19;
    v22[3] = CFSTR("cV");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FTiMessageRequestMMCSUploadToken responseContentVersion](self, "responseContentVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v11;
    v22[4] = CFSTR("cH");
    -[FTiMessageRequestMMCSUploadToken responseContentHeaders](self, "responseContentHeaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v12;
    v22[5] = CFSTR("cB");
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[FTiMessageRequestMMCSUploadToken responseContentBody](self, "responseContentBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@B"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
}

- (NSData)pushToken
{
  return self->pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)responseAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setResponseAuthToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (NSNumber)length
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLength:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (NSString)responseRequestURL
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setResponseRequestURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (NSString)responseRequestorID
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setResponseRequestorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
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
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setContentHeaders:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 392);
}

- (NSData)contentBody
{
  return (NSData *)objc_getProperty(self, a2, 400, 1);
}

- (void)setContentBody:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (NSString)responseContentHeaders
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setResponseContentHeaders:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (NSData)responseContentBody
{
  return (NSData *)objc_getProperty(self, a2, 416, 1);
}

- (void)setResponseContentBody:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 416);
}

- (int64_t)responseContentVersion
{
  return self->_responseContentVersion;
}

- (void)setResponseContentVersion:(int64_t)a3
{
  self->_responseContentVersion = a3;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)anonymousSenderID
{
  return self->_anonymousSenderID;
}

- (void)setAnonymousSenderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousSenderID, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_responseContentBody, 0);
  objc_storeStrong((id *)&self->_responseContentHeaders, 0);
  objc_storeStrong((id *)&self->_contentBody, 0);
  objc_storeStrong((id *)&self->_contentHeaders, 0);
  objc_storeStrong((id *)&self->_responseRequestorID, 0);
  objc_storeStrong((id *)&self->_responseRequestURL, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_responseAuthToken, 0);
  objc_storeStrong((id *)&self->pushToken, 0);
}

@end
