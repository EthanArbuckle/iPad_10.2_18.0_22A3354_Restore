@implementation DESInternalDodMLTask

- (DESInternalDodMLTask)initWithRecipe:(id)a3 matchingRecordSet:(id)a4 baseURL:(id)a5 localIdentifier:(id)a6 recipePath:(id)a7 uploadTransport:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  DESInternalDodMLTask *v19;
  DESInternalDodMLTask *v20;
  NSString *v21;
  NSString *localeIdentifier;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)DESInternalDodMLTask;
  v19 = -[DESInternalDodMLTask init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_recipe, a3);
    objc_storeStrong((id *)&v20->_matchingRecordSet, a4);
    objc_storeStrong((id *)&v20->_baseURL, a5);
    if (v16)
    {
      v21 = (NSString *)v16;
    }
    else
    {
      DESGetDeviceLocale();
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    localeIdentifier = v20->_localeIdentifier;
    v20->_localeIdentifier = v21;

    objc_storeStrong((id *)&v20->_testingRecipePath, a7);
    objc_storeStrong((id *)&v20->_uploadTransport, a8);
  }

  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTask recipe](self, "recipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTask matchingRecordSet](self, "matchingRecordSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTask baseURL](self, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTask localeIdentifier](self, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTask testingRecipePath](self, "testingRecipePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTask uploadTransport](self, "uploadTransport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@, %@, %@, %@, %@, %@)"), v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  DESRecordSet *matchingRecordSet;
  DESUploadTransport *uploadTransport;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_recipe, CFSTR("recipe"));
  matchingRecordSet = self->_matchingRecordSet;
  if (matchingRecordSet)
    objc_msgSend(v6, "encodeObject:forKey:", matchingRecordSet, CFSTR("matchingRecordSet"));
  uploadTransport = self->_uploadTransport;
  if (uploadTransport)
    objc_msgSend(v6, "encodeObject:forKey:", uploadTransport, CFSTR("uploadTransport"));

}

- (DESInternalDodMLTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DESInternalDodMLTask *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipe"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadTransport"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingRecordSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DESGetDeviceLocale();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[DESInternalDodMLTask initWithRecipe:matchingRecordSet:baseURL:localIdentifier:recipePath:uploadTransport:](self, "initWithRecipe:matchingRecordSet:baseURL:localIdentifier:recipePath:uploadTransport:", v5, v7, 0, v8, 0, v6);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (DESRecipe)recipe
{
  return self->_recipe;
}

- (DESRecordSet)matchingRecordSet
{
  return self->_matchingRecordSet;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)testingRecipePath
{
  return self->_testingRecipePath;
}

- (DESUploadTransport)uploadTransport
{
  return self->_uploadTransport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadTransport, 0);
  objc_storeStrong((id *)&self->_testingRecipePath, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_matchingRecordSet, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
