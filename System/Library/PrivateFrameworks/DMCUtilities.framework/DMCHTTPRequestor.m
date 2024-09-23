@implementation DMCHTTPRequestor

- (void)startWithRequest:(id)a3 username:(id)a4 password:(id)a5 anchorCertificateRefs:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  DMCHTTPRequestor *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  DMCHTTPRequestor *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  DMCHTTPRequestor *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  DMCHTTPRequestor *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  -[DMCHTTPRequestor setUsername:](self, "setUsername:", a4);
  -[DMCHTTPRequestor setPassword:](self, "setPassword:", v15);

  -[DMCHTTPRequestor setAnchorCertificateRefs:](self, "setAnchorCertificateRefs:", v14);
  -[DMCHTTPRequestor setSelfReference:](self, "setSelfReference:", self);
  -[DMCHTTPRequestor setDidFailDueToMissingCredentials:](self, "setDidFailDueToMissingCredentials:", 0);
  -[DMCHTTPRequestor setDidFailDueToCertNotTrusted:](self, "setDidFailDueToCertNotTrusted:", 0);
  objc_msgSend(v12, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("DeviceManagementClient/1.0"), CFSTR("User-Agent"));
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRequestCachePolicy:", 1);
  objc_msgSend(v17, "setTimeoutIntervalForRequest:", 90.0);
  objc_msgSend(v17, "setTLSMinimumSupportedProtocolVersion:", 771);
  -[DMCHTTPRequestor authenticator](self, "authenticator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[DMCHTTPRequestor authenticator](self, "authenticator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v20 = objc_msgSend(v19, "authenticateRequest:error:", v12, &v41);
    v21 = (DMCHTTPRequestor *)v41;

    if ((v20 & 1) == 0)
    {
      v22 = *DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_1A4951000, v22, OS_LOG_TYPE_ERROR, "Failed to authenticate request with error: %{public}@", buf, 0xCu);
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v17, self, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __93__DMCHTTPRequestor_startWithRequest_username_password_anchorCertificateRefs_completionBlock___block_invoke;
  v37[3] = &unk_1E4D375D0;
  v24 = v12;
  v38 = v24;
  v39 = self;
  v25 = v13;
  v40 = v25;
  objc_msgSend(v23, "dataTaskWithRequest:completionHandler:", v24, v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCHTTPRequestor authenticator](self, "authenticator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    -[DMCHTTPRequestor authenticator](self, "authenticator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v30 = objc_msgSend(v29, "prepareTask:error:", v26, &v36);
    v31 = (DMCHTTPRequestor *)v36;

    if ((v30 & 1) == 0)
    {
      v32 = *DMCLogObjects();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v31;
        _os_log_impl(&dword_1A4951000, v32, OS_LOG_TYPE_ERROR, "Failed to prepare task with error: %{public}@", buf, 0xCu);
      }
    }

  }
  v33 = *DMCLogObjects();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = v33;
    objc_msgSend(v24, "URL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = self;
    v44 = 2114;
    v45 = v35;
    _os_log_impl(&dword_1A4951000, v34, OS_LOG_TYPE_INFO, "%{public}@ Starting request to %{public}@", buf, 0x16u);

  }
  objc_msgSend(v26, "resume");

}

void __93__DMCHTTPRequestor_startWithRequest_username_password_anchorCertificateRefs_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  objc_class *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[DMCHTTPLog logHTTPDetailsForIdentifier:request:response:responseData:responseError:](DMCHTTPLog, "logHTTPDetailsForIdentifier:request:response:responseData:responseError:", CFSTR("Logs"), *(_QWORD *)(a1 + 32), v8, v7, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  v12 = v11;
  if (v11
    && objc_msgSend(v11, "statusCode") == 403
    && (objc_msgSend(v12, "MIMEType"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("application/json")),
        v13,
        v14))
  {
    +[DMCHTTPRequestor jsonDictFromResponse:](DMCHTTPRequestor, "jsonDictFromResponse:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v57 = v9;
      +[DMCHTTPRequestor parse403ErrorWithResponseDictionary:outError:](DMCHTTPRequestor, "parse403ErrorWithResponseDictionary:outError:", v15, &v57);
      v16 = v57;

      v9 = v16;
    }
    else
    {
      v56 = *DMCLogObjects();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v56, OS_LOG_TYPE_DEBUG, "Response from server could not be deserialized.", buf, 2u);
      }
    }

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "didFailDueToMissingCredentials"))
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("HTTP_INVALID_USERNAME_PASSWORD"), v17, v18, v19, v20, v21, v22, v23, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23003, v25, v9, CFSTR("DMCFatalError"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v12, "statusCode") == 401)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "length"))
        {
          objc_msgSend(v26, "userInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v30, "mutableCopy");

          objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, CFSTR("loginPrompt"));
          v32 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v26, "domain");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, objc_msgSend(v26, "code"), v31);
          v34 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v34;
        }

      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "didFailDueToCertNotTrusted"))
        goto LABEL_18;
      v35 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      DMCErrorArray(CFSTR("HTTP_ERROR_INVALID_SERVER_CERT_P_URL_%@"), v37, v38, v39, v40, v41, v42, v43, v36);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23002, v44, CFSTR("DMCFatalError"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = v26;
  }
LABEL_18:
  v45 = *DMCLogObjects();
  if (v9)
  {
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v46 = *(void **)(a1 + 40);
    v47 = v45;
    objc_msgSend(v9, "DMCVerboseDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v46;
    v60 = 2114;
    v61 = (uint64_t)v48;
    _os_log_impl(&dword_1A4951000, v47, OS_LOG_TYPE_ERROR, "%{public}@ failed to communicate with the MDM server. Error: %{public}@", buf, 0x16u);

    goto LABEL_25;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v49 = (objc_class *)MEMORY[0x1E0CB3940];
    v50 = v45;
    v51 = (void *)objc_msgSend([v49 alloc], "initWithData:encoding:", v7, 4);
    *(_DWORD *)buf = 138543362;
    v59 = v51;
    _os_log_impl(&dword_1A4951000, v50, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);

  }
  v52 = *DMCLogObjects();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    v53 = *(void **)(a1 + 40);
    v47 = v52;
    v54 = objc_msgSend(v7, "length");
    *(_DWORD *)buf = 138543618;
    v59 = v53;
    v60 = 2048;
    v61 = v54;
    _os_log_impl(&dword_1A4951000, v47, OS_LOG_TYPE_INFO, "%{public}@ finished communicating. Received %lu bytes.", buf, 0x16u);
LABEL_25:

  }
LABEL_26:
  v55 = *(_QWORD *)(a1 + 48);
  if (v55)
    (*(void (**)(uint64_t, id, id, id))(v55 + 16))(v55, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 40), "setSelfReference:", 0);

}

+ (id)_getServerErrorMessageFromResponseDictionary:(id)a3
{
  void *v3;
  __CFString *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Server response did not contain message key.", v7, 2u);
    }
    v4 = &stru_1E4D38200;
  }

  return v4;
}

+ (id)_getServerErrorCodeFromResponseDictionary:(id)a3
{
  void *v3;
  __CFString *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Server response did not contain error key.", v7, 2u);
    }
    v4 = &stru_1E4D38200;
  }

  return v4;
}

+ (id)_getServerErrorDetailsFromResponseDictionary:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("details"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Server response did not contain error details.", v7, 2u);
    }
    v4 = (id)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

+ (id)jsonDictFromResponse:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dmc_jsonDictionaryFromData:", a3);
}

+ (BOOL)parse403ErrorWithResponseDictionary:(id)a3 outError:(id *)a4
{
  id v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v5 = a3;
  if (!+[DMCHTTPRequestor parsePredefined403ErrorWithResponseDictionary:outError:](DMCHTTPRequestor, "parsePredefined403ErrorWithResponseDictionary:outError:", v5, a4))
  {
    +[DMCHTTPRequestor _getServerErrorMessageFromResponseDictionary:](DMCHTTPRequestor, "_getServerErrorMessageFromResponseDictionary:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if (!a4)
      {
        v6 = 1;
        goto LABEL_12;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("HTTP_ERROR_403_RESPONSE_FROM_SERVER_WITH_MESSAGE_%@"), v8, v9, v10, v11, v12, v13, v14, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23004, v16, CFSTR("DMCFatalError"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[DMCHTTPRequestor _getServerErrorCodeFromResponseDictionary:](DMCHTTPRequestor, "_getServerErrorCodeFromResponseDictionary:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");
      v6 = v17 != 0;
      if (!a4 || !v17)
        goto LABEL_10;
      v25 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("HTTP_ERROR_403_RESPONSE_FROM_SERVER_NO_MESSAGE_%@"), v18, v19, v20, v21, v22, v23, v24, v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23005, v26, CFSTR("DMCFatalError"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = 1;
LABEL_10:

LABEL_12:
    goto LABEL_13;
  }
  v6 = 1;
LABEL_13:

  return v6;
}

+ (BOOL)parsePredefined403ErrorWithResponseDictionary:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend(a1, "_getServerErrorCodeFromResponseDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getServerErrorMessageFromResponseDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getServerErrorDetailsFromResponseDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.softwareupdate.required")))
  {
    v10 = objc_msgSend(a1, "_parseSoftwareUpdateRequiredErrorWithMessage:details:outError:", v8, v9, a4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.watch.pairing.token.missing")))
  {
    v10 = objc_msgSend(a1, "_parsePairingTokenMissingErrorWithMessage:details:outError:", v8, v9, a4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.unrecognized.device")))
  {
    v10 = objc_msgSend(a1, "_parseUnrecognizedDeviceErrorWithMessage:details:outError:", v8, v9, a4);
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.well-known.failed")))
    {
      v11 = 0;
      goto LABEL_10;
    }
    v10 = objc_msgSend(a1, "_parseWellKnownFailedErrorWithMessage:details:outError:", v8, v9, a4);
  }
  v11 = v10;
LABEL_10:

  return v11;
}

+ (BOOL)_parsePairingTokenMissingErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  uint8_t buf[8];
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("security-token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "length");
  if (v16)
  {
    if (a5)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("HTTP_ERROR_403_RESPONSE_PAIRING_TOKEN_MISSING_%@"), v9, v10, v11, v12, v13, v14, v15, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("PairingParameters");
      v25[0] = CFSTR("SecurityToken");
      v25[1] = CFSTR("WatchUDID");
      v26[0] = v8;
      +[DMCMobileGestalt deviceUDID](DMCMobileGestalt, "deviceUDID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:addtionalUserInfo:", CFSTR("DMCHTTPTransactionErrorDomain"), 23007, v17, 0, 0, 0, CFSTR("DMCFatalError"), v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21 = *DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v21, OS_LOG_TYPE_ERROR, "Response from server does not contain security-token key.", buf, 2u);
    }
  }

  return v16 != 0;
}

+ (BOOL)_parseSoftwareUpdateRequiredErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OSVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("OSVersion"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("BuildVersion"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("SoftwareUpdateInfo"));
    if (a5)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("HTTP_ERROR_403_RESPONSE_SOFTWARE_UPDATE_REQUIRED"), v11, v12, v13, v14, v15, v16, v17, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:addtionalUserInfo:", CFSTR("DMCHTTPTransactionErrorDomain"), 23006, v19, 0, 0, 0, CFSTR("DMCFatalError"), v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21 = *DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v21, OS_LOG_TYPE_ERROR, "Response from server does not contain OSVersion key.", buf, 2u);
    }
  }

  return v8 != 0;
}

+ (BOOL)_parseUnrecognizedDeviceErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;

  if (a5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    DMCErrorArray(CFSTR("HTTP_ERROR_403_RESPONSE_UNRECOGNIZED_DEVICE"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23008, v10, 0, 0, 0, CFSTR("DMCFatalError"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

+ (BOOL)_parseWellKnownFailedErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v7 = a3;
  v15 = a4;
  if (a5)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    if (v7)
      DMCUnformattedErrorArray(v7, v8, v9, v10, v11, v12, v13, v14, 0);
    else
      DMCErrorArray(CFSTR("HTTP_ERROR_403_RESPONSE_WELLKNOWN_FAILED"), v8, v9, v10, v11, v12, v13, v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23009, v17, 0, 0, 0, CFSTR("DMCFatalError"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  DMCHTTPRequestor *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __SecTrust *v16;
  NSObject *v17;
  const __CFArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  CFStringRef v23;
  DMCHTTPRequestor *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  const __CFArray *v28;
  OSStatus v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint32_t v36;
  NSObject *v37;
  OSStatus v38;
  OSStatus v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CFStringRef v45;
  NSObject *v46;
  NSObject *v47;
  __SecTrust *trust;
  DMCHTTPRequestor *v49;
  void (**v50)(id, uint64_t, _QWORD);
  CFErrorRef error;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  DMCHTTPRequestor *v57;
  __int16 v58;
  DMCHTTPRequestor *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(v8, "protectionSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticationMethod");
  v11 = (DMCHTTPRequestor *)objc_claimAutoreleasedReturnValue();

  v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v57 = v11;
    _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_INFO, "Handling challenge for protection space %{public}@", buf, 0xCu);
  }
  if (objc_msgSend(v8, "previousFailureCount") < 1)
  {
    if (-[DMCHTTPRequestor isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0CB32C8]))
    {
      objc_msgSend(v8, "protectionSpace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (__SecTrust *)objc_msgSend(v15, "serverTrust");

      if (!v16)
        goto LABEL_48;
      v49 = self;
      v50 = v9;
      v17 = *DMCLogObjects();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v17, OS_LOG_TYPE_DEBUG, "Server Trust certificates:", buf, 2u);
      }
      trust = v16;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v18 = SecTrustCopyCertificateChain(v16);
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v53 != v21)
              objc_enumerationMutation(v18);
            v23 = SecCertificateCopySubjectSummary(*(SecCertificateRef *)(*((_QWORD *)&v52 + 1) + 8 * i));
            if (v23)
            {
              v24 = (DMCHTTPRequestor *)v23;
              v25 = *DMCLogObjects();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v57 = v24;
                _os_log_impl(&dword_1A4951000, v25, OS_LOG_TYPE_DEBUG, "  %{public}@", buf, 0xCu);
              }
              CFRelease(v24);
            }
          }
          v20 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v20);
      }

      self = v49;
      -[DMCHTTPRequestor anchorCertificateRefs](v49, "anchorCertificateRefs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      v9 = v50;
      if (v27)
      {
        -[DMCHTTPRequestor anchorCertificateRefs](v49, "anchorCertificateRefs");
        v28 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
        v29 = SecTrustSetAnchorCertificates(trust, v28);

        if (v29)
        {
          v30 = *DMCLogObjects();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v57) = v29;
            v31 = "Could not set anchor certificates for trust evaluation. Status: %d";
LABEL_39:
            _os_log_impl(&dword_1A4951000, v30, OS_LOG_TYPE_ERROR, v31, buf, 8u);
            goto LABEL_47;
          }
          goto LABEL_47;
        }
        v38 = SecTrustSetAnchorCertificatesOnly(trust, 1u);
        if (v38)
        {
          v39 = v38;
          v30 = *DMCLogObjects();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v57) = v39;
            v31 = "Could not use exclude system default anchor certificates for trust evaluation. Status: %d";
            goto LABEL_39;
          }
LABEL_47:

LABEL_48:
          v47 = *DMCLogObjects();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v33 = "Rejecting server trust. Canceling.";
            v34 = v47;
            v35 = OS_LOG_TYPE_INFO;
            goto LABEL_50;
          }
LABEL_52:
          v9[2](v9, 2, 0);
          goto LABEL_53;
        }
      }
      error = 0;
      if (!SecTrustEvaluateWithError(trust, &error))
      {
        v45 = CFErrorCopyDescription(error);
        v46 = *DMCLogObjects();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = (DMCHTTPRequestor *)v45;
          _os_log_impl(&dword_1A4951000, v46, OS_LOG_TYPE_ERROR, "Handle challenge, trust evaluation failed: %{public}@", buf, 0xCu);
        }
        -[DMCHTTPRequestor setDidFailDueToCertNotTrusted:](v49, "setDidFailDueToCertNotTrusted:", 1);
        CFRelease(v45);
        CFRelease(error);
        goto LABEL_47;
      }

      v40 = *DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v40, OS_LOG_TYPE_INFO, "Accepting server trust.", buf, 2u);
      }
    }
    else if ((-[DMCHTTPRequestor isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0CB32C0]) & 1) == 0
           && !-[DMCHTTPRequestor isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0CB32B8]))
    {
      v32 = *DMCLogObjects();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v57 = self;
        v58 = 2114;
        v59 = v11;
        v33 = "%{public}@ cannot accept the authentication method %{public}@";
        v34 = v32;
        v35 = OS_LOG_TYPE_ERROR;
        v36 = 22;
LABEL_51:
        _os_log_impl(&dword_1A4951000, v34, v35, v33, buf, v36);
        goto LABEL_52;
      }
      goto LABEL_52;
    }
    v41 = (void *)MEMORY[0x1E0CB39A8];
    -[DMCHTTPRequestor username](self, "username");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCHTTPRequestor password](self, "password");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "credentialWithUser:password:persistence:", v42, v43, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v44);
    goto LABEL_53;
  }
  v13 = *DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "We have failed too many times.", buf, 2u);
  }
  if ((-[DMCHTTPRequestor isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0CB32C0]) & 1) == 0
    && !-[DMCHTTPRequestor isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0CB32B8]))
  {
    v37 = *DMCLogObjects();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v33 = "Canceling the authentication challenge...";
      v34 = v37;
      v35 = OS_LOG_TYPE_DEBUG;
LABEL_50:
      v36 = 2;
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  -[DMCHTTPRequestor setDidFailDueToMissingCredentials:](self, "setDidFailDueToMissingCredentials:", 1);
  v14 = *DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_DEBUG, "Continue without credential for authentication challenge...", buf, 2u);
  }
  v9[2](v9, 0, 0);
LABEL_53:

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)anchorCertificateRefs
{
  return self->_anchorCertificateRefs;
}

- (void)setAnchorCertificateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_anchorCertificateRefs, a3);
}

- (id)selfReference
{
  return self->_selfReference;
}

- (void)setSelfReference:(id)a3
{
  objc_storeStrong(&self->_selfReference, a3);
}

- (BOOL)didFailDueToMissingCredentials
{
  return self->_didFailDueToMissingCredentials;
}

- (void)setDidFailDueToMissingCredentials:(BOOL)a3
{
  self->_didFailDueToMissingCredentials = a3;
}

- (BOOL)didFailDueToCertNotTrusted
{
  return self->_didFailDueToCertNotTrusted;
}

- (void)setDidFailDueToCertNotTrusted:(BOOL)a3
{
  self->_didFailDueToCertNotTrusted = a3;
}

- (DMCHTTPAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_authenticator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong(&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_anchorCertificateRefs, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
