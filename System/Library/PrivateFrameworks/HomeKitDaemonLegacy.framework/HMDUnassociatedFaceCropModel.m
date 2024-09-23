@implementation HMDUnassociatedFaceCropModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_39751 != -1)
    dispatch_once(&hmbProperties_onceToken_39751, &__block_literal_global_39752);
  return (id)hmbProperties_properties_39753;
}

+ (id)hmbExternalRecordType
{
  return CFSTR("CameraClip");
}

+ (id)hmbQueries
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unassociatedFaceCropsBetweenDatesQueryWithIsAscending:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "unassociatedFaceCropsBetweenDatesQueryWithIsAscending:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_39742 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_39742, &__block_literal_global_13_39743);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID_39744;
}

+ (id)unassociatedFaceCropsBetweenDatesQueryWithIsAscending:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (unassociatedFaceCropsBetweenDatesQueryWithIsAscending__onceToken != -1)
    dispatch_once(&unassociatedFaceCropsBetweenDatesQueryWithIsAscending__onceToken, &__block_literal_global_17_39726);
  v4 = &unassociatedFaceCropsBetweenDatesQueryWithIsAscending__ascendingQuery;
  if (!v3)
    v4 = &unassociatedFaceCropsBetweenDatesQueryWithIsAscending__descendingQuery;
  return (id)*v4;
}

void __86__HMDUnassociatedFaceCropModel_unassociatedFaceCropsBetweenDatesQueryWithIsAscending___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D32C90];
  v14[0] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateCreated"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("dateBefore");
  v15[0] = v1;
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateCreated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("dateCreated >= :dateAfter AND dateCreated < :dateBefore ORDER BY dateCreated ASC"), CFSTR("dateAfter"), &unk_1E8B31D70, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)unassociatedFaceCropsBetweenDatesQueryWithIsAscending__ascendingQuery;
  unassociatedFaceCropsBetweenDatesQueryWithIsAscending__ascendingQuery = v4;

  v6 = (void *)MEMORY[0x1E0D32C90];
  v12[0] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateCreated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("dateBefore");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateCreated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("dateCreated > :dateAfter AND dateCreated <= :dateBefore ORDER BY dateCreated DESC"), CFSTR("dateBefore"), &unk_1E8B31D88, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)unassociatedFaceCropsBetweenDatesQueryWithIsAscending__descendingQuery;
  unassociatedFaceCropsBetweenDatesQueryWithIsAscending__descendingQuery = v10;

}

void __50__HMDUnassociatedFaceCropModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("58F70219-F689-486A-B16D-8143BD41ABDF"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_39744;
  sentinelParentUUID_sentinelParentUUID_39744 = v0;

}

void __45__HMDUnassociatedFaceCropModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("dataRepresentation");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = CFSTR("dateCreated");
  v1 = (void *)MEMORY[0x1E0D32C80];
  v2 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fieldWithClass:options:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("faceBoundingBoxData");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)hmbProperties_properties_39753;
  hmbProperties_properties_39753 = v7;

}

- (HMDUnassociatedFaceCropModel)initWithFaceCrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDUnassociatedFaceCropModel *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sentinelParentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](self, "initWithModelID:parentModelID:", v5, v6);

  objc_msgSend(v4, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedFaceCropModel setDataRepresentation:](v7, "setDataRepresentation:", v8);

  objc_msgSend(v4, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedFaceCropModel setDateCreated:](v7, "setDateCreated:", v9);

  objc_msgSend(v4, "faceBoundingBox");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[HMDUnassociatedFaceCropModel setFaceBoundingBox:](v7, "setFaceBoundingBox:", v11, v13, v15, v17);
  return v7;
}

- (id)createFaceCrop
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDUnassociatedFaceCropModel *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  HMDUnassociatedFaceCropModel *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDUnassociatedFaceCropModel dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedFaceCropModel dateCreated](self, "dateCreated");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0CBA4F8]);
    -[HMBModel hmbModelID](self, "hmbModelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnassociatedFaceCropModel faceBoundingBox](self, "faceBoundingBox");
    v8 = (void *)objc_msgSend(v6, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v7, v3, v5);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot create face crop from model: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
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
  HMDUnassociatedFaceCropModel *v15;
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
  -[HMDUnassociatedFaceCropModel faceBoundingBoxData](self, "faceBoundingBoxData");
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
  HMDUnassociatedFaceCropModel *v8;
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
    -[HMDUnassociatedFaceCropModel setFaceBoundingBoxData:](self, "setFaceBoundingBoxData:", v5);
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

@end
