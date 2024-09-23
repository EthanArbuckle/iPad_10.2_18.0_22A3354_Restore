@implementation ICInputContextManager

void __39___ICInputContextManager_sharedManager__block_invoke()
{
  _ICInputContextManager *v0;
  void *v1;

  v0 = objc_alloc_init(_ICInputContextManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

uint64_t __44___ICInputContextManager_initLexiconManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doInitLexiconManager");
}

uint64_t __47___ICInputContextManager_initPredictionManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doInitPredictionManager");
}

@end
