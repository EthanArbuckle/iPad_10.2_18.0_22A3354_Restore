@implementation HMDHomeKitVersionStringDataTransformer

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
  id v5;
  void *v6;
  HMDHomeKitVersion *v7;
  HMDHomeKitVersion *v8;
  HMDHomeKitVersion *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
  if (v6)
  {
    v7 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = v8;
    }
    else
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("String isn't valid as HMDHomeKitVersion: %@"), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmfErrorWithCode:reason:", 3, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v8 = 0;
      v9 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Data is not UTF8: %@"), v5);
    v8 = (HMDHomeKitVersion *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmfErrorWithCode:reason:", 3, v8);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v9;
}

@end
