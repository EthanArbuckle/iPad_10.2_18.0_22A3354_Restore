@implementation BLSBacklightFBSSceneEnvironment

- (BLSBacklightSceneEnvironmentDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  BLSBacklightSceneEnvironmentDelegate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BLSBacklightFBSSceneEnvironment)initWithFBSScene:(id)a3
{
  id v4;
  BLSBacklightFBSSceneEnvironment *v5;
  BLSBacklightFBSSceneEnvironment *v6;
  NSObject *v7;
  BLSBacklightSceneEnvironmentUpdater *v8;
  BLSBacklightSceneEnvironmentUpdating *updater;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSBacklightFBSSceneEnvironment;
  v5 = -[BLSBacklightFBSSceneEnvironment init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    bls_scenes_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BLSBacklightFBSSceneEnvironment initWithFBSScene:].cold.1((uint64_t)v6, v4);

    v8 = -[BLSBacklightSceneEnvironmentUpdater initWithEnvironment:]([BLSBacklightSceneEnvironmentUpdater alloc], "initWithEnvironment:", v6);
    updater = v6->_updater;
    v6->_updater = (BLSBacklightSceneEnvironmentUpdating *)v8;

    -[BLSBacklightFBSSceneEnvironment _setFBSScene:](v6, "_setFBSScene:", v4);
  }

  return v6;
}

- (void)_setFBSScene:(id)a3
{
  objc_storeWeak((id *)&self->_fbsScene, a3);
}

- (void)setDelegate:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  BOOL v12;
  uint8_t buf[4];
  BLSBacklightFBSSceneEnvironment *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_delegate, a3);
  os_unfair_lock_unlock(&self->_lock);
  bls_scenes_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("NULL");
    }
    -[BLSBacklightFBSSceneEnvironment identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v14 = self;
    v15 = 2048;
    v16 = v5;
    v17 = 2114;
    v18 = v8;
    v19 = 1024;
    v20 = v5 != 0;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1B0C75000, v6, OS_LOG_TYPE_DEFAULT, "%p setDelegate:<%p %{public}@> hasDelegate:%{BOOL}u for environment:%{public}@", buf, 0x30u);
    if (v5)

  }
  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__BLSBacklightFBSSceneEnvironment_setDelegate___block_invoke;
  v11[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v12 = v5 != 0;
  objc_msgSend(v10, "updateClientSettingsWithBlock:", v11);

}

- (void)setSupportsAlwaysOn:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  BOOL v8;

  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BLSBacklightFBSSceneEnvironment setSupportsAlwaysOn:].cold.1(self, a3, v5);

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__BLSBacklightFBSSceneEnvironment_setSupportsAlwaysOn___block_invoke;
  v7[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v8 = a3;
  objc_msgSend(v6, "updateClientSettingsWithBlock:", v7);

}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FBSScene)_FBSScene
{
  return (FBSScene *)objc_loadWeakRetained((id *)&self->_fbsScene);
}

uint64_t __55__BLSBacklightFBSSceneEnvironment_setSupportsAlwaysOn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setSupportsAlwaysOn:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __47__BLSBacklightFBSSceneEnvironment_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setHasDelegate:", *(unsigned __int8 *)(a1 + 32));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSBacklightFBSSceneEnvironment identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("identifier"));

  v8 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v4, "bls_isDelegateActive"), CFSTR("active"));
  v9 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[BLSBacklightFBSSceneEnvironment isAnimatingVisualState](self, "isAnimatingVisualState"), CFSTR("animatingVisualState"), 1);
  v10 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v4, "bls_isLiveUpdating"), CFSTR("liveUpdating"));
  v11 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v4, "bls_hasUnrestrictedFramerateUpdates"), CFSTR("unrestrictedFramerate"));
  if ((objc_msgSend(v5, "bls_supportsAlwaysOn") & 1) != 0)
  {
    v12 = objc_msgSend(v4, "bls_isAlwaysOnEnabledForEnvironment");
    v13 = CFSTR("aoEnabled");
    v14 = v6;
  }
  else
  {
    v13 = CFSTR("aoSupport");
    v14 = v6;
    v12 = 0;
  }
  v15 = (id)objc_msgSend(v14, "appendBool:withName:", v12, v13);
  objc_msgSend(v4, "bls_visualState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v6, "appendObject:withName:", v16, CFSTR("visualState"));

  objc_msgSend(v4, "bls_presentationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bls_shortLoggingString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v19, CFSTR("presentationDate"), 0);

  -[BLSBacklightFBSSceneEnvironment frameSpecifierForSettings:](self, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v21, CFSTR("frameSpecifier"), 1);

  v23 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[BLSBacklightFBSSceneEnvironment optsOutOfProcessAssertions](self, "optsOutOfProcessAssertions"), CFSTR("optsOutOfProcessAssertions"), 1);
  objc_msgSend(v6, "build");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (id)frameSpecifierForSettings:(id)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "bls_presentationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alwaysOnSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specifierForPresentationDate:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BLSBacklightSceneEnvironmentUpdating)updater
{
  os_unfair_lock_s *p_lock;
  BLSBacklightSceneEnvironmentUpdating *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_updater;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUpdater:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_updater, a3);
  os_unfair_lock_unlock(&self->_lock);
  bls_scenes_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BLSBacklightFBSSceneEnvironment setUpdater:].cold.1((uint64_t)self, (uint64_t)v5, v6);

}

- (BOOL)isDelegateActive
{
  void *v2;
  void *v3;
  char v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isDelegateActive");

  return v4;
}

- (BOOL)isDisplayBlanked
{
  void *v2;
  void *v3;
  char v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isBlanked");

  return v4;
}

- (BLSBacklightSceneVisualState)visualState
{
  void *v2;
  void *v3;
  void *v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_visualState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLSBacklightSceneVisualState *)v4;
}

- (NSDate)presentationDate
{
  void *v2;
  void *v3;
  void *v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_presentationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BLSAlwaysOnFrameSpecifier)frameSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSBacklightFBSSceneEnvironment frameSpecifierForSettings:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLSAlwaysOnFrameSpecifier *)v5;
}

- (BOOL)isLiveUpdating
{
  void *v2;
  void *v3;
  char v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isLiveUpdating");

  return v4;
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  void *v2;
  void *v3;
  char v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_hasUnrestrictedFramerateUpdates");

  return v4;
}

- (BOOL)supportsAlwaysOn
{
  void *v2;
  void *v3;
  char v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_supportsAlwaysOn");

  return v4;
}

- (BOOL)optsOutOfProcessAssertions
{
  void *v2;
  void *v3;
  char v4;

  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_optsOutOfProcessAssertions");

  return v4;
}

- (void)setOptsOutOfProcessAssertions:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;
  uint8_t buf[4];
  BLSBacklightFBSSceneEnvironment *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[BLSBacklightFBSSceneEnvironment identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 1024;
    v13 = v3;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_INFO, "%p setOptsOutOfProcessAssertions:%{BOOL}u for environment:%{public}@", buf, 0x1Cu);

  }
  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__BLSBacklightFBSSceneEnvironment_setOptsOutOfProcessAssertions___block_invoke;
  v8[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v9 = v3;
  objc_msgSend(v7, "updateClientSettingsWithBlock:", v8);

}

uint64_t __65__BLSBacklightFBSSceneEnvironment_setOptsOutOfProcessAssertions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setOptsOutOfProcessAssertions:", *(unsigned __int8 *)(a1 + 32));
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  BLSInvalidateFrameSpecifiersAction *v6;
  void *v7;
  void *v8;

  v4 = a3;
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BLSBacklightFBSSceneEnvironment invalidateAllTimelinesForReason:].cold.1(self);

  v6 = -[BLSInvalidateFrameSpecifiersAction initWithReason:]([BLSInvalidateFrameSpecifiersAction alloc], "initWithReason:", v4);
  -[BLSBacklightFBSSceneEnvironment _FBSScene](self, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActions:", v8);

}

- (BLSAlwaysOnSession)alwaysOnSession
{
  return (BLSAlwaysOnSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAlwaysOnSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isAnimatingVisualState
{
  return self->_animatingVisualState;
}

- (void)setAnimatingVisualState:(BOOL)a3
{
  self->_animatingVisualState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fbsScene);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_alwaysOnSession, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithFBSScene:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_0(&dword_1B0C75000, v3, v4, "%p create environment:%@ for scene:%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_2();
}

- (void)setUpdater:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1B0C75000, log, OS_LOG_TYPE_DEBUG, "%p setUpdater: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)setSupportsAlwaysOn:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  int v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2 & 1;
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 1024;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_DEBUG, "%p setSupportsAlwaysOn:%{BOOL}u for environment:%{public}@", (uint8_t *)&v7, 0x1Cu);

  OUTLINED_FUNCTION_0_2();
}

- (void)invalidateAllTimelinesForReason:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_0(&dword_1B0C75000, v2, v3, "%p invalidateAllTimelinesForReason:%{public}@ for environment:%{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_2();
}

@end
