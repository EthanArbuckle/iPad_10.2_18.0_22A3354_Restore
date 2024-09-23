@implementation _CNDelegateAdjustingResponsePreparer

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  double v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  NSObject *v23;
  double v24;
  int v26;
  double v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "autocompleteFetch:willAdjustResults:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  CNALoggingContextDebug();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      objc_msgSend(v8, "timeIntervalSinceNow");
      v26 = 134218243;
      v27 = v14 * -1000.0;
      v28 = 2113;
      v29 = v10;
      _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "Delegate requested adjustments (%.3fms): %{private}@", (uint8_t *)&v26, 0x16u);
    }

    CNALoggingContextPerformance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "timeIntervalSinceNow");
      v26 = 134218243;
      v27 = v16 * -1000.0;
      v28 = 2113;
      v29 = v10;
      _os_log_impl(&dword_1B9950000, v15, OS_LOG_TYPE_INFO, "Delegate requested adjustments (%.3fms): %{private}@", (uint8_t *)&v26, 0x16u);
    }

    v17 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rejected"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNDelegateAdjustingResponsePreparer adjustArray:byRemovingResults:](self, "adjustArray:byRemovingResults:", v17, v18);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additional"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNDelegateAdjustingResponsePreparer adjustArray:byAddingResults:](self, "adjustArray:byAddingResults:", v17, v19);

    -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "prepareResults:forFetch:", v17, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v13)
    {
      objc_msgSend(v8, "timeIntervalSinceNow");
      v26 = 134217984;
      v27 = v22 * -1000.0;
      _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "Delegate made no adjustments (%.3fms)", (uint8_t *)&v26, 0xCu);
    }

    CNALoggingContextPerformance();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "timeIntervalSinceNow");
      v26 = 134217984;
      v27 = v24 * -1000.0;
      _os_log_impl(&dword_1B9950000, v23, OS_LOG_TYPE_INFO, "Delegate made no adjustments (%.3fms)", (uint8_t *)&v26, 0xCu);
    }

    -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prepareResults:forFetch:", v6, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (void)adjustArray:(id)a3 byAddingResults:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
    objc_msgSend(v7, "addObjectsFromArray:", v6);

}

- (void)adjustArray:(id)a3 byRemovingResults:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
    objc_msgSend(v7, "removeObjectsInArray:", v6);

}

@end
