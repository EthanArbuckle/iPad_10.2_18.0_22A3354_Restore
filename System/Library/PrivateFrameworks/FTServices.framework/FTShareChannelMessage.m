@implementation FTShareChannelMessage

- (FTShareChannelMessage)initWithProtoData:(id)a3 messageType:(int)a4
{
  id v7;
  FTShareChannelMessage *v8;
  FTShareChannelMessage *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FTShareChannelMessage;
  v8 = -[FTIDSMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_protoData, a3);
    v9->_messageType = a4;
  }

  return v9;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FTShareChannelMessage;
  v4 = -[FTIDSMessage copyWithZone:](&v18, sel_copyWithZone_, a3);
  objc_msgSend_messageID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_version(self, v9, v10);
  objc_msgSend_setVersion_(v4, v12, v11);
  objc_msgSend_protoData(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtoData_(v4, v16, (uint64_t)v15);

  return v4;
}

- (int64_t)command
{
  uint64_t v2;
  int v3;
  int64_t v4;

  v3 = objc_msgSend_messageType(self, a2, v2);
  v4 = 224;
  if (v3 == 2)
    v4 = 225;
  if (v3 == 3)
    return 226;
  else
    return v4;
}

- (int64_t)responseCommand
{
  uint64_t v2;
  int v3;
  int64_t v4;

  v3 = objc_msgSend_messageType(self, a2, v2);
  v4 = 224;
  if (v3 == 2)
    v4 = 225;
  if (v3 == 3)
    return 226;
  else
    return v4;
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

- (BOOL)wantsResponse
{
  return 1;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)ultraConstrainedAllowed
{
  return 1;
}

- (id)topic
{
  return CFSTR("com.apple.icloud.presence.channel.management");
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
  v7.super_class = (Class)FTShareChannelMessage;
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
  int v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  objc_super v33;
  uuid_t uu;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)FTShareChannelMessage;
  -[IDSBaseMessage messageBody](&v33, sel_messageBody);
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

  v26 = objc_msgSend_messageType(self, v24, v25);
  objc_msgSend_protoData(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v26 == 3)
  {
    if (v29)
    {
      v31 = CFSTR("scPrReq");
LABEL_20:
      CFDictionarySetValue(v6, v31, v29);
      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      sub_1A4CBB480();
  }
  else
  {
    if (v29)
    {
      v31 = CFSTR("scReq");
      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      sub_1A4CBB500();
  }
LABEL_25:

  return v6;
}

- (void)handleResponseDictionary:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;

  v18 = a3;
  if (objc_msgSend_messageType(self, v4, v5) == 3)
    objc_msgSend__dataForKey_(v18, v6, (uint64_t)CFSTR("scPrRes"));
  else
    objc_msgSend__dataForKey_(v18, v6, (uint64_t)CFSTR("scRes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtoResponse_(self, v8, (uint64_t)v7);

  objc_msgSend__stringForKey_(v18, v9, (uint64_t)CFSTR("U"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(self, v11, (uint64_t)v10);

  objc_msgSend__numberForKey_(v18, v12, (uint64_t)CFSTR("s"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_intValue(v13, v14, v15);
  objc_msgSend_setResponseValue_(self, v17, v16);

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

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_protoData, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
