@implementation MTRThermostatClusterQueuedPresetStruct

- (MTRThermostatClusterQueuedPresetStruct)init
{
  MTRThermostatClusterQueuedPresetStruct *v2;
  MTRThermostatClusterQueuedPresetStruct *v3;
  NSData *presetHandle;
  NSNumber *transitionTimestamp;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRThermostatClusterQueuedPresetStruct;
  v2 = -[MTRThermostatClusterQueuedPresetStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    presetHandle = v2->_presetHandle;
    v2->_presetHandle = 0;

    transitionTimestamp = v3->_transitionTimestamp;
    v3->_transitionTimestamp = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterQueuedPresetStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRThermostatClusterQueuedPresetStruct);
  objc_msgSend_presetHandle(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPresetHandle_(v4, v8, (uint64_t)v7);

  objc_msgSend_transitionTimestamp(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTimestamp_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: presetHandle:%@; transitionTimestamp:%@; >"),
    v5,
    v7,
    self->_transitionTimestamp);
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

- (NSNumber)transitionTimestamp
{
  return self->_transitionTimestamp;
}

- (void)setTransitionTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimestamp, 0);
  objc_storeStrong((id *)&self->_presetHandle, 0);
}

@end
