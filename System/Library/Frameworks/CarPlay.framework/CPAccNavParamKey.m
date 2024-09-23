@implementation CPAccNavParamKey

+ (id)paramKey:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setKey:", v3);
  return v4;
}

- (CPAccNavParamKey)init
{
  CPAccNavParamKey *v2;
  uint64_t v3;
  NSSet *characteristics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPAccNavParamKey;
  v2 = -[CPAccNavParamKey init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    characteristics = v2->_characteristics;
    v2->_characteristics = (NSSet *)v3;

    v2->_accNavType = -1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setKey:", -[CPAccNavParamKey key](self, "key"));
  -[CPAccNavParamKey characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v5);

  objc_msgSend(v4, "setIsBoolValue:", -[CPAccNavParamKey isBoolValue](self, "isBoolValue"));
  objc_msgSend(v4, "setEnumType:", -[CPAccNavParamKey enumType](self, "enumType"));
  -[CPAccNavParamKey dimension](self, "dimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimension:", v6);

  objc_msgSend(v4, "setIsIntegerValue:", -[CPAccNavParamKey isIntegerValue](self, "isIntegerValue"));
  objc_msgSend(v4, "setIsTimeIntervalValue:", -[CPAccNavParamKey isTimeIntervalValue](self, "isTimeIntervalValue"));
  objc_msgSend(v4, "setHasVariants:", -[CPAccNavParamKey hasVariants](self, "hasVariants"));
  objc_msgSend(v4, "setAccNavType:", -[CPAccNavParamKey accNavType](self, "accNavType"));
  -[CPAccNavParamKey param](self, "param");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParam:", v7);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  if (-[CPAccNavParamKey accNavType](self, "accNavType") != -1)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromCPAccNavType(-[CPAccNavParamKey accNavType](self, "accNavType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" accNavType=%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[CPAccNavParamKey hasCharacteristics](self, "hasCharacteristics"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[CPAccNavParamKey characteristics](self, "characteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR(" [%@]"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = objc_opt_class();
  v14 = -[CPAccNavParamKey key](self, "key");
  objc_msgSend(v3, "componentsJoinedByString:", &stru_24C77F1E0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p key=%hu%@>"), v13, self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)unsetValue
{
  unint64_t v2;

  v2 = -[CPAccNavParamKey accNavType](self, "accNavType");
  if (v2 > 7)
    return 0;
  else
    return *(&off_24C77D358 + v2);
}

- (id)copySettingAccNavType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v4, "setAccNavType:", a3);
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == -1)
    objc_msgSend(v5, "cp_setByRemovingObject:", CFSTR("accNavType"));
  else
    objc_msgSend(v5, "setByAddingObject:", CFSTR("accNavType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v7);

  return v4;
}

- (BOOL)hasCharacteristics
{
  void *v2;
  BOOL v3;

  -[CPAccNavParamKey characteristics](self, "characteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)copySettingIsBoolValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v4, "setIsBoolValue:", v3);
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setByAddingObject:", CFSTR("isBool"));
  else
    objc_msgSend(v5, "cp_setByRemovingObject:", CFSTR("isBool"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v7);

  return v4;
}

- (id)copySettingEnumType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v4, "setEnumType:", v3);
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    objc_msgSend(v5, "setByAddingObject:", CFSTR("enumType"));
  else
    objc_msgSend(v5, "cp_setByRemovingObject:", CFSTR("enumType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v7);

  return v4;
}

- (id)copySettingDimension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v5, "setDimension:", v4);

  objc_msgSend(v5, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "setByAddingObject:", CFSTR("dimension"));
  else
    objc_msgSend(v6, "cp_setByRemovingObject:", CFSTR("dimension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharacteristics:", v8);

  return v5;
}

- (id)copySettingIsIntegerValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v4, "setIsIntegerValue:", v3);
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setByAddingObject:", CFSTR("integerValue"));
  else
    objc_msgSend(v5, "cp_setByRemovingObject:", CFSTR("integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v7);

  return v4;
}

- (id)copySettingIsTimeIntervalValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v4, "setIsTimeIntervalValue:", v3);
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setByAddingObject:", CFSTR("timeInterval"));
  else
    objc_msgSend(v5, "cp_setByRemovingObject:", CFSTR("timeInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v7);

  return v4;
}

- (id)copySettingHasVariants:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)-[CPAccNavParamKey copy](self, "copy");
  objc_msgSend(v4, "setHasVariants:", v3);
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setByAddingObject:", CFSTR("hasVariants"));
  else
    objc_msgSend(v5, "cp_setByRemovingObject:", CFSTR("hasVariants"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacteristics:", v7);

  return v4;
}

- (unsigned)key
{
  return self->_key;
}

- (void)setKey:(unsigned __int16)a3
{
  self->_key = a3;
}

- (NSSet)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

- (BOOL)isBoolValue
{
  return self->_isBoolValue;
}

- (void)setIsBoolValue:(BOOL)a3
{
  self->_isBoolValue = a3;
}

- (unsigned)enumType
{
  return self->_enumType;
}

- (void)setEnumType:(unsigned __int8)a3
{
  self->_enumType = a3;
}

- (NSDimension)dimension
{
  return self->_dimension;
}

- (void)setDimension:(id)a3
{
  objc_storeStrong((id *)&self->_dimension, a3);
}

- (BOOL)isIntegerValue
{
  return self->_isIntegerValue;
}

- (void)setIsIntegerValue:(BOOL)a3
{
  self->_isIntegerValue = a3;
}

- (BOOL)isTimeIntervalValue
{
  return self->_isTimeIntervalValue;
}

- (void)setIsTimeIntervalValue:(BOOL)a3
{
  self->_isTimeIntervalValue = a3;
}

- (BOOL)hasVariants
{
  return self->_hasVariants;
}

- (void)setHasVariants:(BOOL)a3
{
  self->_hasVariants = a3;
}

- (int64_t)accNavType
{
  return self->_accNavType;
}

- (void)setAccNavType:(int64_t)a3
{
  self->_accNavType = a3;
}

- (CPAccNavParam)param
{
  return (CPAccNavParam *)objc_loadWeakRetained((id *)&self->_param);
}

- (void)setParam:(id)a3
{
  objc_storeWeak((id *)&self->_param, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_param);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end
