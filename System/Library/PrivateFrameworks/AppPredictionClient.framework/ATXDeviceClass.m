@implementation ATXDeviceClass

+ (BOOL)shouldComputeActions
{
  return !+[ATXDeviceClass isConstrainedForActions](ATXDeviceClass, "isConstrainedForActions");
}

+ (BOOL)isConstrainedForActions
{
  if (isConstrainedForActions_onceToken != -1)
    dispatch_once(&isConstrainedForActions_onceToken, &__block_literal_global_27);
  return isConstrainedForActions_constrained;
}

void __41__ATXDeviceClass_isConstrainedForActions__block_invoke()
{
  void *v0;
  unint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "physicalMemory");

  if (v1 <= 0x64000000)
    isConstrainedForActions_constrained = 1;
}

@end
