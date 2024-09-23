@implementation BLSBacklightSceneEnvironmentUpdater

- (BLSBacklightSceneEnvironmentUpdater)initWithEnvironment:(id)a3
{
  id v4;
  BLSBacklightSceneEnvironmentUpdater *v5;
  BLSBacklightSceneEnvironmentUpdater *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSBacklightSceneEnvironmentUpdater;
  v5 = -[BLSBacklightSceneEnvironmentUpdater init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_environment, v4);

  return v6;
}

- (void)updatedEnvironmentWithDelta:(id)a3 backlightSceneUpdate:(id)a4
{
  unsigned __int8 v4;
  NSObject *v6;
  NSObject *WeakRetained;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  int v35;
  double v36;
  int v37;
  BLSBacklightSceneEnvironmentUpdater *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;

  v4 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    bls_environment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[BLSBacklightSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_27;
  }
  if ((v4 & 8) != 0)
  {
    -[NSObject visualState](WeakRetained, "visualState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "updateFidelity");
    v11 = objc_msgSend(v9, "adjustedLuminance");
    -[NSObject alwaysOnSession](v8, "alwaysOnSession");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 1 || v10 == 1 || v10 == 2)
    {
      if (-[BLSBacklightSceneEnvironmentUpdater ensureAlwaysOnSessionCreatedForEnvironment:]((_BOOL8)self, v8))
      {
        -[NSObject alwaysOnSession](v8, "alwaysOnSession");
        v16 = objc_claimAutoreleasedReturnValue();

        bls_environment_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          BLSBacklightFBSSceneEnvironmentDeltaDescription(v4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 134218754;
          v38 = self;
          v39 = 2114;
          v40 = v16;
          v41 = 2112;
          v42 = v8;
          v43 = 2112;
          v44 = v24;
          _os_log_impl(&dword_1B0C75000, v13, OS_LOG_TYPE_INFO, "%p created alwaysOnSession:%{public}@ for updatedEnvironment:%@ withDelta:%@", (uint8_t *)&v37, 0x2Au);

        }
        goto LABEL_15;
      }
    }
    else if (v12)
    {
      bls_environment_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BLSBacklightFBSSceneEnvironmentDeltaDescription(v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 134218754;
        v38 = self;
        v39 = 2114;
        v40 = (uint64_t)v13;
        v41 = 2112;
        v42 = v8;
        v43 = 2112;
        v44 = v15;
        _os_log_impl(&dword_1B0C75000, v14, OS_LOG_TYPE_INFO, "%p destroying alwaysOnSession:%{public}@ for updatedEnvironment:%@ withDelta:%@", (uint8_t *)&v37, 0x2Au);

      }
      -[NSObject invalidate](v13, "invalidate");
      -[NSObject setAlwaysOnSession:](v8, "setAlwaysOnSession:", 0);
      v16 = 0;
LABEL_15:

      v13 = v16;
    }

  }
  if (v6)
  {
    -[NSObject context](v6, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "triggerEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "eventID");
    objc_msgSend(v26, "state");
    -[NSObject identifier](v8, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    BLSEncode4Chars(v27, 4);
    -[NSObject identifier](v8, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    BLSEncode4Chars(v28, 0);
    kdebug_trace();

    -[NSObject delegate](v8, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    bls_environment_log();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v17)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        -[NSObject identifier](v8, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 134219010;
        v38 = self;
        v39 = 2114;
        v40 = (uint64_t)v31;
        v41 = 2048;
        v42 = v17;
        v43 = 2114;
        v44 = v33;
        v45 = 2114;
        v46 = v6;
        _os_log_impl(&dword_1B0C75000, v30, OS_LOG_TYPE_INFO, "%p calling performBacklightSceneUpdate: on delegate for %{public}@: %p %{public}@ with %{public}@", (uint8_t *)&v37, 0x34u);

      }
      -[NSObject environment:performBacklightSceneUpdate:](v17, "environment:performBacklightSceneUpdate:", v8, v6);
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v37 = 134218498;
        v38 = self;
        v39 = 2114;
        v40 = (uint64_t)v8;
        v41 = 2114;
        v42 = v6;
        _os_log_error_impl(&dword_1B0C75000, v30, OS_LOG_TYPE_ERROR, "%p delegate:<NULL> (will complete immediately) environment:%{public}@ performBacklightSceneUpdate:%{public}@", (uint8_t *)&v37, 0x20u);
      }

      -[NSObject sceneContentsDidUpdate](v6, "sceneContentsDidUpdate");
      -[NSObject context](v6, "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isAnimated");
      v36 = 0.0;
      if (v35)
        v36 = 0.5;
      -[NSObject performBacklightRampWithDuration:](v6, "performBacklightRampWithDuration:", v36);

      -[NSObject sceneContentsAnimationDidComplete](v6, "sceneContentsAnimationDidComplete");
    }
LABEL_27:

  }
}

- (BOOL)ensureAlwaysOnSessionCreatedForEnvironment:(_BOOL8)a1
{
  id v3;
  void *v4;
  BLSAlwaysOnSession *v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "alwaysOnSession");
    v5 = (BLSAlwaysOnSession *)objc_claimAutoreleasedReturnValue();
    a1 = v5 == 0;
    if (!v5)
    {
      v5 = -[BLSAlwaysOnSession initWithEnvironment:]([BLSAlwaysOnSession alloc], "initWithEnvironment:", v4);
      objc_msgSend(v4, "setAlwaysOnSession:", v5);
    }

  }
  return a1;
}

- (void)performDesiredFidelityRequest:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  BLSBacklightSceneEnvironmentUpdater *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained)
  {
    objc_msgSend(0, "eventID");
    objc_msgSend(0, "state");
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BLSEncode4Chars(v6, 4);
    objc_msgSend(WeakRetained, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BLSEncode4Chars(v7, 0);
    kdebug_trace();

    v8 = -[BLSBacklightSceneEnvironmentUpdater ensureAlwaysOnSessionCreatedForEnvironment:]((_BOOL8)self, WeakRetained);
    objc_msgSend(WeakRetained, "alwaysOnSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    bls_environment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v30 = self;
      v31 = 2114;
      v32 = v4;
      v33 = 2114;
      v34 = v9;
      v35 = 2048;
      v36 = WeakRetained;
      v37 = 2114;
      v38 = v11;
      v39 = 1024;
      v40 = v8;
      _os_log_impl(&dword_1B0C75000, v10, OS_LOG_TYPE_INFO, "%p performDesiredFidelityRequest:%{public}@ alwaysOnSession:%{public}@ environment:<%p %{public}@>, createdSession=%{BOOL}u", buf, 0x3Au);

    }
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithStartDate:duration:", v14, 60.0);

      objc_msgSend(WeakRetained, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke;
      v25[3] = &unk_1E621A4C0;
      v26 = v9;
      v27 = v15;
      v28 = v4;
      v17 = v15;
      objc_msgSend(v16, "environment:timelinesForDateInterval:previousSpecifier:completion:", WeakRetained, v17, 0, v25);

    }
    else
    {
      objc_msgSend(v4, "completeWithDesiredFidelity:", 1);
    }

  }
  else
  {
    bls_environment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BLSBacklightSceneEnvironmentUpdater performDesiredFidelityRequest:].cold.1((uint64_t)self, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(v4, "completeWithDesiredFidelity:", 1);
  }

}

void __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke_2;
  v5[3] = &unk_1E621A498;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "desiredFidelityForDateInterval:timelines:withCompletion:", v4, a2, v5);

}

uint64_t __69__BLSBacklightSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithDesiredFidelity:", a2);
}

- (void)performFrameSpecifiersRequest:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  BLSBacklightSceneEnvironmentUpdater *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "alwaysOnSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    bls_environment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v18 = self;
      v19 = 2114;
      v20 = v4;
      v21 = 2114;
      v22 = v7;
      v23 = 2048;
      v24 = v6;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1B0C75000, v8, OS_LOG_TYPE_INFO, "%p performFrameSpecifiersRequest:%{public}@ alwaysOnSession:%{public}@ environment:<%p %{public}@>", buf, 0x34u);

    }
    objc_msgSend(v6, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && v7)
    {
      objc_msgSend(v4, "dateInterval");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__BLSBacklightSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke;
      v14[3] = &unk_1E621A4E8;
      v15 = v7;
      v16 = v4;
      objc_msgSend(v12, "environment:timelinesForDateInterval:previousSpecifier:completion:", v6, v11, 0, v14);

    }
    else
    {
      objc_msgSend(v4, "completeWithDateSpecifiers:", MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    bls_environment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = self;
      _os_log_impl(&dword_1B0C75000, v13, OS_LOG_TYPE_DEFAULT, "%p: performFrameSpecifiersRequest: environment is nil", buf, 0xCu);
    }

    objc_msgSend(v4, "completeWithDateSpecifiers:", MEMORY[0x1E0C9AA60]);
  }

}

uint64_t __69__BLSBacklightSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performFrameSpecifiersRequest:timelines:", *(_QWORD *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
}

- (void)updatedEnvironmentWithDelta:(uint64_t)a3 backlightSceneUpdate:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "%p: updatedEnvironmentWithDelta: environment is nil", a5, a6, a7, a8, 0);
}

- (void)performDesiredFidelityRequest:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "%p: performDesiredFidelityRequest: environment is nil", a5, a6, a7, a8, 0);
}

@end
