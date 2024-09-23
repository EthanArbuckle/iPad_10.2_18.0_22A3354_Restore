@implementation AAPTriggerGenerator

- (AAPTriggerGenerator)initWithProfile:(id)a3 awardsClient:(id)a4
{
  id v6;
  id v7;
  AAPTriggerGenerator *v8;
  AAPTriggerGenerator *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAPTriggerGenerator;
  v8 = -[AAPTriggerGenerator init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_awardsClient, a4);
    v10 = objc_storeWeak((id *)&v9->_profile, v6);
    objc_msgSend(v6, "registerProfileReadyObserver:queue:", v9, 0);

  }
  return v9;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forDataType:", self, v4);

  objc_msgSend(WeakRetained, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forDataType:", self, v7);

  objc_msgSend(WeakRetained, "currentActivitySummaryHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2322DD000, v5, OS_LOG_TYPE_DEFAULT, "Sample added, signaling awards daemon for workouts/mindfulSessions added", v6, 2u);
  }

  -[AACAwardsClient requestAwardingWithTriggers:completion:](self->_awardsClient, "requestAwardingWithTriggers:completion:", 2, &unk_25011CA28);
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;

  v7 = a4;
  if ((objc_msgSend(v7, "_isDataLoading") & 1) == 0)
    -[AAPTriggerGenerator _notifyForUpdatedSummary:changedFields:](self, "_notifyForUpdatedSummary:changedFields:", v7, a5);

}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;

  v7 = a4;
  if ((objc_msgSend(v7, "_isDataLoading") & 1) == 0)
    -[AAPTriggerGenerator _notifyForUpdatedSummary:changedFields:](self, "_notifyForUpdatedSummary:changedFields:", v7, a5);

}

- (void)_notifyForUpdatedSummary:(id)a3 changedFields:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = -[AAPTriggerGenerator _triggersForSummary:changedFields:](self, "_triggersForSummary:changedFields:", a3, a4);
  if (v5)
  {
    v6 = v5;
    ACHTriggerOptionsToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2322DD000, v8, OS_LOG_TYPE_DEFAULT, "Singaling awards daemon for triggers: %@", (uint8_t *)&v9, 0xCu);
    }

    -[AACAwardsClient requestAwardingWithTriggers:completion:](self->_awardsClient, "requestAwardingWithTriggers:completion:", v6, &unk_25011CA48);
  }
}

- (unint64_t)_triggersForSummary:(id)a3 changedFields:(unint64_t)a4
{
  __int16 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "activityMoveMode") == 2)
  {
    if ((v4 & 0x4000) != 0)
    {
      objc_msgSend(v5, "appleMoveTimeGoal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValueForUnit:", v7);
      v11 = v10;

      if (v11 > 0.0)
      {
        objc_msgSend(v5, "appleMoveTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = v7;
        goto LABEL_8;
      }
    }
LABEL_10:
    v19 = 0;
    if ((v4 & 4) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
  if ((v4 & 2) == 0)
    goto LABEL_10;
  objc_msgSend(v5, "activeEnergyBurnedGoal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValueForUnit:", v6);
  v11 = v16;

  if (v11 <= 0.0)
    goto LABEL_10;
  objc_msgSend(v5, "activeEnergyBurned");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v6;
LABEL_8:
  objc_msgSend(v12, "doubleValueForUnit:", v14);
  v18 = v17 >= v11;

  v19 = 4 * v18;
  if ((v4 & 4) == 0)
    goto LABEL_13;
LABEL_11:
  objc_msgSend(v5, "appleExerciseTimeGoal");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValueForUnit:", v7);
  v22 = v21;

  objc_msgSend(v5, "appleExerciseTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValueForUnit:", v7);
  v25 = v24;

  if (v25 >= v22)
    v19 |= 0x10uLL;
LABEL_13:
  if ((v4 & 8) != 0)
  {
    objc_msgSend(v5, "appleStandHoursGoal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValueForUnit:", v8);
    v28 = v27;

    objc_msgSend(v5, "appleStandHours");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValueForUnit:", v8);
    v31 = v30;

    if (v31 >= v28)
      v19 |= 0x20uLL;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_awardsClient, 0);
}

@end
