@implementation FIUIWorkoutStatistics

- (FIUIWorkoutStatistics)initWithWorkouts:(id)a3
{
  id v4;
  FIUIWorkoutStatistics *v5;
  uint64_t v6;
  NSArray *workouts;
  void *v8;
  void *v9;
  uint64_t v10;
  HKQuantity *totalDistance;
  void *v12;
  void *v13;
  uint64_t v14;
  HKQuantity *averageDistance;
  void *v16;
  void *v17;
  uint64_t v18;
  HKQuantity *totalActiveEnergyBurn;
  void *v20;
  void *v21;
  uint64_t v22;
  HKQuantity *averageActiveEnergyBurn;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FIUIWorkoutStatistics;
  v5 = -[FIUIWorkoutStatistics init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    workouts = v5->_workouts;
    v5->_workouts = (NSArray *)v6;

    v5->_workoutsWithEnergyBurned = 0;
    v5->_workoutsWithDistance = 0;
    v8 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    totalDistance = v5->_totalDistance;
    v5->_totalDistance = (HKQuantity *)v10;

    v12 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, 0.0);
    v14 = objc_claimAutoreleasedReturnValue();
    averageDistance = v5->_averageDistance;
    v5->_averageDistance = (HKQuantity *)v14;

    v16 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17, 0.0);
    v18 = objc_claimAutoreleasedReturnValue();
    totalActiveEnergyBurn = v5->_totalActiveEnergyBurn;
    v5->_totalActiveEnergyBurn = (HKQuantity *)v18;

    v20 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "quantityWithUnit:doubleValue:", v21, 0.0);
    v22 = objc_claimAutoreleasedReturnValue();
    averageActiveEnergyBurn = v5->_averageActiveEnergyBurn;
    v5->_averageActiveEnergyBurn = (HKQuantity *)v22;

    v5->_totalWorkoutDuration = 0.0;
    v5->_averageWorkoutDuration = 0.0;
    -[FIUIWorkoutStatistics _calculateStats](v5, "_calculateStats");
  }

  return v5;
}

- (FIUIWorkoutStatistics)init
{

  return 0;
}

- (unint64_t)workoutCount
{
  return -[NSArray count](self->_workouts, "count");
}

- (HKWorkout)mostRecentWorkout
{
  return (HKWorkout *)-[NSArray firstObject](self->_workouts, "firstObject");
}

- (void)_calculateStats
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *startOfMonth;
  double v16;
  void *v17;
  void *v18;
  HKQuantity *totalActiveEnergyBurn;
  void *v20;
  HKQuantity *v21;
  HKQuantity *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  HKQuantity *totalDistance;
  void *v28;
  HKQuantity *v29;
  HKQuantity *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = self->_workouts;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    v31 = *MEMORY[0x24BDD3340];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        -[NSArray firstObject](self->_workouts, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v9)
        {
          _CachedCurrentCalendar();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "components:fromDate:", 14, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          _CachedCurrentCalendar();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dateFromComponents:", v12);
          v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
          startOfMonth = self->_startOfMonth;
          self->_startOfMonth = v14;

        }
        objc_msgSend(v8, "duration");
        self->_totalWorkoutDuration = v16 + self->_totalWorkoutDuration;
        if (objc_msgSend(v8, "_activityMoveMode") != 2)
        {
          ++self->_workoutsWithEnergyBurned;
          objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v31);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "statisticsForType:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          totalActiveEnergyBurn = self->_totalActiveEnergyBurn;
          objc_msgSend(v18, "sumQuantity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKQuantity _quantityByAddingQuantity:](totalActiveEnergyBurn, "_quantityByAddingQuantity:", v20);
          v21 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
          v22 = self->_totalActiveEnergyBurn;
          self->_totalActiveEnergyBurn = v21;

        }
        objc_msgSend(v8, "fiui_activityType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = FIUIDistanceTypeForActivityType(v23);
        if (v24)
        {
          ++self->_workoutsWithDistance;
          +[FIUIUnitManager quantityTypeForDistanceType:](FIUIUnitManager, "quantityTypeForDistanceType:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "statisticsForType:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          totalDistance = self->_totalDistance;
          objc_msgSend(v26, "sumQuantity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKQuantity _quantityByAddingQuantity:](totalDistance, "_quantityByAddingQuantity:", v28);
          v29 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
          v30 = self->_totalDistance;
          self->_totalDistance = v29;

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

  -[FIUIWorkoutStatistics _calculateAverages](self, "_calculateAverages");
}

- (void)_calculateAverages
{
  HKQuantity *totalActiveEnergyBurn;
  double v4;
  unint64_t workoutsWithEnergyBurned;
  double v6;
  void *v7;
  id v8;
  HKQuantity *v9;
  HKQuantity *averageActiveEnergyBurn;
  HKQuantity *totalDistance;
  double v12;
  unint64_t workoutsWithDistance;
  double v14;
  void *v15;
  HKQuantity *v16;
  HKQuantity *averageDistance;
  id v18;

  if (-[NSArray count](self->_workouts, "count"))
  {
    self->_averageWorkoutDuration = self->_totalWorkoutDuration / (double)-[NSArray count](self->_workouts, "count");
    totalActiveEnergyBurn = self->_totalActiveEnergyBurn;
    if (_InternalEnergyUnit_onceToken != -1)
      dispatch_once(&_InternalEnergyUnit_onceToken, &__block_literal_global_279);
    -[HKQuantity doubleValueForUnit:](totalActiveEnergyBurn, "doubleValueForUnit:", _InternalEnergyUnit___unit);
    if (v4 > 2.22044605e-16)
    {
      workoutsWithEnergyBurned = self->_workoutsWithEnergyBurned;
      if (workoutsWithEnergyBurned)
      {
        v6 = v4 / (double)workoutsWithEnergyBurned;
        v7 = (void *)MEMORY[0x24BDD3E50];
        if (_InternalEnergyUnit_onceToken != -1)
          dispatch_once(&_InternalEnergyUnit_onceToken, &__block_literal_global_279);
        v8 = (id)_InternalEnergyUnit___unit;
        objc_msgSend(v7, "quantityWithUnit:doubleValue:", v8, v6);
        v9 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
        averageActiveEnergyBurn = self->_averageActiveEnergyBurn;
        self->_averageActiveEnergyBurn = v9;

      }
    }
    totalDistance = self->_totalDistance;
    if (_InternalDistanceUnit_onceToken != -1)
      dispatch_once(&_InternalDistanceUnit_onceToken, &__block_literal_global_280);
    -[HKQuantity doubleValueForUnit:](totalDistance, "doubleValueForUnit:", _InternalDistanceUnit___unit);
    if (v12 > 2.22044605e-16)
    {
      workoutsWithDistance = self->_workoutsWithDistance;
      if (workoutsWithDistance)
      {
        v14 = v12 / (double)workoutsWithDistance;
        v15 = (void *)MEMORY[0x24BDD3E50];
        if (_InternalDistanceUnit_onceToken != -1)
          dispatch_once(&_InternalDistanceUnit_onceToken, &__block_literal_global_280);
        v18 = (id)_InternalDistanceUnit___unit;
        objc_msgSend(v15, "quantityWithUnit:doubleValue:", v18, v14);
        v16 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
        averageDistance = self->_averageDistance;
        self->_averageDistance = v16;

      }
    }
  }
}

- (double)totalWorkoutDuration
{
  return self->_totalWorkoutDuration;
}

- (double)averageWorkoutDuration
{
  return self->_averageWorkoutDuration;
}

- (HKQuantity)totalActiveEnergyBurn
{
  return self->_totalActiveEnergyBurn;
}

- (HKQuantity)averageActiveEnergyBurn
{
  return self->_averageActiveEnergyBurn;
}

- (HKQuantity)totalDistance
{
  return self->_totalDistance;
}

- (HKQuantity)averageDistance
{
  return self->_averageDistance;
}

- (unint64_t)workoutsWithEnergyBurned
{
  return self->_workoutsWithEnergyBurned;
}

- (unint64_t)workoutsWithDistance
{
  return self->_workoutsWithDistance;
}

- (NSDate)startOfMonth
{
  return self->_startOfMonth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startOfMonth, 0);
  objc_storeStrong((id *)&self->_averageDistance, 0);
  objc_storeStrong((id *)&self->_totalDistance, 0);
  objc_storeStrong((id *)&self->_averageActiveEnergyBurn, 0);
  objc_storeStrong((id *)&self->_totalActiveEnergyBurn, 0);
  objc_storeStrong((id *)&self->_workouts, 0);
}

+ (id)_monthFormatter
{
  if (_monthFormatter_onceToken != -1)
    dispatch_once(&_monthFormatter_onceToken, &__block_literal_global_10);
  return (id)_monthFormatter___formatter;
}

void __51__FIUIWorkoutStatistics_ViewModel___monthFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_monthFormatter___formatter;
  _monthFormatter___formatter = (uint64_t)v0;

  objc_msgSend((id)_monthFormatter___formatter, "setFormattingContext:", 2);
  v2 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFormatFromTemplate:options:locale:", CFSTR("MMMM"), 0, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_monthFormatter___formatter, "setDateFormat:", v3);

}

- (id)formattedMonth
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_monthFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_startOfMonth);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)formattedWorkoutDurationWithFormattingManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[FIUIWorkoutStatistics formattedTotalWorkoutDurationWithFormattingManager:](self, "formattedTotalWorkoutDurationWithFormattingManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutStatistics formattedAverageWorkoutDurationWithFormattingManager:](self, "formattedAverageWorkoutDurationWithFormattingManager:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STATISTICS_FORMAT_%@_%@"), &stru_24CF339D8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v10, v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)formattedActiveEnergyBurnWithFormattingManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[FIUIWorkoutStatistics formattedTotalActiveEnergyBurnWithFormattingManager:](self, "formattedTotalActiveEnergyBurnWithFormattingManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutStatistics formattedAverageActiveEnergyBurnWithFormattingManager:](self, "formattedAverageActiveEnergyBurnWithFormattingManager:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STATISTICS_FORMAT_%@_%@"), &stru_24CF339D8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v10, v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)formattedPaceWithFormattingManager:(id)a3 distanceType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "localizedPaceAndUnitWithDistance:overDuration:paceFormat:distanceType:unitStyle:decimalTrimmingMode:", self->_totalDistance, FIUIPaceFormatForDistanceType(a4), a4, 1, 2, self->_totalWorkoutDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedUppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)formattedTotalWorkoutDurationWithFormattingManager:(id)a3
{
  return -[FIUIWorkoutStatistics _formattedDuration:formattingManager:](self, "_formattedDuration:formattingManager:", a3, self->_totalWorkoutDuration);
}

- (id)formattedAverageWorkoutDurationWithFormattingManager:(id)a3
{
  return -[FIUIWorkoutStatistics _formattedDuration:formattingManager:](self, "_formattedDuration:formattingManager:", a3, self->_averageWorkoutDuration);
}

- (id)_formattedDuration:(double)a3 formattingManager:(id)a4
{
  return (id)objc_msgSend(a4, "stringWithDuration:durationFormat:", 2, a3);
}

- (id)formattedTotalActiveEnergyBurnWithFormattingManager:(id)a3
{
  return -[FIUIWorkoutStatistics _formattedEnergyBurn:formattingManager:](self, "_formattedEnergyBurn:formattingManager:", self->_totalActiveEnergyBurn, a3);
}

- (id)formattedAverageActiveEnergyBurnWithFormattingManager:(id)a3
{
  return -[FIUIWorkoutStatistics _formattedEnergyBurn:formattingManager:](self, "_formattedEnergyBurn:formattingManager:", self->_averageActiveEnergyBurn, a3);
}

- (id)_formattedEnergyBurn:(id)a3 formattingManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(v5, "localizedStringWithActiveEnergy:unitStyle:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STATISTICS_UNIT_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedShortActiveEnergyUnitString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v9, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedUppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)formattedDistanceWithFormattingManager:(id)a3 distanceType:(unint64_t)a4 amountType:(unint64_t)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (a5)
  {
    if (a5 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = 56;
  }
  else
  {
    v7 = 48;
  }
  v8 = *(id *)((char *)&self->super.isa + v7);
LABEL_7:
  v9 = (void *)MEMORY[0x24BDD4048];
  v10 = a3;
  objc_msgSend(v9, "meterUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v11);
  objc_msgSend(v10, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", a4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v13);
  objc_msgSend(v10, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", a4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_24CF339D8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STATISTICS_UNIT_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v21, v14, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "localizedUppercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)simpleWorkoutCount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FIUIWorkoutStatistics workoutCount](self, "workoutCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
