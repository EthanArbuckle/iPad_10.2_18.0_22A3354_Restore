@implementation ICInputSuggesterPredictionSource

void __41___ICInputSuggesterPredictionSource_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "lock");
    objc_msgSend(MEMORY[0x24BE79A30], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v2[5];
    v2[5] = (id)v3;

    objc_msgSend(v2[1], "broadcast");
    objc_msgSend(v2[1], "unlock");
  }
  _ICProactiveQuickTypeOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __41___ICInputSuggesterPredictionSource_init__block_invoke_cold_1(v5);

}

void __69___ICInputSuggesterPredictionSource__populateError_withExplanations___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BE79A38], "stringFromExplanationCode:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

void __128___ICInputSuggesterPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __70___ICInputSuggesterPredictionSource_requestFromTrigger_searchContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x24BE80900];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = (id)objc_msgSend([v7 alloc], "initWithString:senderID:timestamp:", v10, v8, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v11);
}

void __41___ICInputSuggesterPredictionSource_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22716D000, log, OS_LOG_TYPE_DEBUG, "People Suggester shared instance retrieved", v1, 2u);
}

@end
