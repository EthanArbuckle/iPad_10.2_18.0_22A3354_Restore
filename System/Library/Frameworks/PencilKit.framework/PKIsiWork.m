@implementation PKIsiWork

void __PKIsiWork_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Pages")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Keynote")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Numbers"));
  }
  _MergedGlobals_154 = v1;

}

@end
