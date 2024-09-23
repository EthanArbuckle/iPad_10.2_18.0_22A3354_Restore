@implementation _NSIsNotNilTransformer

+ (BOOL)supportsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3 != 0);
}

- (id)description
{
  return CFSTR("<shared NSIsNotNil transformer>");
}

@end
