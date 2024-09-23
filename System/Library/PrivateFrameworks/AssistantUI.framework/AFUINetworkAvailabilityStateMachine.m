@implementation AFUINetworkAvailabilityStateMachine

- (AFUINetworkAvailabilityStateMachine)initWithDelegate:(id)a3
{
  id v4;
  AFUINetworkAvailabilityStateMachine *v5;
  AFUINetworkAvailabilityStateMachine *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  RadiosPreferences *v11;
  RadiosPreferences *radioPreferences;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFUINetworkAvailabilityStateMachine;
  v5 = -[AFUINetworkAvailabilityStateMachine init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AFUINetworkAvailabilityStateMachine setDelegate:](v5, "setDelegate:", v4);
    -[AFUINetworkAvailabilityStateMachine _stateMachine](v6, "_stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUINetworkAvailabilityStateMachine delegate](v6, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "state");
    if (v9 > 3)
      v10 = 0;
    else
      v10 = qword_217563318[v9];
    objc_msgSend(v8, "_updateSiriAvailability:", v10);

    v11 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
    radioPreferences = v6->_radioPreferences;
    v6->_radioPreferences = v11;

    -[RadiosPreferences setDelegate:](v6->_radioPreferences, "setDelegate:", v6);
  }

  return v6;
}

- (void)siriNetworkAvailabilityDidChange
{
  -[AFUINetworkAvailabilityStateMachine _siriNetworkAvailabilityDidChange:](self, "_siriNetworkAvailabilityDidChange:", +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState"));
}

- (void)_siriNetworkAvailabilityDidChange:(unint64_t)a3
{
  if (a3 <= 3)
    -[AFUINetworkAvailabilityStateMachine _performTransitionForEvent:](self, "_performTransitionForEvent:");
}

- (id)_stateMachine
{
  SRUIFStateMachine *stateMachine;
  id v4;
  unint64_t v5;
  uint64_t v6;
  SRUIFStateMachine *v7;
  SRUIFStateMachine *v8;

  stateMachine = self->_stateMachine;
  if (!stateMachine)
  {
    v4 = objc_alloc(MEMORY[0x24BEA8680]);
    v5 = +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState") - 1;
    if (v5 > 2)
      v6 = 1;
    else
      v6 = qword_217563300[v5];
    v7 = (SRUIFStateMachine *)objc_msgSend(v4, "initWithInitialState:", v6);
    v8 = self->_stateMachine;
    self->_stateMachine = v7;

    -[SRUIFStateMachine setDelegate:](self->_stateMachine, "setDelegate:", self);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 1, 0);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 1, 2, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 1, 0);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 2, 2, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 0);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 0, 0, 1);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 1, 0);
    -[SRUIFStateMachine addTransitionFromState:toState:forEvent:](self->_stateMachine, "addTransitionFromState:toState:forEvent:", 3, 3, 1);
    stateMachine = self->_stateMachine;
  }
  return stateMachine;
}

- (int64_t)_state
{
  void *v2;
  int64_t v3;

  -[AFUINetworkAvailabilityStateMachine _stateMachine](self, "_stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v7 = objc_msgSend(a3, "state");
  if (v7 != a4)
  {
    v8 = v7;
    -[AFUINetworkAvailabilityStateMachine delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 > 3)
      v10 = 0;
    else
      v10 = qword_217563318[v8];
    v11 = v9;
    objc_msgSend(v9, "_updateSiriAvailability:", v10);

  }
}

- (id)stateMachine:(id)a3 descriptionForEvent:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return CFSTR("SRSiriAvailabilityEventConnectionAvailable");
  else
    return off_24D7A35C0[a4 - 1];
}

- (void)_performTransitionForEvent:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = -[AFUINetworkAvailabilityStateMachine _state](self, "_state");
    if ((unint64_t)(a3 - 1) > 2)
      v8 = CFSTR("SRSiriAvailabilityEventConnectionAvailable");
    else
      v8 = off_24D7A35C0[a3 - 1];
    v10 = 136315650;
    v11 = "-[AFUINetworkAvailabilityStateMachine _performTransitionForEvent:]";
    v12 = 2048;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s from state %ld; event %@", (uint8_t *)&v10, 0x20u);

  }
  -[AFUINetworkAvailabilityStateMachine _stateMachine](self, "_stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performTransitionForEvent:", a3);

}

- (AFUINetworkAvailabilityStateMachineDelegate)delegate
{
  return (AFUINetworkAvailabilityStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RadiosPreferences)radioPreferences
{
  return self->_radioPreferences;
}

- (void)setRadioPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radioPreferences, a3);
}

- (SRUIFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_radioPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
