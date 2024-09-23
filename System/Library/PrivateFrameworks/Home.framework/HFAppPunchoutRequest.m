@implementation HFAppPunchoutRequest

- (HFAppPunchoutRequest)initWithName:(id)a3 bundleID:(id)a4 payloadURL:(id)a5 storeURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HFAppPunchoutRequest *v15;
  HFAppPunchoutRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HFAppPunchoutRequest;
  v15 = -[HFAppPunchoutRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_payloadURL, a5);
    objc_storeStrong((id *)&v16->_storeURL, a6);
  }

  return v16;
}

+ (BOOL)canHandleBundleID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v8;

  if (!a3)
    return 0;
  v8 = 0;
  v4 = a3;
  objc_msgSend(a1, "_openApplicationService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenApplication:reason:", v4, &v8);

  return v6;
}

+ (id)handleRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Handling HFAppPunchoutRequest %@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__HFAppPunchoutRequest_handleRequest___block_invoke;
  v10[3] = &unk_1EA726388;
  v11 = v4;
  v12 = a1;
  v7 = v4;
  objc_msgSend(v6, "futureWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __38__HFAppPunchoutRequest_handleRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_openApplicationService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      HFLogForCategory(8uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Failed to initialize FBSOpenApplicationService", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1002, MEMORY[0x1E0C9AA70]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v7);

    }
    v34 = 0;
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "canOpenApplication:reason:", v8, &v34);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "payloadURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D22D78]);

      HFLogForCategory(8uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v13;
        v37 = 2112;
        v38 = v10;
        _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Launching application for bundleID %@ options %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "bundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openApplication:withOptions:completion:", v14, v15, 0);

      objc_msgSend(v3, "finishWithNoResult");
      goto LABEL_20;
    }
    HFLogForCategory(8uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v27;
      v37 = 2048;
      v38 = v34;
      _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Failed to launch application for bundleID %@ with FBSOpenApplicationErrorCode %li", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "storeURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(8uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "storeURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v20;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Launching URL %@", buf, 0xCu);

    }
    +[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "storeURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "openURL:", v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __38__HFAppPunchoutRequest_handleRequest___block_invoke_15;
    v32[3] = &unk_1EA726338;
    v24 = v3;
    v33 = v24;
    v25 = (id)objc_msgSend(v5, "addSuccessBlock:", v32);
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __38__HFAppPunchoutRequest_handleRequest___block_invoke_2;
    v29[3] = &unk_1EA726360;
    v30 = *(id *)(a1 + 32);
    v31 = v24;
    v26 = (id)objc_msgSend(v5, "addFailureBlock:", v29);

  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v28 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "Failed to handle HFAppPunchoutRequest %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1002, MEMORY[0x1E0C9AA70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v5);
  }
LABEL_20:

}

uint64_t __38__HFAppPunchoutRequest_handleRequest___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void __38__HFAppPunchoutRequest_handleRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(8uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "storeURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to launch URL %@ with error %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HFAppPunchoutRequest name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[HFAppPunchoutRequest bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[HFAppPunchoutRequest payloadURL](self, "payloadURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[HFAppPunchoutRequest storeURL](self, "storeURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  v14 = (void *)objc_msgSend(v5, "initWithName:bundleID:payloadURL:storeURL:", v7, v9, v11, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HFAppPunchoutRequest)initWithCoder:(id)a3
{
  id v4;
  HFAppPunchoutRequest *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSURL *payloadURL;
  uint64_t v12;
  NSURL *storeURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFAppPunchoutRequest;
  v5 = -[HFAppPunchoutRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HFAppPunchoutRequestEncodedNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HFAppPunchoutRequestEncodedBundleIDKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HFAppPunchoutRequestEncodedPayloadURLKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    payloadURL = v5->_payloadURL;
    v5->_payloadURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HFAppPunchoutRequestEncodedStoreURLKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    storeURL = v5->_storeURL;
    v5->_storeURL = (NSURL *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HFAppPunchoutRequest name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HFAppPunchoutRequestEncodedNameKey"));

  -[HFAppPunchoutRequest bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HFAppPunchoutRequestEncodedBundleIDKey"));

  -[HFAppPunchoutRequest payloadURL](self, "payloadURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HFAppPunchoutRequestEncodedPayloadURLKey"));

  -[HFAppPunchoutRequest storeURL](self, "storeURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HFAppPunchoutRequestEncodedStoreURLKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAppPunchoutRequest name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[HFAppPunchoutRequest bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("bundleID"));

  -[HFAppPunchoutRequest payloadURL](self, "payloadURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("payloadURL"));

  -[HFAppPunchoutRequest storeURL](self, "storeURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("storeURL"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_openApplicationService
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    HFLogForCategory(8uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Failed to initialize FBSOpenApplicationService", v5, 2u);
    }

  }
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSURL)payloadURL
{
  return self->_payloadURL;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
