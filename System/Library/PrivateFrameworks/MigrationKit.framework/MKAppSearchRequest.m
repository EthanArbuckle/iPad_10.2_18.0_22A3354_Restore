@implementation MKAppSearchRequest

- (void)search:(id)a3 androidIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  MKDevice *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc_init(MKDevice);
    v11 = -[MKDevice type](v10, "type");
    objc_msgSend(MEMORY[0x24BE08238], "createBagForSubProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08238]), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.welcomemat"), CFSTR("1"), v12);
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v13, "setBundleIdentifiers:", v7);
    if (objc_msgSend(v8, "count"))
    {
      v20 = CFSTR("androidAppId");
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFilters:", v15);

    }
    objc_msgSend(v13, "perform");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__MKAppSearchRequest_search_androidIDs_completion___block_invoke;
    v17[3] = &unk_24E359200;
    v18 = v9;
    v19 = v11;
    objc_msgSend(v16, "addFinishBlock:", v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKAppSearchRequestError"), 1, 0);
    v10 = (MKDevice *)objc_claimAutoreleasedReturnValue();
    if (v9)
      (*((void (**)(id, _QWORD, MKDevice *))v9 + 2))(v9, 0, v10);
  }

}

void __51__MKAppSearchRequest_search_androidIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  MKApp *v14;
  MKApp *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v5, "responseDataItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = -[MKApp initWithJSONData:]([MKApp alloc], "initWithJSONData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v15 = v14;
          if (v14 && -[MKApp isSupported:](v14, "isSupported:", *(_QWORD *)(a1 + 40)))
            objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      (*(void (**)(uint64_t, id, _QWORD))(v16 + 16))(v16, v8, 0);

  }
}

@end
