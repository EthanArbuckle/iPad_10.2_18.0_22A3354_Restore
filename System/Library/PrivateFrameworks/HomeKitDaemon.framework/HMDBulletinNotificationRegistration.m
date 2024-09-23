@implementation HMDBulletinNotificationRegistration

- (HMDBulletinNotificationRegistration)initWithConditions:(id)a3
{
  id v5;
  void *v6;
  HMDBulletinNotificationRegistration *v7;
  HMDBulletinNotificationRegistration *v8;
  HMDBulletinNotificationRegistration *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDBulletinNotificationRegistration;
    v7 = -[HMDBulletinNotificationRegistration init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_conditions, a3);

    return v8;
  }
  else
  {
    v10 = (HMDBulletinNotificationRegistration *)_HMFPreconditionFailure();
    return (HMDBulletinNotificationRegistration *)-[HMDBulletinNotificationRegistration predicate](v10, v11);
  }
}

- (NSPredicate)predicate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNotificationConditionConverter predicatesFromConditions:](HMDNotificationConditionConverter, "predicatesFromConditions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__HMDBulletinNotificationRegistration_predicate__block_invoke;
  v8[3] = &unk_24E794050;
  v9 = v4;
  v5 = v4;
  __48__HMDBulletinNotificationRegistration_predicate__block_invoke((uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

- (HMDBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HMDBulletinNotificationRegistration *v8;
  id v9;
  HMDBulletinNotificationRegistration *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  HMDBulletinNotificationRegistration *v16;
  id v17;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDBNR.ck.c"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __58__HMDBulletinNotificationRegistration_initWithDictionary___block_invoke;
  v15 = &unk_24E79B878;
  v8 = self;
  v16 = v8;
  v17 = v6;
  v9 = v6;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v12);
  v10 = -[HMDBulletinNotificationRegistration initWithConditions:](v8, "initWithConditions:", v9, v12, v13, v14, v15);

  return v10;
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__HMDBulletinNotificationRegistration_serializedRegistrationForRemoteMessage__block_invoke;
  v12[3] = &unk_24E779FE8;
  v12[4] = self;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  v14[0] = CFSTR("HMDBNR.reg.type");
  objc_msgSend((id)objc_opt_class(), "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = CFSTR("HMDBNR.ck.c");
  v9 = (void *)objc_msgSend(v7, "copy");
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDBulletinNotificationRegistration conditions](self, "conditions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToSet:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDBNR.ck.c"));

}

- (HMDBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDBulletinNotificationRegistration *v9;
  HMDBulletinNotificationRegistration *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("HMDBNR.ck.c"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[HMDBulletinNotificationRegistration initWithConditions:](self, "initWithConditions:", v8);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = 0;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded conditions: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("conditions"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)conditions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
}

void __77__HMDBulletinNotificationRegistration_serializedRegistrationForRemoteMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "serializedRegistrationForRemoteMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize condition %@ for remote message", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __58__HMDBulletinNotificationRegistration_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_opt_class();
  v5 = off_24E7626F0;
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "doesTypeMatch:against:", v3, v6);

  if ((v4 & 1) != 0
    || (v7 = objc_opt_class(),
        v5 = off_24E762720,
        objc_msgSend((id)objc_opt_class(), "type"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v7) = objc_msgSend((id)v7, "doesTypeMatch:against:", v3, v8),
        v8,
        (v7 & 1) != 0))
  {
    v9 = objc_msgSend(objc_alloc(*v5), "initWithDictionary:", v3);
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Dropping unknown type : %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

id __48__HMDBulletinNotificationRegistration_predicate__block_invoke(uint64_t a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, *(_QWORD *)(a1 + 32));
  }
  return v2;
}

+ (id)type
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HMDBNR.reg.type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

@end
