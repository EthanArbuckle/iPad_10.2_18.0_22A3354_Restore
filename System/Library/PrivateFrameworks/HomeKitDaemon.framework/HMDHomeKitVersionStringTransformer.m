@implementation HMDHomeKitVersionStringTransformer

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
  id v4;
  HMDHomeKitVersion *v5;

  v4 = a3;
  v5 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v4);

  return v5;
}

@end
