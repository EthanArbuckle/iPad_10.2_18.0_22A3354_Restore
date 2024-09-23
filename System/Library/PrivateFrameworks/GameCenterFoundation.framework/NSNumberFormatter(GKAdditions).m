@implementation NSNumberFormatter(GKAdditions)

+ (id)gk_formatInteger:()GKAdditions withGrouping:
{
  void *v5;
  void *v6;
  void *v7;

  if ((a4 & 1) != 0)
    _sharedIntegerWithGroupingFormatter();
  else
    _sharedIntegerFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
