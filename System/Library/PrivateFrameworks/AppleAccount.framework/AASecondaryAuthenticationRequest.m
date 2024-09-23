@implementation AASecondaryAuthenticationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASecondaryAuthenticationRequest)initWithDSID:(id)a3 primaryToken:(id)a4
{
  id v8;
  id v9;
  void *v10;
  AASecondaryAuthenticationRequest *v11;
  AASecondaryAuthenticationRequest *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARequest.m"), 1110, CFSTR("No DSID passed"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARequest.m"), 1111, CFSTR("No token passed"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)AASecondaryAuthenticationRequest;
  v11 = -[AASecondaryAuthenticationRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryToken, a4);
    objc_storeStrong((id *)&v12->_dsid, a3);
  }

  return v12;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryAuthenticationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AASecondaryAuthenticationRequest;
  -[AARequest urlRequest](&v11, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_dsid, self->_primaryToken);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-GS-Token"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v8, CFSTR("Authorization"));
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v9, CFSTR("X-AppleID-Device-Udid"));

  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", self->_dsid);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_primaryToken, 0);
}

@end
