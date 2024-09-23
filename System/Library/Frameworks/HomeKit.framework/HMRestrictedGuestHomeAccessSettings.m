@implementation HMRestrictedGuestHomeAccessSettings

- (BOOL)doAllAccessoriesBelongToHome:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__HMRestrictedGuestHomeAccessSettings_doAllAccessoriesBelongToHome___block_invoke;
    v12[3] = &unk_1E3AB26F0;
    v13 = v4;
    v10 = objc_msgSend(v9, "na_allObjectsPassTest:", v12);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)locksWithReducedFunctionalityDueToSchedule
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__HMRestrictedGuestHomeAccessSettings_locksWithReducedFunctionalityDueToSchedule__block_invoke;
    v7[3] = &unk_1E3AB26F0;
    v7[4] = self;
    objc_msgSend(v4, "na_filter:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (-[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "accessAllowedToAccessories"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guestAccessSchedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "hash");
  }
  else
  {
    v5 = 0;
  }
  -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = 0;
  }

  if (v4)
  return v8 ^ v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMRestrictedGuestHomeAccessSettings *v4;
  void *v5;
  void *v6;

  v4 = -[HMRestrictedGuestHomeAccessSettings init](+[HMRestrictedGuestHomeAccessSettings allocWithZone:](HMRestrictedGuestHomeAccessSettings, "allocWithZone:", a3), "init");
  -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSettings setAccessAllowedToAccessories:](v4, "setAccessAllowedToAccessories:", v5);

  -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSettings setGuestAccessSchedule:](v4, "setGuestAccessSchedule:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__30111;
    v17 = __Block_byref_object_dispose__30112;
    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__HMRestrictedGuestHomeAccessSettings_encodeWithCoder___block_invoke;
    v12[3] = &unk_1E3AB2778;
    v12[4] = &v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    v9 = (void *)objc_msgSend((id)v14[5], "copy");
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HM.RG.Allowed.Accessory.Identifiers"));

    _Block_object_dispose(&v13, 8);
  }
  -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HM.RG.Schedule"));

  }
}

- (HMRestrictedGuestHomeAccessSettings)initWithCoder:(id)a3
{
  id v4;
  HMRestrictedGuestHomeAccessSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMRestrictedGuestHomeAccessSettings;
  v5 = -[HMRestrictedGuestHomeAccessSettings init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.RG.Allowed.Accessory.Identifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMRestrictedGuestHomeAccessSettings setIdentifiersOfAccessAllowedToAccessories:](v5, "setIdentifiersOfAccessAllowedToAccessories:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.RG.Schedule"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMRestrictedGuestHomeAccessSettings setGuestAccessSchedule:](v5, "setGuestAccessSchedule:", v11);

  }
  return v5;
}

- (void)fixupAccessoriesForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HMRestrictedGuestHomeAccessSettings *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMRestrictedGuestHomeAccessSettings identifiersOfAccessAllowedToAccessories](self, "identifiersOfAccessAllowedToAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HMRestrictedGuestHomeAccessSettings_fixupAccessoriesForHome___block_invoke;
  v14[3] = &unk_1E3AB27A0;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "na_map:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSettings setAccessAllowedToAccessories:](self, "setAccessAllowedToAccessories:", v7);

  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](v9, "accessAllowedToAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](v9, "guestAccessSchedule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@AllowedAccessories: %@, AccessSchedules: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

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
  -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("allowedAccessories"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("schedule"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSSet)accessAllowedToAccessories
{
  return self->_accessAllowedToAccessories;
}

- (void)setAccessAllowedToAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HMRestrictedGuestHomeAccessSchedule)guestAccessSchedule
{
  return self->_guestAccessSchedule;
}

- (void)setGuestAccessSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)identifiersOfAccessAllowedToAccessories
{
  return self->_identifiersOfAccessAllowedToAccessories;
}

- (void)setIdentifiersOfAccessAllowedToAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfAccessAllowedToAccessories, 0);
  objc_storeStrong((id *)&self->_guestAccessSchedule, 0);
  objc_storeStrong((id *)&self->_accessAllowedToAccessories, 0);
}

uint64_t __63__HMRestrictedGuestHomeAccessSettings_fixupAccessoriesForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryWithUUID:", a2);
}

void __55__HMRestrictedGuestHomeAccessSettings_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

BOOL __81__HMRestrictedGuestHomeAccessSettings_locksWithReducedFunctionalityDueToSchedule__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;

  v3 = a2;
  if ((objc_msgSend(v3, "supportsWalletKey") & 1) != 0
    || (objc_msgSend(v3, "supportsUWBUnlock") & 1) != 0
    || objc_msgSend(v3, "supportsAccessCodes"))
  {
    objc_msgSend(*(id *)(a1 + 32), "guestAccessSchedule");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "weekDayRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    objc_msgSend(v3, "weekDaySchedulesPerUserCapacity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 <= objc_msgSend(v7, "integerValue"))
    {
      objc_msgSend(*(id *)(a1 + 32), "guestAccessSchedule");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "yearDayRules");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      objc_msgSend(v3, "yearDaySchedulesPerUserCapacity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11 > objc_msgSend(v12, "integerValue");

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __68__HMRestrictedGuestHomeAccessSettings_doAllAccessoriesBelongToHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  return v6;
}

+ (BOOL)doesAccessoryHaveRestrictedGuestCapableServiceTypes:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__HMRestrictedGuestHomeAccessSettings_doesAccessoryHaveRestrictedGuestCapableServiceTypes___block_invoke;
  v4[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
  v4[4] = a1;
  return objc_msgSend(a3, "na_any:", v4);
}

+ (id)secureClassServices
{
  if (secureClassServices_onceToken != -1)
    dispatch_once(&secureClassServices_onceToken, &__block_literal_global_30123);
  return (id)secureClassServices_secureClassServices;
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

void __58__HMRestrictedGuestHomeAccessSettings_secureClassServices__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("00000081-0000-1000-8000-0026BB765291");
  v4[1] = CFSTR("00000041-0000-1000-8000-0026BB765291");
  v4[2] = CFSTR("00000045-0000-1000-8000-0026BB765291");
  v4[3] = CFSTR("0000007E-0000-1000-8000-0026BB765291");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureClassServices_secureClassServices;
  secureClassServices_secureClassServices = v2;

}

uint64_t __91__HMRestrictedGuestHomeAccessSettings_doesAccessoryHaveRestrictedGuestCapableServiceTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "secureClassServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

@end
