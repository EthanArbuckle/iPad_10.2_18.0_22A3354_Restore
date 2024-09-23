@implementation _GCDevicePhysicalInputButtonElementParameters

- (id)sources
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[6];
    if (v2)
    {
      v1 = v2;
    }
    else
    {
      -[_GCDevicePhysicalInputElementParameters aliases]((uint64_t)a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v3, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v6);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (BOOL)isAnalog
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (float)pressedThreshold
{
  if (a1)
    return *(float *)(a1 + 44);
  else
    return 0.0;
}

- (uint64_t)eventPressedValueField
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (_GCDevicePhysicalInputButtonElementParameters)init
{
  _GCDevicePhysicalInputButtonElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputButtonElementParameters;
  result = -[_GCDevicePhysicalInputButtonElementParameters init](&v3, sel_init);
  result->_analog = 0;
  result->_pressedThreshold = 0.0;
  result->_eventPressedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputButtonElementParameters;
  v4 = -[_GCDevicePhysicalInputElementParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_sources);
  *((_BYTE *)v4 + 40) = self->_analog;
  *((_DWORD *)v4 + 11) = LODWORD(self->_pressedThreshold);
  v4[7] = (id)self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSSet **v4;
  NSSet *sources;
  BOOL v6;
  objc_super v8;

  v4 = (NSSet **)a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputButtonElementParameters;
  v6 = -[_GCDevicePhysicalInputElementParameters isEqual:](&v8, sel_isEqual_, v4)
    && ((sources = self->_sources, sources == v4[6]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 40)
    && self->_pressedThreshold == *((float *)v4 + 11)
    && self->_eventPressedValueField == (_QWORD)v4[7];

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (uint64_t)setAnalog:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 40) = a2;
  return result;
}

- (uint64_t)setPressedThreshold:(uint64_t)result
{
  if (result)
    *(float *)(result + 44) = a2;
  return result;
}

- (uint64_t)setEventPressedValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
