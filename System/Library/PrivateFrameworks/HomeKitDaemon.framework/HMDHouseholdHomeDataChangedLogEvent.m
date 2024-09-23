@implementation HMDHouseholdHomeDataChangedLogEvent

- (id)initAsInsertEventForModelName:(id)a3 count:(unint64_t)a4 homeUUID:(id)a5
{
  return -[HMDHouseholdHomeDataChangedLogEvent initWithChangeType:count:modelName:propertyName:homeUUID:](self, "initWithChangeType:count:modelName:propertyName:homeUUID:", 1, a4, a3, 0, a5);
}

- (id)initAsUpdateEventForModelName:(id)a3 propertyName:(id)a4 count:(unint64_t)a5 homeUUID:(id)a6
{
  return -[HMDHouseholdHomeDataChangedLogEvent initWithChangeType:count:modelName:propertyName:homeUUID:](self, "initWithChangeType:count:modelName:propertyName:homeUUID:", 2, a5, a3, a4, a6);
}

- (id)initAsBecamePrimaryEventWithCount:(unint64_t)a3 homeUUID:(id)a4
{
  return -[HMDHouseholdHomeDataChangedLogEvent initWithChangeType:count:modelName:propertyName:homeUUID:](self, "initWithChangeType:count:modelName:propertyName:homeUUID:", 0, a3, 0, 0, a4);
}

- (HMDHouseholdHomeDataChangedLogEvent)initWithChangeType:(int64_t)a3 count:(unint64_t)a4 modelName:(id)a5 propertyName:(id)a6 homeUUID:(id)a7
{
  id v13;
  id v14;
  HMDHouseholdHomeDataChangedLogEvent *v15;
  HMDHouseholdHomeDataChangedLogEvent *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDHouseholdHomeDataChangedLogEvent;
  v15 = -[HMMHomeLogEvent initWithHomeUUID:](&v18, sel_initWithHomeUUID_, a7);
  v16 = v15;
  if (v15)
  {
    v15->_changeType = a3;
    v15->_count = a4;
    objc_storeStrong((id *)&v15->_modelName, a5);
    objc_storeStrong((id *)&v16->_propertyName, a6);
  }

  return v16;
}

- (HMDHouseholdHomeDataChangedLogEvent)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  HMDHouseholdHomeDataChangedLogEvent *v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("changeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeDataChangedCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propertyName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  v21 = 0;
  if (v7 && v10 && v14)
  {
    if (objc_msgSend(v7, "unsignedIntegerValue"))
    {
      if (v17)
      {
        if (objc_msgSend(v7, "unsignedIntegerValue") == 1)
        {
          v22 = -[HMDHouseholdHomeDataChangedLogEvent initAsInsertEventForModelName:count:homeUUID:](self, "initAsInsertEventForModelName:count:homeUUID:", v17, objc_msgSend(v10, "unsignedIntegerValue"), v14);
LABEL_24:
          self = (HMDHouseholdHomeDataChangedLogEvent *)v22;
          v21 = self;
          goto LABEL_29;
        }
        if (v20 && objc_msgSend(v7, "unsignedIntegerValue") == 2)
        {
          v22 = -[HMDHouseholdHomeDataChangedLogEvent initAsUpdateEventForModelName:propertyName:count:homeUUID:](self, "initAsUpdateEventForModelName:propertyName:count:homeUUID:", v17, v20, objc_msgSend(v10, "unsignedIntegerValue"), v14);
          goto LABEL_24;
        }
      }
      v21 = 0;
      goto LABEL_29;
    }
    v22 = -[HMDHouseholdHomeDataChangedLogEvent initAsBecamePrimaryEventWithCount:homeUUID:](self, "initAsBecamePrimaryEventWithCount:homeUUID:", objc_msgSend(v10, "unsignedIntegerValue"), v14);
    goto LABEL_24;
  }
LABEL_29:

  return v21;
}

- (id)serializedLogEvent
{
  void *v3;
  HMDHouseholdHomeDataChangedLogEvent *v4;
  NSObject *v5;
  void *v6;
  HMDHouseholdHomeDataChangedLogEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHouseholdHomeDataChangedLogEvent *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  HMDHouseholdHomeDataChangedLogEvent *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v6;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@serializing: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (HMDHouseholdHomeDataChangedLogEvent *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHouseholdHomeDataChangedLogEvent changeType](v4, "changeType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdHomeDataChangedLogEvent setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, CFSTR("changeType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDHouseholdHomeDataChangedLogEvent count](v4, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdHomeDataChangedLogEvent setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, CFSTR("homeDataChangedCount"));

  -[HMMHomeLogEvent homeUUIDString](v4, "homeUUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdHomeDataChangedLogEvent setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, CFSTR("homeUUID"));

  -[HMDHouseholdHomeDataChangedLogEvent modelName](v4, "modelName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDHouseholdHomeDataChangedLogEvent modelName](v4, "modelName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHouseholdHomeDataChangedLogEvent setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, CFSTR("modelName"));

  }
  -[HMDHouseholdHomeDataChangedLogEvent propertyName](v4, "propertyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDHouseholdHomeDataChangedLogEvent propertyName](v4, "propertyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHouseholdHomeDataChangedLogEvent setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, CFSTR("propertyName"));

  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = v4;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v18;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@serialized as: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v19 = (void *)-[HMDHouseholdHomeDataChangedLogEvent copy](v7, "copy");

  return v19;
}

- (void)incrementCountWithValue:(unint64_t)a3
{
  -[HMDHouseholdHomeDataChangedLogEvent setCount:](self, "setCount:", -[HMDHouseholdHomeDataChangedLogEvent count](self, "count") + a3);
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.home.data.changed.household");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v14[0] = CFSTR("changeType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHouseholdHomeDataChangedLogEvent changeType](self, "changeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("homeDataChangedCount");
  v15[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDHouseholdHomeDataChangedLogEvent count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHouseholdHomeDataChangedLogEvent modelName](self, "modelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDHouseholdHomeDataChangedLogEvent modelName](self, "modelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("modelName"));

  }
  -[HMDHouseholdHomeDataChangedLogEvent propertyName](self, "propertyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDHouseholdHomeDataChangedLogEvent propertyName](self, "propertyName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("propertyName"));

  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_10;
  v7 = -[HMDHouseholdHomeDataChangedLogEvent changeType](self, "changeType");
  if (v7 != objc_msgSend(v6, "changeType"))
    goto LABEL_10;
  v8 = -[HMDHouseholdHomeDataChangedLogEvent count](self, "count");
  if (v8 != objc_msgSend(v6, "count"))
    goto LABEL_10;
  -[HMDHouseholdHomeDataChangedLogEvent modelName](self, "modelName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HMFEqualObjects();

  if (!v11)
    goto LABEL_10;
  -[HMDHouseholdHomeDataChangedLogEvent propertyName](self, "propertyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HMFEqualObjects();

  if (v14)
  {
    -[HMMHomeLogEvent homeUUID](self, "homeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

  }
  else
  {
LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[HMDHouseholdHomeDataChangedLogEvent changeType](self, "changeType");
  return -[HMDHouseholdHomeDataChangedLogEvent count](self, "count") ^ v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHouseholdHomeDataChangedLogEvent changeType](self, "changeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDHouseholdHomeDataChangedLogEvent count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdHomeDataChangedLogEvent modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdHomeDataChangedLogEvent propertyName](self, "propertyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeLogEvent homeUUID](self, "homeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDHouseholdHomeDataChangedLogEvent: changeType: %@ count: %@ modelName: %@ propertyName: %@ homeUUID: %@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
