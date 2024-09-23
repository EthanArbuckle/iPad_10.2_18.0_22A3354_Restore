@implementation GCDevicePhysicalInputSwitchElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputSwitchElementDescription)init
{
  GCDevicePhysicalInputSwitchElementDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  result = -[GCDevicePhysicalInputElementDescription init](&v3, sel_init);
  result->_sequential = 0;
  result->_canWrap = 0;
  result->_positionRange.location = 0;
  result->_positionRange.length = 0;
  result->_eventPositionField = -1;
  return result;
}

- (GCDevicePhysicalInputSwitchElementDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputSwitchElementDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *sources;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputElementDescription initWithCoder:](&v11, sel_initWithCoder_, v3);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("sources"));
  v7 = objc_claimAutoreleasedReturnValue();
  sources = v4->_sources;
  v4->_sources = (NSArray *)v7;

  v4->_sequential = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("sequential"));
  v4->_canWrap = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("canWrap"));
  v4->_positionRange.location = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("positionStart"));
  v4->_positionRange.length = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("positionLength"));
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventPositionField"));

  v4->_eventPositionField = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  v4 = a3;
  -[GCDevicePhysicalInputElementDescription encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sources, CFSTR("sources"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_sequential, CFSTR("sequential"));
  LODWORD(v5) = 0;
  if (self->_canWrap)
    *(float *)&v5 = 1.0;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("canWrap"), v5);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_positionRange.location, CFSTR("positionStart"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_positionRange.length, CFSTR("positionLength"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventPositionField, CFSTR("eventPositionField"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  v4 = -[GCDevicePhysicalInputElementDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong((id *)v4 + 7, self->_sources);
  v4[48] = self->_sequential;
  v4[49] = self->_canWrap;
  *(_NSRange *)(v4 + 72) = self->_positionRange;
  *((_QWORD *)v4 + 8) = self->_eventPositionField;
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
        v8.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription,
        -[GCDevicePhysicalInputElementDescription isEqual:](&v8, sel_isEqual_, v4))
    && ((sources = self->_sources, sources == v4[7]) || -[NSArray isEqual:](sources, "isEqual:"))
    && self->_sequential == *((unsigned __int8 *)v4 + 48)
    && self->_canWrap == *((unsigned __int8 *)v4 + 49)
    && (NSArray *)self->_positionRange.location == v4[9]
    && (NSArray *)self->_positionRange.length == v4[10]
    && self->_eventPositionField == (_QWORD)v4[8];

  return v6;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  -[GCDevicePhysicalInputElementDescription description](&v9, sel_description);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_sequential)
    v5 = CFSTR(" sequential");
  else
    v5 = &stru_1EA4D5008;
  if (self->_canWrap)
    v6 = CFSTR(" wraps");
  else
    v6 = &stru_1EA4D5008;
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Switch %@ %#zx%@%@"), v3, self->_eventPositionField, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSequential
{
  return self->_sequential;
}

- (void)setSequential:(BOOL)a3
{
  self->_sequential = a3;
}

- (BOOL)canWrap
{
  return self->_canWrap;
}

- (void)setCanWrap:(BOOL)a3
{
  self->_canWrap = a3;
}

- (_NSRange)positionRange
{
  _NSRange *p_positionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_positionRange = &self->_positionRange;
  location = self->_positionRange.location;
  length = p_positionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPositionRange:(_NSRange)a3
{
  self->_positionRange = a3;
}

- (unint64_t)eventPositionField
{
  return self->_eventPositionField;
}

- (void)setEventPositionField:(unint64_t)a3
{
  self->_eventPositionField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
