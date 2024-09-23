@implementation SLYahooWebAuthRequest

- (SLYahooWebAuthRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLYahooWebAuthRequest;
  return -[SLYahooWebAuthRequest init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)clearCookiesFromStorage:(id)a3 authRequestURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("https://%@/"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cookiesForURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v5, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7
{
  return (id)objc_msgSend(a1, "urlForClientID:redirectURI:scope:username:authRequestURL:codeChallenge:", a3, a4, a5, a6, a7, 0);
}

+ (id)requestForURL:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCachePolicy:", 1);
  return v3;
}

+ (id)urlRequestForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7
{
  void *v8;
  void *v9;

  objc_msgSend(a1, "urlForClientID:redirectURI:scope:username:authRequestURL:", a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestForURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("code="));

  return v4;
}

+ (id)authCodeFromURLRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("code="), "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7 codeChallenge:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v13 = a7;
  objc_msgSend(a1, "_parametersForClientID:redirectURI:scope:username:", a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("&"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?%@"), v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_parametersForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = (void *)MEMORY[0x1E0C99DC8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C997E0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client_id=%@"), v11, CFSTR("response_type=code"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("redirect_uri=%@"), v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23[2] = v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("language=%@"), v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("login_hint=%@"), v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObject:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }

  return v19;
}

@end
