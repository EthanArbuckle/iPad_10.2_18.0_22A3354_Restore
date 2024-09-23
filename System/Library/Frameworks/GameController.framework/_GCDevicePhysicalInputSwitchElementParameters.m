@implementation _GCDevicePhysicalInputSwitchElementParameters

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

- (BOOL)canWrap
{
  if (result)
    return *(_BYTE *)(result + 41) != 0;
  return result;
}

- (BOOL)isSequential
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (uint64_t)positionRange
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)eventPositionField
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (_GCDevicePhysicalInputSwitchElementParameters)init
{
  _GCDevicePhysicalInputSwitchElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputSwitchElementParameters;
  result = -[_GCDevicePhysicalInputSwitchElementParameters init](&v3, sel_init);
  result->_sequential = 0;
  result->_canWrap = 0;
  result->_positionRange.location = 0;
  result->_positionRange.length = 0;
  result->_eventPositionField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputSwitchElementParameters;
  v4 = -[_GCDevicePhysicalInputElementParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_sources);
  *((_BYTE *)v4 + 40) = self->_sequential;
  *((_BYTE *)v4 + 41) = self->_canWrap;
  *((_OWORD *)v4 + 4) = self->_positionRange;
  v4[7] = (id)self->_eventPositionField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSSet **v4;
  NSSet *sources;
  BOOL v6;
  BOOL v7;
  objc_super v9;

  v4 = (NSSet **)a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputSwitchElementParameters;
  v7 = -[_GCDevicePhysicalInputElementParameters isEqual:](&v9, sel_isEqual_, v4)
    && ((sources = self->_sources, sources == v4[6]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_sequential == *((unsigned __int8 *)v4 + 40)
    && self->_canWrap == *((unsigned __int8 *)v4 + 41)
    && ((NSSet *)self->_positionRange.location == v4[8] ? (v6 = self->_positionRange.length == (_QWORD)v4[9]) : (v6 = 0),
        v6)
    && self->_eventPositionField == (_QWORD)v4[7];

  return v7;
}

- (void)setSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (uint64_t)setSequential:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 40) = a2;
  return result;
}

- (uint64_t)setCanWrap:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 41) = a2;
  return result;
}

- (uint64_t)setPositionRange:(uint64_t)a3
{
  if (result)
  {
    *(_QWORD *)(result + 64) = a2;
    *(_QWORD *)(result + 72) = a3;
  }
  return result;
}

- (uint64_t)setEventPositionField:(uint64_t)result
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
