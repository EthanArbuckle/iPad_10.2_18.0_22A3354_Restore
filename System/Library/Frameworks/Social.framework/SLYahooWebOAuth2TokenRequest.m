@implementation SLYahooWebOAuth2TokenRequest

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("code"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("authorization_code"), CFSTR("grant_type"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("redirect_uri"));

  objc_msgSend(a1, "_urlRequestForParams:clientID:secret:tokenURL:", v17, v16, v15, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 refreshToken:(id)a5 tokenURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SLYahooWebClient *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("refresh_token"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("refresh_token"), CFSTR("grant_type"));
  v15 = objc_alloc_init(SLYahooWebClient);
  -[SLYahooWebClient clientRedirect](v15, "clientRedirect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("redirect_uri"));

  objc_msgSend(a1, "_urlRequestForParams:clientID:secret:tokenURL:", v14, v13, v12, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_urlRequestForParams:(id)a3 clientID:(id)a4 secret:(id)a5 tokenURL:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id obj;
  id obja;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v39 = v9;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v39, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@=%@"), v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "addObject:", v21);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v11);
  }

  objc_msgSend(v40, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "componentsJoinedByString:", CFSTR("&"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "requestWithURL:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHTTPBody:", v26);

  objc_msgSend(v25, "setCachePolicy:", 1);
  objc_msgSend(v25, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v36, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v27, "dataUsingEncoding:", 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "base64EncodedDataWithOptions:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v28, "initWithData:encoding:", v30, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setValue:forHTTPHeaderField:", v32, CFSTR("Authorization"));
  objc_msgSend(v25, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v25;
}

@end
