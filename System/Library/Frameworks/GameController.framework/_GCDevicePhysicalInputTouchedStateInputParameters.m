@implementation _GCDevicePhysicalInputTouchedStateInputParameters

- (uint64_t)sources
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (_GCDevicePhysicalInputTouchedStateInputParameters)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputTouchedStateInputParameters;
  return -[_GCDevicePhysicalInputTouchedStateInputParameters init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputTouchedStateInputParameters;
  v4 = -[_GCDevicePhysicalInputViewParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_sources);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSSet *sources;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputTouchedStateInputParameters;
  if (-[_GCDevicePhysicalInputViewParameters isEqual:](&v8, sel_isEqual_, v4))
  {
    sources = self->_sources;
    if (sources == (NSSet *)v4[1])
      v6 = 1;
    else
      v6 = -[NSSet isEqual:](sources, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
