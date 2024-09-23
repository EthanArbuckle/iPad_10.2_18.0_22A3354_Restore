@implementation _GCDevicePhysicalInputCapacitiveDirectionPadElementParameters

- (uint64_t)eventTouchedValueField
{
  if (result)
    return *(_QWORD *)(result + 160);
  return result;
}

- (id)touchedSources
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[19];
    if (v2)
    {
      v1 = v2;
    }
    else
    {
      v3 = objc_alloc((Class)&off_254DE3248);
      -[_GCDevicePhysicalInputElementParameters aliases]((uint64_t)v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 0);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters)init
{
  _GCDevicePhysicalInputCapacitiveDirectionPadElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters;
  result = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters init](&v3, sel_init);
  result->_eventTouchedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters;
  v4 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 19, self->_touchedSources);
  v4[20] = (id)self->_eventTouchedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSSet *touchedSources;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters;
  v6 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters isEqual:](&v8, sel_isEqual_, v4)
    && ((touchedSources = self->_touchedSources, touchedSources == (NSSet *)v4[19])
     || -[NSSet isEqual:](touchedSources, "isEqual:"))
    && self->_eventTouchedValueField == v4[20];

  return v6;
}

- (void)setTouchedSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 152);
}

- (uint64_t)setEventTouchedValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 160) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchedSources, 0);
}

@end
