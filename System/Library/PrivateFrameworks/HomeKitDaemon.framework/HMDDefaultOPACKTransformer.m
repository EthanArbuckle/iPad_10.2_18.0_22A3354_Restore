@implementation HMDDefaultOPACKTransformer

+ (id)description
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  return a3;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  return a3;
}

@end
