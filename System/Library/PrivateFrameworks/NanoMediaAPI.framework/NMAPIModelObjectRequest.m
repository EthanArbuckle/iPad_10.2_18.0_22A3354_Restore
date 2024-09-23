@implementation NMAPIModelObjectRequest

- (NMAPIModelObjectRequest)initWithModelObject:(id)a3
{
  id v4;
  NMAPIModelObjectRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIModelObjectRequest;
  v5 = -[MPStoreModelRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Model Object: %@"), v5->_modelObject);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMAPIModelObjectRequest setLabel:](v5, "setLabel:", v6);

    -[NMAPIModelObjectRequest setModelObject:](v5, "setModelObject:", v4);
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
  __CFString **v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  objc_super v39;
  _QWORD v40[4];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (self->_modelObject)
  {
    MusicURLPathStorefrontWithURLBag(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      NMLogForCategory(9);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:].cold.2();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MPModelObject identifiers](self->_modelObject, "identifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "universalStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "globalPlaylistID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = MediaAPIPlaylistsPathString;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = (void *)MEMORY[0x24BDD16E0];
          -[MPModelObject identifiers](self->_modelObject, "identifiers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "universalStore");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "numberWithLongLong:", objc_msgSend(v29, "adamID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = CFSTR("artists");
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("includeOnly"), CFSTR("default-playable-content"));
          v41[0] = v31;
          v32 = objc_alloc(MEMORY[0x24BDD1838]);
          objc_msgSend(&unk_24DD2C710, "componentsJoinedByString:", CFSTR(","));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v32, "initWithName:value:", CFSTR("views"), v33);
          v41[1] = v34;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_16;
        }
        else
        {
          v21 = 0;
          v20 = 0;
        }
        goto LABEL_29;
      }
      v16 = (void *)MEMORY[0x24BDD16E0];
      -[MPModelObject identifiers](self->_modelObject, "identifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "universalStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v18, "adamID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = MediaAPIAlbumsPathString;
    }
    v20 = *v12;
    v21 = 0;
    if (v11)
    {
LABEL_16:
      if (v20)
      {
        v39.receiver = self;
        v39.super_class = (Class)NMAPIModelObjectRequest;
        -[NMAPIRequest urlComponentsWithStoreURLBag:error:](&v39, sel_urlComponentsWithStoreURLBag_error_, v7, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BDD17C8];
        v40[0] = CFSTR("/v1/catalog");
        v40[1] = v8;
        v40[2] = v20;
        v40[3] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pathWithComponents:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPath:", v24);

        if (v21)
        {
          objc_msgSend(v14, "queryItems");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setQueryItems:", v26);

        }
        goto LABEL_37;
      }
      NMLogForCategory(9);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:].cold.4();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7101, 0);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v20 = 0;
LABEL_33:
        v14 = 0;
        *a4 = v36;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      v20 = 0;
      goto LABEL_36;
    }
LABEL_29:
    NMLogForCategory(9);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:].cold.3();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7101, 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_33;
    }
    v11 = 0;
LABEL_36:
    v14 = 0;
    goto LABEL_37;
  }
  NMLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:].cold.1();

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7101, 0);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_39:

  return v14;
}

- (Class)responseParserClass
{
  void *v3;
  objc_super v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NMAPIModelObjectRequest;
    -[NMAPIRequest responseParserClass](&v5, sel_responseParserClass);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NMAPIModelObjectRequest;
  v4 = -[NMAPIRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 16, self->_modelObject);
  return v5;
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObject, 0);
}

- (void)urlComponentsWithStoreURLBag:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21A803000, v0, v1, "[NMAPIRequest] Missing modelObject parameter.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)urlComponentsWithStoreURLBag:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21A803000, v0, v1, "[NMAPIRequest] Missing musicURLPath.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)urlComponentsWithStoreURLBag:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21A803000, v0, v1, "[NMAPIRequest] Missing identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)urlComponentsWithStoreURLBag:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21A803000, v0, v1, "[NMAPIRequest] Missing resourceType.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
