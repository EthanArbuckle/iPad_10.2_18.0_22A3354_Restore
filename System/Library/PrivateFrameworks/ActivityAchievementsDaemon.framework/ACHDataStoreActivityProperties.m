@implementation ACHDataStoreActivityProperties

- (int64_t)storeValuesValidBeforeSummaryIndex
{
  return self->_storeValuesValidBeforeSummaryIndex;
}

- (NSArray)dictionaryKeys
{
  if (dictionaryKeys_onceToken != -1)
    dispatch_once(&dictionaryKeys_onceToken, &__block_literal_global_3);
  return (NSArray *)(id)dictionaryKeys_keys;
}

void __48__ACHDataStoreActivityProperties_dictionaryKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[29];

  v29[27] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_currentMoveStreak);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v28;
  NSStringFromSelector(sel_currentWeekMoveStreak);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v27;
  NSStringFromSelector(sel_currentMonthMoveStreak);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v26;
  NSStringFromSelector(sel_bestMoveStreak);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v25;
  NSStringFromSelector(sel_totalMoveGoalsMade);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v24;
  NSStringFromSelector(sel_totalMoveGoalsAttempted);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v23;
  NSStringFromSelector(sel_bestMoveValue);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v22;
  NSStringFromSelector(sel_bestMoveGoalValue);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v21;
  NSStringFromSelector(sel_bestMoveTimeValue);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v20;
  NSStringFromSelector(sel_bestMoveTimeGoalValue);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v19;
  NSStringFromSelector(sel_currentExerciseStreak);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v18;
  NSStringFromSelector(sel_currentWeekExerciseStreak);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v17;
  NSStringFromSelector(sel_bestExerciseStreak);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[12] = v16;
  NSStringFromSelector(sel_totalExerciseGoalsMade);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[13] = v15;
  NSStringFromSelector(sel_totalExerciseGoalsAttempted);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[14] = v14;
  NSStringFromSelector(sel_bestExerciseValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[15] = v13;
  NSStringFromSelector(sel_bestExerciseGoalValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[16] = v12;
  NSStringFromSelector(sel_currentStandStreak);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v29[17] = v0;
  NSStringFromSelector(sel_currentWeekStandStreak);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[18] = v1;
  NSStringFromSelector(sel_bestStandStreak);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29[19] = v2;
  NSStringFromSelector(sel_totalStandGoalsMade);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[20] = v3;
  NSStringFromSelector(sel_totalStandGoalsAttempted);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[21] = v4;
  NSStringFromSelector(sel_bestStandValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[22] = v5;
  NSStringFromSelector(sel_bestStandGoalValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[23] = v6;
  NSStringFromSelector(sel_lastStepCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[24] = v7;
  NSStringFromSelector(sel_bestStepCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[25] = v8;
  NSStringFromSelector(sel_storeValuesValidBeforeSummaryIndex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[26] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 27);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)dictionaryKeys_keys;
  dictionaryKeys_keys = v10;

}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;

  -[ACHDataStoreActivityProperties dictionaryKeys](self, "dictionaryKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHDataStoreActivityProperties dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (unint64_t)currentMoveStreak
{
  return self->_currentMoveStreak;
}

- (void)setCurrentMoveStreak:(unint64_t)a3
{
  self->_currentMoveStreak = a3;
}

- (unint64_t)currentWeekMoveStreak
{
  return self->_currentWeekMoveStreak;
}

- (void)setCurrentWeekMoveStreak:(unint64_t)a3
{
  self->_currentWeekMoveStreak = a3;
}

- (unint64_t)currentMonthMoveStreak
{
  return self->_currentMonthMoveStreak;
}

- (void)setCurrentMonthMoveStreak:(unint64_t)a3
{
  self->_currentMonthMoveStreak = a3;
}

- (unint64_t)bestMoveStreak
{
  return self->_bestMoveStreak;
}

- (void)setBestMoveStreak:(unint64_t)a3
{
  self->_bestMoveStreak = a3;
}

- (unint64_t)totalMoveGoalsMade
{
  return self->_totalMoveGoalsMade;
}

- (void)setTotalMoveGoalsMade:(unint64_t)a3
{
  self->_totalMoveGoalsMade = a3;
}

- (unint64_t)totalMoveGoalsAttempted
{
  return self->_totalMoveGoalsAttempted;
}

- (void)setTotalMoveGoalsAttempted:(unint64_t)a3
{
  self->_totalMoveGoalsAttempted = a3;
}

- (double)bestMoveValue
{
  return self->_bestMoveValue;
}

- (void)setBestMoveValue:(double)a3
{
  self->_bestMoveValue = a3;
}

- (double)bestMoveGoalValue
{
  return self->_bestMoveGoalValue;
}

- (void)setBestMoveGoalValue:(double)a3
{
  self->_bestMoveGoalValue = a3;
}

- (double)bestMoveTimeValue
{
  return self->_bestMoveTimeValue;
}

- (void)setBestMoveTimeValue:(double)a3
{
  self->_bestMoveTimeValue = a3;
}

- (double)bestMoveTimeGoalValue
{
  return self->_bestMoveTimeGoalValue;
}

- (void)setBestMoveTimeGoalValue:(double)a3
{
  self->_bestMoveTimeGoalValue = a3;
}

- (unint64_t)currentExerciseStreak
{
  return self->_currentExerciseStreak;
}

- (void)setCurrentExerciseStreak:(unint64_t)a3
{
  self->_currentExerciseStreak = a3;
}

- (unint64_t)currentWeekExerciseStreak
{
  return self->_currentWeekExerciseStreak;
}

- (void)setCurrentWeekExerciseStreak:(unint64_t)a3
{
  self->_currentWeekExerciseStreak = a3;
}

- (unint64_t)bestExerciseStreak
{
  return self->_bestExerciseStreak;
}

- (void)setBestExerciseStreak:(unint64_t)a3
{
  self->_bestExerciseStreak = a3;
}

- (unint64_t)totalExerciseGoalsMade
{
  return self->_totalExerciseGoalsMade;
}

- (void)setTotalExerciseGoalsMade:(unint64_t)a3
{
  self->_totalExerciseGoalsMade = a3;
}

- (unint64_t)totalExerciseGoalsAttempted
{
  return self->_totalExerciseGoalsAttempted;
}

- (void)setTotalExerciseGoalsAttempted:(unint64_t)a3
{
  self->_totalExerciseGoalsAttempted = a3;
}

- (double)bestExerciseValue
{
  return self->_bestExerciseValue;
}

- (void)setBestExerciseValue:(double)a3
{
  self->_bestExerciseValue = a3;
}

- (double)bestExerciseGoalValue
{
  return self->_bestExerciseGoalValue;
}

- (void)setBestExerciseGoalValue:(double)a3
{
  self->_bestExerciseGoalValue = a3;
}

- (unint64_t)currentStandStreak
{
  return self->_currentStandStreak;
}

- (void)setCurrentStandStreak:(unint64_t)a3
{
  self->_currentStandStreak = a3;
}

- (unint64_t)currentWeekStandStreak
{
  return self->_currentWeekStandStreak;
}

- (void)setCurrentWeekStandStreak:(unint64_t)a3
{
  self->_currentWeekStandStreak = a3;
}

- (unint64_t)bestStandStreak
{
  return self->_bestStandStreak;
}

- (void)setBestStandStreak:(unint64_t)a3
{
  self->_bestStandStreak = a3;
}

- (unint64_t)totalStandGoalsMade
{
  return self->_totalStandGoalsMade;
}

- (void)setTotalStandGoalsMade:(unint64_t)a3
{
  self->_totalStandGoalsMade = a3;
}

- (unint64_t)totalStandGoalsAttempted
{
  return self->_totalStandGoalsAttempted;
}

- (void)setTotalStandGoalsAttempted:(unint64_t)a3
{
  self->_totalStandGoalsAttempted = a3;
}

- (unint64_t)bestStandValue
{
  return self->_bestStandValue;
}

- (void)setBestStandValue:(unint64_t)a3
{
  self->_bestStandValue = a3;
}

- (unint64_t)bestStandGoalValue
{
  return self->_bestStandGoalValue;
}

- (void)setBestStandGoalValue:(unint64_t)a3
{
  self->_bestStandGoalValue = a3;
}

- (unint64_t)lastStepCount
{
  return self->_lastStepCount;
}

- (void)setLastStepCount:(unint64_t)a3
{
  self->_lastStepCount = a3;
}

- (unint64_t)bestStepCount
{
  return self->_bestStepCount;
}

- (void)setBestStepCount:(unint64_t)a3
{
  self->_bestStepCount = a3;
}

- (void)setStoreValuesValidBeforeSummaryIndex:(int64_t)a3
{
  self->_storeValuesValidBeforeSummaryIndex = a3;
}

- (ACHDataStoreActivityProperties)previousValues
{
  return self->_previousValues;
}

- (void)setPreviousValues:(id)a3
{
  objc_storeStrong((id *)&self->_previousValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousValues, 0);
}

@end
