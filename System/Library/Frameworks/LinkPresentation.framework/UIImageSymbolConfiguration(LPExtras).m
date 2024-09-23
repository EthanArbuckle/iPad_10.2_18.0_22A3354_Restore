@implementation UIImageSymbolConfiguration(LPExtras)

+ (uint64_t)_lp_configurationWithPointSize:()LPExtras
{
  return objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:");
}

+ (id)_lp_configurationWithTextStyle:()LPExtras weight:scale:
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
