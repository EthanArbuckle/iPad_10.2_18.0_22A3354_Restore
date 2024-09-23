@implementation AMSMediaRequestEncoder

- (void)setAccount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccount:", v4);

}

- (void)setDisableResponseDecoding:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableResponseDecoding:", v3);

}

- (void)setClientInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientInfo:", v4);

}

- (AMSURLRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

void __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _BYTE v40[24];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "tokenString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Bearer "), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v6, 0x1E255A640);
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("mapspushd"));

  if (v9)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      objc_msgSend(v3, "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543618;
      *(_QWORD *)&v40[4] = v12;
      *(_WORD *)&v40[12] = 2114;
      *(_QWORD *)&v40[14] = v15;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Stripping cookies for mapspushd request", v40, 0x16u);

    }
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", 0, CFSTR("Cookie"));
  }
  if (*(_QWORD *)(a1 + 48) || (v31 = *(void **)(a1 + 32)) == 0)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v18 = (void *)objc_opt_class();
    v19 = v18;
    objc_msgSend(v3, "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v40 = 138543874;
    *(_QWORD *)&v40[4] = v18;
    *(_WORD *)&v40[12] = 2114;
    *(_QWORD *)&v40[14] = v21;
    *(_WORD *)&v40[22] = 2114;
    v41 = v22;
    v23 = "%{public}@: [%{public}@] We did not receive a media token. We will continue regardless. %{public}@";
    v24 = v17;
    v25 = 32;
    goto LABEL_14;
  }
  v32 = objc_msgSend(v31, "isValid");
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v33 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v33;
  if ((v32 & 1) == 0)
  {
    if (!v33)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v39 = (void *)objc_opt_class();
    v19 = v39;
    objc_msgSend(v3, "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v40 = 138543618;
    *(_QWORD *)&v40[4] = v39;
    *(_WORD *)&v40[12] = 2114;
    *(_QWORD *)&v40[14] = v21;
    v23 = "%{public}@: [%{public}@] We received an invalid media token. Will continue regardless.";
    v24 = v17;
    v25 = 22;
LABEL_14:
    _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, v23, v40, v25);

LABEL_15:
    objc_msgSend(v3, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = 0;
    goto LABEL_16;
  }
  if (!v33)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)objc_opt_class();
    v36 = v35;
    objc_msgSend(v3, "properties");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "logUUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v40 = 138543618;
    *(_QWORD *)&v40[4] = v35;
    *(_WORD *)&v40[12] = 2114;
    *(_QWORD *)&v40[14] = v38;
    _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We received a valid media token.", v40, 0x16u);

  }
  objc_msgSend(v3, "properties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v28 = 1;
LABEL_16:
  objc_msgSend(v26, "setMaxRetryCount:", v28, *(_OWORD *)v40, *(_QWORD *)&v40[16], v41);

  objc_msgSend(v3, "properties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "userInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isMediaRequest"));

  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v3);
}

void __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    v9 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "requestEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestByEncodingRequest:parameters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2;
  v21[3] = &unk_1E253E120;
  v22 = *(id *)(a1 + 56);
  objc_msgSend(v11, "addErrorBlock:", v21);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_3;
  v16[3] = &unk_1E2542EE8;
  v13 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v18 = v13;
  v19 = v6;
  v20 = *(id *)(a1 + 56);
  v14 = v6;
  v15 = v9;
  objc_msgSend(v11, "addSuccessBlock:", v16);

}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  AMSMutablePromise *v8;
  void *v9;
  void *v10;
  AMSMutablePromise *v11;
  id v12;
  id v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  AMSMutablePromise *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutablePromise);
  -[AMSMediaRequestEncoder tokenService](self, "tokenService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchMediaToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke;
  v17[3] = &unk_1E2542F10;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v11 = v8;
  v20 = v11;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "addFinishBlock:", v17);

  v14 = v20;
  v15 = v11;

  return v15;
}

- (AMSMediaTokenServiceProtocol)tokenService
{
  return self->_tokenService;
}

- (void)setGsTokenIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGsTokenIdentifier:", v4);

}

- (AMSMediaRequestEncoder)initWithTokenService:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSMediaRequestEncoder *v9;
  AMSMediaRequestEncoder *v10;
  AMSURLRequestEncoder *v11;
  AMSURLRequestEncoder *requestEncoder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSMediaRequestEncoder;
  v9 = -[AMSMediaRequestEncoder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenService, a3);
    v11 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v8);
    requestEncoder = v10->_requestEncoder;
    v10->_requestEncoder = v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_tokenService, 0);
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile](AMSURLRequestEncoder, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion](AMSURLRequestEncoder, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  void *v2;
  void *v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  void *v2;
  void *v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSProcessInfo *)v3;
}

- (BOOL)disableResponseDecoding
{
  void *v2;
  char v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableResponseDecoding");

  return v3;
}

- (BOOL)excludeIdentifierHeadersForAccount
{
  void *v2;
  char v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "excludeIdentifierHeadersForAccount");

  return v3;
}

- (BOOL)alwaysIncludeAuthKitHeaders
{
  void *v2;
  char v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysIncludeAuthKitHeaders");

  return v3;
}

- (BOOL)alwaysIncludeMMeClientInfoAndDeviceHeaders
{
  void *v2;
  char v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysIncludeMMeClientInfoAndDeviceHeaders");

  return v3;
}

- (NSString)gsTokenIdentifier
{
  void *v2;
  void *v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gsTokenIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)logKey
{
  void *v2;
  void *v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)requestEncoding
{
  void *v2;
  int64_t v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestEncoding");

  return v3;
}

- (AMSResponseDecoding)responseDecoder
{
  void *v2;
  void *v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseDecoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSResponseDecoding *)v3;
}

- (BOOL)URLKnownToBeTrusted
{
  void *v2;
  char v3;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "urlKnownToBeTrusted");

  return v3;
}

- (void)setAlwaysIncludeAuthKitHeaders:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysIncludeAuthKitHeaders:", v3);

}

- (void)setAlwaysIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysIncludeMMeClientInfoAndDeviceHeaders:", v3);

}

- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExcludeIdentifierHeadersForAccount:", v3);

}

- (void)setLogKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLogUUID:", v4);

}

- (void)setRequestEncoding:(int64_t)a3
{
  id v4;

  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestEncoding:", a3);

}

- (void)setResponseDecoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseDecoder:", v4);

}

- (void)setURLKnownToBeTrusted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSMediaRequestEncoder requestEncoder](self, "requestEncoder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUrlKnownToBeTrusted:", v3);

}

- (id)requestWithComponents:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder requestWithURL:](self, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requestWithURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder requestByEncodingRequest:parameters:](self, "requestByEncodingRequest:parameters:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (BOOL)disableAccountMediaTypeComponent
{
  return self->_disableAccountMediaTypeComponent;
}

- (void)setDisableAccountMediaTypeComponent:(BOOL)a3
{
  self->_disableAccountMediaTypeComponent = a3;
}

@end
