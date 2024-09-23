@implementation CRKTableKeyValuePair

+ (id)pairWithKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  CRKTableKeyValuePair *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CRKKeyValuePair initWithKey:value:]([CRKTableKeyValuePair alloc], "initWithKey:value:", v6, v5);

  return v7;
}

@end
