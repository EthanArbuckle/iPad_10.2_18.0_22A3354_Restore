@implementation NSError(HKOAuth2)

+ (uint64_t)hk_OAuth2_error:()HKOAuth2
{
  return objc_msgSend(a1, "hk_OAuth2_error:underlyingError:", a3, 0);
}

+ (uint64_t)hk_OAuth2_error:()HKOAuth2 underlyingError:
{
  return objc_msgSend(a1, "_hk_OAuth2_error:userInfo:underlyingError:", a3, 0, a4);
}

+ (id)_hk_OAuth2_error:()HKOAuth2 userInfo:underlyingError:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;

  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;

  v13 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v13);
  }
  else
  {
    objc_msgSend(a1, "_hk_OAuth2_defaultDescriptionForErrorCode:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v13);

  }
  v16 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (id)v17;
  else
    v19 = v8;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v16);

  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit.private.oauth2"), a3, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (const)_hk_OAuth2_defaultDescriptionForErrorCode:()HKOAuth2
{
  if (a3 > 0xD)
    return CFSTR("The request is missing a required parameter, includes an invalid parameter value, includes a parameter more than once, or is otherwise malformed.");
  else
    return off_1E37F4948[a3];
}

+ (id)hk_OAuth2_errorFromErrorValue:()HKOAuth2
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("invalid_request")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("invalid_client")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("invalid_grant")) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("unauthorized_client")) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("access_denied")) & 1) != 0)
  {
    v5 = 7;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("unsupported_response_type")) & 1) != 0)
  {
    v5 = 10;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("unsupported_grant_type")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("invalid_scope")) & 1) != 0)
  {
    v5 = 6;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("server_error")) & 1) != 0)
  {
    v5 = 8;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("temporarily_unavailable")))
  {
    v5 = 9;
  }
  else
  {
    v5 = 0;
  }
  v9 = CFSTR("HKOAuth2ErrorResponseErrorNameErrorKey");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hk_OAuth2_error:userInfo:underlyingError:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hk_OAuth2_errorForRequest:()HKOAuth2 response:data:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a1, "_hk_OAuth2_rawErrorForRequest:response:data:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = CFSTR("HKOAuth2ErrorHTTPStatusCodeErrorKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "statusCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_hk_OAuth2_errorByAddingItemsToUserInfo:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_hk_OAuth2_rawErrorForRequest:()HKOAuth2 response:data:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "statusCode");
  switch(v11)
  {
    case 400:
      objc_msgSend(a1, "_hk_OAuth2_errorForBadRequestStatusWithResponse:data:", v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    case 401:
      objc_msgSend(a1, "_hk_OAuth2_errorForUnauthorizedStatusWithRequest:response:", v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    case 403:
      objc_msgSend(a1, "hk_OAuth2_error:", 7);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v13 = 0;
      goto LABEL_9;
  }
  v13 = (void *)v12;
LABEL_9:

  return v13;
}

+ (id)_hk_OAuth2_errorForUnauthorizedStatusWithRequest:()HKOAuth2 response:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "allHTTPHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Authorization"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allHeaderFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WWW-Authenticate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v11, "hasPrefix:", CFSTR("Bearer "));
  v15 = 11;
  if (v14 && v13)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("HKOAuth2ErrorBearerAuthenticateResponseErrorKey"));
    v15 = 12;
  }
  objc_msgSend(a1, "_hk_OAuth2_error:userInfo:underlyingError:", v15, v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_hk_OAuth2_errorForBadRequestStatusWithResponse:()HKOAuth2 data:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_OAuth2_error:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(a1, "_hk_OAuth2_errorFromResponseData:defaultError:parseError:", v7, v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[NSError(HKOAuth2) _hk_OAuth2_errorForBadRequestStatusWithResponse:data:].cold.1();
  }
  if (v9)
    v11 = v9;
  else
    v11 = v8;
  v12 = v11;

  return v12;
}

+ (id)_hk_OAuth2_errorFromResponseData:()HKOAuth2 defaultError:parseError:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_opt_class();
      HKSafeObject(v10, v11, CFSTR("responseObject"), a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "hk_safeStringForKeyPath:error:", CFSTR("error"), a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("error_description"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_opt_class();
          v25 = 0;
          HKSafeObject(v16, v17, CFSTR("errorDescription"), (uint64_t)&v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v25;
          if (v19)
          {
            _HKInitializeLogging();
            v24 = HKLogDefault;
            if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
              +[NSError(HKOAuth2) _hk_OAuth2_errorFromResponseData:defaultError:parseError:].cold.1();
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("HKOAuth2ErrorResponseErrorDescriptionErrorKey"), v24);

        }
        if (v14)
        {
          objc_msgSend(a1, "hk_OAuth2_errorFromErrorValue:", v14);
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = v9;
        }
        v22 = v20;
        objc_msgSend(v20, "_hk_OAuth2_errorByAddingItemsToUserInfo:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (uint64_t)hk_OAuth2_isOAuth2Error
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.healthkit.private.oauth2"));

  return v2;
}

- (uint64_t)hk_OAuth2_isOAuth2ErrorWithCode:()HKOAuth2
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_OAuth2_isOAuth2Error");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a3;
  return result;
}

- (uint64_t)hk_OAuth2_isAccessDeniedError
{
  return objc_msgSend(a1, "hk_OAuth2_isOAuth2ErrorWithCode:", 7);
}

- (uint64_t)hk_OAuth2_isBearerAuthenticationError
{
  return objc_msgSend(a1, "hk_OAuth2_isOAuth2ErrorWithCode:", 12);
}

- (id)_hk_OAuth2_errorByAddingItemsToUserInfo:()HKOAuth2
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);

  return v9;
}

+ (void)_hk_OAuth2_errorForBadRequestStatusWithResponse:()HKOAuth2 data:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "OAuth2: Failed to parse response data %@ for response %@.");
}

+ (void)_hk_OAuth2_errorFromResponseData:()HKOAuth2 defaultError:parseError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "OAuth2: Failed to parse error_description %@ for response data %@.");
}

@end
