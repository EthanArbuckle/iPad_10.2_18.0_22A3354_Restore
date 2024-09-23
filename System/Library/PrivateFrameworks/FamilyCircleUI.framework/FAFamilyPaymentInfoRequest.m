@implementation FAFamilyPaymentInfoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE04A78], "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyPaymentInfoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
