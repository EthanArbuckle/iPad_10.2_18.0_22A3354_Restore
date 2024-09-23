@implementation _GCDevicePhysicalInputButtonInputParameters

- (uint64_t)sources
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (BOOL)isAnalog
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (float)pressedThreshold
{
  if (a1)
    return *(float *)(a1 + 12);
  else
    return 0.0;
}

- (_GCDevicePhysicalInputButtonInputParameters)init
{
  _GCDevicePhysicalInputButtonInputParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputButtonInputParameters;
  result = -[_GCDevicePhysicalInputButtonInputParameters init](&v3, sel_init);
  result->_analog = 0;
  result->_pressedThreshold = 0.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputButtonInputParameters;
  v4 = -[_GCDevicePhysicalInputViewParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_sources);
  *((_BYTE *)v4 + 8) = self->_analog;
  *((_DWORD *)v4 + 3) = LODWORD(self->_pressedThreshold);
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
  v8.super_class = (Class)_GCDevicePhysicalInputButtonInputParameters;
  v6 = -[_GCDevicePhysicalInputViewParameters isEqual:](&v8, sel_isEqual_, v4)
    && ((sources = self->_sources, sources == v4[2]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 8)
    && self->_pressedThreshold == *((float *)v4 + 3);

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
}

- (uint64_t)setAnalog:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (uint64_t)setPressedThreshold:(uint64_t)result
{
  if (result)
    *(float *)(result + 12) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
