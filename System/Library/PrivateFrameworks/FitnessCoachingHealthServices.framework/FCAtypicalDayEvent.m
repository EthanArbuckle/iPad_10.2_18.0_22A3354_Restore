@implementation FCAtypicalDayEvent

- (FCAtypicalDayEvent)initWithConfiguration:(id)a3
{
  id v5;
  FCAtypicalDayEvent *v6;
  FCAtypicalDayEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAtypicalDayEvent;
  v6 = -[FCAtypicalDayEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (id)eventIdentifier
{
  return (id)-[FCCAtypicalDayConfiguration identifier](self->_configuration, "identifier");
}

- (double)minimumDayDuration
{
  void *v2;
  double v3;
  double v4;

  -[FCCAtypicalDayConfiguration percentageOfDayRule](self->_configuration, "percentageOfDayRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumDayDuration");
  v4 = v3;

  return v4;
}

- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  BOOL v12;
  const char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  _DWORD v36[2];
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a4, "currentExperienceType") == 1)
  {
    objc_msgSend(v6, "valueOfTypicalDayMoveEarnedByNow");
    v8 = v7;
    objc_msgSend(v6, "valueOfTypicalDayBriskMinutesEarnedByNow");
    v10 = v9;
    if (v8 <= 0.0 && v9 <= 0.0)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5298];
      v12 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36[0]) = 0;
        v13 = "Morning update can't use move or exercise to determine relative progress!";
LABEL_8:
        _os_log_impl(&dword_1CC30F000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)v36, 2u);
LABEL_9:
        v12 = 0;
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    objc_msgSend(v6, "currentMoveGoalPercentage");
    v15 = v14;
    objc_msgSend(v6, "percentageOfTypicalDayMoveComparedToNow");
    v17 = v16;
    -[FCCAtypicalDayConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", &unk_1E8805B30);

    v20 = 0;
    if (v19)
    {
      v21 = 0;
      if (v8 > 0.0)
      {
        v20 = -[FCAtypicalDayEvent _isProgressSignificantlyBetter:](self, "_isProgressSignificantlyBetter:", v17);
        v22 = -[FCAtypicalDayEvent _isProgressSignificantlyWorse:](self, "_isProgressSignificantlyWorse:", v17);
        v21 = v15 < 1.0 && v22;
      }
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v6, "currentExerciseGoalPercentage");
    v24 = v23;
    objc_msgSend(v6, "percentageOfTypicalDayBriskMinutesEarnedComparedToNow");
    v26 = v25;
    -[FCCAtypicalDayConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", &unk_1E8805B48);

    v29 = 0;
    if (v28)
    {
      v30 = 0;
      if (v10 > 0.0)
      {
        v29 = -[FCAtypicalDayEvent _isProgressSignificantlyBetter:](self, "_isProgressSignificantlyBetter:", v26);
        v31 = -[FCAtypicalDayEvent _isProgressSignificantlyWorse:](self, "_isProgressSignificantlyWorse:", v26);
        v30 = v24 < 1.0 && v31;
      }
    }
    else
    {
      v30 = 0;
    }
    if (v20 || v29)
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E0CB5298];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:
        _HKInitializeLogging();
        v34 = *MEMORY[0x1E0CB5298];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
        {
          v36[0] = 67110400;
          v36[1] = v8 > 0.0;
          v37 = 1024;
          v38 = v10 > 0.0;
          v39 = 2048;
          v40 = v17;
          v41 = 2048;
          v42 = v26;
          v43 = 1024;
          v44 = v15 >= 1.0;
          v45 = 1024;
          v46 = v24 >= 1.0;
          _os_log_impl(&dword_1CC30F000, v34, OS_LOG_TYPE_DEFAULT, "Morning update trigger determined from: canUseMoveForPrediction=%{BOOL}d, canUseExerciseForPrediction=%{BOOL}d, percentageOfTypicalMove=%f, percentageOfTypicalExercise=%f, moveRingClosedToday=%{BOOL}d, exerciseRingClosedToday=%{BOOL}d", (uint8_t *)v36, 0x2Eu);
        }
        v12 = 1;
        goto LABEL_32;
      }
      LOWORD(v36[0]) = 0;
      v33 = "Today was significantly better than normal; showing morning update";
    }
    else
    {
      if (!v21 && !v30)
        goto LABEL_9;
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E0CB5298];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      LOWORD(v36[0]) = 0;
      v33 = "Today was significantly worse than normal; showing morning update";
    }
    _os_log_impl(&dword_1CC30F000, v32, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)v36, 2u);
    goto LABEL_29;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5298];
  v12 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v36[0]) = 0;
    v13 = "Morning update should not fire, fitness junior user";
    goto LABEL_8;
  }
LABEL_32:

  return v12;
}

- (id)nextFireDateWithModel:(id)a3
{
  FCCAtypicalDayConfiguration *configuration;
  id v4;
  void *v5;
  void *v6;

  configuration = self->_configuration;
  v4 = a3;
  -[FCCAtypicalDayConfiguration percentageOfDayRule](configuration, "percentageOfDayRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCFireDateForPercentOfDayRule(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)goalProgressContentForModel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;

  v4 = a3;
  -[FCCAtypicalDayConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", &unk_1E8805B30);

  if (v6)
  {
    objc_msgSend(v4, "percentageOfTypicalDayMoveComparedToNow");
    v8 = v7;
    v9 = -[FCAtypicalDayEvent _isProgressSignificantlyWorse:](self, "_isProgressSignificantlyWorse:");
    v6 = -[FCAtypicalDayEvent _isProgressSignificantlyBetter:](self, "_isProgressSignificantlyBetter:", v8);
  }
  else
  {
    v9 = 0;
  }
  -[FCCAtypicalDayConfiguration allowedGoalTypes](self->_configuration, "allowedGoalTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", &unk_1E8805B48);

  if (v11)
  {
    objc_msgSend(v4, "percentageOfTypicalDayBriskMinutesEarnedComparedToNow");
    v13 = v12;
    v11 = -[FCAtypicalDayEvent _isProgressSignificantlyWorse:](self, "_isProgressSignificantlyWorse:");
    v14 = -[FCAtypicalDayEvent _isProgressSignificantlyBetter:](self, "_isProgressSignificantlyBetter:", v13);
  }
  else
  {
    v14 = 0;
  }
  if ((v9 | v11) == 1)
  {
    if (v9)
    {
      objc_msgSend(v4, "valueOfTypicalDayMoveEarnedByNow");
      v16 = v15;
      v17 = 1;
    }
    else if (v11)
    {
      objc_msgSend(v4, "valueOfTypicalDayBriskMinutesEarnedByNow");
      v16 = v21;
      v17 = 2;
    }
    else
    {
      v17 = 0;
      v16 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", &unk_1E8805B60);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if ((v6 | v14) != 1)
  {
    v17 = 0;
    v16 = 0.0;
    v20 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_22;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", &unk_1E8805B30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueOfTypicalDayMoveEarnedByNow");
    v16 = v19;
    v17 = 1;
    if (!v14)
    {
LABEL_13:
      v20 = v18;
      goto LABEL_22;
    }
  }
  else
  {
    v17 = 0;
    v16 = 0.0;
    v18 = (void *)MEMORY[0x1E0C9AA60];
    if (!v14)
      goto LABEL_13;
  }
  objc_msgSend(v18, "arrayByAddingObject:", &unk_1E8805B48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == 0.0)
  {
    objc_msgSend(v4, "valueOfTypicalDayBriskMinutesEarnedByNow");
    v16 = v22;
    v17 = 2;
  }
LABEL_22:
  v23 = objc_alloc(MEMORY[0x1E0D22140]);
  -[FCAtypicalDayEvent eventIdentifier](self, "eventIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:", v24, v20, v17, v16);

  return v25;
}

- (BOOL)_isProgressSignificantlyBetter:(double)a3
{
  double v4;

  -[FCCAtypicalDayConfiguration minimumAheadPercentage](self->_configuration, "minimumAheadPercentage");
  return v4 + 1.0 <= a3;
}

- (BOOL)_isProgressSignificantlyWorse:(double)a3
{
  double v4;

  -[FCCAtypicalDayConfiguration minimumBehindPercentage](self->_configuration, "minimumBehindPercentage");
  return 1.0 - v4 >= a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
