@implementation NSArray(BMDSLArray)

- (BMDSLArray)dslWithClass:()BMDSLArray
{
  BMDSLArray *v5;
  void *v6;
  BMDSLArray *v7;

  v5 = [BMDSLArray alloc];
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMDSLArray initWithValues:valueClassName:](v5, "initWithValues:valueClassName:", a1, v6);

  return v7;
}

- (BMDSLArray)dslWithValueClassName:()BMDSLArray
{
  id v4;
  BMDSLArray *v5;

  v4 = a3;
  v5 = -[BMDSLArray initWithValues:valueClassName:]([BMDSLArray alloc], "initWithValues:valueClassName:", a1, v4);

  return v5;
}

@end
