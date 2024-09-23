@implementation _GCSteeringWheelElementParameters

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

- (float)maximumDegreesOfRotation
{
  if (a1)
    return *(float *)(a1 + 40);
  else
    return 0.0;
}

- (uint64_t)eventRotationValueField
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (_GCSteeringWheelElementParameters)init
{
  _GCSteeringWheelElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCSteeringWheelElementParameters;
  result = -[_GCSteeringWheelElementParameters init](&v3, sel_init);
  result->_eventRotationValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCSteeringWheelElementParameters;
  v4 = -[_GCDevicePhysicalInputElementParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_sources);
  *((_DWORD *)v4 + 10) = LODWORD(self->_maximumDegreesOfRotation);
  v4[7] = (id)self->_eventRotationValueField;
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
  v8.super_class = (Class)_GCSteeringWheelElementParameters;
  v6 = -[_GCDevicePhysicalInputElementParameters isEqual:](&v8, sel_isEqual_, v4)
    && ((sources = self->_sources, sources == v4[6]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_maximumDegreesOfRotation == *((float *)v4 + 10)
    && self->_eventRotationValueField == (_QWORD)v4[7];

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (uint64_t)setMaximumDegreesOfRotation:(uint64_t)result
{
  if (result)
    *(float *)(result + 40) = a2;
  return result;
}

- (uint64_t)setEventRotationValueField:(uint64_t)result
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
