@implementation _GCDevicePhysicalInputFacadeParameters

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputFacadeParameters;
  return -[_GCDevicePhysicalInputViewParameters copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputFacadeParameters;
  return -[_GCDevicePhysicalInputViewParameters isEqual:](&v4, sel_isEqual_, a3);
}

@end
