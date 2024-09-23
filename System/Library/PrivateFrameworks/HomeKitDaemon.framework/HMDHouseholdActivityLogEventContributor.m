@implementation HMDHouseholdActivityLogEventContributor

- (HMDHouseholdActivityLogEventContributor)initWithHouseholdGroupName:(id)a3 countersManager:(id)a4 dateProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDHouseholdActivityLogEventContributor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDHouseholdActivityLogEventContributor;
  v12 = -[HMDHouseholdActivityLogEventContributor init](&v14, sel_init);
  if (v12 == self)
  {
    objc_storeStrong((id *)&self->_householdGroupName, a3);
    objc_storeStrong((id *)&self->_countersManager, a4);
    objc_storeStrong((id *)&self->_dateProvider, a5);
  }

  return v12;
}

- (id)householdGroupForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[HMDHouseholdActivityLogEventContributor countersManager](self, "countersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdActivityLogEventContributor householdGroupName](self, "householdGroupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)householdGroupForLogEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  HMMSafeHomeUUIDFromLogEvent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDHouseholdActivityLogEventContributor dateProvider](self, "dateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOfCurrentDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHouseholdActivityLogEventContributor householdGroupForHomeWithUUID:associatedWithDate:](self, "householdGroupForHomeWithUUID:associatedWithDate:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHouseholdActivityLogEventContributor countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDHouseholdActivityLogEventContributor_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_24E779F80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHouseholdActivityLogEventContributor countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__HMDHouseholdActivityLogEventContributor_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_24E779F80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (NSString)householdGroupName
{
  return self->_householdGroupName;
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_householdGroupName, 0);
}

BOOL __67__HMDHouseholdActivityLogEventContributor_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "householdGroupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(v6, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 40)) == 1;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __68__HMDHouseholdActivityLogEventContributor_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "householdGroupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(v6, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 40)) == -1;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_32852 != -1)
    dispatch_once(&logCategory__hmf_once_t2_32852, &__block_literal_global_32853);
  return (id)logCategory__hmf_once_v3_32854;
}

void __54__HMDHouseholdActivityLogEventContributor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_32854;
  logCategory__hmf_once_v3_32854 = v0;

}

@end
