@implementation ICApp

uint64_t __50__ICApp_LaunchServices__initWithApplicationProxy___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CFBundleURLIsPrivate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

@end
