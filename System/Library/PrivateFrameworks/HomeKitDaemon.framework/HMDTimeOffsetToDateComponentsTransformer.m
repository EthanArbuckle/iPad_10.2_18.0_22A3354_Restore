@implementation HMDTimeOffsetToDateComponentsTransformer

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
  id v6;
  void *v7;
  char v9;

  v9 = 0;
  HMDTimeOffsetToDateComponents(objc_msgSend(a3, "integerValue"), &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v9)
  {
    if (v4)
      v6 = v4;
    else
      v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  BOOL v7;

  v7 = 0;
  v4 = HMDTimeOffsetFromDateComponents(a3, &v7);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
