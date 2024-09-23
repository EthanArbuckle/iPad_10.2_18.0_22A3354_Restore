@implementation CNObservable

void __84__CNObservable_CNAutocomplete__autocompleteTimeoutAfterDelay_doOnTimeout_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Error from search observable: %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __84__CNObservable_CNAutocomplete__autocompleteTimeoutAfterDelay_doOnTimeout_scheduler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CNALoggingContextDebug();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B9950000, v2, OS_LOG_TYPE_DEFAULT, "Timing out observable: %@", (uint8_t *)&v5, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
