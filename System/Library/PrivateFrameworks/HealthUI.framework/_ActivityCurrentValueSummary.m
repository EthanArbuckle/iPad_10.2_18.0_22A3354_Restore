@implementation _ActivityCurrentValueSummary

- (_ActivityCurrentValueSummary)initWithTimeScope:(int64_t)a3
{
  _ActivityCurrentValueSummary *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ActivityCurrentValueSummary;
  result = -[_ActivityCurrentValueSummary init](&v5, sel_init);
  if (result)
  {
    result->_timeScope = a3;
    result->_collatedSummaryCount = 0.0;
    result->_pausedSummaryCount = 0.0;
  }
  return result;
}

- (void)combineWithActivitySummary:(id)a3
{
  double v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  id v49;

  v49 = a3;
  if (objc_msgSend(v49, "isPaused"))
  {
    self->_pausedSummaryCount = self->_pausedSummaryCount + 1.0;
  }
  else
  {
    -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
    if (v4 == 0.0)
    {
      objc_msgSend(v49, "_startDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _setStartDate:](self, "_setStartDate:", v5);

      objc_msgSend(v49, "_endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _setEndDate:](self, "_setEndDate:", v6);

      objc_msgSend(v49, "_gregorianDateComponents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setCollationDateComponents:](self, "setCollationDateComponents:", v7);

      -[_ActivityCurrentValueSummary setActivityMoveMode:](self, "setActivityMoveMode:", objc_msgSend(v49, "activityMoveMode"));
      objc_msgSend(v49, "activeEnergyBurned");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setActiveEnergyBurned:](self, "setActiveEnergyBurned:", v8);

      objc_msgSend(v49, "appleMoveTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleMoveTime:](self, "setAppleMoveTime:", v9);

      objc_msgSend(v49, "appleExerciseTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleExerciseTime:](self, "setAppleExerciseTime:", v10);

      objc_msgSend(v49, "appleStandHours");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleStandHours:](self, "setAppleStandHours:", v11);

      objc_msgSend(v49, "activeEnergyBurnedGoal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setActiveEnergyBurnedGoal:](self, "setActiveEnergyBurnedGoal:", v12);

      objc_msgSend(v49, "appleMoveTimeGoal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleMoveTimeGoal:](self, "setAppleMoveTimeGoal:", v13);

      objc_msgSend(v49, "appleExerciseTimeGoal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleExerciseTimeGoal:](self, "setAppleExerciseTimeGoal:", v14);

      objc_msgSend(v49, "appleStandHoursGoal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleStandHoursGoal:](self, "setAppleStandHoursGoal:", v15);

      objc_msgSend(v49, "exerciseTimeGoal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setExerciseTimeGoal:](self, "setExerciseTimeGoal:", v16);

      objc_msgSend(v49, "standHoursGoal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setStandHoursGoal:](self, "setStandHoursGoal:", v17);
    }
    else
    {
      objc_msgSend(v49, "_endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _setEndDate:](self, "_setEndDate:", v18);

      -[_ActivityCurrentValueSummary setActivityMoveMode:](self, "setActivityMoveMode:", objc_msgSend(v49, "activityMoveMode"));
      -[_ActivityCurrentValueSummary activeEnergyBurned](self, "activeEnergyBurned");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "activeEnergyBurned");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _addQuantity:toQuantity:](self, "_addQuantity:toQuantity:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setActiveEnergyBurned:](self, "setActiveEnergyBurned:", v21);

      -[_ActivityCurrentValueSummary appleMoveTime](self, "appleMoveTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "appleMoveTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _addQuantity:toQuantity:](self, "_addQuantity:toQuantity:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleMoveTime:](self, "setAppleMoveTime:", v24);

      -[_ActivityCurrentValueSummary appleExerciseTime](self, "appleExerciseTime");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "appleExerciseTime");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _addQuantity:toQuantity:](self, "_addQuantity:toQuantity:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleExerciseTime:](self, "setAppleExerciseTime:", v27);

      -[_ActivityCurrentValueSummary appleStandHours](self, "appleStandHours");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "appleStandHours");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _addQuantity:toQuantity:](self, "_addQuantity:toQuantity:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleStandHours:](self, "setAppleStandHours:", v30);

      -[_ActivityCurrentValueSummary activeEnergyBurnedGoal](self, "activeEnergyBurnedGoal");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "activeEnergyBurnedGoal");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _maxQuantity:otherQuantity:](self, "_maxQuantity:otherQuantity:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setActiveEnergyBurnedGoal:](self, "setActiveEnergyBurnedGoal:", v33);

      -[_ActivityCurrentValueSummary appleMoveTimeGoal](self, "appleMoveTimeGoal");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "appleMoveTimeGoal");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _maxQuantity:otherQuantity:](self, "_maxQuantity:otherQuantity:", v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleMoveTimeGoal:](self, "setAppleMoveTimeGoal:", v36);

      -[_ActivityCurrentValueSummary appleExerciseTimeGoal](self, "appleExerciseTimeGoal");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "appleExerciseTimeGoal");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _maxQuantity:otherQuantity:](self, "_maxQuantity:otherQuantity:", v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleExerciseTimeGoal:](self, "setAppleExerciseTimeGoal:", v39);

      -[_ActivityCurrentValueSummary appleStandHoursGoal](self, "appleStandHoursGoal");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "appleStandHoursGoal");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _maxQuantity:otherQuantity:](self, "_maxQuantity:otherQuantity:", v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleStandHoursGoal:](self, "setAppleStandHoursGoal:", v42);

      -[_ActivityCurrentValueSummary exerciseTimeGoal](self, "exerciseTimeGoal");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "exerciseTimeGoal");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _maxQuantity:otherQuantity:](self, "_maxQuantity:otherQuantity:", v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setExerciseTimeGoal:](self, "setExerciseTimeGoal:", v45);

      -[_ActivityCurrentValueSummary standHoursGoal](self, "standHoursGoal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "standHoursGoal");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary _maxQuantity:otherQuantity:](self, "_maxQuantity:otherQuantity:", v17, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setStandHoursGoal:](self, "setStandHoursGoal:", v47);

    }
    -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
    -[_ActivityCurrentValueSummary setCollatedSummaryCount:](self, "setCollatedSummaryCount:", v48 + 1.0);
  }

}

- (id)dateComponentsForCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = a3;
  -[_ActivityCurrentValueSummary collationDateComponents](self, "collationDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    -[_ActivityCurrentValueSummary collationDateComponents](self, "collationDateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v8, "hk_translateDateComponentsToCalendar:calendarUnits:", v4, *MEMORY[0x1E0CB73B0]);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v10;
    }
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  }

  return v9;
}

- (void)finishCollatingSummaryWithGraphView:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (-[_ActivityCurrentValueSummary timeScope](self, "timeScope") != 6
    && -[_ActivityCurrentValueSummary timeScope](self, "timeScope") != 7)
  {
    -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
    if (v4 > 0.0)
    {
      -[_ActivityCurrentValueSummary activeEnergyBurned](self, "activeEnergyBurned");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
      -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setActiveEnergyBurned:](self, "setActiveEnergyBurned:", v6);

      -[_ActivityCurrentValueSummary appleMoveTime](self, "appleMoveTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
      -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleMoveTime:](self, "setAppleMoveTime:", v8);

      -[_ActivityCurrentValueSummary appleExerciseTime](self, "appleExerciseTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
      -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleExerciseTime:](self, "setAppleExerciseTime:", v10);

      -[_ActivityCurrentValueSummary appleStandHours](self, "appleStandHours");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
      -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityCurrentValueSummary setAppleStandHours:](self, "setAppleStandHours:", v12);

    }
  }
  -[_ActivityCurrentValueSummary collatedSummaryCount](self, "collatedSummaryCount");
  if (v13 == 0.0)
  {
    -[_ActivityCurrentValueSummary pausedSummaryCount](self, "pausedSummaryCount");
    if (v14 > 0.0)
      -[_ActivityCurrentValueSummary setPaused:](self, "setPaused:", 1);
  }
  objc_msgSend(v18, "effectiveVisibleRangeCadence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityCurrentValueSummary _setStartDate:](self, "_setStartDate:", v16);

  objc_msgSend(v15, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityCurrentValueSummary _setEndDate:](self, "_setEndDate:", v17);

}

- (id)_addQuantity:(id)a3 toQuantity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  v9 = v8;

  objc_msgSend(v5, "doubleValueForUnit:", v7);
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v7, v9 + v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_divideQuantity:(id)a3 divisor:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "_unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = v7;

  if (a4 == 0.0)
  {
    v11 = v5;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v5, "_unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, v8 / a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_maxQuantity:(id)a3 otherQuantity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  v9 = v8;

  objc_msgSend(v5, "doubleValueForUnit:", v7);
  v11 = v10;

  if (v9 >= v11)
    v12 = v9;
  else
    v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDateComponents)collationDateComponents
{
  return self->_collationDateComponents;
}

- (void)setCollationDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_collationDateComponents, a3);
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (double)collatedSummaryCount
{
  return self->_collatedSummaryCount;
}

- (void)setCollatedSummaryCount:(double)a3
{
  self->_collatedSummaryCount = a3;
}

- (double)pausedSummaryCount
{
  return self->_pausedSummaryCount;
}

- (void)setPausedSummaryCount:(double)a3
{
  self->_pausedSummaryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collationDateComponents, 0);
}

@end
