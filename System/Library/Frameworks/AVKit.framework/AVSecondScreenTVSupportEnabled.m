@implementation AVSecondScreenTVSupportEnabled

void __AVSecondScreenTVSupportEnabled_block_invoke()
{
  void *v0;
  id v1;

  if (AVSecondScreenSupportsExternalHDR_onceToken != -1)
    dispatch_once(&AVSecondScreenSupportsExternalHDR_onceToken, &__block_literal_global_97_9337);
  if (AVSecondScreenSupportsExternalHDR_AVSecondScreenSupportsExternalHDR)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled = objc_msgSend(v0, "hasPrefix:", CFSTR("com.apple.springboard")) ^ 1;

  }
  else
  {
    AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled = 0;
  }
}

@end
