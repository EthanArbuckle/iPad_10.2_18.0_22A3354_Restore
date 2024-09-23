@implementation NSLocale(FCAdditions)

+ (id)fc_preferredLanguageCodes
{
  if (qword_1ED0F87C0 != -1)
    dispatch_once(&qword_1ED0F87C0, &__block_literal_global_161);
  return (id)_MergedGlobals_208;
}

@end
