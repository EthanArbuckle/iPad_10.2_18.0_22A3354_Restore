@implementation SLGoogleWebAuthRequest

+ (void)clearCookiesFromStorage:(id)a3 authRequestURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cookiesForURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7
{
  return (id)objc_msgSend(a1, "urlForClientID:redirectURI:scope:username:authRequestURL:codeChallenge:", a3, a4, a5, a6, a7, 0);
}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7 codeChallenge:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v14 = a7;
  objc_msgSend(a1, "_parametersForClientID:redirectURI:scope:username:codeChallenge:", a3, a4, a5, a6, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("&"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?%@"), v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_parametersForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 codeChallenge:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[2];
  _QWORD v27[8];

  v27[7] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a5, "componentsJoinedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("response_type=code");
  v27[1] = CFSTR("enable_granular_consent=true");
  v27[2] = CFSTR("include_granted_scopes=true");
  v27[3] = CFSTR("prompt=consent");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client_id=%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27[4] = v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("redirect_uri=%@"), v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v27[5] = v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scope=%@"), v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("login_hint=%@"), v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObject:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("code_challenge=%@"), v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    v26[1] = CFSTR("code_challenge_method=S256");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v24;
  }

  return v19;
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

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("https://accounts.google.com/o/oauth2/approval"));

  return v4;
}

+ (id)authCodeFromWebPageTitle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("Success code=")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("Success code="), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)authCodeFromRedirectURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SLGoogleWebAuthRequest_authCodeFromRedirectURL___block_invoke;
  v8[3] = &unk_1E7590DC0;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__SLGoogleWebAuthRequest_authCodeFromRedirectURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("code"));

  if (!v7)
  {
    objc_msgSend(v11, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

@end
