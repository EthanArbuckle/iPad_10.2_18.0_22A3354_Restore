@implementation NMAPISearchRequest

- (NMAPISearchRequest)initWithSearchString:(id)a3
{
  id v4;
  NMAPISearchRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPISearchRequest;
  v5 = -[MPStoreModelRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Catalog Search (%@)"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMAPISearchRequest setLabel:](v5, "setLabel:", v6);

    -[NMAPISearchRequest setSearchString:](v5, "setSearchString:", v4);
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
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  objc_super v48;
  _QWORD v49[3];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (self->_searchString)
  {
    MusicURLPathStorefrontWithURLBag(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v48.receiver = self;
      v48.super_class = (Class)NMAPISearchRequest;
      v47 = v7;
      -[NMAPIRequest urlComponentsWithStoreURLBag:error:](&v48, sel_urlComponentsWithStoreURLBag_error_, v7, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_resultsPerSection)
      {
        v10 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "queryItemWithName:value:", CFSTR("limit"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "queryItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayByAddingObject:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setQueryItems:", v15);

      }
      v16 = (void *)MEMORY[0x24BDD17C8];
      v50[0] = CFSTR("/v1/catalog");
      v50[1] = v8;
      v50[2] = CFSTR("search");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pathWithComponents:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPath:", v18);

      objc_msgSend(v9, "queryItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("term"), self->_searchString);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v20;
      v21 = (void *)MEMORY[0x24BDD1838];
      v22 = v8;
      objc_msgSend(&unk_24DD2C728, "componentsJoinedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "queryItemWithName:value:", CFSTR("types"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v24;
      v25 = (void *)MEMORY[0x24BDD1838];
      objc_msgSend(&unk_24DD2C740, "componentsJoinedByString:", CFSTR(","));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "queryItemWithName:value:", CFSTR("with"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v27;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setQueryItems:", v29);

      v8 = v22;
      v7 = v47;
    }
    else
    {
      NMLogForCategory(9);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }

  }
  else
  {
    NMLogForCategory(9);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[NMAPISearchRequest urlComponentsWithStoreURLBag:error:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7101, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NMAPISearchRequest;
  v4 = -[NMAPIRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 16, self->_searchString);
    v5[17] = (id)self->_resultsPerSection;
  }
  return v5;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)resultsPerSection
{
  return self->_resultsPerSection;
}

- (void)setResultsPerSection:(unint64_t)a3
{
  self->_resultsPerSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "[NMAPIRequest] Missing searchString parameter.", a5, a6, a7, a8, 0);
}

@end
