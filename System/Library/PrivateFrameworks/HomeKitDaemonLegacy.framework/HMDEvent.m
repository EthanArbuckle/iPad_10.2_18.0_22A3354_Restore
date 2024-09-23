@implementation HMDEvent

- (HMDEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMDEvent *v8;
  uint64_t v9;
  NSUUID *uuid;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDEvent;
  v8 = -[HMDEvent init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "uuid");
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v9;

    objc_storeWeak((id *)&v8->_home, v7);
    objc_msgSend(v6, "endEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_endEvent = objc_msgSend(v11, "BOOLValue");

    -[HMDEvent _setup](v8, "_setup");
  }

  return v8;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_activationType = 0;
  -[HMDEvent _updateTriggerType](self, "_updateTriggerType");
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent setLogString:](self, "setLogString:", v7);

}

- (void)_updateTriggerType
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeCharacteristicEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeLocationEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeCalendarEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeSignificantTimeEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeDurationEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeCharacteristicThresholdRangeEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypePresenceEventKey"));
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDEvent uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isConfigured
{
  void *v2;
  BOOL v3;

  -[HMDEvent workQueue](self, "workQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return 0;
}

- (id)emptyModelObject
{
  return 0;
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 delegate:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent uuid](self, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent setLogString:](self, "setLogString:", v18);

  -[HMDEvent setEventTrigger:](self, "setEventTrigger:", v14);
  objc_msgSend(v14, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDEvent setHome:](self, "setHome:", v19);
  -[HMDEvent setMsgDispatcher:](self, "setMsgDispatcher:", v13);

  -[HMDEvent setWorkQueue:](self, "setWorkQueue:", v12);
  -[HMDEvent setDelegate:](self, "setDelegate:", v11);

  -[HMDEvent _registerForMessages](self, "_registerForMessages");
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDEvent msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDEvent home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  -[HMDEvent setMsgDispatcher:](self, "setMsgDispatcher:", 0);
  -[HMDEvent setEventTrigger:](self, "setEventTrigger:", 0);
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[HMDEvent home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kEventTriggerUpdateEventRequestKey"), self, v7, sel__handleUpdateRequest_);

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDEvent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("uuid: %@, trigger: %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D27F80]);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDEvent *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMDEvent *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDEvent uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEvent uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kEventUUIDKey");
  -[HMDEvent uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("kEventTriggerTypeKey");
  -[HMDEvent triggerType](self, "triggerType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("kEventTriggerEndEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDEvent uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDEvent triggerType](self, "triggerType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (HMDEvent)initWithCoder:(id)a3
{
  id v4;
  HMDEvent *v5;
  void *v6;
  uint64_t v7;
  NSUUID *uuid;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDEvent;
  v5 = -[HMDEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.eventIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.eventTrigger"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_eventTrigger, v9);

    v5->_endEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kEventTriggerEndEvent"));
    -[HMDEvent _setup](v5, "_setup");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HM.eventIdentifier"));

  -[HMDEvent eventTrigger](self, "eventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeConditionalObject:forKey:", v6, CFSTR("HM.eventTrigger"));

  objc_msgSend(v7, "encodeBool:forKey:", -[HMDEvent isEndEvent](self, "isEndEvent"), CFSTR("kEventTriggerEndEvent"));
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
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
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)_transactionObjectRemoved:(id)a3 message:(id)a4
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
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  HMDEvent *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerActivationTypeAsString(-[HMDEvent activationType](v8, "activationType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerActivationTypeAsString(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating the activation type from %@ to %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v13 = -[HMDEvent activationType](v8, "activationType");
  if (v13 != a3)
    -[HMDEvent setActivationType:](v8, "setActivationType:", a3);
  v14 = _Block_copy(v6);
  v15 = v14;
  if (v14)
    (*((void (**)(void *, _QWORD))v14 + 2))(v14, 0);

  return v13 != a3;
}

- (id)analyticsTriggerEventData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDEventTrigger)eventTrigger
{
  return (HMDEventTrigger *)objc_loadWeakRetained((id *)&self->_eventTrigger);
}

- (void)setEventTrigger:(id)a3
{
  objc_storeWeak((id *)&self->_eventTrigger, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDEventDelegate)delegate
{
  return (HMDEventDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (NSString)logString
{
  return self->_logString;
}

- (void)setLogString:(id)a3
{
  objc_storeStrong((id *)&self->_logString, a3);
}

- (BOOL)isEndEvent
{
  return self->_endEvent;
}

- (unint64_t)activationType
{
  return self->_activationType;
}

- (void)setActivationType:(unint64_t)a3
{
  self->_activationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logString, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_eventTrigger);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_108055 != -1)
    dispatch_once(&logCategory__hmf_once_t0_108055, &__block_literal_global_108056);
  return (id)logCategory__hmf_once_v1_108057;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __23__HMDEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_108057;
  logCategory__hmf_once_v1_108057 = v0;

}

@end
