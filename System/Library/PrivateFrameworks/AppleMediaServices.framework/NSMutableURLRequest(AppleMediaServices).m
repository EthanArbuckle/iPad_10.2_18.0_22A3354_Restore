@implementation NSMutableURLRequest(AppleMediaServices)

- (void)ams_addForwardedForHeader
{
  void *v2;
  void *v3;

  +[AMSDefaults forwardedForIPAddress](AMSDefaults, "forwardedForIPAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Forwarded-For"));
    v2 = v3;
  }

}

- (void)ams_addBiometricsHeadersForAccount:()AppleMediaServices options:
{
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  if (a3)
  {
    if (a4)
    {
      +[AMSBiometrics headersWithAccount:options:signatureResult:](AMSBiometrics, "headersWithAccount:options:signatureResult:");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "allHTTPHeaderFields");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __86__NSMutableURLRequest_AppleMediaServices__ams_addBiometricsHeadersForAccount_options___block_invoke;
      v8[3] = &unk_1E25420F8;
      v9 = v5;
      v10 = a1;
      v6 = v5;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

    }
  }
}

- (void)ams_addRequestingProcessWithClient:()AppleMediaServices
{
  void *v4;
  id v5;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-Requesting-Process"));

  }
}

- (uint64_t)ams_addConnectionTypeHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", 0, CFSTR("X-Apple-Connection-Type"));
}

- (void)ams_addClientIdentifierHeaderForClient:()AppleMediaServices
{
  id v4;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-Client-Application"));

}

- (void)ams_addIssuingProcessHeader
{
  void *v2;
  id v3;

  if (os_variant_has_internal_content())
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-Issuing-Process"));

  }
}

- (id)ams_addCookiesAsynchronouslyForAccount:()AppleMediaServices clientInfo:bag:cleanupGlobalCookies:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v54;
  const char *v55;
  uint64_t v56;
  id v57;
  char v58;
  void *v59;
  _QWORD v60[5];
  id v61;
  const char *v62;
  char v63;
  _QWORD v64[5];
  _QWORD v65[5];
  id v66;
  _QWORD v67[2];
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(a1, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v11;
  if (v14)
  {
    v15 = MEMORY[0x1E0C809B0];
    v58 = a6;
    if (v11 && objc_msgSend(v11, "ams_isEphemeralAccount"))
    {
      v73[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForProcessInfo:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v16 = v18;
        objc_msgSend(v18, "ams_mediaType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v15;
        v65[1] = 3221225472;
        v65[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke;
        v65[3] = &unk_1E253EAC0;
        v65[4] = a1;
        v66 = v11;
        objc_msgSend(v20, "continueWithBlock:", v65);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v54 = a2;
          AMSLogKey();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0CB3940];
          v33 = objc_opt_class();
          v34 = v33;
          if (v31)
          {
            AMSLogKey();
            v56 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] "), v34, v56);
          }
          else
          {
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: "), v33);
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "URL");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v70 = v35;
          v71 = 2114;
          v72 = v38;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@No account store was available. No local account cookies will be added to this request. URL = %{public}@", buf, 0x16u);

          if (v31)
          {

            v35 = (void *)v56;
          }

          a2 = v54;
          v15 = MEMORY[0x1E0C809B0];
        }

        if (v11)
        {
          v68 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v39);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA60]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v16 = 0;
      }
    }
    v57 = v12;

    objc_msgSend(v13, "arrayForKey:", 0x1E254CD40);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "valuePromise");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v15;
    v64[1] = 3221225472;
    v64[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_90;
    v64[3] = &unk_1E2547C28;
    v64[4] = a1;
    objc_msgSend(v41, "continueWithBlock:", v64);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v43, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v55 = a2;
        AMSLogKey();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0CB3940];
        v47 = objc_opt_class();
        v48 = v47;
        if (v45)
        {
          AMSLogKey();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("%@: [%@] "), v48, v12);
        }
        else
        {
          objc_msgSend(v46, "stringWithFormat:", CFSTR("%@: "), v47);
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v49;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@No bag was provided. Defaulting to not applying analytics cookies.", buf, 0xCu);
        if (v45)
        {

          v49 = v12;
        }

        a2 = v55;
      }

      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAA0]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
    }
    v67[0] = v17;
    v67[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v15;
    v60[1] = 3221225472;
    v60[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_94;
    v60[3] = &unk_1E2547C98;
    v60[4] = a1;
    v62 = a2;
    v61 = v13;
    v63 = v58;
    objc_msgSend(v51, "thenWithBlock:", v60);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "binaryPromiseAdapter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v57;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = a2;
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = objc_opt_class();
      if (v24)
      {
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v23);
        v23 = (const char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v26, v27, v23);
      }
      else
      {
        NSStringFromSelector(v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: %@ "), v26, v27);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v28;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@URL is nil, can’t add cookies.", buf, 0xCu);
      if (v24)
      {

        v28 = (void *)v23;
      }

    }
    AMSError(2, CFSTR("Can't add cookies as request doesn't have a URL."), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

- (uint64_t)ams_setBodyParameters:()AppleMediaServices encoding:compressBody:error:
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (a4)
    v12 = a4;
  else
    v12 = 2;
  if (!v10)
  {
    if (a6)
    {
      v20 = CFSTR("Invalid Parameters");
      v21 = CFSTR("Parameters must not be nil");
      v22 = 2;
LABEL_15:
      AMSError(v22, v20, v21, 0);
      v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
LABEL_43:
    v23 = 0;
    goto LABEL_46;
  }
  objc_msgSend(a1, "HTTPMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("POST")) & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(a1, "HTTPMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PATCH")))
  {

    goto LABEL_8;
  }
  objc_msgSend(a1, "HTTPMethod");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("PUT"));

  if ((v34 & 1) != 0)
  {
LABEL_9:
    v44 = 0;
    +[AMSData dataWithObject:encoding:error:](AMSData, "dataWithObject:encoding:error:", v11, v12, &v44);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v44;
    v17 = v16;
    if (v15)
    {
      if (!a5)
      {
        objc_msgSend(a1, "setHTTPBody:", v15);
        goto LABEL_25;
      }
      +[AMSData compressedGzippedDataWithData:](AMSData, "compressedGzippedDataWithData:", v15);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(a1, "setHTTPBody:", v18);
        objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));

LABEL_25:
        objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          objc_msgSend(a1, "ams_addContentTypeHeaderForEncoding:", v12);
        objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("Content-Length"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
        {
          objc_msgSend(a1, "HTTPBody");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "ams_addContentLengthHeaderForData:", v32);

        }
        v23 = 1;
        goto LABEL_30;
      }
      if (a6)
      {
        AMSError(3, CFSTR("Failed to GZip-encode request body"), CFSTR("Failed to GZip-encode request body"), 0);
        v23 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
    }
    else
    {
      if (a6)
        *a6 = objc_retainAutorelease(v16);
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        v27 = v26;
        AMSLogKey();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v17);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v26;
        v47 = 2114;
        v48 = v28;
        v49 = 2114;
        v50 = v29;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode data from parameters. Error: %{public}@", buf, 0x20u);

      }
    }
    v23 = 0;
LABEL_30:

    goto LABEL_46;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v37, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_opt_class();
      v40 = v39;
      AMSLogKey();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      v47 = 2114;
      v48 = v41;
      _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Only dictionaries are supported for query parameters;",
        buf,
        0x16u);

    }
    if (a6)
    {
      v20 = CFSTR("Invalid Query Parameters");
      v21 = CFSTR("Query parameters must be dictionary format");
      v22 = 300;
      goto LABEL_15;
    }
    goto LABEL_43;
  }
  objc_msgSend(a1, "URL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "ams_URLByAppendingQueryParameters:", v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(a1, "setURL:", v36);
  }
  else
  {
    objc_msgSend(a1, "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setURL:", v42);

  }
  v23 = 1;
LABEL_46:

  return v23;
}

- (void)ams_addGSTokenForAccount:()AppleMediaServices identifier:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    v8 = a3;
    objc_msgSend(a1, "ams_addMMeClientInfoAndDeviceHeaders");
    objc_msgSend(v8, "accountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v8, v7, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v18;
    if (v11 || !v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v14;
        v21 = 2114;
        v22 = v16;
        v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch GrandSlam token. %{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-GS-Token"));
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-GS-Token-Identifier"));

  }
}

- (uint64_t)ams_addContentTypeHeaderForEncoding:()AppleMediaServices
{
  uint64_t v3;

  if (a3 > 4)
    v3 = 0;
  else
    v3 = (uint64_t)*(&off_1E2547D58 + a3);
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", v3, CFSTR("Content-Type"));
}

- (void)ams_addContentLengthHeaderForData:()AppleMediaServices
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("Content-Length"));

}

- (void)ams_addUserAgentHeaderFromClient:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (!v4)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v4;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "length"))
  {
    +[AMSUserAgent userAgentForProcessInfo:](AMSUserAgent, "userAgentForProcessInfo:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("User-Agent"));

  }
}

- (void)ams_addIdentifierHeadersForAccount:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "ams_DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-DSID"));

  objc_msgSend(v4, "ams_altDSID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-ADSID"));
}

- (void)ams_addAcceptLanguageHeader
{
  id v2;

  +[AMSDevice language](AMSDevice, "language");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("Accept-Language"));

}

- (uint64_t)ams_addCachePolicyHeader
{
  uint64_t result;
  unint64_t v3;
  const __CFString *v4;

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "cachePolicy");
    if (v3 > 5)
      v4 = CFSTR("Unknown");
    else
      v4 = *(&off_1E2547D28 + v3);
    return objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-NSURLCachePolicy"));
  }
  return result;
}

- (void)ams_addTimezoneOffsetHeader
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "secondsFromGMT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-Tz"));

}

- (void)_ams_replaceCookies:()AppleMediaServices
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "setHTTPShouldHandleCookies:", 0);
  objc_msgSend(MEMORY[0x1E0C92C00], "requestHeaderFieldsWithCookies:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ams_addHeaders:", v5);
}

- (uint64_t)ams_addHeaders:()AppleMediaServices
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__NSMutableURLRequest_AppleMediaServices__ams_addHeaders___block_invoke;
  v4[3] = &unk_1E25420D0;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)ams_addCacheBusterParameterWithPreservedQueryEncoding:()AppleMediaServices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if ((a3 & 1) == 0)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Music")))
    {

    }
    else
    {
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.TVMusic"));

      if (!v8)
      {
        objc_msgSend(a1, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ams_parameters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v10, "mutableCopy");
        if (!v21)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v12 = 0;
          v13 = 0;
          goto LABEL_9;
        }
        v12 = v21;
        v13 = 0;
        goto LABEL_7;
      }
    }
  }
  objc_msgSend(a1, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_unmodifiedParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  if (!v11)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = 0;
    v13 = 1;
    goto LABEL_9;
  }
  v12 = v11;
  v13 = 1;
LABEL_7:
  v22 = v12;
LABEL_9:

  v14 = +[AMSDefaults alwaysSendCacheBuster](AMSDefaults, "alwaysSendCacheBuster");
  v15 = v22;
  if (v14)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("buster"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v22;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("buster"));
      objc_msgSend(a1, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ams_URLByReplaceingQueryParameters:withEncodedParameters:", v22, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "setURL:", v20);
      v15 = v22;
    }
  }

}

- (void)ams_addClientVersionsForClient:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AMSProcessInfo *v19;
  void *v20;
  AMSProcessInfo *v21;
  __CFString *v22;
  double v23;
  id v24;

  v24 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v24, "proxyAppBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v24, "proxyAppBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v24, "mappedBundleInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v24, "mappedBundleInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  objc_msgSend(v24, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v24, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0;
    while (v13 < objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E25B02A8, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v24, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "compare:options:", v14, 1);

        if (v18)
          v19 = -[AMSProcessInfo initWithBundleIdentifier:]([AMSProcessInfo alloc], "initWithBundleIdentifier:", v14);
        else
          v19 = (AMSProcessInfo *)v24;
        v21 = v19;
        -[AMSProcessInfo clientVersion](v19, "clientVersion");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString doubleValue](v22, "doubleValue");
        if (v23 == 0.0)
        {

          v22 = CFSTR("??");
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v16, v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
      ++v13;

      if (v20)
        goto LABEL_21;
    }
    v20 = 0;
LABEL_21:
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v20, CFSTR("X-Apple-Client-Versions"));

  }
}

- (void)ams_addPrimaryiCloudIdentifierHeader
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiCloudAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "longLongValue"))
  {
    objc_msgSend(v3, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("iCloud-DSID"));

  }
}

- (id)ams_addAuthKitHeaders
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "_ams_authKitHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__NSMutableURLRequest_AppleMediaServices__ams_addAuthKitHeaders__block_invoke;
  v5[3] = &unk_1E2547C00;
  v5[4] = a1;
  objc_msgSend(v2, "addSuccessBlock:", v5);
  objc_msgSend(v2, "binaryPromiseAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)ams_addAuthorizationHeaderForAccount:()AppleMediaServices
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a3;
    objc_msgSend(v5, "aa_personID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_authToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("Authorization"));
  }
}

- (uint64_t)ams_addCookiesForAccount:()AppleMediaServices clientInfo:bag:
{
  return objc_msgSend(a1, "ams_addCookiesForAccount:clientInfo:bag:cleanupGlobalCookies:", a3, a4, a5, 0);
}

- (void)ams_addCookiesForAccount:()AppleMediaServices clientInfo:bag:cleanupGlobalCookies:
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v1 = (uint64_t)a1;
  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ams_addCookiesAsynchronouslyForAccount:clientInfo:bag:cleanupGlobalCookies:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "resultWithError:", &v12);
  v3 = v12;

  if (v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v1);
      }
      else
      {
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to synchronously add cookies for account. error = %{public}@", buf, 0x16u);
      if (v6)
      {

        v10 = (void *)v1;
      }

    }
  }

}

- (void)ams_addMMeClientInfoAndDeviceHeaders
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CFAC38], "currentInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfoHeader");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  +[AMSDevice uniqueDeviceId](AMSDevice, "uniqueDeviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-MMe-Client-Info"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v3, CFSTR("X-Mme-Device-Id"));

}

- (void)ams_addSilentEnrollmentHeadersForAccount:()AppleMediaServices
{
  id v2;
  _QWORD v3[5];

  +[AMSAppleCardSilentEnrollment headersForAccount:](AMSAppleCardSilentEnrollment, "headersForAccount:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__NSMutableURLRequest_AppleMediaServices__ams_addSilentEnrollmentHeadersForAccount___block_invoke;
  v3[3] = &unk_1E25420D0;
  v3[4] = a1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

- (void)ams_addXTokenHeaderWithAccount:()AppleMediaServices
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_secureTokenForAccount:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v5, CFSTR("X-Token"));

    }
  }

}

- (void)ams_addXGroupDSIDsWithPrimaryAccount:()AppleMediaServices andGroupAccounts:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSMutableSet setWithHashBlock:](AMSMutableSet, "setWithHashBlock:", &__block_literal_global_121);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v7;
  objc_msgSend(v8, "addObjectsFromArray:", v7);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = v6;
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v12;
    v45 = 2114;
    v46 = v14;
    v47 = 2048;
    v48 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding Group DSIDs for %lu accounts", buf, 0x20u);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v20, "ams_DSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "length"))
        {
          objc_msgSend(v9, "appendFormat:", CFSTR("%@; "), v22);
          objc_msgSend(v20, "ams_cookies");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_ams_addCookies:", v23);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v17);
  }

  if (v37)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_opt_class();
      v27 = v26;
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v26;
      v45 = 2114;
      v46 = v28;
      v47 = 2112;
      v48 = (uint64_t)v29;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding DSID to group list for primary account: %@", buf, 0x20u);

    }
    objc_msgSend(v37, "ams_cookies");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_ams_addCookies:", v30);

  }
  if (objc_msgSend(v9, "length"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v31, "OSLogObject");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_opt_class();
      v34 = v33;
      AMSLogKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v33;
      v45 = 2114;
      v46 = v35;
      v47 = 2112;
      v48 = (uint64_t)v9;
      _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Group DSIDs list: %@", buf, 0x20u);

    }
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Group-DSIDs"));
  }

}

- (uint64_t)ams_removeAnisetteHeaders
{
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", 0, CFSTR("X-Apple-AMD-M"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", 0, CFSTR("X-Apple-MD-M"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", 0, CFSTR("X-Apple-AMD"));
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", 0, CFSTR("X-Apple-MD"));
}

- (id)ams_addHeadersFromPromise:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "_ams_promiseSerialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke;
  v9[3] = &unk_1E2547CE0;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "runBinaryPromiseBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ams_modifyRequestWithBlock:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "_ams_promiseSerialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__NSMutableURLRequest_AppleMediaServices__ams_modifyRequestWithBlock___block_invoke;
  v9[3] = &unk_1E2547D08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "runBinaryPromiseBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AMSMutablePromise)_ams_authKitHeaders
{
  AMSMutablePromise *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(AMSMutablePromise);
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "urlRequest");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  +[AMSURLSession sharedAuthKitSession](AMSURLSession, "sharedAuthKitSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v2, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleIDHeadersForRequest:completion:", v3, v6);

  return v2;
}

- (AMSPromiseSerialQueue)_ams_promiseSerialQueue
{
  id v1;
  AMSPromiseSerialQueue *v2;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &_ams_promiseSerialQueue_queueKey);
  v2 = (AMSPromiseSerialQueue *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AMSPromiseSerialQueue);
    objc_setAssociatedObject(v1, &_ams_promiseSerialQueue_queueKey, v2, (void *)1);
  }
  objc_sync_exit(v1);

  return v2;
}

- (void)_ams_addCookies:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "ams_cookies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v18 = v4;
  objc_msgSend(a1, "_ams_separateCookies:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("%@=%@; "), v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

  v23 = CFSTR("Cookie");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ams_addHeaders:", v17);
}

- (id)_ams_separateCookies:()AppleMediaServices
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C92C00], "requestHeaderFieldsWithCookies:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Cookie"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v0, "componentsSeparatedByString:", CFSTR(";"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "rangeOfString:", CFSTR("="));
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v9;
          v11 = v9 + 1;
          v12 = objc_msgSend(v8, "length");
          if (v10)
            v13 = v11 >= v12;
          else
            v13 = 1;
          if (!v13)
          {
            objc_msgSend(v8, "substringToIndex:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "substringFromIndex:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v14);

          }
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }
  v16 = (void *)objc_msgSend(v19, "copy");

  return v16;
}

@end
