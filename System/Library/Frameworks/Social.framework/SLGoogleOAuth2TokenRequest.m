@implementation SLGoogleOAuth2TokenRequest

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7
{
  return (id)objc_msgSend(a1, "urlRequestForClientID:secret:redirectURI:authCode:tokenURL:codeVerifier:", a3, a4, a5, a6, a7, 0);
}

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7 codeVerifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0C99E08];
  v18 = a6;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v17, "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("code"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("authorization_code"), CFSTR("grant_type"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("redirect_uri"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("client_id"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("enable_granular_consent"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("include_granted_scopes"));
  if (v14)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("client_secret"));
  if (v16)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("code_verifier"));
  objc_msgSend(a1, "_urlRequestForParams:tokenURL:", v21, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 refreshToken:(id)a5 tokenURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("refresh_token"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("refresh_token"), CFSTR("grant_type"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("client_id"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("enable_granular_consent"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("include_granted_scopes"));
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("client_secret"));
  objc_msgSend(a1, "_urlRequestForParams:tokenURL:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_urlRequestForParams:(id)a3 tokenURL:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id obj;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v28 = v5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v28, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@=%@"), v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "addObject:", v17);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(v27, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("&"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "requestWithURL:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHTTPBody:", v23);

  objc_msgSend(v22, "setCachePolicy:", 1);
  objc_msgSend(v22, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v22, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v22;
}

@end
