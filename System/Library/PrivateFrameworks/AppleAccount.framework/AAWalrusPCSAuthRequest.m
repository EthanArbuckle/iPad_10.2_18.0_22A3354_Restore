@implementation AAWalrusPCSAuthRequest

- (AAWalrusPCSAuthRequest)initWithAccount:(id)a3 WebSessionID:(id)a4 webSessionConsentUUID:(id)a5 encryptionEnvelope:(id)a6 appName:(id)a7 responseIdentities:(id)a8 serverInfo:(id)a9 urlString:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  AAWalrusPCSAuthRequest *v24;
  AAWalrusPCSAuthRequest *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *bodyParams;
  id v31;
  objc_super v32;
  _QWORD v33[6];
  _QWORD v34[7];

  v34[6] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v32.receiver = self;
  v32.super_class = (Class)AAWalrusPCSAuthRequest;
  v24 = -[AAWalrusPCSAuthRequest init](&v32, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_account, a3);
    v33[0] = CFSTR("PCSIdentitiesInResponse");
    v33[1] = CFSTR("encryptedEnvelope");
    v34[0] = v21;
    v34[1] = v19;
    v34[2] = v20;
    v33[2] = CFSTR("appName");
    v33[3] = CFSTR("webSessionID");
    objc_msgSend(v17, "lowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v26;
    v33[4] = CFSTR("webSessionConsentUUID");
    objc_msgSend(v18, "lowercaseString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = CFSTR("serverInfo");
    v34[4] = v27;
    v34[5] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
    v28 = objc_claimAutoreleasedReturnValue();
    bodyParams = v25->_bodyParams;
    v25->_bodyParams = (NSDictionary *)v28;

    objc_storeStrong((id *)&v25->_internalURLString, a10);
  }

  return v25;
}

- (id)urlString
{
  return self->_internalURLString;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAWalrusPCSAuthRequest;
  -[AARequest urlRequest](&v7, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, 0) & 1) == 0)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AAWalrusPCSAuthRequest urlRequest].cold.1(v5);

  }
  if (self->_bodyParams)
    objc_msgSend(v4, "aa_setJSONBodyWithParameters:");
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalURLString, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_bodyParams, 0);
}

- (void)urlRequest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "Unable to add authorization header to PCS auth request.", v1, 2u);
}

@end
