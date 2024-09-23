@implementation HMMTRVendorMetadataProduct

- (HMMTRVendorMetadataProduct)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMMTRVendorMetadataProduct *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMMTRVendorMetadataProduct *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
    _HMFPreconditionFailure();
  v8 = v7;
  objc_msgSend(v7, "hmf_numberForKey:", CFSTR("Category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[HMMTRVendorMetadataProduct initWithIdentifier:categoryNumber:](self, "initWithIdentifier:categoryNumber:", v6, v9);
    v11 = (void *)-[HMMTRVendorMetadataProduct mutableCopy](v10, "mutableCopy");
    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("Model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setModel:", v12);

    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("Name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v13);

    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("InstallationGuideURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInstallationGuideURL:", v15);

    }
    else
    {
      objc_msgSend(v11, "setInstallationGuideURL:", 0);
    }
    v19 = (HMMTRVendorMetadataProduct *)objc_msgSend(v11, "copy");

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot find category to create vendor information from dictionary: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v19 = 0;
  }

  return v19;
}

- (HMMTRVendorMetadataProduct)initWithIdentifier:(id)a3 categoryNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRVendorMetadataProduct *v9;
  uint64_t v10;
  NSNumber *identifier;
  uint64_t v12;
  NSNumber *categoryNumber;
  HMMTRVendorMetadataProduct *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMMTRVendorMetadataProduct *)_HMFPreconditionFailure();
    return (HMMTRVendorMetadataProduct *)-[HMMTRVendorMetadataProduct dictionaryRepresentation](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMMTRVendorMetadataProduct;
  v9 = -[HMMTRVendorMetadataProduct init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    v12 = objc_msgSend(v8, "copy");
    categoryNumber = v9->_categoryNumber;
    v9->_categoryNumber = (NSNumber *)v12;

  }
  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct categoryNumber](self, "categoryNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Category"));

  -[HMMTRVendorMetadataProduct name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Name"));

  -[HMMTRVendorMetadataProduct model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Model"));

  -[HMMTRVendorMetadataProduct installationGuideURL](self, "installationGuideURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("InstallationGuideURL"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRVendorMetadataProduct identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToNumber:", v9))
    {
      objc_msgSend(v7, "categoryNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataProduct categoryNumber](self, "categoryNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToNumber:", v11))
        goto LABEL_12;
      objc_msgSend(v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataProduct name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if (!v14)
        goto LABEL_12;
      objc_msgSend(v7, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataProduct model](self, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HMFEqualObjects();

      if (v17)
      {
        objc_msgSend(v7, "installationGuideURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRVendorMetadataProduct installationGuideURL](self, "installationGuideURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = HMFEqualObjects();

      }
      else
      {
LABEL_12:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMTRVendorMetadataProduct identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMTRMutableVendorMetadataProduct *v4;
  void *v5;
  void *v6;
  HMMTRMutableVendorMetadataProduct *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[HMMTRMutableVendorMetadataProduct allocWithZone:](HMMTRMutableVendorMetadataProduct, "allocWithZone:", a3);
  -[HMMTRVendorMetadataProduct identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct categoryNumber](self, "categoryNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRVendorMetadataProduct initWithIdentifier:categoryNumber:](v4, "initWithIdentifier:categoryNumber:", v5, v6);

  -[HMMTRVendorMetadataProduct name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct setName:](v7, "setName:", v8);

  -[HMMTRVendorMetadataProduct model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct setModel:](v7, "setModel:", v9);

  -[HMMTRVendorMetadataProduct installationGuideURL](self, "installationGuideURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct setInstallationGuideURL:](v7, "setInstallationGuideURL:", v10);

  return v7;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRVendorMetadataProduct identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRVendorMetadataProduct categoryNumber](self, "categoryNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Category"), v8);
  objc_msgSend(v3, "addObject:", v9);

  -[HMMTRVendorMetadataProduct name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataProduct name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Name"), v12);
    objc_msgSend(v3, "addObject:", v13);

  }
  -[HMMTRVendorMetadataProduct model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataProduct model](self, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Model"), v16);
    objc_msgSend(v3, "addObject:", v17);

  }
  -[HMMTRVendorMetadataProduct installationGuideURL](self, "installationGuideURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataProduct installationGuideURL](self, "installationGuideURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Installation Guide URL"), v20);
    objc_msgSend(v3, "addObject:", v21);

  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)categoryNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCategoryNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSURL)installationGuideURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInstallationGuideURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationGuideURL, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoryNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
