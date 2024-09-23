@implementation HMDCameraSignificantEventNotificationModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_27534 != -1)
    dispatch_once(&hmbProperties_onceToken_27534, &__block_literal_global_27535);
  return (id)hmbProperties__properties_27536;
}

+ (id)hmbExternalRecordType
{
  return CFSTR("CameraClipNotification");
}

+ (id)hmbQueries
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "significantEventsBetweenDatesQueryWithIsAscending:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "significantEventsBetweenDatesQueryWithIsAscending:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)significantEventsBetweenDatesQueryWithIsAscending:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (significantEventsBetweenDatesQueryWithIsAscending__onceToken != -1)
    dispatch_once(&significantEventsBetweenDatesQueryWithIsAscending__onceToken, &__block_literal_global_31);
  v4 = &significantEventsBetweenDatesQueryWithIsAscending__ascendingQuery;
  if (!v3)
    v4 = &significantEventsBetweenDatesQueryWithIsAscending__descendingQuery;
  return (id)*v4;
}

void __96__HMDCameraSignificantEventNotificationModel_significantEventsBetweenDatesQueryWithIsAscending___block_invoke()
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
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateOfOccurrence"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("dateBefore");
  v15[0] = v1;
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateOfOccurrence"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("dateOfOccurrence >= :dateAfter AND dateOfOccurrence < :dateBefore ORDER BY dateOfOccurrence ASC"), CFSTR("dateAfter"), &unk_1E8B31D40, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)significantEventsBetweenDatesQueryWithIsAscending__ascendingQuery;
  significantEventsBetweenDatesQueryWithIsAscending__ascendingQuery = v4;

  v6 = (void *)MEMORY[0x1E0D32C90];
  v12[0] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateOfOccurrence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("dateBefore");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("dateOfOccurrence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("dateOfOccurrence > :dateAfter AND dateOfOccurrence <= :dateBefore ORDER BY dateOfOccurrence DESC"), CFSTR("dateBefore"), &unk_1E8B31D58, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)significantEventsBetweenDatesQueryWithIsAscending__descendingQuery;
  significantEventsBetweenDatesQueryWithIsAscending__descendingQuery = v10;

}

void __59__HMDCameraSignificantEventNotificationModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  _QWORD v30[8];
  _QWORD v31[10];

  v31[8] = *MEMORY[0x1E0C80C00];
  v30[0] = CFSTR("significantEvent");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = CFSTR("dateOfOccurrence");
  v0 = (void *)MEMORY[0x1E0D32C80];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  v30[2] = CFSTR("timeOffsetWithinClip");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  v30[3] = CFSTR("associatedClip");
  v2 = (void *)MEMORY[0x1E0D32C80];
  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "externalRecordField:", CFSTR("r00"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fieldWithClass:options:", v3, v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v4;
  v30[4] = CFSTR("heroFrameAsset");
  v5 = (void *)MEMORY[0x1E0D32C80];
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "externalRecordField:", CFSTR("a00"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fieldWithClass:options:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v9;
  v30[5] = CFSTR("faceCropAsset");
  v10 = (void *)MEMORY[0x1E0D32C80];
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "externalRecordField:", CFSTR("a01"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fieldWithClass:options:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v14;
  v30[6] = CFSTR("homePresenceByPairingIdentity");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v15;
  v30[7] = CFSTR("confidenceLevel");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)hmbProperties__properties_27536;
  hmbProperties__properties_27536 = v17;

}

- (id)createClipSignificantEventWithCameraProfileUUID:(id)a3 faceClassification:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraSignificantEventNotificationModel *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  -[HMDCameraSignificantEventNotificationModel significantEvent](self, "significantEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel dateOfOccurrence](self, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel confidenceLevel](self, "confidenceLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel timeOffsetWithinClip](self, "timeOffsetWithinClip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel associatedClip](self, "associatedClip");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v7 && v8 && v9 && v10 && v11)
  {
    v37 = v8;
    v13 = objc_alloc(MEMORY[0x1E0CBA3E8]);
    -[HMBModel hmbModelID](self, "hmbModelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "unsignedIntegerValue");
    v16 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v10, "doubleValue");
    v18 = v17;
    objc_msgSend(v12, "hmbModelID");
    v19 = v12;
    v20 = v10;
    v21 = v9;
    v22 = v7;
    v23 = v6;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
    v8 = v37;
    v26 = (void *)objc_msgSend(v25, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v14, v15, v37, v16, v23, v39, v18, v24);

    v6 = v23;
    v7 = v22;
    v9 = v21;
    v10 = v20;
    v12 = v19;

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel debugDescription](v28, "debugDescription");
      v38 = v12;
      v31 = v9;
      v32 = v8;
      v33 = v7;
      v34 = v27;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v30;
      v42 = 2112;
      v43 = v35;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot create significant event from model: %@", buf, 0x16u);

      v27 = v34;
      v7 = v33;
      v8 = v32;
      v9 = v31;
      v12 = v38;

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
  }

  return v26;
}

@end
