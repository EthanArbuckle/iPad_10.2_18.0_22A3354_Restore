@implementation _MKFYearDayScheduleRule

- (id)yearDayScheduleRule
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD1508]);
  -[_MKFYearDayScheduleRule startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFYearDayScheduleRule endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7AC0]), "initWithDateInterval:", v6);
  return v7;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[_MKFYearDayScheduleRule modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_MKFYearDayScheduleRule startDate](self, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_MKFYearDayScheduleRule endDate](self, "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 == 0;

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 1;
  }

  return !v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("mi");
  -[_MKFYearDayScheduleRule modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("st");
  -[_MKFYearDayScheduleRule startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("et");
  -[_MKFYearDayScheduleRule endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MKFYearDayScheduleRuleDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFYearDayScheduleRuleDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)populateYearDayScheduleRuleFromDictionary:(id)a3 existingLocalModels:(id)a4 context:(id)a5
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
  _MKFYearDayScheduleRule *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
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

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mi"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19 && v13 && v16)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v19);
    v20 = (_MKFYearDayScheduleRule *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = -[_MKFYearDayScheduleRule initWithContext:]([_MKFYearDayScheduleRule alloc], "initWithContext:", v10);
      -[_MKFYearDayScheduleRule setModelID:](v20, "setModelID:", v19);
      -[_MKFYearDayScheduleRule setStartDate:](v20, "setStartDate:", v13);
      -[_MKFYearDayScheduleRule setEndDate:](v20, "setEndDate:", v16);
    }
    -[_MKFYearDayScheduleRule startDate](v20, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = HMFEqualObjects();

    if ((v22 & 1) == 0)
      -[_MKFYearDayScheduleRule setStartDate:](v20, "setStartDate:", v13);
    -[_MKFYearDayScheduleRule endDate](v20, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = HMFEqualObjects();

    if ((v24 & 1) == 0)
      -[_MKFYearDayScheduleRule setEndDate:](v20, "setEndDate:", v16);
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = a1;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v28;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot create year day schedule rule from dictionary : %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v20 = 0;
  }

  return v20;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_25586F4D8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFYearDayScheduleRule"));
}

@end
