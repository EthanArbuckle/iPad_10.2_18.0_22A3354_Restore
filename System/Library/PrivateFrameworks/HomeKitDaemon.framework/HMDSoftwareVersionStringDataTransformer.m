@implementation HMDSoftwareVersionStringDataTransformer

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

  objc_msgSend(a3, "versionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:encoding:", v5, 4);

  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F270]), "initWithVersionString:", v6);
  else
    v7 = 0;

  return v7;
}

@end
