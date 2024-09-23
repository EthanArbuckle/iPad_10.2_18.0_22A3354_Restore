@implementation AXPerformSafeBlockWithErrorHandler

id __AXPerformSafeBlockWithErrorHandler_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Caught exception '%@' while performing safe block; reason: '%@'. Stacktrace: %@."),
    v3,
    v4,
    v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
