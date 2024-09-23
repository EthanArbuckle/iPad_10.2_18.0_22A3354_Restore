@implementation FCAlmostThereEvent

- (FCAlmostThereEvent)initWithConfiguration:(id)a3
{
  id v5;
  FCAlmostThereEvent *v6;
  FCAlmostThereEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAlmostThereEvent;
  v6 = -[FCAlmostThereEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (id)eventIdentifier
{
  return (id)-[FCCAlmostThereConfiguration identifier](self->_configuration, "identifier");
}

- (double)minimumDayDuration
{
  void *v2;
  double v3;
  double v4;

  -[FCCAlmostThereConfiguration timeOfDayRule](self->_configuration, "timeOfDayRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumDayDuration");
  v4 = v3;

  return v4;
}

- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  int v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  FCCAlmostThereConfiguration *configuration;
  NSObject *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "currentExperienceType") != 1)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5298];
    LOBYTE(v13) = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1CC30F000, v12, OS_LOG_TYPE_DEFAULT, "Almost there event should not fire, fitness junior user", (uint8_t *)&v21, 2u);
LABEL_7:
    LOBYTE(v13) = 0;
    goto LABEL_14;
  }
  -[FCCAlmostThereConfiguration coalescingRules](self->_configuration, "coalescingRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = FCEventCoalescedWithRules(v8, v7);

  if ((v9 & 1) != 0)
    goto LABEL_7;
  v10 = !-[FCAlmostThereEvent _userWillCompleteGoalByEndOfDay:model:](self, "_userWillCompleteGoalByEndOfDay:model:", -[FCCAlmostThereConfiguration goalType](self->_configuration, "goalType"), v6);
  if (-[FCCAlmostThereConfiguration goalType](self->_configuration, "goalType") == 1)
    objc_msgSend(v6, "currentMoveGoalPercentage");
  else
    objc_msgSend(v6, "currentExerciseGoalPercentage");
  v14 = v11;
  -[FCCAlmostThereConfiguration minimumPercentageComplete](self->_configuration, "minimumPercentageComplete");
  v16 = v15;
  if (v14 >= v15)
    v13 = v10;
  else
    v13 = 0;
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    v19 = v17;
    v21 = 134218752;
    v22 = -[FCCAlmostThereConfiguration goalType](configuration, "goalType");
    v23 = 1024;
    v24 = v10;
    v25 = 1024;
    v26 = v14 >= v16;
    v27 = 1024;
    v28 = v13;
    _os_log_impl(&dword_1CC30F000, v19, OS_LOG_TYPE_DEFAULT, "AlmostThere reason evaluating whether to fire for goal type %lu, willEndDayWithGoalIncomplete: %{BOOL}d, hasCrossedAlmostThereGoalThreshold: %{BOOL}d, result: %{BOOL}d", (uint8_t *)&v21, 0x1Eu);

  }
LABEL_14:

  return v13;
}

- (id)nextFireDateWithModel:(id)a3
{
  FCCAlmostThereConfiguration *configuration;
  id v4;
  void *v5;
  void *v6;

  configuration = self->_configuration;
  v4 = a3;
  -[FCCAlmostThereConfiguration timeOfDayRule](configuration, "timeOfDayRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCFireDateForTimeOfDayRule(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)goalProgressContentForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D22140]);
  -[FCAlmostThereEvent eventIdentifier](self, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCCAlmostThereConfiguration goalType](self->_configuration, "goalType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:", v5, v7, -[FCCAlmostThereConfiguration goalType](self->_configuration, "goalType"), 0.0);

  return v8;
}

- (BOOL)_userWillCompleteGoalByEndOfDay:(int64_t)a3 model:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  char v10;
  double v11;
  BOOL v12;

  v6 = a4;
  -[FCCAlmostThereConfiguration goalBufferPercentage](self->_configuration, "goalBufferPercentage");
  v8 = v7;
  if (a3 == 2)
  {
    objc_msgSend(v6, "currentExerciseGoalPercentage");
    if (v11 < 1.0)
    {
      v10 = objc_msgSend(v6, "willCompleteExerciseGoalWithBufferPercentage:", v8);
      goto LABEL_7;
    }
LABEL_8:
    v12 = 1;
    goto LABEL_10;
  }
  if (a3 != 1)
  {
    v12 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "currentMoveGoalPercentage");
  if (v9 >= 1.0)
    goto LABEL_8;
  v10 = objc_msgSend(v6, "willCompleteMoveGoalWithBufferPercentage:", v8);
LABEL_7:
  v12 = v10;
LABEL_10:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
