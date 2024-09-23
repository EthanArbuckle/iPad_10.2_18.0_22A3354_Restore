@implementation GEORegisterPListStateCaptureAtFrequency

uint64_t ___GEORegisterPListStateCaptureAtFrequency_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1D826F7DC]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "_capturePlistState:", a2);

  objc_autoreleasePoolPop(v4);
  return v6;
}

@end
