@implementation DAOofParams

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = -[DAOofParams oofState](self, "oofState");
  -[DAOofParams startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAOofParams endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAOofParams message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DAOofParams externalState](self, "externalState");
  -[DAOofParams externalMessage](self, "externalMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("oofState:%d startTime:%@ endTime:%@ message:%@ externalState:%d externalMessage:%@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (DAOofParams)initWithDictionary:(id)a3
{
  id v4;
  DAOofParams *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAOofParams;
  v5 = -[DAOofParams init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsOofStateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsOofStateKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAOofParams setOofState:](v5, "setOofState:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsStartTimeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAOofParams setStartTime:](v5, "setStartTime:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsEndTimeKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAOofParams setEndTime:](v5, "setEndTime:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsOofInternalMessageKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAOofParams setMessage:](v5, "setMessage:", v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsOofExternalStateKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsOofExternalStateKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAOofParams setExternalState:](v5, "setExternalState:", objc_msgSend(v12, "intValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kDASettingsOofExternalMessageKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAOofParams setExternalMessage:](v5, "setExternalMessage:", v13);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DAOofParams oofState](self, "oofState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kDASettingsOofStateKey"));

  -[DAOofParams startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DAOofParams startTime](self, "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kDASettingsStartTimeKey"));

  }
  -[DAOofParams endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DAOofParams endTime](self, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kDASettingsEndTimeKey"));

  }
  -[DAOofParams message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DAOofParams message](self, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("kDASettingsOofInternalMessageKey"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DAOofParams externalState](self, "externalState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("kDASettingsOofExternalStateKey"));

  -[DAOofParams externalMessage](self, "externalMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DAOofParams externalMessage](self, "externalMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kDASettingsOofExternalMessageKey"));

  }
  return v3;
}

- (id)dictionaryRepresentationForASSettingTask
{
  void *v3;
  void *v4;
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
  uint64_t v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DAOofParams oofState](self, "oofState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kDASettingsOofStateKey"));

  v5 = (void *)objc_opt_new();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v5, "setLocale:");
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.000Z'"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  -[DAOofParams startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DAOofParams startTime](self, "startTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, CFSTR("kDASettingsStartTimeKey"));

  }
  -[DAOofParams endTime](self, "endTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DAOofParams endTime](self, "endTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v12, CFSTR("kDASettingsEndTimeKey"));

  }
  v13 = (void *)objc_opt_new();
  -[DAOofParams message](self, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E7BA4000, CFSTR("kDASettingsAudienceKey"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E7BA4018, CFSTR("kDASettingsEnabledKey"));
    -[DAOofParams message](self, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("kDASettingsReplyMessageKey"));

    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("TEXT"), CFSTR("kDASettingsBodyTypeKey"));
    objc_msgSend(v13, "addObject:", v15);

  }
  -[DAOofParams externalMessage](self, "externalMessage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E7BA4018, CFSTR("kDASettingsAudienceKey"));
    if (-[DAOofParams externalState](self, "externalState"))
      v19 = &unk_1E7BA4018;
    else
      v19 = &unk_1E7BA4000;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("kDASettingsEnabledKey"));
    -[DAOofParams externalMessage](self, "externalMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("kDASettingsReplyMessageKey"));

    objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("TEXT"), CFSTR("kDASettingsBodyTypeKey"));
    objc_msgSend(v13, "addObject:", v18);
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E7BA4030, CFSTR("kDASettingsAudienceKey"));
    if (-[DAOofParams externalState](self, "externalState") == 2)
      v22 = &unk_1E7BA4018;
    else
      v22 = &unk_1E7BA4000;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v25);
    -[DAOofParams externalMessage](self, "externalMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("kDASettingsReplyMessageKey"));

    objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("TEXT"), CFSTR("kDASettingsBodyTypeKey"));
    objc_msgSend(v13, "addObject:", v21);

  }
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v13, CFSTR("kDASettingsOofMessagesKey"));

  return v27;
}

- (BOOL)isEnabled
{
  return -[DAOofParams oofState](self, "oofState") != 0;
}

- (void)enableOof:(BOOL)a3 From:(id)a4 to:(id)a5 withMessage:(id)a6
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  if (a3)
    v9 = 2;
  else
    v9 = 0;
  v12 = a6;
  v10 = a5;
  v11 = a4;
  -[DAOofParams setOofState:](self, "setOofState:", v9);
  -[DAOofParams setStartTime:](self, "setStartTime:", v11);

  -[DAOofParams setEndTime:](self, "setEndTime:", v10);
  -[DAOofParams setMessage:](self, "setMessage:", v12);

}

- (int)oofState
{
  return self->_oofState;
}

- (void)setOofState:(int)a3
{
  self->_oofState = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int)externalState
{
  return self->_externalState;
}

- (void)setExternalState:(int)a3
{
  self->_externalState = a3;
}

- (NSString)externalMessage
{
  return self->_externalMessage;
}

- (void)setExternalMessage:(id)a3
{
  objc_storeStrong((id *)&self->_externalMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
