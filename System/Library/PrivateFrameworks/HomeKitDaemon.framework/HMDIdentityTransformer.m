@implementation HMDIdentityTransformer

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
  return a3;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

@end
