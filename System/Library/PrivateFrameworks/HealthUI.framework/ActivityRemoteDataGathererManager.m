@implementation ActivityRemoteDataGathererManager

void __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke(uint64_t a1)
{
  _ActivityRemoteDataGatherer *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v2 = [_ActivityRemoteDataGatherer alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke_2;
  v11 = &unk_1E9C45208;
  v5 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = &v14;
  v6 = -[_ActivityRemoteDataGatherer initWithActivitySummaryDataProvider:monthDateInterval:sixMonthDateInterval:completion:](v2, "initWithActivitySummaryDataProvider:monthDateInterval:sixMonthDateInterval:completion:", v3, v4, v5, &v8);
  v7 = (void *)v15[5];
  v15[5] = v6;

  objc_msgSend((id)v15[5], "gatherData", v8, v9, v10, v11);
  _Block_object_dispose(&v14, 8);

}

void __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

@end
