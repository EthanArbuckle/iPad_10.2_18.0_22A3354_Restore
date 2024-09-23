@implementation WFGiphySessionManager

- (WFGiphySessionManager)init
{
  return -[WFGiphySessionManager initWithSessionConfiguration:](self, "initWithSessionConfiguration:", 0);
}

- (WFGiphySessionManager)initWithSessionConfiguration:(id)a3
{
  id v4;
  WFGiphySessionManager *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURLSession *session;
  uint64_t v11;
  NSURL *baseURL;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFGiphySessionManager;
  v5 = -[WFGiphySessionManager init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDB74B0];
    v7 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionWithConfiguration:delegate:delegateQueue:", v7, v5, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (NSURLSession *)v9;

    if (!v4)
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.giphy.com/v1"));
    v11 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v11;

  }
  return v5;
}

- (void)random:(id)a3
{
  -[WFGiphySessionManager sendRequestWithPath:parameters:completion:](self, "sendRequestWithPath:parameters:completion:", CFSTR("gifs/random"), 0, a3);
}

- (void)trendingWithLimit:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_opt_new();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("limit"));

  }
  -[WFGiphySessionManager sendRequestWithPath:parameters:completion:](self, "sendRequestWithPath:parameters:completion:", CFSTR("gifs/trending"), v6, v8);

}

- (void)search:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a3;
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setValue:forKey:", v9, CFSTR("q"));

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v10, CFSTR("limit"));

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("lang"));

  -[WFGiphySessionManager sendRequestWithPath:parameters:completion:](self, "sendRequestWithPath:parameters:completion:", CFSTR("gifs/search"), v13, v8);
}

- (void)sendRequestWithPath:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(a4, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  -[WFGiphySessionManager apiKey](self, "apiKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("api_key"));

  v15 = (void *)MEMORY[0x24BDD1808];
  -[WFGiphySessionManager baseURL](self, "baseURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsWithURL:resolvingAgainstBaseURL:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPercentEncodedQuery:", v19);

  -[WFGiphySessionManager session](self, "session");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __67__WFGiphySessionManager_sendRequestWithPath_parameters_completion___block_invoke;
  v24[3] = &unk_24F8BB3E0;
  v25 = v8;
  v22 = v8;
  objc_msgSend(v20, "dataTaskWithURL:completionHandler:", v21, v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resume");

}

- (NSURLSession)session
{
  return self->_session;
}

- (NSString)apiKey
{
  return self->_apiKey;
}

- (void)setApiKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_apiKey, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __67__WFGiphySessionManager_sendRequestWithPath_parameters_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char isKindOfClass;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v51 = a1;
    v67 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 1, &v67);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v67;

    if (v8)
    {
      v52 = v9;
      objc_msgSend(v8, "objectForKey:", CFSTR("data"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("image_original_url"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v49 = v8;
          v50 = v6;
          objc_msgSend(v10, "removeObjectForKey:", CFSTR("image_original_url"));
          v12 = (void *)objc_opt_new();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v55 = objc_msgSend(&unk_24F93C5A0, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
          if (v55)
          {
            v53 = *(_QWORD *)v64;
            v54 = v12;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v64 != v53)
                  objc_enumerationMutation(&unk_24F93C5A0);
                v56 = v13;
                v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v13);
                v15 = (void *)objc_opt_new();
                v59 = 0u;
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                objc_msgSend(v10, "allKeys");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = (void *)MEMORY[0x24BDD1758];
                objc_msgSend(v14, "stringByAppendingString:", CFSTR("_"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "predicateWithFormat:", CFSTR("SELF BEGINSWITH %@"), v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "filteredArrayUsingPredicate:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v60;
                  do
                  {
                    for (i = 0; i != v22; ++i)
                    {
                      if (*(_QWORD *)v60 != v23)
                        objc_enumerationMutation(v20);
                      v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                      objc_msgSend(v10, "objectForKey:", v25);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "substringFromIndex:", objc_msgSend(v14, "length") + 1);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "setObject:forKey:", v26, v27);

                      objc_msgSend(v10, "removeObjectForKey:", v25);
                    }
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
                  }
                  while (v22);
                }

                objc_msgSend(v15, "objectForKey:", CFSTR("still_url"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                v12 = v54;
                if (v28)
                {
                  v29 = (void *)objc_opt_new();
                  objc_msgSend(v15, "objectForKey:", CFSTR("still_url"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setValue:forKey:", v30, CFSTR("url"));

                  objc_msgSend(v15, "objectForKey:", CFSTR("width"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setValue:forKey:", v31, CFSTR("width"));

                  objc_msgSend(v15, "objectForKey:", CFSTR("height"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setValue:forKey:", v32, CFSTR("height"));

                  objc_msgSend(v14, "stringByAppendingString:", CFSTR("_still"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKey:", v29, v33);

                  objc_msgSend(v15, "removeObjectForKey:", CFSTR("still_url"));
                }
                objc_msgSend(v15, "objectForKey:", CFSTR("mp4_url"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v34)
                {
                  objc_msgSend(v15, "objectForKey:", CFSTR("mp4_url"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKey:", v35, CFSTR("mp4"));

                  objc_msgSend(v15, "removeObjectForKey:", CFSTR("mp4_url"));
                }
                if (objc_msgSend(v15, "count"))
                  objc_msgSend(v54, "setObject:forKey:", v15, v14);

                v13 = v56 + 1;
              }
              while (v56 + 1 != v55);
              v55 = objc_msgSend(&unk_24F93C5A0, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
            }
            while (v55);
          }
          objc_msgSend(v12, "objectForKey:", CFSTR("image"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("image"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v37, CFSTR("original"));

            objc_msgSend(v12, "removeObjectForKey:", CFSTR("image"));
          }
          objc_msgSend(v10, "objectForKey:", CFSTR("images"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addEntriesFromDictionary:", v38);

          objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("images"));
          v8 = v49;
          v6 = v50;
        }
      }
      if (*(_QWORD *)(v51 + 32))
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("data"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v41 = *(_QWORD *)(v51 + 32);
        v42 = (void *)MEMORY[0x24BEC3A08];
        v43 = objc_opt_class();
        if ((isKindOfClass & 1) != 0)
        {
          v58 = v52;
          objc_msgSend(v42, "modelsOfClass:fromJSONArray:error:", v43, v39, &v58);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v58;
        }
        else
        {
          v57 = v52;
          objc_msgSend(v42, "modelOfClass:fromJSONDictionary:error:", v43, v39, &v57);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v57;
        }
        v48 = v45;

        (*(void (**)(uint64_t, void *, id))(v41 + 16))(v41, v44, v48);
        v52 = v48;

      }
      v9 = v52;
    }
    else
    {
      v47 = *(_QWORD *)(v51 + 32);
      if (v47)
        (*(void (**)(uint64_t, _QWORD, id))(v47 + 16))(v47, 0, v9);
    }

    v7 = v9;
  }
  else
  {
    v46 = *(_QWORD *)(a1 + 32);
    if (v46)
      (*(void (**)(uint64_t, _QWORD, id))(v46 + 16))(v46, 0, v7);
  }

}

@end
