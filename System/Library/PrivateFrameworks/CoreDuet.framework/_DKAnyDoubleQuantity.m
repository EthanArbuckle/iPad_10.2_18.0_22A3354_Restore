@implementation _DKAnyDoubleQuantity

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:](_DKQuantityType, "objectTypeFromClass:", a1);
}

+ (id)withValue:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
