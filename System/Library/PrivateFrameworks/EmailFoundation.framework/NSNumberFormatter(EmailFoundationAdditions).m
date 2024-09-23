@implementation NSNumberFormatter(EmailFoundationAdditions)

+ (id)ef_formatInteger:()EmailFoundationAdditions withGrouping:
{
  void *v5;
  void *v6;
  void *v7;

  if ((a4 & 1) != 0)
    _sharedIntegerWithGroupingFormatter();
  else
    _sharedIntegerFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  objc_msgSend(v5, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ef_formatUnsignedInteger:()EmailFoundationAdditions withGrouping:
{
  void *v5;
  void *v6;
  void *v7;

  if ((a4 & 1) != 0)
    _sharedIntegerWithGroupingFormatter();
  else
    _sharedIntegerFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  objc_msgSend(v5, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
