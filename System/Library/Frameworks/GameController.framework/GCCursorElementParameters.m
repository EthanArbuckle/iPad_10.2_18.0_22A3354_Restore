@implementation GCCursorElementParameters

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCCursorElementParameters;
  return -[_GCDevicePhysicalInputElementParameters copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)GCCursorElementParameters;
    v5 = -[_GCDevicePhysicalInputElementParameters isEqual:](&v7, sel_isEqual_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
