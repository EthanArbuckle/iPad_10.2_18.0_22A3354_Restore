@implementation HFHomeApplicationBundleIdentifiers

id __HFHomeApplicationBundleIdentifiers_block_invoke()
{
  if (qword_1ED3795C8 != -1)
    dispatch_once(&qword_1ED3795C8, &__block_literal_global_28_7);
  return (id)qword_1ED3795D0;
}

void __HFHomeApplicationBundleIdentifiers_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.Home"), CFSTR("com.apple.NanoHome"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3795D0;
  qword_1ED3795D0 = v0;

}

@end
