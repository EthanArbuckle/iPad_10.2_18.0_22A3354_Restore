@implementation HMDPresenceNotificationCondition

- (HMDPresenceNotificationCondition)initWithPresenceEventType:(unint64_t)a3 presenceEventUserType:(unint64_t)a4 userUUIDs:(id)a5
{
  id v9;
  HMDPresenceNotificationCondition *v10;
  HMDPresenceNotificationCondition *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDPresenceNotificationCondition;
  v10 = -[HMDPresenceNotificationCondition init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_presenceEventType = a3;
    v10->_presenceEventUserType = a4;
    objc_storeStrong((id *)&v10->_userUUIDs, a5);
  }

  return v11;
}

- (HMDPresenceNotificationCondition)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPresenceNotificationCondition *v15;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDPSC.ck.pet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDPSC.ck.peut"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    v11 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDPSC.ck.uu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "na_map:", &__block_literal_global_163906);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMDPresenceNotificationCondition initWithPresenceEventType:presenceEventUserType:userUUIDs:](self, "initWithPresenceEventType:presenceEventUserType:userUUIDs:", v8, v10, v14);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)serializedRegistrationForRemoteMessage
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDPresenceNotificationCondition;
  -[HMDNotificationCondition serializedRegistrationForRemoteMessage](&v13, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HMDPSC.ck.pet"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HMDPSC.ck.peut"));

  -[HMDPresenceNotificationCondition userUUIDs](self, "userUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_13_163905);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HMDPSC.ck.uu"));

  objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HMDPSC.ck.eu"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType"),
        v7 == objc_msgSend(v6, "presenceEventType"))
    && (v8 = -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType"),
        v8 == objc_msgSend(v6, "presenceEventUserType")))
  {
    -[HMDPresenceNotificationCondition userUUIDs](self, "userUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToSet:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType");
  return -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType") ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType"), CFSTR("HMDPSC.ck.pet"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType"), CFSTR("HMDPSC.ck.peut"));
  -[HMDPresenceNotificationCondition userUUIDs](self, "userUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDPSC.ck.uu"));

  objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDPSC.ck.eu"));

}

- (HMDPresenceNotificationCondition)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDPresenceNotificationCondition *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDPSC.ck.pet"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDPSC.ck.peut"));
  v7 = (void *)MEMORY[0x24BDBCF20];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HMDPSC.ck.uu"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMDPresenceNotificationCondition initWithPresenceEventType:presenceEventUserType:userUUIDs:](self, "initWithPresenceEventType:presenceEventUserType:userUUIDs:", v5, v6, v10);
  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType");
  HMPresenceEventTypeAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Presence Event Type"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType", v5);
  HMPresenceEventUserTypeAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Presence Event User Types"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDPresenceNotificationCondition userUUIDs](self, "userUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("User UUIDs"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)presenceEventType
{
  return self->_presenceEventType;
}

- (unint64_t)presenceEventUserType
{
  return self->_presenceEventUserType;
}

- (NSSet)userUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUIDs, 0);
}

uint64_t __74__HMDPresenceNotificationCondition_serializedRegistrationForRemoteMessage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

id __55__HMDPresenceNotificationCondition_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

+ (id)type
{
  return CFSTR("HMDPSC.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
