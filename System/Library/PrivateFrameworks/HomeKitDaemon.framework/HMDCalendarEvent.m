@implementation HMDCalendarEvent

- (HMDCalendarEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDCalendarEvent *v7;
  void *v8;
  uint64_t v9;
  NSDateComponents *fireDateComponents;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCalendarEvent;
  v7 = -[HMDTimeEvent initWithModel:home:](&v12, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "fireDateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeDateComponents");
    v9 = objc_claimAutoreleasedReturnValue();
    fireDateComponents = v7->_fireDateComponents;
    v7->_fireDateComponents = (NSDateComponents *)v9;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)HMDCalendarEvent;
  -[HMDEvent description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");
  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Calendar-Event: %@, %tuh:%tum]"), v4, v6, objc_msgSend(v7, "minute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = self;
  v10.super_class = (Class)HMDCalendarEvent;
  -[HMDEvent createPayload](&v10, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kCalendarTimeEventFireDateComponents"));

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

- (id)emptyModelObject
{
  HMDCalendarEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCalendarEventModel *v7;

  v3 = [HMDCalendarEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "dataForKey:", CFSTR("kCalendarTimeEventFireDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE68], "hmf_unarchiveFromData:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HMDTimeEvent isValidAbsoluteDateComponents:](HMDTimeEvent, "isValidAbsoluteDateComponents:", v6))
  {
    -[HMDCalendarEvent emptyModelObject](self, "emptyModelObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFireDateComponents:", v5);
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transaction:options:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "add:", v7);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __41__HMDCalendarEvent__handleUpdateRequest___block_invoke;
    v16[3] = &unk_24E79BCC8;
    v17 = v4;
    v18 = v7;
    v14 = v7;
    objc_msgSend(v13, "run:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);

  }
}

- (NSDateComponents)fireDateComponents
{
  os_unfair_lock_s *p_lock;
  NSDateComponents *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_fireDateComponents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFireDateComponents:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *fireDateComponents;

  v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  fireDateComponents = self->_fireDateComponents;
  self->_fireDateComponents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCalendarEvent;
  return -[HMDTimeEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (HMDCalendarEvent)initWithCoder:(id)a3
{
  id v4;
  HMDCalendarEvent *v5;
  uint64_t v6;
  NSDateComponents *fireDateComponents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCalendarEvent;
  v5 = -[HMDTimeEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCalendarTimeEventFireDateComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    fireDateComponents = v5->_fireDateComponents;
    v5->_fireDateComponents = (NSDateComponents *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCalendarEvent;
  v4 = a3;
  -[HMDTimeEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCalendarTimeEventFireDateComponents"));

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDCalendarEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCalendarEventModel *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = [HMDCalendarEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCalendarEventModel setEndEvent:](v9, "setEndEvent:", v10);

  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCalendarEventModel setFireDateComponents:](v9, "setFireDateComponents:", v12);

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCalendarEvent *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v17, "fireDateComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x24BDBCE68];
      objc_msgSend(v17, "fireDateComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hmf_unarchiveFromData:error:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[HMDCalendarEvent fireDateComponents](v12, "fireDateComponents");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqual:", v21);

        if ((v23 & 1) == 0)
        {
          -[HMDCalendarEvent setFireDateComponents:](v12, "setFireDateComponents:", v21);
          -[HMDEvent eventTrigger](v12, "eventTrigger");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "markChangedForMessage:", v10);

        }
      }

    }
    objc_msgSend(v10, "respondWithSuccess");
  }

}

- (BOOL)areMonthDayNotMatching:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  v4 = a3;
  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "month");

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "month");
    v9 = objc_msgSend(v4, "month");

    if (v8 != v9)
      goto LABEL_6;
  }
  -[HMDCalendarEvent fireDateComponents](self, "fireDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "day");

  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (-[HMDCalendarEvent fireDateComponents](self, "fireDateComponents"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "day"),
        v14 = objc_msgSend(v4, "day"),
        v12,
        v13 == v14))
  {
    v15 = 0;
  }
  else
  {
LABEL_6:
    v15 = 1;
  }

  return v15;
}

- (id)_nextTimerDate
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCalendarEvent _nextTimerDateAfterDate:timeZone:](self, "_nextTimerDateAfterDate:timeZone:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_nextTimerDateAfterDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCalendarEvent *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCalendarEvent fireDateComponents](v9, "fireDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEvent eventTrigger](v9, "eventTrigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recurrences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Determining next fire date after date %@ using components: %@ recurrence: %@", (uint8_t *)&v21, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  v15 = (void *)objc_opt_class();
  -[HMDCalendarEvent fireDateComponents](v9, "fireDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](v9, "eventTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recurrences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nextTimerDateAfterDate:timeZone:fireDateComponents:recurrences:", v6, v7, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  HMDAnalyticsCalendarEventData *v4;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v4 = objc_alloc_init(HMDAnalyticsCalendarEventData);
  -[HMDAnalyticsTriggerEventData setCalendarEvent:](v3, "setCalendarEvent:", v4);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDateComponents, 0);
}

void __41__HMDCalendarEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v5 = CFSTR("kCalendarTimeEventFireDateComponents");
    objc_msgSend(*(id *)(a1 + 40), "fireDateComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithPayload:", v4);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_13706 != -1)
    dispatch_once(&logCategory__hmf_once_t0_13706, &__block_literal_global_13707);
  return (id)logCategory__hmf_once_v1_13708;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)nextTimerDateAfterDate:(id)a3 timeZone:(id)a4 fireDateComponents:(id)a5 recurrences:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  id v42;
  id v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "hmf_dateComponentsUsingTimeZone:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v11);
  if (objc_msgSend(v12, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "setMinute:", objc_msgSend(v12, "minute"));
  if (objc_msgSend(v12, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "setHour:", objc_msgSend(v12, "hour"));
  if (objc_msgSend(v12, "day") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "setDay:", objc_msgSend(v12, "day"));
  if (objc_msgSend(v12, "month") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "setMonth:", objc_msgSend(v12, "month"));
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeZone:", v11);
  objc_msgSend(v15, "dateFromComponents:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "compare:", v16);
  v45 = v13;
  if (!objc_msgSend(v13, "count"))
  {
    if (v17 != 1)
      goto LABEL_14;
    v43 = v10;
    if (objc_msgSend(v12, "month") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = objc_msgSend(v12, "day");
      v33 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v34 = v33;
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v33, "setDay:", 1);
        objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v34, v16, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x227676638]();
        v37 = a1;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v39;
          v48 = 2112;
          v49 = v35;
          v40 = "%{public}@Determined next fire date by assigning fire date components to current date and adding one day: %@";
LABEL_28:
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, v40, buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v33, "setMonth:", 1);
        objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v34, v16, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x227676638]();
        v37 = a1;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v39;
          v48 = 2112;
          v49 = v35;
          v40 = "%{public}@Determined next fire date by assigning fire date components to current date and adding one month: %@";
          goto LABEL_28;
        }
      }
    }
    else
    {
      v34 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v34, "setYear:", 1);
      objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v34, v16, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)MEMORY[0x227676638]();
      v37 = a1;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v39;
        v48 = 2112;
        v49 = v35;
        v40 = "%{public}@Determined next fire date by assigning fire date components to current date and adding one year: %@";
        goto LABEL_28;
      }
    }

    objc_autoreleasePoolPop(v36);
    v26 = v35;

    v10 = v43;
    goto LABEL_30;
  }
  v44 = v15;
  v18 = v11;
  v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWeekday:", objc_msgSend(v20, "component:fromDate:", 512, v16));

  if (objc_msgSend(v13, "containsObject:", v19) && v17 != 1)
  {

    v11 = v18;
    v15 = v44;
LABEL_14:
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v25;
      v48 = 2112;
      v49 = v16;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Determined next fire date by assigning fire date components to current date: %@", buf, 0x16u);

      v10 = v24;
    }

    objc_autoreleasePoolPop(v21);
    v26 = v16;
    goto LABEL_30;
  }
  objc_msgSend((id)objc_opt_class(), "_nextRecurrentFireDateAfterDate:recurrences:", v16, v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x227676638]();
  v29 = a1;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v42 = v10;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v31;
    v48 = 2112;
    v49 = v27;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Determined next fire date by assigning fire recurrent date components to current date: %@", buf, 0x16u);

    v10 = v42;
  }

  objc_autoreleasePoolPop(v28);
  v26 = v27;

  v11 = v18;
  v15 = v44;
LABEL_30:

  return v26;
}

+ (id)_nextRecurrentFireDateAfterDate:(id)a3 recurrences:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  int64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 512, v5);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = 7;
    v14 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "weekday", (_QWORD)v24);
        v17 = (v16 - v8 + 7) % 7uLL;
        if (!v17)
          v17 = 7;
        if (v17 < v13)
        {
          v13 = v17;
          v14 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    v14 = v8;
  }

  objc_msgSend(v5, "hmf_dateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v18, "timeZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTimeZone:", v20);

  objc_msgSend(v19, "setHour:", objc_msgSend(v18, "hour"));
  objc_msgSend(v19, "setMinute:", objc_msgSend(v18, "minute"));
  objc_msgSend(v19, "setWeekday:", v14);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nextDateAfterDate:matchingComponents:options:", v5, v19, 1024);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __31__HMDCalendarEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_13708;
  logCategory__hmf_once_v1_13708 = v0;

}

@end
