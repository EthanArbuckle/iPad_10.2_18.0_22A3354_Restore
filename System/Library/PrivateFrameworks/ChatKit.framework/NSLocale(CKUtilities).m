@implementation NSLocale(CKUtilities)

+ (id)__ck_currentLocale
{
  if (__ck_currentLocale_once != -1)
    dispatch_once(&__ck_currentLocale_once, &__block_literal_global_583);
  if (sTestLocale)
    return (id)sTestLocale;
  else
    return (id)__ck_currentLocale_sLocale;
}

+ (void)__ck_setTestLocale:()CKUtilities
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)sTestLocale != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&sTestLocale, a3);
    v4 = v5;
  }

}

@end
