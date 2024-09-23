@implementation MTRThermostatClusterPresetTypeStruct

- (MTRThermostatClusterPresetTypeStruct)init
{
  MTRThermostatClusterPresetTypeStruct *v2;
  MTRThermostatClusterPresetTypeStruct *v3;
  NSNumber *presetScenario;
  NSNumber *numberOfPresets;
  NSNumber *presetTypeFeatures;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRThermostatClusterPresetTypeStruct;
  v2 = -[MTRThermostatClusterPresetTypeStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    presetScenario = v2->_presetScenario;
    v2->_presetScenario = (NSNumber *)&unk_250591B18;

    numberOfPresets = v3->_numberOfPresets;
    v3->_numberOfPresets = (NSNumber *)&unk_250591B18;

    presetTypeFeatures = v3->_presetTypeFeatures;
    v3->_presetTypeFeatures = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterPresetTypeStruct *v4;
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

  v4 = objc_alloc_init(MTRThermostatClusterPresetTypeStruct);
  objc_msgSend_presetScenario(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPresetScenario_(v4, v8, (uint64_t)v7);

  objc_msgSend_numberOfPresets(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberOfPresets_(v4, v12, (uint64_t)v11);

  objc_msgSend_presetTypeFeatures(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPresetTypeFeatures_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: presetScenario:%@; numberOfPresets:%@; presetTypeFeatures:%@; >"),
    v5,
    self->_presetScenario,
    self->_numberOfPresets,
    self->_presetTypeFeatures);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)presetScenario
{
  return self->_presetScenario;
}

- (void)setPresetScenario:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)numberOfPresets
{
  return self->_numberOfPresets;
}

- (void)setNumberOfPresets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)presetTypeFeatures
{
  return self->_presetTypeFeatures;
}

- (void)setPresetTypeFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetTypeFeatures, 0);
  objc_storeStrong((id *)&self->_numberOfPresets, 0);
  objc_storeStrong((id *)&self->_presetScenario, 0);
}

@end
