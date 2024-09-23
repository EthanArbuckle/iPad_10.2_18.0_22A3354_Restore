@implementation _GCDevicePhysicalInputClickableDirectionPadElementParameters

- (uint64_t)eventPressedValueField
{
  if (result)
    return *(_QWORD *)(result + 144);
  return result;
}

- (id)pressedSources
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
    v2 = (void *)a1[17];
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

- (_GCDevicePhysicalInputClickableDirectionPadElementParameters)init
{
  _GCDevicePhysicalInputClickableDirectionPadElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElementParameters;
  result = -[_GCDevicePhysicalInputDirectionPadElementParameters init](&v3, sel_init);
  result->_eventPressedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElementParameters;
  v4 = -[_GCDevicePhysicalInputDirectionPadElementParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 17, self->_pressedSources);
  v4[18] = (id)self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSSet *pressedSources;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElementParameters;
  v6 = -[_GCDevicePhysicalInputDirectionPadElementParameters isEqual:](&v8, sel_isEqual_, v4)
    && ((pressedSources = self->_pressedSources, pressedSources == (NSSet *)v4[17])
     || -[NSSet isEqual:](pressedSources, "isEqual:"))
    && self->_eventPressedValueField == v4[18];

  return v6;
}

- (void)setPressedSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 136);
}

- (uint64_t)setEventPressedValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 144) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedSources, 0);
}

@end
