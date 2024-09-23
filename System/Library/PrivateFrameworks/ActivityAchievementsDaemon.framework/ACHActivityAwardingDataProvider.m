@implementation ACHActivityAwardingDataProvider

- (ACHDataStoreActivityProperties)properties
{
  return self->_properties;
}

- (ACHActivityAwardingDataProvider)init
{
  ACHActivityAwardingDataProvider *v2;
  ACHDataStoreActivityProperties *v3;
  ACHDataStoreActivityProperties *properties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHActivityAwardingDataProvider;
  v2 = -[ACHActivityAwardingDataProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ACHDataStoreActivityProperties);
    properties = v2->_properties;
    v2->_properties = v3;

  }
  return v2;
}

- (void)updatePreviousPropertiesWithCurrentProperties
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[ACHDataStoreActivityProperties previousValues](self->_properties, "previousValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init((Class)objc_opt_class());
    -[ACHDataStoreActivityProperties setPreviousValues:](self->_properties, "setPreviousValues:", v4);

  }
  -[ACHDataStoreActivityProperties previousValues](self->_properties, "previousValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHDataStoreActivityProperties dictionaryRepresentation](self->_properties, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValuesForKeysWithDictionary:", v5);

}

- (void)clearAllProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ACHDataStoreActivityProperties dictionaryKeys](self->_properties, "dictionaryKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[ACHDataStoreActivityProperties setValue:forKey:](self->_properties, "setValue:forKey:", &unk_24D15B708, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[ACHDataStoreActivityProperties setPreviousValues:](self->_properties, "setPreviousValues:", 0);
}

- (void)setLastCheckedIndex:(int64_t)a3
{
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForMove:](self, "setLastCheckedIndexForMove:");
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForExercise:](self, "setLastCheckedIndexForExercise:", a3);
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForStand:](self, "setLastCheckedIndexForStand:", a3);
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForAllGoals:](self, "setLastCheckedIndexForAllGoals:", a3);
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForDistance:](self, "setLastCheckedIndexForDistance:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACHActivityAwardingDataProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = -[ACHActivityAwardingDataProvider init](+[ACHActivityAwardingDataProvider allocWithZone:](ACHActivityAwardingDataProvider, "allocWithZone:", a3), "init");
  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setTodayActivitySummary:](v4, "setTodayActivitySummary:", v5);

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setYesterdayActivitySummary:](v4, "setYesterdayActivitySummary:", v6);

  -[ACHActivityAwardingDataProvider properties](v4, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValuesForKeysWithDictionary:", v9);

  -[ACHActivityAwardingDataProvider setLastCheckedIndexForMove:](v4, "setLastCheckedIndexForMove:", -[ACHActivityAwardingDataProvider lastCheckedIndexForMove](self, "lastCheckedIndexForMove"));
  -[ACHActivityAwardingDataProvider lastProcessedTodayMoveValue](self, "lastProcessedTodayMoveValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayMoveValue:](v4, "setLastProcessedTodayMoveValue:", v10);

  -[ACHActivityAwardingDataProvider previousProcessedTodayMoveValue](self, "previousProcessedTodayMoveValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayMoveValue:](v4, "setPreviousProcessedTodayMoveValue:", v11);

  -[ACHActivityAwardingDataProvider lastTodayMoveGoal](self, "lastTodayMoveGoal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayMoveGoal:](v4, "setLastTodayMoveGoal:", v12);

  -[ACHActivityAwardingDataProvider setLastCheckedIndexForExercise:](v4, "setLastCheckedIndexForExercise:", -[ACHActivityAwardingDataProvider lastCheckedIndexForExercise](self, "lastCheckedIndexForExercise"));
  -[ACHActivityAwardingDataProvider lastProcessedTodayExerciseValue](self, "lastProcessedTodayExerciseValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayExerciseValue:](v4, "setLastProcessedTodayExerciseValue:", v13);

  -[ACHActivityAwardingDataProvider previousProcessedTodayExerciseValue](self, "previousProcessedTodayExerciseValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayExerciseValue:](v4, "setPreviousProcessedTodayExerciseValue:", v14);

  -[ACHActivityAwardingDataProvider lastTodayExerciseGoal](self, "lastTodayExerciseGoal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayExerciseGoal:](v4, "setLastTodayExerciseGoal:", v15);

  -[ACHActivityAwardingDataProvider setLastCheckedIndexForStand:](v4, "setLastCheckedIndexForStand:", -[ACHActivityAwardingDataProvider lastCheckedIndexForStand](self, "lastCheckedIndexForStand"));
  -[ACHActivityAwardingDataProvider lastProcessedTodayStandValue](self, "lastProcessedTodayStandValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayStandValue:](v4, "setLastProcessedTodayStandValue:", v16);

  -[ACHActivityAwardingDataProvider previousProcessedTodayStandValue](self, "previousProcessedTodayStandValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayStandValue:](v4, "setPreviousProcessedTodayStandValue:", v17);

  -[ACHActivityAwardingDataProvider lastTodayStandGoal](self, "lastTodayStandGoal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayStandGoal:](v4, "setLastTodayStandGoal:", v18);

  -[ACHActivityAwardingDataProvider setLastCheckedIndexForAllGoals:](v4, "setLastCheckedIndexForAllGoals:", -[ACHActivityAwardingDataProvider lastCheckedIndexForAllGoals](self, "lastCheckedIndexForAllGoals"));
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForDistance:](v4, "setLastCheckedIndexForDistance:", -[ACHActivityAwardingDataProvider lastCheckedIndexForDistance](self, "lastCheckedIndexForDistance"));
  -[ACHActivityAwardingDataProvider lastTodayDistanceValue](self, "lastTodayDistanceValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayDistanceValue:](v4, "setLastTodayDistanceValue:", v19);

  return v4;
}

- (int64_t)todayIndex
{
  void *v2;
  int64_t v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_activitySummaryIndex");

  return v3;
}

- (BOOL)ringsPausedToday
{
  void *v2;
  char v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentStateForGoalType:(SEL)a3
{
  switch(a4)
  {
    case 0:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)-[$A5E8A54F69D71102DC6A95EAED28A9DA currentMoveState](self, "currentMoveState");
      break;
    case 1:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)-[$A5E8A54F69D71102DC6A95EAED28A9DA currentExerciseState](self, "currentExerciseState");
      break;
    case 2:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)-[$A5E8A54F69D71102DC6A95EAED28A9DA currentStandState](self, "currentStandState");
      break;
    case 3:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)-[$A5E8A54F69D71102DC6A95EAED28A9DA currentMoveTimeState](self, "currentMoveTimeState");
      break;
    default:
      return self;
  }
  return self;
}

- (void)setNewState:(id *)a3 forGoalType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v31 = v4;
  v32 = v5;
  switch(a4)
  {
    case 0:
      v6 = *(_OWORD *)&a3->var14;
      v28 = *(_OWORD *)&a3->var12;
      v29 = v6;
      v30 = *(_OWORD *)&a3->var16;
      v7 = *(_OWORD *)&a3->var6;
      v24 = *(_OWORD *)&a3->var4;
      v25 = v7;
      v8 = *(_OWORD *)&a3->var10;
      v26 = *(_OWORD *)&a3->var8;
      v27 = v8;
      v9 = *(_OWORD *)&a3->var2;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v9;
      -[ACHActivityAwardingDataProvider setNewMoveState:](self, "setNewMoveState:", &v22);
      break;
    case 1:
      v10 = *(_OWORD *)&a3->var14;
      v28 = *(_OWORD *)&a3->var12;
      v29 = v10;
      v30 = *(_OWORD *)&a3->var16;
      v11 = *(_OWORD *)&a3->var6;
      v24 = *(_OWORD *)&a3->var4;
      v25 = v11;
      v12 = *(_OWORD *)&a3->var10;
      v26 = *(_OWORD *)&a3->var8;
      v27 = v12;
      v13 = *(_OWORD *)&a3->var2;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v13;
      -[ACHActivityAwardingDataProvider setNewExerciseState:](self, "setNewExerciseState:", &v22);
      break;
    case 2:
      v14 = *(_OWORD *)&a3->var14;
      v28 = *(_OWORD *)&a3->var12;
      v29 = v14;
      v30 = *(_OWORD *)&a3->var16;
      v15 = *(_OWORD *)&a3->var6;
      v24 = *(_OWORD *)&a3->var4;
      v25 = v15;
      v16 = *(_OWORD *)&a3->var10;
      v26 = *(_OWORD *)&a3->var8;
      v27 = v16;
      v17 = *(_OWORD *)&a3->var2;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v17;
      -[ACHActivityAwardingDataProvider setNewStandState:](self, "setNewStandState:", &v22);
      break;
    case 3:
      v18 = *(_OWORD *)&a3->var14;
      v28 = *(_OWORD *)&a3->var12;
      v29 = v18;
      v30 = *(_OWORD *)&a3->var16;
      v19 = *(_OWORD *)&a3->var6;
      v24 = *(_OWORD *)&a3->var4;
      v25 = v19;
      v20 = *(_OWORD *)&a3->var10;
      v26 = *(_OWORD *)&a3->var8;
      v27 = v20;
      v21 = *(_OWORD *)&a3->var2;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v21;
      -[ACHActivityAwardingDataProvider setNewMoveTimeState:](self, "setNewMoveTimeState:", &v22);
      break;
    default:
      return;
  }
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentMoveState
{
  double v5;
  $A5E8A54F69D71102DC6A95EAED28A9DA *result;
  id v7;

  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[ACHActivityAwardingDataProvider _baseMoveState](self, "_baseMoveState");
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestMoveGoalValue");
  retstr->var15 = v5;

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentMoveTimeState
{
  double v5;
  $A5E8A54F69D71102DC6A95EAED28A9DA *result;
  id v7;

  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[ACHActivityAwardingDataProvider _baseMoveState](self, "_baseMoveState");
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestMoveTimeGoalValue");
  retstr->var15 = v5;

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)_baseMoveState
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  $A5E8A54F69D71102DC6A95EAED28A9DA *result;
  id v43;

  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var0 = -[ACHActivityAwardingDataProvider lastCheckedIndexForMove](self, "lastCheckedIndexForMove");
  retstr->var1 = -[ACHActivityAwardingDataProvider todayIndex](self, "todayIndex");
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestMoveValue");
  retstr->var13 = v6;

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestMoveTimeValue");
  retstr->var14 = v8;

  ACHCanonicalUnitForGoalType(0);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  ACHCanonicalUnitForGoalType(3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "activityMoveMode");

  if (v11 == 2)
  {
    -[ACHActivityAwardingDataProvider lastProcessedTodayMoveTimeValue](self, "lastProcessedTodayMoveTimeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v9);
    retstr->var2 = v13;

    -[ACHActivityAwardingDataProvider todayMoveTimeValue](self, "todayMoveTimeValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v9);
    retstr->var3 = v15;

    -[ACHActivityAwardingDataProvider todayMoveTimeGoal](self, "todayMoveTimeGoal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v9;
  }
  else
  {
    -[ACHActivityAwardingDataProvider lastProcessedTodayMoveValue](self, "lastProcessedTodayMoveValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValueForUnit:", v43);
    retstr->var2 = v20;

    -[ACHActivityAwardingDataProvider todayMoveValue](self, "todayMoveValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValueForUnit:", v43);
    retstr->var3 = v22;

    -[ACHActivityAwardingDataProvider todayMoveGoal](self, "todayMoveGoal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v43;
  }
  objc_msgSend(v16, "doubleValueForUnit:", v18);
  v24 = v23;

  retstr->var4 = v24;
  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "activityMoveMode");

  if (v26 == 2)
  {
    -[ACHActivityAwardingDataProvider yesterdayMoveTimeValue](self, "yesterdayMoveTimeValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValueForUnit:", v9);
    retstr->var5 = v28;

    -[ACHActivityAwardingDataProvider yesterdayMoveTimeGoal](self, "yesterdayMoveTimeGoal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v9;
  }
  else
  {
    -[ACHActivityAwardingDataProvider yesterdayMoveValue](self, "yesterdayMoveValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValueForUnit:", v43);
    retstr->var5 = v33;

    -[ACHActivityAwardingDataProvider yesterdayMoveGoal](self, "yesterdayMoveGoal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v43;
  }
  objc_msgSend(v29, "doubleValueForUnit:", v31);
  v35 = v34;

  retstr->var6 = v35;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var9 = objc_msgSend(v36, "currentMonthMoveStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var8 = objc_msgSend(v37, "currentWeekMoveStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var7 = objc_msgSend(v38, "currentMoveStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var10 = objc_msgSend(v39, "bestMoveStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var11 = objc_msgSend(v40, "totalMoveGoalsMade");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var12 = objc_msgSend(v41, "totalMoveGoalsAttempted");

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentExerciseState
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  $A5E8A54F69D71102DC6A95EAED28A9DA *result;
  id v25;

  ACHCanonicalUnitForGoalType(1);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  retstr->var0 = -[ACHActivityAwardingDataProvider lastCheckedIndexForExercise](self, "lastCheckedIndexForExercise");
  retstr->var1 = -[ACHActivityAwardingDataProvider todayIndex](self, "todayIndex");
  -[ACHActivityAwardingDataProvider lastProcessedTodayExerciseValue](self, "lastProcessedTodayExerciseValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v25);
  retstr->var2 = v6;

  -[ACHActivityAwardingDataProvider todayExerciseValue](self, "todayExerciseValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v25);
  retstr->var3 = v8;

  -[ACHActivityAwardingDataProvider todayExerciseGoal](self, "todayExerciseGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v25);
  retstr->var4 = v10;

  -[ACHActivityAwardingDataProvider yesterdayExerciseValue](self, "yesterdayExerciseValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v25);
  retstr->var5 = v12;

  -[ACHActivityAwardingDataProvider yesterdayExerciseGoal](self, "yesterdayExerciseGoal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v25);
  retstr->var6 = v14;

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var8 = objc_msgSend(v15, "currentWeekExerciseStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var7 = objc_msgSend(v16, "currentExerciseStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var10 = objc_msgSend(v17, "bestExerciseStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bestExerciseValue");
  retstr->var13 = v19;

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bestExerciseGoalValue");
  retstr->var15 = v21;

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var11 = objc_msgSend(v22, "totalExerciseGoalsMade");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var12 = objc_msgSend(v23, "totalExerciseGoalsAttempted");

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentStandState
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  $A5E8A54F69D71102DC6A95EAED28A9DA *result;
  id v23;

  ACHCanonicalUnitForGoalType(2);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  retstr->var0 = -[ACHActivityAwardingDataProvider lastCheckedIndexForStand](self, "lastCheckedIndexForStand");
  retstr->var1 = -[ACHActivityAwardingDataProvider todayIndex](self, "todayIndex");
  -[ACHActivityAwardingDataProvider lastProcessedTodayStandValue](self, "lastProcessedTodayStandValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v23);
  retstr->var2 = v6;

  -[ACHActivityAwardingDataProvider todayStandValue](self, "todayStandValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v23);
  retstr->var3 = v8;

  -[ACHActivityAwardingDataProvider todayStandGoal](self, "todayStandGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v23);
  retstr->var4 = v10;

  -[ACHActivityAwardingDataProvider yesterdayStandValue](self, "yesterdayStandValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v23);
  retstr->var5 = v12;

  -[ACHActivityAwardingDataProvider yesterdayStandGoal](self, "yesterdayStandGoal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v23);
  retstr->var6 = v14;

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var8 = objc_msgSend(v15, "currentWeekStandStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var7 = objc_msgSend(v16, "currentStandStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var10 = objc_msgSend(v17, "bestStandStreak");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var13 = (double)(unint64_t)objc_msgSend(v18, "bestStandValue");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var15 = (double)(unint64_t)objc_msgSend(v19, "bestStandGoalValue");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var11 = objc_msgSend(v20, "totalStandGoalsMade");

  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var12 = objc_msgSend(v21, "totalStandGoalsAttempted");

  return result;
}

- (void)setNewMoveState:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  double var15;
  void *v14;
  _OWORD v15[9];

  ACHCanonicalUnitForGoalType(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var14;
  v15[6] = *(_OWORD *)&a3->var12;
  v15[7] = v6;
  v15[8] = *(_OWORD *)&a3->var16;
  v7 = *(_OWORD *)&a3->var6;
  v15[2] = *(_OWORD *)&a3->var4;
  v15[3] = v7;
  v8 = *(_OWORD *)&a3->var10;
  v15[4] = *(_OWORD *)&a3->var8;
  v15[5] = v8;
  v9 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v9;
  -[ACHActivityAwardingDataProvider _setBaseMoveState:](self, "_setBaseMoveState:", v15);
  -[ACHActivityAwardingDataProvider lastProcessedTodayMoveValue](self, "lastProcessedTodayMoveValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayMoveValue:](self, "setPreviousProcessedTodayMoveValue:", v10);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v5, a3->var3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayMoveValue:](self, "setLastProcessedTodayMoveValue:", v11);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v5, a3->var4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayMoveGoal:](self, "setLastTodayMoveGoal:", v12);

  var15 = a3->var15;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBestMoveGoalValue:", var15);

}

- (void)setNewMoveTimeState:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  double var15;
  void *v14;
  _OWORD v15[9];

  ACHCanonicalUnitForGoalType(3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var14;
  v15[6] = *(_OWORD *)&a3->var12;
  v15[7] = v6;
  v15[8] = *(_OWORD *)&a3->var16;
  v7 = *(_OWORD *)&a3->var6;
  v15[2] = *(_OWORD *)&a3->var4;
  v15[3] = v7;
  v8 = *(_OWORD *)&a3->var10;
  v15[4] = *(_OWORD *)&a3->var8;
  v15[5] = v8;
  v9 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v9;
  -[ACHActivityAwardingDataProvider _setBaseMoveState:](self, "_setBaseMoveState:", v15);
  -[ACHActivityAwardingDataProvider lastProcessedTodayMoveTimeValue](self, "lastProcessedTodayMoveTimeValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayMoveTimeValue:](self, "setPreviousProcessedTodayMoveTimeValue:", v10);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v5, a3->var3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayMoveTimeValue:](self, "setLastProcessedTodayMoveTimeValue:", v11);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v5, a3->var4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayMoveTimeGoal:](self, "setLastTodayMoveTimeGoal:", v12);

  var15 = a3->var15;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBestMoveTimeGoalValue:", var15);

}

- (void)_setBaseMoveState:(id *)a3
{
  int64_t var7;
  void *v6;
  int64_t var8;
  void *v8;
  int64_t var9;
  void *v10;
  int64_t var10;
  void *v12;
  int64_t var11;
  void *v14;
  int64_t var12;
  void *v16;
  double var13;
  void *v18;
  double var14;
  id v20;

  -[ACHActivityAwardingDataProvider setLastCheckedIndexForMove:](self, "setLastCheckedIndexForMove:", a3->var0);
  var7 = a3->var7;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentMoveStreak:", var7);

  var8 = a3->var8;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentWeekMoveStreak:", var8);

  var9 = a3->var9;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentMonthMoveStreak:", var9);

  var10 = a3->var10;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBestMoveStreak:", var10);

  var11 = a3->var11;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTotalMoveGoalsMade:", var11);

  var12 = a3->var12;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTotalMoveGoalsAttempted:", var12);

  var13 = a3->var13;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBestMoveValue:", var13);

  var14 = a3->var14;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBestMoveTimeValue:", var14);

}

- (void)setNewExerciseState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t var7;
  void *v9;
  int64_t var8;
  void *v11;
  int64_t var10;
  void *v13;
  double var13;
  void *v15;
  double var15;
  void *v17;
  int64_t var11;
  void *v19;
  int64_t var12;
  void *v21;
  id v22;

  ACHCanonicalUnitForGoalType(1);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForExercise:](self, "setLastCheckedIndexForExercise:", a3->var0);
  -[ACHActivityAwardingDataProvider lastProcessedTodayExerciseValue](self, "lastProcessedTodayExerciseValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayExerciseValue:](self, "setPreviousProcessedTodayExerciseValue:", v5);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v22, a3->var3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayExerciseValue:](self, "setLastProcessedTodayExerciseValue:", v6);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v22, a3->var4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayExerciseGoal:](self, "setLastTodayExerciseGoal:", v7);

  var7 = a3->var7;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentExerciseStreak:", var7);

  var8 = a3->var8;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentWeekExerciseStreak:", var8);

  var10 = a3->var10;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBestExerciseStreak:", var10);

  var13 = a3->var13;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBestExerciseValue:", var13);

  var15 = a3->var15;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBestExerciseGoalValue:", var15);

  var11 = a3->var11;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTotalExerciseGoalsMade:", var11);

  var12 = a3->var12;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTotalExerciseGoalsAttempted:", var12);

}

- (void)setNewStandState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t var7;
  void *v9;
  int64_t var8;
  void *v11;
  int64_t var10;
  void *v13;
  unint64_t var13;
  void *v15;
  unint64_t var15;
  void *v17;
  int64_t var11;
  void *v19;
  int64_t var12;
  void *v21;
  id v22;

  ACHCanonicalUnitForGoalType(2);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForStand:](self, "setLastCheckedIndexForStand:", a3->var0);
  -[ACHActivityAwardingDataProvider lastProcessedTodayStandValue](self, "lastProcessedTodayStandValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setPreviousProcessedTodayStandValue:](self, "setPreviousProcessedTodayStandValue:", v5);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v22, a3->var3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastProcessedTodayStandValue:](self, "setLastProcessedTodayStandValue:", v6);

  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v22, a3->var4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider setLastTodayStandGoal:](self, "setLastTodayStandGoal:", v7);

  var7 = a3->var7;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentStandStreak:", var7);

  var8 = a3->var8;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentWeekStandStreak:", var8);

  var10 = a3->var10;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBestStandStreak:", var10);

  var13 = (unint64_t)a3->var13;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBestStandValue:", var13);

  var15 = (unint64_t)a3->var15;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBestStandGoalValue:", var15);

  var11 = a3->var11;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTotalStandGoalsMade:", var11);

  var12 = a3->var12;
  -[ACHActivityAwardingDataProvider properties](self, "properties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTotalStandGoalsAttempted:", var12);

}

- (BOOL)allGoalsMetToday
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityMoveMode");

  if (v4 == 2)
  {
    ACHCanonicalUnitForGoalType(3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingDataProvider todayMoveTimeValue](self, "todayMoveTimeValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v5);
    v8 = v7;

    -[ACHActivityAwardingDataProvider todayMoveTimeGoal](self, "todayMoveTimeGoal");
  }
  else
  {
    ACHCanonicalUnitForGoalType(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingDataProvider todayMoveValue](self, "todayMoveValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", v5);
    v8 = v10;

    -[ACHActivityAwardingDataProvider todayMoveGoal](self, "todayMoveGoal");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v5);
  v13 = v12;

  ACHCanonicalUnitForGoalType(1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider todayExerciseValue](self, "todayExerciseValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValueForUnit:", v14);
  v17 = v16;

  -[ACHActivityAwardingDataProvider todayExerciseGoal](self, "todayExerciseGoal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValueForUnit:", v14);
  v20 = v19;

  ACHCanonicalUnitForGoalType(2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingDataProvider todayStandValue](self, "todayStandValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValueForUnit:", v21);
  v24 = (uint64_t)v23;

  -[ACHActivityAwardingDataProvider todayStandGoal](self, "todayStandGoal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValueForUnit:", v21);
  v27 = (uint64_t)v26;

  v28 = v8 >= v13;
  if (v17 < v20)
    v28 = 0;
  v29 = v24 >= v27 && v28;

  return v29;
}

- (HKQuantity)todayMoveValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeEnergyBurned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeEnergyBurned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayMoveGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeEnergyBurnedGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeEnergyBurnedGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayMoveTimeValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMoveTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveTimeValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMoveTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayMoveTimeGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMoveTimeGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveTimeGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMoveTimeGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayExerciseValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleExerciseTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayExerciseValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleExerciseTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayExerciseGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleExerciseTimeGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayExerciseGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleExerciseTimeGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayStandValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleStandHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayStandValue
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleStandHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)todayStandGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider todayActivitySummary](self, "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleStandHoursGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayStandGoal
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingDataProvider yesterdayActivitySummary](self, "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleStandHoursGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (HKActivitySummary)todayActivitySummary
{
  return self->_todayActivitySummary;
}

- (void)setTodayActivitySummary:(id)a3
{
  objc_storeStrong((id *)&self->_todayActivitySummary, a3);
}

- (HKActivitySummary)yesterdayActivitySummary
{
  return self->_yesterdayActivitySummary;
}

- (void)setYesterdayActivitySummary:(id)a3
{
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, a3);
}

- (int64_t)initialPropertyCheckpointIndex
{
  return self->_initialPropertyCheckpointIndex;
}

- (void)setInitialPropertyCheckpointIndex:(int64_t)a3
{
  self->_initialPropertyCheckpointIndex = a3;
}

- (int64_t)lastCheckedIndexForMove
{
  return self->_lastCheckedIndexForMove;
}

- (void)setLastCheckedIndexForMove:(int64_t)a3
{
  self->_lastCheckedIndexForMove = a3;
}

- (HKQuantity)lastProcessedTodayMoveValue
{
  return self->_lastProcessedTodayMoveValue;
}

- (void)setLastProcessedTodayMoveValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessedTodayMoveValue, a3);
}

- (HKQuantity)previousProcessedTodayMoveValue
{
  return self->_previousProcessedTodayMoveValue;
}

- (void)setPreviousProcessedTodayMoveValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousProcessedTodayMoveValue, a3);
}

- (HKQuantity)lastTodayMoveGoal
{
  return self->_lastTodayMoveGoal;
}

- (void)setLastTodayMoveGoal:(id)a3
{
  objc_storeStrong((id *)&self->_lastTodayMoveGoal, a3);
}

- (HKQuantity)lastProcessedTodayMoveTimeValue
{
  return self->_lastProcessedTodayMoveTimeValue;
}

- (void)setLastProcessedTodayMoveTimeValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessedTodayMoveTimeValue, a3);
}

- (HKQuantity)previousProcessedTodayMoveTimeValue
{
  return self->_previousProcessedTodayMoveTimeValue;
}

- (void)setPreviousProcessedTodayMoveTimeValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousProcessedTodayMoveTimeValue, a3);
}

- (HKQuantity)lastTodayMoveTimeGoal
{
  return self->_lastTodayMoveTimeGoal;
}

- (void)setLastTodayMoveTimeGoal:(id)a3
{
  objc_storeStrong((id *)&self->_lastTodayMoveTimeGoal, a3);
}

- (int64_t)lastCheckedIndexForExercise
{
  return self->_lastCheckedIndexForExercise;
}

- (void)setLastCheckedIndexForExercise:(int64_t)a3
{
  self->_lastCheckedIndexForExercise = a3;
}

- (HKQuantity)lastProcessedTodayExerciseValue
{
  return self->_lastProcessedTodayExerciseValue;
}

- (void)setLastProcessedTodayExerciseValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessedTodayExerciseValue, a3);
}

- (HKQuantity)previousProcessedTodayExerciseValue
{
  return self->_previousProcessedTodayExerciseValue;
}

- (void)setPreviousProcessedTodayExerciseValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousProcessedTodayExerciseValue, a3);
}

- (HKQuantity)lastTodayExerciseGoal
{
  return self->_lastTodayExerciseGoal;
}

- (void)setLastTodayExerciseGoal:(id)a3
{
  objc_storeStrong((id *)&self->_lastTodayExerciseGoal, a3);
}

- (int64_t)lastCheckedIndexForStand
{
  return self->_lastCheckedIndexForStand;
}

- (void)setLastCheckedIndexForStand:(int64_t)a3
{
  self->_lastCheckedIndexForStand = a3;
}

- (HKQuantity)lastProcessedTodayStandValue
{
  return self->_lastProcessedTodayStandValue;
}

- (void)setLastProcessedTodayStandValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessedTodayStandValue, a3);
}

- (HKQuantity)previousProcessedTodayStandValue
{
  return self->_previousProcessedTodayStandValue;
}

- (void)setPreviousProcessedTodayStandValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousProcessedTodayStandValue, a3);
}

- (HKQuantity)lastTodayStandGoal
{
  return self->_lastTodayStandGoal;
}

- (void)setLastTodayStandGoal:(id)a3
{
  objc_storeStrong((id *)&self->_lastTodayStandGoal, a3);
}

- (int64_t)lastCheckedIndexForAllGoals
{
  return self->_lastCheckedIndexForAllGoals;
}

- (void)setLastCheckedIndexForAllGoals:(int64_t)a3
{
  self->_lastCheckedIndexForAllGoals = a3;
}

- (int64_t)lastCheckedIndexForDistance
{
  return self->_lastCheckedIndexForDistance;
}

- (void)setLastCheckedIndexForDistance:(int64_t)a3
{
  self->_lastCheckedIndexForDistance = a3;
}

- (HKQuantity)todayDistanceValue
{
  return self->_todayDistanceValue;
}

- (HKQuantity)lastTodayDistanceValue
{
  return self->_lastTodayDistanceValue;
}

- (void)setLastTodayDistanceValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastTodayDistanceValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTodayDistanceValue, 0);
  objc_storeStrong((id *)&self->_todayDistanceValue, 0);
  objc_storeStrong((id *)&self->_lastTodayStandGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayStandValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayStandValue, 0);
  objc_storeStrong((id *)&self->_lastTodayExerciseGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayExerciseValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayExerciseValue, 0);
  objc_storeStrong((id *)&self->_lastTodayMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayMoveTimeValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayMoveTimeValue, 0);
  objc_storeStrong((id *)&self->_lastTodayMoveGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayMoveValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayMoveValue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, 0);
  objc_storeStrong((id *)&self->_todayActivitySummary, 0);
}

@end
