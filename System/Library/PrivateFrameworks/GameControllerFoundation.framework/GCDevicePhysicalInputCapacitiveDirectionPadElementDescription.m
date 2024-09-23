@implementation GCDevicePhysicalInputCapacitiveDirectionPadElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputCapacitiveDirectionPadElementDescription)init
{
  GCDevicePhysicalInputCapacitiveDirectionPadElementDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  result = -[GCDevicePhysicalInputClickableDirectionPadElementDescription init](&v3, sel_init);
  result->_eventTouchedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputCapacitiveDirectionPadElementDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputCapacitiveDirectionPadElementDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *touchedSources;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputClickableDirectionPadElementDescription initWithCoder:](&v11, sel_initWithCoder_, v3);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("touchedSources"));
  v7 = objc_claimAutoreleasedReturnValue();
  touchedSources = v4->_touchedSources;
  v4->_touchedSources = (NSArray *)v7;

  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventTouchedValueField"));
  v4->_eventTouchedValueField = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  v4 = a3;
  -[GCDevicePhysicalInputClickableDirectionPadElementDescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchedSources, CFSTR("touchedSources"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventTouchedValueField, CFSTR("eventTouchedValueField"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  v4 = -[GCDevicePhysicalInputClickableDirectionPadElementDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 20, self->_touchedSources);
  v4[21] = (id)self->_eventTouchedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *touchedSources;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription,
        -[GCDevicePhysicalInputClickableDirectionPadElementDescription isEqual:](&v8, sel_isEqual_, v4))
    && ((touchedSources = self->_touchedSources, touchedSources == (NSArray *)v4[20])
     || -[NSArray isEqual:](touchedSources, "isEqual:"))
    && self->_eventTouchedValueField == v4[21];

  return v6;
}

- (NSArray)touchedSources
{
  return self->_touchedSources;
}

- (void)setTouchedSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)eventTouchedValueField
{
  return self->_eventTouchedValueField;
}

- (void)setEventTouchedValueField:(unint64_t)a3
{
  self->_eventTouchedValueField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchedSources, 0);
}

@end
