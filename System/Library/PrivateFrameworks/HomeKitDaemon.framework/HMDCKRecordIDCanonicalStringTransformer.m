@implementation HMDCKRecordIDCanonicalStringTransformer

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
  return (id)objc_msgSend(a3, "hmd_canonicalStringRepresentation");
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDB91E8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "hmd_initWithCanonicalStringRepresentation:", v5);

  return v7;
}

@end
