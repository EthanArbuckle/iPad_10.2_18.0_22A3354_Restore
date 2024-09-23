@implementation WFWordPressAccount

- (id)decodeValueForKey:(id)a3 withCoder:(id)a4 modelVersion:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  if (a5 || !objc_msgSend(v8, "isEqualToString:", CFSTR("endpointURL")))
  {
    v13.receiver = self;
    v13.super_class = (Class)WFWordPressAccount;
    -[MTLModel decodeValueForKey:withCoder:modelVersion:](&v13, sel_decodeValueForKey_withCoder_modelVersion_, v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blog"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpointURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWordPressAccount;
  if (!-[WFPasswordAccount isValid](&v6, sel_isValid))
    return 0;
  -[WFWordPressAccount endpointURL](self, "endpointURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("%1$@ (%2$@)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPasswordAccount username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressAccount endpointURL](self, "endpointURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4;
  WFWordPressSessionManager *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(WFWordPressSessionManager);
  -[WFPasswordAccount username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setUsername:](v5, "setUsername:", v6);

  -[WFPasswordAccount password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setPassword:](v5, "setPassword:", v7);

  -[WFWordPressAccount endpointURL](self, "endpointURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setEndpointURL:](v5, "setEndpointURL:", v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__WFWordPressAccount_refreshWithCompletionHandler___block_invoke;
  v10[3] = &unk_24F8B9110;
  v11 = v4;
  v9 = v4;
  -[WFWordPressSessionManager getBlogsWithCompletionHandler:](v5, "getBlogsWithCompletionHandler:", v10);

}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointURL, 0);
}

uint64_t __51__WFWordPressAccount_refreshWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)serviceID
{
  return CFSTR("is.workflow.my.app.wordpress");
}

+ (id)serviceName
{
  return CFSTR("WordPress");
}

+ (id)localizedServiceName
{
  return WFLocalizedString(CFSTR("WordPress"));
}

+ (BOOL)allowsMultipleAccounts
{
  return 1;
}

+ (unint64_t)modelVersion
{
  return 1;
}

+ (id)accountWithUsername:(id)a3 password:(id)a4 endpointURL:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "accountWithUsername:password:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEndpointURL:", v8);

  return v9;
}

+ (void)loginWithUsername:(id)a3 password:(id)a4 blogURL:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__37122;
  v37[4] = __Block_byref_object_dispose__37123;
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("xmlrpc.php"));
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke;
  aBlock[3] = &unk_24F8B7738;
  v14 = v9;
  v33 = v14;
  v15 = v10;
  v34 = v15;
  v36 = v37;
  v16 = v12;
  v35 = v16;
  v17 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 200, 100);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  v25 = 3221225472;
  v26 = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_3;
  v27 = &unk_24F8B7760;
  v20 = v18;
  v28 = v20;
  v21 = v17;
  v30 = v21;
  v22 = v11;
  v29 = v22;
  v31 = v37;
  objc_msgSend(v19, "dataTaskWithURL:completionHandler:", v22, &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resume", v24, v25, v26, v27);

  _Block_object_dispose(v37, 8);
}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke(uint64_t a1)
{
  WFWordPressSessionManager *v2;
  id v3;
  WFWordPressSessionManager *v4;
  _QWORD v5[4];
  WFWordPressSessionManager *v6;
  id v7;

  v2 = objc_alloc_init(WFWordPressSessionManager);
  -[WFWordPressSessionManager setUsername:](v2, "setUsername:", *(_QWORD *)(a1 + 32));
  -[WFWordPressSessionManager setPassword:](v2, "setPassword:", *(_QWORD *)(a1 + 40));
  -[WFWordPressSessionManager setEndpointURL:](v2, "setEndpointURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_2;
  v5[3] = &unk_24F8BABC0;
  v3 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  -[WFWordPressSessionManager getBlogsWithCompletionHandler:](v4, "getBlogsWithCompletionHandler:", v5);

}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  _OWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v8, "statusCode")) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", CFSTR("rsd.xml"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v9;
    +[ONOXMLDocument HTMLDocumentWithData:error:](ONOXMLDocument, "HTMLDocumentWithData:error:", v7, &v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v29;

    memset(v28, 0, sizeof(v28));
    objc_msgSend(v11, "XPath:", CFSTR("//head/link[@rel=\"EditURI\"]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v28, v30, 16))
    {
      v14 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(**((id **)&v28[0] + 1), "valueForAttribute:", CFSTR("href"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = v10;
      v19 = v18;

      v10 = v19;
    }

    objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_4;
    v24[3] = &unk_24F8BAF58;
    v25 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v26 = v21;
    v27 = v22;
    objc_msgSend(v20, "dataTaskWithURL:completionHandler:", v10, v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

    v9 = v12;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v8, "statusCode")) & 1) != 0)
  {
    v31 = v7;
    v44 = v9;
    +[ONOXMLDocument XMLDocumentWithData:error:](ONOXMLDocument, "XMLDocumentWithData:error:", v7, &v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v44;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = v10;
    objc_msgSend(v10, "rootElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "childrenWithTag:", CFSTR("service"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v34 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v41;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(obj);
          v35 = v13;
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v14, "firstChildWithTag:", CFSTR("apis"), v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "childrenWithTag:", CFSTR("api"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v37 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                objc_msgSend(v21, "valueForAttribute:", CFSTR("name"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("WordPress"));

                if (v23)
                {
                  v24 = (void *)MEMORY[0x24BDBCF48];
                  objc_msgSend(v21, "valueForAttribute:", CFSTR("apiLink"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "URLWithString:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                  v28 = v26;
                  if (!v26)
                    v28 = *(void **)(v27 + 40);
                  objc_storeStrong((id *)(v27 + 40), v28);

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v18);
          }

          v13 = v35 + 1;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v34);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = v29;
    v7 = v31;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (*v10)(uint64_t, _QWORD);
  id v11;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "username");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endpointURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFWordPressAccount accountWithUsername:password:endpointURL:](WFWordPressAccount, "accountWithUsername:password:endpointURL:", v11, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v9, v6);

  }
  else
  {
    v10 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v11 = a3;
    v10(v3, 0);
  }

}

@end
