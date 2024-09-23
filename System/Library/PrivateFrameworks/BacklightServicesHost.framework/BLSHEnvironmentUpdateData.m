@implementation BLSHEnvironmentUpdateData

- (BLSHEnvironmentUpdateData)initWithEnvironmentIdentifier:(id)a3 newBacklightState:(int64_t)a4 pendingTransitionStateCount:(unint64_t)a5
{
  id v8;
  BLSHEnvironmentUpdateData *v9;
  uint64_t v10;
  NSString *environmentIdentifier;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHEnvironmentUpdateData;
  v9 = -[BLSHEnvironmentUpdateData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    environmentIdentifier = v9->_environmentIdentifier;
    v9->_environmentIdentifier = (NSString *)v10;

    v9->_newBacklightState = a4;
    v9->_pendingTransitionStateCount = a5;
    v9->_timeStamp = mach_continuous_time();
  }

  return v9;
}

- (id)description
{
  void *v3;
  NSString *environmentIdentifier;
  void *v5;
  unint64_t pendingTransitionStateCount;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  environmentIdentifier = self->_environmentIdentifier;
  NSStringFromBLSBacklightState();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pendingTransitionStateCount = self->_pendingTransitionStateCount;
  v7 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v7, "bls_initWithMachContinuousTime:", self->_timeStamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bls_shortLoggingString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("update %@ %@ %lu %@"), environmentIdentifier, v5, pendingTransitionStateCount, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *environmentIdentifier;
  uint64_t v7;
  id v8;
  id v9;
  int64_t newBacklightState;
  id v11;
  id v12;
  unint64_t pendingTransitionStateCount;
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
  environmentIdentifier = self->_environmentIdentifier;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __37__BLSHEnvironmentUpdateData_isEqual___block_invoke;
  v21[3] = &unk_24D1BD0A0;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", environmentIdentifier, v21);
  newBacklightState = self->_newBacklightState;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_2;
  v19[3] = &unk_24D1BC3E8;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", newBacklightState, v19);
  pendingTransitionStateCount = self->_pendingTransitionStateCount;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_3;
  v17[3] = &unk_24D1BC3E8;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", pendingTransitionStateCount, v17);
  LOBYTE(pendingTransitionStateCount) = objc_msgSend(v5, "isEqual");

  return pendingTransitionStateCount;
}

id __37__BLSHEnvironmentUpdateData_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newBacklightState");
}

uint64_t __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pendingTransitionStateCount");
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (int64_t)newBacklightState
{
  return self->_newBacklightState;
}

- (unint64_t)pendingTransitionStateCount
{
  return self->_pendingTransitionStateCount;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifier, 0);
}

@end
