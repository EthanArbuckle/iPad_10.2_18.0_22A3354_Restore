@implementation HMRestrictedGuestHomeAccessSchedule

- (HMRestrictedGuestHomeAccessSchedule)initWithWeekDayRules:(id)a3
{
  return -[HMRestrictedGuestHomeAccessSchedule initWithWeekDayRules:yearDayRules:](self, "initWithWeekDayRules:yearDayRules:", a3, MEMORY[0x1E0C9AA60]);
}

- (HMRestrictedGuestHomeAccessSchedule)initWithYearDayRules:(id)a3
{
  return -[HMRestrictedGuestHomeAccessSchedule initWithWeekDayRules:yearDayRules:](self, "initWithWeekDayRules:yearDayRules:", MEMORY[0x1E0C9AA60], a3);
}

- (HMRestrictedGuestHomeAccessSchedule)initWithWeekDayRules:(id)a3 yearDayRules:(id)a4
{
  id v6;
  id v7;
  HMRestrictedGuestHomeAccessSchedule *v8;
  HMRestrictedGuestHomeAccessSchedule *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMRestrictedGuestHomeAccessSchedule;
  v8 = -[HMRestrictedGuestHomeAccessSchedule init](&v11, sel_init);
  if (v8)
  {
    if (!objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[HMRestrictedGuestHomeAccessSchedule setWeekDayRules:](v8, "setWeekDayRules:", v6);
    -[HMRestrictedGuestHomeAccessSchedule setYearDayRules:](v8, "setYearDayRules:", v7);
  }
  v9 = v8;
LABEL_6:

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("HMWeekDayScheduleRules"));

  }
  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    v23 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("HMYearDayScheduleRules"));

  }
  v24 = (void *)objc_msgSend(v3, "copy");

  return v24;
}

- (HMRestrictedGuestHomeAccessSchedule)initWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HMWeekDayScheduleRule *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HMYearDayScheduleRule *v19;
  void *v20;
  void *v21;
  HMRestrictedGuestHomeAccessSchedule *v22;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("HMWeekDayScheduleRules"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("HMYearDayScheduleRules"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (v4)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = -[HMWeekDayScheduleRule initWithDictionary:]([HMWeekDayScheduleRule alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12));
          if (v13)
            objc_msgSend(v6, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v4 = v26;
  }
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = -[HMYearDayScheduleRule initWithDictionary:]([HMYearDayScheduleRule alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18));
          if (v19)
            objc_msgSend(v7, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

    v4 = v26;
  }
  v20 = (void *)objc_msgSend(v6, "copy", self);
  v21 = (void *)objc_msgSend(v7, "copy");
  v22 = (HMRestrictedGuestHomeAccessSchedule *)objc_msgSend(v25, "initWithWeekDayRules:yearDayRules:", v20, v21);

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
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

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "weekDayRules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "yearDayRules");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (HMFEqualObjects())
      LOBYTE(v8) = HMFEqualObjects();
    else
      LOBYTE(v8) = 0;
  }

  objc_autoreleasePoolPop(v5);
  return (char)v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableRestrictedGuestSchedule *v4;
  void *v5;
  void *v6;

  v4 = -[HMMutableRestrictedGuestSchedule init](+[HMMutableRestrictedGuestSchedule allocWithZone:](HMMutableRestrictedGuestSchedule, "allocWithZone:", a3), "init");
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSchedule setWeekDayRules:](v4, "setWeekDayRules:", v5);

  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSchedule setYearDayRules:](v4, "setYearDayRules:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("HMWeekDayScheduleRules"));

  }
  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("HMYearDayScheduleRules"));

  }
}

- (HMRestrictedGuestHomeAccessSchedule)initWithCoder:(id)a3
{
  id v4;
  HMRestrictedGuestHomeAccessSchedule *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (HMRestrictedGuestHomeAccessSchedule *)objc_alloc_init((Class)objc_opt_class());
  v6 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMWeekDayScheduleRules"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSchedule setWeekDayRules:](v5, "setWeekDayRules:", v9);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HMYearDayScheduleRules"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMRestrictedGuestHomeAccessSchedule setYearDayRules:](v5, "setYearDayRules:", v13);
  return v5;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("weekDayRules"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("yearDayRules"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSArray)weekDayRules
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWeekDayRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)yearDayRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setYearDayRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearDayRules, 0);
  objc_storeStrong((id *)&self->_weekDayRules, 0);
}

+ (BOOL)isDate:(id)a3 withinAllowedTimeForSchedule:(id)a4 forHomeInTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "weekDayRules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "isDate:inTimeZone:withinAllowedWeekDayScheduleRules:", v8, v10, v11);

  if (v12)
  {
    objc_msgSend(v9, "yearDayRules");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(a1, "isDate:withinAllowedYearDayScheduleRules:", v8, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isDate:(id)a3 inTimeZone:(id)a4 withinAllowedWeekDayScheduleRules:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "hmf_isEmpty") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsInTimeZone:fromDate:", v9, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__HMRestrictedGuestHomeAccessSchedule_isDate_inTimeZone_withinAllowedWeekDayScheduleRules___block_invoke;
    v16[3] = &unk_1E3AB4C50;
    v18 = v13;
    v19 = a1;
    v17 = v8;
    v14 = v13;
    v11 = objc_msgSend(v10, "na_any:", v16);

  }
  return v11;
}

+ (BOOL)isDate:(id)a3 withinAllowedYearDayScheduleRules:(id)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__HMRestrictedGuestHomeAccessSchedule_isDate_withinAllowedYearDayScheduleRules___block_invoke;
    v9[3] = &unk_1E3AB4C78;
    v10 = v5;
    v7 = objc_msgSend(v6, "na_any:", v9);

  }
  return v7;
}

+ (BOOL)doDaysOfTheWeek:(unint64_t)a3 containWeekday:(id)a4
{
  char v5;
  void *v6;
  char v7;

  v5 = objc_msgSend(a4, "weekday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (1 << (v5 - 1)) & a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

uint64_t __80__HMRestrictedGuestHomeAccessSchedule_isDate_withinAllowedYearDayScheduleRules___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __91__HMRestrictedGuestHomeAccessSchedule_isDate_inTimeZone_withinAllowedWeekDayScheduleRules___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");
  objc_msgSend(v3, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMDateFromDateWithHourAndMinuteComponents(v4, v6, objc_msgSend(v7, "minute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "endTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hour");
  objc_msgSend(v3, "endTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMDateFromDateWithHourAndMinuteComponents(v9, v11, objc_msgSend(v12, "minute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v13)
  {
    HMMatterScheduleIntervalFromStartAndEndDates(v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsDate:", *(_QWORD *)(a1 + 32)))
      v15 = objc_msgSend(*(id *)(a1 + 48), "doDaysOfTheWeek:containWeekday:", objc_msgSend(v3, "daysOfTheWeek"), *(_QWORD *)(a1 + 40));
    else
      v15 = 0;

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create start and end dates for weekday rule", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

@end
