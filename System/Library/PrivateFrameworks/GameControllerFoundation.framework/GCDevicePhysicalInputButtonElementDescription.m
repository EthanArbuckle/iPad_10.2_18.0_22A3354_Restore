@implementation GCDevicePhysicalInputButtonElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputButtonElementDescription)init
{
  GCDevicePhysicalInputButtonElementDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  result = -[GCDevicePhysicalInputElementDescription init](&v3, sel_init);
  result->_analog = 0;
  result->_pressedThreshold = 0.0;
  result->_eventPressedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputButtonElementDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputButtonElementDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *sources;
  float v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputElementDescription initWithCoder:](&v12, sel_initWithCoder_, v3);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v12.receiver, v12.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("sources"));
  v7 = objc_claimAutoreleasedReturnValue();
  sources = v4->_sources;
  v4->_sources = (NSArray *)v7;

  v4->_analog = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("analog"));
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("pressedThreshold"));
  v4->_pressedThreshold = v9;
  v10 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventPressedValueField"));

  v4->_eventPressedValueField = v10;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  v4 = a3;
  -[GCDevicePhysicalInputElementDescription encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sources, CFSTR("sources"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_analog, CFSTR("analog"));
  *(float *)&v5 = self->_pressedThreshold;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("pressedThreshold"), v5);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventPressedValueField, CFSTR("eventPressedValueField"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  v4 = -[GCDevicePhysicalInputElementDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 7, self->_sources);
  *((_BYTE *)v4 + 48) = self->_analog;
  *((_DWORD *)v4 + 13) = LODWORD(self->_pressedThreshold);
  v4[8] = (id)self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSArray **v4;
  NSArray *sources;
  BOOL v6;
  objc_super v8;

  v4 = (NSArray **)a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputButtonElementDescription,
        -[GCDevicePhysicalInputElementDescription isEqual:](&v8, sel_isEqual_, v4))
    && ((sources = self->_sources, sources == v4[7]) || -[NSArray isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 48)
    && self->_pressedThreshold == *((float *)v4 + 13)
    && self->_eventPressedValueField == (_QWORD)v4[8];

  return v6;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  -[GCDevicePhysicalInputElementDescription description](&v8, sel_description);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_analog)
    v5 = CFSTR("analog");
  else
    v5 = CFSTR("digital");
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Button %@ %#zx %@"), v3, self->_eventPressedValueField, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isAnalog
{
  return self->_analog;
}

- (void)setAnalog:(BOOL)a3
{
  self->_analog = a3;
}

- (float)pressedThreshold
{
  return self->_pressedThreshold;
}

- (void)setPressedThreshold:(float)a3
{
  self->_pressedThreshold = a3;
}

- (unint64_t)eventPressedValueField
{
  return self->_eventPressedValueField;
}

- (void)setEventPressedValueField:(unint64_t)a3
{
  self->_eventPressedValueField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
