@implementation NSKeyedArchiver(ETAdditions)

+ (id)_et_secureArchivedDataWithRootObject:()ETAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1618];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("root"));

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
