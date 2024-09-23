@implementation FigStateMachine

- (FigStateMachine)initWithLabel:(id)a3 stateCount:(char)a4 initialState:(unsigned int)a5 owner:(id)a6
{
  unsigned int v8;
  FigStateMachine *v10;
  FigStateMachine *v11;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FigStateMachine;
  v10 = -[FigStateMachine init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_owner = a6;
    v10->_label = (NSString *)objc_msgSend(a3, "copy");
    v11->_currentState = a5;
    v11->_stateCount = v8;
    if (v8 < 0x21)
    {
      v11->_stateConfigurations = (FigStateMachineStateConfiguration *)malloc_type_calloc(v8, 0x20uLL, 0x10800400F6048E3uLL);
      v11->_lock._os_unfair_lock_opaque = 0;
      v11->_performsAtomicStateTransitions = 1;
    }
    else
    {

      return 0;
    }
  }
  return v11;
}

- (void)markStateAsTerminal:(unsigned int)a3
{
  FigStateMachineStateConfiguration *stateConfigurations;
  unsigned int v4;
  int v5;

  stateConfigurations = self->_stateConfigurations;
  v4 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0)
    v5 = v4;
  else
    v5 = -1;
  if (a3 != 0 && (a3 & (a3 - 1)) == 0 && v5 < self->_stateCount && stateConfigurations != 0)
    stateConfigurations[v5].var0 = 1;
}

- (void)whenTransitioningFromState:(unsigned int)a3 toState:(unsigned int)a4 callHandler:(id)a5
{
  _QWORD v5[5];
  unsigned int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__FigStateMachine_whenTransitioningFromState_toState_callHandler___block_invoke;
  v5[3] = &unk_1E4926BF8;
  v6 = a3;
  v5[4] = a5;
  -[FigStateMachine whenTransitioningToState:callHandler:](self, "whenTransitioningToState:callHandler:", *(_QWORD *)&a4, v5);
}

- (void)whenTransitioningToStates:(unsigned int)a3 callHandler:(id)a4
{
  int stateCount;
  int i;
  id v9;

  v9 = (id)objc_msgSend(a4, "copy");
  stateCount = self->_stateCount;
  if (stateCount >= 1)
  {
    for (i = 0; i != stateCount; ++i)
    {
      if (((1 << i) & a3) != 0)
        -[FigStateMachine whenTransitioningToState:callHandler:](self, "whenTransitioningToState:callHandler:", (1 << i) & a3, a4);
    }
  }

}

- (void)whenTransitioningToStateFails:(unsigned int)a3 callHandler:(id)a4
{
  FigStateMachineStateConfiguration *stateConfigurations;
  unsigned int v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  FigStateMachineStateConfiguration *v11;
  void *v12;
  id *p_var2;
  id var2;
  id v15;

  stateConfigurations = self->_stateConfigurations;
  v5 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0)
    v6 = v5;
  else
    v6 = 0xFFFFFFFFLL;
  if (a3 != 0 && (a3 & (a3 - 1)) == 0 && (int)v6 < self->_stateCount && stateConfigurations != 0)
  {
    v9 = objc_msgSend(a4, "copy");
    if (v9)
    {
      v10 = (id)v9;
      v11 = &stateConfigurations[v6];
      var2 = v11->var2;
      p_var2 = &v11->var2;
      v12 = var2;
      v15 = v10;
      if (!var2)
      {
        v12 = (void *)objc_opt_new();
        v10 = v15;
        *p_var2 = v12;
      }
      objc_msgSend(v12, "addObject:", v10);

    }
  }
}

- (void)whenTransitioningToState:(unsigned int)a3 callHandler:(id)a4
{
  FigStateMachineStateConfiguration *stateConfigurations;
  unsigned int v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  FigStateMachineStateConfiguration *v11;
  void *v12;
  id *p_var1;
  id var1;
  id v15;

  stateConfigurations = self->_stateConfigurations;
  v5 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0)
    v6 = v5;
  else
    v6 = 0xFFFFFFFFLL;
  if (a3 != 0 && (a3 & (a3 - 1)) == 0 && (int)v6 < self->_stateCount && stateConfigurations != 0)
  {
    v9 = objc_msgSend(a4, "copy");
    if (v9)
    {
      v10 = (id)v9;
      v11 = &stateConfigurations[v6];
      var1 = v11->var1;
      p_var1 = &v11->var1;
      v12 = var1;
      v15 = v10;
      if (!var1)
      {
        v12 = (void *)objc_opt_new();
        v10 = v15;
        *p_var1 = v12;
      }
      objc_msgSend(v12, "addObject:", v10);

    }
  }
}

- (void)setLabel:(id)a3 forState:(unsigned int)a4
{
  unsigned int v4;
  uint64_t v5;
  FigStateMachineStateConfiguration *v6;
  id var3;

  v4 = __clz(__rbit32(a4));
  if (a4 != 0 && (a4 & (a4 - 1)) == 0)
    v5 = v4;
  else
    v5 = 0xFFFFFFFFLL;
  if (a4 != 0 && (a4 & (a4 - 1)) == 0 && (int)v5 < self->_stateCount)
    v6 = &self->_stateConfigurations[v5];
  else
    v6 = 0;
  var3 = v6->var3;
  if (var3 != a3)
  {

    v6->var3 = (id)objc_msgSend(a3, "copy");
  }
}

- (void)setPerformsAtomicStateTransitions:(BOOL)a3
{
  self->_performsAtomicStateTransitions = a3;
}

- (void)whenTransitioningToStatesFail:(unsigned int)a3 callHandler:(id)a4
{
  int stateCount;
  int i;
  id v9;

  v9 = (id)objc_msgSend(a4, "copy");
  stateCount = self->_stateCount;
  if (stateCount >= 1)
  {
    for (i = 0; i != stateCount; ++i)
    {
      if (((1 << i) & a3) != 0)
        -[FigStateMachine whenTransitioningToStateFails:callHandler:](self, "whenTransitioningToStateFails:callHandler:", (1 << i) & a3, a4);
    }
  }

}

- (unsigned)currentState
{
  os_unfair_lock_s *p_lock;
  unsigned int currentState;

  if (!self->_performsAtomicStateTransitions)
    return self->_currentState;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentState = self->_currentState;
  os_unfair_lock_unlock(p_lock);
  return currentState;
}

- (BOOL)transitionToState:(unsigned int)a3
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, 0);
}

- (uint64_t)_transitionToState:(uint64_t)a1 fromStates:(unsigned int)a2 errorStatus:(int)a3
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  int8x8_t v12;
  BOOL v13;
  _BYTE *v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = *(unsigned __int8 *)(a1 + 20);
  if (*(_BYTE *)(a1 + 20))
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v7 = *(_DWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(char *)(a1 + 40);
  LODWORD(v10) = __clz(__rbit32(v7));
  v11 = a2 != 0;
  v12 = vbic_s8((int8x8_t)vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v7, a2), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v7, a2), (int32x2_t)-1))), (int8x8_t)vceqz_s32((int32x2_t)__PAIR64__(v7, a2)));
  if (((v7 != 0) & v12.i8[4]) != 0)
    v10 = v10;
  else
    v10 = 0xFFFFFFFFLL;
  v13 = (int)v10 < v9;
  v14 = (_BYTE *)(v8 + 32 * v10);
  if (((v7 != 0) & v12.i8[4] & v13) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = __clz(__rbit32(a2));
  v17 = v11 & v12.i8[0];
  if ((v11 & v12.i32[0]) != 0)
    v18 = v16;
  else
    v18 = 0xFFFFFFFFLL;
  v19 = v8 + 32 * v18;
  if ((v17 & ((int)v18 < v9)) == 0)
    v19 = 0;
  if (v15)
    v20 = v19 == 0;
  else
    v20 = 1;
  if (v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (v7 != a2 && (!a3 || (v7 & a3) != 0) && !*v15)
    {
      *(_DWORD *)(a1 + 24) = a2;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v28 = *(void **)(v19 + 8);
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v28);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i) + 16))();
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v30);
      }
      v26 = 1;
      if (v6)
        goto LABEL_31;
      return v26;
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = *(void **)(v19 + 16);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j) + 16))();
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v23);
    }
  }
  v26 = 0;
  if (v6)
LABEL_31:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  return v26;
}

- (BOOL)transitionToState:(unsigned int)a3 fromState:(unsigned int)a4
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, a4);
}

uint64_t __66__FigStateMachine_whenTransitioningFromState_toState_callHandler___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (*(_DWORD *)(result + 40) == a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

+ (int)indexForState:(unsigned int)a3
{
  BOOL v3;
  int v4;

  v3 = (a3 & (a3 - 1)) != 0 || a3 == 0;
  v4 = __clz(__rbit32(a3));
  if (v3)
    return -1;
  else
    return v4;
}

- (void)dealloc
{
  FigStateMachineStateConfiguration *stateConfigurations;
  unint64_t v4;
  uint64_t v5;
  objc_super v6;

  stateConfigurations = self->_stateConfigurations;
  if (stateConfigurations)
  {
    if (self->_stateCount >= 1)
    {
      v4 = 0;
      v5 = 32 * self->_stateCount;
      do
      {

        v4 += 32;
      }
      while (v5 != v4);
      stateConfigurations = self->_stateConfigurations;
    }
    free(stateConfigurations);
  }

  v6.receiver = self;
  v6.super_class = (Class)FigStateMachine;
  -[FigStateMachine dealloc](&v6, sel_dealloc);
}

- (BOOL)transitionToState:(unsigned int)a3 errorStatus:(int)a4
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, 0);
}

- (BOOL)transitionToState:(unsigned int)a3 fromStates:(unsigned int)a4
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, a4);
}

- (NSString)label
{
  return self->_label;
}

- (id)labelForState:(unsigned int)a3
{
  FigStateMachineStateConfiguration *stateConfigurations;
  unsigned int v4;
  uint64_t v5;

  stateConfigurations = self->_stateConfigurations;
  v4 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0)
    v5 = v4;
  else
    v5 = 0xFFFFFFFFLL;
  if (a3 == 0 || (a3 & (a3 - 1)) != 0 || (int)v5 >= self->_stateCount || stateConfigurations == 0)
    return 0;
  else
    return stateConfigurations[v5].var3;
}

- (NSString)currentStateLabel
{
  return (NSString *)-[FigStateMachine labelForState:](self, "labelForState:", -[FigStateMachine currentState](self, "currentState"));
}

- (id)description
{
  void *v3;
  NSString *label;
  objc_class *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  label = self->_label;
  if (!label)
  {
    v5 = (objc_class *)objc_opt_class();
    label = NSStringFromClass(v5);
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), label, self);
}

- (BOOL)performsAtomicStateTransitions
{
  return self->_performsAtomicStateTransitions;
}

@end
