@implementation HKWorkoutActivity

- (HKWorkoutActivity)initWithWorkoutConfiguration:(HKWorkoutConfiguration *)workoutConfiguration startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  NSDictionary *v10;
  NSDate *v11;
  NSDate *v12;
  HKWorkoutConfiguration *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  HKWorkoutActivity *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v10 = metadata;
  v11 = endDate;
  v12 = startDate;
  v13 = workoutConfiguration;
  -[HKWorkoutConfiguration suggestedActivityUUID](v13, "suggestedActivityUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v12);
  v18 = -[HKWorkoutActivity _initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:](self, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v17, v13, v12, v11, MEMORY[0x1E0C9AA60], 0, v10, 0);

  v19 = (HKWorkoutActivity *)v18;
  v20 = HKDefaultObjectValidationConfiguration();
  -[HKWorkoutActivity _validateWithConfiguration:](v19, "_validateWithConfiguration:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    objc_msgSend(v22, "localizedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "raise:format:", v25, CFSTR("%@"), v26);

  }
  return v19;
}

- (id)_initWithUUID:(id)a3 workoutConfiguration:(id)a4 startDate:(id)a5 endDate:(id)a6 workoutEvents:(id)a7 startsPaused:(BOOL)a8 duration:(double)a9 metadata:(id)a10 statisticsPerType:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKWorkoutActivity *v25;
  HKWorkoutActivity *v26;
  uint64_t v27;
  NSUUID *UUID;
  uint64_t v29;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v31;
  NSDate *startDate;
  uint64_t v33;
  NSDate *endDate;
  uint64_t v35;
  NSArray *workoutEvents;
  uint64_t v37;
  NSDictionary *metadata;
  uint64_t v39;
  NSMutableDictionary *statisticsPerType;
  objc_super v42;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v24 = a11;
  v42.receiver = self;
  v42.super_class = (Class)HKWorkoutActivity;
  v25 = -[HKWorkoutActivity init](&v42, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_lock._os_unfair_lock_opaque = 0;
    v27 = objc_msgSend(v18, "copy");
    UUID = v26->_UUID;
    v26->_UUID = (NSUUID *)v27;

    v29 = objc_msgSend(v19, "copy");
    workoutConfiguration = v26->_workoutConfiguration;
    v26->_workoutConfiguration = (HKWorkoutConfiguration *)v29;

    v31 = objc_msgSend(v20, "copy");
    startDate = v26->_startDate;
    v26->_startDate = (NSDate *)v31;

    v33 = objc_msgSend(v21, "copy");
    endDate = v26->_endDate;
    v26->_endDate = (NSDate *)v33;

    v35 = objc_msgSend(v22, "copy");
    workoutEvents = v26->_workoutEvents;
    v26->_workoutEvents = (NSArray *)v35;

    v26->_startsPaused = a8;
    v26->_duration = a9;
    v37 = objc_msgSend(v23, "copy");
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v37;

    v39 = objc_msgSend(v24, "mutableCopy");
    statisticsPerType = v26->_statisticsPerType;
    v26->_statisticsPerType = (NSMutableDictionary *)v39;

  }
  return v26;
}

- (id)_deepCopy
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", self->_UUID, self->_workoutConfiguration, self->_startDate, self->_endDate, self->_workoutEvents, self->_startsPaused, self->_duration, self->_metadata, self->_statisticsPerType);
}

- (void)_setEndDate:(id)a3
{
  NSDate *v4;
  NSDate *endDate;
  double v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSDate *)objc_msgSend(v7, "copy");
  endDate = self->_endDate;
  self->_endDate = v4;

  if (self->_duration == 0.0)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", self->_startDate);
    self->_duration = v6;
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDictionary)allStatistics
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary copy](self->_statisticsPerType, "copy");
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA70];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v7;
}

- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType
{
  os_unfair_lock_s *p_lock;
  HKQuantityType *v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = quantityType;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_statisticsPerType, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (HKStatistics *)v6;
}

- (void)_setDuration:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_duration = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_setMetadata:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSDictionary *v6;
  NSDictionary *metadata;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSDictionary *)objc_msgSend(v5, "copy");

  metadata = self->_metadata;
  self->_metadata = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_filterAndSetWorkoutEvents:(id)a3
{
  id v4;
  void *v5;
  NSArray **p_workoutEvents;
  NSArray *workoutEvents;
  char v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HKWorkoutActivity__filterAndSetWorkoutEvents___block_invoke;
  v10[3] = &unk_1E37EA6A8;
  v10[4] = self;
  v10[5] = &v15;
  v10[6] = &v11;
  objc_msgSend(v4, "hk_filter:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)v16 + 24))
    self->_startsPaused = *((_BYTE *)v12 + 24);
  workoutEvents = self->_workoutEvents;
  p_workoutEvents = &self->_workoutEvents;
  v8 = -[NSArray isEqual:](workoutEvents, "isEqual:", v5);
  if ((v8 & 1) == 0)
    objc_storeStrong((id *)p_workoutEvents, v5);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8 ^ 1;
}

uint64_t __48__HKWorkoutActivity__filterAndSetWorkoutEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;

  v3 = a2;
  objc_msgSend(v3, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "hk_isAfterDate:", v8);

    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", v10);

      if (v11)
      {
        if (objc_msgSend(v3, "workoutEventType") == 1)
        {
          v12 = 1;
        }
        else
        {
          if (objc_msgSend(v3, "workoutEventType") != 2)
            goto LABEL_11;
          v12 = 0;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
      }
    }
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hk_isBeforeDate:", v13) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "hk_isAfterDate:", v14);

    if ((v15 & 1) != 0)
    {
      v16 = 1;
      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "dateInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "duration");
  v19 = v18;

  if (v19 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToDate:", v20) & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "endDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v5, "isEqualToDate:", v21);

    }
  }
  else
  {
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (void)_enumerateActiveTimePeriods:(id)a3
{
  _HKEnumerateActiveWorkoutIntervalsStartingPaused(self->_startDate, self->_endDate, self->_workoutEvents, self->_startsPaused, a3);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@ %@ %@ %@>"), v6, self->_UUID, self->_workoutConfiguration, self->_startDate, self->_endDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (unint64_t)hash
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSUUID hash](self->_UUID, "hash");
  v5 = -[HKWorkoutConfiguration hash](self->_workoutConfiguration, "hash") ^ v4;
  v6 = -[NSDate hash](self->_startDate, "hash");
  v7 = v5 ^ v6 ^ -[NSDate hash](self->_endDate, "hash");
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *UUID;
  HKWorkoutConfiguration *v7;
  HKWorkoutConfiguration *workoutConfiguration;
  NSDate *v9;
  NSDate *startDate;
  NSDate *v11;
  NSDate *endDate;
  NSDictionary *v13;
  NSDictionary *metadata;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  v5 = (NSUUID *)*((_QWORD *)v4 + 3);
  UUID = self->_UUID;
  if (v5 != UUID && (!UUID || !-[NSUUID isEqual:](v5, "isEqual:")))
    goto LABEL_18;
  v7 = (HKWorkoutConfiguration *)*((_QWORD *)v4 + 4);
  workoutConfiguration = self->_workoutConfiguration;
  if (v7 != workoutConfiguration && (!workoutConfiguration || !-[HKWorkoutConfiguration isEqual:](v7, "isEqual:")))
    goto LABEL_18;
  v9 = (NSDate *)*((_QWORD *)v4 + 5);
  startDate = self->_startDate;
  if (v9 != startDate && (!startDate || !-[NSDate isEqualToDate:](v9, "isEqualToDate:")))
    goto LABEL_18;
  v11 = (NSDate *)*((_QWORD *)v4 + 6);
  endDate = self->_endDate;
  if (v11 != endDate && (!endDate || !-[NSDate isEqualToDate:](v11, "isEqualToDate:")))
    goto LABEL_18;
  if (vabdd_f64(*((double *)v4 + 8), self->_duration) >= 2.22044605e-16)
    goto LABEL_18;
  v13 = (NSDictionary *)*((_QWORD *)v4 + 7);
  metadata = self->_metadata;
  if (v13 == metadata)
  {
    v15 = 1;
    goto LABEL_19;
  }
  if (metadata)
    v15 = -[NSDictionary isEqual:](v13, "isEqual:");
  else
LABEL_18:
    v15 = 0;
LABEL_19:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKWorkoutActivity *v3;

  v3 = self;
  return -[HKWorkoutActivity _initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:](v3, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v3->_UUID, v3->_workoutConfiguration, v3->_startDate, v3->_endDate, v3->_workoutEvents, v3->_startsPaused, v3->_duration, v3->_metadata, v3->_statisticsPerType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutConfiguration, CFSTR("configuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("start_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("end_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutEvents, CFSTR("events"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statisticsPerType, CFSTR("statistics"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_startsPaused, CFSTR("startsPaused"));

}

- (HKWorkoutActivity)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HKWorkoutActivity *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start_date"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("end_date"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v20, CFSTR("events"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("duration"));
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_replaceKeysFromSharedStringCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("statistics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("startsPaused"));

  v18 = -[HKWorkoutActivity _initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:](self, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v4, v23, v22, v21, v7, v17, v9, v12, v16);
  return v18;
}

- (BOOL)unitTest_isEqualToActivity:(id)a3 includingStatistics:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
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
  HKWorkoutActivity *v69;
  NSMutableDictionary *obj;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id *v81;
  uint64_t v82;
  int v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v8 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v81 = (id *)a3;
  v10 = -[HKWorkoutActivity isEqual:](self, "isEqual:");
  if (v10 && v8)
  {
    v11 = (void *)-[NSMutableDictionary count](self->_statisticsPerType, "count");
    objc_msgSend(v81, "_statisticsPerType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 == (void *)v13)
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = self->_statisticsPerType;
      v79 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      if (v79)
      {
        v78 = *(_QWORD *)v86;
        v69 = self;
LABEL_6:
        v14 = 0;
        while (1)
        {
          v15 = v4;
          v16 = v11;
          if (*(_QWORD *)v86 != v78)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v14);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_statisticsPerType, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81[1], "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v18;
          objc_msgSend(v18, "startDate");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v21 = (void *)v20;
          v82 = objc_claimAutoreleasedReturnValue();
          if (v20 != v82)
          {
            objc_msgSend(v19, "startDate");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v5)
            {
              LOBYTE(v83) = 1;
              v11 = v16;
              v4 = v15;
              v26 = v21;
              v31 = (void *)v82;
              goto LABEL_73;
            }
            objc_msgSend(v84, "startDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "startDate");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = v22;
            if (!objc_msgSend(v22, "isEqualToDate:"))
            {
              LOBYTE(v83) = 1;
              v11 = v16;
              v4 = v15;
              v26 = v21;
              v31 = (void *)v82;
LABEL_72:

              goto LABEL_73;
            }
          }
          v80 = v5;
          v11 = v16;
          objc_msgSend(v84, "endDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "endDate");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          v4 = v15;
          if (v23 == (void *)v24)
          {
            v27 = v11;
            v28 = (void *)v24;
            v29 = v23;
            v30 = v4;
            v71 = v21;
          }
          else
          {
            objc_msgSend(v19, "endDate");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v73)
            {

              v73 = 0;
              LOBYTE(v83) = 1;
              v26 = v21;
LABEL_31:
              v31 = (void *)v82;
              goto LABEL_71;
            }
            objc_msgSend(v84, "endDate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "endDate");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v21;
            if ((objc_msgSend(v11, "isEqualToDate:", v7) & 1) == 0)
            {

              LOBYTE(v83) = 1;
              goto LABEL_31;
            }
            v71 = v21;
            v27 = v11;
            v28 = v25;
            v29 = v23;
            v30 = v4;
          }
          objc_msgSend(v84, "sumQuantity");
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sumQuantity");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)v32;
          if ((void *)v32 == v74)
          {
            v4 = v30;
          }
          else
          {
            objc_msgSend(v19, "sumQuantity");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v67)
            {
              v4 = v30;
              v67 = 0;
              LOBYTE(v83) = 1;
              v31 = (void *)v82;
              v34 = v29;
              v36 = v28;
              v11 = v27;
              v26 = v71;
              goto LABEL_67;
            }
            objc_msgSend(v84, "sumQuantity");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "sumQuantity");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v4, "isEqual:", v6) & 1) == 0)
            {

              if (v29 == v28)
              {

                LOBYTE(v83) = 1;
                v31 = (void *)v82;
                v33 = v71 == (void *)v82;
                self = v69;
                v5 = v80;
                v11 = v27;
                v26 = v71;
              }
              else
              {

                v11 = v27;
                LOBYTE(v83) = 1;
                v31 = (void *)v82;
                v26 = v71;
                v33 = v71 == (void *)v82;
                self = v69;
                v5 = v80;
              }
              if (v33)
                goto LABEL_73;
              goto LABEL_72;
            }
          }
          v34 = v29;
          objc_msgSend(v84, "minimumQuantity");
          v35 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "minimumQuantity");
          v68 = (void *)v35;
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if ((void *)v35 == v66)
          {
            v36 = v28;
            v11 = v27;
            v26 = v71;
          }
          else
          {
            objc_msgSend(v19, "minimumQuantity");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v28;
            if (!v61)
            {
              v61 = 0;
              LOBYTE(v83) = 1;
              v31 = (void *)v82;
              v11 = v27;
              v26 = v71;
              goto LABEL_57;
            }
            v64 = v28;
            v37 = v7;
            objc_msgSend(v84, "minimumQuantity");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "minimumQuantity");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v38;
            v11 = v27;
            if (!objc_msgSend(v38, "isEqual:"))
            {
              LOBYTE(v83) = 1;
              v7 = v37;
              v26 = v21;
              v31 = (void *)v82;
              goto LABEL_62;
            }
            v7 = v37;
            v26 = v21;
            v36 = v64;
          }
          objc_msgSend(v84, "maximumQuantity");
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "maximumQuantity");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)v39;
          v33 = v39 == (_QWORD)v62;
          v31 = (void *)v82;
          if (v33)
          {
            v64 = v36;
            v65 = v6;
            v72 = v26;
          }
          else
          {
            objc_msgSend(v19, "maximumQuantity");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v57)
            {
              v60 = v34;

              v57 = 0;
              LOBYTE(v83) = 1;
              v50 = v68;
              v51 = v66;
              if (v68 != v66)
                goto LABEL_56;
LABEL_65:

              v34 = v60;
              if (v75 == v74)
                goto LABEL_67;
              goto LABEL_66;
            }
            v64 = v36;
            v65 = v6;
            v72 = v26;
            objc_msgSend(v84, "maximumQuantity");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "maximumQuantity");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v40;
            if (!objc_msgSend(v40, "isEqual:"))
            {
              v60 = v34;
              LOBYTE(v83) = 1;
LABEL_55:
              v6 = v65;

              v50 = v68;
              v51 = v66;
              v26 = v72;
              v36 = v64;
              if (v68 == v66)
                goto LABEL_65;
LABEL_56:

              v34 = v60;
LABEL_57:

              if (v75 == v74)
              {
LABEL_67:

                goto LABEL_68;
              }
LABEL_66:

              goto LABEL_67;
            }
          }
          v55 = v11;
          v56 = v7;
          v41 = v4;
          objc_msgSend(v84, "averageQuantity");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "averageQuantity");
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v68;
          if (v42 == (void *)v43)
            break;
          v45 = (void *)v43;
          objc_msgSend(v19, "averageQuantity");
          v46 = objc_claimAutoreleasedReturnValue();
          if (!v46)
          {

            LOBYTE(v83) = 1;
            goto LABEL_53;
          }
          v47 = (void *)v46;
          objc_msgSend(v84, "averageQuantity");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "averageQuantity");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v48, "isEqual:", v49) ^ 1;

          if (v63 != v62)
            goto LABEL_54;
          v11 = v55;
          v4 = v41;
          v44 = v68;
LABEL_60:

          v51 = v66;
          v7 = v56;
          if (v44 == v66)
          {
            v60 = v34;
            v36 = v64;
            v6 = v65;
            v26 = v72;
            v50 = v68;
            goto LABEL_65;
          }
          v6 = v65;
          v26 = v72;
LABEL_62:

          v36 = v64;
          if (v75 != v74)
            goto LABEL_66;

          v36 = v64;
LABEL_68:
          if (v34 != v36)
          {

          }
LABEL_71:
          self = v69;
          v5 = v80;
          if (v26 != v31)
            goto LABEL_72;
LABEL_73:

          if ((v83 & 1) != 0)
          {
            LOBYTE(v10) = 0;
            goto LABEL_79;
          }
          if (v79 == ++v14)
          {
            v79 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
            if (v79)
              goto LABEL_6;
            goto LABEL_76;
          }
        }

        LOBYTE(v83) = 0;
LABEL_53:
        if (v63 != v62)
        {
LABEL_54:
          v60 = v34;
          v4 = v41;
          v11 = v55;
          v7 = v56;
          goto LABEL_55;
        }
        v11 = v55;
        v4 = v41;
        goto LABEL_60;
      }
LABEL_76:
      LOBYTE(v10) = 1;
LABEL_79:

    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)acceptsAssociationWithObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierWorkoutEffortScore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "sampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v5);

  }
  return v7;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  char var0;
  HKWorkoutConfiguration *workoutConfiguration;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *metadata;
  _BOOL4 v15;
  id v16;
  id v17;
  id v18;

  var0 = a3.var0;
  if (-[NSDate hk_isBeforeDate:](self->_endDate, "hk_isBeforeDate:", self->_startDate, a3.var1))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("startDate (%@) cannot occur after endDate (%@)"), self->_startDate, self->_endDate);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    workoutConfiguration = self->_workoutConfiguration;
    v18 = 0;
    v7 = -[HKWorkoutConfiguration validateIgnoringDeviceSupport:error:](workoutConfiguration, "validateIgnoringDeviceSupport:error:", 1, &v18);
    v8 = v18;
    v9 = v8;
    if (v7)
    {
      v10 = 0;
      if (self->_metadata && (var0 & 8) == 0)
      {
        v11 = HKApplicationSDKVersionToken();
        +[_HKEntitlements entitlementsForCurrentTaskWithError:](_HKEntitlements, "entitlementsForCurrentTaskWithError:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrivateMetadataAccess");

        metadata = self->_metadata;
        v17 = 0;
        v15 = -[NSDictionary hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:](metadata, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", v13, v11, &v17);
        v16 = v17;
        v10 = v16;
        if (v15)
        {

          v10 = 0;
        }
      }
    }
    else
    {
      v10 = v8;
    }

    return v10;
  }
}

- (id)_statisticsPerType
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_statisticsPerType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setAllStatistics:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *statisticsPerType;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");

  statisticsPerType = self->_statisticsPerType;
  self->_statisticsPerType = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)_setStatistics:(id)a3 forType:(id)a4
{
  id v6;
  NSMutableDictionary *statisticsPerType;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  statisticsPerType = self->_statisticsPerType;
  if (!statisticsPerType)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_statisticsPerType;
    self->_statisticsPerType = v8;

    statisticsPerType = self->_statisticsPerType;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](statisticsPerType, "setObject:forKeyedSubscript:", v10, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_setUUID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSUUID *v6;
  NSUUID *UUID;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSUUID *)objc_msgSend(v5, "copy");

  UUID = self->_UUID;
  self->_UUID = v6;

  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return (HKWorkoutConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (NSArray)workoutEvents
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)_startsPaused
{
  return self->_startsPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_statisticsPerType, 0);
}

@end
