@implementation NSBundle

id __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
