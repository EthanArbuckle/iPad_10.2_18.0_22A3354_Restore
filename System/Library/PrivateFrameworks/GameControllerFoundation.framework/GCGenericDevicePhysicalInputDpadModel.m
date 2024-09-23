@implementation GCGenericDevicePhysicalInputDpadModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputDpadModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDevicePhysicalInputDpadModel *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDevicePhysicalInputDpadModel;
  v3 = a3;
  v4 = -[GCGenericDevicePhysicalInputElementModel initWithCoder:](&v7, sel_initWithCoder_, v3);
  v4->_sourceUpExtendedEventFieldIndex = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceUpExtendedEventFieldIndex"), v7.receiver, v7.super_class);
  v4->_sourceDownExtendedEventFieldIndex = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceDownExtendedEventFieldIndex"));
  v4->_sourceLeftExtendedEventFieldIndex = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceLeftExtendedEventFieldIndex"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceRightExtendedEventFieldIndex"));

  v4->_sourceRightExtendedEventFieldIndex = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputDpadModel;
  v4 = a3;
  -[GCGenericDevicePhysicalInputElementModel encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceUpExtendedEventFieldIndex](self, "sourceUpExtendedEventFieldIndex", v5.receiver, v5.super_class), CFSTR("sourceUpExtendedEventFieldIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceDownExtendedEventFieldIndex](self, "sourceDownExtendedEventFieldIndex"), CFSTR("sourceDownExtendedEventFieldIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceLeftExtendedEventFieldIndex](self, "sourceLeftExtendedEventFieldIndex"), CFSTR("sourceLeftExtendedEventFieldIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceRightExtendedEventFieldIndex](self, "sourceRightExtendedEventFieldIndex"), CFSTR("sourceRightExtendedEventFieldIndex"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDevicePhysicalInputDpadModel;
  if (-[GCGenericDevicePhysicalInputElementModel isEqual:](&v11, sel_isEqual_, v4)
    && (v5 = -[GCGenericDevicePhysicalInputDpadModel sourceUpExtendedEventFieldIndex](self, "sourceUpExtendedEventFieldIndex"), v5 == objc_msgSend(v4, "sourceUpExtendedEventFieldIndex"))&& (v6 = -[GCGenericDevicePhysicalInputDpadModel sourceDownExtendedEventFieldIndex](self, "sourceDownExtendedEventFieldIndex"), v6 == objc_msgSend(v4, "sourceDownExtendedEventFieldIndex"))&& (v7 = -[GCGenericDevicePhysicalInputDpadModel sourceLeftExtendedEventFieldIndex](self, "sourceLeftExtendedEventFieldIndex"), v7 == objc_msgSend(v4, "sourceLeftExtendedEventFieldIndex")))
  {
    v8 = -[GCGenericDevicePhysicalInputDpadModel sourceRightExtendedEventFieldIndex](self, "sourceRightExtendedEventFieldIndex");
    v9 = v8 == objc_msgSend(v4, "sourceRightExtendedEventFieldIndex");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)description
{
  return CFSTR("DPad Element");
}

- (int64_t)sourceUpExtendedEventFieldIndex
{
  return self->_sourceUpExtendedEventFieldIndex;
}

- (int64_t)sourceDownExtendedEventFieldIndex
{
  return self->_sourceDownExtendedEventFieldIndex;
}

- (int64_t)sourceLeftExtendedEventFieldIndex
{
  return self->_sourceLeftExtendedEventFieldIndex;
}

- (int64_t)sourceRightExtendedEventFieldIndex
{
  return self->_sourceRightExtendedEventFieldIndex;
}

@end
