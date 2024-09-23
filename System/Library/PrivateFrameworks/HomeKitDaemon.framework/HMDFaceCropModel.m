@implementation HMDFaceCropModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken != -1)
    dispatch_once(&hmbProperties_onceToken, &__block_literal_global_860);
  return (id)hmbProperties_properties;
}

+ (id)hmbQueries
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "faceCropsForPersonUUIDQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "faceCropsWithUnassociatedFaceCropUUIDQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken != -1)
    dispatch_once(&sentinelParentUUID_onceToken, &__block_literal_global_24);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID;
}

+ (HMBModelInfiniteQuery)faceCropsForPersonUUIDQuery
{
  if (faceCropsForPersonUUIDQuery_onceToken != -1)
    dispatch_once(&faceCropsForPersonUUIDQuery_onceToken, &__block_literal_global_27);
  return (HMBModelInfiniteQuery *)(id)faceCropsForPersonUUIDQuery_query;
}

+ (HMBModelInfiniteQuery)faceCropsWithUnassociatedFaceCropUUIDQuery
{
  if (faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken != -1)
    dispatch_once(&faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken, &__block_literal_global_32);
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

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BE4ECC8];
  v5 = CFSTR("unassociatedFaceCropUUID");
  objc_msgSend(MEMORY[0x24BE4ECD0], "argumentWithPropertyName:", CFSTR("unassociatedFaceCropUUID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("unassociatedFaceCropUUID == :unassociatedFaceCropUUID"), CFSTR("unassociatedFaceCropUUID"), &unk_24E970AF0, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
  faceCropsWithUnassociatedFaceCropUUIDQuery_query = v3;

}

void __47__HMDFaceCropModel_faceCropsForPersonUUIDQuery__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BE4ECC8];
  v5 = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x24BE4ECD0], "argumentWithPropertyName:", CFSTR("personUUID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("personUUID == :personUUID"), CFSTR("personUUID"), &unk_24E970AD8, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)faceCropsForPersonUUIDQuery_query;
  faceCropsForPersonUUIDQuery_query = v3;

}

void __38__HMDFaceCropModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("C8C08B78-9E10-41CD-AC46-E879D4DF6FFA"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID;
  sentinelParentUUID_sentinelParentUUID = v0;

}

void __33__HMDFaceCropModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  _QWORD v24[2];
  _QWORD v25[7];
  _QWORD v26[9];

  v26[7] = *MEMORY[0x24BDAC8D0];
  v25[0] = CFSTR("dataRepresentation");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v25[1] = CFSTR("dateCreated");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("faceBoundingBoxData");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  v25[3] = CFSTR("person");
  v0 = (void *)MEMORY[0x24BE4ECB8];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "externalRecordField:", CFSTR("r00"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  objc_msgSend(MEMORY[0x24BE4ECC0], "queryableField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  v25[4] = CFSTR("personUUID");
  v2 = (void *)MEMORY[0x24BE4ECB8];
  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "queryableField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fieldWithClass:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v6;
  v25[5] = CFSTR("unassociatedFaceCropUUID");
  v7 = (void *)MEMORY[0x24BE4ECB8];
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "queryableField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fieldWithClass:options:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v11;
  v25[6] = CFSTR("sourceField");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)hmbProperties_properties;
  hmbProperties_properties = v13;

}

- (HMDFaceCropModel)initWithPersonFaceCrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDFaceCropModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

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
  objc_msgSend(v4, "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setPersonUUID:](v7, "setPersonUUID:", v10);

  objc_msgSend(v4, "unassociatedFaceCropUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setUnassociatedFaceCropUUID:](v7, "setUnassociatedFaceCropUUID:", v11);

  v12 = objc_msgSend(v4, "source");
  -[HMDFaceCropModel setSource:](v7, "setSource:", v12);

  return v7;
}

- (id)createPersonFaceCrop
{
  void *v3;
  void *v4;
  uint64_t v5;
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

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDFaceCropModel dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel dateCreated](self, "dateCreated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel personUUID](self, "personUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 && v4 && v5)
  {
    v7 = objc_alloc(MEMORY[0x24BDD7850]);
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
    v12 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create person face crop from model: %@", (uint8_t *)&v18, 0x16u);

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

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDFaceCropModel faceBoundingBoxData](self, "faceBoundingBoxData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v22);
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
      v14 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not deserialize face bounding box value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v7 = *MEMORY[0x24BDBF090];
      v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }

  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
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

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    -[HMDFaceCropModel setFaceBoundingBoxData:](self, "setFaceBoundingBoxData:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not serialize face bounding box value %@: %@", buf, 0x20u);

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

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setSourceField:](self, "setSourceField:", v4);

}

@end
