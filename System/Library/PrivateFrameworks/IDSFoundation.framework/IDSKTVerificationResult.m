@implementation IDSKTVerificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTVerificationResult)initWithCoder:(id)a3
{
  id v4;
  IDSKTVerificationResult *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSString *uri;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  uint64_t v21;
  NSArray *verifiedPushTokens;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  uint64_t v31;
  NSArray *unverifiedPushTokens;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  uint64_t v41;
  NSArray *endpointTransparencyStates;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)IDSKTVerificationResult;
  v5 = -[IDSKTVerificationResult init](&v44, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("URI"));
    v9 = objc_claimAutoreleasedReturnValue();
    uri = v5->_uri;
    v5->_uri = (NSString *)v9;

    v5->_optedIn = objc_msgSend_decodeBoolForKey_(v4, v11, (uint64_t)CFSTR("OptedIn"), v12);
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend_setWithObjects_(v13, v16, v14, v17, v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, v20, CFSTR("VerifiedPushTokens"));
    v21 = objc_claimAutoreleasedReturnValue();
    verifiedPushTokens = v5->_verifiedPushTokens;
    v5->_verifiedPushTokens = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend_setWithObjects_(v23, v26, v24, v27, v25, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, v30, CFSTR("UnverifiedPushTokens"));
    v31 = objc_claimAutoreleasedReturnValue();
    unverifiedPushTokens = v5->_unverifiedPushTokens;
    v5->_unverifiedPushTokens = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend_setWithObjects_(v33, v36, v34, v37, v35, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, v40, CFSTR("EndpointTransparencyStates"));
    v41 = objc_claimAutoreleasedReturnValue();
    endpointTransparencyStates = v5->_endpointTransparencyStates;
    v5->_endpointTransparencyStates = (NSArray *)v41;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  double v33;
  id v34;

  v4 = a3;
  objc_msgSend_uri(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("URI"));

  v14 = objc_msgSend_optedIn(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, v14, v16, CFSTR("OptedIn"));
  objc_msgSend_verifiedPushTokens(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("VerifiedPushTokens"));

  objc_msgSend_unverifiedPushTokens(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("UnverifiedPushTokens"));

  objc_msgSend_endpointTransparencyStates(self, v29, v30, v31);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v34, v33, CFSTR("EndpointTransparencyStates"));

}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  self->_optedIn = a3;
}

- (NSArray)verifiedPushTokens
{
  return self->_verifiedPushTokens;
}

- (void)setVerifiedPushTokens:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedPushTokens, a3);
}

- (NSArray)unverifiedPushTokens
{
  return self->_unverifiedPushTokens;
}

- (void)setUnverifiedPushTokens:(id)a3
{
  objc_storeStrong((id *)&self->_unverifiedPushTokens, a3);
}

- (NSArray)endpointTransparencyStates
{
  return self->_endpointTransparencyStates;
}

- (void)setEndpointTransparencyStates:(id)a3
{
  objc_storeStrong((id *)&self->_endpointTransparencyStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointTransparencyStates, 0);
  objc_storeStrong((id *)&self->_unverifiedPushTokens, 0);
  objc_storeStrong((id *)&self->_verifiedPushTokens, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
