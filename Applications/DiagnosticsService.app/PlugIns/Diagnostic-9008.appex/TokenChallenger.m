@implementation TokenChallenger

- (TokenChallenger)initWithToken:(id)a3 components:(id)a4 fdrTypes:(id)a5 endpoint:(id)a6 signer:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TokenChallenger *v17;
  TokenChallenger *v18;
  uint64_t v19;
  NSURL *endpointBaseURL;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TokenChallenger;
  v17 = -[TokenChallenger init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_token, a3);
    objc_storeStrong((id *)&v18->_signer, a7);
    objc_storeStrong((id *)&v18->_endpoint, a6);
    objc_storeStrong((id *)&v18->_components, a4);
    objc_storeStrong((id *)&v18->_fdrTypes, a5);
    v19 = objc_claimAutoreleasedReturnValue(-[TokenChallenger baseURL:](v18, "baseURL:", v15));
    endpointBaseURL = v18->_endpointBaseURL;
    v18->_endpointBaseURL = (NSURL *)v19;

    v18->_isTokenUnlocked = 0;
  }

  return v18;
}

- (void)fetchPasswordWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, int64_t);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  v4 = (void (**)(id, _QWORD, int64_t))a3;
  v6 = handleForCategory(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger token](self, "token"));
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching password UI with token: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger token](self, "token"));
  v22 = 0;
  v10 = -[TokenChallenger constructChallengeRequestDataWithToken:data:](self, "constructChallengeRequestDataWithToken:data:", v9, &v22);
  v11 = v22;

  if (v10)
  {
    v13 = handleForCategory(0, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000C2D0();

    v4[2](v4, 0, v10);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger endpoint](self, "endpoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v15));

    objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v16, "setHTTPBody:", v11);
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = CFSTR("en");
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v20, CFSTR("Accept-Language"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
    -[TokenChallenger _requestBuddyML:session:completion:](self, "_requestBuddyML:session:completion:", v16, v21, v4);

  }
}

- (int64_t)constructChallengeRequestDataWithToken:(id)a3 data:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];
  const __CFString *v36;
  id v37;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v36 = CFSTR("Token");
    v37 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v33 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v8, 100, 0, &v33));
    v10 = v33;
    if (v10)
      v12 = 1;
    else
      v12 = v9 == 0;
    if (v12)
    {
      v13 = v10;
      v14 = handleForCategory(0, v11);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10000C3E8();
      v16 = -108;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger signer](self, "signer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "baaCert"));

      if (v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger signer](self, "signer"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signData:", v9));

        if (v15)
        {
          v35[0] = v9;
          v34[0] = CFSTR("Payload");
          v34[1] = CFSTR("RKCertification");
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger signer](self, "signer"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "baaCert"));
          v34[2] = CFSTR("RKSignature");
          v35[1] = v23;
          v35[2] = v15;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 3));

          v32 = 0;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v24, 100, 0, &v32));
          v13 = v32;
          if (v13)
          {
            v27 = handleForCategory(0, v26);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              sub_10000C388();

            v16 = -108;
          }
          else
          {
            v16 = 0;
            if (a4)
              *a4 = objc_retainAutorelease(v25);
          }

        }
        else
        {
          v30 = handleForCategory(0, v21);
          v15 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_10000C35C();
          v13 = 0;
          v16 = -110;
        }
      }
      else
      {
        v29 = handleForCategory(0, v19);
        v15 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10000C330();
        v13 = 0;
        v16 = -109;
      }
    }

  }
  else
  {
    v16 = -309;
  }

  return v16;
}

- (id)localizedComponents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger components](self, "components"));

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger components](self, "components", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v10, &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
          objc_msgSend(v3, "addObject:", v12);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v3;
}

- (id)localizedComponentsMap
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger components](self, "components"));
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger fdrTypes](self, "fdrTypes"));
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger fdrTypes](self, "fdrTypes"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger fdrTypes](self, "fdrTypes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger components](self, "components"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v11));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v13);
        ++v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger fdrTypes](self, "fdrTypes"));
        v19 = objc_msgSend(v18, "count");

      }
      while (v11 < (unint64_t)v19);
    }
  }
  else
  {
    v20 = handleForCategory(0, v8);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10000C448(self, v21);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger fdrTypes](self, "fdrTypes", 0));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v29;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v26), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v26));
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v24);
    }

  }
  return v3;
}

- (void)_requestBuddyML:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *, void *);
  void *v31;
  TokenChallenger *v32;
  id v33;
  uint8_t buf[4];
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = handleForCategory(0, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
    *(_DWORD *)buf = 138543362;
    v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request URL: %{public}@", buf, 0xCu);

  }
  v16 = handleForCategory(0, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHTTPHeaderFields"));
    *(_DWORD *)buf = 138543362;
    v35 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request Headers: %{public}@", buf, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "HTTPBody"));

  if (v19)
  {
    v21 = handleForCategory(0, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_alloc((Class)NSString);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "HTTPBody"));
      v25 = objc_msgSend(v23, "initWithData:encoding:", v24, 4);
      *(_DWORD *)buf = 138477827;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request Body: %{private}@", buf, 0xCu);

    }
  }
  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_100005D5C;
  v31 = &unk_1000146F8;
  v32 = self;
  v33 = v10;
  v26 = v10;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v8, &v28));
  objc_msgSend(v27, "resume", v28, v29, v30, v31, v32);

}

- (int64_t)_sanityCheckBuddyMLResponse:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  id v12;
  unsigned __int8 v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  v8 = v6;
  if (!v5)
  {
    v16 = handleForCategory(0, v7);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C57C();
    goto LABEL_10;
  }
  if (!v6)
  {
    v18 = handleForCategory(0, v7);
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C5A8();
LABEL_10:
    v15 = -306;
LABEL_17:

    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "MIMEType"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("application/x-buddyml"));

  if ((v10 & 1) == 0)
  {
    v19 = handleForCategory(0, v11);
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C600(v5, v17);
    v15 = -307;
    goto LABEL_17;
  }
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
  v13 = objc_msgSend(v12, "containsString:", CFSTR("<xmlui"));

  if ((v13 & 1) == 0)
  {
    v20 = handleForCategory(0, v14);
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C5D4();
    v15 = -308;
    goto LABEL_17;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (id)baseURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 0));
      objc_msgSend(v7, "setPath:", &stru_100014BA8);
      objc_msgSend(v7, "setQuery:", 0);
      objc_msgSend(v7, "setFragment:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));

      goto LABEL_6;
    }
LABEL_5:
    v5 = 0;
  }
LABEL_6:

  return v5;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger token](self, "token"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TokenChallenger localizedComponentsMap](self, "localizedComponentsMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: token = %@, components = %@>"), v5, v6, v8));

  return v9;
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (NSURL)endpointBaseURL
{
  return self->_endpointBaseURL;
}

- (void)setEndpointBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_endpointBaseURL, a3);
}

- (BOOL)isTokenUnlocked
{
  return self->_isTokenUnlocked;
}

- (void)setIsTokenUnlocked:(BOOL)a3
{
  self->_isTokenUnlocked = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (StartPreflightSigner)signer
{
  return self->_signer;
}

- (void)setSigner:(id)a3
{
  objc_storeStrong((id *)&self->_signer, a3);
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (NSArray)fdrTypes
{
  return self->_fdrTypes;
}

- (void)setFdrTypes:(id)a3
{
  objc_storeStrong((id *)&self->_fdrTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdrTypes, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_signer, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_endpointBaseURL, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
