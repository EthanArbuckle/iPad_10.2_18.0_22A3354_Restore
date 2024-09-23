@implementation MPCVocalAttenuationLowPowerModePolicy

- (MPCVocalAttenuationLowPowerModePolicy)initWithPowerModeMonitor:(id)a3 calloutQueue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPCVocalAttenuationLowPowerModePolicy *v12;
  MPCVocalAttenuationLowPowerModePolicy *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCVocalAttenuationLowPowerModePolicy;
  v12 = -[MPCVocalAttenuationLowPowerModePolicy init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = 1;
    objc_storeStrong((id *)&v12->_powerMonitor, a3);
    objc_storeStrong((id *)&v13->_calloutQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_disableVocalAttenuation = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel_processInfoPowerStateDidChange_, *MEMORY[0x24BDD1160], 0);

    v13->_dataLock._os_unfair_lock_opaque = 0;
    -[MPCVocalAttenuationLowPowerModePolicy powerModeDidChange:](v13, "powerModeDidChange:", -[NSProcessInfo isLowPowerModeEnabled](v13->_powerMonitor, "isLowPowerModeEnabled"));
  }

  return v13;
}

- (void)powerModeDidChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MPCVocalAttenuationLowPowerModePolicy *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (-[MPCVocalAttenuationLowPowerModePolicy isLowPowerModeEnabled](self, "isLowPowerModeEnabled") != a3)
  {
    -[MPCVocalAttenuationLowPowerModePolicy setLowPowerModeEnabled:](self, "setLowPowerModeEnabled:", v3);
    -[MPCVocalAttenuationLowPowerModePolicy setDisableVocalAttenuation:](self, "setDisableVocalAttenuation:", v3);
    -[MPCVocalAttenuationLowPowerModePolicy updateEvaluationWithReason:](self, "updateEvaluationWithReason:", CFSTR("value changed"));
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCVocalAttenuationLowPowerModePolicy evaluation](self, "evaluation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "explanation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = self;
      v10 = 2114;
      v11 = v7;
      v12 = 1024;
      v13 = -[MPCVocalAttenuationLowPowerModePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - %{public}@ - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v8, 0x1Cu);

    }
  }
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (MPCVocalAttenuationLowPowerModePolicy)initWithCalloutQueue:(id)a3 delegate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  MPCVocalAttenuationLowPowerModePolicy *v10;

  v6 = (void *)MEMORY[0x24BDD1760];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPCVocalAttenuationLowPowerModePolicy initWithPowerModeMonitor:calloutQueue:delegate:](self, "initWithPowerModeMonitor:calloutQueue:delegate:", v9, v8, v7);

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
  objc_msgSend(v4, "setDisableVocalAttenuation:", -[MPCVocalAttenuationLowPowerModePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[MPCVocalAttenuationLowPowerModePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
  v7 = CFSTR("off");
  if (v6)
    v7 = CFSTR("on");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Low power mode policy %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExplanation:", v8);

  objc_msgSend(v4, "setCanBeOverriden:", 1);
  objc_msgSend(v4, "setPolicyType:", -[MPCVocalAttenuationLowPowerModePolicy type](self, "type"));
  os_unfair_lock_unlock(p_dataLock);
  return v4;
}

- (void)processInfoPowerStateDidChange:(id)a3
{
  -[MPCVocalAttenuationLowPowerModePolicy powerModeDidChange:](self, "powerModeDidChange:", -[NSProcessInfo isLowPowerModeEnabled](self->_powerMonitor, "isLowPowerModeEnabled", a3));
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
  -[MPCVocalAttenuationLowPowerModePolicy evaluation](self, "evaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" [%@]"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setExplanation:", v7);
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MPCVocalAttenuationLowPowerModePolicy_updateEvaluationWithReason___block_invoke;
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

- (NSProcessInfo)powerMonitor
{
  return self->_powerMonitor;
}

- (void)setPowerMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_powerMonitor, a3);
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (BOOL)shouldDisableVocalAttenuation
{
  return self->_disableVocalAttenuation;
}

- (void)setDisableVocalAttenuation:(BOOL)a3
{
  self->_disableVocalAttenuation = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __68__MPCVocalAttenuationLowPowerModePolicy_updateEvaluationWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocalAttenuationPolicy:didChangeEvaluation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
