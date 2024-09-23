@implementation _NSNegateBooleanTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_self();
}

- (id)transformedValue:(id)a3
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "BOOLValue") ^ 1);
}

- (id)description
{
  return CFSTR("<shared NSNegateBoolean transformer>");
}

- (BOOL)_isBooleanTransformer
{
  return 1;
}

@end
