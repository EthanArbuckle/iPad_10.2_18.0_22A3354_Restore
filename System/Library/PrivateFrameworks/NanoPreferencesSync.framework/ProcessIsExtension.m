@implementation ProcessIsExtension

void __ProcessIsExtension_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NSExtension"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    ProcessIsExtension_result = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("PlugInKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ProcessIsExtension_result = v4 != 0;

  }
}

@end
