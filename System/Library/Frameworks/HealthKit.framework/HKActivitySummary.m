@implementation HKActivitySummary

- (void)encodeWithCoder:(id)a3
{
  int64_t activitySummaryIndex;
  HKQuantity *activeEnergyBurned;
  void *v6;
  HKQuantity *appleMoveTime;
  void *v8;
  HKQuantity *appleExerciseTime;
  void *v10;
  HKQuantity *appleStandHours;
  void *v12;
  HKQuantity *distanceWalkingRunning;
  void *v14;
  HKQuantity *stepCount;
  void *v16;
  HKQuantity *activeEnergyBurnedGoal;
  void *v18;
  HKQuantity *appleMoveTimeGoal;
  void *v20;
  HKQuantity *appleExerciseTimeGoal;
  void *v22;
  HKQuantity *appleStandHoursGoal;
  void *v24;
  HKQuantity *deepBreathingDuration;
  void *v26;
  HKQuantity *pushCount;
  void *v28;
  HKQuantity *flightsClimbed;
  void *v30;
  id v31;

  activitySummaryIndex = self->_activitySummaryIndex;
  v31 = a3;
  objc_msgSend(v31, "encodeInt64:forKey:", activitySummaryIndex, CFSTR("index"));
  activeEnergyBurned = self->_activeEnergyBurned;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", activeEnergyBurned, v31, CFSTR("activeEnergy"), v6);

  appleMoveTime = self->_appleMoveTime;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", appleMoveTime, v31, CFSTR("moveTime"), v8);

  appleExerciseTime = self->_appleExerciseTime;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", appleExerciseTime, v31, CFSTR("exerciseTime"), v10);

  appleStandHours = self->_appleStandHours;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", appleStandHours, v31, CFSTR("standHours"), v12);

  distanceWalkingRunning = self->_distanceWalkingRunning;
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", distanceWalkingRunning, v31, CFSTR("distanceWalking"), v14);

  stepCount = self->_stepCount;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", stepCount, v31, CFSTR("stepCount"), v16);

  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", activeEnergyBurnedGoal, v31, CFSTR("energyBurnedGoal"), v18);

  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", appleMoveTimeGoal, v31, CFSTR("moveMinutesGoal"), v20);

  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", appleExerciseTimeGoal, v31, CFSTR("briskMinutesGoal"), v22);

  appleStandHoursGoal = self->_appleStandHoursGoal;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", appleStandHoursGoal, v31, CFSTR("activeHoursGoal"), v24);

  deepBreathingDuration = self->_deepBreathingDuration;
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", deepBreathingDuration, v31, CFSTR("deepBreathingDuration"), v26);

  pushCount = self->_pushCount;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", pushCount, v31, CFSTR("pushCount"), v28);

  flightsClimbed = self->_flightsClimbed;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _encodeQuantity:withCoder:key:unit:](self, "_encodeQuantity:withCoder:key:unit:", flightsClimbed, v31, CFSTR("flightsClimbed"), v30);

  objc_msgSend(v31, "encodeInteger:forKey:", self->_wheelchairUse, CFSTR("wheelchairUse"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_dailyEnergyBurnedStatistics, CFSTR("dailyEnergyBurnedStatistics"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_dailyMoveTimeStatistics, CFSTR("dailyMoveMinutesStatistics"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_dailyBriskMinutesStatistics, CFSTR("dailyBriskMinutesStatistics"));
  objc_msgSend(v31, "encodeBool:forKey:", self->_dataLoading, CFSTR("dataLoading"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_energyBurnedGoalDate, CFSTR("energyBurnedGoalDate"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_moveTimeGoalDate, CFSTR("moveTimeGoalDate"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_briskMinutesGoalDate, CFSTR("briskMinutesGoalDate"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_activeHoursGoalDate, CFSTR("activeHoursGoalDate"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v31, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v31, "encodeInteger:forKey:", self->_activityMoveMode, CFSTR("activityMoveMode"));
  objc_msgSend(v31, "encodeBool:forKey:", self->_paused, CFSTR("paused"));

}

- (void)_encodeQuantity:(id)a3 withCoder:(id)a4 key:(id)a5 unit:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a4;
    objc_msgSend(a3, "doubleValueForUnit:", a6);
    objc_msgSend(v10, "encodeDouble:forKey:", v9);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKActivitySummary *v4;
  uint64_t v5;
  NSArray *dailyEnergyBurnedStatistics;
  uint64_t v7;
  NSArray *dailyMoveTimeStatistics;
  uint64_t v9;
  NSArray *dailyBriskMinutesStatistics;

  v4 = objc_alloc_init(HKActivitySummary);
  -[HKActivitySummary _setActivitySummaryIndex:](v4, "_setActivitySummaryIndex:", self->_activitySummaryIndex);
  objc_storeStrong((id *)&v4->_activeEnergyBurned, self->_activeEnergyBurned);
  objc_storeStrong((id *)&v4->_appleMoveTime, self->_appleMoveTime);
  objc_storeStrong((id *)&v4->_appleExerciseTime, self->_appleExerciseTime);
  objc_storeStrong((id *)&v4->_appleStandHours, self->_appleStandHours);
  objc_storeStrong((id *)&v4->_distanceWalkingRunning, self->_distanceWalkingRunning);
  objc_storeStrong((id *)&v4->_stepCount, self->_stepCount);
  objc_storeStrong((id *)&v4->_activeEnergyBurnedGoal, self->_activeEnergyBurnedGoal);
  objc_storeStrong((id *)&v4->_appleMoveTimeGoal, self->_appleMoveTimeGoal);
  objc_storeStrong((id *)&v4->_appleExerciseTimeGoal, self->_appleExerciseTimeGoal);
  objc_storeStrong((id *)&v4->_appleStandHoursGoal, self->_appleStandHoursGoal);
  objc_storeStrong((id *)&v4->_deepBreathingDuration, self->_deepBreathingDuration);
  objc_storeStrong((id *)&v4->_pushCount, self->_pushCount);
  v4->_wheelchairUse = self->_wheelchairUse;
  objc_storeStrong((id *)&v4->_creationDate, self->_creationDate);
  objc_storeStrong((id *)&v4->_startDate, self->_startDate);
  objc_storeStrong((id *)&v4->_endDate, self->_endDate);
  objc_storeStrong((id *)&v4->_energyBurnedGoalDate, self->_energyBurnedGoalDate);
  objc_storeStrong((id *)&v4->_moveTimeGoalDate, self->_moveTimeGoalDate);
  objc_storeStrong((id *)&v4->_flightsClimbed, self->_flightsClimbed);
  v5 = -[NSArray copy](self->_dailyEnergyBurnedStatistics, "copy");
  dailyEnergyBurnedStatistics = v4->_dailyEnergyBurnedStatistics;
  v4->_dailyEnergyBurnedStatistics = (NSArray *)v5;

  v7 = -[NSArray copy](self->_dailyMoveTimeStatistics, "copy");
  dailyMoveTimeStatistics = v4->_dailyMoveTimeStatistics;
  v4->_dailyMoveTimeStatistics = (NSArray *)v7;

  v9 = -[NSArray copy](self->_dailyBriskMinutesStatistics, "copy");
  dailyBriskMinutesStatistics = v4->_dailyBriskMinutesStatistics;
  v4->_dailyBriskMinutesStatistics = (NSArray *)v9;

  v4->_activityMoveMode = self->_activityMoveMode;
  v4->_paused = self->_paused;
  v4->_dataLoading = self->_dataLoading;
  return v4;
}

- (void)_setActivitySummaryIndex:(int64_t)a3
{
  NSDateComponents *v4;
  NSDateComponents *dateComponents;

  self->_activitySummaryIndex = a3;
  _HKActivityCacheDateComponentsFromCacheIndex(a3);
  v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  dateComponents = self->_dateComponents;
  self->_dateComponents = v4;

}

- (BOOL)_allFieldsAreEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v21;
  id v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  void *v52;
  _BOOL4 v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  BOOL v58;
  _BOOL8 v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  _BOOL4 v63;
  uint64_t v64;
  _BOOL4 v65;
  uint64_t v66;
  void *v67;
  _BOOL4 v68;
  _BOOL4 v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  _BOOL4 v74;
  uint64_t v75;
  void *v76;
  _BOOL4 v77;
  _BOOL4 v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  int v93;
  unsigned int v94;
  int v95;
  _BOOL4 v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  _BOOL4 v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  unint64_t v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  int64_t v167;
  HKActivityMoveMode v168;
  _BYTE v169[12];
  _BOOL4 v170;
  _QWORD v171[4];

  v4 = a3;
  v170 = -[HKActivitySummary isEqual:](self, "isEqual:", v4);
  if (!v170)
  {
    v17 = 0;
    v164 = 0;
    v165 = 0;
    v162 = 0;
    v163 = 0;
    v161 = 0;
    v9 = 0;
    v10 = 0;
    memset(v169, 0, sizeof(v169));
    v159 = 0;
    v11 = 0;
    memset(v171, 0, sizeof(v171));
    v160 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v18 = 0;
    v19 = 0;
    LOBYTE(v166) = 0;
    goto LABEL_7;
  }
  -[HKActivitySummary distanceWalkingRunning](self, "distanceWalkingRunning");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceWalkingRunning");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = (void *)v6;
  HIDWORD(v171[3]) = v6 != (_QWORD)v155;
  if ((void *)v6 != v155)
  {
    objc_msgSend(v4, "distanceWalkingRunning");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v152 = 0;
      v164 = 0;
      v165 = 0;
      v162 = 0;
      v163 = 0;
      v161 = 0;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v171, 0, 28);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      HIDWORD(v171[3]) = 1;
      goto LABEL_7;
    }
    v152 = (void *)v7;
    -[HKActivitySummary distanceWalkingRunning](self, "distanceWalkingRunning");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distanceWalkingRunning");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v8;
    if (!objc_msgSend(v8, "isEqual:"))
    {
      v163 = 0;
      v164 = 0;
      v161 = 0;
      v162 = 0;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v171, 0, 28);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      HIDWORD(v171[3]) = 1;
      v165 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary stepCount](self, "stepCount");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stepCount");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 != (_QWORD)v150;
  v151 = (void *)v32;
  if ((void *)v32 != v150)
  {
    objc_msgSend(v4, "stepCount");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v147 = 0;
      v163 = 0;
      v164 = 0;
      v161 = 0;
      v162 = 0;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v171, 0, 20);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      *(_QWORD *)((char *)&v171[2] + 4) = 1;
      goto LABEL_7;
    }
    v147 = (void *)v34;
    -[HKActivitySummary stepCount](self, "stepCount");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepCount");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v162 = 0;
      v163 = 0;
      v161 = 0;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v171, 0, 20);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      *(_QWORD *)((char *)&v171[2] + 4) = 1;
      v164 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _deepBreathingDuration](self, "_deepBreathingDuration");
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deepBreathingDuration");
  v37 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v171[2]) = v33;
  LODWORD(v171[3]) = v36 != v37;
  v145 = (void *)v37;
  v146 = (void *)v36;
  if (v36 != v37)
  {
    objc_msgSend(v4, "_deepBreathingDuration");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      v142 = 0;
      v162 = 0;
      v163 = 0;
      v161 = 0;
      v47 = v33;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v171, 0, 20);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v5 = HIDWORD(v171[3]);
      v164 = v47 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      LODWORD(v171[3]) = 1;
      goto LABEL_7;
    }
    v142 = (void *)v38;
    -[HKActivitySummary _deepBreathingDuration](self, "_deepBreathingDuration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deepBreathingDuration");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      v161 = 0;
      v162 = 0;
      v40 = v33;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v171, 0, 20);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v5 = HIDWORD(v171[3]);
      v164 = v40 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      LODWORD(v171[3]) = 1;
      v163 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _startDate](self, "_startDate");
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_startDate");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = v41 != v42;
  v140 = (void *)v42;
  v141 = (void *)v41;
  if (v41 != v42)
  {
    objc_msgSend(v4, "_startDate");
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      v158 = 0;
      v161 = 0;
      v162 = 0;
      v54 = v33;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v164 = v54 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v5 = LODWORD(v171[3]);
      v163 = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      goto LABEL_7;
    }
    v158 = (void *)v44;
    -[HKActivitySummary _startDate](self, "_startDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_startDate");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v45;
    if (!objc_msgSend(v45, "isEqual:"))
    {
      v161 = 0;
      v46 = v33;
      v9 = 0;
      v10 = 0;
      memset(v169, 0, sizeof(v169));
      v159 = 0;
      v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v164 = v46 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v5 = LODWORD(v171[3]);
      v163 = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      v162 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _endDate](self, "_endDate");
  v48 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endDate");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v48 != v49;
  LODWORD(v171[2]) = v43;
  v136 = (void *)v49;
  v137 = (void *)v48;
  if (v48 != v49)
  {
    objc_msgSend(v4, "_endDate");
    v51 = objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      v157 = 0;
      v161 = 0;
      *(_QWORD *)v169 = 0;
      v63 = v33;
      v9 = 0;
      v10 = 0;
      v159 = 0;
      v5 = v43;
      v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v164 = v63 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = v5 | 0x100000000;
      *(_DWORD *)&v169[8] = 1;
      goto LABEL_7;
    }
    v157 = (void *)v51;
    -[HKActivitySummary _endDate](self, "_endDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_endDate");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v52;
    if (!objc_msgSend(v52, "isEqual:"))
    {
      *(_QWORD *)v169 = 0;
      v53 = v33;
      v9 = 0;
      v10 = 0;
      v159 = 0;
      v5 = v43;
      v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v164 = v53 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = v5 | 0x100000000;
      *(_DWORD *)&v169[8] = 1;
      v161 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _creationDate](self, "_creationDate");
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_creationDate");
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v55;
  v58 = v55 == v56;
  v59 = v55 != v56;
  *(_DWORD *)&v169[8] = v50;
  v132 = (void *)v56;
  v133 = v57;
  if (!v58)
  {
    objc_msgSend(v4, "_creationDate");
    v60 = objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      v129 = 0;
      v69 = v33;
      v9 = 0;
      *(_QWORD *)v169 = 0x100000000;
      v159 = 0;
      v5 = v43;
      v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      v70 = v50;
      v10 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v164 = v69 | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = v5 | 0x100000000;
      v161 = v70 | 0x100000000;
      goto LABEL_7;
    }
    v129 = (void *)v60;
    -[HKActivitySummary _creationDate](self, "_creationDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_creationDate");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v61;
    if (!objc_msgSend(v61, "isEqual:"))
    {
      *(_QWORD *)v169 = 0x100000000;
      v159 = 0;
      v62 = v43;
      v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      v5 = v50;
      v10 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = v62 | 0x100000000;
      v161 = v5 | 0x100000000;
      v9 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _energyBurnedGoalDate](self, "_energyBurnedGoalDate");
  v64 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_energyBurnedGoalDate");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)v64;
  v58 = v64 == (_QWORD)v127;
  v65 = v64 != (_QWORD)v127;
  *(_DWORD *)&v169[4] = v59;
  if (!v58)
  {
    objc_msgSend(v4, "_energyBurnedGoalDate");
    v66 = objc_claimAutoreleasedReturnValue();
    if (!v66)
    {
      v124 = 0;
      v159 = 0;
      v77 = v43;
      v171[0] = 0;
      v171[1] = 0;
      v5 = v50;
      v160 = 0;
      v78 = v59;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v162 = v77 | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v9 = v78;
      v10 = 1;
      *(_DWORD *)v169 = 1;
      goto LABEL_7;
    }
    v124 = (void *)v66;
    -[HKActivitySummary _energyBurnedGoalDate](self, "_energyBurnedGoalDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_energyBurnedGoalDate");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v67;
    if (!objc_msgSend(v67, "isEqual:"))
    {
      v171[0] = 0;
      v171[1] = 0;
      v159 = 0x100000000;
      v5 = v50;
      v160 = 0;
      v68 = v59;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v9 = v68;
      v10 = 1;
      *(_DWORD *)v169 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _moveTimeGoalDate](self, "_moveTimeGoalDate");
  v71 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_moveTimeGoalDate");
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v71;
  v58 = v71 == v72;
  v74 = v71 != v72;
  v122 = (void *)v72;
  v123 = v73;
  *(_DWORD *)v169 = v65;
  if (v58)
  {
    HIDWORD(v171[1]) = v74;
  }
  else
  {
    objc_msgSend(v4, "_moveTimeGoalDate");
    v75 = objc_claimAutoreleasedReturnValue();
    if (!v75)
    {
      v119 = 0;
      LODWORD(v159) = 0;
      v160 = 0;
      *(_QWORD *)((char *)v171 + 4) = 0;
      v5 = v59;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LODWORD(v171[0]) = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      HIDWORD(v171[1]) = 1;
      goto LABEL_7;
    }
    HIDWORD(v171[1]) = v74;
    v119 = (void *)v75;
    -[HKActivitySummary _moveTimeGoalDate](self, "_moveTimeGoalDate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_moveTimeGoalDate");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v76;
    if (!objc_msgSend(v76, "isEqual:"))
    {
      v160 = 0;
      *(_QWORD *)((char *)v171 + 4) = 0;
      v5 = v59;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LODWORD(v171[0]) = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      HIDWORD(v171[1]) = 1;
      LODWORD(v159) = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _briskMinutesGoalDate](self, "_briskMinutesGoalDate");
  v79 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_briskMinutesGoalDate");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v171[1]) = v79 != (_QWORD)v117;
  v118 = (void *)v79;
  if ((void *)v79 != v117)
  {
    objc_msgSend(v4, "_briskMinutesGoalDate");
    v80 = objc_claimAutoreleasedReturnValue();
    if (!v80)
    {
      v114 = 0;
      v12 = 0;
      v171[0] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v5 = 1;
      v161 = v50 | 0x100000000;
      v10 = 1;
      v159 = __PAIR64__(v65, HIDWORD(v171[1]));
      v9 = v59;
      v11 = 1;
      v13 = 0;
      v160 = 1;
      LODWORD(v171[1]) = 1;
      goto LABEL_7;
    }
    v114 = (void *)v80;
    -[HKActivitySummary _briskMinutesGoalDate](self, "_briskMinutesGoalDate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_briskMinutesGoalDate");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v81;
    if (!objc_msgSend(v81, "isEqual:"))
    {
      v5 = 0;
      v171[0] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      LODWORD(v159) = HIDWORD(v171[1]);
      v13 = 0;
      v160 = 1;
      LODWORD(v171[1]) = 1;
      v12 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _activeHoursGoalDate](self, "_activeHoursGoalDate");
  v82 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_activeHoursGoalDate");
  v83 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v171[0]) = v82 != v83;
  v112 = (void *)v83;
  v113 = (void *)v82;
  if (v82 != v83)
  {
    objc_msgSend(v4, "_activeHoursGoalDate");
    v84 = objc_claimAutoreleasedReturnValue();
    if (!v84)
    {
      v109 = 0;
      v14 = 0;
      v15 = 0;
      v171[0] = 0x100000000;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v5 = LODWORD(v171[3]);
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      v160 = 1;
      v13 = 1;
      goto LABEL_7;
    }
    v109 = (void *)v84;
    -[HKActivitySummary _activeHoursGoalDate](self, "_activeHoursGoalDate");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_activeHoursGoalDate");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v85;
    if (!objc_msgSend(v85, "isEqual:"))
    {
      v15 = 0;
      v171[0] = 0x100000000;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v5 = LODWORD(v171[3]);
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      v160 = 1;
      v13 = 1;
      v14 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _pushCount](self, "_pushCount");
  v86 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pushCount");
  v87 = objc_claimAutoreleasedReturnValue();
  LODWORD(v171[0]) = v86 != v87;
  v107 = (void *)v87;
  v108 = (void *)v86;
  if (v86 != v87)
  {
    objc_msgSend(v4, "_pushCount");
    v88 = objc_claimAutoreleasedReturnValue();
    if (!v88)
    {
      v104 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v5 = LODWORD(v171[3]);
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      v160 = 1;
      v13 = 1;
      v14 = HIDWORD(v171[0]);
      v15 = 1;
      LODWORD(v171[0]) = 1;
      goto LABEL_7;
    }
    v104 = (void *)v88;
    -[HKActivitySummary _pushCount](self, "_pushCount");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_pushCount");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v89;
    if (!objc_msgSend(v89, "isEqual:"))
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v5 = LODWORD(v171[3]);
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v161 = v50 | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v10 = 1;
      HIDWORD(v159) = v65;
      v9 = v59;
      v11 = 1;
      v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      v160 = 1;
      v13 = 1;
      v14 = HIDWORD(v171[0]);
      v15 = 1;
      LODWORD(v171[0]) = 1;
      v16 = 1;
      goto LABEL_7;
    }
  }
  -[HKActivitySummary _flightsClimbed](self, "_flightsClimbed");
  v90 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_flightsClimbed");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v90 != (_QWORD)v102;
  v103 = (void *)v90;
  if ((void *)v90 == v102)
  {
    v94 = HIDWORD(v171[1]);
    goto LABEL_140;
  }
  objc_msgSend(v4, "_flightsClimbed");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v99 = (void *)v91;
    -[HKActivitySummary _flightsClimbed](self, "_flightsClimbed");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flightsClimbed");
    v97 = objc_claimAutoreleasedReturnValue();
    v98 = v92;
    v93 = objc_msgSend(v92, "isEqual:");
    v94 = HIDWORD(v171[1]);
    if (!v93)
    {
      LOBYTE(v166) = 0;
      v165 = HIDWORD(v171[3]) | 0x100000000;
      v164 = HIDWORD(v171[2]) | 0x100000000;
      v19 = 1;
      v163 = LODWORD(v171[3]) | 0x100000000;
      v160 = 1;
      v161 = v50 | 0x100000000;
      v162 = LODWORD(v171[2]) | 0x100000000;
      v10 = 1;
      v159 = __PAIR64__(v65, HIDWORD(v171[1]));
      v9 = v59;
      v11 = 1;
      v14 = HIDWORD(v171[0]);
      v12 = v171[1];
      v13 = 1;
      v15 = 1;
      v16 = v171[0];
      v17 = 1;
      v18 = 1;
LABEL_145:
      v5 = v97;
      goto LABEL_7;
    }
LABEL_140:
    v167 = -[HKActivitySummary _wheelchairUse](self, "_wheelchairUse");
    HIDWORD(v171[1]) = v94;
    if (v167 == objc_msgSend(v4, "_wheelchairUse")
      && (v168 = -[HKActivitySummary activityMoveMode](self, "activityMoveMode"),
          v168 == objc_msgSend(v4, "activityMoveMode"))
      && (v95 = -[HKActivitySummary isPaused](self, "isPaused"), v95 == objc_msgSend(v4, "isPaused")))
    {
      v96 = -[HKActivitySummary _isDataLoading](self, "_isDataLoading");
      v166 = v96 ^ objc_msgSend(v4, "_isDataLoading") ^ 1;
    }
    else
    {
      LOBYTE(v166) = 0;
    }
    v165 = HIDWORD(v171[3]) | 0x100000000;
    v164 = HIDWORD(v171[2]) | 0x100000000;
    v163 = LODWORD(v171[3]) | 0x100000000;
    v162 = LODWORD(v171[2]) | 0x100000000;
    v161 = v50 | 0x100000000;
    v10 = 1;
    v159 = __PAIR64__(v65, v94);
    v9 = v59;
    v11 = 1;
    v160 = 1;
    v14 = HIDWORD(v171[0]);
    v12 = v171[1];
    v13 = 1;
    v15 = 1;
    v16 = v171[0];
    v17 = 1;
    v18 = v154;
    v19 = v154;
    goto LABEL_145;
  }
  v99 = 0;
  v19 = 0;
  LOBYTE(v166) = 0;
  v165 = HIDWORD(v171[3]) | 0x100000000;
  v5 = LODWORD(v171[3]);
  v164 = HIDWORD(v171[2]) | 0x100000000;
  v163 = LODWORD(v171[3]) | 0x100000000;
  v161 = v50 | 0x100000000;
  v162 = LODWORD(v171[2]) | 0x100000000;
  v10 = 1;
  HIDWORD(v159) = v65;
  v9 = v59;
  v11 = 1;
  v12 = v171[1];
  LODWORD(v159) = HIDWORD(v171[1]);
  v160 = 1;
  v13 = 1;
  v16 = v171[0];
  v14 = HIDWORD(v171[0]);
  v15 = 1;
  v17 = 1;
  v18 = 1;
LABEL_7:
  if (v19)
  {
    v153 = v12;
    v21 = v14;
    v22 = v4;
    v23 = v13;
    v24 = v16;
    v25 = v11;
    v26 = v9;
    v27 = v15;
    v28 = v10;
    v29 = v17;
    v30 = v18;

    v31 = v30;
    v17 = v29;
    v10 = v28;
    v15 = v27;
    v9 = v26;
    v11 = v25;
    v16 = v24;
    v13 = v23;
    v4 = v22;
    v14 = v21;
    v12 = v153;
    if (!v31)
    {
LABEL_9:
      if (!v17)
        goto LABEL_10;
      goto LABEL_74;
    }
  }
  else if (!v18)
  {
    goto LABEL_9;
  }

  if (!v17)
  {
LABEL_10:
    if (!v16)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_74:

  if (v16)
  {
LABEL_11:

  }
LABEL_12:
  if (LODWORD(v171[0]))

  if (v15)
  {

  }
  if (v14)
  {

  }
  if (HIDWORD(v171[0]))
  {

    if (!v13)
    {
LABEL_20:
      if (!v12)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if (!v13)
  {
    goto LABEL_20;
  }

  if (v12)
  {
LABEL_21:

  }
LABEL_22:
  if (LODWORD(v171[1]))

  if (v160)
  {

  }
  if ((_DWORD)v159)
  {

  }
  if (HIDWORD(v171[1]))

  if (v11)
  {

  }
  if (HIDWORD(v159))
  {

  }
  if (*(_DWORD *)v169)
  {

    if (!v10)
    {
LABEL_36:
      if (!v9)
        goto LABEL_37;
      goto LABEL_81;
    }
  }
  else if (!v10)
  {
    goto LABEL_36;
  }

  if (!v9)
  {
LABEL_37:
    if (!*(_DWORD *)&v169[4])
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_81:

  if (*(_DWORD *)&v169[4])
LABEL_38:

LABEL_39:
  if (HIDWORD(v161))
  {

  }
  if ((_DWORD)v161)
  {

  }
  if (*(_DWORD *)&v169[8])

  if (HIDWORD(v162))
  {

  }
  if ((_DWORD)v162)
  {

  }
  if (LODWORD(v171[2]))

  if (HIDWORD(v163))
  {

  }
  if ((_DWORD)v163)
  {

  }
  if (LODWORD(v171[3]))

  if (HIDWORD(v164))
  {

  }
  if ((_DWORD)v164)
  {

  }
  if (HIDWORD(v171[2]))

  if (HIDWORD(v165))
  {

  }
  if ((_DWORD)v165)
  {

  }
  if (HIDWORD(v171[3]))

  if (v170)
  {

  }
  return v166;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKActivitySummary *v5;
  HKActivitySummary *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  void *v89;
  void *v90;

  v5 = (HKActivitySummary *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && self->_activitySummaryIndex == v6->_activitySummaryIndex)
      {
        -[HKActivitySummary activeEnergyBurned](self, "activeEnergyBurned");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary activeEnergyBurned](v6, "activeEnergyBurned");
        v8 = objc_claimAutoreleasedReturnValue();
        v88 = v7 != (void *)v8;
        if (v7 != (void *)v8)
        {
          -[HKActivitySummary activeEnergyBurned](v6, "activeEnergyBurned");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v90)
          {
            v11 = 0;

            goto LABEL_96;
          }
          -[HKActivitySummary activeEnergyBurned](self, "activeEnergyBurned");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary activeEnergyBurned](v6, "activeEnergyBurned");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
LABEL_56:

LABEL_95:
            goto LABEL_96;
          }
          v84 = v10;
          v85 = v9;
        }
        -[HKActivitySummary appleMoveTime](self, "appleMoveTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary appleMoveTime](v6, "appleMoveTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v13)
        {
          -[HKActivitySummary appleMoveTime](v6, "appleMoveTime");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {

            v11 = 0;
            if (v7 == (void *)v8)
            {
              v88 = 0;
              goto LABEL_94;
            }
            v88 = 1;
LABEL_93:

LABEL_94:
            if (v88)
              goto LABEL_95;
            goto LABEL_96;
          }
          v3 = (void *)v14;
          -[HKActivitySummary appleMoveTime](self, "appleMoveTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary appleMoveTime](v6, "appleMoveTime");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            v11 = 0;
            goto LABEL_55;
          }
        }
        -[HKActivitySummary appleExerciseTime](self, "appleExerciseTime");
        v16 = objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary appleExerciseTime](v6, "appleExerciseTime");
        v86 = (void *)v16;
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v16 == (_QWORD)v87;
        v17 = v16 != (_QWORD)v87;
        if (v52)
        {
          v79 = v17;
        }
        else
        {
          -[HKActivitySummary appleExerciseTime](v6, "appleExerciseTime");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            v11 = 0;
            if (v12 != v13)
            {
              LOBYTE(v24) = 1;
              goto LABEL_90;
            }
            v24 = 0;
LABEL_99:
            if (!v24)
              goto LABEL_92;
LABEL_91:

            goto LABEL_92;
          }
          v79 = v17;
          v76 = (void *)v18;
          -[HKActivitySummary appleExerciseTime](self, "appleExerciseTime");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary appleExerciseTime](v6, "appleExerciseTime");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            v11 = 0;
            v20 = v86;
            goto LABEL_54;
          }
        }
        -[HKActivitySummary appleStandHours](self, "appleStandHours");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary appleStandHours](v6, "appleStandHours");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v21 != v81;
        if (v21 == v81)
        {
          v74 = v3;
        }
        else
        {
          -[HKActivitySummary appleStandHours](v6, "appleStandHours");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {

            v11 = 0;
            v20 = v86;
            if (v86 != v87)
            {
              LOBYTE(v30) = 1;
              goto LABEL_87;
            }
            v30 = 0;
            goto LABEL_101;
          }
          v69 = (void *)v22;
          -[HKActivitySummary appleStandHours](self, "appleStandHours");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary appleStandHours](v6, "appleStandHours");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v23;
          if (!objc_msgSend(v23, "isEqual:"))
          {
            v80 = v21;
            v11 = 0;
            v20 = v86;
            goto LABEL_53;
          }
          v74 = v3;
        }
        -[HKActivitySummary activeEnergyBurnedGoal](self, "activeEnergyBurnedGoal");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary activeEnergyBurnedGoal](v6, "activeEnergyBurnedGoal");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v25;
        v26 = v25 != v72;
        v80 = v21;
        if (v25 != v72)
        {
          -[HKActivitySummary activeEnergyBurnedGoal](v6, "activeEnergyBurnedGoal");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
          {

            v39 = v21;
            v11 = 0;
            v3 = v74;
            v20 = v86;
            if (v39 != v81)
            {
              LOBYTE(v75) = 1;
              goto LABEL_84;
            }
            v75 = 0;
LABEL_103:
            if (!v75)
            {
LABEL_86:

              v30 = v79;
              if (v20 != v87)
              {
LABEL_87:

                if (!v30)
                  goto LABEL_89;
                goto LABEL_88;
              }
LABEL_101:
              if (v30)
LABEL_88:

LABEL_89:
              v24 = v12 != v13;
              if (v12 != v13)
              {
LABEL_90:

                if (!v24)
                  goto LABEL_92;
                goto LABEL_91;
              }
              goto LABEL_99;
            }
LABEL_85:

            goto LABEL_86;
          }
          v66 = (void *)v27;
          -[HKActivitySummary activeEnergyBurnedGoal](self, "activeEnergyBurnedGoal");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary activeEnergyBurnedGoal](v6, "activeEnergyBurnedGoal");
          v67 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v28, "isEqual:"))
          {
            v11 = 0;
            v20 = v86;
LABEL_52:

            v3 = v74;
            if (v80 == v81)
              goto LABEL_86;
LABEL_53:

            if (v20 != v87)
            {
LABEL_54:

              if (v12 != v13)
              {
LABEL_55:

                v10 = v84;
                v9 = v85;
                if (v7 != (void *)v8)
                  goto LABEL_56;
LABEL_96:
                v53 = (void *)v8;
LABEL_97:

                goto LABEL_98;
              }
LABEL_92:

              if (v7 == (void *)v8)
                goto LABEL_94;
              goto LABEL_93;
            }
            goto LABEL_89;
          }
          v63 = v29;
        }
        -[HKActivitySummary appleMoveTimeGoal](self, "appleMoveTimeGoal");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary appleMoveTimeGoal](v6, "appleMoveTimeGoal");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v68 = v31;
        if (v31 == (void *)v32)
        {
          v64 = (void *)v32;
        }
        else
        {
          -[HKActivitySummary appleMoveTimeGoal](v6, "appleMoveTimeGoal");
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {

            v11 = 0;
            v20 = v86;
            if (v73 != v72)
              goto LABEL_78;
            goto LABEL_81;
          }
          v62 = (void *)v34;
          -[HKActivitySummary appleMoveTimeGoal](self, "appleMoveTimeGoal");
          v35 = objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary appleMoveTimeGoal](v6, "appleMoveTimeGoal");
          v36 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v35;
          v37 = (void *)v35;
          v38 = (void *)v36;
          if (!objc_msgSend(v37, "isEqual:", v36))
          {
            v11 = 0;
            v20 = v86;
LABEL_76:

            if (v73 != v72)
            {
              LOBYTE(v26) = 1;
LABEL_78:

              if (!v26)
                goto LABEL_83;
LABEL_82:

              goto LABEL_83;
            }
            v26 = 0;
LABEL_81:
            if (!v26)
              goto LABEL_83;
            goto LABEL_82;
          }
          v60 = v38;
          v64 = v33;
        }
        -[HKActivitySummary exerciseTimeGoal](self, "exerciseTimeGoal");
        v40 = objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary exerciseTimeGoal](v6, "exerciseTimeGoal");
        v41 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v40;
        v52 = v40 == v41;
        v42 = (void *)v41;
        if (v52)
        {
          -[HKActivitySummary standHoursGoal](self, "standHoursGoal", v55);
        }
        else
        {
          -[HKActivitySummary exerciseTimeGoal](v6, "exerciseTimeGoal");
          v43 = objc_claimAutoreleasedReturnValue();
          if (!v43)
          {
            v11 = 0;
            goto LABEL_73;
          }
          v59 = (void *)v43;
          -[HKActivitySummary exerciseTimeGoal](self, "exerciseTimeGoal");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKActivitySummary exerciseTimeGoal](v6, "exerciseTimeGoal");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v44, "isEqual:", v45) & 1) == 0)
          {

            v11 = 0;
            goto LABEL_109;
          }
          v57 = v44;
          -[HKActivitySummary standHoursGoal](self, "standHoursGoal", v45);
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKActivitySummary standHoursGoal](v6, "standHoursGoal");
        v47 = objc_claimAutoreleasedReturnValue();
        v11 = v46 == (void *)v47;
        if (v46 == (void *)v47)
        {

        }
        else
        {
          v58 = (void *)v47;
          -[HKActivitySummary standHoursGoal](v6, "standHoursGoal");
          v48 = objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v89 = v42;
            v49 = (void *)v48;
            -[HKActivitySummary standHoursGoal](self, "standHoursGoal");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKActivitySummary standHoursGoal](v6, "standHoursGoal");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v50, "isEqual:", v51);

            if (v65 == v89)
            {

            }
            else
            {

            }
LABEL_109:
            if (v68 != v64)
            {

            }
            if (v73 != v72)
            {

            }
            if (v80 != v81)
            {

            }
            if (v86 != v87)
            {

            }
            if (v12 != v13)
            {

            }
            v53 = v7;
            v10 = v84;
            v9 = v85;
            if (v7 == (void *)v8)
              goto LABEL_97;
            goto LABEL_56;
          }

        }
        if (v65 == v42)
        {

          v31 = v68;
          v33 = v64;
          v52 = v68 == v64;
          v20 = v86;
          goto LABEL_75;
        }

LABEL_73:
        v20 = v86;

        v31 = v68;
        v33 = v64;
        v52 = v68 == v64;
LABEL_75:
        v38 = v60;
        if (!v52)
          goto LABEL_76;

        v29 = v63;
        if (v73 == v72)
        {
LABEL_83:

          v3 = v74;
          if (v80 != v81)
          {
LABEL_84:

            if (!v75)
              goto LABEL_86;
            goto LABEL_85;
          }
          goto LABEL_103;
        }
        goto LABEL_52;
      }
    }
    v11 = 0;
  }
LABEL_98:

  return v11;
}

- (HKQuantity)activeEnergyBurned
{
  HKQuantity *activeEnergyBurned;
  HKQuantity *v3;
  void *v4;

  activeEnergyBurned = self->_activeEnergyBurned;
  if (activeEnergyBurned)
  {
    v3 = activeEnergyBurned;
  }
  else
  {
    +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)appleExerciseTime
{
  HKQuantity *appleExerciseTime;
  HKQuantity *v3;
  void *v4;

  appleExerciseTime = self->_appleExerciseTime;
  if (appleExerciseTime)
  {
    v3 = appleExerciseTime;
  }
  else
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)appleStandHours
{
  HKQuantity *appleStandHours;
  HKQuantity *v3;
  void *v4;

  appleStandHours = self->_appleStandHours;
  if (appleStandHours)
  {
    v3 = appleStandHours;
  }
  else
  {
    +[HKUnit countUnit](HKUnit, "countUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)activeEnergyBurnedGoal
{
  HKQuantity *activeEnergyBurnedGoal;
  HKQuantity *v3;
  void *v4;

  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if (activeEnergyBurnedGoal)
  {
    v3 = activeEnergyBurnedGoal;
  }
  else
  {
    +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)appleExerciseTimeGoal
{
  HKQuantity *appleExerciseTimeGoal;
  HKQuantity *v3;
  void *v4;

  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if (appleExerciseTimeGoal)
  {
    v3 = appleExerciseTimeGoal;
  }
  else
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)appleStandHoursGoal
{
  HKQuantity *appleStandHoursGoal;
  HKQuantity *v3;
  void *v4;

  appleStandHoursGoal = self->_appleStandHoursGoal;
  if (appleStandHoursGoal)
  {
    v3 = appleStandHoursGoal;
  }
  else
  {
    +[HKUnit countUnit](HKUnit, "countUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)distanceWalkingRunning
{
  HKQuantity *distanceWalkingRunning;
  HKQuantity *v3;
  void *v4;

  distanceWalkingRunning = self->_distanceWalkingRunning;
  if (distanceWalkingRunning)
  {
    v3 = distanceWalkingRunning;
  }
  else
  {
    +[HKUnit meterUnit](HKUnit, "meterUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)stepCount
{
  HKQuantity *stepCount;
  HKQuantity *v3;
  void *v4;

  stepCount = self->_stepCount;
  if (stepCount)
  {
    v3 = stepCount;
  }
  else
  {
    +[HKUnit countUnit](HKUnit, "countUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)_deepBreathingDuration
{
  HKQuantity *deepBreathingDuration;
  HKQuantity *v3;
  void *v4;

  deepBreathingDuration = self->_deepBreathingDuration;
  if (deepBreathingDuration)
  {
    v3 = deepBreathingDuration;
  }
  else
  {
    +[HKUnit secondUnit](HKUnit, "secondUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSDate)_startDate
{
  return self->_startDate;
}

- (NSDate)_endDate
{
  return self->_endDate;
}

- (NSDate)_creationDate
{
  return self->_creationDate;
}

- (NSDate)_energyBurnedGoalDate
{
  return self->_energyBurnedGoalDate;
}

- (HKQuantity)_pushCount
{
  HKQuantity *pushCount;
  HKQuantity *v3;
  void *v4;

  pushCount = self->_pushCount;
  if (pushCount)
  {
    v3 = pushCount;
  }
  else
  {
    +[HKUnit countUnit](HKUnit, "countUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)_flightsClimbed
{
  HKQuantity *flightsClimbed;
  HKQuantity *v3;
  void *v4;

  flightsClimbed = self->_flightsClimbed;
  if (flightsClimbed)
  {
    v3 = flightsClimbed;
  }
  else
  {
    +[HKUnit countUnit](HKUnit, "countUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)_wheelchairUse
{
  return self->_wheelchairUse;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  __objc2_class **v5;
  uint64_t v6;
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
  _BOOL4 v19;
  const __CFString *v20;
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
  const __CFString *v48;
  void *v49;
  void *v50;
  NSInteger v51;
  NSInteger v52;
  void *v53;
  NSInteger v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  __CFString *v72;
  objc_super v73;

  v3 = 0x1E0CB3000uLL;
  v4 = 0x1E0CB3000uLL;
  v5 = off_1E37E5000;
  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" Summary Index=(%lli)"), -[HKActivitySummary _activitySummaryIndex](self, "_activitySummaryIndex"));
    v6 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)MEMORY[0x1E0CB3940];
    v72 = (__CFString *)v6;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivitySummary stepCount](self, "stepCount");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit countUnit](HKUnit, "countUnit");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "doubleValueForUnit:", v66);
    objc_msgSend(v7, "numberWithDouble:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivitySummary distanceWalkingRunning](self, "distanceWalkingRunning");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit meterUnit](HKUnit, "meterUnit");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "doubleValueForUnit:", v62);
    objc_msgSend(v8, "numberWithDouble:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivitySummary _pushCount](self, "_pushCount");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit countUnit](HKUnit, "countUnit");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValueForUnit:", v55);
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivitySummary _flightsClimbed](self, "_flightsClimbed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit countUnit](HKUnit, "countUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v13);
    objc_msgSend(v11, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivitySummary _deepBreathingDuration](self, "_deepBreathingDuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit secondUnit](HKUnit, "secondUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValueForUnit:", v17);
    objc_msgSend(v15, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "stringWithFormat:", CFSTR(" Step Count=(%@) Meters=(%@) Pushes=(%@) Flights=(%@) Breathe=(%@)"), v58, v53, v10, v14, v18, 0);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v3 = 0x1E0CB3000;
    v4 = 0x1E0CB3000;

    v5 = off_1E37E5000;
  }
  else
  {
    v71 = &stru_1E37FD4C0;
    v72 = &stru_1E37FD4C0;
  }
  v73.receiver = self;
  v73.super_class = (Class)HKActivitySummary;
  -[HKActivitySummary description](&v73, sel_description);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *(void **)(v3 + 2368);
  v54 = -[NSDateComponents year](self->_dateComponents, "year");
  v52 = -[NSDateComponents month](self->_dateComponents, "month");
  v51 = -[NSDateComponents day](self->_dateComponents, "day");
  objc_msgSend(*(id *)(v4 + 2024), "numberWithInteger:", -[HKActivitySummary activityMoveMode](self, "activityMoveMode"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKActivitySummary isPaused](self, "isPaused");
  v20 = CFSTR("NO");
  if (v19)
    v20 = CFSTR("YES");
  v48 = v20;
  v21 = *(void **)(v4 + 2024);
  -[HKActivitySummary activeEnergyBurned](self, "activeEnergyBurned");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class kilocalorieUnit](v5[60], "kilocalorieUnit");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "doubleValueForUnit:", v63);
  objc_msgSend(v21, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(v4 + 2024);
  -[HKActivitySummary activeEnergyBurnedGoal](self, "activeEnergyBurnedGoal");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class kilocalorieUnit](v5[60], "kilocalorieUnit");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "doubleValueForUnit:", v59);
  objc_msgSend(v22, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(v4 + 2024);
  -[HKActivitySummary appleMoveTime](self, "appleMoveTime");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class minuteUnit](v5[60], "minuteUnit");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "doubleValueForUnit:", v49);
  objc_msgSend(v23, "numberWithDouble:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(void **)(v4 + 2024);
  -[HKActivitySummary appleMoveTimeGoal](self, "appleMoveTimeGoal");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class minuteUnit](v5[60], "minuteUnit");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValueForUnit:", v46);
  objc_msgSend(v24, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(void **)(v4 + 2024);
  -[HKActivitySummary appleExerciseTime](self, "appleExerciseTime");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class minuteUnit](v5[60], "minuteUnit");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "doubleValueForUnit:", v43);
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(v4 + 2024);
  -[HKActivitySummary exerciseTimeGoal](self, "exerciseTimeGoal");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class minuteUnit](v5[60], "minuteUnit");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValueForUnit:", v40);
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(void **)(v4 + 2024);
  -[HKActivitySummary appleStandHours](self, "appleStandHours");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class countUnit](v5[60], "countUnit");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValueForUnit:", v31);
  objc_msgSend(v29, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(void **)(v4 + 2024);
  -[HKActivitySummary standHoursGoal](self, "standHoursGoal");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class countUnit](v5[60], "countUnit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValueForUnit:", v35);
  objc_msgSend(v33, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringWithFormat:", CFSTR("<%@: Date=(Year: %zd, Month: %zd, Day: %zd)%@ Move Mode=(%@) Paused=(%@) Active Energy Burned=(%@/%@) Apple Move Minutes=(%@/%@) Apple Exercise Minutes=(%@/%@) Apple Stand Hours=(%@/%@)%@>"), v67, v54, v52, v51, v72, v69, v48, v45, v39, v42, v38, v26, v28, v32, v36, v71);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (int64_t)_activitySummaryIndex
{
  return self->_activitySummaryIndex;
}

- (BOOL)_isDataLoading
{
  return self->_dataLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyMoveMinuteStatistics, 0);
  objc_storeStrong((id *)&self->_activeHoursGoalDate, 0);
  objc_storeStrong((id *)&self->_briskMinutesGoalDate, 0);
  objc_storeStrong((id *)&self->_moveTimeGoalDate, 0);
  objc_storeStrong((id *)&self->_energyBurnedGoalDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyMoveTimeStatistics, 0);
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, 0);
  objc_storeStrong((id *)&self->_flightsClimbed, 0);
  objc_storeStrong((id *)&self->_pushCount, 0);
  objc_storeStrong((id *)&self->_deepBreathingDuration, 0);
  objc_storeStrong((id *)&self->_appleStandHoursGoal, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_stepCount, 0);
  objc_storeStrong((id *)&self->_distanceWalkingRunning, 0);
  objc_storeStrong((id *)&self->_appleStandHours, 0);
  objc_storeStrong((id *)&self->_appleExerciseTime, 0);
  objc_storeStrong((id *)&self->_appleMoveTime, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurned, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

+ (id)_mostSignificantCacheAmongCaches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hk_filter:", &__block_literal_global_98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v5;
  v83 = v4;
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;
  objc_msgSend(a1, "_mostRecentlyCreatedCacheAmongCaches:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v85 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(v15, "energyBurnedGoalDate", v82, v83, (_QWORD)v84);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v18 = v17;
        objc_msgSend(v8, "energyBurnedGoalDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceReferenceDate");
        v21 = v20;

        if (v18 > v21)
        {
          objc_msgSend(v15, "energyBurnedGoal");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setEnergyBurnedGoalOnly:", v22);

          objc_msgSend(v15, "energyBurnedGoalDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setEnergyBurnedGoalDateOnly:", v23);

        }
        objc_msgSend(v15, "moveMinutesGoalDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        v26 = v25;
        objc_msgSend(v8, "moveMinutesGoalDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        v29 = v28;

        if (v26 > v29)
        {
          objc_msgSend(v15, "moveMinutesGoal");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setMoveMinutesGoalOnly:", v30);

          objc_msgSend(v15, "moveMinutesGoalDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setMoveMinutesGoalDateOnly:", v31);

        }
        objc_msgSend(v15, "briskMinutesGoalDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "timeIntervalSinceReferenceDate");
        v34 = v33;
        objc_msgSend(v8, "briskMinutesGoalDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "timeIntervalSinceReferenceDate");
        v37 = v36;

        if (v34 > v37)
        {
          objc_msgSend(v15, "briskMinutesGoal");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setBriskMinutesGoalOnly:", v38);

          objc_msgSend(v15, "briskMinutesGoalDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setBriskMinutesGoalDateOnly:", v39);

        }
        objc_msgSend(v15, "activeHoursGoalDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "timeIntervalSinceReferenceDate");
        v42 = v41;
        objc_msgSend(v8, "activeHoursGoalDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "timeIntervalSinceReferenceDate");
        v45 = v44;

        if (v42 > v45)
        {
          objc_msgSend(v15, "activeHoursGoal");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setActiveHoursGoalOnly:", v46);

          objc_msgSend(v15, "activeHoursGoalDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setActiveHoursGoalDateOnly:", v47);

        }
        objc_msgSend(v15, "energyBurned");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValueForUnit:", v49);
        v51 = v50;

        objc_msgSend(v8, "energyBurned");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "doubleValueForUnit:", v53);
        v55 = v54;

        if (v51 > v55)
        {
          objc_msgSend(v15, "energyBurned");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setEnergyBurned:", v56);

        }
        objc_msgSend(v15, "moveMinutes");
        v58 = v57;
        objc_msgSend(v8, "moveMinutes");
        if (v58 > v59)
        {
          objc_msgSend(v15, "moveMinutes");
          objc_msgSend(v8, "_setMoveMinutes:");
        }
        objc_msgSend(v15, "briskMinutes");
        v61 = v60;
        objc_msgSend(v8, "briskMinutes");
        if (v61 > v62)
        {
          objc_msgSend(v15, "briskMinutes");
          objc_msgSend(v8, "_setBriskMinutes:");
        }
        objc_msgSend(v15, "activeHours");
        v64 = v63;
        objc_msgSend(v8, "activeHours");
        if (v64 > v65)
        {
          objc_msgSend(v15, "activeHours");
          objc_msgSend(v8, "_setActiveHours:");
        }
        v66 = objc_msgSend(v15, "stepCount");
        if (v66 > objc_msgSend(v8, "stepCount"))
          objc_msgSend(v8, "_setStepCount:", objc_msgSend(v15, "stepCount"));
        objc_msgSend(v15, "walkingAndRunningDistance");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKUnit meterUnit](HKUnit, "meterUnit");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "doubleValueForUnit:", v68);
        v70 = v69;

        objc_msgSend(v8, "walkingAndRunningDistance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKUnit meterUnit](HKUnit, "meterUnit");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "doubleValueForUnit:", v72);
        v74 = v73;

        if (v70 > v74)
        {
          objc_msgSend(v15, "walkingAndRunningDistance");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setWalkingAndRunningDistance:", v75);

        }
        v76 = objc_msgSend(v15, "pushCount");
        if (v76 > objc_msgSend(v8, "pushCount"))
          objc_msgSend(v8, "_setPushCount:", objc_msgSend(v15, "pushCount"));
        objc_msgSend(v15, "deepBreathingDuration");
        v78 = v77;
        objc_msgSend(v8, "deepBreathingDuration");
        if (v78 > v79)
        {
          objc_msgSend(v15, "deepBreathingDuration");
          objc_msgSend(v8, "_setDeepBreathingDuration:");
        }
        v80 = objc_msgSend(v15, "flightsClimbed");
        if (v80 > objc_msgSend(v8, "flightsClimbed"))
          objc_msgSend(v8, "_setFlightsClimbed:", objc_msgSend(v15, "flightsClimbed"));
        v12 |= objc_msgSend(v15, "isPaused");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    }
    while (v11);
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  objc_msgSend(v8, "_setPaused:", v12 & 1);
  return v8;
}

- (id)_initWithActivityCache:(id)a3 shouldIncludePrivateProperties:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HKActivitySummary *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = a4;
  v6 = a3;
  v7 = -[HKActivitySummary init](self, "init");
  if (v7)
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v8 = objc_claimAutoreleasedReturnValue();
    +[HKUnit countUnit](HKUnit, "countUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "moveMinutes");
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
    v36 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "moveMinutesGoal");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "briskMinutes");
    v39 = (void *)v8;
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "briskMinutesGoal");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeHours");
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeHoursGoal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "activityMoveMode");
    v15 = objc_msgSend(v6, "isPaused");
    -[HKActivitySummary _setActivitySummaryIndex:](v7, "_setActivitySummaryIndex:", objc_msgSend(v6, "cacheIndex"));
    objc_msgSend(v6, "energyBurned");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary setActiveEnergyBurned:](v7, "setActiveEnergyBurned:", v16);

    -[HKActivitySummary setAppleMoveTime:](v7, "setAppleMoveTime:", v10);
    v38 = (void *)v11;
    -[HKActivitySummary setAppleExerciseTime:](v7, "setAppleExerciseTime:", v11);
    -[HKActivitySummary setAppleStandHours:](v7, "setAppleStandHours:", v12);
    objc_msgSend(v6, "energyBurnedGoal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary setActiveEnergyBurnedGoal:](v7, "setActiveEnergyBurnedGoal:", v17);

    -[HKActivitySummary setAppleMoveTimeGoal:](v7, "setAppleMoveTimeGoal:", v40);
    -[HKActivitySummary setExerciseTimeGoal:](v7, "setExerciseTimeGoal:", v35);
    -[HKActivitySummary setStandHoursGoal:](v7, "setStandHoursGoal:", v13);
    -[HKActivitySummary setActivityMoveMode:](v7, "setActivityMoveMode:", v14);
    -[HKActivitySummary setPaused:](v7, "setPaused:", v15);
    if (v36)
    {
      +[HKUnit secondUnit](HKUnit, "secondUnit");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "wheelchairUse");
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, (double)objc_msgSend(v6, "stepCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deepBreathingDuration");
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, (double)objc_msgSend(v6, "pushCount"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, (double)objc_msgSend(v6, "flightsClimbed"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "walkingAndRunningDistance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary setDistanceWalkingRunning:](v7, "setDistanceWalkingRunning:", v20);

      -[HKActivitySummary setStepCount:](v7, "setStepCount:", v19);
      objc_msgSend(v6, "energyBurnedGoalDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setEnergyBurnedGoalDate:](v7, "_setEnergyBurnedGoalDate:", v21);

      objc_msgSend(v6, "moveMinutesGoalDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setMoveTimeGoalDate:](v7, "_setMoveTimeGoalDate:", v22);

      objc_msgSend(v6, "briskMinutesGoalDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setBriskMinutesGoalDate:](v7, "_setBriskMinutesGoalDate:", v23);

      objc_msgSend(v6, "activeHoursGoalDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setActiveHoursGoalDate:](v7, "_setActiveHoursGoalDate:", v24);

      objc_msgSend(v6, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setStartDate:](v7, "_setStartDate:", v25);

      objc_msgSend(v6, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setEndDate:](v7, "_setEndDate:", v26);

      -[HKActivitySummary _setDeepBreathingDuration:](v7, "_setDeepBreathingDuration:", v34);
      -[HKActivitySummary _setPushCount:](v7, "_setPushCount:", v33);
      -[HKActivitySummary _setWheelchairUse:](v7, "_setWheelchairUse:", v18);
      -[HKActivitySummary _setFlightsClimbed:](v7, "_setFlightsClimbed:", v32);
      objc_msgSend(v6, "_creationDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setCreationDate:](v7, "_setCreationDate:", v27);

      objc_msgSend(v6, "dailyEnergyBurnedStatistics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setDailyEnergyBurnedStatistics:](v7, "_setDailyEnergyBurnedStatistics:", v28);

      objc_msgSend(v6, "dailyMoveMinutesStatistics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setDailyMoveTimeStatistics:](v7, "_setDailyMoveTimeStatistics:", v29);

      objc_msgSend(v6, "dailyBriskMinutesStatistics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivitySummary _setDailyBriskMinutesStatistics:](v7, "_setDailyBriskMinutesStatistics:", v30);

    }
  }

  return v7;
}

- (void)setActiveEnergyBurned:(HKQuantity *)activeEnergyBurned
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = activeEnergyBurned;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("activeEnergyBurned"));

  v6 = self->_activeEnergyBurned;
  self->_activeEnergyBurned = v4;

}

- (void)_validateQuantityAssignment:(id)a3 expectedUnit:(id)a4 propertyName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  if (v14 && (objc_msgSend(v14, "isCompatibleWithUnit:", v7) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    objc_msgSend(v7, "unitString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_unit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unitString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("%@ expects units compatible with %@, received %@"), v8, v11, v13);

  }
}

- (void)setAppleExerciseTime:(HKQuantity *)appleExerciseTime
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = appleExerciseTime;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("appleExerciseTime"));

  v6 = self->_appleExerciseTime;
  self->_appleExerciseTime = v4;

}

- (void)setAppleStandHours:(HKQuantity *)appleStandHours
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = appleStandHours;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("appleStandHours"));

  v6 = self->_appleStandHours;
  self->_appleStandHours = v4;

}

- (void)setActiveEnergyBurnedGoal:(HKQuantity *)activeEnergyBurnedGoal
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = activeEnergyBurnedGoal;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("activeEnergyBurnedGoal"));

  v6 = self->_activeEnergyBurnedGoal;
  self->_activeEnergyBurnedGoal = v4;

}

- (void)setAppleExerciseTimeGoal:(HKQuantity *)appleExerciseTimeGoal
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = appleExerciseTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("briskMinutesGoal"));

  v6 = self->_appleExerciseTimeGoal;
  self->_appleExerciseTimeGoal = v4;

}

- (void)setAppleStandHoursGoal:(HKQuantity *)appleStandHoursGoal
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = appleStandHoursGoal;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("activeHoursGoal"));

  v6 = self->_appleStandHoursGoal;
  self->_appleStandHoursGoal = v4;

}

- (void)setDistanceWalkingRunning:(id)a3
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *distanceWalkingRunning;

  v4 = (HKQuantity *)a3;
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("distanceWalkingRunning"));

  distanceWalkingRunning = self->_distanceWalkingRunning;
  self->_distanceWalkingRunning = v4;

}

- (void)setStepCount:(id)a3
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *stepCount;

  v4 = (HKQuantity *)a3;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("stepCount"));

  stepCount = self->_stepCount;
  self->_stepCount = v4;

}

- (void)_setEnergyBurnedGoalDate:(id)a3
{
  objc_storeStrong((id *)&self->_energyBurnedGoalDate, a3);
}

- (void)_setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)_setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void)_setDeepBreathingDuration:(id)a3
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *deepBreathingDuration;

  v4 = (HKQuantity *)a3;
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("deepBreathingDuration"));

  deepBreathingDuration = self->_deepBreathingDuration;
  self->_deepBreathingDuration = v4;

}

- (void)_setPushCount:(id)a3
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *pushCount;

  v4 = (HKQuantity *)a3;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("pushCount"));

  pushCount = self->_pushCount;
  self->_pushCount = v4;

}

- (void)_setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (void)_setFlightsClimbed:(id)a3
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *flightsClimbed;

  v4 = (HKQuantity *)a3;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("flightsClimbed"));

  flightsClimbed = self->_flightsClimbed;
  self->_flightsClimbed = v4;

}

- (void)_setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void)_setDailyEnergyBurnedStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, a3);
}

- (void)_setDailyBriskMinutesStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, a3);
}

- (NSDateComponents)_gregorianDateComponents
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary dateComponentsForCalendar:](self, "dateComponentsForCalendar:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v4;
}

- (NSDateComponents)dateComponentsForCalendar:(NSCalendar *)calendar
{
  NSCalendar *v4;
  NSCalendar *v5;
  void *v6;
  int v7;
  NSDateComponents *dateComponents;
  NSDateComponents *v9;
  NSDateComponents *v10;

  v4 = calendar;
  v5 = v4;
  if (self->_dateComponents)
  {
    -[NSCalendar calendarIdentifier](v4, "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    dateComponents = self->_dateComponents;
    if (v7)
    {
      v9 = dateComponents;
    }
    else
    {
      -[NSDateComponents hk_translateDateComponentsToCalendar:calendarUnits:](dateComponents, "hk_translateDateComponentsToCalendar:calendarUnits:", v5, 30);
      v9 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
  }
  v10 = v9;

  return v10;
}

- (double)_activeEnergyCompletionPercentage
{
  HKQuantity *activeEnergyBurned;
  HKQuantity *activeEnergyBurnedGoal;
  void *v5;
  double v6;
  double v7;

  activeEnergyBurned = self->_activeEnergyBurned;
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _percentageCompleteWithQuantity:goalQuantity:unit:](self, "_percentageCompleteWithQuantity:goalQuantity:unit:", activeEnergyBurned, activeEnergyBurnedGoal, v5);
  v7 = v6;

  return v7;
}

- (double)_percentageCompleteWithQuantity:(id)a3 goalQuantity:(id)a4 unit:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "doubleValueForUnit:", v8);
  v10 = v9;
  v11 = 0.0;
  if (v9 >= 0.00000011920929)
  {
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    v11 = v12 / v10;
  }

  return v11;
}

- (double)_exerciseTimeCompletionPercentage
{
  HKQuantity *appleExerciseTime;
  HKQuantity *appleExerciseTimeGoal;
  void *v5;
  double v6;
  double v7;

  appleExerciseTime = self->_appleExerciseTime;
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _percentageCompleteWithQuantity:goalQuantity:unit:](self, "_percentageCompleteWithQuantity:goalQuantity:unit:", appleExerciseTime, appleExerciseTimeGoal, v5);
  v7 = v6;

  return v7;
}

- (double)_standHoursCompletionPercentage
{
  HKQuantity *appleStandHours;
  HKQuantity *appleStandHoursGoal;
  void *v5;
  double v6;
  double v7;

  appleStandHours = self->_appleStandHours;
  appleStandHoursGoal = self->_appleStandHoursGoal;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _percentageCompleteWithQuantity:goalQuantity:unit:](self, "_percentageCompleteWithQuantity:goalQuantity:unit:", appleStandHours, appleStandHoursGoal, v5);
  v7 = v6;

  return v7;
}

- (NSArray)_dailyEnergyBurnedStatistics
{
  if (self->_dailyEnergyBurnedStatistics)
    return self->_dailyEnergyBurnedStatistics;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)_dailyBriskMinutesStatistics
{
  if (self->_dailyBriskMinutesStatistics)
    return self->_dailyBriskMinutesStatistics;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_setGregorianDateComponents:(id)a3
{
  id v4;
  char v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = 0;
  v5 = objc_msgSend((id)objc_opt_class(), "_validateActivitySummaryDateComponents:errorMessage:", v4, &v7);
  v6 = v7;
  if ((v5 & 1) != 0)
    -[HKActivitySummary _setActivitySummaryIndex:](self, "_setActivitySummaryIndex:", _HKCacheIndexFromDateComponents(v4));
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v6);

}

+ (BOOL)_validateActivitySummaryDateComponents:(id)a3 errorMessage:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  const char *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v14;
  const char *v15;

  v5 = a3;
  if (objc_msgSend(v5, "year") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v5, "month") == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v15 = "";
        v7 = "month";
        goto LABEL_10;
      }
LABEL_46:
      v9 = 0;
      goto LABEL_47;
    }
    if (objc_msgSend(v5, "day") == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v15 = "";
        v7 = "day";
        goto LABEL_10;
      }
      goto LABEL_46;
    }
    if (objc_msgSend(v5, "hour") == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v5, "minute") == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v5, "second") == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v5, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v5, "weekday") == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(v5, "weekdayOrdinal") == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (objc_msgSend(v5, "quarter") == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (objc_msgSend(v5, "weekOfMonth") == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (objc_msgSend(v5, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if (objc_msgSend(v5, "yearForWeekOfYear") == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        objc_msgSend(v5, "calendar");
                        v10 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v5, "calendar");
                        v11 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v11)
                        {
                          v12 = (void *)v10;
                          if ((objc_msgSend(v5, "isValidDateInCalendar:", v10) & 1) != 0)
                          {
                            v9 = 1;
LABEL_54:

                            goto LABEL_47;
                          }
                          if (a4)
                          {
                            v14 = CFSTR("Date components must represent a valid date.");
                            goto LABEL_52;
                          }
                        }
                        else
                        {
                          v12 = (void *)v10;
                          if (a4)
                          {
                            v14 = CFSTR("Date components require a calendar.");
LABEL_52:
                            v9 = 0;
                            *a4 = v14;
                            goto LABEL_54;
                          }
                        }
                        v9 = 0;
                        goto LABEL_54;
                      }
                      if (!a4)
                        goto LABEL_46;
                      v6 = (void *)MEMORY[0x1E0CB3940];
                      v15 = "not ";
                      v7 = "yearForWeekOfYear";
                    }
                    else
                    {
                      if (!a4)
                        goto LABEL_46;
                      v6 = (void *)MEMORY[0x1E0CB3940];
                      v15 = "not ";
                      v7 = "weekOfYear";
                    }
                  }
                  else
                  {
                    if (!a4)
                      goto LABEL_46;
                    v6 = (void *)MEMORY[0x1E0CB3940];
                    v15 = "not ";
                    v7 = "weekOfMonth";
                  }
                }
                else
                {
                  if (!a4)
                    goto LABEL_46;
                  v6 = (void *)MEMORY[0x1E0CB3940];
                  v15 = "not ";
                  v7 = "quarter";
                }
              }
              else
              {
                if (!a4)
                  goto LABEL_46;
                v6 = (void *)MEMORY[0x1E0CB3940];
                v15 = "not ";
                v7 = "weekdayOrdinal";
              }
            }
            else
            {
              if (!a4)
                goto LABEL_46;
              v6 = (void *)MEMORY[0x1E0CB3940];
              v15 = "not ";
              v7 = "weekday";
            }
          }
          else
          {
            if (!a4)
              goto LABEL_46;
            v6 = (void *)MEMORY[0x1E0CB3940];
            v15 = "not ";
            v7 = "nanosecond";
          }
        }
        else
        {
          if (!a4)
            goto LABEL_46;
          v6 = (void *)MEMORY[0x1E0CB3940];
          v15 = "not ";
          v7 = "second";
        }
      }
      else
      {
        if (!a4)
          goto LABEL_46;
        v6 = (void *)MEMORY[0x1E0CB3940];
        v15 = "not ";
        v7 = "minute";
      }
    }
    else
    {
      if (!a4)
        goto LABEL_46;
      v6 = (void *)MEMORY[0x1E0CB3940];
      v15 = "not ";
      v7 = "hour";
    }
    v8 = "";
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_46;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v15 = "";
  v7 = "year";
LABEL_10:
  v8 = "a valid ";
LABEL_11:
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Activity summary date components require %s%s to %sbe set."), v8, v7, v15);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

  return v9;
}

- (HKActivitySummary)init
{
  HKActivitySummary *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKActivitySummary;
  result = -[HKActivitySummary init](&v3, sel_init);
  if (result)
  {
    result->_activityMoveMode = 1;
    result->_paused = 0;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_activitySummaryIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKActivitySummary)initWithCoder:(id)a3
{
  id v4;
  HKActivitySummary *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKQuantity *activeEnergyBurned;
  void *v13;
  uint64_t v14;
  HKQuantity *appleMoveTime;
  void *v16;
  uint64_t v17;
  HKQuantity *appleExerciseTime;
  void *v19;
  uint64_t v20;
  HKQuantity *appleStandHours;
  void *v22;
  uint64_t v23;
  HKQuantity *distanceWalkingRunning;
  void *v25;
  uint64_t v26;
  HKQuantity *stepCount;
  void *v28;
  uint64_t v29;
  HKQuantity *activeEnergyBurnedGoal;
  void *v31;
  uint64_t v32;
  HKQuantity *appleMoveTimeGoal;
  void *v34;
  uint64_t v35;
  HKQuantity *appleStandHoursGoal;
  void *v37;
  uint64_t v38;
  HKQuantity *appleExerciseTimeGoal;
  void *v40;
  uint64_t v41;
  HKQuantity *deepBreathingDuration;
  void *v43;
  uint64_t v44;
  HKQuantity *pushCount;
  void *v46;
  uint64_t v47;
  HKQuantity *flightsClimbed;
  uint64_t v49;
  NSArray *dailyEnergyBurnedStatistics;
  uint64_t v51;
  NSArray *dailyMoveTimeStatistics;
  uint64_t v53;
  NSArray *dailyBriskMinutesStatistics;
  uint64_t v55;
  NSDate *energyBurnedGoalDate;
  uint64_t v57;
  NSDate *moveTimeGoalDate;
  uint64_t v59;
  NSDate *briskMinutesGoalDate;
  uint64_t v61;
  NSDate *activeHoursGoalDate;
  uint64_t v63;
  NSDate *creationDate;
  uint64_t v65;
  NSDate *startDate;
  uint64_t v67;
  NSDate *endDate;

  v4 = a3;
  v5 = -[HKActivitySummary init](self, "init");
  if (v5)
  {
    -[HKActivitySummary _setActivitySummaryIndex:](v5, "_setActivitySummaryIndex:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("index")));
    v6 = objc_opt_class();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("activeEnergy"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    activeEnergyBurned = v5->_activeEnergyBurned;
    v5->_activeEnergyBurned = (HKQuantity *)v11;

    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("moveTime"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    appleMoveTime = v5->_appleMoveTime;
    v5->_appleMoveTime = (HKQuantity *)v14;

    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("exerciseTime"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    appleExerciseTime = v5->_appleExerciseTime;
    v5->_appleExerciseTime = (HKQuantity *)v17;

    +[HKUnit countUnit](HKUnit, "countUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("standHours"), v19);
    v20 = objc_claimAutoreleasedReturnValue();
    appleStandHours = v5->_appleStandHours;
    v5->_appleStandHours = (HKQuantity *)v20;

    +[HKUnit meterUnit](HKUnit, "meterUnit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("distanceWalking"), v22);
    v23 = objc_claimAutoreleasedReturnValue();
    distanceWalkingRunning = v5->_distanceWalkingRunning;
    v5->_distanceWalkingRunning = (HKQuantity *)v23;

    +[HKUnit countUnit](HKUnit, "countUnit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("stepCount"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    stepCount = v5->_stepCount;
    v5->_stepCount = (HKQuantity *)v26;

    +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("energyBurnedGoal"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    activeEnergyBurnedGoal = v5->_activeEnergyBurnedGoal;
    v5->_activeEnergyBurnedGoal = (HKQuantity *)v29;

    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("moveMinutesGoal"), v31);
    v32 = objc_claimAutoreleasedReturnValue();
    appleMoveTimeGoal = v5->_appleMoveTimeGoal;
    v5->_appleMoveTimeGoal = (HKQuantity *)v32;

    +[HKUnit countUnit](HKUnit, "countUnit");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("activeHoursGoal"), v34);
    v35 = objc_claimAutoreleasedReturnValue();
    appleStandHoursGoal = v5->_appleStandHoursGoal;
    v5->_appleStandHoursGoal = (HKQuantity *)v35;

    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("briskMinutesGoal"), v37);
    v38 = objc_claimAutoreleasedReturnValue();
    appleExerciseTimeGoal = v5->_appleExerciseTimeGoal;
    v5->_appleExerciseTimeGoal = (HKQuantity *)v38;

    +[HKUnit secondUnit](HKUnit, "secondUnit");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("deepBreathingDuration"), v40);
    v41 = objc_claimAutoreleasedReturnValue();
    deepBreathingDuration = v5->_deepBreathingDuration;
    v5->_deepBreathingDuration = (HKQuantity *)v41;

    +[HKUnit countUnit](HKUnit, "countUnit");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("pushCount"), v43);
    v44 = objc_claimAutoreleasedReturnValue();
    pushCount = v5->_pushCount;
    v5->_pushCount = (HKQuantity *)v44;

    +[HKUnit countUnit](HKUnit, "countUnit");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary _decodeQuantityFromCoder:forKey:unit:](v5, "_decodeQuantityFromCoder:forKey:unit:", v4, CFSTR("flightsClimbed"), v46);
    v47 = objc_claimAutoreleasedReturnValue();
    flightsClimbed = v5->_flightsClimbed;
    v5->_flightsClimbed = (HKQuantity *)v47;

    v5->_wheelchairUse = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wheelchairUse"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dailyEnergyBurnedStatistics"));
    v49 = objc_claimAutoreleasedReturnValue();
    dailyEnergyBurnedStatistics = v5->_dailyEnergyBurnedStatistics;
    v5->_dailyEnergyBurnedStatistics = (NSArray *)v49;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dailyMoveMinutesStatistics"));
    v51 = objc_claimAutoreleasedReturnValue();
    dailyMoveTimeStatistics = v5->_dailyMoveTimeStatistics;
    v5->_dailyMoveTimeStatistics = (NSArray *)v51;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dailyBriskMinutesStatistics"));
    v53 = objc_claimAutoreleasedReturnValue();
    dailyBriskMinutesStatistics = v5->_dailyBriskMinutesStatistics;
    v5->_dailyBriskMinutesStatistics = (NSArray *)v53;

    v5->_dataLoading = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dataLoading"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("energyBurnedGoalDate"));
    v55 = objc_claimAutoreleasedReturnValue();
    energyBurnedGoalDate = v5->_energyBurnedGoalDate;
    v5->_energyBurnedGoalDate = (NSDate *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("moveTimeGoalDate"));
    v57 = objc_claimAutoreleasedReturnValue();
    moveTimeGoalDate = v5->_moveTimeGoalDate;
    v5->_moveTimeGoalDate = (NSDate *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("briskMinutesGoalDate"));
    v59 = objc_claimAutoreleasedReturnValue();
    briskMinutesGoalDate = v5->_briskMinutesGoalDate;
    v5->_briskMinutesGoalDate = (NSDate *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("activeHoursGoalDate"));
    v61 = objc_claimAutoreleasedReturnValue();
    activeHoursGoalDate = v5->_activeHoursGoalDate;
    v5->_activeHoursGoalDate = (NSDate *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("creationDate"));
    v63 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("startDate"));
    v65 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("endDate"));
    v67 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v67;

    v5->_activityMoveMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityMoveMode"));
    v5->_paused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paused"));

  }
  return v5;
}

- (id)_decodeQuantityFromCoder:(id)a3 forKey:(id)a4 unit:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "containsValueForKey:", v8))
  {
    objc_msgSend(v7, "decodeDoubleForKey:", v8);
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HKQuantity)appleMoveTime
{
  HKQuantity *appleMoveTime;
  HKQuantity *v3;
  void *v4;

  appleMoveTime = self->_appleMoveTime;
  if (appleMoveTime)
  {
    v3 = appleMoveTime;
  }
  else
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)appleMoveTimeGoal
{
  HKQuantity *appleMoveTimeGoal;
  HKQuantity *v3;
  void *v4;

  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if (appleMoveTimeGoal)
  {
    v3 = appleMoveTimeGoal;
  }
  else
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKQuantity)exerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (HKQuantity)standHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (NSArray)_dailyMoveTimeStatistics
{
  if (self->_dailyMoveTimeStatistics)
    return self->_dailyMoveTimeStatistics;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)_hasEnergyBurnedGoal
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[HKActivitySummary activeEnergyBurnedGoal](self, "activeEnergyBurnedGoal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "compare:", v4) == 1;

  return v5;
}

- (BOOL)_hasAppleMoveTimeGoal
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[HKActivitySummary appleMoveTimeGoal](self, "appleMoveTimeGoal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "compare:", v4) == 1;

  return v5;
}

- (BOOL)_hasExerciseGoal
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[HKActivitySummary exerciseTimeGoal](self, "exerciseTimeGoal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "compare:", v4) == 1;

  return v5;
}

- (BOOL)_hasStandHoursGoal
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[HKActivitySummary standHoursGoal](self, "standHoursGoal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "compare:", v4) == 1;

  return v5;
}

- (HKActivityMoveMode)activityMoveMode
{
  return self->_activityMoveMode;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)_useHourlyGoalComparison
{
  return 0;
}

- (BOOL)_isStandalonePhoneSummary
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HKActivitySummary exerciseTimeGoal](self, "exerciseTimeGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[HKActivitySummary standHoursGoal](self, "standHoursGoal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (void)setAppleMoveTime:(HKQuantity *)appleMoveTime
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = appleMoveTime;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("appleMoveTime"));

  v6 = self->_appleMoveTime;
  self->_appleMoveTime = v4;

}

- (void)setAppleMoveTimeGoal:(HKQuantity *)appleMoveTimeGoal
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *v6;

  v4 = appleMoveTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("appleMoveTimeGoal"));

  v6 = self->_appleMoveTimeGoal;
  self->_appleMoveTimeGoal = v4;

}

- (void)setExerciseTimeGoal:(HKQuantity *)exerciseTimeGoal
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *appleExerciseTimeGoal;

  v4 = exerciseTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("exerciseTimeGoal"));

  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  self->_appleExerciseTimeGoal = v4;

}

- (void)setStandHoursGoal:(HKQuantity *)standHoursGoal
{
  HKQuantity *v4;
  void *v5;
  HKQuantity *appleStandHoursGoal;

  v4 = standHoursGoal;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _validateQuantityAssignment:expectedUnit:propertyName:](self, "_validateQuantityAssignment:expectedUnit:propertyName:", v4, v5, CFSTR("standHoursGoal"));

  appleStandHoursGoal = self->_appleStandHoursGoal;
  self->_appleStandHoursGoal = v4;

}

- (void)setActivityMoveMode:(HKActivityMoveMode)activityMoveMode
{
  self->_activityMoveMode = activityMoveMode;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void)setDeprecatedPauseForInternalSwiftClient:(BOOL)a3
{
  self->_paused = a3;
}

+ (BOOL)_validateActivitySummaryDateComponentsRange:(id)a3 endDateComponents:(id)a4 errorMessage:(id *)a5
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  v9 = +[HKActivitySummary _validateActivitySummaryDateComponents:errorMessage:](HKActivitySummary, "_validateActivitySummaryDateComponents:errorMessage:", v7, &v22);
  v10 = v22;
  if (v9)
  {
    v21 = v10;
    v11 = +[HKActivitySummary _validateActivitySummaryDateComponents:errorMessage:](HKActivitySummary, "_validateActivitySummaryDateComponents:errorMessage:", v8, &v21);
    v12 = v21;

    if (v11)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99D48]);
      v14 = (void *)objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      objc_msgSend(v7, "hk_translateDateComponentsToCalendar:calendarUnits:", v14, 30);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "hk_translateDateComponentsToCalendar:calendarUnits:", v14, 30);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "dateFromComponents:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateFromComponents:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && objc_msgSend(v17, "hk_isBeforeDate:", v18))
      {
        v19 = 0;
        if (a5)
          *a5 = CFSTR("Start date must be earlier than end date.");
      }
      else
      {
        v19 = 1;
      }

      v8 = (id)v16;
      v7 = (id)v15;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endDateComponents: %@"), v12);
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startDateComponents: %@"), v10);
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v12 = v10;
  }

  return v19;
}

- (double)_moveMinutesCompletionPercentage
{
  HKQuantity *appleMoveTime;
  HKQuantity *appleMoveTimeGoal;
  void *v5;
  double v6;
  double v7;

  appleMoveTime = self->_appleMoveTime;
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _percentageCompleteWithQuantity:goalQuantity:unit:](self, "_percentageCompleteWithQuantity:goalQuantity:unit:", appleMoveTime, appleMoveTimeGoal, v5);
  v7 = v6;

  return v7;
}

BOOL __54__HKActivitySummary__mostSignificantCacheAmongCaches___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "briskMinutesGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "activeHoursGoal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

+ (id)_mostRecentlyCreatedCacheAmongCaches:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_creationDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeIntervalSinceReferenceDate");
          v12 = v11;
          objc_msgSend(v6, "_creationDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          v15 = v14;

          if (v12 > v15)
          {
            v16 = v9;

            v6 = v16;
          }
        }
        else
        {
          v6 = v9;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDate)_moveTimeGoalDate
{
  return self->_moveTimeGoalDate;
}

- (void)_setMoveTimeGoalDate:(id)a3
{
  objc_storeStrong((id *)&self->_moveTimeGoalDate, a3);
}

- (NSDate)_briskMinutesGoalDate
{
  return self->_briskMinutesGoalDate;
}

- (void)_setBriskMinutesGoalDate:(id)a3
{
  objc_storeStrong((id *)&self->_briskMinutesGoalDate, a3);
}

- (NSDate)_activeHoursGoalDate
{
  return self->_activeHoursGoalDate;
}

- (void)_setActiveHoursGoalDate:(id)a3
{
  objc_storeStrong((id *)&self->_activeHoursGoalDate, a3);
}

- (void)_setDailyMoveMinutesStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyMoveMinuteStatistics, a3);
}

- (void)_setDailyMoveTimeStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyMoveTimeStatistics, a3);
}

- (void)_setDataLoading:(BOOL)a3
{
  self->_dataLoading = a3;
}

@end
