@implementation ATXCandidateRelevanceModelDatasetGenerator

- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ATXCandidateRelevanceModelDatasetGenerator *v13;
  void *v15;
  void *v16;

  v4 = a3;
  BiomeLibrary();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UserFocus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "InferredMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UserFocus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ComputedMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "PointOfInterest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Category");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXCandidateRelevanceModelDatasetGenerator initWithConfig:inferredModeStream:computedModeStream:pointOfInterestStream:](self, "initWithConfig:inferredModeStream:computedModeStream:pointOfInterestStream:", v4, v5, v8, v12);

  return v13;
}

- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3 inferredModeStream:(id)a4 computedModeStream:(id)a5 pointOfInterestStream:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ATXCandidateRelevanceModelDatasetGenerator *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0C99D68];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v39 = a3;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithTimeIntervalSinceNow:", -2592000.0);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "publisherFromStartTime:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "atx_publisherFromStartDate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "filterWithIsIncluded:", &__block_literal_global_87);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "atx_publisherFromStartDate:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "filterWithIsIncluded:", &__block_literal_global_88);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithIntegerValue:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", 60.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v13, v20, v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bpsPublisher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mapWithTransform:", &__block_literal_global_92_0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "atx_publisherFromStartDate:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "filterWithIsIncluded:", &__block_literal_global_93_0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("confidence >= %@"), &unk_1E83D0A10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v13, v29, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bpsPublisher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "mapWithTransform:", &__block_literal_global_100);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[ATXCandidateRelevanceModelDatasetGenerator initWithConfig:contextPublisher:modePublisher:poiCategoryPublisher:bluetoothPublisher:userFocusComputedModePublisher:microlocationVisitPublisher:](self, "initWithConfig:contextPublisher:modePublisher:poiCategoryPublisher:bluetoothPublisher:userFocusComputedModePublisher:microlocationVisitPublisher:", v39, v38, v37, v36, v23, v25, v32);
  return v33;
}

uint64_t __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStart");

  return v3;
}

BOOL __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rank") == 0;

  return v3;
}

id __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CF94A8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v6 = (void *)objc_msgSend(v4, "initWithEventBody:timestamp:", v3);

  return v6;
}

uint64_t __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

id __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_98(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CF94A8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v6 = (void *)objc_msgSend(v4, "initWithEventBody:timestamp:", v3);

  return v6;
}

- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3 contextPublisher:(id)a4 modePublisher:(id)a5 poiCategoryPublisher:(id)a6 bluetoothPublisher:(id)a7 userFocusComputedModePublisher:(id)a8 microlocationVisitPublisher:(id)a9
{
  id v16;
  id v17;
  ATXCandidateRelevanceModelDatasetGenerator *v18;
  ATXCandidateRelevanceModelDatasetGenerator *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ATXCandidateRelevanceModelDatasetGenerator;
  v18 = -[ATXCandidateRelevanceModelDatasetGenerator init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_config, a3);
    objc_storeStrong((id *)&v19->_contextPublisher, a4);
    objc_storeStrong((id *)&v19->_modePublisher, a5);
    objc_storeStrong((id *)&v19->_poiCategoryPublisher, a6);
    objc_storeStrong((id *)&v19->_bluetoothPublisher, a7);
    objc_storeStrong((id *)&v19->_userFocusComputedModePublisher, a8);
    objc_storeStrong((id *)&v19->_microlocationVisitPublisher, a9);
  }

  return v19;
}

- (void)receiveDataPoint:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[ATXCandidateRelevanceModelDatasetGenerator candidateDatasetStream](self, "candidateDatasetStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke;
    v12[3] = &unk_1E82E43A8;
    v12[4] = &v13;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke_2;
    v10[3] = &unk_1E82E5318;
    v11 = v6;
    v9 = (id)objc_msgSend(v8, "sinkWithBookmark:completion:receiveInput:", 0, v12, v10);
    v7[2](v7, *((unsigned __int8 *)v14 + 24));

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7[2](v7, 0);
  }

}

uint64_t __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

void __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)receiveDatasetSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__59;
  v24[4] = __Block_byref_object_dispose__59;
  v25 = (id)objc_opt_new();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__59;
  v18[4] = __Block_byref_object_dispose__59;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke;
  v14[3] = &unk_1E82E5340;
  v16 = v18;
  v15 = v6;
  v17 = v24;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke_2;
  v10[3] = &unk_1E82E5368;
  v9 = v15;
  v11 = v9;
  v12 = v24;
  v13 = &v20;
  -[ATXCandidateRelevanceModelDatasetGenerator receiveDataPoint:completion:](self, "receiveDataPoint:completion:", v14, v10);
  v7[2](v7, *((unsigned __int8 *)v21 + 24));

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);

}

void __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "contextDefinedSessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  if (!v5)
  {
    v9 = v3;
    v8 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v9;
    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "isEqual:", v3) & 1) == 0)
  {
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v3);
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
LABEL_5:

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v10);

}

uint64_t __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke_2(uint64_t result, int a2)
{
  char v2;
  uint64_t v3;

  v2 = a2;
  v3 = result;
  if (a2)
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) = v2;
  return result;
}

- (void)receiveCandidateDataPoint:(id)a3 completion:(id)a4 candidate:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke;
  v15[3] = &unk_1E82E5390;
  v15[4] = self;
  v12 = v10;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke_2;
  v14[3] = &unk_1E82E53B8;
  v14[4] = &v18;
  -[ATXCandidateRelevanceModelDatasetGenerator receiveDatasetSession:completion:](self, "receiveDatasetSession:completion:", v15, v14);
  v9[2](v9, *((unsigned __int8 *)v19 + 24));

  _Block_object_dispose(&v18, 8);
}

void __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "candidateDataPointsForSession:candidate:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)candidateDataPointsForSessions:(id)a3 candidate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend((id)objc_opt_class(), "candidateDataPointsForSession:candidate:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v14);
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)candidateDataPointsForSession:(id)a3 candidate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v9)
  {

LABEL_13:
    if (objc_msgSend(v8, "count", (_QWORD)v19))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCandidate:", v6);
      objc_msgSend(v17, "setEngaged:", 0);
      objc_msgSend(v7, "addObject:", v17);

    }
    goto LABEL_15;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(v14, "candidate", (_QWORD)v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v6);

      if (v16)
      {
        objc_msgSend(v7, "addObject:", v14);
        v11 = 1;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v10);

  if ((v11 & 1) == 0)
    goto LABEL_13;
LABEL_15:

  return v7;
}

- (id)candidateDatasetStream
{
  void *v3;
  BPSPublisher *modePublisher;
  BPSPublisher *poiCategoryPublisher;
  BPSPublisher *bluetoothPublisher;
  BPSPublisher *userFocusComputedModePublisher;
  BPSPublisher *microlocationVisitPublisher;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "candidatePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && self->_contextPublisher
    && (modePublisher = self->_modePublisher) != 0
    && (poiCategoryPublisher = self->_poiCategoryPublisher) != 0
    && (bluetoothPublisher = self->_bluetoothPublisher) != 0
    && (userFocusComputedModePublisher = self->_userFocusComputedModePublisher) != 0
    && (microlocationVisitPublisher = self->_microlocationVisitPublisher) != 0)
  {
    v14[0] = self->_contextPublisher;
    v14[1] = modePublisher;
    v14[2] = poiCategoryPublisher;
    v14[3] = bluetoothPublisher;
    v14[4] = userFocusComputedModePublisher;
    v14[5] = microlocationVisitPublisher;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "orderedMergeWithOthers:comparator:", v9, &__block_literal_global_107_0);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "eventAndRecentContextPublisher:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dataPointPublisher:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXCandidateRelevanceModelDatasetGenerator candidateDatasetStream].cold.1((uint64_t)self, v10);
    v12 = 0;
  }

  return v12;
}

uint64_t __68__ATXCandidateRelevanceModelDatasetGenerator_candidateDatasetStream__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

+ (id)eventAndRecentContextPublisher:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0D81638];
  v5 = a3;
  objc_msgSend(v4, "tupleWithFirst:second:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke;
  v9[3] = &__block_descriptor_40_e70____PASTuple2_24__0___PASTuple2_8__NSObject_ATXBMStoreEventProtocol__16l;
  v9[4] = a1;
  objc_msgSend(v5, "scanWithInitial:nextPartialResult:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inferredModeEvent");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userFocusComputedModeEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "poiCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bluetoothEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "microlocationVisitEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v21 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)v10;
      v16 = v8;

      objc_msgSend(v16, "setInferredModeEvent:", v15);
      objc_msgSend(v16, "setPoiCategory:", v12);
      objc_msgSend(v16, "setBluetoothEvent:", v13);
      objc_msgSend(v16, "setUserFocusComputedModeEvent:", v11);
      objc_msgSend(v16, "setMicrolocationVisitEvent:", v14);
      v9 = v16;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v6, v9);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v21;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "setInferredModeEvent:", v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "setUserFocusComputedModeEvent:", v8);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "poiCategory");
          v15 = (void *)v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setPoiCategory:", v19);

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = (void *)v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "setMicrolocationVisitEvent:", v8);
          goto LABEL_16;
        }
        objc_msgSend(v9, "setBluetoothEvent:", v8);
      }
    }
    v15 = (void *)v10;
    goto LABEL_16;
  }
  __atxlog_handle_relevance_model();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke_cold_1(a1, v17);

  v18 = v5;
LABEL_17:

  objc_autoreleasePoolPop(v7);
  return v18;
}

+ (id)dataPointPublisher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__59;
  v17[4] = __Block_byref_object_dispose__59;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__59;
  v15[4] = __Block_byref_object_dispose__59;
  v16 = 0;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "filterWithIsIncluded:", &__block_literal_global_119);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ATXCandidateRelevanceModelDatasetGenerator_dataPointPublisher___block_invoke_2;
  v10[3] = &unk_1E82E5420;
  v14 = a1;
  v7 = v5;
  v11 = v7;
  v12 = v17;
  v13 = v15;
  objc_msgSend(v6, "mapWithTransform:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

  return v8;
}

uint64_t __65__ATXCandidateRelevanceModelDatasetGenerator_dataPointPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unsigned __int8 isKindOfClass;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v2, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return isKindOfClass & (v6 != 0);
}

ATXCandidateRelevanceModelDataPoint *__65__ATXCandidateRelevanceModelDatasetGenerator_dataPointPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  ATXPredictionTimeContext *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  ATXCandidateRelevanceModelDataPoint *v17;
  void *v18;
  void *v19;
  objc_class *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_relevance_model();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v24 = v23;
    objc_msgSend(v5, "timeContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    v28 = 138412546;
    v29 = v22;
    v30 = 2048;
    v31 = v24 - v27;
    _os_log_debug_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEBUG, "%@ - New time context for candidate is %f seconds newer", (uint8_t *)&v28, 0x16u);

  }
  v10 = -[ATXPredictionTimeContext initWithDate:]([ATXPredictionTimeContext alloc], "initWithDate:", v8);
  objc_msgSend(v5, "setTimeContext:", v10);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v5, "setCandidateIdentifiersLaunchAge:", v11);

  if (objc_msgSend((id)objc_opt_class(), "isContextMismatchForPreviousContext:currentContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5))
  {
    v12 = objc_opt_new();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  }
  objc_msgSend(v3, "first");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ATXCandidateRelevanceModelDataPoint initWithContext:candidate:engaged:contextDefinedSessionId:]([ATXCandidateRelevanceModelDataPoint alloc], "initWithContext:candidate:engaged:contextDefinedSessionId:", v5, v16, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v16, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, v19);

  return v17;
}

+ (BOOL)isContextMismatchForPreviousContext:(id)a3 currentContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 1;
  if (v5 && v6)
  {
    objc_msgSend(v6, "timeContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v14 > 1800.0)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.1();
LABEL_54:

      v8 = 1;
      goto LABEL_55;
    }
    objc_msgSend(v7, "timeContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "dayOfWeek");
    objc_msgSend(v5, "timeContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "dayOfWeek");

    if (v17 != v19)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.14();
      goto LABEL_54;
    }
    objc_msgSend(v7, "deviceStateContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wifiSSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceStateContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "wifiSSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    v25 = v23;
    if (v24 == v25)
    {

    }
    else
    {
      v26 = v25;
      if (!v24 || !v25)
      {

        goto LABEL_19;
      }
      v27 = objc_msgSend(v24, "isEqualToString:", v25);

      if ((v27 & 1) == 0)
      {
LABEL_19:
        __atxlog_handle_relevance_model();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.13();
        goto LABEL_54;
      }
    }
    objc_msgSend(v7, "deviceStateContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "inAirplaneMode");
    objc_msgSend(v5, "deviceStateContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "inAirplaneMode");

    if (v29 != v31)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.2();
      goto LABEL_54;
    }
    objc_msgSend(v7, "locationMotionContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "currentLOI");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationMotionContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "currentLOI");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v33;
    v37 = v35;
    if (v36 == v37)
    {

    }
    else
    {
      v38 = v37;
      if (!v36 || !v37)
      {

        goto LABEL_31;
      }
      v39 = objc_msgSend(v36, "isEqual:", v37);

      if ((v39 & 1) == 0)
      {
LABEL_31:
        __atxlog_handle_relevance_model();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.12();
        goto LABEL_54;
      }
    }
    objc_msgSend(v7, "locationMotionContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "locationEnabled");
    objc_msgSend(v5, "locationMotionContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "locationEnabled");

    if (v41 != v43)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.3();
      goto LABEL_54;
    }
    objc_msgSend(v7, "locationMotionContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "geohash");
    objc_msgSend(v5, "locationMotionContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "geohash");

    if (v45 != v47)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.11();
      goto LABEL_54;
    }
    objc_msgSend(v7, "locationMotionContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "motionType");
    objc_msgSend(v5, "locationMotionContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "motionType");

    if (v49 != v51)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.10();
      goto LABEL_54;
    }
    objc_msgSend(v7, "ambientLightContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "ambientLightType");
    objc_msgSend(v5, "ambientLightContext");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "ambientLightType");

    if (v53 != v55)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.9();
      goto LABEL_54;
    }
    objc_msgSend(v7, "bluetoothEvent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bluetoothEvent");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v56 == (void *)v57)
    {

    }
    else
    {
      v58 = (void *)v57;
      objc_msgSend(v7, "bluetoothEvent");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bluetoothEvent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v59, "isEqual:", v60);

      if ((v61 & 1) == 0)
      {
        __atxlog_handle_relevance_model();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.8();
        goto LABEL_54;
      }
    }
    objc_msgSend(v7, "inferredModeEvent");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "modeType");
    objc_msgSend(v5, "inferredModeEvent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "modeType");

    if (v63 != v65)
    {
      __atxlog_handle_relevance_model();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.7();
      goto LABEL_54;
    }
    objc_msgSend(v7, "userFocusComputedModeEvent");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "semanticType");
    objc_msgSend(v5, "userFocusComputedModeEvent");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "semanticType");

    if (v67 == v69)
    {
      objc_msgSend(v7, "poiCategory");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "poiCategory");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70 != v71)
      {
        __atxlog_handle_relevance_model();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.5();
        goto LABEL_54;
      }
      objc_msgSend(v7, "microlocationVisitEvent");
      v73 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "microlocationVisitEvent");
      v74 = objc_claimAutoreleasedReturnValue();
      if (v73 != v74)
      {
        v75 = (void *)v74;
        objc_msgSend(v7, "microlocationVisitEvent");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "microlocationVisitEvent");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v76, "isEqual:", v77);

        if ((v78 & 1) == 0)
        {
          __atxlog_handle_relevance_model();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.4();
          goto LABEL_54;
        }
LABEL_59:
        v8 = 0;
        goto LABEL_55;
      }

    }
    else
    {
      __atxlog_handle_relevance_model();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.6();
    }

    goto LABEL_59;
  }
LABEL_55:

  return v8;
}

- (BPSPublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_contextPublisher, a3);
}

- (BPSPublisher)modePublisher
{
  return self->_modePublisher;
}

- (void)setModePublisher:(id)a3
{
  objc_storeStrong((id *)&self->_modePublisher, a3);
}

- (BPSPublisher)userFocusComputedModePublisher
{
  return self->_userFocusComputedModePublisher;
}

- (void)setUserFocusComputedModePublisher:(id)a3
{
  objc_storeStrong((id *)&self->_userFocusComputedModePublisher, a3);
}

- (BPSPublisher)poiCategoryPublisher
{
  return self->_poiCategoryPublisher;
}

- (void)setPoiCategoryPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategoryPublisher, a3);
}

- (BPSPublisher)bluetoothPublisher
{
  return self->_bluetoothPublisher;
}

- (void)setBluetoothPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothPublisher, a3);
}

- (BPSPublisher)microlocationVisitPublisher
{
  return self->_microlocationVisitPublisher;
}

- (void)setMicrolocationVisitPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_microlocationVisitPublisher, a3);
}

- (ATXCandidateRelevanceModelDatasetGeneratorConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_microlocationVisitPublisher, 0);
  objc_storeStrong((id *)&self->_bluetoothPublisher, 0);
  objc_storeStrong((id *)&self->_poiCategoryPublisher, 0);
  objc_storeStrong((id *)&self->_userFocusComputedModePublisher, 0);
  objc_storeStrong((id *)&self->_modePublisher, 0);
  objc_storeStrong((id *)&self->_contextPublisher, 0);
}

- (void)candidateDatasetStream
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, v5, "%@ - Could not create candidateDatasetStream because one of the biome publishers needed is nil.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1();
}

void __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@ - Event can't be deserialized in eventAndRecentContextPublisher", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "date mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "inAirplaneMode mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "locationEnabled mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "microlocation mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "poiCategory mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "userFocusComputedModeType mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "modeType mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "bluetoothState mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ambientLightType mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "motionType mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "geohash mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "currentLOI mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "wifiSSID mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "dayOfWeek mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
