@implementation MPCVocalAttenuationThermalPressurePolicy

- (MPCVocalAttenuationThermalPressurePolicy)initWithThermalMonitor:(id)a3 calloutQueue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPCVocalAttenuationThermalPressurePolicy *v12;
  MPCVocalAttenuationThermalPressurePolicy *v13;
  uint64_t v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCVocalAttenuationThermalPressurePolicy;
  v12 = -[MPCVocalAttenuationThermalPressurePolicy init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = 0;
    objc_storeStrong((id *)&v12->_thermalMonitor, a3);
    -[ICEnvironmentMonitor registerObserver:](v13->_thermalMonitor, "registerObserver:", v13);
    objc_storeStrong((id *)&v13->_calloutQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = -[ICEnvironmentMonitor currentThermalPressureLevel](v13->_thermalMonitor, "currentThermalPressureLevel");
    v13->_currentThermalLevel = v14;
    *(_OWORD *)&v13->_cutoffThermalLevel = xmmword_210ED9490;
    v13->_disableVocalAttenuation = 0;
    v13->_dataLock._os_unfair_lock_opaque = 0;
    -[MPCVocalAttenuationThermalPressurePolicy thermalStateDidChange:](v13, "thermalStateDidChange:", v14);
  }

  return v13;
}

- (void)thermalStateDidChange:(int64_t)a3
{
  os_unfair_lock_s *p_dataLock;
  NSObject *v6;
  int64_t currentThermalLevel;
  NSObject *v8;
  int64_t reenablementThermalLevel;
  BOOL v10;
  int v11;
  int64_t cutoffThermalLevel;
  NSObject *v13;
  int64_t v14;
  int v15;
  MPCVocalAttenuationThermalPressurePolicy *v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentThermalLevel = self->_currentThermalLevel;
    v15 = 138543874;
    v16 = self;
    v17 = 2048;
    v18 = currentThermalLevel;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure level changed: %ld -> %ld", (uint8_t *)&v15, 0x20u);
  }

  if (!-[MPCVocalAttenuationThermalPressurePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"))
  {
    if (self->_cutoffThermalLevel <= a3)
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        cutoffThermalLevel = self->_cutoffThermalLevel;
        v15 = 138543618;
        v16 = self;
        v17 = 2048;
        v18 = cutoffThermalLevel;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure >= %ld: disabling vocal attenuation", (uint8_t *)&v15, 0x16u);
      }
      v10 = 1;
      goto LABEL_13;
    }
LABEL_9:
    v11 = 0;
    goto LABEL_14;
  }
  if (self->_reenablementThermalLevel < a3)
    goto LABEL_9;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    reenablementThermalLevel = self->_reenablementThermalLevel;
    v15 = 138543618;
    v16 = self;
    v17 = 2048;
    v18 = reenablementThermalLevel;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure < %ld: allowing vocal attenuation", (uint8_t *)&v15, 0x16u);
  }
  v10 = 0;
LABEL_13:

  self->_disableVocalAttenuation = v10;
  v11 = 1;
LABEL_14:
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_currentThermalLevel;
    v15 = 138543874;
    v16 = self;
    v17 = 2048;
    v18 = v14;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure level changed: %ld -> %ld", (uint8_t *)&v15, 0x20u);
  }

  self->_currentThermalLevel = a3;
  os_unfair_lock_unlock(p_dataLock);
  if (v11)
    -[MPCVocalAttenuationThermalPressurePolicy updateEvaluationWithReason:](self, "updateEvaluationWithReason:", CFSTR("value changed"));
}

- (BOOL)shouldDisableVocalAttenuation
{
  return self->_disableVocalAttenuation;
}

- (MPCVocalAttenuationThermalPressurePolicy)initWithCalloutQueue:(id)a3 delegate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  MPCVocalAttenuationThermalPressurePolicy *v10;

  v6 = (void *)MEMORY[0x24BEC87C0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPCVocalAttenuationThermalPressurePolicy initWithThermalMonitor:calloutQueue:delegate:](self, "initWithThermalMonitor:calloutQueue:delegate:", v9, v8, v7);

  return v10;
}

- (BOOL)canBeReset
{
  return 0;
}

- (id)evaluation
{
  os_unfair_lock_s *p_dataLock;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDisableVocalAttenuation:", -[MPCVocalAttenuationThermalPressurePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[MPCVocalAttenuationThermalPressurePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
  v7 = CFSTR("off");
  if (v6)
    v7 = CFSTR("on");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Thermal pressure policy %@ [level:%ld]"), v7, self->_currentThermalLevel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExplanation:", v8);

  objc_msgSend(v4, "setCanBeOverriden:", 0);
  objc_msgSend(v4, "setPolicyType:", -[MPCVocalAttenuationThermalPressurePolicy type](self, "type"));
  os_unfair_lock_unlock(p_dataLock);
  return v4;
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4;

  -[MPCVocalAttenuationThermalPressurePolicy thermalMonitor](self, "thermalMonitor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCVocalAttenuationThermalPressurePolicy thermalStateDidChange:](self, "thermalStateDidChange:", objc_msgSend(v4, "currentThermalPressureLevel"));

}

- (void)updateEvaluationWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *calloutQueue;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  -[MPCVocalAttenuationThermalPressurePolicy evaluation](self, "evaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" [%@]"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setExplanation:", v7);
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__MPCVocalAttenuationThermalPressurePolicy_updateEvaluationWithReason___block_invoke;
  block[3] = &unk_24CABA1D0;
  block[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(calloutQueue, block);

}

- (MPCVocalAttenuationPolicyDelegate)delegate
{
  return (MPCVocalAttenuationPolicyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)type
{
  return self->_type;
}

- (ICEnvironmentMonitor)thermalMonitor
{
  return self->_thermalMonitor;
}

- (void)setThermalMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_thermalMonitor, a3);
}

- (int64_t)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int64_t)a3
{
  self->_currentThermalLevel = a3;
}

- (int64_t)cutoffThermalLevel
{
  return self->_cutoffThermalLevel;
}

- (void)setCutoffThermalLevel:(int64_t)a3
{
  self->_cutoffThermalLevel = a3;
}

- (int64_t)reenablementThermalLevel
{
  return self->_reenablementThermalLevel;
}

- (void)setReenablementThermalLevel:(int64_t)a3
{
  self->_reenablementThermalLevel = a3;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (os_unfair_lock_s)dataLock
{
  return self->_dataLock;
}

- (void)setDisableVocalAttenuation:(BOOL)a3
{
  self->_disableVocalAttenuation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__MPCVocalAttenuationThermalPressurePolicy_updateEvaluationWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocalAttenuationPolicy:didChangeEvaluation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
