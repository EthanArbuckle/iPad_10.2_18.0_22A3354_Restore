@implementation AFClockTimer

- (AFClockTimer)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFClockTimerMutation *);
  AFClockTimer *v5;
  AFClockTimer *v6;
  _AFClockTimerMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *timerID;
  void *v11;
  uint64_t v12;
  NSURL *timerURL;
  void *v14;
  uint64_t v15;
  NSString *title;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSDate *fireDate;
  void *v22;
  uint64_t v23;
  NSDate *firedDate;
  void *v25;
  uint64_t v26;
  NSDate *dismissedDate;
  void *v28;
  uint64_t v29;
  NSDate *lastModifiedDate;
  objc_super v32;

  v4 = (void (**)(id, _AFClockTimerMutation *))a3;
  v32.receiver = self;
  v32.super_class = (Class)AFClockTimer;
  v5 = -[AFClockTimer init](&v32, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFClockTimerMutation initWithBase:]([_AFClockTimerMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFClockTimerMutation isDirty](v7, "isDirty"))
    {
      -[_AFClockTimerMutation getTimerID](v7, "getTimerID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      timerID = v6->_timerID;
      v6->_timerID = (NSUUID *)v9;

      -[_AFClockTimerMutation getTimerURL](v7, "getTimerURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      timerURL = v6->_timerURL;
      v6->_timerURL = (NSURL *)v12;

      v6->_isFiring = -[_AFClockTimerMutation getIsFiring](v7, "getIsFiring");
      -[_AFClockTimerMutation getTitle](v7, "getTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_state = -[_AFClockTimerMutation getState](v7, "getState");
      -[_AFClockTimerMutation getDuration](v7, "getDuration");
      v6->_duration = v17;
      v6->_type = -[_AFClockTimerMutation getType](v7, "getType");
      -[_AFClockTimerMutation getFireTimeInterval](v7, "getFireTimeInterval");
      v6->_fireTimeInterval = v18;
      -[_AFClockTimerMutation getFireDate](v7, "getFireDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      fireDate = v6->_fireDate;
      v6->_fireDate = (NSDate *)v20;

      -[_AFClockTimerMutation getFiredDate](v7, "getFiredDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v23;

      -[_AFClockTimerMutation getDismissedDate](v7, "getDismissedDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v26;

      -[_AFClockTimerMutation getLastModifiedDate](v7, "getLastModifiedDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v29;

    }
  }

  return v6;
}

- (AFClockTimer)init
{
  return -[AFClockTimer initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFClockTimer)initWithTimerID:(id)a3 timerURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 state:(int64_t)a7 duration:(double)a8 type:(int64_t)a9 fireTimeInterval:(double)a10 fireDate:(id)a11 firedDate:(id)a12 dismissedDate:(id)a13 lastModifiedDate:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  AFClockTimer *v34;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int64_t v46;
  double v47;
  int64_t v48;
  double v49;
  BOOL v50;

  v20 = a3;
  v21 = a4;
  v22 = a6;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __143__AFClockTimer_initWithTimerID_timerURL_isFiring_title_state_duration_type_fireTimeInterval_fireDate_firedDate_dismissedDate_lastModifiedDate___block_invoke;
  v38[3] = &unk_1E3A2E1E8;
  v39 = v20;
  v40 = v21;
  v50 = a5;
  v47 = a8;
  v48 = a9;
  v49 = a10;
  v41 = v22;
  v42 = v23;
  v43 = v24;
  v44 = v25;
  v45 = v26;
  v46 = a7;
  v27 = v26;
  v28 = v25;
  v29 = v24;
  v30 = v23;
  v31 = v22;
  v32 = v21;
  v33 = v20;
  v34 = -[AFClockTimer initWithBuilder:](self, "initWithBuilder:", v38);

  return v34;
}

- (NSString)description
{
  return (NSString *)-[AFClockTimer _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t state;
  __CFString *v7;
  NSUUID *timerID;
  NSURL *timerURL;
  _BOOL4 isFiring;
  NSString *title;
  __CFString *v12;
  double duration;
  unint64_t type;
  __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  void *v18;
  objc_super v20;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v20.receiver = self;
  v20.super_class = (Class)AFClockTimer;
  -[AFClockTimer description](&v20, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  if (state > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A31D58[state];
  timerID = self->_timerID;
  timerURL = self->_timerURL;
  isFiring = self->_isFiring;
  title = self->_title;
  v12 = v7;
  duration = self->_duration;
  type = self->_type;
  if (type > 2)
    v15 = CFSTR("(unknown)");
  else
    v15 = off_1E3A36DB8[type];
  if (isFiring)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v17 = v15;
  v18 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {timerID = %@, timerURL = %@, isFiring = %@, title = %@, state = %@, duration = %f, type = %@, fireTimeInterval = %f, fireDate = %@, firedDate = %@, dismissedDate = %@, lastModifiedDate = %@}"), v5, timerID, timerURL, v16, title, v12, *(_QWORD *)&duration, v17, *(_QWORD *)&self->_fireTimeInterval, self->_fireDate, self->_firedDate, self->_dismissedDate, self->_lastModifiedDate);

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v3 = -[NSUUID hash](self->_timerID, "hash");
  v4 = -[NSURL hash](self->_timerURL, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFiring);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[NSString hash](self->_title, "hash") ^ v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fireTimeInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  v16 = v11 ^ v15 ^ -[NSDate hash](self->_fireDate, "hash");
  v17 = -[NSDate hash](self->_firedDate, "hash");
  v18 = v17 ^ -[NSDate hash](self->_dismissedDate, "hash");
  v19 = v16 ^ v18 ^ -[NSDate hash](self->_lastModifiedDate, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  AFClockTimer *v4;
  AFClockTimer *v5;
  _BOOL4 isFiring;
  int64_t state;
  double duration;
  double v9;
  int64_t type;
  double fireTimeInterval;
  double v12;
  BOOL v13;
  NSUUID *v15;
  NSUUID *timerID;
  NSURL *v17;
  NSURL *timerURL;
  NSString *v19;
  NSString *title;
  NSDate *v21;
  NSDate *fireDate;
  NSDate *v23;
  NSDate *firedDate;
  NSDate *v25;
  NSDate *dismissedDate;
  NSDate *v27;
  NSDate *lastModifiedDate;

  v4 = (AFClockTimer *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isFiring = self->_isFiring;
      if (isFiring == -[AFClockTimer isFiring](v5, "isFiring")
        && (state = self->_state, state == -[AFClockTimer state](v5, "state"))
        && (duration = self->_duration, -[AFClockTimer duration](v5, "duration"), duration == v9)
        && (type = self->_type, type == -[AFClockTimer type](v5, "type"))
        && (fireTimeInterval = self->_fireTimeInterval,
            -[AFClockTimer fireTimeInterval](v5, "fireTimeInterval"),
            fireTimeInterval == v12))
      {
        -[AFClockTimer timerID](v5, "timerID");
        v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        timerID = self->_timerID;
        if (timerID == v15 || -[NSUUID isEqual:](timerID, "isEqual:", v15))
        {
          -[AFClockTimer timerURL](v5, "timerURL");
          v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
          timerURL = self->_timerURL;
          if (timerURL == v17 || -[NSURL isEqual:](timerURL, "isEqual:", v17))
          {
            -[AFClockTimer title](v5, "title");
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            title = self->_title;
            if (title == v19 || -[NSString isEqual:](title, "isEqual:", v19))
            {
              -[AFClockTimer fireDate](v5, "fireDate");
              v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
              fireDate = self->_fireDate;
              if (fireDate == v21 || -[NSDate isEqual:](fireDate, "isEqual:", v21))
              {
                -[AFClockTimer firedDate](v5, "firedDate");
                v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
                firedDate = self->_firedDate;
                if (firedDate == v23 || -[NSDate isEqual:](firedDate, "isEqual:", v23))
                {
                  -[AFClockTimer dismissedDate](v5, "dismissedDate");
                  v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dismissedDate = self->_dismissedDate;
                  if (dismissedDate == v25 || -[NSDate isEqual:](dismissedDate, "isEqual:", v25))
                  {
                    -[AFClockTimer lastModifiedDate](v5, "lastModifiedDate");
                    v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
                    lastModifiedDate = self->_lastModifiedDate;
                    v13 = lastModifiedDate == v27 || -[NSDate isEqual:](lastModifiedDate, "isEqual:", v27);

                  }
                  else
                  {
                    v13 = 0;
                  }

                }
                else
                {
                  v13 = 0;
                }

              }
              else
              {
                v13 = 0;
              }

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (AFClockTimer)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AFClockTimer *v22;
  unsigned int v24;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::timerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::timerURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::isFiring"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::duration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::fireTimeInterval"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::fireDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::firedDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::dismissedDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimer::lastModifiedDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[AFClockTimer initWithTimerID:timerURL:isFiring:title:state:duration:type:fireTimeInterval:fireDate:firedDate:dismissedDate:lastModifiedDate:](self, "initWithTimerID:timerURL:isFiring:title:state:duration:type:fireTimeInterval:fireDate:firedDate:dismissedDate:lastModifiedDate:", v4, v5, v24, v7, v9, v14, v12, v17, v18, v19, v20, v21);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *timerID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  timerID = self->_timerID;
  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", timerID, CFSTR("AFClockTimer::timerID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_timerURL, CFSTR("AFClockTimer::timerURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFiring);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("AFClockTimer::isFiring"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_title, CFSTR("AFClockTimer::title"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("AFClockTimer::state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("AFClockTimer::duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("AFClockTimer::type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fireTimeInterval);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("AFClockTimer::fireTimeInterval"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_fireDate, CFSTR("AFClockTimer::fireDate"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_firedDate, CFSTR("AFClockTimer::firedDate"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_dismissedDate, CFSTR("AFClockTimer::dismissedDate"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("AFClockTimer::lastModifiedDate"));

}

- (AFClockTimer)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFClockTimer *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v33;
  unsigned int v34;
  id v35;
  id v36;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("timerID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v6;
    else
      v36 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("timerURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v8;
    else
      v35 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isFiring"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v34 = objc_msgSend(v10, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = AFClockTimerStateGetFromName(v13);
    else
      v33 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("duration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = AFClockTimerTypeGetFromName(v18);
    else
      v19 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("fireTimeInterval"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(v5, "objectForKey:", CFSTR("fireDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("firedDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("dismissedDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("lastModifiedDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    self = -[AFClockTimer initWithTimerID:timerURL:isFiring:title:state:duration:type:fireTimeInterval:fireDate:firedDate:dismissedDate:lastModifiedDate:](self, "initWithTimerID:timerURL:isFiring:title:state:duration:type:fireTimeInterval:fireDate:firedDate:dismissedDate:lastModifiedDate:", v36, v35, v34, v12, v33, v19, v17, v23, v25, v27, v29, v31);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSUUID *timerID;
  NSURL *timerURL;
  void *v7;
  NSString *title;
  unint64_t state;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  unint64_t type;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSDate *fireDate;
  NSDate *firedDate;
  NSDate *dismissedDate;
  NSDate *lastModifiedDate;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  timerID = self->_timerID;
  if (timerID)
    objc_msgSend(v3, "setObject:forKey:", timerID, CFSTR("timerID"));
  timerURL = self->_timerURL;
  if (timerURL)
    objc_msgSend(v4, "setObject:forKey:", timerURL, CFSTR("timerURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFiring);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isFiring"));

  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  state = self->_state;
  if (state > 3)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E3A31D58[state];
  v11 = v10;
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("duration"));

  type = self->_type;
  if (type > 2)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_1E3A36DB8[type];
  v15 = v14;
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fireTimeInterval);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("fireTimeInterval"));

  fireDate = self->_fireDate;
  if (fireDate)
    objc_msgSend(v4, "setObject:forKey:", fireDate, CFSTR("fireDate"));
  firedDate = self->_firedDate;
  if (firedDate)
    objc_msgSend(v4, "setObject:forKey:", firedDate, CFSTR("firedDate"));
  dismissedDate = self->_dismissedDate;
  if (dismissedDate)
    objc_msgSend(v4, "setObject:forKey:", dismissedDate, CFSTR("dismissedDate"));
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
    objc_msgSend(v4, "setObject:forKey:", lastModifiedDate, CFSTR("lastModifiedDate"));
  v21 = (void *)objc_msgSend(v4, "copy");

  return v21;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (NSURL)timerURL
{
  return self->_timerURL;
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)state
{
  return self->_state;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)type
{
  return self->_type;
}

- (double)fireTimeInterval
{
  return self->_fireTimeInterval;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timerURL, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

void __143__AFClockTimer_initWithTimerID_timerURL_isFiring_title_state_duration_type_fireTimeInterval_fireDate_firedDate_dismissedDate_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTimerID:", v3);
  objc_msgSend(v4, "setTimerURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIsFiring:", *(unsigned __int8 *)(a1 + 120));
  objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setState:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setDuration:", *(double *)(a1 + 96));
  objc_msgSend(v4, "setType:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v4, "setFireTimeInterval:", *(double *)(a1 + 112));
  objc_msgSend(v4, "setFireDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setFiredDate:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setDismissedDate:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setLastModifiedDate:", *(_QWORD *)(a1 + 80));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFClockTimerMutation *);
  _AFClockTimerMutation *v5;
  AFClockTimer *v6;
  void *v7;
  uint64_t v8;
  NSUUID *timerID;
  void *v10;
  uint64_t v11;
  NSURL *timerURL;
  void *v13;
  uint64_t v14;
  NSString *title;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSDate *fireDate;
  void *v21;
  uint64_t v22;
  NSDate *firedDate;
  void *v24;
  uint64_t v25;
  NSDate *dismissedDate;
  void *v27;
  uint64_t v28;
  NSDate *lastModifiedDate;

  v4 = (void (**)(id, _AFClockTimerMutation *))a3;
  if (v4)
  {
    v5 = -[_AFClockTimerMutation initWithBase:]([_AFClockTimerMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFClockTimerMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFClockTimer);
      -[_AFClockTimerMutation getTimerID](v5, "getTimerID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      timerID = v6->_timerID;
      v6->_timerID = (NSUUID *)v8;

      -[_AFClockTimerMutation getTimerURL](v5, "getTimerURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      timerURL = v6->_timerURL;
      v6->_timerURL = (NSURL *)v11;

      v6->_isFiring = -[_AFClockTimerMutation getIsFiring](v5, "getIsFiring");
      -[_AFClockTimerMutation getTitle](v5, "getTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_state = -[_AFClockTimerMutation getState](v5, "getState");
      -[_AFClockTimerMutation getDuration](v5, "getDuration");
      v6->_duration = v16;
      v6->_type = -[_AFClockTimerMutation getType](v5, "getType");
      -[_AFClockTimerMutation getFireTimeInterval](v5, "getFireTimeInterval");
      v6->_fireTimeInterval = v17;
      -[_AFClockTimerMutation getFireDate](v5, "getFireDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      fireDate = v6->_fireDate;
      v6->_fireDate = (NSDate *)v19;

      -[_AFClockTimerMutation getFiredDate](v5, "getFiredDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v22;

      -[_AFClockTimerMutation getDismissedDate](v5, "getDismissedDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "copy");
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v25;

      -[_AFClockTimerMutation getLastModifiedDate](v5, "getLastModifiedDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "copy");
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v28;

    }
    else
    {
      v6 = (AFClockTimer *)-[AFClockTimer copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFClockTimer *)-[AFClockTimer copy](self, "copy");
  }

  return v6;
}

@end
