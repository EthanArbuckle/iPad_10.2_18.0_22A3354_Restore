@implementation SLRequest

- (SLRequest)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("SLRequestMultiPart must be obtained through!"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SLRequest)initWithServiceType:(id)a3 URL:(id)a4 parameters:(id)a5 requestMethod:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  SLRequest *v13;
  SLRequest *v14;
  uint64_t v15;
  NSURL *url;
  uint64_t v17;
  SLRequest *v18;
  NSMutableDictionary *parameters;
  NSMutableArray *v20;
  NSMutableArray *multiParts;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  +[SLService serviceForServiceType:](SLService, "serviceForServiceType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v23.receiver = self;
    v23.super_class = (Class)SLRequest;
    v13 = -[SLRequest init](&v23, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_service, v12);
      v15 = objc_msgSend(v10, "copy");
      url = v14->_url;
      v14->_url = (NSURL *)v15;

      if (v11)
      {
        v17 = objc_msgSend(v11, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      parameters = v14->_parameters;
      v14->_parameters = (NSMutableDictionary *)v17;

      v14->_requestMethod = a6;
      v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      multiParts = v14->_multiParts;
      v14->_multiParts = v20;

    }
    self = v14;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (SLRequest)requestForServiceType:(NSString *)serviceType requestMethod:(SLRequestMethod)requestMethod URL:(NSURL *)url parameters:(NSDictionary *)parameters
{
  NSDictionary *v10;
  NSURL *v11;
  NSString *v12;
  void *v13;

  v10 = parameters;
  v11 = url;
  v12 = serviceType;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceType:URL:parameters:requestMethod:", v12, v11, v10, requestMethod);

  return (SLRequest *)v13;
}

- (void)setParameterValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!v7 || !v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Parameter key or value cannot be nil"));
  -[NSMutableDictionary setObject:forKey:](self->_parameters, "setObject:forKey:", v7, v6);

}

- (void)removeParameterForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_parameters, "removeObjectForKey:", a3);
}

- (id)parameterForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parameters, "objectForKey:", a3);
}

- (id)_urlEncodedString:(id)a3
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)a3, 0, CFSTR(":/?#[]@!$&‚Äö√Ñ√¥()*+,;='"),
                                               0x8000100u));
}

- (id)multiPartBoundary
{
  uint64_t v2;
  const __CFAllocator *v4;
  const __CFUUID *v5;
  __CFString *v6;
  NSString *v7;
  NSString *multiPartBoundary;

  if (!self->_multiPartBoundary)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v6 = (__CFString *)CFUUIDCreateString(v4, v5);
    CFRelease(v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("__mIm310v34411-%@__"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    multiPartBoundary = self->_multiPartBoundary;
    self->_multiPartBoundary = v7;

  }
  _SLLog(v2, 6, CFSTR("Multipart boundary %@"));
  return self->_multiPartBoundary;
}

- (void)setMultiPartBoundary:(id)a3
{
  id v5;
  NSString **p_multiPartBoundary;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_multiPartBoundary = &self->_multiPartBoundary;
  objc_storeStrong((id *)&self->_multiPartBoundary, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_multiParts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setMultiPartBoundary:", *p_multiPartBoundary, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)multiParts
{
  return self->_multiParts;
}

- (void)addMultiPart:(id)a3
{
  -[NSMutableArray addObject:](self->_multiParts, "addObject:", a3);
}

- (void)addMultipartData:(NSData *)data withName:(NSString *)name type:(NSString *)type
{
  -[SLRequest addMultipartData:withName:type:filename:](self, "addMultipartData:withName:type:filename:", data, name, type, 0);
}

- (void)addMultipartData:(NSData *)data withName:(NSString *)name type:(NSString *)type filename:(NSString *)filename
{
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSData *v13;
  void *v14;
  id v15;

  v10 = filename;
  v11 = type;
  v12 = name;
  v13 = data;
  -[SLRequest multiPartBoundary](self, "multiPartBoundary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLRequestMultiPart multiPartWithName:payload:type:multiPartBoundary:](SLRequestMultiPart, "multiPartWithName:payload:type:multiPartBoundary:", v12, v13, v11, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFilename:", v10);
  -[NSMutableArray addObject:](self->_multiParts, "addObject:", v15);

}

- (id)multiPartBodyData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  SLRequest *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  -[SLRequest _allParameters](self, "_allParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataUsingEncoding:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLRequest multiPartBoundary](v28, "multiPartBoundary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SLRequestMultiPart multiPartWithName:payload:type:multiPartBoundary:](SLRequestMultiPart, "multiPartWithName:payload:type:multiPartBoundary:", v9, v11, 0, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "partData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendData:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  _SLLog(v27, 6, CFSTR("Body before binaries: %@"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v28->_multiParts;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16, v26);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "partData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendData:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v17);
  }

  v21 = (void *)MEMORY[0x1E0CB3940];
  -[SLRequest multiPartBoundary](v28, "multiPartBoundary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("--%@--\r\n"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataUsingEncoding:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v24);

  return v3;
}

- (id)completeMultiParts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SLRequest *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = self;
  -[SLRequest _allParameters](self, "_allParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataUsingEncoding:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLRequest multiPartBoundary](v15, "multiPartBoundary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SLRequestMultiPart multiPartWithName:payload:type:multiPartBoundary:](SLRequestMultiPart, "multiPartWithName:payload:type:multiPartBoundary:", v9, v11, 0, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v13);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "addObjectsFromArray:", v15->_multiParts);

  return v3;
}

- (void)setAccount:(ACAccount *)account
{
  ACAccount *v4;
  ACAccount *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  ACAccount *v10;
  id v11;

  v4 = account;
  v5 = v4;
  if (v4)
  {
    -[ACAccount accountType](v4, "accountType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLService accountTypeIdentifier](self->_service, "accountTypeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid account type for this request"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    }
  }
  v10 = self->_account;
  self->_account = v5;

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setOAuthCredential:(id)a3
{
  objc_storeStrong((id *)&self->_OAuthCredential, a3);
}

- (id)OAuthCredential
{
  return self->_OAuthCredential;
}

- (void)setCallingPID:(int)a3
{
  self->_callingPID = a3;
}

- (int)callingPID
{
  return self->_callingPID;
}

- (void)setApplicationID:(id)a3
{
  objc_storeStrong((id *)&self->_applicationID, a3);
}

- (id)_allParameters
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_parameters, "mutableCopy");
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SLService addExtraParameters:forRequest:](self->_service, "addExtraParameters:forRequest:", v3, self);
  -[SLRequest _addAuthenticationParameters:](self, "_addAuthenticationParameters:", v3);
  return v3;
}

- (BOOL)_shouldAppendTencentWeiboParametersToRequest
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SLRequest account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8F148]);

  return v5;
}

- (void)_addAuthenticationParameters:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  _QWORD v35[7];
  _QWORD v36[8];

  v36[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SLService authenticationStyle](self->_service, "authenticationStyle") == 1)
  {
    -[SLRequest account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SLRequest account](self, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "credential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "credentialType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8F1A0]);

        if (v10)
        {
          objc_msgSend(v8, "oauthToken");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v8, "oauthToken");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("access_token"));

          }
        }
      }

    }
  }
  if (-[SLRequest _shouldAppendTencentWeiboParametersToRequest](self, "_shouldAppendTencentWeiboParametersToRequest"))
  {
    -[SLRequest account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "credential");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oauthToken");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[SLRequest account](self, "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "credential");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oauthRefreshToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[SLRequest account](self, "account");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "credential");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "credentialItemForKey:", *MEMORY[0x1E0C8F270]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v35[0] = CFSTR("format");
          v35[1] = CFSTR("clientip");
          v36[0] = CFSTR("json");
          v36[1] = CFSTR("0.0.0.0");
          v35[2] = CFSTR("oauth_version");
          v35[3] = CFSTR("scope");
          v36[2] = CFSTR("2.a");
          v36[3] = CFSTR("all");
          v36[4] = v22;
          v35[4] = CFSTR("oauth_consumer_key");
          v35[5] = CFSTR("access_token");
          -[SLRequest account](self, "account");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "credential");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "oauthToken");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v36[5] = v25;
          v35[6] = CFSTR("openid");
          -[SLRequest account](self, "account");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "credential");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "oauthRefreshToken");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v36[6] = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 7);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addEntriesFromDictionary:", v29);
        }
        else
        {
          _SLLog(v3, 6, CFSTR("Missing credential's consumer key, forfeiting the addition of parameters"));
        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    -[SLRequest account](self, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "credential");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "oauthToken");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRequest account](self, "account");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "credential");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "oauthRefreshToken");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 6, CFSTR("Missing oauthToken (%@) or oauthRefreshToken (%@)"));

LABEL_15:
  }

}

- (id)_parameterString
{
  uint64_t v2;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  SLRequest *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[SLRequest _allParameters](self, "_allParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __29__SLRequest__parameterString__block_invoke;
  v37[3] = &unk_1E7590430;
  v23 = v5;
  v38 = v23;
  v39 = self;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B6C8B8](v37);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v24 = *(_QWORD *)v34;
    v25 = v7;
    do
    {
      v11 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ((void (**)(_QWORD, uint64_t, void *))v6)[2](v6, v12, v13);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v13;
            v28 = v11;
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v14 = v13;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v30 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v6[2](v6, v12, v19);
                  else
                    _SLLog(v2, 3, CFSTR("Invalid parameter type"));
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
              }
              while (v16);
            }

            v10 = v24;
            v7 = v25;
            v9 = v26;
            v13 = v27;
            v11 = v28;
          }
          else
          {
            _SLLog(v2, 3, CFSTR("Invalid parameter type"));
          }
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v9);
  }

  objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("&"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __29__SLRequest__parameterString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = a3;
  objc_msgSend(v7, "_urlEncodedString:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_urlEncodedString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), v11, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

}

- (BOOL)_requiresAuthorization
{
  return self->_account || self->_OAuthCredential != 0;
}

- (BOOL)shouldIncludeParameterString
{
  BOOL result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = 0;
  if (self->_requestMethod != 1)
  {
    if (-[NSMutableDictionary count](self->_parameters, "count"))
      return 1;
    -[SLRequest account](self, "account");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[SLService authenticationStyle](self->_service, "authenticationStyle");

      if (v6 == 1)
        return 1;
    }
  }
  return result;
}

- (id)_preparedURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSURL *v7;

  if (-[SLRequest shouldIncludeParameterString](self, "shouldIncludeParameterString"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[NSURL absoluteString](self->_url, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRequest _parameterString](self, "_parameterString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@?%@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_url;
  }
  return v7;
}

- (id)_HTTPMethodName
{
  unint64_t requestMethod;

  requestMethod = self->_requestMethod;
  if (requestMethod > 3)
    return 0;
  else
    return off_1E75904C8[requestMethod];
}

- (NSURLRequest)preparedURLRequest
{
  void *v3;
  void *v4;
  void *v5;
  NSString *contentType;
  void *v7;
  void *v8;
  void *v9;
  SLRequestBodyInputStream *v10;
  void *v11;
  void *v12;
  SLRequestBodyInputStream *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[SLRequest _preparedURL](self, "_preparedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNetworkServiceType:", -[SLRequest networkServiceType](self, "networkServiceType"));
  -[SLRequest _HTTPMethodName](self, "_HTTPMethodName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPMethod:", v5);

  if ((self->_requestMethod | 2) != 3)
    goto LABEL_8;
  if (self->_payload)
  {
    objc_msgSend(v4, "setHTTPBody:");
    contentType = self->_contentType;
    if (contentType)
      objc_msgSend(v4, "addValue:forHTTPHeaderField:", contentType, CFSTR("Content-Type"));
    goto LABEL_8;
  }
  if (!-[NSMutableArray count](self->_multiParts, "count"))
  {
    -[SLRequest _parameterString](self, "_parameterString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHTTPBody:", v17);

LABEL_8:
    v13 = 0;
    v15 = 0;
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SLRequest multiPartBoundary](self, "multiPartBoundary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v9, CFSTR("Content-Type"));
  v10 = [SLRequestBodyInputStream alloc];
  -[SLRequest completeMultiParts](self, "completeMultiParts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRequest multiPartBoundary](self, "multiPartBoundary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SLRequestBodyInputStream initWithMultiParts:multiPartBoundary:](v10, "initWithMultiParts:multiPartBoundary:", v11, v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[SLRequestBodyInputStream totalBytes](v13, "totalBytes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v14, CFSTR("Content-Length"));

  v15 = 1;
LABEL_9:
  v18 = v4;
  v19 = v18;
  if (!-[SLService authenticationStyle](self->_service, "authenticationStyle"))
  {
    v19 = v18;
    if (-[SLRequest _requiresAuthorization](self, "_requiresAuthorization"))
    {
      if (self->_account)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2E0]), "initWithAccount:", self->_account);
        objc_msgSend(v20, "setShouldIncludeAppIdInRequest:", 0);
        if (self->_callingPID < 1)
        {
          v21 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "signedURLRequestWithURLRequest:callingPID:timestamp:", v18, v21, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = v18;
        if (!self->_OAuthCredential)
          goto LABEL_19;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64EA8]), "initWithCredential:", self->_OAuthCredential);
        objc_msgSend(v20, "signedURLRequestWithRequest:applicationID:timestamp:", v18, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v18;
      }

    }
  }
LABEL_19:
  if (v15)
  {
    v22 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v22, "setHTTPBodyStream:", v13);
    v19 = v22;
  }

  return (NSURLRequest *)v19;
}

- (id)dictionaryRepresentationForJSONSerialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *multiParts;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = (void *)objc_opt_new();
  -[SLRequest _HTTPMethodName](self, "_HTTPMethodName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("method"));

  -[SLRequest _preparedURL](self, "_preparedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "relativePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("relative_url"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("relative_url"));
  }

  if (self->_requestMethod == 1)
  {
    -[SLRequest _parameterString](self, "_parameterString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("body"));

    if (-[NSMutableArray count](self->_multiParts, "count"))
    {
      v11 = (void *)objc_opt_new();
      multiParts = self->_multiParts;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__SLRequest_dictionaryRepresentationForJSONSerialization__block_invoke;
      v16[3] = &unk_1E7590458;
      v17 = v11;
      v13 = v11;
      -[NSMutableArray enumerateObjectsUsingBlock:](multiParts, "enumerateObjectsUsingBlock:", v16);
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("attached_files"));

    }
  }

  return v3;
}

void __57__SLRequest_dictionaryRepresentationForJSONSerialization__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)performRequestWithHandler:(SLRequestHandler)handler
{
  uint64_t v3;
  SLRequestHandler v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = handler;
  -[SLRequest preparedURLRequest](self, "preparedURLRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("Prepared Request URL: %@"));

  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "copy", v12);
    v8 = dispatch_queue_create("SLRequest performRequest queue", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SLRequest_performRequestWithHandler___block_invoke;
    block[3] = &unk_1E7590480;
    v14 = v6;
    v15 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v14;
  }
  else
  {
    _SLLog(v3, 3, CFSTR("Failed to prepare request"));
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Could not prepare the URL request.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("SLErrorDomain"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(SLRequestHandler, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v10);
  }

}

void __39__SLRequest_performRequestWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v3, &v13, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = v12;
  v7 = objc_msgSend(v5, "statusCode");
  if (v6)
  {
    objc_msgSend(v6, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v1, 3, CFSTR("Request error: %@"));

    if (!v5)
    {
      objc_msgSend(v6, "userInfo", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C93090]);

        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0CB3680], "_responseWithCFURLResponse:", v5);
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else if (v7 != 200)
  {
    _SLLog(v1, 3, CFSTR("Request status was %d"));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_shouldRetryAfterCount:(int)a3 delay:(float *)a4
{
  float v4;

  if (a4)
  {
    v4 = (double)a3 * 5.0;
    *a4 = v4;
  }
  return a3 < 4;
}

- (id)_commandName
{
  void *v2;
  void *v3;

  -[NSURL path](self->_url, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performJSONRequestWithHandler:(id)a3 retryCount:(int)a4
{
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int v11;

  v6 = (void *)objc_msgSend(a3, "copy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SLRequest_performJSONRequestWithHandler_retryCount___block_invoke;
  v9[3] = &unk_1E75904A8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x1C3B6C8B8](v9);
  -[SLRequest performRequestWithHandler:](self, "performRequestWithHandler:", v8);

}

void __54__SLRequest_performJSONRequestWithHandler_retryCount___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  double v17;
  float v18;
  id v19;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "statusCode");
  if (!v9 && v10)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_10:
    v12();
    goto LABEL_11;
  }
  if (v11 > 499)
  {
    v18 = 0.0;
    if (v11 != 503
      || !objc_msgSend(*(id *)(a1 + 32), "_shouldRetryAfterCount:delay:", *(unsigned int *)(a1 + 48), &v18))
    {
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "_commandName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;
    v16 = (*(_DWORD *)(a1 + 48) + 1);
    _SLLog(v4, 6, CFSTR("(503) %@ retrying:%d of %d delay: %f"));

    sleep((int)v18);
    objc_msgSend(*(id *)(a1 + 32), "performJSONRequestWithHandler:retryCount:", *(_QWORD *)(a1 + 40), (*(_DWORD *)(a1 + 48) + 1), v15, v16, 4, *(_QWORD *)&v17);
  }
  else
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
LABEL_11:

}

- (void)performJSONRequestWithHandler:(id)a3
{
  -[SLRequest performJSONRequestWithHandler:retryCount:](self, "performJSONRequestWithHandler:retryCount:", a3, 0);
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  self->_networkServiceType = a3;
}

- (unint64_t)networkServiceType
{
  return self->_networkServiceType;
}

- (NSURL)URL
{
  return self->_url;
}

- (NSDictionary)parameters
{
  return &self->_parameters->super;
}

- (SLRequestMethod)requestMethod
{
  return self->_requestMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_multiPartBoundary, 0);
  objc_storeStrong((id *)&self->_multiParts, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_OAuthCredential, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
