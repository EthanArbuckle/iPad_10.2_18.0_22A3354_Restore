@implementation DAEASOAuthRequest

+ (id)urlForOAuthURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 scope:(id)a6 username:(id)a7 state:(id)a8 codeChallenge:(id)a9 codeChallengeMethod:(int64_t)a10
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[10];

  v48[9] = *MEMORY[0x24BDAC8D0];
  v44 = a7;
  v15 = (void *)MEMORY[0x24BDBCEA0];
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v47 = a3;
  objc_msgSend(v15, "currentLocale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x24BDBCB18]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lowercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
  v25 = objc_claimAutoreleasedReturnValue();

  v48[0] = CFSTR("response_type=code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("client_id=%@"), v20);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v48[1] = v43;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("redirect_uri=%@"), v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v48[2] = v26;
  v45 = (void *)v25;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scope=%@"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v27;
  v46 = (void *)v24;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ui_locales=%@"), v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v28;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("display=%@"), CFSTR("ios"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v29;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("state=%@"), v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v48[6] = v30;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("code_challenge=%@"), v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v48[7] = v31;
  v32 = (void *)MEMORY[0x24BDD17C8];
  +[DAEASOAuthPKCEChallenge convertToString:](DAEASOAuthPKCEChallenge, "convertToString:", a10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("code_challenge_method=%@"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("login_hint=%@"), v44);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayByAddingObject:", v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v37;
  }
  objc_msgSend(v35, "componentsJoinedByString:", CFSTR("&"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@?%@"), v47, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)urlForOnPremOAuthURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 username:(id)a6 state:(id)a7 resource:(id)a8 claims:(id)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[9];

  v44[8] = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v42 = a6;
  v15 = a8;
  v16 = (void *)MEMORY[0x24BDBCEA0];
  v17 = a9;
  v18 = a7;
  v19 = a5;
  v41 = a3;
  objc_msgSend(v16, "currentLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", *MEMORY[0x24BDBCB18]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lowercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v23 = objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("/"));
    v24 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v24;
  }
  v43 = v14;
  v44[0] = CFSTR("response_type=code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("client_id=%@"), v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v25;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("redirect_uri=%@"), v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v44[2] = v26;
  v40 = (void *)v23;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ui_locales=%@"), v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v27;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("display=%@"), CFSTR("ios"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v28;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("state=%@"), v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v44[5] = v29;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("resource=%@"), v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v30;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("claims=%@"), v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v44[7] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("login_hint=%@"), v42);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "arrayByAddingObject:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v34;
  }
  objc_msgSend(v32, "componentsJoinedByString:", CFSTR("&"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@?%@"), v41, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

+ (id)requestForURL:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCachePolicy:", 1);
  return v3;
}

+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("urn:ietf:wg:oauth:2.0:oob"));

  return v4;
}

+ (id)authCodeFromRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("code"));

        if (v14)
        {
          objc_msgSend(v12, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_21EC86000, v16, v17, "Extracted auth code from request URL", v19, 2u);
  }

  return v15;
}

+ (id)stateFromRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("state"));

        if (v14)
        {
          objc_msgSend(v12, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_21EC86000, v16, v17, "Extracted state from request URL", v19, 2u);
  }

  return v15;
}

+ (id)errorDomainFromRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "name", (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("error"));

        if (v15)
        {
          objc_msgSend(v13, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  DALoggingwithCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v17, v18))
  {
    objc_msgSend(v3, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_21EC86000, v17, v18, "Extracted error - %@ from request URL - %@ ", buf, 0x16u);

  }
  return v16;
}

+ (id)errorDescriptionFromRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "name", (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("error_description"));

        if (v15)
        {
          objc_msgSend(v13, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  DALoggingwithCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v17, v18))
  {
    objc_msgSend(v3, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_21EC86000, v17, v18, "Extracted error_description - %@ from request URL - %@ ", buf, 0x16u);

  }
  return v16;
}

@end
