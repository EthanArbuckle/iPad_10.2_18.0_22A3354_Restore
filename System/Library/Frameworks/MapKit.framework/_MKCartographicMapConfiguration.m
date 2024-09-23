@implementation _MKCartographicMapConfiguration

- (_MKCartographicMapConfiguration)initWithCartographicConfiguration:(id *)a3
{
  _BOOL8 v4;
  _MKCartographicMapConfiguration *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v4 = (unint64_t)(a3->var3 - 1) < 2;
  v9.receiver = self;
  v9.super_class = (Class)_MKCartographicMapConfiguration;
  result = -[MKMapConfiguration initWithElevationStyle:](&v9, sel_initWithElevationStyle_, v4);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var2;
    v6 = *(_OWORD *)&a3->var4;
    v8 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&result->_cartographicConfiguration.gridOnly = *(_QWORD *)&a3->var6;
    *(_OWORD *)&result->_cartographicConfiguration.projection = v7;
    *(_OWORD *)&result->_cartographicConfiguration.mapkitUsage = v6;
    *(_OWORD *)&result->_cartographicConfiguration.style = v8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKCartographicMapConfiguration;
  v4 = a3;
  -[MKMapConfiguration encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v5 = *(_OWORD *)&self->_cartographicConfiguration.projection;
  v6[0] = *(_OWORD *)&self->_cartographicConfiguration.style;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage;
  v7 = *(_QWORD *)&self->_cartographicConfiguration.gridOnly;
  _MKCartographicConfigurationEncodeWithCoder((uint64_t *)v6, v4, CFSTR("MKCartographicMapConfigurationCartographicConfiguration_"));

}

- (_MKCartographicMapConfiguration)initWithCoder:(id)a3
{
  id v4;
  _MKCartographicMapConfiguration *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[3];
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKCartographicMapConfiguration;
  v5 = -[MKMapConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    _MKCartographicConfigurationDecodeWithCoder(v4, CFSTR("MKCartographicMapConfigurationCartographicConfiguration_"), (uint64_t)v10);
    v6 = v10[0];
    v7 = v10[1];
    v8 = v10[2];
    *(_QWORD *)&v5->_cartographicConfiguration.gridOnly = v11;
    *(_OWORD *)&v5->_cartographicConfiguration.projection = v7;
    *(_OWORD *)&v5->_cartographicConfiguration.mapkitUsage = v8;
    *(_OWORD *)&v5->_cartographicConfiguration.style = v6;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKCartographicMapConfiguration;
  result = -[MKMapConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v6 = *(_OWORD *)&self->_cartographicConfiguration.projection;
  v5 = *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage;
  v7 = *(_OWORD *)&self->_cartographicConfiguration.style;
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_cartographicConfiguration.gridOnly;
  *((_OWORD *)result + 3) = v6;
  *((_OWORD *)result + 4) = v5;
  *((_OWORD *)result + 2) = v7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[_MKCartographicMapConfiguration isEqualToCartographicMapConfiguration:](self, "isEqualToCartographicMapConfiguration:", v4);

  return v5;
}

- (BOOL)isEqualToCartographicMapConfiguration:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v5 = v4
    && (v7.receiver = self,
        v7.super_class = (Class)_MKCartographicMapConfiguration,
        -[MKMapConfiguration isEqual:](&v7, sel_isEqual_, v4))
    && _MKCartographicConfigurationEquals((uint64_t)&self->_cartographicConfiguration, (uint64_t)v4 + 32);

  return v5;
}

- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKCartographicMapConfiguration;
  v8 = a3;
  -[MKMapConfiguration _addObserver:options:context:](&v9, sel__addObserver_options_context_, v8, a4, a5);
  -[_MKCartographicMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("cartographicConfiguration"), a4, a5, v9.receiver, v9.super_class);

}

- (void)_removeObserver:(id)a3 context:(void *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKCartographicMapConfiguration;
  v6 = a3;
  -[MKMapConfiguration _removeObserver:context:](&v7, sel__removeObserver_context_, v6, a4);
  -[_MKCartographicMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("cartographicConfiguration"), a4, v7.receiver, v7.super_class);

}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)cartographicConfiguration
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var1;
  *(_QWORD *)&retstr->var6 = self[1].var3;
  return self;
}

@end
