@implementation CRKEventLog

- (CRKEventLog)init
{
  void *v3;
  void *v4;
  CRKEventLog *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKEventLog initWithStartDate:endDate:events:](self, "initWithStartDate:endDate:events:", v3, v3, v4);

  return v5;
}

- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4 events:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKEventLog *v12;
  uint64_t v13;
  NSSet *passedInEvents;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKEventLog.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("events"));

  }
  v12 = -[CRKEventLog initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v9, v10);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    passedInEvents = v12->_passedInEvents;
    v12->_passedInEvents = (NSSet *)v13;

  }
  return v12;
}

- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4 eventDatas:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKEventLog *v12;
  uint64_t v13;
  NSSet *passedInEventDatas;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKEventLog.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventDatas"));

  }
  v12 = -[CRKEventLog initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v9, v10);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    passedInEventDatas = v12->_passedInEventDatas;
    v12->_passedInEventDatas = (NSSet *)v13;

  }
  return v12;
}

- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  void *v10;
  CRKEventLog *v11;
  CRKEventLog *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKEventLog.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKEventLog.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)CRKEventLog;
  v11 = -[CRKEventLog init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
  }

  return v12;
}

- (NSSet)events
{
  void *v3;
  NSSet *v4;
  NSSet *mLazilyLoadedEvents;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  -[CRKEventLog passedInEvents](self, "passedInEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKEventLog passedInEvents](self, "passedInEvents");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    mLazilyLoadedEvents = self->mLazilyLoadedEvents;
    if (!mLazilyLoadedEvents)
    {
      -[CRKEventLog passedInEventDatas](self, "passedInEventDatas");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_63);
      v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v8 = self->mLazilyLoadedEvents;
      self->mLazilyLoadedEvents = v7;

      mLazilyLoadedEvents = self->mLazilyLoadedEvents;
    }
    v4 = mLazilyLoadedEvents;
  }
  return v4;
}

id __21__CRKEventLog_events__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  v2 = (void *)MEMORY[0x24BDD1620];
  v3 = a2;
  v8 = 0;
  objc_msgSend(v2, "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (!v4)
  {
    if (_CRKLogGeneral_onceToken_21 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_21, &__block_literal_global_77);
    v6 = (void *)_CRKLogGeneral_logObj_21;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_21, OS_LOG_TYPE_ERROR))
      __21__CRKEventLog_events__block_invoke_cold_1(v6, v5);
  }

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[CRKEventLog startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKEventLog endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKEventLog passedInEvents](self, "passedInEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CRKEventLog passedInEventDatas](self, "passedInEventDatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CRKEventLog isEqualToTimeline:](self, "isEqualToTimeline:", v4);

  return v5;
}

- (BOOL)isEqualToTimeline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  if (v4)
  {
    -[CRKEventLog startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
    {
      v22 = 0;
    }
    else
    {
      -[CRKEventLog endDate](self, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      if (v12 | v13
        && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
      {
        v22 = 0;
      }
      else
      {
        -[CRKEventLog passedInEvents](self, "passedInEvents");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "passedInEvents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v16;
        if (v17 | v18
          && (v19 = objc_msgSend((id)v17, "isEqual:", v18), (id)v18, (id)v17, !v19))
        {
          v22 = 0;
        }
        else
        {
          -[CRKEventLog passedInEventDatas](self, "passedInEventDatas");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "passedInEventDatas");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v20 | v21)
            v22 = objc_msgSend((id)v20, "isEqual:", v21);
          else
            v22 = 1;

        }
      }

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKEventLog startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEventLog endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEventLog passedInEvents](self, "passedInEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[CRKEventLog passedInEventDatas](self, "passedInEventDatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { startDate = %@, endDate = %@, passedInEvents = %@, passedInEventDatasCount = %@ }>"), v4, self, v5, v6, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CRKEventLog startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[CRKEventLog endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

  -[CRKEventLog passedInEvents](self, "passedInEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("passedInEvents"));

  -[CRKEventLog passedInEventDatas](self, "passedInEventDatas");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("passedInEventDatas"));

}

- (CRKEventLog)initWithCoder:(id)a3
{
  id v4;
  CRKEventLog *v5;
  void *v6;
  uint64_t v7;
  NSDate *startDate;
  void *v9;
  uint64_t v10;
  NSDate *endDate;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *passedInEvents;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSSet *passedInEventDatas;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRKEventLog;
  v5 = -[CRKEventLog init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("startDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("passedInEvents"));
    v15 = objc_claimAutoreleasedReturnValue();
    passedInEvents = v5->_passedInEvents;
    v5->_passedInEvents = (NSSet *)v15;

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("passedInEventDatas"));
    v20 = objc_claimAutoreleasedReturnValue();
    passedInEventDatas = v5->_passedInEventDatas;
    v5->_passedInEventDatas = (NSSet *)v20;

  }
  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSSet)passedInEvents
{
  return self->_passedInEvents;
}

- (void)setPassedInEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)passedInEventDatas
{
  return self->_passedInEventDatas;
}

- (void)setPassedInEventDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passedInEventDatas, 0);
  objc_storeStrong((id *)&self->_passedInEvents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->mLazilyLoadedEvents, 0);
}

void __21__CRKEventLog_events__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Failed to unarchive event: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
