@implementation AMSURLRequestEncoder

- (AMSProcessInfo)clientInfo
{
  AMSProcessInfo *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_clientInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (AMSBagProtocol)bag
{
  AMSBagProtocol *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_bag;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)preserveQueryParameterEncoding
{
  return self->_preserveQueryParameterEncoding;
}

- (BOOL)includeClientVersions
{
  return self->_includeClientVersions;
}

- (NSArray)groupRequestAccounts
{
  NSArray *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_groupRequestAccounts;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_personalizeKeychainOptionsForAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  AMSKeychainOptions *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    -[AMSURLRequestEncoder keychainOptions](self, "keychainOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v14;
    if (!v5)
    {
      v6 = objc_msgSend(v14, "ams_isLocalAccount");
      v4 = v14;
      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "processName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("AppStore"));

        v4 = v14;
        if (v9)
        {
          v10 = objc_alloc_init(AMSKeychainOptions);
          -[AMSURLRequestEncoder setKeychainOptions:](self, "setKeychainOptions:", v10);

          -[AMSURLRequestEncoder keychainOptions](self, "keychainOptions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setPurpose:", 1);

          v12 = +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle");
          -[AMSURLRequestEncoder keychainOptions](self, "keychainOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setStyle:", v12);

          v4 = v14;
        }
      }
    }
  }

}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  _QWORD v92[5];
  id v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v8)
    goto LABEL_12;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v14 = objc_opt_class();
    v15 = v14;
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v3);
    }
    else
    {
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v95 = (uint64_t)v16;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@We weren't provided an account and were unable to get the local account.", buf, 0xCu);
    if (v12)
    {

      v16 = v2;
    }

  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v8)
  {
LABEL_12:
    v17 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "properties");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logUUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v36;
        v96 = 2114;
        v97 = v38;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Somewhere along the lines the account has become a dangling pointer.", buf, 0x16u);

      }
      AMSError(0, CFSTR("Request encoding failed"), CFSTR("The account object was no longer valid."), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    v18 = v17;

  }
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "logUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "hashedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "accountMediaType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v95 = v21;
    v96 = 2114;
    v97 = v22;
    v98 = 2114;
    v99 = v24;
    v100 = 2114;
    v101 = v25;
    v102 = 2114;
    v103 = v27;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Encoding request for URL: %{public}@ { \n\taccount = %{public}@ \n\tmediaType = %{public}@ \n}", buf, 0x34u);

  }
  v28 = *(_QWORD *)(a1 + 56);
  if (v28)
  {
    v29 = *(void **)(a1 + 32);
    v30 = objc_msgSend(*(id *)(a1 + 40), "requestEncoding");
    v31 = objc_msgSend(*(id *)(a1 + 40), "compressRequestBody");
    v93 = 0;
    objc_msgSend(v29, "ams_setBodyParameters:encoding:compressBody:error:", v28, v30, v31, &v93);
    v32 = v93;
    if (v32)
    {
      v33 = v32;
LABEL_26:
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

      return v39;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", CFSTR("br, gzip, deflate"), CFSTR("Accept-Encoding"));
  v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAccount:", v40);

  objc_msgSend(*(id *)(a1 + 40), "additionalMetrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAdditionalMetrics:", v42);

  v44 = objc_msgSend(*(id *)(a1 + 40), "anisetteType");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAnisetteType:", v44);

  objc_msgSend(*(id *)(a1 + 40), "bag");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBag:", v46);

  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setClientInfo:", v48);

  v50 = objc_msgSend(*(id *)(a1 + 40), "dialogOptions");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setDialogOptions:", v50);

  objc_msgSend(*(id *)(a1 + 40), "gsTokenIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setGsTokenIdentifier:", v52);

  v54 = objc_msgSend(*(id *)(a1 + 40), "excludeIdentifierHeadersForAccount");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setExcludeIdentifierHeadersForAccount:", v54);

  objc_msgSend(*(id *)(a1 + 40), "keychainOptions");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setKeychainOptions:", v56);

  v58 = objc_msgSend(*(id *)(a1 + 40), "urlKnownToBeTrusted");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setKnownToBeTrusted:", v58);

  v60 = objc_msgSend(*(id *)(a1 + 40), "mescalType");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setMescalType:", v60);

  objc_msgSend(*(id *)(a1 + 40), "responseDecoder");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setResponseDecoder:", v62);

  v64 = objc_msgSend(*(id *)(a1 + 40), "disableResponseDecoding");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setDisableResponseDecoding:", v64);

  v66 = objc_msgSend(*(id *)(a1 + 40), "enableRemoteSecuritySigning");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setRemoteSecuritySigningEnabled:", v66);

  v68 = objc_msgSend(*(id *)(a1 + 40), "shouldSetCookiesFromResponse");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setShouldSetCookiesFromResponse:", v68);

  v70 = objc_msgSend(*(id *)(a1 + 40), "shouldSetStorefrontFromResponse");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setShouldSetStorefrontFromResponse:", v70);

  objc_msgSend(*(id *)(a1 + 40), "parentProperties");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(*(id *)(a1 + 40), "parentProperties");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "purchaseInfo");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setPurchaseInfo:", v74);

    v76 = objc_msgSend(*(id *)(a1 + 40), "dialogOptions");
    v77 = *(void **)(a1 + 40);
    if (!v76)
    {
      objc_msgSend(*(id *)(a1 + 40), "parentProperties");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v78 = objc_msgSend(v77, "dialogOptions");
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setDialogOptions:", v78);

    if (!v76)
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "excludeIdentifierHeadersForAccount") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "ams_addIdentifierHeadersForAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v80 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v81 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "gsTokenIdentifier");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "ams_addGSTokenForAccount:identifier:", v80, v82);

  if (objc_msgSend(*(id *)(a1 + 40), "alwaysIncludeMMeClientInfoAndDeviceHeaders"))
  {
    objc_msgSend(*(id *)(a1 + 40), "gsTokenIdentifier");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v83)
      objc_msgSend(*(id *)(a1 + 32), "ams_addMMeClientInfoAndDeviceHeaders");
  }
  if (objc_msgSend(*(id *)(a1 + 40), "shouldSetStorefrontHeader"))
  {
    v84 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v85 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "clientInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "accountMediaType");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bag");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSURLRequestDecoration addStoreFrontHeaderToRequest:forAccount:mediaType:bag:](AMSURLRequestDecoration, "addStoreFrontHeaderToRequest:forAccount:mediaType:bag:", v85, v84, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_42;
    v92[3] = &unk_1E25468F0;
    v92[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v88, "catchWithBlock:", v92);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "promiseAdapter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_39;
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AMSKeychainOptions)keychainOptions
{
  AMSKeychainOptions *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_keychainOptions;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)gsTokenIdentifier
{
  return self->_gsTokenIdentifier;
}

- (int64_t)mescalType
{
  return self->_mescalType;
}

- (BOOL)enableRemoteSecuritySigning
{
  return self->_enableRemoteSecuritySigning;
}

- (int64_t)anisetteType
{
  return self->_anisetteType;
}

- (BOOL)urlKnownToBeTrusted
{
  return self->_urlKnownToBeTrusted;
}

- (BOOL)shouldSetStorefrontHeader
{
  return self->_shouldSetStorefrontHeader;
}

- (BOOL)shouldSetStorefrontFromResponse
{
  return self->_shouldSetStorefrontFromResponse;
}

- (BOOL)shouldSetCookiesFromResponse
{
  return self->_shouldSetCookiesFromResponse;
}

- (AMSResponseDecoding)responseDecoder
{
  AMSResponseDecoding *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_responseDecoder;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)requestEncoding
{
  return self->_requestEncoding;
}

- (AMSURLRequestProperties)parentProperties
{
  return self->_parentProperties;
}

- (BOOL)disableResponseDecoding
{
  return self->_disableResponseDecoding;
}

- (int64_t)dialogOptions
{
  return self->_dialogOptions;
}

- (BOOL)compressRequestBody
{
  return self->_compressRequestBody;
}

- (NSDictionary)additionalMetrics
{
  NSDictionary *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_additionalMetrics;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setEncodeCount:(int64_t)a3
{
  self->_encodeCount = a3;
}

- (void)setAccount:(id)a3
{
  ACAccount *v4;
  ACAccount *account;

  v4 = (ACAccount *)a3;
  os_unfair_recursive_lock_lock_with_options();
  account = self->_account;
  self->_account = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setRequestEncoding:(int64_t)a3
{
  self->_requestEncoding = a3;
}

void __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "logUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || objc_msgSend(a1[4], "encodeCount") >= 1
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%ld"), v2, objc_msgSend(a1[4], "encodeCount")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        (v2 = (void *)v3) == 0))
  {
    AMSGenerateLogCorrelationKey();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1[5], "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogUUID:", v2);

  v5 = AMSSetLogKey(v2);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__73;
  v38 = __Block_byref_object_dispose__73;
  objc_msgSend(a1[4], "account");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (v35[5])
  {
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C8F2B8];
    objc_msgSend(a1[4], "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_sharedAccountStoreForProcessInfo:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "ams_mediaType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "thenWithBlock:", &__block_literal_global_27_0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_opt_class();
        objc_msgSend(a1[5], "properties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "URL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableURL(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v14;
        v42 = 2114;
        v43 = v16;
        v44 = 2114;
        v45 = v18;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to fetch shared ACAccountStore. Request encoding will continue without an account. Request URL: %{public}@", buf, 0x20u);

      }
      +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2;
  v28[3] = &unk_1E2546B98;
  v33 = &v34;
  v20 = a1[5];
  v21 = a1[4];
  v29 = v20;
  v30 = v21;
  v31 = a1[6];
  v32 = a1[7];
  objc_msgSend(v7, "continueWithBlock:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_46;
  v25[3] = &unk_1E2546BC0;
  v23 = a1[5];
  v25[4] = a1[4];
  v26 = v23;
  v27 = &v34;
  objc_msgSend(v22, "thenWithBlock:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[8], "finishWithPromise:", v24);
  _Block_object_dispose(&v34, 8);

}

- (int64_t)encodeCount
{
  return self->_encodeCount;
}

- (NSString)logUUID
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_logUUID;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (ACAccount)account
{
  ACAccount *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_account;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setDisableResponseDecoding:(BOOL)a3
{
  self->_disableResponseDecoding = a3;
}

- (void)setMescalType:(int64_t)a3
{
  self->_mescalType = a3;
}

- (void)setAnisetteType:(int64_t)a3
{
  self->_anisetteType = a3;
}

- (void)setClientInfo:(id)a3
{
  AMSProcessInfo *v4;
  AMSProcessInfo *clientInfo;

  v4 = (AMSProcessInfo *)a3;
  os_unfair_recursive_lock_lock_with_options();
  clientInfo = self->_clientInfo;
  self->_clientInfo = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setIncludeClientVersions:(BOOL)a3
{
  self->_includeClientVersions = a3;
}

- (void)setLogUUID:(id)a3
{
  NSString *v4;
  NSString *logUUID;

  v4 = (NSString *)a3;
  os_unfair_recursive_lock_lock_with_options();
  logUUID = self->_logUUID;
  self->_logUUID = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 parameters:(id)a5
{
  return -[AMSURLRequestEncoder requestWithMethod:URL:headers:parameters:](self, "requestWithMethod:URL:headers:parameters:", a3, a4, 0, a5);
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 headers:(id)a5 parameters:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v10 = (void *)MEMORY[0x1E0C92C28];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "requestWithURL:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder _methodStringFromMethod:](self, "_methodStringFromMethod:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPMethod:", v14);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__AMSURLRequestEncoder_requestWithMethod_URL_headers_parameters___block_invoke;
  v18[3] = &unk_1E25420D0;
  v19 = v13;
  v15 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);

  -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](self, "requestByEncodingRequest:parameters:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_methodStringFromMethod:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_1E2546BE0[a3];
}

- (void)setUrlKnownToBeTrusted:(BOOL)a3
{
  self->_urlKnownToBeTrusted = a3;
}

- (void)setShouldSetStorefrontHeader:(BOOL)a3
{
  self->_shouldSetStorefrontHeader = a3;
}

- (void)setPreserveQueryParameterEncoding:(BOOL)a3
{
  self->_preserveQueryParameterEncoding = a3;
}

- (AMSURLRequestEncoder)initWithBag:(id)a3
{
  id v5;
  AMSURLRequestEncoder *v6;
  AMSURLRequestEncoder *v7;

  v5 = a3;
  v6 = -[AMSURLRequestEncoder init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bag, a3);

  return v7;
}

- (AMSURLRequestEncoder)init
{
  AMSURLRequestEncoder *v2;
  AMSURLRequestEncoder *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  uint64_t v7;
  AMSProcessInfo *clientInfo;
  uint64_t v9;
  NSString *logUUID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSURLRequestEncoder;
  v2 = -[AMSURLRequestEncoder init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_propertiesLock = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.AMSURLRequestEncoder", v4);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v5;

    *(_WORD *)&v3->_alwaysIncludeAuthKitHeaders = 0;
    v3->_anisetteType = 0;
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v7 = objc_claimAutoreleasedReturnValue();
    clientInfo = v3->_clientInfo;
    v3->_clientInfo = (AMSProcessInfo *)v7;

    v3->_encodeCount = 0;
    v3->_excludeIdentifierHeadersForAccount = 0;
    v3->_includeClientVersions = 1;
    AMSLogKey();
    v9 = objc_claimAutoreleasedReturnValue();
    logUUID = v3->_logUUID;
    v3->_logUUID = (NSString *)v9;

    v3->_mescalType = 1;
    *(_WORD *)&v3->_shouldSetCookiesFromResponse = 257;
    *(_WORD *)&v3->_shouldSetStorefrontHeader = 257;
  }
  return v3;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  AMSMutablePromise *v8;
  void *v9;
  AMSURLRequest *v10;
  NSObject *v11;
  AMSMutablePromise *v12;
  id v13;
  id v14;
  AMSURLRequest *v15;
  AMSMutablePromise *v16;
  AMSMutablePromise *v17;
  _QWORD block[5];
  AMSURLRequest *v20;
  id v21;
  id v22;
  AMSMutablePromise *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutablePromise);
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v10 = -[AMSURLRequest initWithRequest:]([AMSURLRequest alloc], "initWithRequest:", v6);
    goto LABEL_6;
  }
  v10 = v9;

  if (!v10)
    goto LABEL_5;
LABEL_6:
  -[AMSURLRequestEncoder internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke;
  block[3] = &unk_1E2541440;
  block[4] = self;
  v20 = v10;
  v21 = v6;
  v22 = v7;
  v12 = v8;
  v23 = v12;
  v13 = v7;
  v14 = v6;
  v15 = v10;
  dispatch_async(v11, block);

  v16 = v23;
  v17 = v12;

  return v17;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentProperties, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_bagContract, 0);
  objc_storeStrong((id *)&self->_gsTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_responseDecoder, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_keychainOptions, 0);
  objc_storeStrong((id *)&self->_groupRequestAccounts, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (void)setGsTokenIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gsTokenIdentifier, a3);
}

- (void)setDialogOptions:(int64_t)a3
{
  self->_dialogOptions = a3;
}

- (void)setAdditionalMetrics:(id)a3
{
  NSDictionary *v4;
  NSDictionary *additionalMetrics;

  v4 = (NSDictionary *)a3;
  os_unfair_recursive_lock_lock_with_options();
  additionalMetrics = self->_additionalMetrics;
  self->_additionalMetrics = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setBag:(id)a3
{
  AMSBagProtocol *v4;
  AMSBagProtocol *bag;

  v4 = (AMSBagProtocol *)a3;
  os_unfair_recursive_lock_lock_with_options();
  bag = self->_bag;
  self->_bag = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setGroupRequestAccounts:(id)a3
{
  NSArray *v4;
  NSArray *groupRequestAccounts;

  v4 = (NSArray *)a3;
  os_unfair_recursive_lock_lock_with_options();
  groupRequestAccounts = self->_groupRequestAccounts;
  self->_groupRequestAccounts = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setKeychainOptions:(id)a3
{
  AMSKeychainOptions *v4;
  AMSKeychainOptions *keychainOptions;

  v4 = (AMSKeychainOptions *)a3;
  os_unfair_recursive_lock_lock_with_options();
  keychainOptions = self->_keychainOptions;
  self->_keychainOptions = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setResponseDecoder:(id)a3
{
  AMSResponseDecoding *v4;
  AMSResponseDecoding *responseDecoder;

  v4 = (AMSResponseDecoding *)a3;
  os_unfair_recursive_lock_lock_with_options();
  responseDecoder = self->_responseDecoder;
  self->_responseDecoder = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 parameters:(id)a5
{
  return -[AMSURLRequestEncoder requestWithMethod:bagURL:headers:parameters:](self, "requestWithMethod:bagURL:headers:parameters:", a3, a4, 0, a5);
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 headers:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  AMSMutablePromise *v13;
  AMSMutablePromise *v14;
  void *v15;
  AMSMutablePromise *v16;
  void *v17;
  _QWORD v19[4];
  AMSMutablePromise *v20;
  AMSURLRequestEncoder *v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = objc_alloc_init(AMSMutablePromise);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__AMSURLRequestEncoder_requestWithMethod_bagURL_headers_parameters___block_invoke;
    v19[3] = &unk_1E2546B50;
    v14 = v13;
    v20 = v14;
    v21 = self;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    objc_msgSend(v10, "valueWithCompletion:", v19);
    v15 = v23;
    v16 = v14;

  }
  else
  {
    AMSError(2, CFSTR("URL Encoder Error"), CFSTR("bagURL is nil"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v16 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

void __68__AMSURLRequestEncoder_requestWithMethod_bagURL_headers_parameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "requestWithMethod:URL:headers:parameters:", *(_QWORD *)(a1 + 64), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithPromise:", v5);

  }
}

uint64_t __65__AMSURLRequestEncoder_requestWithMethod_URL_headers_parameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_151 != -1)
    dispatch_once(&_MergedGlobals_151, &__block_literal_global_134);
  return (NSString *)(id)qword_1ECEAD948;
}

void __37__AMSURLRequestEncoder_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD948;
  qword_1ECEAD948 = (uint64_t)CFSTR("AMSCore");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD950 != -1)
    dispatch_once(&qword_1ECEAD950, &__block_literal_global_14_3);
  return (NSString *)(id)qword_1ECEAD958;
}

void __44__AMSURLRequestEncoder_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD958;
  qword_1ECEAD958 = (uint64_t)CFSTR("1");

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

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_25(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add storefront header. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_46(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;

  objc_msgSend(*(id *)(a1 + 32), "_addCookiesToRequest:account:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "promiseAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_47;
  v49[3] = &unk_1E253D820;
  v4 = *(void **)(a1 + 40);
  v49[4] = *(_QWORD *)(a1 + 32);
  v50 = v4;
  objc_msgSend(v2, "continueWithBlock:", v49);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v3;
  v46[1] = 3221225472;
  v46[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_50;
  v46[3] = &unk_1E253D688;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v47 = v6;
  v48 = v7;
  objc_msgSend(v5, "thenWithBlock:", v46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v3;
  v42[1] = 3221225472;
  v42[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_53;
  v42[3] = &unk_1E2546BC0;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v43 = v9;
  v44 = v10;
  v45 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v8, "thenWithBlock:", v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v3;
  v38[1] = 3221225472;
  v38[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_55;
  v38[3] = &unk_1E2546BC0;
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 32);
  v39 = v12;
  v40 = v14;
  v41 = v13;
  objc_msgSend(v11, "thenWithBlock:", v38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  v34[1] = 3221225472;
  v34[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_57;
  v34[3] = &unk_1E2546BC0;
  v16 = *(void **)(a1 + 40);
  v37 = *(_QWORD *)(a1 + 48);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 32);
  v35 = v17;
  v36 = v18;
  objc_msgSend(v15, "thenWithBlock:", v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  v31[1] = 3221225472;
  v31[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_59;
  v31[3] = &unk_1E253D688;
  v20 = *(id *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 32);
  v32 = v20;
  v33 = v21;
  objc_msgSend(v19, "thenWithBlock:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  v28[1] = 3221225472;
  v28[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_61;
  v28[3] = &unk_1E253D688;
  v23 = *(id *)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 32);
  v29 = v23;
  v30 = v24;
  objc_msgSend(v22, "thenWithBlock:", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_47(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to add cookies to request. error = %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v3;
      }

    }
  }
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "treatmentNamespace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addABPayloadHeaderToRequest:forTreatmentNamespace:](AMSURLRequestDecoration, "addABPayloadHeaderToRequest:forTreatmentNamespace:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_48;
  v21[3] = &unk_1E25468F0;
  v21[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "catchWithBlock:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "promiseAdapter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add AB payload header. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "ams_addAcceptLanguageHeader");
  objc_msgSend(*(id *)(a1 + 32), "ams_addCacheBusterParameterWithPreservedQueryEncoding:", objc_msgSend(*(id *)(a1 + 40), "preserveQueryParameterEncoding"));
  objc_msgSend(*(id *)(a1 + 32), "ams_addCachePolicyHeader");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_addClientIdentifierHeaderForClient:", v3);

  if (objc_msgSend(*(id *)(a1 + 40), "includeClientVersions"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "clientInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_addClientVersionsForClient:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "ams_addConnectionTypeHeader");
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addGUIDParameterToRequest:bag:preservingQueryEncoding:](AMSURLRequestDecoration, "addGUIDParameterToRequest:bag:preservingQueryEncoding:", v6, v7, objc_msgSend(*(id *)(a1 + 40), "preserveQueryParameterEncoding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_51;
  v12[3] = &unk_1E25468F0;
  v12[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "catchWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "promiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add GUID parameters. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_53(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  objc_msgSend(*(id *)(a1 + 32), "ams_addIssuingProcessHeader");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_addRequestingProcessWithClient:", v3);

  objc_msgSend(*(id *)(a1 + 32), "ams_addTimezoneOffsetHeader");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_addUserAgentHeaderFromClient:", v5);

  objc_msgSend(*(id *)(a1 + 32), "ams_addForwardedForHeader");
  objc_msgSend(*(id *)(a1 + 40), "groupRequestAccounts");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 40), "groupRequestAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "groupRequestAccounts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ams_addXGroupDSIDsWithPrimaryAccount:andGroupAccounts:", v10, v12);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_personalizeKeychainOptionsForAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v13, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "purchaseInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "buyParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:](AMSURLRequestDecoration, "addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:", v13, v16, v17, objc_msgSend(*(id *)(a1 + 40), "enableRemoteSecuritySigning"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_54;
  v22[3] = &unk_1E25468F0;
  v22[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v18, "catchWithBlock:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "promiseAdapter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Absinthe headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_55(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "anisetteType");
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addAnisetteHeadersToRequest:account:type:bag:](AMSURLRequestDecoration, "addAnisetteHeadersToRequest:account:type:bag:", v3, v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_56;
  v10[3] = &unk_1E25468F0;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "catchWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promiseAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Anisette headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_57(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ams_isEphemeralAccount"))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "promiseAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "keychainOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_addBiometricsHeadersForAccount:options:", v4, v6);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(*(id *)(a1 + 40), "mescalType");
    objc_msgSend(*(id *)(a1 + 40), "bag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSURLRequestDecoration addMescalHeaderToRequest:type:bag:logKey:](AMSURLRequestDecoration, "addMescalHeaderToRequest:type:bag:logKey:", v7, v8, v2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_58;
    v14[3] = &unk_1E25468F0;
    v14[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "catchWithBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "promiseAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Mescal headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_59(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[AMSURLRequestDecoration addPaymentHardwareStatusToRequest:](AMSURLRequestDecoration, "addPaymentHardwareStatusToRequest:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_60;
  v6[3] = &unk_1E25468F0;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "catchWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promiseAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 5) & 1) == 0)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_opt_class();
      v9 = v8;
      if (v6)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
      }
      else
      {
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to add payment hardware status headers. error = %{public}@", buf, 0x16u);
      if (v6)
      {

        v10 = (void *)a1;
      }

    }
  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_61(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_URLBySortingQueryParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setURL:", v3);

  objc_msgSend(*(id *)(a1 + 40), "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_62;
  block[3] = &unk_1E253DBD8;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v4, block);

  if (*(_QWORD *)(a1 + 32))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(300, CFSTR("Request encoding failed"), CFSTR("The request encoder finished with a nil request"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

uint64_t __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEncodeCount:", objc_msgSend(*(id *)(a1 + 32), "encodeCount") + 1);
}

- (id)_addCookiesToRequest:(id)a3 account:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[5];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[AMSURLRequestEncoder shouldSetCookieHeader](self, "shouldSetCookieHeader"))
  {
    if (!v8
      || (objc_msgSend(v8, "ams_isLocalAccount") & 1) != 0
      || objc_msgSend(v8, "ams_isEphemeralAccount"))
    {
      v9 = -[AMSURLRequestEncoder alwaysIncludeAuthKitHeaders](self, "alwaysIncludeAuthKitHeaders");
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (!v9)
      {
        if (!v10)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          AMSLogKey();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x1E0CB3940];
          v28 = objc_opt_class();
          v29 = v28;
          if (v26)
          {
            AMSLogKey();
            v4 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v29, v4);
          }
          else
          {
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v28);
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v8);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v30;
          v46 = 2114;
          v47 = v37;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Request is unpersonalized, adding cookies. account = %{public}@", buf, 0x16u);
          if (v26)
          {

            v30 = (void *)v4;
          }

        }
        -[AMSURLRequestEncoder clientInfo](self, "clientInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSURLRequestEncoder bag](self, "bag");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ams_addCookiesAsynchronouslyForAccount:clientInfo:bag:cleanupGlobalCookies:", v8, v38, v39, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_46;
      }
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        if (!-[AMSURLRequestEncoder excludeIdentifierHeadersForAccount](self, "excludeIdentifierHeadersForAccount"))
          objc_msgSend(v7, "ams_addPrimaryiCloudIdentifierHeader");
        objc_msgSend(v7, "ams_addAuthKitHeaders");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __53__AMSURLRequestEncoder__addCookiesToRequest_account___block_invoke;
        v41[3] = &unk_1E2540E68;
        v41[4] = self;
        v42 = v7;
        v43 = v8;
        objc_msgSend(v38, "continueWithBlock:", v41);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_46:
        goto LABEL_47;
      }
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_opt_class();
      v16 = v15;
      if (v13)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v4);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v17;
      v46 = 2114;
      v47 = v35;
      v36 = "%{public}@Request is unpersonalized, but requested authkit headers and adding cookies. account = %{public}@";
    }
    else
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = objc_opt_class();
      v34 = v33;
      if (v13)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] "), v34, v4);
      }
      else
      {
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: "), v33);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v17;
      v46 = 2114;
      v47 = v35;
      v36 = "%{public}@Request is personalized, adding personalized headers and cookies. account = %{public}@";
    }
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);
    if (v13)
    {

      v17 = (void *)v4;
    }

    goto LABEL_43;
  }
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = objc_opt_class();
    v23 = v22;
    if (v20)
    {
      AMSLogKey();
      self = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, self);
    }
    else
    {
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v24;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Request cookies are disabled. No cookie header will be added.", buf, 0xCu);
    if (v20)
    {

      v24 = self;
    }

  }
  objc_msgSend(v7, "setHTTPShouldHandleCookies:", 0);
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

  return v31;
}

id __53__AMSURLRequestEncoder__addCookiesToRequest_account___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error adding AuthKit headers: %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v3;
      }

    }
  }
  v15 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ams_addCookiesAsynchronouslyForAccount:clientInfo:bag:cleanupGlobalCookies:", v14, v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (AMSURLRequestEncoder)initWithBagContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;
  AMSURLRequestEncoder *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = -[AMSURLRequestEncoder initWithBag:](self, "initWithBag:", v5);

  return v6;
}

- (AMSURLBagContract)bagContract
{
  AMSDeprecatedBagContract *v3;
  void *v4;
  AMSDeprecatedBagContract *v5;

  v3 = [AMSDeprecatedBagContract alloc];
  -[AMSURLRequestEncoder bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSDeprecatedBagContract initWithBag:](v3, "initWithBag:", v4);

  return (AMSURLBagContract *)v5;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](self, "requestByEncodingRequest:parameters:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resultWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setURL:", v12);

    objc_msgSend(v10, "HTTPMethod");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHTTPMethod:", v13);

    objc_msgSend(v10, "HTTPBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v10, "HTTPBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHTTPBody:", v15);

    }
    objc_msgSend(v10, "allHTTPHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__AMSURLRequestEncoder_requestByEncodingRequest_parameters_error___block_invoke;
    v19[3] = &unk_1E25420D0;
    v20 = v11;
    v17 = v11;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
  return v10;
}

uint64_t __66__AMSURLRequestEncoder_requestByEncodingRequest_parameters_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 error:(id *)a5
{
  return -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:error:](self, "requestWithMethod:bagURL:parameters:error:", a3, a4, 0, a5);
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  objc_msgSend(a4, "valueWithError:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder _methodStringFromMethod:](self, "_methodStringFromMethod:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHTTPMethod:", v13);

    -[AMSURLRequestEncoder requestByEncodingRequest:parameters:error:](self, "requestByEncodingRequest:parameters:error:", v12, v10, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543362;
      v20 = (id)objc_opt_class();
      v17 = v20;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Request encoding failed. bagURL returns a nil value.", (uint8_t *)&v19, 0xCu);

    }
    v14 = 0;
  }

  return v14;
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 error:(id *)a5
{
  return -[AMSURLRequestEncoder requestWithMethod:URL:parameters:error:](self, "requestWithMethod:URL:parameters:error:", a3, a4, 0, a5);
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 parameters:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0C92C28];
  v11 = a5;
  objc_msgSend(v10, "requestWithURL:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder _methodStringFromMethod:](self, "_methodStringFromMethod:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPMethod:", v13);

  -[AMSURLRequestEncoder requestByEncodingRequest:parameters:error:](self, "requestByEncodingRequest:parameters:error:", v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)requestWithMethod:(int64_t)a3 URLString:(id)a4 error:(id *)a5
{
  return -[AMSURLRequestEncoder requestWithMethod:URLString:parameters:error:](self, "requestWithMethod:URLString:parameters:error:", a3, a4, 0, a5);
}

- (id)requestWithMethod:(int64_t)a3 URLString:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[AMSURLRequestEncoder requestWithMethod:URL:parameters:error:](self, "requestWithMethod:URL:parameters:error:", a3, v11, v10, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v15 = v18;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Request encoding failed. requestURL = nil.", (uint8_t *)&v17, 0xCu);

    }
    if (a6)
    {
      AMSError(300, CFSTR("Invalid Request"), CFSTR("Request URL is nil"), 0);
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (BOOL)excludeIdentifierHeadersForAccount
{
  return self->_excludeIdentifierHeadersForAccount;
}

- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3
{
  self->_excludeIdentifierHeadersForAccount = a3;
}

- (void)setCompressRequestBody:(BOOL)a3
{
  self->_compressRequestBody = a3;
}

- (void)setEnableRemoteSecuritySigning:(BOOL)a3
{
  self->_enableRemoteSecuritySigning = a3;
}

- (void)setShouldSetCookiesFromResponse:(BOOL)a3
{
  self->_shouldSetCookiesFromResponse = a3;
}

- (void)setShouldSetStorefrontFromResponse:(BOOL)a3
{
  self->_shouldSetStorefrontFromResponse = a3;
}

- (void)setBagContract:(id)a3
{
  objc_storeStrong((id *)&self->_bagContract, a3);
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (os_unfair_recursive_lock_s)propertiesLock
{
  return self->_propertiesLock;
}

- (void)setParentProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)alwaysIncludeAuthKitHeaders
{
  return self->_alwaysIncludeAuthKitHeaders;
}

- (void)setAlwaysIncludeAuthKitHeaders:(BOOL)a3
{
  self->_alwaysIncludeAuthKitHeaders = a3;
}

- (BOOL)alwaysIncludeMMeClientInfoAndDeviceHeaders
{
  return self->_alwaysIncludeMMeClientInfoAndDeviceHeaders;
}

- (void)setAlwaysIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  self->_alwaysIncludeMMeClientInfoAndDeviceHeaders = a3;
}

- (BOOL)shouldSetCookieHeader
{
  return self->_shouldSetCookieHeader;
}

- (void)setShouldSetCookieHeader:(BOOL)a3
{
  self->_shouldSetCookieHeader = a3;
}

@end
