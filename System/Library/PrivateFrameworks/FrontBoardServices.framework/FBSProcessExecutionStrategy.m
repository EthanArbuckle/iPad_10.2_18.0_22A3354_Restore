@implementation FBSProcessExecutionStrategy

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __CanTakeWorkspaceAssertions = BSSelfTaskHasEntitlement();
    __CanTakeSystemAppAssertions = BSSelfTaskHasEntitlement();
  }
}

+ (id)userInteractive
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FBSProcessExecutionStrategy_userInteractive__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userInteractive_onceToken != -1)
    dispatch_once(&userInteractive_onceToken, block);
  return (id)userInteractive___UIPolicy;
}

uint64_t __46__FBSProcessExecutionStrategy_userInteractive__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "strategyForSchedulingPolicy:graphicsPolicy:jetsamPolicy:", 2, 1, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)userInteractive___UIPolicy;
  userInteractive___UIPolicy = v1;

  return objc_msgSend((id)userInteractive___UIPolicy, "setStrategyName:", CFSTR("UserInteractive"));
}

+ (id)userInteractiveWithoutUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FBSProcessExecutionStrategy_userInteractiveWithoutUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userInteractiveWithoutUI_onceToken != -1)
    dispatch_once(&userInteractiveWithoutUI_onceToken, block);
  return (id)userInteractiveWithoutUI___UINoGPUPolicy;
}

uint64_t __55__FBSProcessExecutionStrategy_userInteractiveWithoutUI__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "strategyForSchedulingPolicy:graphicsPolicy:jetsamPolicy:", 2, 0, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)userInteractiveWithoutUI___UINoGPUPolicy;
  userInteractiveWithoutUI___UINoGPUPolicy = v1;

  return objc_msgSend((id)userInteractiveWithoutUI___UINoGPUPolicy, "setStrategyName:", CFSTR("UserInteractiveWithoutUI"));
}

+ (id)backgroundWithUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSProcessExecutionStrategy_backgroundWithUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (backgroundWithUI_onceToken != -1)
    dispatch_once(&backgroundWithUI_onceToken, block);
  return (id)backgroundWithUI___BGUIPolicy;
}

uint64_t __47__FBSProcessExecutionStrategy_backgroundWithUI__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "strategyForSchedulingPolicy:graphicsPolicy:jetsamPolicy:", 1, 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)backgroundWithUI___BGUIPolicy;
  backgroundWithUI___BGUIPolicy = v1;

  return objc_msgSend((id)backgroundWithUI___BGUIPolicy, "setStrategyName:", CFSTR("BackgroundWithUI"));
}

+ (id)background
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FBSProcessExecutionStrategy_background__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (background_onceToken != -1)
    dispatch_once(&background_onceToken, block);
  return (id)background___BGPolicy;
}

uint64_t __41__FBSProcessExecutionStrategy_background__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "strategyForSchedulingPolicy:graphicsPolicy:jetsamPolicy:", 1, 0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)background___BGPolicy;
  background___BGPolicy = v1;

  return objc_msgSend((id)background___BGPolicy, "setStrategyName:", CFSTR("Background"));
}

+ (id)strategyForSchedulingPolicy:(int64_t)a3 graphicsPolicy:(int64_t)a4 jetsamPolicy:(int64_t)a5
{
  id v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setSchedulingPolicy:", a3);
  objc_msgSend(v8, "setGraphicsPolicy:", a4);
  objc_msgSend(v8, "setJetsamPolicy:", a5);
  if (a3 < 1)
  {
    v12 = 0;
  }
  else
  {
    if (a5 == 1)
    {
      v9 = __CanTakeWorkspaceAssertions == 0;
      v10 = 10000;
      v11 = 9;
    }
    else
    {
      v9 = __CanTakeSystemAppAssertions == 0;
      v10 = 10004;
      v11 = 4;
    }
    if (v9)
      v12 = v11;
    else
      v12 = v10;
  }
  v13 = a3 > 0;
  if (a3 > 1)
    v13 |= 2u;
  if (a4 > 0)
    v13 |= 0x20u;
  if (a5 <= 0)
    v14 = v13;
  else
    v14 = v13 | 8;
  objc_msgSend(v8, "setReason:", v12);
  objc_msgSend(v8, "setFlags:", v14);
  objc_msgSend(v8, "setCustomPolicy:", 0);
  return v8;
}

+ (id)policyWithReason:(unsigned int)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setFlags:", v4);
  objc_msgSend(v6, "setReason:", v5);
  objc_msgSend(v6, "setCustomPolicy:", 1);
  return v6;
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSProcessExecutionStrategy descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessExecutionStrategy succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  const __CFString *strategyName;
  id v6;
  unint64_t schedulingPolicy;
  const __CFString *v8;
  id v9;
  int64_t graphicsPolicy;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  int64_t jetsamPolicy;
  const __CFString *v15;
  const __CFString *v16;
  id v17;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_strategyName)
    strategyName = (const __CFString *)self->_strategyName;
  else
    strategyName = CFSTR("Custom");
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", strategyName, CFSTR("strategyName"));
  if (!-[FBSProcessExecutionStrategy isCustomPolicy](self, "isCustomPolicy"))
  {
    schedulingPolicy = self->_schedulingPolicy;
    v8 = CFSTR("(unknown)");
    if (schedulingPolicy <= 2)
      v8 = off_1E38ECDB8[schedulingPolicy];
    v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("scheduling"));
    graphicsPolicy = self->_graphicsPolicy;
    v11 = CFSTR("full");
    if (graphicsPolicy != 1)
      v11 = CFSTR("(unknown)");
    if (graphicsPolicy)
      v12 = v11;
    else
      v12 = CFSTR("none");
    v13 = (id)objc_msgSend(v4, "appendObject:withName:", v12, CFSTR("graphics"));
    jetsamPolicy = self->_jetsamPolicy;
    v15 = CFSTR("foreground");
    if (jetsamPolicy != 1)
      v15 = CFSTR("(unknown)");
    if (jetsamPolicy)
      v16 = v15;
    else
      v16 = CFSTR("default");
    v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("jetsam"));
  }
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessExecutionStrategy descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[FBSProcessExecutionStrategy succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__FBSProcessExecutionStrategy_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E38EAE08;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __69__FBSProcessExecutionStrategy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12);
  if ((int)v2 > 9999)
  {
    if ((_DWORD)v2 == 10000)
    {
      v3 = CFSTR("resume");
      goto LABEL_11;
    }
    if ((_DWORD)v2 == 10004)
    {
      v3 = CFSTR("finishTaskUnbounded");
      goto LABEL_11;
    }
LABEL_8:
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInt:withName:", v2, CFSTR("bksReason"));
    goto LABEL_12;
  }
  if ((_DWORD)v2 == 4)
  {
    v3 = CFSTR("finishTask");
    goto LABEL_11;
  }
  if ((_DWORD)v2 != 9)
    goto LABEL_8;
  v3 = CFSTR("viewService");
LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v3, CFSTR("bksReason"));
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v9, "addObject:", CFSTR("preventTaskSuspend"));
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if ((v5 & 2) == 0)
    {
LABEL_14:
      if ((v5 & 4) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v9, "addObject:", CFSTR("preventTaskThrottleDown"));
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0)
      goto LABEL_16;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v9, "addObject:", CFSTR("allowIdleSleep"));
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 0x10) == 0)
      goto LABEL_17;
LABEL_24:
    objc_msgSend(v9, "addObject:", CFSTR("allowSuspendOnSleep"));
    if ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_23:
  objc_msgSend(v9, "addObject:", CFSTR("foregroundResourcePriority"));
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v5 & 0x10) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v5 & 0x20) != 0)
LABEL_18:
    objc_msgSend(v9, "addObject:", CFSTR("preventThrottleDownUI"));
LABEL_19:
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bksFlags (%u)"), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:skipIfEmpty:", v7, v8, 1);

}

- (NSString)strategyName
{
  return self->_strategyName;
}

- (void)setStrategyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)schedulingPolicy
{
  return self->_schedulingPolicy;
}

- (void)setSchedulingPolicy:(int64_t)a3
{
  self->_schedulingPolicy = a3;
}

- (int64_t)graphicsPolicy
{
  return self->_graphicsPolicy;
}

- (void)setGraphicsPolicy:(int64_t)a3
{
  self->_graphicsPolicy = a3;
}

- (int64_t)jetsamPolicy
{
  return self->_jetsamPolicy;
}

- (void)setJetsamPolicy:(int64_t)a3
{
  self->_jetsamPolicy = a3;
}

- (BOOL)isCustomPolicy
{
  return self->_customPolicy;
}

- (void)setCustomPolicy:(BOOL)a3
{
  self->_customPolicy = a3;
}

- (unsigned)reason
{
  return self->_bksReason;
}

- (void)setReason:(unsigned int)a3
{
  self->_bksReason = a3;
}

- (unsigned)flags
{
  return self->_bksFlags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_bksFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategyName, 0);
}

@end
