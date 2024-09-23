@implementation CKRequestInfo

- (CKRequestInfo)initWithRequestUUID:(id)a3 responseHTTPHeaders:(id)a4 w3cTiming:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKRequestInfo *v14;
  uint64_t v15;
  NSString *requestUUID;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *responseHTTPHeaders;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSDictionary *w3cNavigationTiming;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKRequestInfo;
  v14 = -[CKRequestInfo init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    requestUUID = v14->_requestUUID;
    v14->_requestUUID = (NSString *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    responseHTTPHeaders = v14->_responseHTTPHeaders;
    v14->_responseHTTPHeaders = (NSDictionary *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    w3cNavigationTiming = v14->_w3cNavigationTiming;
    v14->_w3cNavigationTiming = (NSDictionary *)v25;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;

  v29 = a3;
  objc_msgSend_requestUUID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v8, (uint64_t)v7, (uint64_t)CFSTR("RequestUUID"));

  objc_msgSend_responseHTTPHeaders(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v13, (uint64_t)v12, (uint64_t)CFSTR("ResponseHTTPHeaders"));

  objc_msgSend_w3cNavigationTiming(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v18, (uint64_t)v17, (uint64_t)CFSTR("W3CNavigationTiming"));

  if (__sTestOverridesAvailable)
  {
    objc_msgSend_requestOperations(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v29, v23, (uint64_t)v22, (uint64_t)CFSTR("RequestOperations"));

    objc_msgSend_operationClassName(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v29, v28, (uint64_t)v27, (uint64_t)CFSTR("OperationClassName"));

  }
}

- (CKRequestInfo)initWithCoder:(id)a3
{
  id v4;
  CKRequestInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *requestUUID;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *responseHTTPHeaders;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *w3cNavigationTiming;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *operationClassName;
  Class v22;
  Class v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSArray *requestOperations;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKRequestInfo;
  v5 = -[CKRequestInfo init](&v33, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("RequestUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSString *)v8;

    objc_msgSend_decodePropertyListForKey_(v4, v10, (uint64_t)CFSTR("ResponseHTTPHeaders"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    responseHTTPHeaders = v5->_responseHTTPHeaders;
    v5->_responseHTTPHeaders = (NSDictionary *)v12;

    objc_msgSend_decodePropertyListForKey_(v4, v14, (uint64_t)CFSTR("W3CNavigationTiming"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    w3cNavigationTiming = v5->_w3cNavigationTiming;
    v5->_w3cNavigationTiming = (NSDictionary *)v16;

    if (__sTestOverridesAvailable)
    {
      objc_msgSend_decodePropertyListForKey_(v4, v18, (uint64_t)CFSTR("OperationClassName"), v19);
      v20 = objc_claimAutoreleasedReturnValue();
      operationClassName = v5->_operationClassName;
      v5->_operationClassName = (NSString *)v20;

      v22 = NSClassFromString(CFSTR("CKDPRequestOperation"));
      if (v22)
      {
        v23 = v22;
        v24 = (void *)MEMORY[0x1E0C99E60];
        v25 = objc_opt_class();
        objc_msgSend_setWithObjects_(v24, v26, v25, v27, v23, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("RequestOperations"));
        v30 = objc_claimAutoreleasedReturnValue();
        requestOperations = v5->_requestOperations;
        v5->_requestOperations = (NSArray *)v30;

      }
    }
  }

  return v5;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (NSDictionary)responseHTTPHeaders
{
  return self->_responseHTTPHeaders;
}

- (NSDictionary)w3cNavigationTiming
{
  return self->_w3cNavigationTiming;
}

- (NSArray)requestOperations
{
  return self->_requestOperations;
}

- (void)setRequestOperations:(id)a3
{
  objc_storeStrong((id *)&self->_requestOperations, a3);
}

- (NSString)operationClassName
{
  return self->_operationClassName;
}

- (void)setOperationClassName:(id)a3
{
  objc_storeStrong((id *)&self->_operationClassName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationClassName, 0);
  objc_storeStrong((id *)&self->_requestOperations, 0);
  objc_storeStrong((id *)&self->_w3cNavigationTiming, 0);
  objc_storeStrong((id *)&self->_responseHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
