@implementation _MKFWeekDayScheduleRule

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFWeekDayScheduleRule"));
}

- (id)weekDayScheduleRule
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD7AA0]);
  -[_MKFWeekDayScheduleRule startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMDateComponentFromSecondsOfDay();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFWeekDayScheduleRule endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HMDateComponentFromSecondsOfDay();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithStartTime:endTime:daysOfTheWeek:", v5, v7, objc_msgSend(v8, "unsignedIntValue"));

  return v9;
}

- (void)updateFromWeekDayScheduleRule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMSecondsFromDateComponent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFWeekDayScheduleRule setStartTime:](self, "setStartTime:", v6);

  objc_msgSend(v4, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMSecondsFromDateComponent();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFWeekDayScheduleRule setEndTime:](self, "setEndTime:", v8);

  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(v4, "daysOfTheWeek");

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKFWeekDayScheduleRule setDaysOfTheWeek:](self, "setDaysOfTheWeek:", v11);

}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[_MKFWeekDayScheduleRule modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_MKFWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_MKFWeekDayScheduleRule startTime](self, "startTime");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[_MKFWeekDayScheduleRule endTime](self, "endTime");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return !v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("mi");
  -[_MKFWeekDayScheduleRule modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("st");
  -[_MKFWeekDayScheduleRule startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("et");
  -[_MKFWeekDayScheduleRule endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("dow");
  -[_MKFWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MKFWeekDayScheduleRuleDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFWeekDayScheduleRuleDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)initWeekDayScheduleRuleWithModelID:(id)a3 startTime:(id)a4 endTime:(id)a5 daysOfTheWeek:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _MKFWeekDayScheduleRule *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[_MKFWeekDayScheduleRule initWithContext:]([_MKFWeekDayScheduleRule alloc], "initWithContext:", v11);

  -[_MKFWeekDayScheduleRule setModelID:](v16, "setModelID:", v15);
  -[_MKFWeekDayScheduleRule setStartTime:](v16, "setStartTime:", v14);

  -[_MKFWeekDayScheduleRule setEndTime:](v16, "setEndTime:", v13);
  -[_MKFWeekDayScheduleRule setDaysOfTheWeek:](v16, "setDaysOfTheWeek:", v12);

  return v16;
}

+ (id)populateWeekDayScheduleRuleFromDictionary:(id)a3 existingLocalModels:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("st"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("et"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dow"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mi"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22 && v13 && v16 && v19)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(a1, "initWeekDayScheduleRuleWithModelID:startTime:endTime:daysOfTheWeek:context:", v22, v13, v16, v19, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "startTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = HMFEqualObjects();

    if ((v25 & 1) == 0)
      objc_msgSend(v23, "setStartTime:", v13);
    objc_msgSend(v23, "endTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = HMFEqualObjects();

    if ((v27 & 1) == 0)
      objc_msgSend(v23, "setEndTime:", v16);
    objc_msgSend(v23, "daysOfTheWeek");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = HMFEqualObjects();

    if ((v29 & 1) == 0)
      objc_msgSend(v23, "setDaysOfTheWeek:", v19);
  }
  else
  {
    v36 = v9;
    v30 = v10;
    v31 = (void *)MEMORY[0x227676638]();
    v32 = a1;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v34;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot create week day schedule rule from dictionary : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    v23 = 0;
    v10 = v30;
    v9 = v36;
  }

  return v23;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558BCAD0;
}

@end
