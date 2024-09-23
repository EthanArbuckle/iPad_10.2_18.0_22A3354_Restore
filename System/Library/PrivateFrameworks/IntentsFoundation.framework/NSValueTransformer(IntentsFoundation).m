@implementation NSValueTransformer(IntentsFoundation)

+ (_IFValueTransformer)if_transformerUsingForwardTransformation:()IntentsFoundation reverseTransformation:
{
  id v5;
  id v6;
  _IFValueTransformer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_IFValueTransformer initWithForwardTransformation:reverseTransformation:]([_IFValueTransformer alloc], "initWithForwardTransformation:reverseTransformation:", v6, v5);

  return v7;
}

@end
