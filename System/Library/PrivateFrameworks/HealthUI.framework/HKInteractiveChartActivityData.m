@implementation HKInteractiveChartActivityData

- (BOOL)hasActivityGoal
{
  void *v3;
  char v4;
  BOOL v5;

  switch(-[HKInteractiveChartActivityData activityValue](self, "activityValue"))
  {
    case 0:
    case 4:
      -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_hasEnergyBurnedGoal");
      goto LABEL_6;
    case 1:
    case 5:
      -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_hasAppleMoveMinutesGoal");
      goto LABEL_6;
    case 2:
    case 6:
      -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_hasExerciseGoal");
      goto LABEL_6;
    case 3:
    case 7:
      -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_hasStandHoursGoal");
LABEL_6:
      v5 = v4;

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)activityValueGoalMet
{
  BOOL v2;
  void *v4;
  int v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_useHourlyGoalComparison");

  v6 = -[HKInteractiveChartActivityData activityValue](self, "activityValue");
  if (!v5)
  {
    switch(v6)
    {
      case 0:
      case 4:
        -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_activeEnergyCompletionPercentage");
        goto LABEL_10;
      case 1:
      case 5:
        -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_moveMinutesCompletionPercentage");
        goto LABEL_10;
      case 2:
      case 6:
        -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_exerciseTimeCompletionPercentage");
        goto LABEL_10;
      case 3:
      case 7:
        -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_standHoursCompletionPercentage");
LABEL_10:
        v2 = v11 >= 1.0;
        goto LABEL_11;
      default:
        return v2;
    }
  }
  if ((v6 | 4) == 7)
  {
    -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appleStandHours");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v9);
    v2 = v10 > 0.0;

LABEL_11:
  }
  else
  {
    return 1;
  }
  return v2;
}

- (BOOL)activityPaused
{
  void *v2;
  char v3;

  -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HKInteractiveChartActivityData activitySummaryData](self, "activitySummaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HKActivitySummary)activitySummaryData
{
  return self->_activitySummaryData;
}

- (void)setActivitySummaryData:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryData, a3);
}

- (int64_t)activityValue
{
  return self->_activityValue;
}

- (void)setActivityValue:(int64_t)a3
{
  self->_activityValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummaryData, 0);
}

@end
