@implementation NMAPIRequest

- (void)setDefaultMusicRequestProperties
{
  -[MPStoreModelRequest setClientIdentifier:](self, "setClientIdentifier:", CFSTR("com.apple.NanoMusic"));
  -[MPStoreModelRequest setClientVersion:](self, "setClientVersion:", CFSTR("1"));
  -[MPStoreModelRequest setAuthenticationOptions:](self, "setAuthenticationOptions:", 3);
}

- (void)setEditorialRequestProperties
{
  -[MPStoreModelRequest setClientPlatformIdentifier:](self, "setClientPlatformIdentifier:", CFSTR("watch"));
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  NMAPIRequestOperation *v5;

  v4 = a3;
  v5 = -[NMAPIRequestOperation initWithRequest:responseHandler:]([NMAPIRequestOperation alloc], "initWithRequest:responseHandler:", self, v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NMAPIRequest;
  v4 = -[MPStoreModelRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[14] = (id)self->_cachePolicy;
    objc_storeStrong(v4 + 15, self->_cacheURL);
  }
  return v5;
}

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
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  MusicURLComponentsWithURLBag(v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setQueryItems:", MEMORY[0x24BDBD1A8]);
    -[MPStoreModelRequest clientPlatformIdentifier](self, "clientPlatformIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "queryItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD1838];
      -[MPStoreModelRequest clientPlatformIdentifier](self, "clientPlatformIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "queryItemWithName:value:", CFSTR("platform"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setQueryItems:", v14);

    }
    MusicURLQueryItemLanguageWithURLBag(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "queryItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObject:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setQueryItems:", v17);

      v18 = v8;
    }
    else
    {
      NMLogForCategory(9);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[NMAPIRequest urlComponentsWithStoreURLBag:error:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }

  }
  else
  {
    NMLogForCategory(9);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NMAPIRequest urlComponentsWithStoreURLBag:error:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

+ (id)allSupportedItemProperties
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  void *v39;
  _QWORD v40[6];
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDDCB30]);
  v51 = *MEMORY[0x24BDDC2B8];
  objc_msgSend(MEMORY[0x24BDDCC88], "allSupportedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1A8];
  v39 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v4);

  v6 = objc_alloc(MEMORY[0x24BDDCB30]);
  v49 = *MEMORY[0x24BDDC278];
  objc_msgSend(MEMORY[0x24BDDCC70], "allSupportedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithProperties:relationships:", v5, v8);

  v10 = objc_alloc(MEMORY[0x24BDDCB30]);
  v47 = *MEMORY[0x24BDDC280];
  objc_msgSend(MEMORY[0x24BDDCC78], "allSupportedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithProperties:relationships:", v5, v12);

  v14 = objc_alloc(MEMORY[0x24BDDCB30]);
  v45 = *MEMORY[0x24BDDC2F8];
  objc_msgSend(MEMORY[0x24BDDCCA0], "allSupportedProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithProperties:relationships:", v5, v16);

  v18 = objc_alloc(MEMORY[0x24BDDCB30]);
  v43 = *MEMORY[0x24BDDC2D8];
  objc_msgSend(MEMORY[0x24BDDCC90], "allSupportedProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithProperties:relationships:", v5, v20);

  v22 = objc_alloc(MEMORY[0x24BDDCB30]);
  v41 = *MEMORY[0x24BDDC2E0];
  v23 = (void *)MEMORY[0x24BDDCB30];
  v24 = *MEMORY[0x24BDDC020];
  v40[0] = *MEMORY[0x24BDDC040];
  v40[1] = v24;
  v25 = *MEMORY[0x24BDDC028];
  v40[2] = *MEMORY[0x24BDDC038];
  v40[3] = v25;
  v26 = *MEMORY[0x24BDDC030];
  v40[4] = *MEMORY[0x24BDDC018];
  v40[5] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertySetWithProperties:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v22, "initWithProperties:relationships:", v5, v29);

  objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "propertySetByCombiningWithPropertySet:", v39);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "propertySetByCombiningWithPropertySet:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "propertySetByCombiningWithPropertySet:", v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "propertySetByCombiningWithPropertySet:", v17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "propertySetByCombiningWithPropertySet:", v21);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "propertySetByCombiningWithPropertySet:", v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (id)allSupportedSectionProperties
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDDCB30]);
  v31 = *MEMORY[0x24BDDC2B8];
  objc_msgSend(MEMORY[0x24BDDCC88], "allSupportedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1A8];
  v6 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v4);

  v7 = objc_alloc(MEMORY[0x24BDDCB30]);
  v29 = *MEMORY[0x24BDDC278];
  objc_msgSend(MEMORY[0x24BDDCC70], "allSupportedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithProperties:relationships:", v5, v9);

  v11 = objc_alloc(MEMORY[0x24BDDCB30]);
  v27 = *MEMORY[0x24BDDC280];
  objc_msgSend(MEMORY[0x24BDDCC78], "allSupportedProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithProperties:relationships:", v5, v13);

  v15 = objc_alloc(MEMORY[0x24BDDCB30]);
  v25 = *MEMORY[0x24BDDC2D8];
  objc_msgSend(MEMORY[0x24BDDCC90], "allSupportedProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithProperties:relationships:", v5, v17);

  objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "propertySetByCombiningWithPropertySet:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "propertySetByCombiningWithPropertySet:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "propertySetByCombiningWithPropertySet:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "propertySetByCombiningWithPropertySet:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_cacheURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "[NMAPIRequest] Missing base url components.", a5, a6, a7, a8, 0);
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "[NMAPIRequest] Missing language query item.", a5, a6, a7, a8, 0);
}

@end
