@implementation HDReferenceExtractionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *resources;
  id v5;

  resources = self->_resources;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", resources, CFSTR("Resources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FHIRResourceData, CFSTR("FHIRResourceData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverBaseURL, CFSTR("ServerBaseURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FHIRRelease, CFSTR("FHIRRelease"));

}

- (HDReferenceExtractionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HDReferenceExtractionRequest *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HDReferenceExtractionRequest *v14;
  HDReferenceExtractionRequest *v15;
  uint64_t v16;
  NSString *FHIRRelease;
  objc_super v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("Resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("FHIRResourceData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "count");
  if (v9 + objc_msgSend(v8, "count"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerBaseURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRRelease"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      v19.receiver = self;
      v19.super_class = (Class)HDReferenceExtractionRequest;
      v14 = -[HDReferenceExtractionRequest init](&v19, sel_init);
      v15 = v14;
      if (v14)
      {
        objc_storeStrong((id *)&v14->_resources, v6);
        objc_storeStrong((id *)&v15->_FHIRResourceData, v8);
        objc_storeStrong((id *)&v15->_serverBaseURL, v11);
        HKFHIRReleaseFromNSString();
        v16 = objc_claimAutoreleasedReturnValue();
        FHIRRelease = v15->_FHIRRelease;
        v15->_FHIRRelease = (NSString *)v16;

      }
      self = v15;
      v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
    v10 = 0;
  }

  return v10;
}

- (HDReferenceExtractionRequest)initWithResources:(id)a3 FHIRResourceData:(id)a4 serverBaseURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  HDReferenceExtractionRequest *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HDReferenceExtractionRequest *v22;
  uint64_t v23;
  NSArray *resources;
  uint64_t v25;
  NSArray *FHIRResourceData;
  uint64_t v27;
  NSURL *serverBaseURL;
  uint64_t v29;
  NSString *FHIRRelease;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if (v11 + objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "hk_mapToSet:", &__block_literal_global_7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(v9, "hk_mapToSet:", &__block_literal_global_197_0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    objc_msgSend(v16, "setByAddingObjectsFromSet:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v21, "count") <= 1)
    {
      v32.receiver = self;
      v32.super_class = (Class)HDReferenceExtractionRequest;
      v22 = -[HDReferenceExtractionRequest init](&v32, sel_init);
      if (v22)
      {
        v23 = objc_msgSend(v8, "copy");
        resources = v22->_resources;
        v22->_resources = (NSArray *)v23;

        v25 = objc_msgSend(v9, "copy");
        FHIRResourceData = v22->_FHIRResourceData;
        v22->_FHIRResourceData = (NSArray *)v25;

        v27 = objc_msgSend(v10, "copy");
        serverBaseURL = v22->_serverBaseURL;
        v22->_serverBaseURL = (NSURL *)v27;

        objc_msgSend(v21, "anyObject");
        v29 = objc_claimAutoreleasedReturnValue();
        FHIRRelease = v22->_FHIRRelease;
        v22->_FHIRRelease = (NSString *)v29;

      }
      self = v22;
      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __81__HDReferenceExtractionRequest_initWithResources_FHIRResourceData_serverBaseURL___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "FHIRVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "FHIRRelease");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __81__HDReferenceExtractionRequest_initWithResources_FHIRResourceData_serverBaseURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "FHIRVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "FHIRRelease");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)resources
{
  return self->_resources;
}

- (NSArray)FHIRResourceData
{
  return self->_FHIRResourceData;
}

- (NSURL)serverBaseURL
{
  return self->_serverBaseURL;
}

- (NSString)FHIRRelease
{
  return self->_FHIRRelease;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRRelease, 0);
  objc_storeStrong((id *)&self->_serverBaseURL, 0);
  objc_storeStrong((id *)&self->_FHIRResourceData, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
