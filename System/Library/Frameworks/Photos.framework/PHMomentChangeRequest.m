@implementation PHMomentChangeRequest

- (PHMomentChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHMomentChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  id *v14;
  void (**v15)(_QWORD);
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id *v24;
  id v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PHMomentChangeRequest;
  v11 = -[PHChangeRequest init](&v26, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __69__PHMomentChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
    v23 = &unk_1E35DF9E8;
    v14 = v11;
    v24 = v14;
    v25 = v9;
    v15 = (void (**)(_QWORD))_Block_copy(&v20);
    PLArrayFromXPCDictionary();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy", v20, v21, v22, v23);
    v18 = v14[4];
    v14[4] = (id)v17;

    if (objc_msgSend(v14[4], "count"))
      v15[2](v15);

  }
  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToXPCDict:", v5);

  if (self->_assetSearchEntities)
    PLXPCDictionarySetArray();

}

- (void)addAssetSearchEntityWithLabel:(id)a3 identifier:(id)a4 type:(unint64_t)a5 confidence:(double)a6 dateInterval:(id)a7 synonyms:(id)a8
{
  unint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;

  v25 = (unint64_t)a3;
  v15 = (unint64_t)a4;
  v16 = a7;
  v17 = a8;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMomentChangeRequest.m"), 72, CFSTR("Must specify a type"));

  }
  if (!(v25 | v15))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMomentChangeRequest.m"), 73, CFSTR("Must specify a label or identifier"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("type"));

  if (v25)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("label"));
  if (v15)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("identifier"));
  if (a6 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D72A80]);

  }
  if (v16)
  {
    objc_msgSend(v16, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D72A90]);

    objc_msgSend(v16, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D72A88]);

  }
  if (v17)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("synonyms"));
  -[NSMutableArray addObject:](self->_assetSearchEntities, "addObject:", v18);
  -[PHChangeRequest didMutate](self, "didMutate");

}

- (PHMomentChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHMomentChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  uint64_t v11;
  NSMutableArray *assetSearchEntities;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHMomentChangeRequest;
  v8 = -[PHChangeRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    assetSearchEntities = v8->_assetSearchEntities;
    v8->_assetSearchEntities = (NSMutableArray *)v11;

  }
  return v8;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v14;

  v8 = a4;
  v9 = a3;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v9, v8, &v14);

  v12 = v14;
  if (a5 && (v11 & 1) == 0)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PHChangeRequest helper](self, "helper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v8, "applyMutationsToManagedObject:error:", v7, &v16);
  v10 = v16;

  if (v9)
  {
    if (!self->_assetSearchEntities)
    {
LABEL_5:
      v11 = 1;
      goto LABEL_11;
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D71AC0], "setAssetSearchEntitiesFromDictionaries:onMoment:");
      goto LABEL_5;
    }
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[PHChangeRequest objectID](self, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pl_shortURI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Expected to find a moment for objectID %{public}@", buf, 0xCu);

    }
  }
  v11 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v10);
LABEL_11:

  return v11;
}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("Moment");
}

- (float)aggregationScore
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("aggregationScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)setAggregationScore:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("aggregationScore"));

}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("title"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("title"));
  }

}

- (NSString)subtitle
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("subtitle"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("subtitle"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("subtitle"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("subtitle"));
  }

}

- (NSArray)localizedLocationNames
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("localizedLocationNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setLocalizedLocationNames:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("localizedLocationNames"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("localizedLocationNames"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("localizedLocationNames"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("localizedLocationNames"));
  }

}

- (unsigned)processedLocation
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("processedLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setProcessedLocation:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("processedLocation"));

}

- (NSMutableArray)assetSearchEntities
{
  return self->_assetSearchEntities;
}

- (void)setAssetSearchEntities:(id)a3
{
  objc_storeStrong((id *)&self->_assetSearchEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSearchEntities, 0);
}

uint64_t __69__PHMomentChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)changeRequestForMoment:(id)a3
{
  id v3;
  PHMomentChangeRequest *v4;
  void *v5;
  void *v6;
  PHMomentChangeRequest *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHMomentChangeRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHMomentChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
