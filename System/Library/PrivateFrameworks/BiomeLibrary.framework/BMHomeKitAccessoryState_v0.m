@implementation BMHomeKitAccessoryState_v0

- (int)valuetype
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMHomeKitAccessoryState_v0;
  v2 = -[BMHomeKitAccessoryState valueType](&v4, sel_valueType);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

@end
