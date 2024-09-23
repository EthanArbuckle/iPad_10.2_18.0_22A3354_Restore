@implementation AMSPurchaseBagConsumer

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_138 != -1)
    dispatch_once(&_MergedGlobals_138, &__block_literal_global_106);
  return (NSString *)(id)qword_1ECEAD818;
}

void __39__AMSPurchaseBagConsumer_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD818;
  qword_1ECEAD818 = (uint64_t)CFSTR("AMSPurchase");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD820 != -1)
    dispatch_once(&qword_1ECEAD820, &__block_literal_global_2_4);
  return (NSString *)(id)qword_1ECEAD828;
}

void __46__AMSPurchaseBagConsumer_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD828;
  qword_1ECEAD828 = (uint64_t)CFSTR("1");

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
