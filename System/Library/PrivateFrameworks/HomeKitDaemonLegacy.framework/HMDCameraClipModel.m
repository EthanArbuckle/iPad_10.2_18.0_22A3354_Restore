@implementation HMDCameraClipModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_182293 != -1)
    dispatch_once(&hmbProperties_onceToken_182293, &__block_literal_global_182294);
  return (id)hmbProperties_properties_182295;
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "incompleteClipsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(a1, "clipsWithNeedsUploadFeedbackStatusQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(a1, "clipsBeforeDateQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(a1, "clipsWithQualityBetweenDatesAscendingQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(a1, "clipsWithQualityBetweenDatesDescendingQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(a1, "countOfClipsWithQualityBetweenDatesQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_182284 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_182284, &__block_literal_global_42_182285);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID_182286;
}

+ (HMBModelInfiniteQuery)incompleteClipsQuery
{
  if (incompleteClipsQuery_onceToken != -1)
    dispatch_once(&incompleteClipsQuery_onceToken, &__block_literal_global_46_182276);
  return (HMBModelInfiniteQuery *)(id)incompleteClipsQuery_query;
}

+ (HMBModelInfiniteQuery)clipsWithNeedsUploadFeedbackStatusQuery
{
  if (clipsWithNeedsUploadFeedbackStatusQuery_onceToken != -1)
    dispatch_once(&clipsWithNeedsUploadFeedbackStatusQuery_onceToken, &__block_literal_global_51_182268);
  return (HMBModelInfiniteQuery *)(id)clipsWithNeedsUploadFeedbackStatusQuery_query;
}

+ (HMBModelInfiniteQuery)clipsBeforeDateQuery
{
  if (clipsBeforeDateQuery_onceToken != -1)
    dispatch_once(&clipsBeforeDateQuery_onceToken, &__block_literal_global_57_182264);
  return (HMBModelInfiniteQuery *)(id)clipsBeforeDateQuery_query;
}

+ (HMBModelInfiniteQuery)clipsWithQualityBetweenDatesAscendingQuery
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HMDCameraClipModel_clipsWithQualityBetweenDatesAscendingQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (clipsWithQualityBetweenDatesAscendingQuery_onceToken != -1)
    dispatch_once(&clipsWithQualityBetweenDatesAscendingQuery_onceToken, block);
  return (HMBModelInfiniteQuery *)(id)clipsWithQualityBetweenDatesAscendingQuery_query;
}

+ (HMBModelInfiniteQuery)clipsWithQualityBetweenDatesDescendingQuery
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDCameraClipModel_clipsWithQualityBetweenDatesDescendingQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (clipsWithQualityBetweenDatesDescendingQuery_onceToken != -1)
    dispatch_once(&clipsWithQualityBetweenDatesDescendingQuery_onceToken, block);
  return (HMBModelInfiniteQuery *)(id)clipsWithQualityBetweenDatesDescendingQuery_query;
}

+ (HMBModelCountMatchesQuery)countOfClipsWithQualityBetweenDatesQuery
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HMDCameraClipModel_countOfClipsWithQualityBetweenDatesQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (countOfClipsWithQualityBetweenDatesQuery_onceToken != -1)
    dispatch_once(&countOfClipsWithQualityBetweenDatesQuery_onceToken, block);
  return (HMBModelCountMatchesQuery *)(id)countOfClipsWithQualityBetweenDatesQuery_query;
}

+ (id)qualityPredicate
{
  return CFSTR("IFNULL(qualityField, X'0000000000000000') == :quality");
}

void __62__HMDCameraClipModel_countOfClipsWithQualityBetweenDatesQuery__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "qualityPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ AND startDate >= :dateAfter AND startDate < :dateBefore"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D32C78];
  v11[0] = CFSTR("quality");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("qualityField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("dateBefore");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryWithSQLPredicate:indexedProperties:arguments:", v3, &unk_1E8B323B8, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)countOfClipsWithQualityBetweenDatesQuery_query;
  countOfClipsWithQualityBetweenDatesQuery_query = v9;

}

void __65__HMDCameraClipModel_clipsWithQualityBetweenDatesDescendingQuery__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "qualityPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ AND startDate > :dateAfter AND startDate <= :dateBefore ORDER BY startDate DESC"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D32C90];
  v11[0] = CFSTR("quality");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("qualityField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("dateBefore");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", v3, CFSTR("dateBefore"), &unk_1E8B323A0, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)clipsWithQualityBetweenDatesDescendingQuery_query;
  clipsWithQualityBetweenDatesDescendingQuery_query = v9;

}

void __64__HMDCameraClipModel_clipsWithQualityBetweenDatesAscendingQuery__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "qualityPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ AND startDate >= :dateAfter AND startDate < :dateBefore ORDER BY startDate ASC"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D32C90];
  v11[0] = CFSTR("quality");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("qualityField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("dateBefore");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", v3, CFSTR("dateAfter"), &unk_1E8B32388, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)clipsWithQualityBetweenDatesAscendingQuery_query;
  clipsWithQualityBetweenDatesAscendingQuery_query = v9;

}

void __42__HMDCameraClipModel_clipsBeforeDateQuery__block_invoke()
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
  v5 = CFSTR("dateBefore");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("startDate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("startDate <= :dateBefore ORDER BY startDate DESC"), CFSTR("dateBefore"), &unk_1E8B32370, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)clipsBeforeDateQuery_query;
  clipsBeforeDateQuery_query = v3;

}

void __61__HMDCameraClipModel_clipsWithNeedsUploadFeedbackStatusQuery__block_invoke()
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
  v5 = CFSTR("feedbackStatusField");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:defaultValue:", CFSTR("feedbackStatusField"), &unk_1E8B35298);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("feedbackStatusField == :feedbackStatusField"), CFSTR("feedbackStatusField"), &unk_1E8B32358, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)clipsWithNeedsUploadFeedbackStatusQuery_query;
  clipsWithNeedsUploadFeedbackStatusQuery_query = v3;

}

void __42__HMDCameraClipModel_incompleteClipsQuery__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D32C90];
  v8[0] = CFSTR("isComplete");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:defaultValue:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("startDate");
  v9[0] = v1;
  v2 = (void *)MEMORY[0x1E0D32C98];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "argumentWithPropertyName:defaultValue:", CFSTR("startDate"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("isComplete == :isComplete AND startDate <= :startDate ORDER BY startDate DESC"), CFSTR("startDate"), &unk_1E8B32340, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)incompleteClipsQuery_query;
  incompleteClipsQuery_query = v6;

}

void __40__HMDCameraClipModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C795FE32-95CB-4EE4-9197-6E572C6C2365"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_182286;
  sentinelParentUUID_sentinelParentUUID_182286 = v0;

}

void __35__HMDCameraClipModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[14];
  _QWORD v52[16];

  v52[14] = *MEMORY[0x1E0C80C00];
  v51[0] = CFSTR("startDate");
  v0 = (void *)MEMORY[0x1E0D32C80];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v41;
  v51[1] = CFSTR("isComplete");
  v2 = (void *)MEMORY[0x1E0D32C80];
  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fieldWithClass:options:", v3, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v38;
  v51[2] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v37;
  v51[3] = CFSTR("targetFragmentDuration");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v36;
  v51[4] = CFSTR("maximumClipDuration");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v35;
  v51[5] = CFSTR("recordedLocally");
  v4 = (void *)MEMORY[0x1E0D32C80];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "excludeFromCloudStorage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fieldWithClass:options:", v5, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v32;
  v51[6] = CFSTR("streamingAssetVersion");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v31;
  v51[7] = CFSTR("encryptionKey");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v30;
  v51[8] = CFSTR("encryptionScheme");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v29;
  v51[9] = CFSTR("videoStreamingAsset");
  v6 = (void *)MEMORY[0x1E0D32C80];
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "externalRecordField:", CFSTR("sa00"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fieldWithClass:options:", v7, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v26;
  v51[10] = CFSTR("videoMetadata");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v25;
  v51[11] = CFSTR("videoMetadataArray");
  v8 = (void *)MEMORY[0x1E0D32C80];
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "encryptedExternalRecordField:", CFSTR("ebl00"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fieldWithClass:options:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v12;
  v51[12] = CFSTR("feedbackStatusField");
  v13 = (void *)MEMORY[0x1E0D32C80];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fieldWithClass:options:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v17;
  v51[13] = CFSTR("qualityField");
  v18 = (void *)MEMORY[0x1E0D32C80];
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fieldWithClass:options:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 14);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)hmbProperties_properties_182295;
  hmbProperties_properties_182295 = v23;

}

- (id)createClipWithSignificantEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDCameraClipModel *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  float v29;
  double v30;
  float v31;
  double v32;
  uint64_t v33;
  _BOOL8 v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[5];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  if (!v49)
    _HMFPreconditionFailure();
  -[HMDCameraClipModel encryptionKey](self, "encryptionKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel encryptionScheme](self, "encryptionScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel targetFragmentDuration](self, "targetFragmentDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel isComplete](self, "isComplete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel streamingAssetVersion](self, "streamingAssetVersion");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v4 && v5 && v6 && v7 && v8 && v9 && v10)
  {
    v43 = v7;
    v45 = v6;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA3D0]), "initWithKey:scheme:", v4, objc_msgSend(v5, "unsignedIntegerValue"));
    -[HMDCameraClipModel videoMetadataArray](self, "videoMetadataArray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v47 = v5;
    v48 = v4;
    v42 = v11;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      -[HMDCameraClipModel videoMetadata](self, "videoMetadata");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v15;
    v41 = v15;

    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __54__HMDCameraClipModel_createClipWithSignificantEvents___block_invoke;
    v50[3] = &unk_1E89C1ED0;
    v50[4] = self;
    objc_msgSend(v25, "na_map:", v50);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x1E0CBA3C0]);
    -[HMBModel hmbModelID](self, "hmbModelID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v43;
    objc_msgSend(v43, "floatValue");
    v30 = v29;
    objc_msgSend(v8, "floatValue");
    v32 = v31;
    v33 = objc_msgSend(v9, "BOOLValue");
    v34 = -[HMDCameraClipModel feedbackStatus](self, "feedbackStatus") != 0;
    v35 = -[HMDCameraClipModel quality](self, "quality");
    v36 = (void *)MEMORY[0x1E0C9AA60];
    if (v26)
      v36 = v26;
    v40 = v12;
    v37 = v27;
    v38 = (void *)v12;
    v6 = v45;
    v24 = (void *)objc_msgSend(v37, "initWithUniqueIdentifier:startDate:duration:targetFragmentDuration:isComplete:isDonated:quality:streamingAssetVersion:encryptionContext:videoSegments:significantEvents:", v28, v45, v33, v34, v35, v42, v30, v32, v40, v36, v49);

    v11 = v42;
    v5 = v47;
    v4 = v48;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = v8;
      v46 = v9;
      v19 = v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel debugDescription](v17, "debugDescription");
      v21 = v11;
      v22 = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v20;
      v53 = 2112;
      v54 = v23;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot create clip from model: %@", buf, 0x16u);

      v6 = v22;
      v11 = v21;

      v7 = v19;
      v8 = v44;
      v9 = v46;
    }

    objc_autoreleasePoolPop(v16);
    v24 = 0;
  }

  return v24;
}

- (unint64_t)feedbackStatus
{
  void *v2;
  unint64_t v3;

  -[HMDCameraClipModel feedbackStatusField](self, "feedbackStatusField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setFeedbackStatus:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setFeedbackStatusField:](self, "setFeedbackStatusField:", v4);

}

- (int64_t)quality
{
  void *v2;
  int64_t v3;

  -[HMDCameraClipModel qualityField](self, "qualityField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setQuality:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setQualityField:](self, "setQualityField:", v4);

}

id __54__HMDCameraClipModel_createClipWithSignificantEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDCameraClipSegmentMetadata *v4;
  HMDCameraClipSegmentMetadata *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[HMDCameraClipSegmentMetadata initWithData:]([HMDCameraClipSegmentMetadata alloc], "initWithData:", v3);
  v5 = v4;
  if (v4)
  {
    if (-[HMDCameraClipSegmentMetadata type](v4, "type"))
    {
      v6 = objc_alloc(MEMORY[0x1E0CBA3F0]);
      v7 = -[HMDCameraClipSegmentMetadata byteLength](v5, "byteLength");
      v8 = -[HMDCameraClipSegmentMetadata byteOffset](v5, "byteOffset");
      -[HMDCameraClipSegmentMetadata duration](v5, "duration");
      v10 = v9;
      -[HMDCameraClipSegmentMetadata timeOffset](v5, "timeOffset");
      v12 = objc_msgSend(v6, "initWithByteLength:byteOffset:duration:timeOffset:", v7, v8, v10, v11);
    }
    else
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA3F8]), "initWithByteLength:byteOffset:", -[HMDCameraClipSegmentMetadata byteLength](v5, "byteLength"), -[HMDCameraClipSegmentMetadata byteOffset](v5, "byteOffset"));
    }
    v18 = (void *)v12;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hmbModelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode video segment metadata for clip %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = 0;
  }

  return v18;
}

@end
