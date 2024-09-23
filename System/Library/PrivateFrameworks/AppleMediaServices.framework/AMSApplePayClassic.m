@implementation AMSApplePayClassic

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_80 != -1)
    dispatch_once(&_MergedGlobals_80, &__block_literal_global_8);
  return (NSString *)(id)qword_1ECEACF38;
}

void __35__AMSApplePayClassic_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACF38;
  qword_1ECEACF38 = (uint64_t)CFSTR("AMSApplePayClassic");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACF40 != -1)
    dispatch_once(&qword_1ECEACF40, &__block_literal_global_2);
  return (NSString *)(id)qword_1ECEACF48;
}

void __42__AMSApplePayClassic_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACF48;
  qword_1ECEACF48 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

@end
