@implementation MTRThermostatClusterPresetStruct

- (MTRThermostatClusterPresetStruct)init
{
  MTRThermostatClusterPresetStruct *v2;
  MTRThermostatClusterPresetStruct *v3;
  NSData *presetHandle;
  NSNumber *presetScenario;
  NSString *name;
  NSNumber *coolingSetpoint;
  NSNumber *heatingSetpoint;
  NSNumber *builtIn;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRThermostatClusterPresetStruct;
  v2 = -[MTRThermostatClusterPresetStruct init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    presetHandle = v2->_presetHandle;
    v2->_presetHandle = 0;

    presetScenario = v3->_presetScenario;
    v3->_presetScenario = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

    coolingSetpoint = v3->_coolingSetpoint;
    v3->_coolingSetpoint = 0;

    heatingSetpoint = v3->_heatingSetpoint;
    v3->_heatingSetpoint = 0;

    builtIn = v3->_builtIn;
    v3->_builtIn = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterPresetStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRThermostatClusterPresetStruct);
  objc_msgSend_presetHandle(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPresetHandle_(v4, v8, (uint64_t)v7);

  objc_msgSend_presetScenario(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPresetScenario_(v4, v12, (uint64_t)v11);

  objc_msgSend_name(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  objc_msgSend_coolingSetpoint(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCoolingSetpoint_(v4, v20, (uint64_t)v19);

  objc_msgSend_heatingSetpoint(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeatingSetpoint_(v4, v24, (uint64_t)v23);

  objc_msgSend_builtIn(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBuiltIn_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_presetHandle, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: presetHandle:%@; presetScenario:%@; name:%@; coolingSetpoint:%@; heatingSetpoint:%@; builtIn:%@; >"),
    v5,
    v7,
    self->_presetScenario,
    self->_name,
    self->_coolingSetpoint,
    self->_heatingSetpoint,
    self->_builtIn);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)presetHandle
{
  return self->_presetHandle;
}

- (void)setPresetHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)presetScenario
{
  return self->_presetScenario;
}

- (void)setPresetScenario:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)coolingSetpoint
{
  return self->_coolingSetpoint;
}

- (void)setCoolingSetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)heatingSetpoint
{
  return self->_heatingSetpoint;
}

- (void)setHeatingSetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtIn, 0);
  objc_storeStrong((id *)&self->_heatingSetpoint, 0);
  objc_storeStrong((id *)&self->_coolingSetpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_presetScenario, 0);
  objc_storeStrong((id *)&self->_presetHandle, 0);
}

@end
