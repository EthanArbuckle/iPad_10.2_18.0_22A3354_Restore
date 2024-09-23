@implementation GCDevicePhysicalInputCapacitiveButtonElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputCapacitiveButtonElementDescription)init
{
  GCDevicePhysicalInputCapacitiveButtonElementDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  result = -[GCDevicePhysicalInputButtonElementDescription init](&v3, sel_init);
  result->_eventTouchedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputCapacitiveButtonElementDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputCapacitiveButtonElementDescription *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputButtonElementDescription initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventTouchedValueField"), v7.receiver, v7.super_class);

  v4->_eventTouchedValueField = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  v4 = a3;
  -[GCDevicePhysicalInputButtonElementDescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventTouchedValueField, CFSTR("eventTouchedValueField"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  result = -[GCDevicePhysicalInputButtonElementDescription copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 9) = self->_eventTouchedValueField;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription,
        -[GCDevicePhysicalInputButtonElementDescription isEqual:](&v7, sel_isEqual_, v4))
    && self->_eventTouchedValueField == v4[9];

  return v5;
}

- (unint64_t)eventTouchedValueField
{
  return self->_eventTouchedValueField;
}

- (void)setEventTouchedValueField:(unint64_t)a3
{
  self->_eventTouchedValueField = a3;
}

@end
