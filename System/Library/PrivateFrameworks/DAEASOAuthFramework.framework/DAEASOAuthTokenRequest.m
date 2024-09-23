@implementation DAEASOAuthTokenRequest

+ (id)claimsValueWithClaimsChallenge:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v26 = v3;
  if (v3 && (v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0)) != 0)
  {
    v25 = (void *)v4;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v25 = 0;
  }
  objc_msgSend(CFSTR("{\"access_token\":{\"xms_cc\":{\"values\":[\"cp1\"]}}}"), "dataUsingEncoding:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("access_token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("xms_cc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("xms_cc"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("access_token"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("access_token"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v18, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  objc_msgSend(v22, "setValue:forKey:", v7, CFSTR("access_token"));
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v22, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v19, 4);

  return v20;
}

+ (id)urlRequestForTokenRequestURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 authCode:(id)a6 scope:(id)a7 codeVerifier:(id)a8 claims:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v26 = a9;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("client_id"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("code"));

  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("scope"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("authorization_code"), CFSTR("grant_type"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("redirect_uri"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("code_verifier"));
  objc_msgSend((id)objc_opt_class(), "claimsValueWithClaimsChallenge:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("claims"));
  objc_msgSend(a1, "_urlRequestForTokenRequestURI:params:clientID:", v20, v21, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)oauthTokenRefreshRequestForTokenRequestURI:(id)a3 clientID:(id)a4 scope:(id)a5 refreshToken:(id)a6 claims:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("client_id"));
  if (v13)
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("scope"));

  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("refresh_token"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("refresh_token"), CFSTR("grant_type"));
  objc_msgSend((id)objc_opt_class(), "claimsValueWithClaimsChallenge:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("claims"));
  objc_msgSend(a1, "_urlRequestForTokenRequestURI:params:clientID:", v16, v17, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_urlRequestForTokenRequestURI:(id)a3 params:(id)a4 clientID:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  void *v24;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "stringByAddingPercentEscapesUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAddingPercentEscapesUsingEncoding:", 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@=%@"), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v18);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("&"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestWithURL:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "dataUsingEncoding:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHTTPBody:", v24);

  objc_msgSend(v23, "setCachePolicy:", 1);
  objc_msgSend(v23, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v23, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v23;
}

@end
