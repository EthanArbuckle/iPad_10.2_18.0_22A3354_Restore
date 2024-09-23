@implementation AEConcreteDevicePrimitives

- (AEConcreteDevicePrimitives)init
{
  AEConcreteDevicePrimitives *v2;
  unsigned int v3;
  int64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEConcreteDevicePrimitives;
  v2 = -[AEConcreteDevicePrimitives init](&v6, sel_init);
  if (v2)
  {
    v3 = MGGetSInt32Answer() - 1;
    if (v3 > 0xA)
      v4 = 0;
    else
      v4 = qword_22E288698[v3];
    v2->_deviceTypeInternal = v4;
  }
  return v2;
}

- (int64_t)deviceType
{
  if (self)
    return *(_QWORD *)(self + 8);
  return self;
}

@end
