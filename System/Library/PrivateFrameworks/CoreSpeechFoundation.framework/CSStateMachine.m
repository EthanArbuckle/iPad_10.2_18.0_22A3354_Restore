@implementation CSStateMachine

- (CSStateMachine)initWithInitialState:(int64_t)a3
{
  CSStateMachine *v4;
  CSStateMachine *v5;
  uint64_t v6;
  NSMutableDictionary *transitions;
  uint64_t v8;
  NSMutableDictionary *eventToStateTransitions;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSStateMachine;
  v4 = -[CSStateMachine init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_currentState = a3;
    v4->_initialState = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    transitions = v5->_transitions;
    v5->_transitions = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    eventToStateTransitions = v5->_eventToStateTransitions;
    v5->_eventToStateTransitions = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (void)reset
{
  self->_currentState = self->_initialState;
}

- (void)addTransitionFrom:(int64_t)a3 to:(int64_t)a4 for:(int64_t)a5
{
  NSMutableDictionary *transitions;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  transitions = self->_transitions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](transitions, "objectForKeyedSubscript:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_transitions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = self->_transitions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v16, v17);

}

- (void)addTransitionFromAnyStateTo:(int64_t)a3 for:(int64_t)a4
{
  NSMutableDictionary *eventToStateTransitions;
  void *v6;
  id v7;

  eventToStateTransitions = self->_eventToStateTransitions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](eventToStateTransitions, "setObject:forKey:", v7, v6);

}

- (void)performTransitionForEvent:(int64_t)a3
{
  NSMutableDictionary *transitions;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *eventToStateTransitions;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  int64_t v16;
  id WeakRetained;
  int64_t currentState;
  id v19;
  id v20;
  NSMutableDictionary *v21;

  transitions = self->_transitions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](transitions, "objectForKeyedSubscript:", v6);
  v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;
      goto LABEL_6;
    }
  }
  eventToStateTransitions = self->_eventToStateTransitions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](eventToStateTransitions, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = self->_eventToStateTransitions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
LABEL_6:
    -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      currentState = self->_currentState;
      self->_currentState = v16;
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v19, "didTransitFrom:to:by:", currentState, self->_currentState, a3);
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v20 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v20)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v19, "didIgnoreEvent:from:", a3, self->_currentState);
    goto LABEL_10;
  }
LABEL_11:

}

- (CSStateMachineDelegate)delegate
{
  return (CSStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(int64_t)a3
{
  self->_initialState = a3;
}

- (NSMutableDictionary)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_transitions, a3);
}

- (NSMutableDictionary)eventToStateTransitions
{
  return self->_eventToStateTransitions;
}

- (void)setEventToStateTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_eventToStateTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventToStateTransitions, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
