@implementation NSBundle(RTExtensions)

+ (uint64_t)_coreroutineBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (id)_coreroutine_LocalizedStringForKey:()RTExtensions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "_coreroutineBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
