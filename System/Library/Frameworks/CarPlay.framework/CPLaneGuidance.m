@implementation CPLaneGuidance

- (CPLaneGuidance)laneGuidanceWithComponent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BE00BB8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithLaneGuidance:component:", self, v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE152A0]), "initWithComponent:accNavInfo:", v5, v8);
  return (CPLaneGuidance *)v9;
}

- (CPLaneGuidance)init
{
  CPLaneGuidance *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLaneGuidance;
  v2 = -[CPLaneGuidance init](&v4, sel_init);
  if (v2)
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v2);
  return v2;
}

- (CPLaneGuidance)initWithCoder:(id)a3
{
  id v4;
  CPLaneGuidance *v5;

  v4 = a3;
  v5 = -[CPLaneGuidance init](self, "init");
  if (v5)
    +[CPAccNavUpdate decodeUpdate:withCoder:](CPAccNavUpdate, "decodeUpdate:withCoder:", v5, v4);

  return v5;
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
  v8.super_class = (Class)CPLaneGuidance;
  -[CPLaneGuidance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setLanes:(id)a3
{
  NSArray *v4;
  NSArray *lanes;
  uint64_t v6;
  unsigned __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (NSArray *)objc_msgSend(v14, "copy");
  lanes = self->_lanes;
  self->_lanes = v4;

  if (objc_msgSend(v14, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      -[NSArray objectAtIndexedSubscript:](self->_lanes, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedShort:", objc_msgSend(v9, "index"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NotSetFromCPAccNavType(2uLL);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
      {
        -[NSArray objectAtIndexedSubscript:](self->_lanes, "objectAtIndexedSubscript:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIndex:", v7);

      }
      v6 = ++v7;
    }
    while (objc_msgSend(v14, "count") > (unint64_t)v7);
  }

}

- (NSArray)lanes
{
  return self->_lanes;
}

- (NSArray)instructionVariants
{
  return self->_instructionVariants;
}

- (void)setInstructionVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unsigned __int16)a3
{
  self->_componentID = a3;
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
  objc_storeStrong((id *)&self->_instructionVariants, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_2 != -1)
    dispatch_once(&accNavParameters_onceToken_2, &__block_literal_global_19);
  return (NSArray *)(id)accNavParameters__accNavParameters_2;
}

void __50__CPLaneGuidance_CPAccNavUpdate__accNavParameters__block_invoke()
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
  _QWORD v27[6];

  v27[4] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_componentID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v22, "copySettingIsIntegerValue:", 1);
  v26 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v20, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  NSStringFromSelector(sel_index);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v17, "copySettingIsIntegerValue:", 1);
  v25 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v15, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v13;
  NSStringFromSelector(sel_lanes);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v12, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copySettingCollectionGeneric:", objc_opt_class());
  v27[2] = v2;
  NSStringFromSelector(sel_instructionVariants);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copySettingHasVariants:", 1);
  v23 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copySettingCollectionGeneric:", objc_opt_class());
  v27[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)accNavParameters__accNavParameters_2;
  accNavParameters__accNavParameters_2 = v9;

}

+ (NSDictionary)accNavParametersIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CPLaneGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_2 != -1)
    dispatch_once(&accNavParametersIndexed_onceToken_2, block);
  return (NSDictionary *)(id)accNavParametersIndexed__accNavParametersIndexed_2;
}

void __57__CPLaneGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParametersIndexedForUpdate:](CPAccNavUpdate, "accNavParametersIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_2;
  accNavParametersIndexed__accNavParametersIndexed_2 = v1;

}

+ (NSDictionary)accNavParameterKeysIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CPLaneGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_2 != -1)
    dispatch_once(&accNavParameterKeysIndexed_onceToken_2, block);
  return (NSDictionary *)(id)accNavParameterKeysIndexed__accNavParameterKeysIndexed_2;
}

void __60__CPLaneGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:](CPAccNavUpdate, "accNavParameterKeysIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_2;
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_2 = v1;

}

- (void)clearValueForKey:(id)a3
{
  +[CPAccNavUpdate update:resetValueForProperty:](CPAccNavUpdate, "update:resetValueForProperty:", self, a3);
}

@end
