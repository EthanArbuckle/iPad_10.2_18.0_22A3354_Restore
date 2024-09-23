@implementation MTTimer

- (BOOL)isCurrentTimer
{
  void *v2;
  char v3;

  -[MTTimer title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CURRENT_TIMER"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong((id *)&self->_fireTime, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

uint64_t __34__MTTimer_currentTimerFromTimers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentTimer");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initCommon
{
  MTTimer *v2;
  void *v3;
  uint64_t v4;
  id currentDateProvider;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTTimer;
  v2 = -[MTTimer init](&v7, sel_init);
  MTCurrentDateProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  currentDateProvider = v2->_currentDateProvider;
  v2->_currentDateProvider = (id)v4;

  return v2;
}

- (id)initFromDeserializer:(id)a3
{
  void *v4;
  id v5;
  float v6;
  float v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  BOOL v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_class *v38;
  void *v39;
  int v40;
  objc_class *v41;
  void *v42;
  int v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  double v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "mtCoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTTimer _initCommon](self, "_initCommon");
  if (!v5)
    goto LABEL_41;
  if (objc_msgSend(v4, "mtType") == 3)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MTTimerDataVersion"));
    v7 = v6;
    if (v6 < 1.3)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerID"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v8;

    }
    if (v7 >= 1.4)
    {
      if (v7 < 1.5)
        goto LABEL_18;
      v16 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerSound"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "soundVolume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "toneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "vibrationIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v12, v13, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)*((_QWORD *)v5 + 8);
        *((_QWORD *)v5 + 8) = v14;

        v16 = 1;
      }
      else
      {
        v16 = 0;
      }

      if (v7 < 1.5)
      {
        if (v11)
        {
          v18 = *((id *)v5 + 8);
          goto LABEL_19;
        }
LABEL_18:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerSound"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v20 = v18;
        objc_msgSend(v18, "toneIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v21, 0, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)*((_QWORD *)v5 + 8);
        *((_QWORD *)v5 + 8) = v22;

        if (v7 >= 1.6)
        {
LABEL_25:
          v16 = 1;
          goto LABEL_26;
        }
        goto LABEL_20;
      }
    }
    if (v7 >= 1.6)
    {
LABEL_26:
      MTLogForCategory(4);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v64 = v5;
        v65 = 2048;
        v66 = v7;
        _os_log_impl(&dword_19AC4E000, v30, OS_LOG_TYPE_INFO, "%{public}@ read data version: %f", buf, 0x16u);
      }

      v17 = v16 != 0;
      goto LABEL_29;
    }
    if (!v16)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerSound"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      v24 = v19;
      if (objc_msgSend(v19, "soundType") == 1)
      {
        v25 = *MEMORY[0x1E0DBF788];
        objc_msgSend(v24, "soundVolume");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v25, 0, v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)*((_QWORD *)v5 + 8);
        *((_QWORD *)v5 + 8) = v27;

      }
      else
      {
        v29 = v24;
        v26 = (void *)*((_QWORD *)v5 + 8);
        *((_QWORD *)v5 + 8) = v29;
      }

      goto LABEL_25;
    }
LABEL_20:
    v19 = *((id *)v5 + 8);
    goto LABEL_21;
  }
  v17 = 0;
LABEL_29:
  if (!*((_QWORD *)v5 + 1))
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithUUIDString:", v32);
    v34 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v33;

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerState"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v5 + 2) = objc_msgSend(v35, "unsignedIntegerValue");

  if (*((_QWORD *)v5 + 2) >= 4uLL)
  {
    NSLog(CFSTR("state must be a valid MTTimerState enum, was: %lu"), *((_QWORD *)v5 + 2));
    *((_QWORD *)v5 + 2) = 0;
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MTTimerDuration"));
  *((_QWORD *)v5 + 3) = v36;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerFireTimerClass"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (objc_class *)objc_opt_class();
  NSStringFromClass(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v37, "isEqualToString:", v39);

  if (v40
    || (v41 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v41),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v43 = objc_msgSend(v37, "isEqualToString:", v42),
        v42,
        v43))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerFireTime"));
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = *((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v44;
  }
  else
  {
    MTLogForCategory(4);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[MTTimer initFromDeserializer:].cold.1((uint64_t)v37, v45);
  }

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerTitle"));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v46;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerLastModifiedDate"));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v48;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerFiredDate"));
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v50;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerDismissedDate"));
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v52;

  if (!v17)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerSound"));
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v54;

  }
  v56 = (void *)MEMORY[0x1E0C99E60];
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  objc_msgSend(v56, "setWithObjects:", v57, v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v59, CFSTR("MTTimerSiriContext"));
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)*((_QWORD *)v5 + 10);
  *((_QWORD *)v5 + 10) = v60;

LABEL_41:
  return v5;
}

- (void)serializeWithSerializer:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a3, "mtCoder");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "mtType") == 2)
  {
    LODWORD(v4) = 1070386381;
    objc_msgSend(v17, "encodeFloat:forKey:", CFSTR("MTTimerDataVersion"), v4);
  }
  -[MTTimer timerIDString](self, "timerIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("MTTimerID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTTimer state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("MTTimerState"));

  -[MTTimer duration](self, "duration");
  objc_msgSend(v17, "encodeDouble:forKey:", CFSTR("MTTimerDuration"));
  -[MTTimer fireTime](self, "fireTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("MTTimerFireTimerClass"));

  -[MTTimer fireTime](self, "fireTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("MTTimerFireTime"));

  -[MTTimer title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("MTTimerTitle"));

  -[MTTimer lastModifiedDate](self, "lastModifiedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("MTTimerLastModifiedDate"));

  -[MTTimer firedDate](self, "firedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("MTTimerFiredDate"));

  -[MTTimer dismissedDate](self, "dismissedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("MTTimerDismissedDate"));

  -[MTTimer sound](self, "sound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("MTTimerSound"));

  -[MTTimer siriContext](self, "siriContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("MTTimerSiriContext"));

}

- (MTTimerTime)fireTime
{
  return self->_fireTime;
}

- (NSString)timerIDString
{
  void *v2;
  void *v3;

  -[MTTimer timerID](self, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[MTTimer timerID](self, "timerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", -[MTTimer state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer duration](self, "duration");
  v8 = (int)v7;
  -[MTTimer firedDate](self, "firedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer dismissedDate](self, "dismissedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer sound](self, "sound");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer siriContext](self, "siriContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@:%p TimerID: %@, Title: %@, state:%@, duration:%d, firedDate: %@, dismissedDate: %@, sound: %@, siriContext: %@>"), v3, self, v4, v5, v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (MTSound)sound
{
  return self->_sound;
}

- (NSDictionary)siriContext
{
  return self->_siriContext;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (unint64_t)state
{
  return self->_state;
}

+ (id)descriptionForState:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Invalid State");
  else
    return off_1E39CED78[a3];
}

+ (id)currentTimerFromTimers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)shouldBeScheduled
{
  return -[MTTimer state](self, "state") == 3;
}

- (id)upcomingTriggersAfterDate:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[MTTimer nextTriggerAfterDate:](self, "nextTriggerAfterDate:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)propertiesAffectingSessions
{
  if (propertiesAffectingSessions_onceToken != -1)
    dispatch_once(&propertiesAffectingSessions_onceToken, &__block_literal_global_17);
  return (id)propertiesAffectingSessions_propertiesAffectingSessions;
}

void __50__MTTimer_Properties__propertiesAffectingSessions__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("MTTimerState");
  v4[1] = CFSTR("MTTimerFireTimerClass");
  v4[2] = CFSTR("MTTimerFireTime");
  v4[3] = CFSTR("MTTimerTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingSessions_propertiesAffectingSessions;
  propertiesAffectingSessions_propertiesAffectingSessions = v2;

}

- (MTTimer)initWithState:(unint64_t)a3 duration:(double)a4
{
  void *v7;
  MTTimer *v8;

  MTCurrentDateProvider();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MTTimer initWithState:duration:currentDateProvider:](self, "initWithState:duration:currentDateProvider:", a3, v7, a4);

  return v8;
}

- (MTTimer)initWithState:(unint64_t)a3 duration:(double)a4 currentDateProvider:(id)a5
{
  id v8;
  MTTimer *v9;
  uint64_t v10;
  NSUUID *timerID;
  uint64_t v12;
  id currentDateProvider;
  uint64_t v14;
  MTTimerTime *fireTime;
  uint64_t v16;
  MTSound *sound;
  objc_super v19;

  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MTTimer;
  v9 = -[MTTimer init](&v19, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    timerID = v9->_timerID;
    v9->_timerID = (NSUUID *)v10;

    v9->_state = a3;
    if (a3 >= 4)
    {
      NSLog(CFSTR("state must be a valid MTTimerState, was: %lu"), a3);
      v9->_state = 0;
    }
    v9->_duration = a4;
    v12 = objc_msgSend(v8, "copy");
    currentDateProvider = v9->_currentDateProvider;
    v9->_currentDateProvider = (id)v12;

    objc_msgSend((id)objc_opt_class(), "_timerTimeForState:remainingTime:currentDateProvider:", a3, v9->_currentDateProvider, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    fireTime = v9->_fireTime;
    v9->_fireTime = (MTTimerTime *)v14;

    +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    sound = v9->_sound;
    v9->_sound = (MTSound *)v16;

  }
  return v9;
}

- (MTTimer)initWithIdentifier:(id)a3
{
  id v4;
  MTTimer *v5;
  uint64_t v6;
  NSUUID *timerID;

  v4 = a3;
  v5 = -[MTTimer _initCommon](self, "_initCommon");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timerID = v5->_timerID;
    v5->_timerID = (NSUUID *)v6;

  }
  return v5;
}

+ (id)firstActiveTimerFromTimers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isActiveTimer:", v9, (_QWORD)v12) & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)isActiveTimer:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "state") == 3 || objc_msgSend(v3, "state") == 2;

  return v4;
}

- (NSURL)timerURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MTTimer timerID](self, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("x-apple-clock:timer?id="), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (double)remainingTime
{
  void *v2;
  double v3;
  double v4;

  -[MTTimer fireTime](self, "fireTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remainingTime");
  v4 = v3;

  return v4;
}

- (NSDate)fireDate
{
  void *v3;
  void *v4;

  if (-[MTTimer state](self, "state") == 3)
  {
    (*((void (**)(void))self->_currentDateProvider + 2))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimer remainingTime](self, "remainingTime");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSString)displayTitle
{
  void *v3;
  void *v4;

  if (-[MTTimer hasDefaultTitle](self, "hasDefaultTitle"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TIMER_DEFAULT_TITLE"), &stru_1E39CF258, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MTTimer title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (BOOL)hasDefaultTitle
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MTTimer title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_TIMER")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MTTimer title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      -[MTTimer title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == 0;

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (id)timerByRestarting
{
  void *v2;
  void *v3;

  -[MTTimer timerByUpdatingWithState:](self, "timerByUpdatingWithState:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerByUpdatingWithState:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timerByUpdatingWithState:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[MTTimer mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[MTTimer fireTime](self, "fireTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    -[MTTimer displayTitle](self, "displayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

    if (!v7)
    {
      -[MTTimer timerIDString](self, "timerIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timerIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "compare:", v11);

    }
  }

  return v7;
}

- (id)nextTrigger
{
  void *v3;
  void *v4;

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer nextTriggerAfterDate:](self, "nextTriggerAfterDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextTriggerAfterDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTTimer lastModifiedDate](self, "lastModifiedDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[MTTimer lastModifiedDate](self, "lastModifiedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mtIsAfterDate:", v4);

    if (v8)
    {
      MTLogForCategory(4);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[MTTimer timerID](self, "timerID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTTimer lastModifiedDate](self, "lastModifiedDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v10;
        v44 = 2114;
        v45 = v4;
        v46 = 2114;
        v47 = v11;
        _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ modified after %{public}@ (%{public}@)", buf, 0x20u);

      }
      -[MTTimer lastModifiedDate](self, "lastModifiedDate");
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v12;
    }
  }
  -[MTTimer firedDate](self, "firedDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MTTimer firedDate](self, "firedDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mtIsAfterDate:", v4);

    if (v16)
    {
      MTLogForCategory(4);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[MTTimer timerID](self, "timerID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTTimer firedDate](self, "firedDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v44 = 2114;
        v45 = v4;
        v46 = 2114;
        v47 = v19;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ already fired after %{public}@ (%{public}@)", buf, 0x20u);

      }
      -[MTTimer firedDate](self, "firedDate");
      v20 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v20;
    }
  }
  -[MTTimer dismissedDate](self, "dismissedDate");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[MTTimer dismissedDate](self, "dismissedDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "mtIsAfterDate:", v4);

    if (v24)
    {
      MTLogForCategory(4);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[MTTimer timerID](self, "timerID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTTimer dismissedDate](self, "dismissedDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v26;
        v44 = 2114;
        v45 = v4;
        v46 = 2114;
        v47 = v27;
        _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ already dismissed after %{public}@ (%{public}@)", buf, 0x20u);

      }
      -[MTTimer dismissedDate](self, "dismissedDate");
      v28 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v28;
    }
  }
  MTLogForCategory(4);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[MTTimer nextTriggerAfterDate:].cold.1(self, (uint64_t)v4, v29);

  if (-[MTTimer state](self, "state") == 3)
  {
    v30 = objc_opt_class();
    -[MTTimer fireTime](self, "fireTime");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
      v33 = v32;
      if (!v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v30, objc_opt_class());

      }
    }
    else
    {
      v33 = 0;
    }

    objc_msgSend(v33, "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "mtIsAfterOrSameAsDate:", v4))
    {
      +[MTTrigger triggerWithDate:triggerType:](MTTrigger, "triggerWithDate:triggerType:", v37, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      MTLogForCategory(4);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = v37;
        v44 = 2114;
        v45 = v4;
        _os_log_impl(&dword_19AC4E000, v38, OS_LOG_TYPE_DEFAULT, "Next trigger date %{public}@ is prior to requested date %{public}@", buf, 0x16u);
      }

      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }
  MTLogForCategory(4);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimer timerID](self, "timerID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v40;
    v44 = 2114;
    v45 = v36;
    _os_log_impl(&dword_19AC4E000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ has next trigger %{public}@", buf, 0x16u);

  }
  return v36;
}

- (BOOL)isFiring
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[MTTimer state](self, "state") == 3)
    return 0;
  -[MTTimer firedDate](self, "firedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MTTimer dismissedDate](self, "dismissedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[MTTimer firedDate](self, "firedDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTTimer dismissedDate](self, "dismissedDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "mtIsAfterDate:", v7);

    }
    else
    {
      v3 = 1;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)stateChangeIsAllowableFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a3 == 2 && a4 == 2)
    return 1;
  return a3 == 3 || a4 != 2;
}

- (void)setState:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  if (a3 < 4)
  {
    if (self->_state != a3)
    {
      -[MTTimer fireTime](self, "fireTime");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "remainingTime");
      v7 = v6;

      if (a3 == 1)
      {
        -[MTTimer duration](self, "duration");
        v7 = v8;
      }
      objc_msgSend((id)objc_opt_class(), "_timerTimeForState:remainingTime:currentDateProvider:", a3, self->_currentDateProvider, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTTimer setFireTime:](self, "setFireTime:", v9);

      self->_state = a3;
    }
  }
  else
  {
    NSLog(CFSTR("state must be a valid MTTimerState, was: %lu"), a2, a3);
  }
}

- (void)setSound:(id)a3
{
  MTSound *v4;
  MTSound *v5;
  MTSound *sound;
  MTSound *v7;

  v4 = (MTSound *)a3;
  if (self->_sound != v4)
  {
    if (!v4)
    {
      +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1);
      v4 = (MTSound *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v4;
    v5 = (MTSound *)-[MTSound copy](v4, "copy");
    sound = self->_sound;
    self->_sound = v5;

    v4 = v7;
  }

}

- (void)setDuration:(double)a3
{
  if (-[MTTimer state](self, "state") != 1)
    NSLog(CFSTR("Timer duration can only be modified while stopped."));
  if (-[MTTimer state](self, "state") == 1)
  {
    if (a3 > 0.0)
      -[MTTimer _setDuration:](self, "_setDuration:", a3);
    else
      NSLog(CFSTR("Timer duration must be positive."));
  }
}

- (void)_setDuration:(double)a3
{
  id v4;

  if (self->_duration != a3)
  {
    self->_duration = a3;
    if (-[MTTimer state](self, "state") == 1)
    {
      objc_msgSend((id)objc_opt_class(), "_timerTimeForState:remainingTime:currentDateProvider:", 1, self->_currentDateProvider, self->_duration);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[MTTimer setFireTime:](self, "setFireTime:", v4);

    }
  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTTimer timerID](self, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[MTTimer isEqualToTimer:](self, "isEqualToTimer:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)isEqualIgnoringLastModifiedDate:(id)a3
{
  return -[MTTimer _isEqualToTimer:checkLastModified:](self, "_isEqualToTimer:checkLastModified:", a3, 0);
}

- (BOOL)isEqualToTimer:(id)a3
{
  return -[MTTimer _isEqualToTimer:checkLastModified:](self, "_isEqualToTimer:checkLastModified:", a3, 1);
}

- (BOOL)_isEqualToTimer:(id)a3 checkLastModified:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
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
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;

  v4 = a4;
  v6 = a3;
  -[MTTimer timerID](self, "timerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    v9 = -[MTTimer state](self, "state");
    if (v9 == objc_msgSend(v6, "state"))
    {
      -[MTTimer duration](self, "duration");
      v11 = round(v10);
      objc_msgSend(v6, "duration");
      if (v11 == round(v12))
      {
        -[MTTimer fireTime](self, "fireTime");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fireTime");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v13;
        if ((void *)v13 != v14)
        {
          -[MTTimer fireTime](self, "fireTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "fireTime");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            v16 = 0;
            goto LABEL_49;
          }
        }
        -[MTTimer title](self, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v65 = objc_claimAutoreleasedReturnValue();
        if (v18 != (void *)v65)
        {
          -[MTTimer title](self, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "title");
          v64 = v19;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v19, "isEqual:", v63))
          {
            v16 = 0;
            v20 = (void *)v65;
LABEL_47:

LABEL_48:
            if (v68 == v14)
            {
LABEL_50:

              goto LABEL_8;
            }
LABEL_49:

            goto LABEL_50;
          }
        }
        if (v4)
        {
          objc_msgSend(v6, "lastModifiedDate");
          v21 = objc_claimAutoreleasedReturnValue();
          -[MTTimer lastModifiedDate](self, "lastModifiedDate");
          v22 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)v21;
          if (v21 == v22)
          {
            v61 = 0;
            v55 = (void *)v21;
          }
          else
          {
            v55 = (void *)v22;
            objc_msgSend(v6, "lastModifiedDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTTimer lastModifiedDate](self, "lastModifiedDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v23;
            if ((objc_msgSend(v23, "isEqual:", v24) & 1) == 0)
            {

              v16 = 0;
              goto LABEL_46;
            }
            v50 = v24;
            v61 = 1;
          }
        }
        else
        {
          v61 = 0;
        }
        -[MTTimer firedDate](self, "firedDate");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firedDate");
        v26 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v25;
        v27 = v25 == v26;
        v28 = (void *)v26;
        if (v27)
        {
          v30 = v14;
          v31 = v18;
          v32 = (void *)v26;
        }
        else
        {
          -[MTTimer firedDate](self, "firedDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "firedDate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v29;
          if (!objc_msgSend(v29, "isEqual:"))
          {
            v16 = 0;
            v36 = v62;
            goto LABEL_40;
          }
          v30 = v14;
          v31 = v18;
          v32 = v28;
        }
        -[MTTimer dismissedDate](self, "dismissedDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dismissedDate");
        v59 = v32;
        v60 = objc_claimAutoreleasedReturnValue();
        if (v33 != (void *)v60)
        {
          -[MTTimer dismissedDate](self, "dismissedDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dismissedDate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v34;
          if (!objc_msgSend(v34, "isEqual:"))
          {
            v16 = 0;
            v35 = (void *)v60;
            v18 = v31;
            v14 = v30;
LABEL_38:

LABEL_39:
            v28 = v59;
            v36 = v62;
            if (v62 == v59)
            {

              if (v61)
              {
LABEL_41:

                if (!v4)
                {
LABEL_46:
                  v20 = (void *)v65;
                  if (v18 == (void *)v65)
                    goto LABEL_48;
                  goto LABEL_47;
                }
LABEL_45:

                goto LABEL_46;
              }
LABEL_44:
              if (!v4)
                goto LABEL_46;
              goto LABEL_45;
            }
LABEL_40:

            if ((v61 & 1) != 0)
              goto LABEL_41;
            goto LABEL_44;
          }
        }
        v18 = v31;
        v14 = v30;
        -[MTTimer sound](self, "sound");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sound");
        v51 = objc_claimAutoreleasedReturnValue();
        if (v37 == (void *)v51)
        {
          v46 = v33;
          v47 = v18;
        }
        else
        {
          -[MTTimer sound](self, "sound");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sound");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v38;
          if (!objc_msgSend(v38, "isEqual:"))
          {
            v16 = 0;
            v44 = (void *)v51;
            goto LABEL_36;
          }
          v46 = v33;
          v47 = v18;
        }
        -[MTTimer siriContext](self, "siriContext");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "siriContext");
        v40 = objc_claimAutoreleasedReturnValue();
        if (v39 == (void *)v40)
        {

          v16 = 1;
        }
        else
        {
          v41 = (void *)v40;
          -[MTTimer siriContext](self, "siriContext");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "siriContext");
          v45 = v37;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v42, "isEqual:", v43);

          v37 = v45;
        }
        v44 = (void *)v51;
        v33 = v46;
        v18 = v47;
        if (v37 == (void *)v51)
        {
LABEL_37:

          v35 = (void *)v60;
          if (v33 == (void *)v60)
            goto LABEL_39;
          goto LABEL_38;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MTMutableTimer *v4;
  void *v5;
  MTMutableTimer *v6;

  v4 = +[MTMutableTimer allocWithZone:](MTMutableTimer, "allocWithZone:", a3);
  -[MTTimer timerID](self, "timerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTTimer initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[MTTimer _copyStateOntoTimer:](self, "_copyStateOntoTimer:", v6);
  return v6;
}

- (void)_copyStateOntoTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MTTimer currentDateProvider](self, "currentDateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentDateProvider:", v5);

  -[MTTimer fireTime](self, "fireTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFireTime:", v6);

  -[MTTimer duration](self, "duration");
  objc_msgSend(v4, "_setDuration:");
  objc_msgSend(v4, "setState:", -[MTTimer state](self, "state"));
  -[MTTimer title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v7);

  -[MTTimer lastModifiedDate](self, "lastModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastModifiedDate:", v8);

  -[MTTimer firedDate](self, "firedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFiredDate:", v9);

  -[MTTimer dismissedDate](self, "dismissedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissedDate:", v10);

  -[MTTimer sound](self, "sound");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSound:", v11);

  -[MTTimer siriContext](self, "siriContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriContext:", v12);

}

+ (id)_timerTimeForState:(unint64_t)a3 remainingTime:(double)a4 currentDateProvider:(id)a5
{
  void (**v7)(_QWORD);
  MTTimerDate *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void (**)(_QWORD))a5;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      NSLog(CFSTR("Unexpected timer state: %ld"), a3);
      a3 = 0;
      break;
    case 1uLL:
    case 2uLL:
      a3 = -[MTTimerTimeInterval initWithTimeInterval:]([MTTimerTimeInterval alloc], "initWithTimeInterval:", a4);
      break;
    case 3uLL:
      v8 = [MTTimerDate alloc];
      v9 = (void *)MEMORY[0x1E0C99D68];
      v7[2](v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateWithTimeInterval:sinceDate:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = -[MTTimerDate initWithDate:currentDateProvider:](v8, "initWithDate:currentDateProvider:", v11, v7);

      break;
    default:
      break;
  }

  return (id)a3;
}

- (void)setFiredDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDismissedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFireTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSiriContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[MTTimer siriContext](self, "siriContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MTIntentsTimerTypeFromSiriContext(v2);

  return v3;
}

- (void)nextTriggerAfterDate:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "timerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_debug_impl(&dword_19AC4E000, a3, OS_LOG_TYPE_DEBUG, "Computing next fire date for %{public}@ after %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)initFromDeserializer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "Illegal fire time class %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
