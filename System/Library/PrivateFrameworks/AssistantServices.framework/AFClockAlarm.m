@implementation AFClockAlarm

- (AFClockAlarm)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFClockAlarmMutation *);
  AFClockAlarm *v5;
  AFClockAlarm *v6;
  _AFClockAlarmMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *alarmID;
  void *v11;
  uint64_t v12;
  NSURL *alarmURL;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v17;
  uint64_t v18;
  NSDate *firedDate;
  void *v20;
  uint64_t v21;
  NSDate *dismissedDate;
  void *v23;
  uint64_t v24;
  NSDate *lastModifiedDate;
  objc_super v27;

  v4 = (void (**)(id, _AFClockAlarmMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFClockAlarm;
  v5 = -[AFClockAlarm init](&v27, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFClockAlarmMutation initWithBase:]([_AFClockAlarmMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFClockAlarmMutation isDirty](v7, "isDirty"))
    {
      -[_AFClockAlarmMutation getAlarmID](v7, "getAlarmID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v9;

      -[_AFClockAlarmMutation getAlarmURL](v7, "getAlarmURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v12;

      v6->_isFiring = -[_AFClockAlarmMutation getIsFiring](v7, "getIsFiring");
      -[_AFClockAlarmMutation getTitle](v7, "getTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_type = -[_AFClockAlarmMutation getType](v7, "getType");
      v6->_hour = -[_AFClockAlarmMutation getHour](v7, "getHour");
      v6->_minute = -[_AFClockAlarmMutation getMinute](v7, "getMinute");
      v6->_repeatOptions = -[_AFClockAlarmMutation getRepeatOptions](v7, "getRepeatOptions");
      v6->_isEnabled = -[_AFClockAlarmMutation getIsEnabled](v7, "getIsEnabled");
      v6->_isSnoozed = -[_AFClockAlarmMutation getIsSnoozed](v7, "getIsSnoozed");
      -[_AFClockAlarmMutation getFiredDate](v7, "getFiredDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v18;

      -[_AFClockAlarmMutation getDismissedDate](v7, "getDismissedDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v21;

      -[_AFClockAlarmMutation getLastModifiedDate](v7, "getLastModifiedDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v24;

    }
  }

  return v6;
}

- (AFClockAlarm)init
{
  return -[AFClockAlarm initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFClockAlarm)initWithAlarmID:(id)a3 alarmURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 type:(unint64_t)a7 hour:(unint64_t)a8 minute:(unint64_t)a9 repeatOptions:(unint64_t)a10 isEnabled:(BOOL)a11 isSnoozed:(BOOL)a12 firedDate:(id)a13 dismissedDate:(id)a14 lastModifiedDate:(id)a15
{
  id v18;
  id v19;
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
  AFClockAlarm *v30;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;

  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a13;
  v22 = a14;
  v23 = a15;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __148__AFClockAlarm_initWithAlarmID_alarmURL_isFiring_title_type_hour_minute_repeatOptions_isEnabled_isSnoozed_firedDate_dismissedDate_lastModifiedDate___block_invoke;
  v35[3] = &unk_1E3A36B10;
  v36 = v18;
  v37 = v19;
  v46 = a5;
  v42 = a7;
  v43 = a8;
  v44 = a9;
  v45 = a10;
  v47 = a11;
  v48 = a12;
  v38 = v20;
  v39 = v21;
  v40 = v22;
  v41 = v23;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = -[AFClockAlarm initWithBuilder:](self, "initWithBuilder:", v35);

  return v30;
}

- (NSString)description
{
  return (NSString *)-[AFClockAlarm _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  uint64_t v4;
  NSString *title;
  const __CFString *v6;
  void *v7;
  void *v8;
  unint64_t minute;
  unint64_t hour;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v18;
  NSURL *alarmURL;
  NSUUID *alarmID;
  void *v21;
  id v22;
  objc_super v23;

  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  v23.receiver = self;
  v23.super_class = (Class)AFClockAlarm;
  -[AFClockAlarm description](&v23, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  alarmID = self->_alarmID;
  v21 = (void *)v4;
  title = self->_title;
  if (self->_isFiring)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v18 = v6;
  alarmURL = self->_alarmURL;
  AFClockAlarmTypeGetNames(self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hour = self->_hour;
  minute = self->_minute;
  AFClockAlarmRepeatOptionsGetNames(self->_repeatOptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("|"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (self->_isEnabled)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_isSnoozed)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@ {alarmID = %@, alarmURL = %@, isFiring = %@, title = %@, type = %@, hour = %llu, minute = %llu, repeatOptions = %@, isEnabled = %@, isSnoozed = %@, firedDate = %@, dismissedDate = %@, lastModifiedDate = %@}"), v21, alarmID, alarmURL, v18, title, v8, hour, minute, v12, v14, v15, self->_firedDate, self->_dismissedDate, self->_lastModifiedDate);

  return v16;
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
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v3 = -[NSUUID hash](self->_alarmID, "hash");
  v4 = -[NSURL hash](self->_alarmURL, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFiring);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[NSString hash](self->_title, "hash") ^ v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hour);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minute);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_repeatOptions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11 ^ v15 ^ objc_msgSend(v16, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSnoozed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  v20 = v19 ^ -[NSDate hash](self->_firedDate, "hash");
  v21 = v20 ^ -[NSDate hash](self->_dismissedDate, "hash");
  v22 = v17 ^ v21 ^ -[NSDate hash](self->_lastModifiedDate, "hash");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  AFClockAlarm *v4;
  AFClockAlarm *v5;
  _BOOL4 isFiring;
  unint64_t type;
  unint64_t hour;
  unint64_t minute;
  unint64_t repeatOptions;
  _BOOL4 isEnabled;
  _BOOL4 isSnoozed;
  NSUUID *v13;
  NSUUID *alarmID;
  NSURL *v15;
  NSURL *alarmURL;
  NSString *v17;
  NSString *title;
  NSDate *v19;
  NSDate *firedDate;
  NSDate *v21;
  NSDate *dismissedDate;
  NSDate *v23;
  NSDate *lastModifiedDate;
  BOOL v25;

  v4 = (AFClockAlarm *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isFiring = self->_isFiring;
      if (isFiring == -[AFClockAlarm isFiring](v5, "isFiring")
        && (type = self->_type, type == -[AFClockAlarm type](v5, "type"))
        && (hour = self->_hour, hour == -[AFClockAlarm hour](v5, "hour"))
        && (minute = self->_minute, minute == -[AFClockAlarm minute](v5, "minute"))
        && (repeatOptions = self->_repeatOptions, repeatOptions == -[AFClockAlarm repeatOptions](v5, "repeatOptions"))
        && (isEnabled = self->_isEnabled, isEnabled == -[AFClockAlarm isEnabled](v5, "isEnabled"))
        && (isSnoozed = self->_isSnoozed, isSnoozed == -[AFClockAlarm isSnoozed](v5, "isSnoozed")))
      {
        -[AFClockAlarm alarmID](v5, "alarmID");
        v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        alarmID = self->_alarmID;
        if (alarmID == v13 || -[NSUUID isEqual:](alarmID, "isEqual:", v13))
        {
          -[AFClockAlarm alarmURL](v5, "alarmURL");
          v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
          alarmURL = self->_alarmURL;
          if (alarmURL == v15 || -[NSURL isEqual:](alarmURL, "isEqual:", v15))
          {
            -[AFClockAlarm title](v5, "title");
            v17 = (NSString *)objc_claimAutoreleasedReturnValue();
            title = self->_title;
            if (title == v17 || -[NSString isEqual:](title, "isEqual:", v17))
            {
              -[AFClockAlarm firedDate](v5, "firedDate");
              v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
              firedDate = self->_firedDate;
              if (firedDate == v19 || -[NSDate isEqual:](firedDate, "isEqual:", v19))
              {
                -[AFClockAlarm dismissedDate](v5, "dismissedDate");
                v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
                dismissedDate = self->_dismissedDate;
                if (dismissedDate == v21 || -[NSDate isEqual:](dismissedDate, "isEqual:", v21))
                {
                  -[AFClockAlarm lastModifiedDate](v5, "lastModifiedDate");
                  v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  lastModifiedDate = self->_lastModifiedDate;
                  v25 = lastModifiedDate == v23 || -[NSDate isEqual:](lastModifiedDate, "isEqual:", v23);

                }
                else
                {
                  v25 = 0;
                }

              }
              else
              {
                v25 = 0;
              }

            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (AFClockAlarm)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  AFClockAlarm *v19;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::alarmID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::alarmURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::isFiring"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::hour"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::minute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::repeatOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::isEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::isSnoozed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::firedDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::dismissedDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockAlarm::lastModifiedDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v21) = v15;
  LOBYTE(v21) = (_BYTE)v11;
  v19 = -[AFClockAlarm initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:](self, "initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:", v25, v24, v23, v5, v22, v8, v10, v12, v21, v16, v17, v18);

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *alarmID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  alarmID = self->_alarmID;
  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", alarmID, CFSTR("AFClockAlarm::alarmID"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_alarmURL, CFSTR("AFClockAlarm::alarmURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFiring);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("AFClockAlarm::isFiring"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_title, CFSTR("AFClockAlarm::title"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("AFClockAlarm::type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hour);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("AFClockAlarm::hour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minute);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("AFClockAlarm::minute"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_repeatOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("AFClockAlarm::repeatOptions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("AFClockAlarm::isEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSnoozed);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("AFClockAlarm::isSnoozed"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_firedDate, CFSTR("AFClockAlarm::firedDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_dismissedDate, CFSTR("AFClockAlarm::dismissedDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("AFClockAlarm::lastModifiedDate"));

}

- (AFClockAlarm)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFClockAlarm *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  unsigned int v37;
  id v38;
  id v39;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("alarmID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v6;
    else
      v39 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("alarmURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v8;
    else
      v38 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isFiring"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v37 = objc_msgSend(v10, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v11;
    else
      v36 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = AFClockAlarmTypeGetFromNames(v12);
    else
      v35 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("hour"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    v34 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("minute"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    v33 = objc_msgSend(v16, "unsignedIntegerValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("repeatOptions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = AFClockAlarmRepeatOptionsGetFromNames(v17);
    else
      v18 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    v21 = objc_msgSend(v20, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("isSnoozed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    v24 = objc_msgSend(v23, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("firedDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("dismissedDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("lastModifiedDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    BYTE1(v32) = v24;
    LOBYTE(v32) = v21;
    self = -[AFClockAlarm initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:](self, "initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:", v39, v38, v37, v36, v35, v34, v33, v18, v32, v26, v28, v30);

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
  NSUUID *alarmID;
  NSURL *alarmURL;
  void *v7;
  NSString *title;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDate *firedDate;
  NSDate *dismissedDate;
  NSDate *lastModifiedDate;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  alarmID = self->_alarmID;
  if (alarmID)
    objc_msgSend(v3, "setObject:forKey:", alarmID, CFSTR("alarmID"));
  alarmURL = self->_alarmURL;
  if (alarmURL)
    objc_msgSend(v4, "setObject:forKey:", alarmURL, CFSTR("alarmURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFiring);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isFiring"));

  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  AFClockAlarmTypeGetNames(self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hour);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("hour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minute);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("minute"));

  AFClockAlarmRepeatOptionsGetNames(self->_repeatOptions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("repeatOptions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("isEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSnoozed);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("isSnoozed"));

  firedDate = self->_firedDate;
  if (firedDate)
    objc_msgSend(v4, "setObject:forKey:", firedDate, CFSTR("firedDate"));
  dismissedDate = self->_dismissedDate;
  if (dismissedDate)
    objc_msgSend(v4, "setObject:forKey:", dismissedDate, CFSTR("dismissedDate"));
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
    objc_msgSend(v4, "setObject:forKey:", lastModifiedDate, CFSTR("lastModifiedDate"));
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (NSURL)alarmURL
{
  return self->_alarmURL;
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (unint64_t)repeatOptions
{
  return self->_repeatOptions;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isSnoozed
{
  return self->_isSnoozed;
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
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

void __148__AFClockAlarm_initWithAlarmID_alarmURL_isFiring_title_type_hour_minute_repeatOptions_isEnabled_isSnoozed_firedDate_dismissedDate_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAlarmID:", v3);
  objc_msgSend(v4, "setAlarmURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIsFiring:", *(unsigned __int8 *)(a1 + 112));
  objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setType:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setHour:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setMinute:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v4, "setRepeatOptions:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v4, "setIsEnabled:", *(unsigned __int8 *)(a1 + 113));
  objc_msgSend(v4, "setIsSnoozed:", *(unsigned __int8 *)(a1 + 114));
  objc_msgSend(v4, "setFiredDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setDismissedDate:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setLastModifiedDate:", *(_QWORD *)(a1 + 72));

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
  void (**v4)(id, _AFClockAlarmMutation *);
  _AFClockAlarmMutation *v5;
  AFClockAlarm *v6;
  void *v7;
  uint64_t v8;
  NSUUID *alarmID;
  void *v10;
  uint64_t v11;
  NSURL *alarmURL;
  void *v13;
  uint64_t v14;
  NSString *title;
  void *v16;
  uint64_t v17;
  NSDate *firedDate;
  void *v19;
  uint64_t v20;
  NSDate *dismissedDate;
  void *v22;
  uint64_t v23;
  NSDate *lastModifiedDate;

  v4 = (void (**)(id, _AFClockAlarmMutation *))a3;
  if (v4)
  {
    v5 = -[_AFClockAlarmMutation initWithBase:]([_AFClockAlarmMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFClockAlarmMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFClockAlarm);
      -[_AFClockAlarmMutation getAlarmID](v5, "getAlarmID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v8;

      -[_AFClockAlarmMutation getAlarmURL](v5, "getAlarmURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v11;

      v6->_isFiring = -[_AFClockAlarmMutation getIsFiring](v5, "getIsFiring");
      -[_AFClockAlarmMutation getTitle](v5, "getTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_type = -[_AFClockAlarmMutation getType](v5, "getType");
      v6->_hour = -[_AFClockAlarmMutation getHour](v5, "getHour");
      v6->_minute = -[_AFClockAlarmMutation getMinute](v5, "getMinute");
      v6->_repeatOptions = -[_AFClockAlarmMutation getRepeatOptions](v5, "getRepeatOptions");
      v6->_isEnabled = -[_AFClockAlarmMutation getIsEnabled](v5, "getIsEnabled");
      v6->_isSnoozed = -[_AFClockAlarmMutation getIsSnoozed](v5, "getIsSnoozed");
      -[_AFClockAlarmMutation getFiredDate](v5, "getFiredDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v17;

      -[_AFClockAlarmMutation getDismissedDate](v5, "getDismissedDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v20;

      -[_AFClockAlarmMutation getLastModifiedDate](v5, "getLastModifiedDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v23;

    }
    else
    {
      v6 = (AFClockAlarm *)-[AFClockAlarm copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFClockAlarm *)-[AFClockAlarm copy](self, "copy");
  }

  return v6;
}

@end
