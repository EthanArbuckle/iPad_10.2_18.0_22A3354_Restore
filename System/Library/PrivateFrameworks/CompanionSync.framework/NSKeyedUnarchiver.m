@implementation NSKeyedUnarchiver

void __55__NSKeyedUnarchiver_SYAdditions__sy_whitelistedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)sy_whitelistedClasses_supportedClasses;
  sy_whitelistedClasses_supportedClasses = v6;

}

@end
