@implementation BLSHEnvironmentPerformEventData

- (BLSHEnvironmentPerformEventData)initWithStateMachineOldBacklightState:(int64_t)a3 eventPreviousBacklightState:(int64_t)a4 eventNewBacklightState:(int64_t)a5
{
  BLSHEnvironmentPerformEventData *v8;
  BLSHEnvironmentPerformEventData *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BLSHEnvironmentPerformEventData;
  v8 = -[BLSHEnvironmentPerformEventData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_stateMachineOldBacklightState = a3;
    v8->_eventPreviousBacklightState = a4;
    v8->_eventNewBacklightState = a5;
    v8->_startedTime = mach_continuous_time();
  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromBLSBacklightState();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightState();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v7, "bls_initWithMachContinuousTime:", self->_startedTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bls_shortLoggingString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("event (%@) %@->%@ %@"), v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t stateMachineOldBacklightState;
  uint64_t v7;
  id v8;
  id v9;
  int64_t eventPreviousBacklightState;
  id v11;
  id v12;
  int64_t eventNewBacklightState;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  stateMachineOldBacklightState = self->_stateMachineOldBacklightState;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke;
  v21[3] = &unk_24D1BC3E8;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", stateMachineOldBacklightState, v21);
  eventPreviousBacklightState = self->_eventPreviousBacklightState;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_2;
  v19[3] = &unk_24D1BC3E8;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", eventPreviousBacklightState, v19);
  eventNewBacklightState = self->_eventNewBacklightState;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_3;
  v17[3] = &unk_24D1BC3E8;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", eventNewBacklightState, v17);
  LOBYTE(eventNewBacklightState) = objc_msgSend(v5, "isEqual");

  return eventNewBacklightState;
}

uint64_t __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateMachineOldBacklightState");
}

uint64_t __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventPreviousBacklightState");
}

uint64_t __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventNewBacklightState");
}

- (int64_t)stateMachineOldBacklightState
{
  return self->_stateMachineOldBacklightState;
}

- (int64_t)eventPreviousBacklightState
{
  return self->_eventPreviousBacklightState;
}

- (int64_t)eventNewBacklightState
{
  return self->_eventNewBacklightState;
}

- (unint64_t)startedTime
{
  return self->_startedTime;
}

@end
