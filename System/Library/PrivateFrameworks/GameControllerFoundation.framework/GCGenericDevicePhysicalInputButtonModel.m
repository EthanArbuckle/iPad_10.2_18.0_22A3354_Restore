@implementation GCGenericDevicePhysicalInputButtonModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputButtonModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDevicePhysicalInputButtonModel *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDevicePhysicalInputButtonModel;
  v3 = a3;
  v4 = -[GCGenericDevicePhysicalInputElementModel initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceExtendedEventFieldIndex"), v7.receiver, v7.super_class);

  v4->_sourceExtendedEventFieldIndex = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputButtonModel;
  v4 = a3;
  -[GCGenericDevicePhysicalInputElementModel encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputButtonModel sourceExtendedEventFieldIndex](self, "sourceExtendedEventFieldIndex", v5.receiver, v5.super_class), CFSTR("sourceExtendedEventFieldIndex"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDevicePhysicalInputButtonModel;
  if (-[GCGenericDevicePhysicalInputElementModel isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[GCGenericDevicePhysicalInputButtonModel sourceExtendedEventFieldIndex](self, "sourceExtendedEventFieldIndex");
    v6 = v5 == objc_msgSend(v4, "sourceExtendedEventFieldIndex");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)description
{
  return CFSTR("Button Element");
}

- (int64_t)sourceExtendedEventFieldIndex
{
  return self->_sourceExtendedEventFieldIndex;
}

@end
