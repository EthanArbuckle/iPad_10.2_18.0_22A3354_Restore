@implementation HMDRestrictedGuestHomeAccessSettings

- (HMDRestrictedGuestHomeAccessSettings)initWithRestrictedGuestHomeAccessSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMDRestrictedGuestHomeAccessSettings *v9;

  v4 = a3;
  objc_msgSend(v4, "identifiersOfAccessAllowedToAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (void *)v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(v4, "guestAccessSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDRestrictedGuestHomeAccessSettings initWithAllowedAccessories:schedule:](self, "initWithAllowedAccessories:schedule:", v7, v8);
  return v9;
}

- (HMDRestrictedGuestHomeAccessSettings)initWithAllowedAccessories:(id)a3 schedule:(id)a4
{
  id v7;
  id v8;
  HMDRestrictedGuestHomeAccessSettings *v9;
  HMDRestrictedGuestHomeAccessSettings *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDRestrictedGuestHomeAccessSettings;
  v9 = -[HMDRestrictedGuestHomeAccessSettings init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuidsOfAllowedAccessories, a3);
    objc_storeStrong((id *)&v10->_schedule, a4);
  }

  return v10;
}

- (HMDRestrictedGuestHomeAccessSettings)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRestrictedGuestHomeAccessSettings *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x24BDD6AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMDRestrictedGuestHomeAccessSettings initWithAllowedAccessories:schedule:](self, "initWithAllowedAccessories:schedule:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDRestrictedGuestHomeAccessSettings uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD6AA0]);

  -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6AB0]);

}

- (NSArray)uuidsOfAllowedAccessories
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_uuidsOfAllowedAccessories;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUuidsOfAllowedAccessories:(id)a3
{
  NSArray *v4;
  NSArray *uuidsOfAllowedAccessories;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  uuidsOfAllowedAccessories = self->_uuidsOfAllowedAccessories;
  self->_uuidsOfAllowedAccessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMRestrictedGuestHomeAccessSchedule)schedule
{
  os_unfair_lock_s *p_lock;
  HMRestrictedGuestHomeAccessSchedule *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_schedule;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSchedule:(id)a3
{
  HMRestrictedGuestHomeAccessSchedule *v4;
  HMRestrictedGuestHomeAccessSchedule *schedule;

  v4 = (HMRestrictedGuestHomeAccessSchedule *)a3;
  os_unfair_lock_lock_with_options();
  schedule = self->_schedule;
  self->_schedule = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)matterWeekDaySchedules
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weekDayRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_15197);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v6 = v4;

  return v6;
}

- (NSArray)matterYearDaySchedules
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yearDayRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_7_15194);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v6 = v4;

  return v6;
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
  char v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x24BDBCF20];
  -[HMDRestrictedGuestHomeAccessSettings uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v8, "uuidsOfAllowedAccessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && HMFEqualObjects())
  {
    -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schedule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

  }
  else
  {
    v17 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v17;
}

- (BOOL)updateRestrictedGuestSettingsFromWorkingStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__HMDRestrictedGuestHomeAccessSettings_updateRestrictedGuestSettingsFromWorkingStore___block_invoke;
  v10[3] = &unk_24E79C0A8;
  v10[4] = self;
  v8 = v4;
  v11 = v8;
  v12 = &v13;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v10);
  LOBYTE(v4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

- (id)nextScheduledInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x227676638](self, a2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRestrictedGuestHomeAccessSettings _nextScheduledIntervalFromDate:timeZone:](self, "_nextScheduledIntervalFromDate:timeZone:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)_nextScheduledIntervalFromDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_class();
    -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "weekDayRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertWeekDayRulesToDateIntervals:currentTime:timeZone:", v12, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v13);

    -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "yearDayRules");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__HMDRestrictedGuestHomeAccessSettings__nextScheduledIntervalFromDate_timeZone___block_invoke;
    v20[3] = &unk_24E7773D8;
    v20[4] = self;
    v21 = v6;
    v16 = v9;
    v22 = v16;
    objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    objc_msgSend((id)objc_opt_class(), "mergeIntervals:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDRestrictedGuestHomeAccessSettings uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("allowedAccessories"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDRestrictedGuestHomeAccessSettings schedule](self, "schedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("schedule"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_uuidsOfAllowedAccessories, 0);
}

void __80__HMDRestrictedGuestHomeAccessSettings__nextScheduledIntervalFromDate_timeZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend(v10, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "shouldConsiderStartDate:endDate:currentTime:", v5, v7, *(_QWORD *)(a1 + 40));

  if ((_DWORD)v3)
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v10, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

void __86__HMDRestrictedGuestHomeAccessSettings_updateRestrictedGuestSettingsFromWorkingStore___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v35 = 138543618;
    v36 = v5;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to update the schedule for restricted guest : %@", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findGuestWithModelID:](HMCContext, "findGuestWithModelID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "allowedAccessoryUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuidsOfAllowedAccessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setUuidsOfAllowedAccessories:", v9));
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 40);
        v35 = 138543874;
        v36 = v17;
        v37 = 2112;
        v38 = v18;
        v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updated the allowed accessories for restricted guest: %@, to: %@", (uint8_t *)&v35, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }
    objc_msgSend(v8, "restrictedGuestSchedule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "schedule");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setSchedule:", v19));
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        v35 = 138543874;
        v36 = v25;
        v37 = 2112;
        v38 = v26;
        v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Updated the schedule for restricted guest: %@, to: %@", (uint8_t *)&v35, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    if (!v13 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "homeManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("RGScheduleGotUpdated"), v29, 1);

    }
  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v33;
      v37 = 2112;
      v38 = v34;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find restricted guest in working store with UUID: %@", (uint8_t *)&v35, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
  }

}

id __62__HMDRestrictedGuestHomeAccessSettings_matterYearDaySchedules__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x24BE4EFB8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithStartTime:endTime:", v6, v8);

  return v9;
}

id __62__HMDRestrictedGuestHomeAccessSettings_matterWeekDaySchedules__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
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
  id v19;

  v2 = (objc_class *)MEMORY[0x24BE4EFB0];
  v3 = a2;
  v19 = [v2 alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "daysOfTheWeek"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "hour"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "startTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "minute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "endTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "hour"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "endTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "minute"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v19, "initWithDaysMask:startHour:startMinute:endHour:endMinute:", v4, v7, v10, v13, v16);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)convertWeekDayRulesToDateIntervals:(id)a3 currentTime:(id)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  void *v27;
  id v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v8;
    obj = v8;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v30)
    {
      v12 = *(_QWORD *)v32;
      v27 = v11;
      v28 = a1;
      v26 = v10;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(a1, "dateIntervalFromWeekDayRule:currentTime:timeZone:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), v9, v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)MEMORY[0x227676638]();
            v16 = a1;
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "startDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "endDate");
              v20 = v12;
              v21 = v9;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v36 = v18;
              v37 = 2112;
              v38 = v19;
              v39 = 2112;
              v40 = v22;
              _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[Calculated interval : [%@, %@]]", buf, 0x20u);

              v9 = v21;
              v12 = v20;

              v10 = v26;
              a1 = v28;

              v11 = v27;
            }

            objc_autoreleasePoolPop(v15);
            objc_msgSend(v11, "addObject:", v14);
          }

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v30);
    }

    v23 = (void *)objc_msgSend(v11, "copy");
    v8 = v25;
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v23;
}

+ (id)dateIntervalFromWeekDayRule:(id)a3 currentTime:(id)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v24 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "daysOfTheWeek");
  HMDaysOfTheWeekToDateComponents();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCalendarEvent nextTimerDateAfterDate:timeZone:fireDateComponents:recurrences:](HMDCalendarEvent, "nextTimerDateAfterDate:timeZone:fireDateComponents:recurrences:", v9, v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hour") != 23)
  {

LABEL_10:
    objc_msgSend(v8, "endTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCalendarEvent nextTimerDateAfterDate:timeZone:fireDateComponents:recurrences:](HMDCalendarEvent, "nextTimerDateAfterDate:timeZone:fireDateComponents:recurrences:", v9, v10, v25, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_msgSend(v8, "endTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "minute");

  if (v16 != 59)
    goto LABEL_10;
  v35 = v13;
  v37 = v11;
  objc_msgSend(v9, "addTimeInterval:", 86400.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "components:fromDate:", 124, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWeekday:", objc_msgSend(v21, "component:fromDate:", 512, v9));

  if (objc_msgSend(v19, "hour") != 23)
    goto LABEL_18;
  if (objc_msgSend(v19, "minute") == 59 && objc_msgSend(v37, "containsObject:", v20))
  {
    objc_msgSend(v19, "setHour:", 0);
    objc_msgSend(v19, "setMinute:", 0);
    objc_msgSend(v19, "setSecond:", 0);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dateFromComponents:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_18:
    v23 = 0;
  }

  v13 = v35;
  v11 = v37;
  if (!v23)
    goto LABEL_10;
LABEL_11:
  if (objc_msgSend(v13, "compare:", v23) == 1)
  {
    v36 = v13;
    v38 = v11;
    objc_msgSend(v8, "startTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hour");
    objc_msgSend(v8, "startTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "minute");
    HMDateFromDateWithHourAndMinuteComponents();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v23;
    v30 = (void *)MEMORY[0x227676638]();
    v31 = a1;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      v41 = 2112;
      v42 = v28;
      v43 = 2112;
      v44 = v29;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@weekDayRuleStart: %@, weekDayRuleEnd: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    HMMatterScheduleIntervalFromStartAndEndDates();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v36;
    v11 = v38;
  }
  else
  {
    HMMatterScheduleIntervalFromStartAndEndDates();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_17:
  return v24;
}

+ (id)mergeIntervals:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;

  v3 = a3;
  if ((objc_msgSend(v3, "hmf_isEmpty") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_21_15226);
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v10 = 2;
    v11 = 1;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v14 = v13;
      objc_msgSend(v12, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSince1970");
      if (v14 > v16)
        break;
      v17 = vabdd_f64(v14, v16);

      if (v17 < 2.22044605e-16)
        goto LABEL_8;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v7, v9);
      objc_msgSend(v5, "addObject:", v25);

      objc_msgSend(v12, "startDate");
      v26 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)v26;
LABEL_13:

      v11 = v10;
      v27 = objc_msgSend(v3, "count") > (unint64_t)v10++;
      v9 = v24;
      if (!v27)
        goto LABEL_16;
    }

LABEL_8:
    objc_msgSend(v9, "timeIntervalSince1970");
    v19 = v18;
    objc_msgSend(v12, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSince1970");
    v22 = v21;

    if (v19 >= v22)
      v23 = v19;
    else
      v23 = v22;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v24 = v9;
LABEL_16:
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v7, v24);
  objc_msgSend(v5, "addObject:", v28);

  v4 = (void *)objc_msgSend(v5, "copy");
LABEL_17:

  return v4;
}

+ (BOOL)shouldConsiderStartDate:(id)a3 endDate:(id)a4 currentTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "compare:", v8);
  v12 = objc_msgSend(v10, "compare:", v9);
  v13 = (void *)MEMORY[0x227676638]();
  v14 = a1;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v16;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v17;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@startDate: %@ / in future: %@, endDate: %@ / in future: %@", buf, 0x34u);

    v13 = v22;
  }

  objc_autoreleasePoolPop(v13);
  v20 = v11 != 1 || v12 != 1;

  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_15221 != -1)
    dispatch_once(&logCategory__hmf_once_t12_15221, &__block_literal_global_23);
  return (id)logCategory__hmf_once_v13_15222;
}

+ (void)__logIntervals:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__HMDRestrictedGuestHomeAccessSettings___logIntervals___block_invoke;
  v3[3] = &__block_descriptor_40_e31_v32__0__NSDateInterval_8Q16_B24l;
  v3[4] = a1;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
}

void __55__HMDRestrictedGuestHomeAccessSettings___logIntervals___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@, %@]", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __51__HMDRestrictedGuestHomeAccessSettings_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_15222;
  logCategory__hmf_once_v13_15222 = v0;

}

uint64_t __55__HMDRestrictedGuestHomeAccessSettings_mergeIntervals___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
