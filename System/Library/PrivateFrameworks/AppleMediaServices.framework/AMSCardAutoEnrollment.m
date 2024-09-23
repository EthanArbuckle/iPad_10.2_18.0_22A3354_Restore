@implementation AMSCardAutoEnrollment

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_88 != -1)
    dispatch_once(&_MergedGlobals_88, &__block_literal_global_24);
  return (NSString *)(id)qword_1ECEAD018;
}

void __38__AMSCardAutoEnrollment_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD018;
  qword_1ECEAD018 = (uint64_t)CFSTR("AMSCardEnrollment");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD020 != -1)
    dispatch_once(&qword_1ECEAD020, &__block_literal_global_2_1);
  return (NSString *)(id)qword_1ECEAD028;
}

void __45__AMSCardAutoEnrollment_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD028;
  qword_1ECEAD028 = (uint64_t)CFSTR("1");

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
