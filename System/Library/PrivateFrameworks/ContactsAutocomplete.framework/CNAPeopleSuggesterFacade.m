@implementation CNAPeopleSuggesterFacade

void __76___CNAPeopleSuggesterFacade_autocompleteSearchResultsWithPredictionContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "autocompleteSearchResultsWithPredictionContext:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    +[CNAutocompletePeopleSuggesterFeedback didReceiveSuggestions:](CNAutocompletePeopleSuggesterFeedback, "didReceiveSuggestions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "searchPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      CNALoggingContextTriage();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = 0;
        _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Framework version mismatch, no results expected until rdar://78585557", (uint8_t *)&v14, 0xCu);
      }

      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = MEMORY[0x1E0C9AA60];

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rankedZKWSuggestionsFromContext:", *(_QWORD *)(a1 + 40));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      CNALoggingContextTriage();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = 0;
        _os_log_impl(&dword_1B9950000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Framework version mismatch, regressing behavior until rdar://78585557", (uint8_t *)&v14, 0xCu);
      }

    }
  }
}

@end
