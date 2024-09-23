@implementation HMDSoftwareVersionStringTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "versionString");
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BE3F270];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithVersionString:", v5);

  return v6;
}

@end
