@implementation HMDCKRecordIDCanonicalStringDataTransformer

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
  void *v4;
  void *v5;

  objc_msgSend(a3, "hmd_canonicalStringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:encoding:", v5, 1);

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDB91E8]);
    v8 = (void *)objc_msgSend(v7, "hmd_initWithCanonicalStringRepresentation:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
