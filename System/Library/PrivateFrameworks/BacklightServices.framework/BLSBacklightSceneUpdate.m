@implementation BLSBacklightSceneUpdate

- (id)initForEnvironment:(id)a3 visualState:(id)a4 previousVisualState:(id)a5 frameSpecifier:(id)a6 animated:(BOOL)a7 triggerEvent:(id)a8 touchTargetable:(BOOL)a9 isUpdateToDateSpecifier:(BOOL)a10 sceneContentsUpdated:(id)a11 performBacklightRamp:(id)a12 sceneContentsAnimationComplete:(id)a13
{
  _BOOL8 v14;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BLSBacklightSceneUpdate *v25;
  BLSBacklightSceneUpdate *v26;
  BLSBacklightSceneUpdateContext *v27;
  BLSBacklightSceneUpdateContext *context;
  uint64_t v29;
  id sceneContentsUpdatedBlock;
  uint64_t v31;
  id performBacklightRampBlock;
  uint64_t v33;
  id sceneContentsAnimationCompleteBlock;
  id v36;
  id obj;
  objc_super v38;

  v14 = a7;
  obj = a3;
  v36 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v38.receiver = self;
  v38.super_class = (Class)BLSBacklightSceneUpdate;
  v25 = -[BLSBacklightSceneUpdate init](&v38, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v25->_environment, obj);
    v27 = -[BLSBacklightSceneUpdateContext initWithVisualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:]([BLSBacklightSceneUpdateContext alloc], "initWithVisualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:", v36, v19, v20, v14, v21, a9);
    context = v26->_context;
    v26->_context = v27;

    v26->_isUpdateToDateSpecifier = a10;
    v29 = MEMORY[0x1B5E0F100](v22);
    sceneContentsUpdatedBlock = v26->_sceneContentsUpdatedBlock;
    v26->_sceneContentsUpdatedBlock = (id)v29;

    v31 = MEMORY[0x1B5E0F100](v23);
    performBacklightRampBlock = v26->_performBacklightRampBlock;
    v26->_performBacklightRampBlock = (id)v31;

    v33 = MEMORY[0x1B5E0F100](v24);
    sceneContentsAnimationCompleteBlock = v26->_sceneContentsAnimationCompleteBlock;
    v26->_sceneContentsAnimationCompleteBlock = (id)v33;

  }
  return v26;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BLSBacklightSceneUpdate *v11;
  id v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __38__BLSBacklightSceneUpdate_description__block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __38__BLSBacklightSceneUpdate_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUInt64:withName:format:", *(_QWORD *)(a1 + 32), 0, 1);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(WeakRetained, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", WeakRetained, v4);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  if (*(_BYTE *)(v6 + 39))
  {
    v8 = CFSTR("flipbook");
  }
  else if (objc_msgSend(*(id *)(v6 + 40), "isAnimated"))
  {
    v8 = CFSTR("animated");
  }
  else
  {
    v8 = CFSTR("snap");
  }
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "previousVisualState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bls_shortLoggingString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "appendObject:withName:", v12, 0);

  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "visualState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bls_shortLoggingString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v14, "appendObject:withName:", v16, CFSTR("->"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "triggerEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = *(void **)(a1 + 40);
    objc_msgSend(v18, "bls_shortLoggingString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v20, "appendObject:withName:", v21, 0);

  }
}

- (id)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSBacklightSceneUpdateContext visualState](self->_context, "visualState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("new"));

  -[BLSBacklightSceneUpdateContext previousVisualState](self->_context, "previousVisualState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("previous"));

  -[BLSBacklightSceneUpdateContext frameSpecifier](self->_context, "frameSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v9, CFSTR("specifier"), 1);

  v11 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLSBacklightSceneUpdateContext isAnimated](self->_context, "isAnimated"), CFSTR("animated"));
  -[BLSBacklightSceneUpdateContext triggerEvent](self->_context, "triggerEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v12, CFSTR("trigger"), 1);

  v14 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isUpdateToDateSpecifier, CFSTR("isUpdateToDateSpecifier"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_sceneContentsUpdated, CFSTR("sceneContentsUpdated"));
  v16 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_didStartBacklightRamp, CFSTR("didStartBacklightRamp"));
  v17 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_animationComplete, CFSTR("animationComplete"));
  v18 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_performBacklightRampBlock != 0, CFSTR("backlightRampNonNil"), 1);
  v19 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_sceneContentsAnimationCompleteBlock != 0, CFSTR("animationCompletionNonNil"), 1);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)hash
{
  return -[BLSBacklightSceneUpdateContext hash](self->_context, "hash");
}

- (BOOL)isEqual:(id)a3
{
  return -[BLSBacklightSceneUpdateContext isEqual:](self->_context, "isEqual:", a3);
}

- (void)setReplacedSceneUpdate:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id sceneContentsUpdatedBlock;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  id performBacklightRampBlock;
  void *v16;
  id v17;
  void *v18;
  id sceneContentsAnimationCompleteBlock;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_msgSend(v4, "areSceneContentsUpdated");
  v6 = MEMORY[0x1E0C809B0];
  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1B5E0F100](self->_sceneContentsUpdatedBlock);
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke;
    v27[3] = &unk_1E621A660;
    v28 = v4;
    v29 = v7;
    v8 = v7;
    v9 = (void *)MEMORY[0x1B5E0F100](v27);
    sceneContentsUpdatedBlock = self->_sceneContentsUpdatedBlock;
    self->_sceneContentsUpdatedBlock = v9;

  }
  if ((objc_msgSend(v4, "didStartBacklightRamp") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1B5E0F100](self->_performBacklightRampBlock);
    v12 = -[BLSBacklightSceneUpdateContext isAnimated](self->_context, "isAnimated");
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_2;
    v23[3] = &unk_1E621A858;
    v26 = v12;
    v24 = v4;
    v25 = v11;
    v13 = v11;
    v14 = (void *)MEMORY[0x1B5E0F100](v23);
    performBacklightRampBlock = self->_performBacklightRampBlock;
    self->_performBacklightRampBlock = v14;

  }
  if ((objc_msgSend(v4, "isAnimationComplete") & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1B5E0F100](self->_sceneContentsAnimationCompleteBlock);
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_3;
    v20[3] = &unk_1E621A660;
    v21 = v4;
    v22 = v16;
    v17 = v16;
    v18 = (void *)MEMORY[0x1B5E0F100](v20);
    sceneContentsAnimationCompleteBlock = self->_sceneContentsAnimationCompleteBlock;
    self->_sceneContentsAnimationCompleteBlock = v18;

  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sceneContentsDidUpdate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_2(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  uint64_t result;

  v4 = *(void **)(a1 + 32);
  v5 = 0.5;
  if (!*(_BYTE *)(a1 + 48))
    v5 = 0.0;
  objc_msgSend(v4, "performBacklightRampWithDuration:", v5);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(a2);
  return result;
}

uint64_t __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "sceneContentsAnimationDidComplete");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)areSceneContentsUpdated
{
  BLSBacklightSceneUpdate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_sceneContentsUpdated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)sceneContentsDidUpdate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0(&dword_1B0C75000, v0, v1, "%p sceneContentsDidUpdate should only be called once for update:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (BOOL)didStartBacklightRamp
{
  BLSBacklightSceneUpdate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_didStartBacklightRamp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)performBacklightRampWithDuration:(double)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_didStartBacklightRamp;
  void (**v7)(_QWORD, double);
  id performBacklightRampBlock;
  NSObject *v9;
  _BOOL4 v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_didStartBacklightRamp = self->_lock_didStartBacklightRamp;
  self->_lock_didStartBacklightRamp = 1;
  v7 = (void (**)(_QWORD, double))MEMORY[0x1B5E0F100](self->_performBacklightRampBlock);
  performBacklightRampBlock = self->_performBacklightRampBlock;
  self->_performBacklightRampBlock = 0;

  os_unfair_lock_unlock(p_lock);
  if (lock_didStartBacklightRamp)
  {
    bls_scenes_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BLSBacklightSceneUpdate performBacklightRampWithDuration:].cold.3();
LABEL_4:

    goto LABEL_9;
  }
  bls_scenes_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (!v7)
  {
    if (v10)
      -[BLSBacklightSceneUpdate performBacklightRampWithDuration:].cold.1();
    goto LABEL_4;
  }
  if (v10)
    -[BLSBacklightSceneUpdate performBacklightRampWithDuration:].cold.2();

  v7[2](v7, a3);
LABEL_9:

}

- (BOOL)isAnimationComplete
{
  BLSBacklightSceneUpdate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_animationComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)sceneContentsAnimationDidComplete
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_ERROR, "sceneContentsAnimationDidComplete should only be called once for update:%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (BLSBacklightSceneUpdateContext)context
{
  return self->_context;
}

- (BOOL)isUpdateToDateSpecifier
{
  return self->_isUpdateToDateSpecifier;
}

- (BLSBacklightSceneEnvironment_Private)environment
{
  return (BLSBacklightSceneEnvironment_Private *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_sceneContentsAnimationCompleteBlock, 0);
  objc_storeStrong(&self->_performBacklightRampBlock, 0);
  objc_storeStrong(&self->_sceneContentsUpdatedBlock, 0);
}

- (void)performBacklightRampWithDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1(&dword_1B0C75000, v0, v1, "%p ignoring performBacklightRampWithDuration:%lf for update:%@", v2, v3, v4, v5, v6);
}

- (void)performBacklightRampWithDuration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1(&dword_1B0C75000, v0, v1, "%p performBacklightRampWithDuration:%lf for update:%@", v2, v3, v4, v5, v6);
}

- (void)performBacklightRampWithDuration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0(&dword_1B0C75000, v0, v1, "%p performBacklightRampWithDuration should only be called once for update:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
