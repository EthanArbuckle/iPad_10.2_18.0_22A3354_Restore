@implementation GCDevicePhysicalInputClickableDirectionPadElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputClickableDirectionPadElementDescription)init
{
  GCDevicePhysicalInputClickableDirectionPadElementDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  result = -[GCDevicePhysicalInputDirectionPadElementDescription init](&v3, sel_init);
  result->_eventPressedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputClickableDirectionPadElementDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputClickableDirectionPadElementDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *pressedSources;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputDirectionPadElementDescription initWithCoder:](&v11, sel_initWithCoder_, v3);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("pressedSources"));
  v7 = objc_claimAutoreleasedReturnValue();
  pressedSources = v4->_pressedSources;
  v4->_pressedSources = (NSArray *)v7;

  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventPressedValueField"));
  v4->_eventPressedValueField = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  v4 = a3;
  -[GCDevicePhysicalInputDirectionPadElementDescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pressedSources, CFSTR("pressedSources"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventPressedValueField, CFSTR("eventPressedValueField"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  v4 = -[GCDevicePhysicalInputDirectionPadElementDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 18, self->_pressedSources);
  v4[19] = (id)self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *pressedSources;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription,
        -[GCDevicePhysicalInputDirectionPadElementDescription isEqual:](&v8, sel_isEqual_, v4))
    && ((pressedSources = self->_pressedSources, pressedSources == (NSArray *)v4[18])
     || -[NSArray isEqual:](pressedSources, "isEqual:"))
    && self->_eventPressedValueField == v4[19];

  return v6;
}

- (NSArray)pressedSources
{
  return self->_pressedSources;
}

- (void)setPressedSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
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
  objc_storeStrong((id *)&self->_pressedSources, 0);
}

@end
