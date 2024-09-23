@implementation NMAPIRadioRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[4];
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NMAPIRadioRequest;
  -[NMAPIRequest urlComponentsWithStoreURLBag:error:](&v43, sel_urlComponentsWithStoreURLBag_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MusicURLPathStorefrontWithURLBag(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x24BEC86F0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("radioTabGroupingName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      v45[0] = CFSTR("/v1/editorial");
      v45[1] = v8;
      v45[2] = CFSTR("groupings");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathWithComponents:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPath:", v13);

      objc_msgSend(v7, "queryItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v9;
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("name"), v10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v40;
      v15 = (void *)MEMORY[0x24BDD1838];
      objc_msgSend(&unk_24DD2C758, "componentsJoinedByString:", CFSTR(","));
      v41 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "queryItemWithName:value:", CFSTR("include"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v17;
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("include[stations]"), CFSTR("events"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v18;
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("art[url]"), CFSTR("f,c"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setQueryItems:", v21);

      v9 = v42;
      v10 = v41;

      v22 = v7;
    }
    else
    {
      NMLogForCategory(9);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }

  }
  else
  {
    NMLogForCategory(9);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "[NMAPIRequest] Missing musicURLPath.", a5, a6, a7, a8, 0);
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "[NMAPIRequest] Missing radioGroupingName.", a5, a6, a7, a8, 0);
}

@end
