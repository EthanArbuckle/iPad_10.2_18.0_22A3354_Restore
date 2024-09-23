@implementation CPLane

- (CPLane)init
{
  CPLane *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLane;
  v2 = -[CPLane init](&v4, sel_init);
  if (v2)
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v2);
  return v2;
}

- (CPLane)initWithCoder:(id)a3
{
  id v4;
  CPLane *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPLane;
  v5 = -[CPLane init](&v7, sel_init);
  if (v5)
  {
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v5);
    +[CPAccNavUpdate decodeUpdate:withCoder:](CPAccNavUpdate, "decodeUpdate:withCoder:", v5, v4);
  }

  return v5;
}

- (CPLane)initWithAngles:(id)a3 highlightedAngle:(id)a4 isPreferred:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  CPLane *v11;
  uint64_t v12;
  objc_super v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLane;
  v11 = -[CPLane init](&v14, sel_init);
  if (v11)
  {
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v11);
    objc_storeStrong((id *)&v11->_highlightedAngle, a4);
    objc_storeStrong((id *)&v11->_angles, a3);
    v12 = 1;
    if (v5)
      v12 = 2;
    v11->_status = v12;
  }

  return v11;
}

- (CPLane)initWithAngles:(id)a3
{
  id v5;
  CPLane *v6;
  NSMeasurement *highlightedAngle;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLane;
  v6 = -[CPLane init](&v9, sel_init);
  if (v6)
  {
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v6);
    highlightedAngle = v6->_highlightedAngle;
    v6->_highlightedAngle = 0;

    objc_storeStrong((id *)&v6->_angles, a3);
    v6->_status = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  +[CPAccNavUpdate encodeUpdate:withCoder:](CPAccNavUpdate, "encodeUpdate:withCoder:", self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[CPAccNavUpdate copyUpdate:](CPAccNavUpdate, "copyUpdate:", self);
}

- (BOOL)isEqual:(id)a3
{
  return +[CPAccNavUpdate isUpdate:equalTo:](CPAccNavUpdate, "isUpdate:equalTo:", self, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CPLane;
  -[CPLane description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSMeasurement)highlightedAngle
{
  NSMeasurement *highlightedAngle;

  highlightedAngle = self->_highlightedAngle;
  if (!highlightedAngle)
  {
    if (!self->_status)
      return (NSMeasurement *)0;
    highlightedAngle = self->_primaryAngle;
  }
  return highlightedAngle;
}

- (void)setHighlightedAngle:(id)a3
{
  NSMeasurement *v4;
  NSMeasurement *highlightedAngle;

  v4 = (NSMeasurement *)a3;
  if (!self->_status)
    self->_status = 2;
  highlightedAngle = self->_highlightedAngle;
  self->_highlightedAngle = v4;

}

- (NSArray)angles
{
  NSArray *angles;
  NSArray *v3;

  angles = self->_angles;
  if (!angles)
  {
    if (!self->_status && self->_primaryAngle)
    {
      -[NSArray arrayByAddingObject:](self->_secondaryAngles, "arrayByAddingObject:");
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    angles = self->_secondaryAngles;
  }
  v3 = angles;
  return v3;
}

- (void)setAngles:(id)a3
{
  objc_storeStrong((id *)&self->_angles, a3);
}

- (void)setPrimaryAngle:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAngle, a3);
}

- (void)setSecondaryAngles:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAngles, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int16)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAngles, 0);
  objc_storeStrong((id *)&self->_angles, 0);
  objc_storeStrong((id *)&self->_primaryAngle, 0);
  objc_storeStrong((id *)&self->_highlightedAngle, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_0 != -1)
    dispatch_once(&accNavParameters_onceToken_0, &__block_literal_global_12);
  return (NSArray *)(id)accNavParameters__accNavParameters_0;
}

void __42__CPLane_CPAccNavUpdate__accNavParameters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[6];

  v29[4] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_index);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v24, "copySettingIsIntegerValue:", 1);
  v28 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v22, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  NSStringFromSelector(sel_status);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v19, "copySettingEnumType:", 4);
  v27 = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v17, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v15;
  NSStringFromSelector(sel_angles);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v14, "copySettingDimension:", v13);
  v26 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v12, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copySettingCollectionGeneric:", objc_opt_class());
  v29[2] = v2;
  NSStringFromSelector(sel_highlightedAngle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copySettingDimension:", v5);
  v25 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)accNavParameters__accNavParameters_0;
  accNavParameters__accNavParameters_0 = v9;

}

+ (NSDictionary)accNavParametersIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CPLane_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_0 != -1)
    dispatch_once(&accNavParametersIndexed_onceToken_0, block);
  return (NSDictionary *)(id)accNavParametersIndexed__accNavParametersIndexed_0;
}

void __49__CPLane_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParametersIndexedForUpdate:](CPAccNavUpdate, "accNavParametersIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_0;
  accNavParametersIndexed__accNavParametersIndexed_0 = v1;

}

+ (NSDictionary)accNavParameterKeysIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CPLane_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_0 != -1)
    dispatch_once(&accNavParameterKeysIndexed_onceToken_0, block);
  return (NSDictionary *)(id)accNavParameterKeysIndexed__accNavParameterKeysIndexed_0;
}

void __52__CPLane_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:](CPAccNavUpdate, "accNavParameterKeysIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_0;
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_0 = v1;

}

- (void)clearValueForKey:(id)a3
{
  +[CPAccNavUpdate update:resetValueForProperty:](CPAccNavUpdate, "update:resetValueForProperty:", self, a3);
}

@end
