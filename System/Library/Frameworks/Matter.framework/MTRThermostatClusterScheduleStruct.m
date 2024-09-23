@implementation MTRThermostatClusterScheduleStruct

- (MTRThermostatClusterScheduleStruct)init
{
  MTRThermostatClusterScheduleStruct *v2;
  MTRThermostatClusterScheduleStruct *v3;
  NSData *scheduleHandle;
  NSNumber *systemMode;
  NSString *name;
  NSData *presetHandle;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *transitions;
  NSNumber *builtIn;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRThermostatClusterScheduleStruct;
  v2 = -[MTRThermostatClusterScheduleStruct init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    scheduleHandle = v2->_scheduleHandle;
    v2->_scheduleHandle = 0;

    systemMode = v3->_systemMode;
    v3->_systemMode = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

    presetHandle = v3->_presetHandle;
    v3->_presetHandle = 0;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    transitions = v3->_transitions;
    v3->_transitions = (NSArray *)v10;

    builtIn = v3->_builtIn;
    v3->_builtIn = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterScheduleStruct *v4;
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

  v4 = objc_alloc_init(MTRThermostatClusterScheduleStruct);
  objc_msgSend_scheduleHandle(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScheduleHandle_(v4, v8, (uint64_t)v7);

  objc_msgSend_systemMode(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSystemMode_(v4, v12, (uint64_t)v11);

  objc_msgSend_name(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  objc_msgSend_presetHandle(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPresetHandle_(v4, v20, (uint64_t)v19);

  objc_msgSend_transitions(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitions_(v4, v24, (uint64_t)v23);

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
  NSNumber *systemMode;
  NSString *name;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_scheduleHandle, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  systemMode = self->_systemMode;
  name = self->_name;
  objc_msgSend_base64EncodedStringWithOptions_(self->_presetHandle, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("<%@: scheduleHandle:%@; systemMode:%@; name:%@; presetHandle:%@; transitions:%@; builtIn:%@; >"),
    v5,
    v7,
    systemMode,
    name,
    v11,
    self->_transitions,
    self->_builtIn);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSData)scheduleHandle
{
  return self->_scheduleHandle;
}

- (void)setScheduleHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)systemMode
{
  return self->_systemMode;
}

- (void)setSystemMode:(id)a3
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

- (NSData)presetHandle
{
  return self->_presetHandle;
}

- (void)setPresetHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
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
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_presetHandle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_systemMode, 0);
  objc_storeStrong((id *)&self->_scheduleHandle, 0);
}

@end
