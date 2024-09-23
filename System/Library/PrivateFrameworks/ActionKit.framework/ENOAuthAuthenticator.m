@implementation ENOAuthAuthenticator

+ (id)deviceDescription
{
  return &stru_24F8BBA48;
}

+ (id)queryStringFromParameters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__ENOAuthAuthenticator_queryStringFromParameters___block_invoke;
  v9[3] = &unk_24F8B6280;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)parametersFromQueryString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR("="));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 2)
        {
          objc_msgSend(v10, "objectAtIndex:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "en_stringByUrlDecoding");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectAtIndex:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "en_stringByUrlDecoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            v15 = v14 == 0;
          else
            v15 = 1;
          if (!v15)
            objc_msgSend(v4, "setObject:forKey:", v14, v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

void __50__ENOAuthAuthenticator_queryStringFromParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(a2, "en_stringByUrlEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "en_stringByUrlEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

- (void)emptyCookieJar
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ENOAuthAuthenticator host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB7448], "sharedHTTPCookieStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "cookies", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "domain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator host](self, "host");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "hasSuffix:", v12);

          if (v13)
            objc_msgSend(v4, "deleteCookie:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)authenticate
{
  void *v4;
  void *v5;
  void *v6;
  ENCredentialStore *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  if (-[ENOAuthAuthenticator inProgress](self, "inProgress"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENOAuthAuthenticator.m"), 84, CFSTR("Authenticator is a single-use-only object!"));

  }
  -[ENOAuthAuthenticator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENOAuthAuthenticator.m"), 85, CFSTR("Must set authenticator delegate"));

  }
  if (-[ENOAuthAuthenticator inProgress](self, "inProgress"))
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot reuse single instance of %@"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "evernoteLogErrorString:", v6);

  }
  else
  {
    -[ENOAuthAuthenticator setInProgress:](self, "setInProgress:", 1);
    -[ENOAuthAuthenticator emptyCookieJar](self, "emptyCookieJar");
    v7 = objc_alloc_init(ENCredentialStore);
    -[ENOAuthAuthenticator setCredentialStore:](self, "setCredentialStore:", v7);

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENOAuthAuthenticator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userStoreClientForBootstrapping");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __36__ENOAuthAuthenticator_authenticate__block_invoke;
    v15[3] = &unk_24F8B03D0;
    v15[4] = self;
    objc_msgSend(v11, "fetchBootstrapInfoWithLocale:completion:", v9, v15);

  }
}

- (void)startOauthAuthentication
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
  _QWORD v12[5];

  if (!-[ENOAuthAuthenticator isCancelled](self, "isCancelled"))
  {
    v3 = (void *)MEMORY[0x24BDBCE70];
    -[ENOAuthAuthenticator oauthCallback](self, "oauthCallback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("oauth_callback"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENOAuthAuthenticator host](self, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENOAuthAuthenticator consumerKey](self, "consumerKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENOAuthAuthenticator consumerSecret](self, "consumerSecret");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENGCOAuth URLRequestForPath:GETParameters:scheme:host:consumerKey:consumerSecret:accessToken:tokenSecret:](ENGCOAuth, "URLRequestForPath:GETParameters:scheme:host:consumerKey:consumerSecret:accessToken:tokenSecret:", CFSTR("/oauth"), v5, CFSTR("https"), v6, v7, v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__ENOAuthAuthenticator_startOauthAuthentication__block_invoke;
    v12[3] = &unk_24F8B3840;
    v12[4] = self;
    objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v9, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "resume");
  }
}

- (id)callbackScheme
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ENOAuthAuthenticator consumerKey](self, "consumerKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("en-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)oauthCallback
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ENOAuthAuthenticator callbackScheme](self, "callbackScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@://response"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userAuthorizationURLStringWithParameters:(id)a3
{
  void *v4;
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
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "deviceDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCED8];
  v17[0] = CFSTR("oauth_token");
  objc_msgSend(v5, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v9;
  v18[1] = CFSTR("ios");
  v17[1] = CFSTR("inapp");
  v17[2] = CFSTR("deviceDescription");
  v17[3] = CFSTR("deviceIdentifier");
  v18[2] = v7;
  v18[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ENOAuthAuthenticator supportsLinkedAppNotebook](self, "supportsLinkedAppNotebook"))
    objc_msgSend(v11, "setObject:forKey:", CFSTR("true"), CFSTR("supportLinkedSandbox"));
  if (-[ENOAuthAuthenticator preferRegistration](self, "preferRegistration"))
    objc_msgSend(v11, "setObject:forKey:", CFSTR("true"), CFSTR("preferRegistration"));
  objc_msgSend((id)objc_opt_class(), "queryStringFromParameters:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[ENOAuthAuthenticator host](self, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@://%@/OAuth.action?%@"), CFSTR("https"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)handleDidBecomeActive
{
  unint64_t v3;

  v3 = -[ENOAuthAuthenticator state](self, "state");
  if ((v3 > 3 || v3 == 1) && !-[ENOAuthAuthenticator isActiveBecauseOfCallback](self, "isActiveBecauseOfCallback"))
  {
    -[ENOAuthAuthenticator gotCallbackURL:](self, "gotCallbackURL:", 0);
    -[ENOAuthAuthenticator setState:](self, "setState:", 0);
  }
}

- (void)failedWithError:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[ENOAuthAuthenticator isCancelled](self, "isCancelled"))
  {
    -[ENOAuthAuthenticator setReceivedData:](self, "setReceivedData:", 0);
    -[ENOAuthAuthenticator setResponse:](self, "setResponse:", 0);
    -[ENOAuthAuthenticator completeAuthenticationWithError:](self, "completeAuthenticationWithError:", v4);
  }

}

- (void)receivedResponse:(id)a3
{
  id v4;

  -[ENOAuthAuthenticator setResponse:](self, "setResponse:", a3);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator setReceivedData:](self, "setReceivedData:", v4);

}

- (void)receivedData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENOAuthAuthenticator receivedData](self, "receivedData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v4);

}

- (void)didFinishLoading
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  ENCredentials *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ENCredentials *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (!-[ENOAuthAuthenticator isCancelled](self, "isCancelled"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[ENOAuthAuthenticator receivedData](self, "receivedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

    -[ENOAuthAuthenticator response](self, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0
      && (-[ENOAuthAuthenticator response](self, "response"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = (void *)objc_msgSend(v8, "statusCode"),
          v8,
          v9 != (void *)200))
    {
      NSLog(CFSTR("Received error HTTP response code: %ld"), v9);
      NSLog(CFSTR("%@"), v5);
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("statusCode");
        v32[0] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 1, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENOAuthAuthenticator completeAuthenticationWithError:](self, "completeAuthenticationWithError:", v12);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "parametersFromQueryString:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("oauth_callback_confirmed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("oauth_token_secret"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENOAuthAuthenticator setTokenSecret:](self, "setTokenSecret:", v11);

        -[ENOAuthAuthenticator userAuthorizationURLStringWithParameters:](self, "userAuthorizationURLStringWithParameters:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENOAuthAuthenticator delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENOAuthAuthenticator oauthCallback](self, "oauthCallback");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __40__ENOAuthAuthenticator_didFinishLoading__block_invoke;
        v30[3] = &unk_24F8B03F8;
        v30[4] = self;
        objc_msgSend(v14, "authenticatorShouldShowAuthorizationUIWithURL:callbackPrefix:completionBlock:", v13, v15, v30);
      }
      else
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("oauth_token"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("edam_noteStoreUrl"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("edam_userId"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("edam_webApiUrlPrefix"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("edam_expires"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v16, "doubleValue");
        objc_msgSend(v17, "dateWithTimeIntervalSince1970:", v18 / 1000.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && v13 && v14 && v15)
        {
          v20 = [ENCredentials alloc];
          -[ENOAuthAuthenticator host](self, "host");
          v29 = v16;
          v21 = v15;
          v22 = v19;
          v23 = v14;
          v24 = v13;
          v25 = v12;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[ENCredentials initWithHost:edamUserId:noteStoreUrl:webApiUrlPrefix:authenticationToken:expirationDate:](v20, "initWithHost:edamUserId:noteStoreUrl:webApiUrlPrefix:authenticationToken:expirationDate:", v26, v23, v24, v21, v25, v22);

          v12 = v25;
          v13 = v24;
          v14 = v23;
          v19 = v22;
          v15 = v21;
          v16 = v29;
          -[ENOAuthAuthenticator completeAuthenticationWithCredentials:usesLinkedAppNotebook:](self, "completeAuthenticationWithCredentials:usesLinkedAppNotebook:", v27, -[ENOAuthAuthenticator userSelectedLinkedAppNotebook](self, "userSelectedLinkedAppNotebook"));
          -[ENOAuthAuthenticator setState:](self, "setState:", 3);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 0, 0);
          v27 = (ENCredentials *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator completeAuthenticationWithError:](self, "completeAuthenticationWithError:", v27);
        }

      }
    }

    -[ENOAuthAuthenticator setReceivedData:](self, "setReceivedData:", 0);
    -[ENOAuthAuthenticator setResponse:](self, "setResponse:", 0);

  }
}

- (void)completeAuthenticationWithCredentials:(id)a3 usesLinkedAppNotebook:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (!-[ENOAuthAuthenticator isCancelled](self, "isCancelled"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ENOAuthAuthenticatorAuthInfoAppNotebookIsLinked"));
    -[ENOAuthAuthenticator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authenticatorDidAuthenticateWithCredentials:authInfo:", v9, v7);

  }
}

- (void)completeAuthenticationWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[ENOAuthAuthenticator isCancelled](self, "isCancelled"))
  {
    -[ENOAuthAuthenticator setState:](self, "setState:", 0);
    -[ENOAuthAuthenticator delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authenticatorDidFailWithError:", v5);

  }
}

- (void)switchProfile
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  -[ENOAuthAuthenticator profiles](self, "profiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0;
  if (v4)
  {
    do
    {
      -[ENOAuthAuthenticator profiles](self, "profiles");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[ENOAuthAuthenticator currentProfile](self, "currentProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        break;
      ++v5;
      -[ENOAuthAuthenticator profiles](self, "profiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v5 < v12);
  }
  -[ENOAuthAuthenticator profiles](self, "profiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5 + 1;
  -[ENOAuthAuthenticator profiles](self, "profiles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v14 % objc_msgSend(v15, "count"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator updateCurrentBootstrapProfileWithName:](self, "updateCurrentBootstrapProfileWithName:", v16);

}

- (void)updateCurrentBootstrapProfileWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ENOAuthAuthenticator profiles](self, "profiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator setCurrentProfile:](self, "setCurrentProfile:", v13);

          objc_msgSend(v10, "settings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serviceHost");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator setHost:](self, "setHost:", v15);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[ENOAuthAuthenticator startOauthAuthentication](self, "startOauthAuthentication");
}

- (BOOL)handleOpenURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("invalidURL"));

  if (!v6)
  {
    -[ENOAuthAuthenticator setState:](self, "setState:", 2);
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[ENOAuthAuthenticator consumerKey](self, "consumerKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("en-%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
    {
      objc_msgSend(v4, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(CFSTR("oauth"), "isEqualToString:", v12);

      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        -[ENOAuthAuthenticator consumerKey](self, "consumerKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("en-%@://oauth/"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "absoluteString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", v16, &stru_24F8BBA48);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[ENOAuthAuthenticator gotCallbackURL:](self, "gotCallbackURL:", v18);
LABEL_10:
        v7 = 1;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "scheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v19) & 1) != 0)
    {
      objc_msgSend(v4, "host");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(CFSTR("loginCancelled"), "isEqualToString:", v20);

      if (v21)
      {
        -[ENOAuthAuthenticator gotCallbackURL:](self, "gotCallbackURL:", 0);
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "scheme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v22) & 1) != 0)
    {
      objc_msgSend(v4, "host");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(CFSTR("incorrectProfile"), "isEqualToString:", v23);

      if (v24)
      {
        -[ENOAuthAuthenticator enableIsActiveBecauseOfCallback](self, "enableIsActiveBecauseOfCallback");
        v7 = -[ENOAuthAuthenticator canHandleSwitchProfileURL:](self, "canHandleSwitchProfileURL:", v4);
        goto LABEL_17;
      }
    }
    else
    {

    }
    v7 = 0;
    goto LABEL_17;
  }
  NSLog(CFSTR("Invalid URL sent to Evernote!"));
  v7 = 0;
LABEL_18:

  return v7;
}

- (void)enableIsActiveBecauseOfCallback
{
  -[ENOAuthAuthenticator setIsActiveBecauseOfCallback:](self, "setIsActiveBecauseOfCallback:", 1);
  -[ENOAuthAuthenticator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_disableIsActiveBecauseOfCallback, 0, 2.0);
}

- (void)disableIsActiveBecauseOfCallback
{
  -[ENOAuthAuthenticator setIsActiveBecauseOfCallback:](self, "setIsActiveBecauseOfCallback:", 0);
}

- (BOOL)canHandleSwitchProfileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 <= 1)
  {
    NSLog(CFSTR("URL:%@ has invalid component count: %lu"), v4, objc_msgSend(v6, "count"));
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENOAuthAuthenticator updateCurrentBootstrapProfileWithName:](self, "updateCurrentBootstrapProfileWithName:", v8);

  }
  return v7 > 1;
}

- (void)gotCallbackURL:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4;
  if (v4)
  {
    -[ENOAuthAuthenticator getOAuthTokenForURL:](self, "getOAuthTokenForURL:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 11, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENOAuthAuthenticator completeAuthenticationWithError:](self, "completeAuthenticationWithError:", v5);

  }
}

- (void)getOAuthTokenForURL:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parametersFromQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("oauth_token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("oauth_verifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("sandbox_lnb"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator setUserSelectedLinkedAppNotebook:](self, "setUserSelectedLinkedAppNotebook:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v18, CFSTR("oauth_verifier"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator host](self, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator consumerKey](self, "consumerKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator consumerSecret](self, "consumerSecret");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENOAuthAuthenticator tokenSecret](self, "tokenSecret");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENGCOAuth URLRequestForPath:GETParameters:scheme:host:consumerKey:consumerSecret:accessToken:tokenSecret:](ENGCOAuth, "URLRequestForPath:GETParameters:scheme:host:consumerKey:consumerSecret:accessToken:tokenSecret:", CFSTR("/oauth"), v10, CFSTR("https"), v11, v12, v13, v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __44__ENOAuthAuthenticator_getOAuthTokenForURL___block_invoke;
  v19[3] = &unk_24F8B3840;
  v19[4] = self;
  objc_msgSend(v16, "dataTaskWithRequest:completionHandler:", v15, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "resume");
}

- (ENAuthenticatorDelegate)delegate
{
  return (ENAuthenticatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)consumerKey
{
  return self->_consumerKey;
}

- (void)setConsumerKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)consumerSecret
{
  return self->_consumerSecret;
}

- (void)setConsumerSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)supportsLinkedAppNotebook
{
  return self->_supportsLinkedAppNotebook;
}

- (void)setSupportsLinkedAppNotebook:(BOOL)a3
{
  self->_supportsLinkedAppNotebook = a3;
}

- (BOOL)useWebAuthenticationOnly
{
  return self->_useWebAuthenticationOnly;
}

- (void)setUseWebAuthenticationOnly:(BOOL)a3
{
  self->_useWebAuthenticationOnly = a3;
}

- (BOOL)preferRegistration
{
  return self->_preferRegistration;
}

- (void)setPreferRegistration:(BOOL)a3
{
  self->_preferRegistration = a3;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_profiles, a3);
}

- (NSString)currentProfile
{
  return self->_currentProfile;
}

- (void)setCurrentProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (ENCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void)setCredentialStore:(id)a3
{
  objc_storeStrong((id *)&self->_credentialStore, a3);
}

- (NSString)tokenSecret
{
  return self->_tokenSecret;
}

- (void)setTokenSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isSwitchingInProgress
{
  return self->_isSwitchingInProgress;
}

- (void)setIsSwitchingInProgress:(BOOL)a3
{
  self->_isSwitchingInProgress = a3;
}

- (BOOL)isActiveBecauseOfCallback
{
  return self->_isActiveBecauseOfCallback;
}

- (void)setIsActiveBecauseOfCallback:(BOOL)a3
{
  self->_isActiveBecauseOfCallback = a3;
}

- (BOOL)userSelectedLinkedAppNotebook
{
  return self->_userSelectedLinkedAppNotebook;
}

- (void)setUserSelectedLinkedAppNotebook:(BOOL)a3
{
  self->_userSelectedLinkedAppNotebook = a3;
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
  objc_storeStrong((id *)&self->_receivedData, a3);
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_tokenSecret, 0);
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_currentProfile, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_consumerSecret, 0);
  objc_storeStrong((id *)&self->_consumerKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__ENOAuthAuthenticator_getOAuthTokenForURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "failedWithError:", v8);
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "receivedResponse:", v7);
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "receivedData:", v9);
  objc_msgSend(*(id *)(a1 + 32), "didFinishLoading");

}

uint64_t __40__ENOAuthAuthenticator_didFinishLoading__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "getOAuthTokenForURL:", a2);
}

void __48__ENOAuthAuthenticator_startOauthAuthentication__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "failedWithError:", v8);
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "receivedResponse:", v7);
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "receivedData:", v9);
  objc_msgSend(*(id *)(a1 + 32), "didFinishLoading");

}

void __36__ENOAuthAuthenticator_authenticate__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v12 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "startOauthAuthentication");
  }
  else
  {
    objc_msgSend(v5, "profiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "profiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProfiles:", v8);

    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentProfile:", v9);

    objc_msgSend(v7, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHost:", v11);

    objc_msgSend(*(id *)(a1 + 32), "startOauthAuthentication");
  }

}

@end
