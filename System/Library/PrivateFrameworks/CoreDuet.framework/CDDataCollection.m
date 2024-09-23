@implementation CDDataCollection

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_3();

  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__28;
  v20[3] = __Block_byref_object_dispose__28;
  v21 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v7 = v5;
  v8 = OSAWriteLogForSubmission();
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v18, 3221225472, __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_70, &unk_1E26E70C0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_2(v10, (uint64_t)v22, v9);
  }

  if (*(_QWORD *)(v20[0] + 40))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_1((uint64_t)v20, v11, v12, v13, v14, v15, v16, v17);

  }
  _Block_object_dispose(&v19, 8);

}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  obj = 0;
  objc_msgSend(a2, "writeData:error:", v2, &obj);
  objc_storeStrong(v3, obj);
}

uint64_t __29___CDDataCollection__execute__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Error writing file %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a3, (uint64_t)a3, "Submission Success %@", (uint8_t *)a2);

}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Submitting compressed json to crash reporter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
