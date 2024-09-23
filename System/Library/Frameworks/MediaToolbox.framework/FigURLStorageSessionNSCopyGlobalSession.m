@implementation FigURLStorageSessionNSCopyGlobalSession

void ___FigURLStorageSessionNSCopyGlobalSession_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)MEMORY[0x19403137C]();
  v1 = (void *)objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  objc_msgSend(v1, "set_timingDataOptions:", -1);
  v2 = figURLStorageSessionNSCommonCreate(*MEMORY[0x1E0C9AE00], v1, 0, 0);
  if (v2)
    sGlobalFigURLStorageSessionNS = v2;
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v0);
}

@end
