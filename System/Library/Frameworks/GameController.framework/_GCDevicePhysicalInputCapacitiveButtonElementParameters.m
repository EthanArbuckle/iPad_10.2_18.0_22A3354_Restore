@implementation _GCDevicePhysicalInputCapacitiveButtonElementParameters

- (uint64_t)eventTouchedValueField
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (_GCDevicePhysicalInputCapacitiveButtonElementParameters)init
{
  _GCDevicePhysicalInputCapacitiveButtonElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElementParameters;
  result = -[_GCDevicePhysicalInputButtonElementParameters init](&v3, sel_init);
  result->_eventTouchedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElementParameters;
  result = -[_GCDevicePhysicalInputButtonElementParameters copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 8) = self->_eventTouchedValueField;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElementParameters;
  if (-[_GCDevicePhysicalInputButtonElementParameters isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_eventTouchedValueField == v4[8];
  else
    v5 = 0;

  return v5;
}

- (uint64_t)setEventTouchedValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

@end
