@implementation SLGoogleLegacyTokenMigrationRequest

+ (id)urlRequestForAuthTokenFromLegacyClientToken:(id)a3 username:(id)a4 password:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[6];
  const __CFString *v38;
  id v39;
  id v40;
  const __CFString *v41;
  const __CFString *v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v37[0] = CFSTR("accountType");
  v37[1] = CFSTR("Email");
  v38 = CFSTR("HOSTED_OR_GOOGLE");
  v39 = a4;
  v28 = a5;
  v29 = v39;
  v37[2] = CFSTR("Passwd");
  v37[3] = CFSTR("service");
  v40 = v28;
  v41 = CFSTR("lso");
  v37[4] = CFSTR("source");
  v37[5] = CFSTR("clientidtoken");
  v42 = CFSTR("AppleBootstrap");
  v43 = v7;
  v30 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, v37, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://accounts.google.com/accounts/ClientLogin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithURL:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v8;
  objc_msgSend(v8, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v17, "stringByAddingPercentEscapesUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAddingPercentEscapesUsingEncoding:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@=%@"), v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addObject:", v22);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("&"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dataUsingEncoding:", 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHTTPBody:", v25);

  objc_msgSend(v27, "setCachePolicy:", 1);
  objc_msgSend(v27, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v27, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v27;
}

+ (id)urlRequestForAuthCodeFromAuthToken:(id)a3 clientID:(id)a4 scope:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?scope=%@&client_id=%@"), CFSTR("https://accounts.google.com/o/oauth2/programmatic_auth"), v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v14);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GoogleLogin auth=%@"), v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v16, CFSTR("Authorization"));
  return v15;
}

@end
