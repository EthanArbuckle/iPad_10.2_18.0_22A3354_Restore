@implementation FTProtobufMessage

- (FTProtobufMessage)initWithPushTopic:(id)a3 protoData:(id)a4
{
  id v7;
  id v8;
  FTProtobufMessage *v9;
  FTProtobufMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FTProtobufMessage;
  v9 = -[FTIDSMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pushTopic, a3);
    objc_storeStrong((id *)&v10->_protoData, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FTProtobufMessage;
  v4 = -[FTIDSMessage copyWithZone:](&v22, sel_copyWithZone_, a3);
  objc_msgSend_messageID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_version(self, v9, v10);
  objc_msgSend_setVersion_(v4, v12, v11);
  objc_msgSend_protoData(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtoData_(v4, v16, (uint64_t)v15);

  objc_msgSend_pushTopic(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPushTopic_(v4, v20, (uint64_t)v19);

  return v4;
}

- (int64_t)command
{
  return 226;
}

- (int64_t)responseCommand
{
  return 226;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 0;
}

- (BOOL)isWebTunnelMessage
{
  return 1;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 0;
}

- (BOOL)wantsAPSRetries
{
  return 1;
}

- (BOOL)highPriority
{
  return 1;
}

- (BOOL)isIDSMessage
{
  return 0;
}

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return 1;
}

- (id)topic
{
  return self->_pushTopic;
}

- (id)userAgentHeaderString
{
  return CFSTR("ua");
}

- (BOOL)wantsUserAgentInHeaders
{
  return 0;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FTProtobufMessage;
  -[FTIDSMessage additionalMessageHeaders](&v7, sel_additionalMessageHeaders);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend_mutableCopy(v2, v3, v4);

  return v5;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  __CFDictionary *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  objc_super v28;
  uuid_t uu;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)FTProtobufMessage;
  -[IDSBaseMessage messageBody](&v28, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_messageID(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend_messageID(self, v9, v10);
  else
    objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v9, v10);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);

  memset(uu, 170, sizeof(uu));
  uuid_parse(v15, uu);
  jw_uuid_to_data();
  v16 = 0;
  v19 = objc_msgSend_version(self, v17, v18);
  if (v19 <= 1)
    v20 = 1;
  else
    v20 = v19;
  v21 = v16;
  if (v21)
  {
    CFDictionarySetValue(v6, CFSTR("U"), v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBA66C();
  }

  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    CFDictionarySetValue(v6, CFSTR("v"), v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBA5EC();
  }

  objc_msgSend_protoData(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    CFDictionarySetValue(v6, CFSTR("req"), v26);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBA56C();
  }

  return v6;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v4 = a3;
  objc_msgSend__dataForKey_(v4, v5, (uint64_t)CFSTR("res"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtoResponse_(self, v7, (uint64_t)v6);

  objc_msgSend__stringForKey_(v4, v8, (uint64_t)CFSTR("U"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(self, v10, (uint64_t)v9);

  objc_msgSend__numberForKey_(v4, v11, (uint64_t)CFSTR("s"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend_intValue(v16, v12, v13);
  objc_msgSend_setResponseValue_(self, v15, v14);

}

- (void)handleResponseHeaders:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Web Tunnel Message Completed With Respone Headers %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();

}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_pushTopic, a3);
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (NSData)protoData
{
  return self->_protoData;
}

- (void)setProtoData:(id)a3
{
  objc_storeStrong((id *)&self->_protoData, a3);
}

- (NSData)protoResponse
{
  return self->_protoResponse;
}

- (void)setProtoResponse:(id)a3
{
  objc_storeStrong((id *)&self->_protoResponse, a3);
}

- (int)responseValue
{
  return self->_responseValue;
}

- (void)setResponseValue:(int)a3
{
  self->_responseValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_protoData, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end
