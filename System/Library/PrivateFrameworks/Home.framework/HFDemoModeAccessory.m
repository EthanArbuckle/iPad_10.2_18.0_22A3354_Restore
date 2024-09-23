@implementation HFDemoModeAccessory

+ (id)accessoryWithContentsOfDictionary:(id)a3 forHome:(id)a4
{
  id v5;
  id v6;
  HFDemoModeAccessory *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HFDemoModeAccessory initWithContentsOfDictionary:forHome:]([HFDemoModeAccessory alloc], "initWithContentsOfDictionary:forHome:", v6, v5);

  return v7;
}

+ (BOOL)_hasValidKeys:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18[0] = CFSTR("name");
  v18[1] = CFSTR("type");
  v18[2] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 != 0;

        v8 &= v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSUUID)uniqueIdentifier
{
  NSUUID *internalUniqueIdentifier;
  void *v4;
  void *v5;
  NSUUID *v6;
  void *v7;
  NSUUID *v8;
  NSUUID *v9;
  void *v10;

  internalUniqueIdentifier = self->_internalUniqueIdentifier;
  if (!internalUniqueIdentifier)
  {
    -[HFDemoModeAccessory applicationData](self, "applicationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
      v7 = self->_internalUniqueIdentifier;
      self->_internalUniqueIdentifier = v6;
    }
    else
    {
      v8 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
      v9 = self->_internalUniqueIdentifier;
      self->_internalUniqueIdentifier = v8;

      -[NSUUID UUIDString](self->_internalUniqueIdentifier, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFDemoModeAccessory applicationData](self, "applicationData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("UUID"));

    }
    internalUniqueIdentifier = self->_internalUniqueIdentifier;
  }
  return internalUniqueIdentifier;
}

- (NSString)firmwareVersion
{
  void *v2;
  void *v3;
  void *v4;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("manufacturerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firmware"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)manufacturer
{
  void *v2;
  void *v3;
  void *v4;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("manufacturerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)model
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("manufacturerInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (-[HFDemoModeAccessory _isAppleInternalAccessory](self, "_isAppleInternalAccessory")
         && -[HFDemoModeAccessory _shouldShowAppleInternalManufacturerInfo](self, "_shouldShowAppleInternalManufacturerInfo"))
  {
    -[HFDemoModeAccessory uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "substringWithRange:", objc_msgSend(v9, "length") - 7, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("993-%@/A"), v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessory _updateManufacturerInfoWithString:forKey:](self, "_updateManufacturerInfoWithString:forKey:", v7, CFSTR("model"));

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (id)serialNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("manufacturerInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (-[HFDemoModeAccessory _isAppleInternalAccessory](self, "_isAppleInternalAccessory")
         && -[HFDemoModeAccessory _shouldShowAppleInternalManufacturerInfo](self, "_shouldShowAppleInternalManufacturerInfo"))
  {
    -[HFDemoModeAccessory uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1EA741FF8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "substringWithRange:", 0, 12);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessory _updateManufacturerInfoWithString:forKey:](self, "_updateManufacturerInfoWithString:forKey:", v7, CFSTR("serialNumber"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)room
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

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("room"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("name = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") == 1)
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  else
    objc_msgSend(v4, "roomForEntireHome");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)name
{
  void *v2;
  void *v3;

  -[HFDemoModeAccessory hf_serviceNameComponents](self, "hf_serviceNameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)category
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("Other");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "_demoModeAccessoryTypeToHomeKitAccessoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)*MEMORY[0x1E0CB7A70];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1D8]), "initWithType:name:", v14, v7);
  return v15;
}

- (id)services
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)isReachable
{
  return 1;
}

- (id)symptomsHandler
{
  return 0;
}

- (int64_t)certificationStatus
{
  if (-[HFDemoModeAccessory isInternallyCertified](self, "isInternallyCertified"))
    return 2;
  else
    return 1;
}

- (BOOL)hf_shouldShowSoftwareUpdateInfo
{
  return 0;
}

- (BOOL)hf_isMediaAccessory
{
  return -[HMAccessory hf_isHomePod](self, "hf_isHomePod") || -[HMAccessory hf_isAppleTV](self, "hf_isAppleTV");
}

- (BOOL)hf_isFavorite
{
  void *v2;
  void *v3;
  char v4;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HFApplicationDataAccessoryIsFavoriteKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)hf_hasSetFavorite
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HFApplicationDataAccessoryIsFavoriteKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hf_effectiveIsFavorite
{
  if (-[HFDemoModeAccessory hf_isFavorite](self, "hf_isFavorite"))
    return 1;
  else
    return !-[HFDemoModeAccessory hf_hasSetFavorite](self, "hf_hasSetFavorite");
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("HFApplicationDataAccessoryIsFavoriteKey"));

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  return 0;
}

- (id)hf_updateUserNotificationSettings:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HFServiceNameComponents *v7;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("room"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:]([HFServiceNameComponents alloc], "initWithRawServiceName:rawRoomName:", v4, v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFDemoModeAccessory *v4;
  void *v5;
  void *v6;
  void *v7;
  HFDemoModeAccessory *v8;

  v4 = [HFDemoModeAccessory alloc];
  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFDemoModeAccessory initWithContentsOfDictionary:forHome:](v4, "initWithContentsOfDictionary:forHome:", v6, v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFDemoModeAccessory *v4;
  void *v5;
  void *v6;
  void *v7;
  HFDemoModeAccessory *v8;

  v4 = [HFDemoModeAccessory alloc];
  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFDemoModeAccessory initWithContentsOfDictionary:forHome:](v4, "initWithContentsOfDictionary:forHome:", v6, v7);

  return v8;
}

- (HFDemoModeAccessory)initWithContentsOfDictionary:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  HFDemoModeAccessory *v8;
  HFDemoModeAccessory *v9;
  id *v10;
  void *v11;
  HFDemoModeAccessory *v12;
  _QWORD v14[4];
  id *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_hasValidKeys:", v6))
  {
    v16.receiver = self;
    v16.super_class = (Class)HFDemoModeAccessory;
    v8 = -[HFDemoModeAccessory init](&v16, sel_init);
    v9 = v8;
    if (v8)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__HFDemoModeAccessory_initWithContentsOfDictionary_forHome___block_invoke;
      v14[3] = &unk_1EA738BF8;
      v10 = v8;
      v15 = v10;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
      objc_storeStrong(v10 + 79, a4);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[HFDemoModeAccessoryManager isInternalAccessoryType:](HFDemoModeAccessoryManager, "isInternalAccessoryType:", v11))
      {
        objc_msgSend(v10, "setIsInternallyCertified:", 1);
      }

    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __60__HFDemoModeAccessory_initWithContentsOfDictionary_forHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "applicationData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HFDemoModeAccessory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFDemoModeAccessory isReachable](self, "isReachable");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Name = %@, Identifier = %@, Reachable = %@>"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (id)_demoModeAccessoryTypeToHomeKitAccessoryType
{
  if (_MergedGlobals_2_2 != -1)
    dispatch_once(&_MergedGlobals_2_2, &__block_literal_global_40_7);
  return (id)qword_1ED378A08;
}

void __67__HFDemoModeAccessory__demoModeAccessoryTypeToHomeKitAccessoryType__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB7A18];
  v4[0] = CFSTR("AppleTV");
  v4[1] = CFSTR("HomePod");
  v1 = *MEMORY[0x1E0CB7A58];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = CFSTR("HomePodMini");
  v4[3] = CFSTR("MediaSystem-HomePod");
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = CFSTR("MediaSystem-HomePodMini");
  v5[4] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378A08;
  qword_1ED378A08 = v2;

}

- (void)_updateManufacturerInfoWithString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("manufacturerInfo"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("manufacturerInfo"));

}

- (BOOL)_isAppleInternalAccessory
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3
    && ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomePod")) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", CFSTR("HomePodMini")) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", CFSTR("MediaSystem-HomePod")) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", CFSTR("MediaSystem-HomePodMini")) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0);

  return v4;
}

- (BOOL)_shouldShowAppleInternalManufacturerInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[HFDemoModeAccessory applicationData](self, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MediaSystem-HomePod")))
  {
    -[HFDemoModeAccessory applicationData](self, "applicationData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("MediaSystem-HomePodMini")) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (NSUUID)internalUniqueIdentifier
{
  return self->_internalUniqueIdentifier;
}

- (void)setInternalUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_internalUniqueIdentifier, a3);
}

- (BOOL)areNotificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (NSPredicate)notificationCondition
{
  return self->_notificationCondition;
}

- (void)setNotificationCondition:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCondition, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (BOOL)isInternallyCertified
{
  return self->_isInternallyCertified;
}

- (void)setIsInternallyCertified:(BOOL)a3
{
  self->_isInternallyCertified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_notificationCondition, 0);
  objc_storeStrong((id *)&self->_internalUniqueIdentifier, 0);
}

- (Class)hf_itemClass
{
  return (Class)objc_opt_class();
}

@end
