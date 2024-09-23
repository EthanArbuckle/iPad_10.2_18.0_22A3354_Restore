@implementation MPCVocalAttenuationPerformancePolicy

- (MPCVocalAttenuationPerformancePolicy)initWithPerformanceLimit:(double)a3 calloutQueue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  MPCVocalAttenuationPerformancePolicy *v11;
  MPCVocalAttenuationPerformancePolicy *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPCVocalAttenuationPerformancePolicy;
  v11 = -[MPCVocalAttenuationPerformancePolicy init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = 2;
    v11->_performanceLimit = a3;
    objc_storeStrong((id *)&v11->_calloutQueue, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_disableVocalAttenuation = 0;
    *(_OWORD *)&v12->_timeOfFirstGlitch = xmmword_210ED94A0;
    *(_QWORD *)&v12->_glitchesThreshold = 5;
  }

  return v12;
}

- (BOOL)canBeReset
{
  return 1;
}

- (void)reset
{
  if (-[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"))
  {
    os_unfair_lock_lock(&self->_dataLock);
    self->_disableVocalAttenuation = 0;
    self->_timeOfFirstGlitch = -1.0;
    self->_currentNumberOfGlitches = 0;
    os_unfair_lock_unlock(&self->_dataLock);
    -[MPCVocalAttenuationPerformancePolicy updateEvaluationWithReason:](self, "updateEvaluationWithReason:", CFSTR("reset"));
  }
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
  objc_msgSend(v4, "setDisableVocalAttenuation:", -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
  v7 = CFSTR("off");
  if (v6)
    v7 = CFSTR("on");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Performance policy %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExplanation:", v8);

  objc_msgSend(v4, "setCanBeOverriden:", 1);
  objc_msgSend(v4, "setPolicyType:", -[MPCVocalAttenuationPerformancePolicy type](self, "type"));
  os_unfair_lock_unlock(p_dataLock);
  return v4;
}

- (void)processSample:(double)a3
{
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  double timeOfFirstGlitch;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  double timeThreshold;
  _BOOL4 v21;
  NSObject *v22;
  double v23;
  uint64_t v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t currentNumberOfGlitches;
  _BOOL4 v28;
  int v29;
  MPCVocalAttenuationPerformancePolicy *v30;
  __int16 v31;
  _BYTE v32[18];
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (-[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"))
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v29 = 138543362;
      v30 = self;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEBUG, "[AP] - %{public}@ - ignoring sample [policy already active]", (uint8_t *)&v29, 0xCu);
    }

    return;
  }
  os_unfair_lock_lock(&self->_dataLock);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemUptime");
  v8 = v7;

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138543874;
    v30 = self;
    v31 = 1024;
    *(_DWORD *)v32 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
    *(_WORD *)&v32[4] = 2048;
    *(double *)&v32[6] = v8;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEBUG, "[AP] - %{public}@ - %{BOOL}u - process sample - %fs", (uint8_t *)&v29, 0x1Cu);
  }

  -[MPCVocalAttenuationPerformancePolicy performanceLimit](self, "performanceLimit");
  if (v10 >= a3)
    goto LABEL_25;
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[MPCVocalAttenuationPerformancePolicy performanceLimit](self, "performanceLimit");
    v13 = v12;
    v14 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
    v29 = 138544130;
    v30 = self;
    v31 = 2048;
    *(double *)v32 = a3;
    *(_WORD *)&v32[8] = 2048;
    *(_QWORD *)&v32[10] = v13;
    v33 = 1024;
    v34 = v14;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Sample over limit [%3.2fms > %3.2fms] - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x26u);
  }

  timeOfFirstGlitch = self->_timeOfFirstGlitch;
  if (timeOfFirstGlitch < 0.0)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
      v29 = 138543618;
      v30 = self;
      v31 = 1024;
      *(_DWORD *)v32 = v17;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - First glitch detected - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x12u);
    }

    self->_timeOfFirstGlitch = v8;
    self->_currentNumberOfGlitches = 1;
    goto LABEL_25;
  }
  if (v8 - timeOfFirstGlitch >= self->_timeThreshold)
  {
    self->_timeOfFirstGlitch = v8;
    self->_currentNumberOfGlitches = 1;
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      currentNumberOfGlitches = self->_currentNumberOfGlitches;
      v28 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
      v29 = 138543874;
      v30 = self;
      v31 = 2048;
      *(_QWORD *)v32 = currentNumberOfGlitches;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v28;
      _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - New glitch after time limit - %ld - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x1Cu);
    }

    goto LABEL_25;
  }
  ++self->_currentNumberOfGlitches;
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_currentNumberOfGlitches;
    timeThreshold = self->_timeThreshold;
    v21 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
    v29 = 138544130;
    v30 = self;
    v31 = 2048;
    *(_QWORD *)v32 = v19;
    *(_WORD *)&v32[8] = 2048;
    *(double *)&v32[10] = timeThreshold;
    v33 = 1024;
    v34 = v21;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - %ld glitches detected in the last %3.2fms - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x26u);
  }

  if (-[MPCVocalAttenuationPerformancePolicy currentNumberOfGlitches](self, "currentNumberOfGlitches") < self->_glitchesThreshold
    || -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"))
  {
LABEL_25:
    os_unfair_lock_unlock(&self->_dataLock);
    return;
  }
  self->_disableVocalAttenuation = 1;
  _MPCLogCategoryPlayback();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_timeThreshold;
    v24 = self->_currentNumberOfGlitches;
    v25 = -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation");
    v29 = 138544130;
    v30 = self;
    v31 = 2048;
    *(double *)v32 = v23;
    *(_WORD *)&v32[8] = 2048;
    *(_QWORD *)&v32[10] = v24;
    v33 = 1024;
    v34 = v25;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Too many glitches detected in the last %3.2fms: %ld - Disabling vocal attenuation - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x26u);
  }

  os_unfair_lock_unlock(&self->_dataLock);
  -[MPCVocalAttenuationPerformancePolicy updateEvaluationWithReason:](self, "updateEvaluationWithReason:", CFSTR("Too many glitches"));
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
  -[MPCVocalAttenuationPerformancePolicy evaluation](self, "evaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" [%@]"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setExplanation:", v7);
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__MPCVocalAttenuationPerformancePolicy_updateEvaluationWithReason___block_invoke;
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

- (double)performanceLimit
{
  return self->_performanceLimit;
}

- (void)setPerformanceLimit:(double)a3
{
  self->_performanceLimit = a3;
}

- (double)timeOfFirstGlitch
{
  return self->_timeOfFirstGlitch;
}

- (void)setTimeOfFirstGlitch:(double)a3
{
  self->_timeOfFirstGlitch = a3;
}

- (double)timeThreshold
{
  return self->_timeThreshold;
}

- (void)setTimeThreshold:(double)a3
{
  self->_timeThreshold = a3;
}

- (int)currentNumberOfGlitches
{
  return self->_currentNumberOfGlitches;
}

- (void)setCurrentNumberOfGlitches:(int)a3
{
  self->_currentNumberOfGlitches = a3;
}

- (int)glitchesThreshold
{
  return self->_glitchesThreshold;
}

- (void)setGlitchesThreshold:(int)a3
{
  self->_glitchesThreshold = a3;
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
  objc_destroyWeak((id *)&self->_delegate);
}

void __67__MPCVocalAttenuationPerformancePolicy_updateEvaluationWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocalAttenuationPolicy:didChangeEvaluation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
