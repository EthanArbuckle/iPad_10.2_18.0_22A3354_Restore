@implementation _GKStateMachine

- (void)setValidTransitions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setShouldLogStateTransitions:(BOOL)a3
{
  self->_shouldLogStateTransitions = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_performTransitionFromState:(id)a3 toState:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _GKStateMachine *v12;
  _GKStateMachine *v13;
  NSString *v14;
  const char *v15;
  NSString *v16;
  const char *v17;
  __CFString *v18;
  __CFString *v19;
  NSString *v20;
  const char *v21;
  uint8_t buf[4];
  _GKStateMachine *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (-[_GKStateMachine shouldLogStateTransitions](self, "shouldLogStateTransitions"))
  {
    v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v9 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v23 = self;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "  ➤➤➤ %@ state change from %@ to %@", buf, 0x20u);
    }
  }
  -[_GKStateMachine delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (_GKStateMachine *)v10;
  else
    v12 = self;
  v13 = v12;

  if (v6)
  {
    objc_msgSend(CFSTR("didExit"), "stringByAppendingString:", v6);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = NSSelectorFromString(v14);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, v15);
  }
  objc_msgSend(CFSTR("didEnter"), "stringByAppendingString:", v7);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = NSSelectorFromString(v16);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, v17);
  v18 = CFSTR("Nil");
  if (v6)
    v18 = v6;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stateDidChangeFrom%@To%@"), v19, v7);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = NSSelectorFromString(v20);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, v21);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_GKStateMachine stateDidChange](v13, sel_stateDidChange);

}

- (BOOL)_setCurrentState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _GKStateMachine *v11;
  _GKStateMachine *v12;
  char v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_GKStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_GKStateMachine shouldLogStateTransitions](self, "shouldLogStateTransitions"))
  {
    v6 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v7 = GKOSLoggers();
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, " ➤➤➤ request state change from %@ to %@", (uint8_t *)&v15, 0x16u);
    }
  }
  -[_GKStateMachine _validateTransitionFromState:toState:](self, "_validateTransitionFromState:toState:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_GKStateMachine delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (_GKStateMachine *)v9;
    else
      v11 = self;
    v12 = v11;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_GKStateMachine stateWillChange](v12, sel_stateWillChange);
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_currentState, v8);
    os_unfair_lock_unlock(&self->_lock);
    -[_GKStateMachine _performTransitionFromState:toState:](self, "_performTransitionFromState:toState:", v5, v8);

  }
  v13 = objc_msgSend(v4, "isEqual:", v8);

  return v13;
}

- (NSString)currentState
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_currentState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)shouldLogStateTransitions
{
  return self->_shouldLogStateTransitions;
}

- (id)_validateTransitionFromState:(id)a3 toState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  NSObject *v12;
  void *v13;
  _GKStateMachine *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _GKStateMachine *v24;
  NSString *v25;
  const char *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v31;
  void *v32;
  _QWORD aBlock[5];
  id v34;
  id v35;
  uint8_t buf[4];
  _GKStateMachine *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___GKStateMachine__validateTransitionFromState_toState___block_invoke;
  aBlock[3] = &unk_1E75B7B70;
  aBlock[4] = self;
  v8 = v6;
  v34 = v8;
  v9 = v7;
  v35 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v9)
    goto LABEL_7;
  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    -[_GKStateMachine _validateTransitionFromState:toState:].cold.2((uint64_t)self, v12);
  v10[2](v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_7:
    if (!v8)
    {
LABEL_24:
      -[_GKStateMachine delegate](self, "delegate");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (_GKStateMachine *)v22;
      else
        v24 = self;
      v14 = v24;

      objc_msgSend(CFSTR("shouldEnter"), "stringByAppendingString:", v9);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = NSSelectorFromString(v25);

      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v14, v26) & 1) == 0)
      {
        if (!os_log_GKGeneral)
          v27 = GKOSLoggers();
        v28 = (void *)os_log_GKError;
        if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        {
          v31 = v28;
          NSStringFromSelector(v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v37 = self;
          v38 = 2112;
          v39 = v9;
          v40 = 2112;
          v41 = v8;
          v42 = 2112;
          v43 = v32;
          _os_log_error_impl(&dword_1BCDE3000, v31, OS_LOG_TYPE_ERROR, "  ➤➤➤ %@ transition disallowed to %@ from %@ (via %@)", buf, 0x2Au);

        }
        v10[2](v10);
        v29 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v29;
      }
      v9 = v9;
      v18 = v9;
      goto LABEL_36;
    }
    -[_GKStateMachine validTransitions](self, "validTransitions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v8);
    v14 = (_GKStateMachine *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((-[_GKStateMachine containsObject:](v14, "containsObject:", v9) & 1) != 0)
        goto LABEL_23;
    }
    else if ((-[_GKStateMachine isEqual:](v14, "isEqual:", v9) & 1) != 0)
    {
LABEL_23:

      goto LABEL_24;
    }
    v15 = objc_msgSend(v8, "isEqualToString:", v9);
    v16 = os_log_GKGeneral;
    if (v15)
    {
      if (!os_log_GKGeneral)
      {
        v17 = GKOSLoggers();
        v16 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[_GKStateMachine _validateTransitionFromState:toState:].cold.1((uint64_t)self, (uint64_t)v9, v16);
    }
    else
    {
      if (!os_log_GKGeneral)
        v19 = GKOSLoggers();
      v20 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v37 = self;
        v38 = 2112;
        v39 = v9;
        v40 = 2112;
        v41 = v8;
        _os_log_error_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_ERROR, "  ➤➤➤ %@ cannot transition to %@ from %@", buf, 0x20u);
      }
      v10[2](v10);
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v21;
      if (v21)
        goto LABEL_23;
    }
    v18 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v18 = 0;
LABEL_37:

  return v18;
}

- (_GKStateMachineDelegate)delegate
{
  return (_GKStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_GKStateMachine)init
{
  _GKStateMachine *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GKStateMachine;
  result = -[_GKStateMachine init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)missingTransitionFromState:(id)a3 toState:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("IllegalStateTransition"), CFSTR("cannot transition from %@ to %@"), a3, a4);
  return 0;
}

- (NSDictionary)validTransitions
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_validTransitions, 0);
}

- (void)_validateTransitionFromState:(os_log_t)log toState:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "  ➤➤➤ %@ ignoring reentry to %@", (uint8_t *)&v3, 0x16u);
}

- (void)_validateTransitionFromState:(uint64_t)a1 toState:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "validation for a state change failed:  ➤➤➤ %@ cannot transition to <nil> state", (uint8_t *)&v2, 0xCu);
}

@end
