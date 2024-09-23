@implementation FBSceneMonitorBehaviors

- (BOOL)monitorsClientSettings
{
  return self->_monitorsClientSettings;
}

- (BOOL)monitorsSettings
{
  return self->_monitorsSettings;
}

- (BOOL)monitorsPairingStatus
{
  return self->_monitorsPairingStatus;
}

- (void)setMonitorsSettings:(BOOL)a3
{
  self->_monitorsSettings = a3;
}

- (void)setMonitorsPairingStatus:(BOOL)a3
{
  self->_monitorsPairingStatus = a3;
}

- (void)setMonitorsClientSettings:(BOOL)a3
{
  self->_monitorsClientSettings = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FBSceneMonitorBehaviors *v4;

  v4 = objc_alloc_init(FBSceneMonitorBehaviors);
  -[FBSceneMonitorBehaviors setMonitorsSettings:](v4, "setMonitorsSettings:", self->_monitorsSettings);
  -[FBSceneMonitorBehaviors setMonitorsPairingStatus:](v4, "setMonitorsPairingStatus:", self->_monitorsPairingStatus);
  -[FBSceneMonitorBehaviors setMonitorsClientSettings:](v4, "setMonitorsClientSettings:", self->_monitorsClientSettings);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 monitorsSettings;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 monitorsPairingStatus;
  id v11;
  id v12;
  uint64_t monitorsClientSettings;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D22FB8], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  monitorsSettings = self->_monitorsSettings;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __35__FBSceneMonitorBehaviors_isEqual___block_invoke;
  v21[3] = &unk_1E4A126E8;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", monitorsSettings, v21);
  monitorsPairingStatus = self->_monitorsPairingStatus;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __35__FBSceneMonitorBehaviors_isEqual___block_invoke_2;
  v19[3] = &unk_1E4A126E8;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", monitorsPairingStatus, v19);
  monitorsClientSettings = self->_monitorsClientSettings;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __35__FBSceneMonitorBehaviors_isEqual___block_invoke_3;
  v17[3] = &unk_1E4A126E8;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", monitorsClientSettings, v17);
  LOBYTE(monitorsClientSettings) = objc_msgSend(v5, "isEqual");

  return monitorsClientSettings;
}

uint64_t __35__FBSceneMonitorBehaviors_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __35__FBSceneMonitorBehaviors_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
}

uint64_t __35__FBSceneMonitorBehaviors_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10);
}

@end
