@implementation NSBundle(VSAdditions)

+ (id)vs_frameworkBundle
{
  if (vs_frameworkBundle___vs_lazy_init_predicate != -1)
    dispatch_once(&vs_frameworkBundle___vs_lazy_init_predicate, &__block_literal_global_48);
  return (id)vs_frameworkBundle___vs_lazy_init_variable;
}

+ (id)vs_bundleForProcessIdentifier:()VSAdditions
{
  void *v3;
  void *v4;

  VSBundleURLForProcessIdentifier(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
