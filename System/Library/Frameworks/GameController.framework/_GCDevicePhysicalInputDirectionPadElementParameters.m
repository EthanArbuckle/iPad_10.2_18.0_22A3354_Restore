@implementation _GCDevicePhysicalInputDirectionPadElementParameters

- (uint64_t)eventUpValueField
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)eventDownValueField
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

- (uint64_t)eventLeftValueField
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (uint64_t)eventRightValueField
{
  if (result)
    return *(_QWORD *)(result + 128);
  return result;
}

- (BOOL)isAnalog
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (id)xySources
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
    v2 = (void *)a1[7];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 15);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)xSources
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
    v2 = (void *)a1[7];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 10);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)ySources
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
    v2 = (void *)a1[8];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 5);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)upSources
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
    v2 = (void *)a1[9];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 1);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)downSources
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
    v2 = (void *)a1[11];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 4);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)leftSources
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
    v2 = (void *)a1[10];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 8);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)rightSources
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
    v2 = (void *)a1[12];
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
      v7 = (void *)objc_msgSend(v3, "initWithElementAliases:localizedName:symbol:direction:", v4, v5, v6, 2);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (_GCDevicePhysicalInputDirectionPadElementParameters)init
{
  _GCDevicePhysicalInputDirectionPadElementParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputDirectionPadElementParameters;
  result = -[_GCDevicePhysicalInputDirectionPadElementParameters init](&v3, sel_init);
  result->_eventUpValueField = -1;
  result->_eventDownValueField = -1;
  result->_eventLeftValueField = -1;
  result->_eventRightValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputDirectionPadElementParameters;
  v4 = -[_GCDevicePhysicalInputElementParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_xySources);
  objc_storeStrong(v4 + 7, self->_xSources);
  objc_storeStrong(v4 + 8, self->_ySources);
  objc_storeStrong(v4 + 9, self->_upSources);
  objc_storeStrong(v4 + 10, self->_leftSources);
  objc_storeStrong(v4 + 11, self->_downSources);
  objc_storeStrong(v4 + 12, self->_rightSources);
  *((_BYTE *)v4 + 40) = self->_analog;
  v4[13] = (id)self->_eventUpValueField;
  v4[14] = (id)self->_eventDownValueField;
  v4[15] = (id)self->_eventLeftValueField;
  v4[16] = (id)self->_eventRightValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSSet **v4;
  NSSet *xySources;
  NSSet *xSources;
  NSSet *ySources;
  NSSet *upSources;
  NSSet *leftSources;
  NSSet *downSources;
  NSSet *rightSources;
  BOOL v12;
  objc_super v14;

  v4 = (NSSet **)a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCDevicePhysicalInputDirectionPadElementParameters;
  v12 = -[_GCDevicePhysicalInputElementParameters isEqual:](&v14, sel_isEqual_, v4)
     && ((xySources = self->_xySources, xySources == v4[6]) || -[NSSet isEqual:](xySources, "isEqual:"))
     && ((xSources = self->_xSources, xSources == v4[7]) || -[NSSet isEqual:](xSources, "isEqual:"))
     && ((ySources = self->_ySources, ySources == v4[8]) || -[NSSet isEqual:](ySources, "isEqual:"))
     && ((upSources = self->_upSources, upSources == v4[9]) || -[NSSet isEqual:](upSources, "isEqual:"))
     && ((leftSources = self->_leftSources, leftSources == v4[10])
      || -[NSSet isEqual:](leftSources, "isEqual:"))
     && ((downSources = self->_downSources, downSources == v4[11])
      || -[NSSet isEqual:](downSources, "isEqual:"))
     && ((rightSources = self->_rightSources, rightSources == v4[12])
      || -[NSSet isEqual:](rightSources, "isEqual:"))
     && self->_analog == *((unsigned __int8 *)v4 + 40)
     && (NSSet *)self->_eventUpValueField == v4[13]
     && (NSSet *)self->_eventDownValueField == v4[14]
     && (NSSet *)self->_eventLeftValueField == v4[15]
     && self->_eventRightValueField == (_QWORD)v4[16];

  return v12;
}

- (void)setXySources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (void)setXSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
}

- (void)setYSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 64);
}

- (void)setUpSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
}

- (void)setLeftSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
}

- (void)setDownSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 88);
}

- (void)setRightSources:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 96);
}

- (uint64_t)setAnalog:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 40) = a2;
  return result;
}

- (uint64_t)setEventUpValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 104) = a2;
  return result;
}

- (uint64_t)setEventDownValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 112) = a2;
  return result;
}

- (uint64_t)setEventLeftValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 120) = a2;
  return result;
}

- (uint64_t)setEventRightValueField:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 128) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSources, 0);
  objc_storeStrong((id *)&self->_downSources, 0);
  objc_storeStrong((id *)&self->_leftSources, 0);
  objc_storeStrong((id *)&self->_upSources, 0);
  objc_storeStrong((id *)&self->_ySources, 0);
  objc_storeStrong((id *)&self->_xSources, 0);
  objc_storeStrong((id *)&self->_xySources, 0);
}

@end
