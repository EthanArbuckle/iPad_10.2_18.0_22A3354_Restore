@implementation ML3MultiUserAccountChangeOperation

void __46___ML3MultiUserAccountChangeOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "_ML3MultiUserAccountChangeOperation %p - Finished operation", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
}

@end
