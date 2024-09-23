@implementation HKHeartRateSummary

- (int64_t)activityCacheIndex
{
  return self->_activityCacheIndex;
}

- (HKHeartRateSummary)initWithActivityCacheIndex:(int64_t)a3 heartRateDateInterval:(id)a4 restingHeartRate:(id)a5 walkingAverageHeartRate:(id)a6 allDayStatistics:(id)a7 workoutStatistics:(id)a8 workoutRecoveryStatistics:(id)a9 breatheStatistics:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  HKHeartRateSummary *v21;
  HKHeartRateSummary *v22;
  uint64_t v23;
  NSArray *workoutStatistics;
  uint64_t v25;
  NSArray *workoutRecoveryStatistics;
  uint64_t v27;
  NSArray *breatheStatistics;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a4;
  v31 = a5;
  v30 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)HKHeartRateSummary;
  v21 = -[HKHeartRateSummary init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_activityCacheIndex = a3;
    objc_storeStrong((id *)&v21->_heartRateDateInterval, a4);
    objc_storeStrong((id *)&v22->_restingHeartRate, a5);
    objc_storeStrong((id *)&v22->_walkingAverageHeartRate, a6);
    objc_storeStrong((id *)&v22->_allDayStatistics, a7);
    v23 = objc_msgSend(v18, "copy");
    workoutStatistics = v22->_workoutStatistics;
    v22->_workoutStatistics = (NSArray *)v23;

    v25 = objc_msgSend(v19, "copy");
    workoutRecoveryStatistics = v22->_workoutRecoveryStatistics;
    v22->_workoutRecoveryStatistics = (NSArray *)v25;

    v27 = objc_msgSend(v20, "copy");
    breatheStatistics = v22->_breatheStatistics;
    v22->_breatheStatistics = (NSArray *)v27;

  }
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKHeartRateSummary *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v54;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;

  v6 = (HKHeartRateSummary *)a3;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[HKHeartRateSummary activityCacheIndex](self, "activityCacheIndex");
      if (v7 == -[HKHeartRateSummary activityCacheIndex](v6, "activityCacheIndex"))
      {
        -[HKHeartRateSummary heartRateDateInterval](self, "heartRateDateInterval");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary heartRateDateInterval](v6, "heartRateDateInterval");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v8 != (void *)v9;
        if (v8 != (void *)v9)
        {
          -[HKHeartRateSummary heartRateDateInterval](v6, "heartRateDateInterval");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v13 = 0;
LABEL_83:

            goto LABEL_84;
          }
          -[HKHeartRateSummary heartRateDateInterval](self, "heartRateDateInterval");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummary heartRateDateInterval](v6, "heartRateDateInterval");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqual:", v12))
          {
            v13 = 0;
LABEL_41:

            goto LABEL_83;
          }
          v84 = v12;
          v85 = v11;
        }
        -[HKHeartRateSummary restingHeartRate](self, "restingHeartRate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary restingHeartRate](v6, "restingHeartRate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == v15)
        {
          v80 = 0;
        }
        else
        {
          -[HKHeartRateSummary restingHeartRate](v6, "restingHeartRate");
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {

            v13 = 0;
            if (v8 == (void *)v9)
            {
              v10 = 0;
              goto LABEL_82;
            }
            v10 = 1;
LABEL_81:

LABEL_82:
            if (v10)
              goto LABEL_83;
LABEL_84:
            v52 = (void *)v9;
LABEL_85:

            goto LABEL_86;
          }
          v82 = (void *)v16;
          -[HKHeartRateSummary restingHeartRate](self, "restingHeartRate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummary restingHeartRate](v6, "restingHeartRate");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v4, "isEqual:"))
          {
            v13 = 0;
LABEL_40:

            v12 = v84;
            v11 = v85;
            if (v8 == (void *)v9)
              goto LABEL_84;
            goto LABEL_41;
          }
          v80 = v14 != v15;
        }
        -[HKHeartRateSummary walkingAverageHeartRate](self, "walkingAverageHeartRate");
        v17 = objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary walkingAverageHeartRate](v6, "walkingAverageHeartRate");
        v86 = (void *)v17;
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == (_QWORD)v87;
        v19 = v17 != (_QWORD)v87;
        if (v18)
        {
          v75 = v19;
          v77 = v4;
        }
        else
        {
          -[HKHeartRateSummary walkingAverageHeartRate](v6, "walkingAverageHeartRate");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
          {

            v13 = 0;
            if (v14 != v15)
            {
              LOBYTE(v29) = 1;
              goto LABEL_78;
            }
            v29 = 0;
LABEL_87:
            if (!v29)
            {
LABEL_80:

              if (v8 == (void *)v9)
                goto LABEL_82;
              goto LABEL_81;
            }
LABEL_79:

            goto LABEL_80;
          }
          v75 = v19;
          v72 = (void *)v20;
          -[HKHeartRateSummary walkingAverageHeartRate](self, "walkingAverageHeartRate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummary walkingAverageHeartRate](v6, "walkingAverageHeartRate");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v21;
          if (!objc_msgSend(v21, "isEqual:"))
          {
            v78 = v15;
            v13 = 0;
            v28 = v86;
LABEL_39:

            v15 = v78;
            if (v14 == v78)
              goto LABEL_80;
            goto LABEL_40;
          }
          v77 = v4;
        }
        -[HKHeartRateSummary allDayStatistics](self, "allDayStatistics");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary allDayStatistics](v6, "allDayStatistics");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 != v79;
        if (v22 == v79)
        {
          v70 = v14;
          v25 = v3;
          v26 = v8 != (void *)v9;
        }
        else
        {
          -[HKHeartRateSummary allDayStatistics](v6, "allDayStatistics");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {

            v13 = 0;
            v28 = v86;
            v4 = v77;
            v78 = v15;
            if (v86 != v87)
            {
              LOBYTE(v34) = 1;
              goto LABEL_75;
            }
            v34 = 0;
LABEL_89:
            if (!v34)
            {
LABEL_77:

              v15 = v78;
              v29 = v80;
              if (v14 != v78)
              {
LABEL_78:

                if (!v29)
                  goto LABEL_80;
                goto LABEL_79;
              }
              goto LABEL_87;
            }
LABEL_76:

            goto LABEL_77;
          }
          v70 = v14;
          v25 = v3;
          v26 = v8 != (void *)v9;
          v65 = (void *)v24;
          -[HKHeartRateSummary allDayStatistics](self, "allDayStatistics");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummary allDayStatistics](v6, "allDayStatistics");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v27;
          if (!objc_msgSend(v27, "isEqual:"))
          {
            v78 = v15;
            v76 = v22;
            v13 = 0;
            v28 = v86;
            v10 = v8 != (void *)v9;
            v3 = v25;
            v14 = v70;
            goto LABEL_28;
          }
        }
        -[HKHeartRateSummary workoutStatistics](self, "workoutStatistics");
        v30 = objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary workoutStatistics](v6, "workoutStatistics");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)v30;
        v76 = v22;
        if ((void *)v30 == v68)
        {
          v10 = v26;
          v3 = v25;
        }
        else
        {
          -[HKHeartRateSummary workoutStatistics](v6, "workoutStatistics");
          v31 = objc_claimAutoreleasedReturnValue();
          v10 = v26;
          if (!v31)
          {
            v78 = v15;

            v41 = v22;
            v13 = 0;
            v28 = v86;
            v3 = v25;
            v14 = v70;
            if (v41 != v79)
              goto LABEL_69;
            goto LABEL_72;
          }
          v63 = (void *)v31;
          -[HKHeartRateSummary workoutStatistics](self, "workoutStatistics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummary workoutStatistics](v6, "workoutStatistics");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v25;
          v62 = v32;
          if (!objc_msgSend(v32, "isEqual:"))
          {
            v13 = 0;
            v28 = v86;
            v14 = v70;
            v33 = v68;
LABEL_67:

            v78 = v15;
            if (v76 != v79)
            {
              LOBYTE(v23) = 1;
LABEL_69:

              if (!v23)
                goto LABEL_74;
LABEL_73:

              goto LABEL_74;
            }
            v23 = 0;
LABEL_72:
            if (!v23)
              goto LABEL_74;
            goto LABEL_73;
          }
        }
        -[HKHeartRateSummary workoutRecoveryStatistics](self, "workoutRecoveryStatistics");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary workoutRecoveryStatistics](v6, "workoutRecoveryStatistics");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35 == v64)
        {
          v14 = v70;
          -[HKHeartRateSummary breatheStatistics](self, "breatheStatistics", v54);
        }
        else
        {
          -[HKHeartRateSummary workoutRecoveryStatistics](v6, "workoutRecoveryStatistics");
          v36 = objc_claimAutoreleasedReturnValue();
          v14 = v70;
          if (!v36)
          {
            v13 = 0;
            goto LABEL_66;
          }
          v60 = (void *)v36;
          v57 = v35;
          -[HKHeartRateSummary workoutRecoveryStatistics](self, "workoutRecoveryStatistics");
          v37 = objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummary workoutRecoveryStatistics](v6, "workoutRecoveryStatistics");
          v38 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v37;
          v39 = (void *)v37;
          v40 = (void *)v38;
          if ((objc_msgSend(v39, "isEqual:", v38) & 1) == 0)
          {

            v13 = 0;
            v49 = v68;
            v50 = v69;
            v51 = v87;
            if (v69 != v68)
            {
LABEL_96:

            }
LABEL_97:

            if (v76 != v79)
            {

            }
            if (v86 != v51)
            {

            }
            if (v14 != v15)
            {

            }
            v52 = v8;
            v12 = v84;
            v11 = v85;
            if (v8 == (void *)v9)
              goto LABEL_85;
            goto LABEL_41;
          }
          v55 = v40;
          v35 = v57;
          -[HKHeartRateSummary breatheStatistics](self, "breatheStatistics", v55);
        }
        v42 = objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummary breatheStatistics](v6, "breatheStatistics");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v42;
        v13 = v42 == v43;
        if (v13)
        {
          v48 = v44;

        }
        else
        {
          v58 = (void *)v43;
          v71 = v44;
          -[HKHeartRateSummary breatheStatistics](v6, "breatheStatistics");
          v45 = objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v81 = (void *)v45;
            -[HKHeartRateSummary breatheStatistics](self, "breatheStatistics");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKHeartRateSummary breatheStatistics](v6, "breatheStatistics");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v46, "isEqual:", v47);

            if (v35 == v64)
            {

            }
            else
            {

            }
            v49 = v68;
            v50 = v69;
            v51 = v87;
            if (v69 != v68)
              goto LABEL_96;
            goto LABEL_97;
          }

        }
        if (v35 == v64)
        {

          v33 = v68;
          v28 = v86;
          if (v69 != v68)
            goto LABEL_67;
          goto LABEL_92;
        }

LABEL_66:
        v28 = v86;

        v33 = v68;
        if (v69 != v68)
          goto LABEL_67;
LABEL_92:
        v78 = v15;

        if (v76 != v79)
        {
LABEL_28:

          v4 = v77;
          if (v28 == v87)
            goto LABEL_77;
          goto LABEL_39;
        }
LABEL_74:

        v4 = v77;
        v34 = v75;
        if (v28 != v87)
        {
LABEL_75:

          if (!v34)
            goto LABEL_77;
          goto LABEL_76;
        }
        goto LABEL_89;
      }
    }
    v13 = 0;
  }
LABEL_86:

  return v13;
}

- (NSDateInterval)heartRateDateInterval
{
  return self->_heartRateDateInterval;
}

- (HKQuantity)restingHeartRate
{
  return self->_restingHeartRate;
}

- (HKQuantity)walkingAverageHeartRate
{
  return self->_walkingAverageHeartRate;
}

- (HKHeartRateSummaryStatistics)allDayStatistics
{
  return self->_allDayStatistics;
}

- (NSArray)workoutStatistics
{
  return self->_workoutStatistics;
}

- (NSArray)workoutRecoveryStatistics
{
  return self->_workoutRecoveryStatistics;
}

- (NSArray)breatheStatistics
{
  return self->_breatheStatistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breatheStatistics, 0);
  objc_storeStrong((id *)&self->_workoutRecoveryStatistics, 0);
  objc_storeStrong((id *)&self->_workoutStatistics, 0);
  objc_storeStrong((id *)&self->_allDayStatistics, 0);
  objc_storeStrong((id *)&self->_walkingAverageHeartRate, 0);
  objc_storeStrong((id *)&self->_restingHeartRate, 0);
  objc_storeStrong((id *)&self->_heartRateDateInterval, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t activityCacheIndex;
  id v5;

  activityCacheIndex = self->_activityCacheIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", activityCacheIndex, CFSTR("ActivityCacheIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heartRateDateInterval, CFSTR("HeartRateDateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restingHeartRate, CFSTR("RestingHeartRate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_walkingAverageHeartRate, CFSTR("WalkingAverageHeartRate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allDayStatistics, CFSTR("AllDayStatistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutStatistics, CFSTR("WorkoutStatistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutRecoveryStatistics, CFSTR("RecoveryStatistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_breatheStatistics, CFSTR("BreatheStatistics"));

}

- (HKHeartRateSummary)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummary *v5;
  uint64_t v6;
  NSDateInterval *heartRateDateInterval;
  uint64_t v8;
  HKQuantity *restingHeartRate;
  uint64_t v10;
  HKQuantity *walkingAverageHeartRate;
  uint64_t v12;
  HKHeartRateSummaryStatistics *allDayStatistics;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *workoutStatistics;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *workoutRecoveryStatistics;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *breatheStatistics;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKHeartRateSummary;
  v5 = -[HKHeartRateSummary init](&v30, sel_init);
  if (v5)
  {
    v5->_activityCacheIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ActivityCacheIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HeartRateDateInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    heartRateDateInterval = v5->_heartRateDateInterval;
    v5->_heartRateDateInterval = (NSDateInterval *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RestingHeartRate"));
    v8 = objc_claimAutoreleasedReturnValue();
    restingHeartRate = v5->_restingHeartRate;
    v5->_restingHeartRate = (HKQuantity *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WalkingAverageHeartRate"));
    v10 = objc_claimAutoreleasedReturnValue();
    walkingAverageHeartRate = v5->_walkingAverageHeartRate;
    v5->_walkingAverageHeartRate = (HKQuantity *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllDayStatistics"));
    v12 = objc_claimAutoreleasedReturnValue();
    allDayStatistics = v5->_allDayStatistics;
    v5->_allDayStatistics = (HKHeartRateSummaryStatistics *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("WorkoutStatistics"));
    v17 = objc_claimAutoreleasedReturnValue();
    workoutStatistics = v5->_workoutStatistics;
    v5->_workoutStatistics = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("RecoveryStatistics"));
    v22 = objc_claimAutoreleasedReturnValue();
    workoutRecoveryStatistics = v5->_workoutRecoveryStatistics;
    v5->_workoutRecoveryStatistics = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("BreatheStatistics"));
    v27 = objc_claimAutoreleasedReturnValue();
    breatheStatistics = v5->_breatheStatistics;
    v5->_breatheStatistics = (NSArray *)v27;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  HKQuantity *restingHeartRate;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  HKQuantity *walkingAverageHeartRate;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_activityCacheIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  restingHeartRate = self->_restingHeartRate;
  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](restingHeartRate, "doubleValueForUnit:", v7);
  v9 = v8;
  walkingAverageHeartRate = self->_walkingAverageHeartRate;
  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](walkingAverageHeartRate, "doubleValueForUnit:", v11);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p cacheIndex:%@ resting:%.1fbpm walking:%.1fbpm day:%@ workout:%@ recovery:%@ breathe:%@>"), v4, self, v5, v9, v12, self->_allDayStatistics, self->_workoutStatistics, self->_workoutRecoveryStatistics, self->_breatheStatistics);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  int64_t activityCacheIndex;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  activityCacheIndex = self->_activityCacheIndex;
  -[HKHeartRateSummary heartRateDateInterval](self, "heartRateDateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[HKHeartRateSummary restingHeartRate](self, "restingHeartRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[HKHeartRateSummary walkingAverageHeartRate](self, "walkingAverageHeartRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ activityCacheIndex;
  -[HKHeartRateSummary allDayStatistics](self, "allDayStatistics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[HKHeartRateSummary workoutStatistics](self, "workoutStatistics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[HKHeartRateSummary workoutRecoveryStatistics](self, "workoutRecoveryStatistics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[HKHeartRateSummary breatheStatistics](self, "breatheStatistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (id)deepCopy
{
  void *v3;
  void *v4;
  void *v5;
  HKHeartRateSummary *v6;
  int64_t activityCacheIndex;
  NSDateInterval *heartRateDateInterval;
  HKQuantity *restingHeartRate;
  HKQuantity *walkingAverageHeartRate;
  void *v11;
  HKHeartRateSummary *v12;

  -[NSArray hk_map:](self->_workoutStatistics, "hk_map:", &__block_literal_global_131);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray hk_map:](self->_workoutRecoveryStatistics, "hk_map:", &__block_literal_global_33_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray hk_map:](self->_breatheStatistics, "hk_map:", &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HKHeartRateSummary alloc];
  activityCacheIndex = self->_activityCacheIndex;
  heartRateDateInterval = self->_heartRateDateInterval;
  restingHeartRate = self->_restingHeartRate;
  walkingAverageHeartRate = self->_walkingAverageHeartRate;
  v11 = (void *)-[HKHeartRateSummaryStatistics copy](self->_allDayStatistics, "copy");
  v12 = -[HKHeartRateSummary initWithActivityCacheIndex:heartRateDateInterval:restingHeartRate:walkingAverageHeartRate:allDayStatistics:workoutStatistics:workoutRecoveryStatistics:breatheStatistics:](v6, "initWithActivityCacheIndex:heartRateDateInterval:restingHeartRate:walkingAverageHeartRate:allDayStatistics:workoutStatistics:workoutRecoveryStatistics:breatheStatistics:", activityCacheIndex, heartRateDateInterval, restingHeartRate, walkingAverageHeartRate, v11, v3, v4, v5);

  return v12;
}

id __30__HKHeartRateSummary_deepCopy__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

id __30__HKHeartRateSummary_deepCopy__block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

id __30__HKHeartRateSummary_deepCopy__block_invoke_3(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (void)setActivityCacheIndex:(int64_t)a3
{
  self->_activityCacheIndex = a3;
}

- (void)setHeartRateDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateDateInterval, a3);
}

- (void)setRestingHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_restingHeartRate, a3);
}

- (void)setWalkingAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_walkingAverageHeartRate, a3);
}

- (void)setAllDayStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_allDayStatistics, a3);
}

- (void)setWorkoutStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_workoutStatistics, a3);
}

- (void)setWorkoutRecoveryStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRecoveryStatistics, a3);
}

- (void)setBreatheStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_breatheStatistics, a3);
}

@end
