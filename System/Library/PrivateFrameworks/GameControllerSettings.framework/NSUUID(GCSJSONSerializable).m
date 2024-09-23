@implementation NSUUID(GCSJSONSerializable)

- (id)initWithJSONObject:()GCSJSONSerializable
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a1 = (id)objc_msgSend(a1, "initWithUUIDString:", v4);
    v5 = a1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
