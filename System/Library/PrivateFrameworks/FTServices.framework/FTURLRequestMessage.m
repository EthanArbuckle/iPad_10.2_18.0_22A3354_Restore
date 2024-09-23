@implementation FTURLRequestMessage

- (FTURLRequestMessage)initWithURL:(id)a3 type:(unint64_t)a4 headers:(id)a5 stringParams:(id)a6 body:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FTURLRequestMessage *v17;
  FTURLRequestMessage *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  objc_super v23;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)FTURLRequestMessage;
  v17 = -[FTIDSMessage init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_requestURL, a3);
    objc_msgSend_setURLOverride_(v18, v19, (uint64_t)v13);
    v18->_requestType = a4;
    objc_storeStrong((id *)&v18->_requestHeaders, a5);
    objc_storeStrong((id *)&v18->_requestStringParams, a6);
    objc_storeStrong((id *)&v18->_requestBody, a7);
    objc_msgSend_setImportanceLevel_(v18, v20, 2);
    objc_msgSend_setHttpDoNotDecodeData_(v18, v21, 1);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)FTURLRequestMessage;
  v4 = -[FTIDSMessage copyWithZone:](&v34, sel_copyWithZone_, a3);
  v7 = objc_msgSend_requestType(self, v5, v6);
  objc_msgSend_setRequestType_(v4, v8, v7);
  objc_msgSend_requestURL(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestURL_(v4, v12, (uint64_t)v11);

  objc_msgSend_requestHeaders(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestHeaders_(v4, v16, (uint64_t)v15);

  objc_msgSend_requestStringParams(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestStringParams_(v4, v20, (uint64_t)v19);

  objc_msgSend_responseHeaders(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseHeaders_(v4, v24, (uint64_t)v23);

  objc_msgSend_responseBody(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseBody_(v4, v28, (uint64_t)v27);

  objc_msgSend_responseStatusCode(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseStatusCode_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)additionalQueryStringParameters
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *Mutable;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FTURLRequestMessage;
  -[IDSBaseMessage additionalQueryStringParameters](&v12, sel_additionalQueryStringParameters);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend_requestStringParams(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(Mutable, v10, (uint64_t)v9);

  return Mutable;
}

- (id)additionalMessageHeaders
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
  const char *v12;
  uint64_t v13;
  int hasAttemptedAPSDelivery;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)FTURLRequestMessage;
  -[FTIDSMessage additionalMessageHeaders](&v24, sel_additionalMessageHeaders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend_requestHeaders(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(Mutable, v10, (uint64_t)v9);

  objc_msgSend_removeObjectForKey_(Mutable, v11, (uint64_t)CFSTR("x-apple-apns-dual-mode-delivery-type"));
  hasAttemptedAPSDelivery = objc_msgSend_hasAttemptedAPSDelivery(self, v12, v13);
  v15 = objc_alloc(MEMORY[0x1E0CB37E8]);
  if (hasAttemptedAPSDelivery)
    v17 = (void *)objc_msgSend_initWithInt_(v15, v16, 1);
  else
    v17 = (void *)objc_msgSend_initWithInt_(v15, v16, 3);
  v20 = v17;
  objc_msgSend_stringValue(v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(Mutable, v22, (uint64_t)v21, CFSTR("x-apple-apns-dual-mode-delivery-type"));

  return Mutable;
}

- (id)messageBodyDataOverride
{
  return (id)((uint64_t (*)(FTURLRequestMessage *, char *))MEMORY[0x1E0DE7D20])(self, sel_requestBody);
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  uint64_t v2;

  return objc_msgSend_requestType(self, a2, v2) == 0;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 0;
}

- (BOOL)wantsIDSSignatures
{
  return 0;
}

- (BOOL)wantsIDSServer
{
  return 0;
}

- (BOOL)isIDSMessage
{
  return 0;
}

- (void)handleResponseHeaders:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "FT URL  Message Completed With Respone Headers %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v7 = v4;
    _IDSLogV();
  }
  objc_msgSend_setResponseHeaders_(self, v6, (uint64_t)v4, v7);

}

- (void)handleResponseStatus:(unint64_t)a3
{
  const char *v4;
  id v5;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseStatusCode_(self, v4, (uint64_t)v5);

}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSDictionary)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSDictionary)requestStringParams
{
  return self->_requestStringParams;
}

- (void)setRequestStringParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSData)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSData)responseBody
{
  return self->_responseBody;
}

- (void)setResponseBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSNumber)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_responseStatusCode, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_requestStringParams, 0);
  objc_storeStrong((id *)&self->_requestHeaders, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end
