@implementation FCCompletionOffTrackEvent

- (FCCompletionOffTrackEvent)initWithConfiguration:(id)a3
{
  id v5;
  FCCompletionOffTrackEvent *v6;
  FCCompletionOffTrackEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCompletionOffTrackEvent;
  v6 = -[FCCompletionOffTrackEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (id)eventIdentifier
{
  return (id)-[FCCCompletionOffTrackConfiguration identifier](self->_configuration, "identifier");
}

- (double)minimumDayDuration
{
  void *v2;
  double v3;
  double v4;

  -[FCCCompletionOffTrackConfiguration percentageOfDayRule](self->_configuration, "percentageOfDayRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumDayDuration");
  v4 = v3;

  return v4;
}

- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4
{
  id v6;
  FCCCompletionOffTrackConfiguration *configuration;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  double v16;
  _BOOL4 v17;
  int v18;
  void *v19;
  int v20;
  double v21;
  _BOOL4 v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  uint8_t v29[16];

  v6 = a3;
  configuration = self->_configuration;
  v8 = a4;
  -[FCCCompletionOffTrackConfiguration coalescingRules](configuration, "coalescingRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = FCEventCoalescedWithRules(v9, v8);

  if ((v10 & 1) != 0)
    goto LABEL_2;
  -[FCCCompletionOffTrackConfiguration goalBufferPercentage](self->_configuration, "goalBufferPercentage");
  v13 = v12;
  -[FCCCompletionOffTrackConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", &unk_1E8805B78);

  if (v15)
  {
    objc_msgSend(v6, "valueOfTypicalDayMoveEarnedByNow");
    v17 = v16 > 0.0;
    v18 = objc_msgSend(v6, "willCompleteMoveGoalWithBufferPercentage:", v13);
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
  -[FCCCompletionOffTrackConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", &unk_1E8805B90);

  if (v20)
  {
    objc_msgSend(v6, "valueOfTypicalDayBriskMinutesEarnedByNow");
    v22 = v21 > 0.0;
    v23 = objc_msgSend(v6, "willCompleteExerciseGoalWithBufferPercentage:", v13);
  }
  else
  {
    v22 = 0;
    v23 = 1;
  }
  -[FCCCompletionOffTrackConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "containsObject:", &unk_1E8805BA8);

  v26 = v25 ? objc_msgSend(v6, "willCompleteStandGoalOrItIsTooLateWithBufferPercentage:", v13) : 1;
  if ((!v17 | v18) == 1 && !v22 | v23 && (((!v17 && !v22) | v26) & 1) != 0)
  {
LABEL_2:
    v11 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v27 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1CC30F000, v27, OS_LOG_TYPE_DEFAULT, "Unlikely to complete a goal today; showing evening update",
        v29,
        2u);
    }
    v11 = 1;
  }

  return v11;
}

- (id)nextFireDateWithModel:(id)a3
{
  FCCCompletionOffTrackConfiguration *configuration;
  id v4;
  void *v5;
  void *v6;

  configuration = self->_configuration;
  v4 = a3;
  -[FCCCompletionOffTrackConfiguration percentageOfDayRule](configuration, "percentageOfDayRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCFireDateForPercentOfDayRule(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)goalProgressContentForModel:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;

  v4 = a3;
  -[FCCCompletionOffTrackConfiguration goalBufferPercentage](self->_configuration, "goalBufferPercentage");
  v6 = v5;
  -[FCCCompletionOffTrackConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", &unk_1E8805B78);

  if (v8)
    v9 = objc_msgSend(v4, "willCompleteMoveGoalWithBufferPercentage:", v6);
  else
    v9 = 1;
  -[FCCCompletionOffTrackConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", &unk_1E8805B90);

  if (v11)
    v12 = objc_msgSend(v4, "willCompleteExerciseGoalWithBufferPercentage:", v6);
  else
    v12 = 1;
  -[FCCCompletionOffTrackConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", &unk_1E8805BA8);

  if (v14)
  {
    v15 = objc_msgSend(v4, "willCompleteStandGoalOrItIsTooLateWithBufferPercentage:", v6);
    if ((v9 & 1) == 0)
      goto LABEL_9;
LABEL_12:
    v16 = (void *)MEMORY[0x1E0C9AA60];
    if ((v12 & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v15 = 1;
  if ((v9 & 1) != 0)
    goto LABEL_12;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", &unk_1E8805B78);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) == 0)
  {
LABEL_13:
    objc_msgSend(v16, "arrayByAddingObject:", &unk_1E8805B90);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
LABEL_14:
  if ((v15 & 1) == 0)
  {
    objc_msgSend(v16, "arrayByAddingObject:", &unk_1E8805BA8);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  v19 = objc_alloc(MEMORY[0x1E0D22140]);
  -[FCCompletionOffTrackEvent eventIdentifier](self, "eventIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:", v20, v16, 0, 0.0);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
