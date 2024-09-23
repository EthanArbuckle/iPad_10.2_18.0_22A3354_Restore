@implementation NSBundle

void __49__NSBundle_MNExtras___navigation_isRunningInSiri__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_29 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.siri"));

}

uint64_t __54__NSBundle_MNExtras___navigation_implementsSiriMethod__block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  byte_1ED0C3F61 = result & 1;
  return result;
}

void __39__NSBundle_MNExtras___navigationBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Navigation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0C3F78;
  qword_1ED0C3F78 = v0;

}

@end
