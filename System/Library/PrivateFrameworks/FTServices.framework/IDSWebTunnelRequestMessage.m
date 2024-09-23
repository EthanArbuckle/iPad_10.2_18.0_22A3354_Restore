@implementation IDSWebTunnelRequestMessage

- (IDSWebTunnelRequestMessage)initWithMessage:(id)a3
{
  IDSWebTunnelRequestMessage *v3;
  const char *v4;
  IDSWebTunnelRequestMessage *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IDSWebTunnelRequestMessage;
  v3 = -[FTIDSMessage init](&v15, sel_init, a3);
  v5 = v3;
  if (v3)
  {
    objc_msgSend_setWantsResponse_(v3, v4, 1);
    objc_msgSend_setWantsIntegerUniqueIDs_(v5, v6, 1);
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMessageRequestUUID_(v5, v13, (uint64_t)v12);

  }
  return v5;
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
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)IDSWebTunnelRequestMessage;
  v4 = -[FTIDSMessage copyWithZone:](&v54, sel_copyWithZone_, a3);
  objc_msgSend_messageRequestUUID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageRequestUUID_(v4, v8, (uint64_t)v7);

  objc_msgSend_messageURL(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageURL_(v4, v12, (uint64_t)v11);

  objc_msgSend_messageRequestBodyData(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageRequestBodyData_(v4, v16, (uint64_t)v15);

  objc_msgSend_messageRequestBodyDictionary(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageRequestBodyDictionary_(v4, v20, (uint64_t)v19);

  objc_msgSend_messageHeaders(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageHeaders_(v4, v24, (uint64_t)v23);

  objc_msgSend_responseBodyDictionary(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseBodyDictionary_(v4, v28, (uint64_t)v27);

  objc_msgSend_responseBodyData(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseBodyData_(v4, v32, (uint64_t)v31);

  objc_msgSend_responseHeaders(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseHeaders_(v4, v36, (uint64_t)v35);

  objc_msgSend_responseCode(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseCode_(v4, v40, (uint64_t)v39);

  objc_msgSend_responseStatus(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseStatus_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_disableIDSTranslation(self, v45, v46);
  objc_msgSend_setDisableIDSTranslation_(v4, v48, v47);
  objc_msgSend_userAgentOverride(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserAgentOverride_(v4, v52, (uint64_t)v51);

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

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)isIDSMessage
{
  return !self->_disableIDSTranslation;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *Mutable;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IDSWebTunnelRequestMessage;
  -[FTIDSMessage additionalMessageHeaders](&v20, sel_additionalMessageHeaders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend_messageHeaders(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(Mutable, v10, (uint64_t)v9);

  objc_msgSend_removeObjectForKey_(Mutable, v11, (uint64_t)CFSTR("x-apple-apns-dual-mode-delivery-type"));
  v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v14 = (void *)objc_msgSend_initWithInt_(v12, v13, 2);
  objc_msgSend_stringValue(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(Mutable, v18, (uint64_t)v17, CFSTR("x-apple-apns-dual-mode-delivery-type"));

  return Mutable;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  __CFDictionary *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSString *messageURL;
  NSData *messageRequestBodyData;
  void *v38;
  const char *v39;
  uint64_t v40;
  objc_super v42;
  uuid_t uu;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)IDSWebTunnelRequestMessage;
  -[IDSBaseMessage messageBody](&v42, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_messageRequestUUID(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = (void *)v9;
    objc_msgSend_messageRequestUUID(self, v10, v11);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);

    if (v16)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v16, uu);
      jw_uuid_to_data();
      v17 = 0;
      if (v17)
        CFDictionarySetValue(v6, CFSTR("U"), v17);

    }
  }
  _IDSWebTunnelServiceVersionNumber();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CFDictionarySetValue(v6, CFSTR("v"), v18);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBAA74();
  }

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userAgentString(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    CFDictionarySetValue(v6, CFSTR("ua"), v24);

  if ((objc_msgSend_isIDSMessage(self, v25, v26) & 1) == 0)
  {
    objc_msgSend_userAgentOverride(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_length(v29, v30, v31);

    if (v32)
    {
      objc_msgSend_userAgentOverride(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
        CFDictionarySetValue(v6, CFSTR("ua"), v35);

    }
    CFDictionarySetValue(v6, CFSTR("nH"), &unk_1E4DE6568);
  }
  CFDictionarySetValue(v6, CFSTR("cT"), CFSTR("application/x-apple-plist"));
  messageURL = self->_messageURL;
  if (messageURL)
    CFDictionarySetValue(v6, CFSTR("u"), messageURL);
  messageRequestBodyData = self->_messageRequestBodyData;
  if (messageRequestBodyData)
    CFDictionarySetValue(v6, CFSTR("b"), messageRequestBodyData);
  MEMORY[0x1A85A5CFC](CFSTR("com.apple.ids"), CFSTR("x-test-opts"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v38, v39, v40) && v38)
    CFDictionarySetValue(v6, CFSTR("x-test-opts"), v38);

  return v6;
}

- (void)handleResponseDictionary:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  id v26;

  v26 = a3;
  objc_msgSend__numberForKey_(v26, v4, (uint64_t)CFSTR("hs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseCode_(self, v6, (uint64_t)v5);

  objc_msgSend__numberForKey_(v26, v7, (uint64_t)CFSTR("s"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseStatus_(self, v9, (uint64_t)v8);

  objc_msgSend__dictionaryForKey_(v26, v10, (uint64_t)CFSTR("h"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseHeaders_(self, v12, (uint64_t)v11);

  objc_msgSend_objectForKey_(v26, v13, (uint64_t)CFSTR("b"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__dataForKey_(v26, v15, (uint64_t)CFSTR("b"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setResponseBodyData_(self, v17, (uint64_t)v16);

    objc_msgSend__dataForKey_(v26, v18, (uint64_t)CFSTR("b"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_length(v19, v20, v21);
    objc_msgSend_setReceivedByteCount_(self, v23, v22);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__dictionaryForKey_(v26, v24, (uint64_t)CFSTR("b"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setResponseBodyDictionary_(self, v25, (uint64_t)v19);
    goto LABEL_5;
  }
LABEL_6:

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

- (NSString)messageRequestUUID
{
  return self->_messageRequestUUID;
}

- (void)setMessageRequestUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)messageURL
{
  return self->_messageURL;
}

- (void)setMessageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSData)messageRequestBodyData
{
  return self->_messageRequestBodyData;
}

- (void)setMessageRequestBodyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSDictionary)messageRequestBodyDictionary
{
  return self->_messageRequestBodyDictionary;
}

- (void)setMessageRequestBodyDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSMutableDictionary)messageHeaders
{
  return self->_messageHeaders;
}

- (void)setMessageHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSNumber)maximumResponseSize
{
  return self->_maximumResponseSize;
}

- (void)setMaximumResponseSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)userAgentOverride
{
  return self->_userAgentOverride;
}

- (void)setUserAgentOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSData)responseBodyData
{
  return self->_responseBodyData;
}

- (void)setResponseBodyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSDictionary)responseBodyDictionary
{
  return self->_responseBodyDictionary;
}

- (void)setResponseBodyDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSNumber)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (BOOL)disableIDSTranslation
{
  return self->_disableIDSTranslation;
}

- (void)setDisableIDSTranslation:(BOOL)a3
{
  self->_disableIDSTranslation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentOverride, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_responseCode, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_responseBodyData, 0);
  objc_storeStrong((id *)&self->_responseBodyDictionary, 0);
  objc_storeStrong((id *)&self->_maximumResponseSize, 0);
  objc_storeStrong((id *)&self->_messageHeaders, 0);
  objc_storeStrong((id *)&self->_messageRequestBodyDictionary, 0);
  objc_storeStrong((id *)&self->_messageRequestBodyData, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_storeStrong((id *)&self->_messageRequestUUID, 0);
}

@end
