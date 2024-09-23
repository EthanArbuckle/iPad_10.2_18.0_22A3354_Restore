@implementation NSOperationQueue

uint64_t __57__NSOperationQueue_FCAdditions__fc_sharedConcurrentQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_MergedGlobals_222;
  _MergedGlobals_222 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_222, "setQualityOfService:", 17);
  return objc_msgSend((id)_MergedGlobals_222, "setName:", CFSTR("com.apple.newscore.concurrentQ"));
}

uint64_t __68__NSOperationQueue_FCAdditions__fc_throttledCKRequestOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1ED0F8928;
  qword_1ED0F8928 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0F8928, "setMaxConcurrentOperationCount:", 4);
  return objc_msgSend((id)qword_1ED0F8928, "setName:", CFSTR("com.apple.news.throttledCKRequestQueue"));
}

uint64_t __48__NSOperationQueue_FCAdditions__fc_prewarmQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1ED0F8918;
  qword_1ED0F8918 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0F8918, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)qword_1ED0F8918, "setName:", CFSTR("com.apple.newscore.prewarmQ"));
}

uint64_t __53__NSOperationQueue_FCAdditions__fc_sharedSerialQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1ED0F8908;
  qword_1ED0F8908 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0F8908, "setQualityOfService:", 9);
  objc_msgSend((id)qword_1ED0F8908, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)qword_1ED0F8908, "setName:", CFSTR("com.apple.newscore.serialQ"));
}

void __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke_2;
  v5[3] = &unk_1E463CD58;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
