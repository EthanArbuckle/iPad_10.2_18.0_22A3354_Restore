@implementation HMDFaceCropModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken != -1)
    dispatch_once(&hmbProperties_onceToken, &__block_literal_global_626);
  return (id)hmbProperties_properties;
}

+ (id)hmbQueries
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "faceCropsForPersonQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "faceCropsWithUnassociatedFaceCropUUIDQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken != -1)
    dispatch_once(&sentinelParentUUID_onceToken, &__block_literal_global_22);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID;
}

+ (HMBModelInfiniteQuery)faceCropsForPersonQuery
{
  if (faceCropsForPersonQuery_onceToken != -1)
    dispatch_once(&faceCropsForPersonQuery_onceToken, &__block_literal_global_25);
  return (HMBModelInfiniteQuery *)(id)faceCropsForPersonQuery_query;
}

+ (HMBModelInfiniteQuery)faceCropsWithUnassociatedFaceCropUUIDQuery
{
  if (faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken != -1)
    dispatch_once(&faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken, &__block_literal_global_30);
  return (HMBModelInfiniteQuery *)(id)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
}

void __62__HMDFaceCropModel_faceCropsWithUnassociatedFaceCropUUIDQuery__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D32C90];
  v5 = CFSTR("unassociatedFaceCropUUID");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("unassociatedFaceCropUUID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("unassociatedFaceCropUUID == :unassociatedFaceCropUUID"), CFSTR("unassociatedFaceCropUUID"), &unk_1E8B31BC0, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
  faceCropsWithUnassociatedFaceCropUUIDQuery_query = v3;

}

void __43__HMDFaceCropModel_faceCropsForPersonQuery__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D32C90];
  v5 = CFSTR("person");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("person"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("person == :person"), CFSTR("person"), &unk_1E8B31BA8, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)faceCropsForPersonQuery_query;
  faceCropsForPersonQuery_query = v3;

}

void __38__HMDFaceCropModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C8C08B78-9E10-41CD-AC46-E879D4DF6FFA"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID;
  sentinelParentUUID_sentinelParentUUID = v0;

}

void __33__HMDFaceCropModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[6];
  _QWORD v20[8];

  v20[6] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("dataRepresentation");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("dateCreated");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  v19[2] = CFSTR("faceBoundingBoxData");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  v19[3] = CFSTR("person");
  v0 = (void *)MEMORY[0x1E0D32C80];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "externalRecordField:", CFSTR("r00"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v5;
  v19[4] = CFSTR("unassociatedFaceCropUUID");
  v6 = (void *)MEMORY[0x1E0D32C80];
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fieldWithClass:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v10;
  v19[5] = CFSTR("sourceField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)hmbProperties_properties;
  hmbProperties_properties = v12;

}

- (HMDFaceCropModel)initWithPersonFaceCrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDFaceCropModel *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sentinelParentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](self, "initWithModelID:parentModelID:", v5, v6);

  objc_msgSend(v4, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setDataRepresentation:](v7, "setDataRepresentation:", v8);

  objc_msgSend(v4, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setDateCreated:](v7, "setDateCreated:", v9);

  objc_msgSend(v4, "faceBoundingBox");
  -[HMDFaceCropModel setFaceBoundingBox:](v7, "setFaceBoundingBox:");
  v10 = objc_alloc(MEMORY[0x1E0D32C68]);
  objc_msgSend(v4, "personUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithModelID:action:", v11, 1);
  -[HMDFaceCropModel setPerson:](v7, "setPerson:", v12);

  objc_msgSend(v4, "unassociatedFaceCropUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setUnassociatedFaceCropUUID:](v7, "setUnassociatedFaceCropUUID:", v13);

  v14 = objc_msgSend(v4, "source");
  -[HMDFaceCropModel setSource:](v7, "setSource:", v14);

  return v7;
}

- (id)createPersonFaceCrop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDFaceCropModel *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDFaceCropModel dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel dateCreated](self, "dateCreated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && v4 && v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CBA6E0]);
    -[HMBModel hmbModelID](self, "hmbModelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDFaceCropModel faceBoundingBox](self, "faceBoundingBox");
    v9 = (void *)objc_msgSend(v7, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v8, v3, v4, v6);

    -[HMDFaceCropModel unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnassociatedFaceCropUUID:", v10);

    objc_msgSend(v9, "setSource:", -[HMDFaceCropModel source](self, "source"));
    v11 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel debugDescription](v13, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create person face crop from model: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (CGRect)faceBoundingBox
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  HMDFaceCropModel *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  CGRect result;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMDFaceCropModel faceBoundingBoxData](self, "faceBoundingBoxData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v4)
    {
      objc_msgSend(v4, "rectValue");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not deserialize face bounding box value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v7 = *MEMORY[0x1E0C9D648];
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setFaceBoundingBox:(CGRect)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDFaceCropModel *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    -[HMDFaceCropModel setFaceBoundingBoxData:](self, "setFaceBoundingBoxData:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not serialize face bounding box value %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (int64_t)source
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HMDFaceCropModel sourceField](self, "sourceField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDFaceCropModel sourceField](self, "sourceField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setSource:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setSourceField:](self, "setSourceField:", v4);

}

@end
