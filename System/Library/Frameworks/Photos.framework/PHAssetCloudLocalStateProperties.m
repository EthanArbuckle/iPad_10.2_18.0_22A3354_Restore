@implementation PHAssetCloudLocalStateProperties

- (PHAssetCloudLocalStateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetCloudLocalStateProperties *v10;
  PHAssetCloudLocalStateProperties *v11;
  uint64_t v12;
  NSManagedObjectID *cloudMasterObjectID;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  void *v17;
  __int16 v18;
  objc_super v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PHAssetCloudLocalStateProperties;
  v10 = -[PHAssetCloudLocalStateProperties init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("master"));
    v12 = objc_claimAutoreleasedReturnValue();
    cloudMasterObjectID = v11->_cloudMasterObjectID;
    v11->_cloudMasterObjectID = (NSManagedObjectID *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudLocalState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v5)
      v16 = CFSTR("master.cloudLocalState");
    else
      v16 = CFSTR("cloudLocalState");
    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    v11->_assetCloudLocalState = objc_msgSend((id)objc_opt_class(), "_assetCloudLocalStateFromAssetLocalState:masterLocalState:", v15, v18);
  }

  return v11;
}

- (unsigned)assetCloudLocalState
{
  return self->_assetCloudLocalState;
}

- (NSManagedObjectID)cloudMasterObjectID
{
  return self->_cloudMasterObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudMasterObjectID, 0);
}

+ (id)entityName
{
  return CFSTR("CloudMaster");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("master");
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetCloudLocalState");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_70;
}

+ (id)additionalPropertiesToFetchOnPrimaryObject
{
  pl_dispatch_once();
  return (id)additionalPropertiesToFetchOnPrimaryObject_pl_once_object_71;
}

+ (BOOL)inverseIsToMany
{
  return 1;
}

+ (unsigned)_assetCloudLocalStateFromAssetLocalState:(signed __int16)a3 masterLocalState:(signed __int16)a4
{
  unint64_t v4;

  switch(a3)
  {
    case 1:
    case 3:
      v4 = 0x4000200030001uLL >> (16 * (a4 - 1));
      if ((a4 - 1) >= 4)
        LOWORD(v4) = 0;
      break;
    case 2:
      LOWORD(v4) = 3;
      break;
    case 4:
      LOWORD(v4) = 4;
      break;
    default:
      LOWORD(v4) = 0;
      break;
  }
  return v4;
}

void __78__PHAssetCloudLocalStateProperties_additionalPropertiesToFetchOnPrimaryObject__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cloudLocalState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)additionalPropertiesToFetchOnPrimaryObject_pl_once_object_71;
  additionalPropertiesToFetchOnPrimaryObject_pl_once_object_71 = v1;

}

void __53__PHAssetCloudLocalStateProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("objectID");
  v3[1] = CFSTR("cloudLocalState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_70;
  propertiesToFetch_pl_once_object_70 = v1;

}

@end
