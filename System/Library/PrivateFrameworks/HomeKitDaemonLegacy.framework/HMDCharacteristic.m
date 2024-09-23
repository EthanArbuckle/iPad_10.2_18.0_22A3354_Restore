@implementation HMDCharacteristic

- (NSString)type
{
  void *v2;
  void *v3;

  -[HMDCharacteristic characteristicType](self, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSNumber)instanceID
{
  void *v2;
  void *v3;

  -[HMDCharacteristic characteristicInstanceID](self, "characteristicInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSNumber *)v3;
}

- (NSNumber)characteristicInstanceID
{
  return self->_characteristicInstanceID;
}

uint64_t __62__HMDCharacteristic_sortComparatorForCharacteristicDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "hmf_numberForKey:", CFSTR("characteristicInstanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("characteristicInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = -1;
  else
    v7 = v6 != 0;
  if (v5 && v6)
    v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (BOOL)isNotificationEnabled
{
  void *v2;
  BOOL v3;

  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSSet)notificationRegistrations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_notificationRegistrations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (NSDate)notificationEnabledTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_notificationEnabledTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (NSDate)lastKnownValueUpdateTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastKnownValueUpdateTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDService)service
{
  return (HMDService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setNotificationEnabledTime:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  NSDate **p_notificationEnabledTime;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_notificationEnabledTime = &self->_notificationEnabledTime;
  if (-[NSDate isEqualToDate:](*p_notificationEnabledTime, "isEqualToDate:", v6)
    || objc_msgSend(v8, "isEqualToDate:", v6))
  {
    objc_storeStrong((id *)p_notificationEnabledTime, a3);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)characteristicForHAPAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "linkType");

  -[HMDCharacteristic hapCharacteristicTupleWithIdentifier:linkType:](self, "hapCharacteristicTupleWithIdentifier:linkType:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hapCharacteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)configureWithCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *stateNumber;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HAPCharacteristicTuple *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCharacteristic lastKnownValue](self, "lastKnownValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic setPreviousValue:](self, "setPreviousValue:", v7);

    objc_msgSend(v21, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic setLastKnownValue:](self, "setLastKnownValue:", v8);

    objc_msgSend(v21, "valueUpdatedTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic setLastKnownValueUpdateTime:](self, "setLastKnownValueUpdateTime:", v9);

    objc_msgSend(v21, "notificationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic setNotificationContext:](self, "setNotificationContext:", v10);

  }
  v11 = objc_msgSend(v5, "linkType");
  if (v11 == 1)
  {
    stateNumber = self->_stateNumber;
    self->_stateNumber = 0;

  }
  objc_msgSend(v5, "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristic hapCharacteristicTupleWithIdentifier:linkType:](self, "hapCharacteristicTupleWithIdentifier:linkType:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E20];
  -[HMDCharacteristic hapCharacteristicTuples](self, "hapCharacteristicTuples");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v18, "removeObject:", v15);
  v19 = -[HAPCharacteristicTuple initWithHAPCharacteristic:serverIdentifier:linkType:]([HAPCharacteristicTuple alloc], "initWithHAPCharacteristic:serverIdentifier:linkType:", v21, v14, v11);
  objc_msgSend(v18, "addObject:", v19);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic setHapCharacteristicTuples:](self, "setHapCharacteristicTuples:", v20);

}

- (id)hapCharacteristicTupleWithIdentifier:(id)a3 linkType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDCharacteristic hapCharacteristicTuples](self, "hapCharacteristicTuples", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "linkType") == a4)
        {
          objc_msgSend(v12, "serverIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v6, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            v15 = v12;
            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (NSSet)hapCharacteristicTuples
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hapCharacteristicTuples;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)lastKnownValue
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastKnownValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHapCharacteristicTuples:(id)a3
{
  NSSet *v4;
  NSSet *hapCharacteristicTuples;

  v4 = (NSSet *)a3;
  os_unfair_lock_lock_with_options();
  hapCharacteristicTuples = self->_hapCharacteristicTuples;
  self->_hapCharacteristicTuples = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPreviousValue:(id)a3
{
  id v4;
  id previousValue;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  previousValue = self->_previousValue;
  self->_previousValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNotificationContext:(id)a3
{
  NSData *v4;
  NSData *notificationContext;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLastKnownValueUpdateTime:(id)a3
{
  NSDate *v4;
  NSDate *lastKnownValueUpdateTime;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  lastKnownValueUpdateTime = self->_lastKnownValueUpdateTime;
  self->_lastKnownValueUpdateTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLastKnownValue:(id)a3
{
  id v4;
  id lastKnownValue;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  lastKnownValue = self->_lastKnownValue;
  self->_lastKnownValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)clientIdentifiersWithNotificationsEnabled
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_95_74463);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4
{
  -[HMDCharacteristic setNotificationEnabled:forClientIdentifier:changeThreshold:removeLast:](self, "setNotificationEnabled:forClientIdentifier:changeThreshold:removeLast:", a3, a4, 0, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t43 != -1)
    dispatch_once(&logCategory__hmf_once_t43, &__block_literal_global_106_74525);
  return (id)logCategory__hmf_once_v44;
}

- (id)value
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  id lastKnownValue;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  NSData *v19;
  NSData *notificationContext;
  void *v21;
  id v22;
  os_unfair_lock_t lock;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_hapCharacteristicTuples;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v5)
  {

LABEL_15:
    v22 = self->_lastKnownValue;
    goto LABEL_16;
  }
  v6 = 0;
  v7 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "hapCharacteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueUpdatedTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "compare:", v10) == -1;

      if (v11)
      {
        v12 = v9;

        objc_msgSend(v12, "valueUpdatedTime");
        v13 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v13;
        v6 = v12;
      }

    }
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_15;
  lastKnownValue = self->_lastKnownValue;
  objc_msgSend(v6, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[HMDCharacteristic value:differentThan:](HMDCharacteristic, "value:differentThan:", lastKnownValue, v15);

  if (v16)
    objc_storeStrong(&self->_previousValue, self->_lastKnownValue);
  objc_msgSend(v6, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_lastKnownValue;
  self->_lastKnownValue = v17;

  objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, v3);
  objc_msgSend(v6, "notificationContext");
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  notificationContext = self->_notificationContext;
  self->_notificationContext = v19;

  objc_msgSend(v6, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "copy");

LABEL_16:
  os_unfair_lock_unlock(lock);
  return v22;
}

+ (BOOL)value:(id)a3 differentThan:(id)a4
{
  return HMFEqualObjects() ^ 1;
}

- (NSData)notificationContext
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_notificationContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_characteristicDictionaryWithAuthData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *authorizationData;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_characteristicInstanceID, CFSTR("characteristicInstanceID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_characteristicType, CFSTR("characteristicType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_characteristicProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("characteristicProperties"));

  -[HMDCharacteristic metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("characteristicMetadata"));

  if (v3)
    authorizationData = self->_authorizationData;
  else
    authorizationData = 0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", authorizationData, CFSTR("kCharacteristicAuthorizationDataCodingKey"));
  return v5;
}

- (HMDCharacteristicMetadata)metadata
{
  os_unfair_lock_s *p_lock;
  HMDCharacteristicMetadata *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_metadata;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (id)getCharacteristicDictionary
{
  return -[HMDCharacteristic _characteristicDictionaryWithAuthData:](self, "_characteristicDictionaryWithAuthData:", 1);
}

+ (id)sortComparatorForCharacteristicDictionary
{
  return &__block_literal_global_74528;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HMDCharacteristic service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCharacteristic characteristicType](self, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic characteristicTypeDescription](self, "characteristicTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic instanceID](self, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Type Prefix: %@/%@, SRV_IID: %@, CHAR_IID: %@"), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSNumber)stateNumber
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStateNumber:(id)a3
{
  id v5;
  char v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    v6 = -[HMDCharacteristic properties](self, "properties");
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_stateNumber, a3);
      os_unfair_lock_unlock(&self->_lock);
      v5 = v7;
    }
  }

}

- (BOOL)supportsNotification
{
  return self->_characteristicProperties & 1;
}

- (BOOL)isNonHomeNotificationsEnabled
{
  void *v2;
  char v3;

  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_90);

  return v3;
}

- (BOOL)isClientNotificationEnabled
{
  void *v2;
  char v3;

  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_89_74467);

  return v3;
}

- (NSString)contextID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCharacteristic service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic instanceID](self, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSUUID)contextSPIUniqueIdentifier
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
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[HMDProcessInfo privateClientIdentifierSalt](HMDProcessInfo, "privateClientIdentifierSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3A28];
  -[HMDCharacteristic service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextSPIUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v6, v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v11;
}

- (NSDictionary)bulletinContext
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[12];
  _QWORD v37[14];

  v37[12] = *MEMORY[0x1E0C80C00];
  -[HMDCharacteristic service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v6, v8, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = CFSTR("home");
  objc_msgSend(v5, "contextID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  v36[1] = CFSTR("accessory");
  objc_msgSend(v4, "contextID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v32;
  v36[2] = CFSTR("service");
  objc_msgSend(v3, "contextID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v31;
  v36[3] = CFSTR("characteristic");
  -[HMDCharacteristic contextID](self, "contextID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v30;
  v36[4] = CFSTR("serviceType");
  objc_msgSend(v3, "type");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v29;
  v36[5] = CFSTR("characteristicType");
  -[HMDCharacteristic type](self, "type");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v28;
  v36[6] = *MEMORY[0x1E0CB8388];
  objc_msgSend(v5, "contextSPIUniqueIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v25;
  v36[7] = *MEMORY[0x1E0CB8378];
  v34 = v4;
  objc_msgSend(v4, "contextSPIUniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v23;
  v36[8] = *MEMORY[0x1E0CB83A0];
  v35 = v3;
  objc_msgSend(v3, "contextSPIUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v11;
  v36[9] = *MEMORY[0x1E0CB8380];
  -[HMDCharacteristic contextSPIUniqueIdentifier](self, "contextSPIUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v13;
  v36[10] = *MEMORY[0x1E0CB8390];
  objc_msgSend(v5, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v14;
  v36[11] = *MEMORY[0x1E0CB8398];
  objc_msgSend(v27, "composedName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[11] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  -[HMDCharacteristic stateNumber](self, "stateNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDCharacteristic stateNumber](self, "stateNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("stateNumber"));

  }
  -[HMDCharacteristic value](self, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("characteristicValue"));

  -[HMDCharacteristic lastKnownValueUpdateTime](self, "lastKnownValueUpdateTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("characteristicValueUpdatedTime"));

  return (NSDictionary *)v17;
}

- (HMDCharacteristic)init
{
  HMDCharacteristic *v2;
  uint64_t v3;
  NSSet *hapCharacteristicTuples;
  uint64_t v5;
  NSDate *notificationEnabledTime;
  uint64_t v7;
  NSMutableSet *notificationRegistrations;
  uint64_t v9;
  NSDate *lastKnownValueUpdateTime;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristic;
  v2 = -[HMDCharacteristic init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    hapCharacteristicTuples = v2->_hapCharacteristicTuples;
    v2->_hapCharacteristicTuples = (NSSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = objc_claimAutoreleasedReturnValue();
    notificationEnabledTime = v2->_notificationEnabledTime;
    v2->_notificationEnabledTime = (NSDate *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    notificationRegistrations = v2->_notificationRegistrations;
    v2->_notificationRegistrations = (NSMutableSet *)v7;

    v2->_notificationRegisteredWithRemoteGateway = 0;
    v2->_broadcastNotificationEnabled = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = objc_claimAutoreleasedReturnValue();
    lastKnownValueUpdateTime = v2->_lastKnownValueUpdateTime;
    v2->_lastKnownValueUpdateTime = (NSDate *)v9;

  }
  return v2;
}

- (HMDCharacteristic)initWithCharacteristic:(id)a3 service:(id)a4 accessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDCharacteristic *v11;
  void *v12;
  uint64_t v13;
  NSNumber *stateNumber;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMDCharacteristic init](self, "init");
  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("characteristic"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "properties") & 1) != 0)
    {
      objc_msgSend(v12, "stateNumber");
      v13 = objc_claimAutoreleasedReturnValue();
      stateNumber = v11->_stateNumber;
      v11->_stateNumber = (NSNumber *)v13;

    }
    objc_storeWeak((id *)&v11->_accessory, v10);
    objc_storeWeak((id *)&v11->_service, v9);
    -[HMDCharacteristic updateWithDictionary:](v11, "updateWithDictionary:", v8);

  }
  return v11;
}

- (void)setNotificationRegisteredWithRemoteGateway:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_notificationRegisteredWithRemoteGateway != v3)
    self->_notificationRegisteredWithRemoteGateway = v3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)notificationRegisteredWithRemoteGateway
{
  HMDCharacteristic *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_notificationRegisteredWithRemoteGateway;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)previousValue
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_previousValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)characteristicTypeDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCharacteristic characteristicType](self, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  localizationKeyForCharacteristicType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)spiClientIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[HMDCharacteristic service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spiClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCharacteristic instanceID](self, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  spiClientIdentifierForUUIDAndSalts(v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v9;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v35;
  _QWORD v36[4];
  id v37;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDCharacteristic characteristicProperties](self, "characteristicProperties");
  v6 = v5;
  if ((v5 & 6) == 6)
  {
    v7 = CFSTR("RW");
LABEL_7:
    objc_msgSend(v4, "appendString:", v7);
    goto LABEL_8;
  }
  if ((v5 & 2) != 0)
    v7 = CFSTR("RO");
  else
    v7 = CFSTR("WO");
  if ((v5 & 6) != 0)
    goto LABEL_7;
LABEL_8:
  if ((v6 & 0x40) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("H"));
    if ((v6 & 1) == 0)
    {
LABEL_10:
      if ((v6 & 8) == 0)
        goto LABEL_11;
      goto LABEL_23;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "appendString:", CFSTR("+E"));
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_23:
  objc_msgSend(v4, "appendString:", CFSTR("+B"));
  if ((v6 & 0x100) != 0)
LABEL_12:
    objc_msgSend(v4, "appendString:", CFSTR("+NC"));
LABEL_13:
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "requiresDeviceUnlock:forService:", v9, v11);

  if (v12)
    objc_msgSend(v4, "appendString:", CFSTR("+L"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDCharacteristic isNotificationEnabled](self, "isNotificationEnabled"))
  {
    -[HMDCharacteristic notificationEnabledTime](self, "notificationEnabledTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_localTimeDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR("YES(%@)"), v15);

    if (-[HMDCharacteristic notificationRegisteredWithRemoteGateway](self, "notificationRegisteredWithRemoteGateway"))
      objc_msgSend(v13, "appendFormat:", CFSTR("+RGW"));
    if (-[HMDCharacteristic broadcastNotificationEnabled](self, "broadcastNotificationEnabled"))
      objc_msgSend(v13, "appendFormat:", CFSTR("+B"));
    -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __30__HMDCharacteristic_dumpState__block_invoke;
    v36[3] = &unk_1E89AE9F0;
    v37 = v13;
    objc_msgSend(v16, "na_each:", v36);

  }
  else
  {
    objc_msgSend(v13, "appendString:", CFSTR("NO"));
  }
  -[HMDCharacteristic value](self, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0x1E0CB3000uLL;
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[HMDCharacteristic value](self, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic lastKnownValueUpdateTime](self, "lastKnownValueUpdateTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hmf_localTimeDescription");
    v35 = v6;
    v22 = v13;
    v23 = v8;
    v24 = v4;
    v25 = v3;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic previousValue](self, "previousValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@(%@), previousValue: %@"), v20, v26, v27);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v3 = v25;
    v4 = v24;
    v8 = v23;
    v13 = v22;
    v6 = v35;

    v18 = 0x1E0CB3000;
  }
  else
  {
    v28 = CFSTR("<nil>");
  }
  v29 = *(void **)(v18 + 2368);
  -[HMDCharacteristic shortDescription](self, "shortDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@, properties: %@ (0x%tx), value: %@, notification: %@"), v30, v4, v6, v28, v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D27F80]);

  -[HMDCharacteristic metadata](self, "metadata");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dumpState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D27F10]);

  return v3;
}

- (NSString)serializedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDCharacteristic service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "serializedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@/%@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *characteristicType;
  void *v12;
  uint64_t v13;
  int64_t characteristicProperties;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  HMDCharacteristicMetadata *v20;
  HMDCharacteristicMetadata *metadata;
  void *v22;
  void *v23;
  NSData **p_authorizationData;
  void *v25;
  os_unfair_lock_t lock;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  lock = &self->_lock;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characteristicInstanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", self->_characteristicInstanceID) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_characteristicInstanceID, v6);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characteristicType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isEqual:", self->_characteristicType) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    characteristicType = self->_characteristicType;
    self->_characteristicType = v10;

    v7 = 1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characteristicProperties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  characteristicProperties = self->_characteristicProperties;
  -[HMDCharacteristic accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "findServiceWithServiceType:", CFSTR("00000701-0000-1000-8000-0026BB765291"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = characteristicProperties & 0x100 | v13;

  if (v16)
    v17 |= self->_characteristicProperties & 0x80;
  if (v17 && v17 != self->_characteristicProperties)
  {
    self->_characteristicProperties = v17;
    v7 = 1;
  }
  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("characteristicMetadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[HMDCharacteristicMetadata characteristicMetadataWithDictionary:](HMDCharacteristicMetadata, "characteristicMetadataWithDictionary:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && !-[HMDCharacteristicMetadata isEqual:](self->_metadata, "isEqual:", v19))
    {
      +[HMFObjectCacheHMDCharacteristicMetadata cachedInstanceForCharacteristicMetadata:](HMFObjectCacheHMDCharacteristicMetadata, "cachedInstanceForCharacteristicMetadata:", v19);
      v20 = (HMDCharacteristicMetadata *)objc_claimAutoreleasedReturnValue();
      metadata = self->_metadata;
      self->_metadata = v20;

      v7 = 1;
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCharacteristicAuthorizationDataCodingKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    p_authorizationData = &self->_authorizationData;
    if ((objc_msgSend(v22, "isEqual:", *p_authorizationData) & 1) == 0)
    {
      objc_storeStrong((id *)p_authorizationData, v23);
      objc_msgSend(v15, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setWatchSkipVersionCheck:", 1);

      v7 = 1;
    }
  }

  os_unfair_lock_unlock(lock);
  return v7;
}

- (void)unconfigure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDCharacteristic hapCharacteristicTuples](self, "hapCharacteristicTuples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    -[HMDCharacteristic hapCharacteristicTuples](self, "hapCharacteristicTuples");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeObject:", v8);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic setHapCharacteristicTuples:](self, "setHapCharacteristicTuples:", v7);

  }
}

- (void)unconfigureForServerIdentifier:(id)a3 linkType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDCharacteristic hapCharacteristicTupleWithIdentifier:linkType:](self, "hapCharacteristicTupleWithIdentifier:linkType:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    -[HMDCharacteristic hapCharacteristicTuples](self, "hapCharacteristicTuples");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObject:", v9);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristic setHapCharacteristicTuples:](self, "setHapCharacteristicTuples:", v8);

  }
}

- (void)updateValue:(id)a3 updatedTime:(id)a4 stateNumber:(id)a5 notificationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  HMDCharacteristic *v18;
  NSObject *v19;
  id v20;
  id lastKnownValue;
  NSDate *lastKnownValueUpdateTime;
  id WeakRetained;
  void *v24;
  NSSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  NSDate *v32;
  NSDate *v33;
  NSDate *v34;
  id v35;
  id v36;
  id obj;
  id obja;
  os_unfair_lock_t lock;
  id *location;
  id *locationa;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id *v59;
  __int16 v60;
  NSDate *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v10 = a3;
  v11 = a4;
  v35 = a5;
  v12 = a5;
  v36 = a6;
  v13 = a6;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  location = (id *)&self->_stateNumber;
  v42 = v12;
  v14 = -[NSNumber isEqual:](self->_stateNumber, "isEqual:", v12) ^ 1;
  if (!v11)
    LOBYTE(v14) = 1;
  v15 = (v14 & 1) == 0
     && -[NSDate compare:](self->_lastKnownValueUpdateTime, "compare:", v11, v35, a6, obj, lock) == NSOrderedDescending;
  if (v42)
  {
    v16 = HAPCompareStateNumberWithRollover() == 1 || v15;
    if (v16 == 1)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        obja = v17;
        HMFGetLogIdentifier();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        lastKnownValue = v18->_lastKnownValue;
        locationa = (id *)*location;
        lastKnownValueUpdateTime = v18->_lastKnownValueUpdateTime;
        WeakRetained = objc_loadWeakRetained((id *)&v18->_accessory);
        objc_msgSend(WeakRetained, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v49 = v20;
        v50 = 2112;
        v51 = v10;
        v52 = 2112;
        v53 = v42;
        v54 = 2112;
        v55 = v11;
        v56 = 2112;
        v57 = lastKnownValue;
        v58 = 2112;
        v59 = locationa;
        v60 = 2112;
        v61 = lastKnownValueUpdateTime;
        v62 = 2112;
        v63 = v24;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring stale characteristic update value: %@, state number: %@, updated time: %@ Current value: %@ state number: %@, updated time: %@, accessory: %@", buf, 0x52u);

        v17 = obja;
      }

      objc_autoreleasePoolPop(v17);
      goto LABEL_34;
    }
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v25 = self->_hapCharacteristicTuples;
  v26 = -[NSSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v29, "hapCharacteristic", v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setValue:", v10);

        objc_msgSend(v29, "hapCharacteristic");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setNotificationContext:", v13);

      }
      v26 = -[NSSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v26);
  }

  if (v11
    && -[NSDate compare:](self->_lastKnownValueUpdateTime, "compare:", v11) == NSOrderedSame
    && objc_msgSend(self->_lastKnownValue, "isEqual:", v10))
  {
    objc_storeStrong(&self->_lastKnownValue, obj);
  }
  else
  {
    objc_storeStrong(&self->_previousValue, self->_lastKnownValue);
    objc_storeStrong(&self->_lastKnownValue, obj);
    if (!v11)
    {
      if (v10)
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
      else
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v34 = (NSDate *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, v34);
      v33 = v34;
      goto LABEL_31;
    }
  }
  v32 = (NSDate *)v11;
  v33 = self->_lastKnownValueUpdateTime;
  self->_lastKnownValueUpdateTime = v32;
LABEL_31:

  if (v42)
    objc_storeStrong(location, v35);
  objc_storeStrong((id *)&self->_notificationContext, v36);
LABEL_34:
  os_unfair_lock_unlock(lock);

}

- (void)getLastKnownValueUpdateTime:(id *)a3 stateNumber:(id *)a4 notificationContext:(id *)a5
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a3)
    *a3 = objc_retainAutorelease(self->_lastKnownValueUpdateTime);
  if (a4)
    *a4 = objc_retainAutorelease(self->_stateNumber);
  if (a5)
    *a5 = objc_retainAutorelease(self->_notificationContext);
  os_unfair_lock_unlock(p_lock);
}

- (void)updateLastKnownValue
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSDate *lastKnownValueUpdateTime;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id lastKnownValue;
  void *v14;
  NSDate *v15;
  NSDate *v16;
  void *v17;
  NSData *v18;
  NSData *notificationContext;
  os_unfair_lock_t lock;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_hapCharacteristicTuples;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        lastKnownValueUpdateTime = self->_lastKnownValueUpdateTime;
        objc_msgSend(v7, "hapCharacteristic");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueUpdatedTime");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(lastKnownValueUpdateTime) = -[NSDate compare:](lastKnownValueUpdateTime, "compare:", v10) == NSOrderedAscending;

        if ((_DWORD)lastKnownValueUpdateTime)
        {
          objc_storeStrong(&self->_previousValue, self->_lastKnownValue);
          objc_msgSend(v7, "hapCharacteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          lastKnownValue = self->_lastKnownValue;
          self->_lastKnownValue = v12;

          objc_msgSend(v7, "hapCharacteristic");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "valueUpdatedTime");
          v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v16 = self->_lastKnownValueUpdateTime;
          self->_lastKnownValueUpdateTime = v15;

          objc_msgSend(v7, "hapCharacteristic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "notificationContext");
          v18 = (NSData *)objc_claimAutoreleasedReturnValue();
          notificationContext = self->_notificationContext;
          self->_notificationContext = v18;

        }
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)shouldUpdateValueFromHAPCharacteristic:(id)a3
{
  id v4;
  id v5;
  NSDate *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDCharacteristic *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  HMDCharacteristic *v21;
  BOOL v22;
  void *v23;
  int v24;
  HMDCharacteristic *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = self->_lastKnownValue;
  v6 = self->_lastKnownValueUpdateTime;
  os_unfair_lock_unlock(&self->_lock);
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HMDCharacteristic value:differentThan:](HMDCharacteristic, "value:differentThan:", v8, v5);

  objc_msgSend(v4, "valueUpdatedTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSDate compare:](v6, "compare:", v10);

  if (v11 == -1)
  {
    if (v9)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v19;
        v20 = "%{public}@Declaring the value as different because update time is earlier than hap update time";
        goto LABEL_12;
      }
LABEL_13:

      objc_autoreleasePoolPop(v16);
      v22 = 1;
      goto LABEL_14;
    }
    -[HMDCharacteristic type](self, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v7, "shouldNotCacheCharacteristicOfType:", v23);

    if (v24)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v19;
        v20 = "%{public}@Declaring the value as different because characteristic generates notification on configuration";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  -[HMDCharacteristic type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "generateNotificationOnConfigurationForCharacteristicType:serviceType:", v12, v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v19;
      v20 = "%{public}@Declaring the value as different because Characteristic does not support caching";
LABEL_12:
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v22 = 0;
LABEL_14:

  return v22;
}

- (void)setAuthorizationData:(id)a3
{
  NSData *v4;
  NSData *authorizationData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  authorizationData = self->_authorizationData;
  self->_authorizationData = v4;

}

- (id)validateValueForWrite:(id)a3 outValue:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if ((-[HMDCharacteristic characteristicProperties](self, "characteristicProperties") & 4) != 0)
    -[HMDCharacteristic validateValue:outValue:](self, "validateValue:outValue:", v6, a4);
  else
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)validateValueForNotify:(id)a3 outValue:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if ((-[HMDCharacteristic characteristicProperties](self, "characteristicProperties") & 1) != 0)
    -[HMDCharacteristic validateValue:outValue:](self, "validateValue:outValue:", v6, a4);
  else
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)validateValue:(id)a3 outValue:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  if ((isAllowedCharType() & 1) != 0)
  {
    -[HMDCharacteristic hapCharacteristicTuples](self, "hapCharacteristicTuples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "hapCharacteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "validateValue:outValue:", v6, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v10;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)supportsRead
{
  return (LOBYTE(self->_characteristicProperties) >> 1) & 1;
}

- (BOOL)supportsWrite
{
  return (LOBYTE(self->_characteristicProperties) >> 2) & 1;
}

- (BOOL)isNonClientNotificationEnabled
{
  void *v2;
  char v3;

  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_91_74466);

  return v3;
}

- (BOOL)isNotificationEnabledForClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__HMDCharacteristic_isNotificationEnabledForClientIdentifier___block_invoke;
    v8[3] = &unk_1E89AEAB8;
    v9 = v4;
    v6 = objc_msgSend(v5, "na_any:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)localClientIdentifiersWithNotificationsEnabled
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HMDCharacteristic_localClientIdentifiersWithNotificationsEnabled__block_invoke;
  v9[3] = &unk_1E89AEAE0;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  return v7;
}

- (BOOL)isNotificationEnabledForClientIdentifierPrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HMDCharacteristic_isNotificationEnabledForClientIdentifierPrefix___block_invoke;
  v9[3] = &unk_1E89AEAB8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (NSNumber)changeThresholdForEnabledNotifications
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "updateThreshold");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {

          goto LABEL_15;
        }
        objc_msgSend(v8, "updateThreshold");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v5)
        {
          v12 = objc_msgSend(v5, "compare:", v10);

          if (v12 == 1)
          {
            objc_msgSend(v8, "updateThreshold");
            v13 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v13;
          }
        }
        else
        {
          v5 = (void *)v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
LABEL_15:
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)changeThresholdForNonHomeClientEnabledNotifications
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "clientID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.HomeKitDaemon.homeNotifications"));

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v8, "updateThreshold");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {

            goto LABEL_16;
          }
          objc_msgSend(v8, "updateThreshold");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v5)
          {
            v14 = objc_msgSend(v5, "compare:", v12);

            if (v14 == 1)
            {
              objc_msgSend(v8, "updateThreshold");
              v15 = objc_claimAutoreleasedReturnValue();

              v5 = (void *)v15;
            }
          }
          else
          {
            v5 = (void *)v12;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
LABEL_16:
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (BOOL)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4 changeThreshold:(id)a5 removeLast:(BOOL)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  HMDCharacteristicThresholdRegistration *v12;
  os_unfair_lock_s *p_lock;
  uint64_t v14;
  void *v15;
  HMDCharacteristic *v16;
  NSObject *v17;
  id v18;
  float v19;
  BOOL v20;
  int v21;
  HMDCharacteristic *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSDate *notificationEnabledTime;
  void *context;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v8 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v12 = -[HMDCharacteristicThresholdRegistration initWithClientID:updateThreshold:]([HMDCharacteristicThresholdRegistration alloc], "initWithClientID:updateThreshold:", v10, v11);
    p_lock = &self->_lock;
    v14 = os_unfair_lock_lock_with_options();
    if (v8)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0](v14);
      v16 = self;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        *(_DWORD *)buf = 138543874;
        v30 = v18;
        v31 = 2112;
        v32 = v10;
        v33 = 2048;
        v34 = v19;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Adding notification registration for client identifier: %@ threshold : %f", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      -[NSMutableSet addObject:](v16->_notificationRegistrations, "addObject:", v12);
      v20 = 0;
      goto LABEL_16;
    }
    if (-[NSMutableSet count](self->_notificationRegistrations, "count") == 1)
    {
      v21 = -[NSMutableSet containsObject:](self->_notificationRegistrations, "containsObject:", v12);
      v20 = v21;
      if (!a6 && v21 == 1)
      {
LABEL_16:
        os_unfair_lock_unlock(p_lock);

        goto LABEL_17;
      }
    }
    else
    {
      v20 = 0;
    }
    context = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v24;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Removing notification registration for client identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(context);
    -[NSMutableSet removeObject:](self->_notificationRegistrations, "removeObject:", v12);
    if (!-[NSMutableSet count](self->_notificationRegistrations, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v25 = objc_claimAutoreleasedReturnValue();
      notificationEnabledTime = v22->_notificationEnabledTime;
      v22->_notificationEnabledTime = (NSDate *)v25;

    }
    goto LABEL_16;
  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (void)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4 changeThreshold:(id)a5
{
  -[HMDCharacteristic setNotificationEnabled:forClientIdentifier:changeThreshold:removeLast:](self, "setNotificationEnabled:forClientIdentifier:changeThreshold:removeLast:", a3, a4, a5, 1);
}

- (BOOL)deregisterNotificationIfNotLastForClientIdentifier:(id)a3
{
  return -[HMDCharacteristic setNotificationEnabled:forClientIdentifier:changeThreshold:removeLast:](self, "setNotificationEnabled:forClientIdentifier:changeThreshold:removeLast:", 0, a3, 0, 0);
}

- (BOOL)deregisterNotificationForClientIdentifier:(id)a3
{
  void *v4;
  BOOL v5;

  -[HMDCharacteristic setNotificationEnabled:forClientIdentifier:](self, "setNotificationEnabled:forClientIdentifier:", 0, a3);
  -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (void)updateService:(id)a3 accessory:(id)a4
{
  HMDHAPAccessory **p_accessory;
  id obj;

  p_accessory = &self->_accessory;
  obj = a3;
  objc_storeWeak((id *)p_accessory, a4);
  objc_storeWeak((id *)&self->_service, obj);

}

- (BOOL)shouldIgnoreCacheValueForRead
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  unint64_t v16;

  -[HMDCharacteristic type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("00000143-0000-1000-8000-0026BB765291")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("00000144-0000-1000-8000-0026BB765291")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("0000024B-0000-1000-8000-0026BB765291")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "currentTargetStateCharacteristicTypeMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HMDCharacteristic service](self, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "findCharacteristicWithType:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9
        && (objc_msgSend(v9, "lastKnownValue"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HMDCharacteristic value](self, "value"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = HMFEqualObjects(),
            v11,
            v10,
            (v12 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristic lastKnownValueUpdateTime](self, "lastKnownValueUpdateTime");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v16 = (unint64_t)v15;

        if (v16 <= 0xF)
          v4 = 0;
        else
          v4 = -1;
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4 & 1;
}

- (BOOL)supportsNotificationContext
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v8;
  HMDCharacteristic *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  HMDCharacteristic *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((self->_characteristicProperties & 0x100) != 0)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Notification context is supported for characteristic:%@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    return 1;
  }
  else
  {
    -[HMDCharacteristic type](self, "type");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D16048]);

    if (v4)
    {
      -[HMDCharacteristic service](self, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "findCharacteristicWithType:", *MEMORY[0x1E0D15F20]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v5) = objc_msgSend(v6, "supportsNotificationContext");
      return (char)v5;
    }
    else
    {
      return 0;
    }
  }
}

- (id)contextDataForWriteRequestWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDCharacteristic *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDCharacteristic supportsNotificationContext](self, "supportsNotificationContext"))
  {
    v5 = objc_alloc(MEMORY[0x1E0D16418]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v4);
    v7 = (void *)objc_msgSend(v5, "initWithContextIdentifier:", v6);

    v18 = 0;
    objc_msgSend(v7, "serializeWithError:", &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v20 = v14;
        v21 = 2112;
        v22 = v7;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v4;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode context data:%@ with error:%@ identifier:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Context data:%@ for write request with identifier:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      v15 = v8;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (HMDCharacteristic)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDCharacteristic *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = (HMDCharacteristic *)-[HMDCharacteristic _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  HMDCharacteristic *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *characteristicType;
  uint64_t v11;
  NSNumber *characteristicInstanceID;
  void *v13;
  uint64_t v14;
  HMDCharacteristicMetadata *metadata;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSMutableSet *notificationRegistrations;
  uint64_t v24;
  NSData *authorizationData;
  void *v26;
  uint64_t v27;
  id lastKnownValue;
  uint64_t v29;
  NSNumber *stateNumber;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDCharacteristic initWithCharacteristic:service:accessory:](self, "initWithCharacteristic:service:accessory:", 0, 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_accessory, v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_service, v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    characteristicType = v5->_characteristicType;
    v5->_characteristicType = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicInstanceID"));
    v11 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceID = v5->_characteristicInstanceID;
    v5->_characteristicInstanceID = (NSNumber *)v11;

    v5->_characteristicProperties = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("characteristicProperties"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicMetadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFObjectCacheHMDCharacteristicMetadata cachedInstanceForCharacteristicMetadata:](HMFObjectCacheHMDCharacteristicMetadata, "cachedInstanceForCharacteristicMetadata:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (HMDCharacteristicMetadata *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("characteristicNotificationRegistrations"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "na_map:", &__block_literal_global_102);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "mutableCopy");
      notificationRegistrations = v5->_notificationRegistrations;
      v5->_notificationRegistrations = (NSMutableSet *)v22;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kCharacteristicAuthorizationDataCodingKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCharacteristicAuthorizationDataCodingKey"));
      v24 = objc_claimAutoreleasedReturnValue();
      authorizationData = v5->_authorizationData;
      v5->_authorizationData = (NSData *)v24;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("characteristicValue")))
    {
      allowedCharValueTypes();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("characteristicValue"));
      v27 = objc_claimAutoreleasedReturnValue();
      lastKnownValue = v5->_lastKnownValue;
      v5->_lastKnownValue = (id)v27;

      objc_storeStrong(&v5->_previousValue, v5->_lastKnownValue);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.stateNumber"))
      && (v5->_characteristicProperties & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.stateNumber"));
      v29 = objc_claimAutoreleasedReturnValue();
      stateNumber = v5->_stateNumber;
      v5->_stateNumber = (NSNumber *)v29;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("characteristicBroadcastNotificationEnabled")))
      v5->_broadcastNotificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("characteristicBroadcastNotificationEnabled"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  -[HMDCharacteristic _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSUInteger v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v4 = objc_msgSend(v36, "hmd_isForXPCTransport");
  v5 = objc_msgSend(v36, "hmd_isForXPCTransportEntitledForSPIAccess");
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic accessory](self, "accessory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (objc_msgSend(v36, "hmd_isForXPCTransport"))
  {
    accessoryToEncodeForXPCTransportForAccessory(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v36, "encodeConditionalObject:forKey:", v9, CFSTR("accessory"));
  objc_msgSend(v36, "encodeConditionalObject:forKey:", v7, CFSTR("service"));
  -[HMDCharacteristic characteristicInstanceID](self, "characteristicInstanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v10, CFSTR("characteristicInstanceID"));

  -[HMDCharacteristic characteristicType](self, "characteristicType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v11, CFSTR("characteristicType"));

  v12 = -[HMDCharacteristic characteristicProperties](self, "characteristicProperties");
  v13 = v12;
  if (v4)
  {
    if (v5)
      v14 = v12;
    else
      v14 = v12 & 0x47;
    -[HMDCharacteristic characteristicType](self, "characteristicType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "shouldNotCacheCharacteristicOfType:", v15);

    if (v16)
      v13 = v14 & 0xFFFFFFFFFFFFFFF9;
    else
      v13 = v14;
  }
  objc_msgSend(v36, "encodeInt32:forKey:", v13, CFSTR("characteristicProperties"));
  if ((objc_msgSend(v36, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    -[HMDCharacteristic metadata](self, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "encodeObject:forKey:", v17, CFSTR("characteristicMetadata"));

    v18 = objc_msgSend(v36, "hmd_isForLocalStore");
    v19 = -[NSData length](self->_authorizationData, "length");
    if (!v19 || (v18 & 1) != 0)
    {
      if (!v19)
        goto LABEL_17;
    }
    else if ((objc_msgSend(v36, "hmd_isForRemoteTransportOnSameAccount") & 1) == 0)
    {
LABEL_17:
      if (!v18)
        goto LABEL_28;
      -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "na_map:", &__block_literal_global_104_74442);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count"))
        objc_msgSend(v36, "encodeObject:forKey:", v21, CFSTR("characteristicNotificationRegistrations"));
      -[HMDCharacteristic value](self, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 1) != 0)
      {
        -[HMDCharacteristic type](self, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v6, "isStandardCharacteristicType:", v23)
          || !v22
          || !isAllowedCharType())
        {
          goto LABEL_26;
        }
        -[HMDCharacteristic stateNumber](self, "stateNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[HMDCharacteristic value](self, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "encodeObject:forKey:", v25, CFSTR("characteristicValue"));

          -[HMDCharacteristic stateNumber](self, "stateNumber");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "encodeObject:forKey:", v23, CFSTR("HM.stateNumber"));
LABEL_26:

        }
      }
      objc_msgSend(v36, "encodeBool:forKey:", -[HMDCharacteristic broadcastNotificationEnabled](self, "broadcastNotificationEnabled"), CFSTR("characteristicBroadcastNotificationEnabled"));

LABEL_28:
      if (objc_msgSend(v36, "hmd_isForXPCTransport"))
      {
        +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristic type](self, "type");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "type");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v26, "requiresDeviceUnlock:forService:", v27, v28);

        -[HMDCharacteristic notificationRegistrations](self, "notificationRegistrations");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count") != 0;

        objc_msgSend(v36, "encodeBool:forKey:", v31, CFSTR("characteristicNotificationEnabled"));
        -[HMDCharacteristic value](self, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32
          && isAllowedCharType()
          && ((isAppleTV() & v29) != 1 || objc_msgSend(v36, "hmd_isForXPCTransportEntitledForSPIAccess")))
        {
          objc_msgSend(v36, "encodeObject:forKey:", v32, CFSTR("characteristicValue"));
        }
        if (objc_msgSend(v36, "hmd_isForXPCTransportEntitledForSPIAccess"))
        {
          if (v29)
            objc_msgSend(v36, "encodeBool:forKey:", 1, CFSTR("HM.requiresDeviceUnlock"));
          -[HMDCharacteristic authorizationData](self, "authorizationData");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "encodeBool:forKey:", objc_msgSend(v33, "length") != 0, CFSTR("HM.characteristicAuthDataPresent"));

          -[HMDCharacteristic lastKnownValueUpdateTime](self, "lastKnownValueUpdateTime");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "encodeObject:forKey:", v34, CFSTR("characteristicValueUpdateTime"));

          -[HMDCharacteristic notificationEnabledTime](self, "notificationEnabledTime");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "encodeObject:forKey:", v35, CFSTR("characteristicNotificationEnableTime"));

        }
      }
      goto LABEL_39;
    }
    objc_msgSend(v36, "encodeObject:forKey:", self->_authorizationData, CFSTR("kCharacteristicAuthorizationDataCodingKey"));
    goto LABEL_17;
  }
LABEL_39:

}

- (id)logIdentifier
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCharacteristic accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic instanceID](self, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@/%@"), v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[13];

  v48[11] = *MEMORY[0x1E0C80C00];
  -[HMDCharacteristic accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCharacteristic type](self, "type");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristic characteristicTypeDescription](self, "characteristicTypeDescription");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v46, v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Type Prefix"), v44);
  v48[0] = v42;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v43 = v3;
  objc_msgSend(v3, "uuid");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v41, v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Accessory UUID"), v39);
  v48[1] = v38;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic service](self, "service");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "instanceID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Service ID"), v36);
  v48[2] = v35;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic instanceID](self, "instanceID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Instance ID"), v34);
  v48[3] = v33;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%tx"), -[HMDCharacteristic properties](self, "properties"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Properties"), v32);
  v48[4] = v31;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic broadcastNotificationEnabled](self, "broadcastNotificationEnabled");
  HMFEnabledStatusToString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Broadcast Notifying"), v30);
  v48[5] = v29;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic lastKnownValue](self, "lastKnownValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Last Known Value"), v13);
  v48[6] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic lastKnownValueUpdateTime](self, "lastKnownValueUpdateTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Last Known Value Update Time"), v16);
  v48[7] = v17;
  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic previousValue](self, "previousValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Previous Value"), v19);
  v48[8] = v20;
  v21 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic stateNumber](self, "stateNumber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("State"), v22);
  v48[9] = v23;
  v24 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristic notificationContext](self, "notificationContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("Notification Context"), v25);
  v48[10] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 11);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)broadcastNotificationEnabled
{
  return self->_broadcastNotificationEnabled;
}

- (void)setBroadcastNotificationEnabled:(BOOL)a3
{
  self->_broadcastNotificationEnabled = a3;
}

- (void)setCharacteristicType:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicType, a3);
}

- (void)setCharacteristicInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicInstanceID, a3);
}

- (void)setCharacteristicProperties:(int64_t)a3
{
  self->_characteristicProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_notificationEnabledTime, 0);
  objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, 0);
  objc_storeStrong(&self->_lastKnownValue, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicTuples, 0);
  objc_storeStrong((id *)&self->_notificationRegistrations, 0);
}

id __38__HMDCharacteristic__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.HomeKitDaemon")))
  {

  }
  else
  {
    objc_msgSend(v2, "clientID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.HomeKit.client."));

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v2, "clientID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

HMDCharacteristicThresholdRegistration *__36__HMDCharacteristic__initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  HMDCharacteristicThresholdRegistration *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
    v5 = -[HMDCharacteristicThresholdRegistration initWithClientID:updateThreshold:]([HMDCharacteristicThresholdRegistration alloc], "initWithClientID:updateThreshold:", v4, 0);
  else
    v5 = 0;

  return v5;
}

uint64_t __68__HMDCharacteristic_isNotificationEnabledForClientIdentifierPrefix___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __62__HMDCharacteristic_clientIdentifiersWithNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientID");
}

void __67__HMDCharacteristic_localClientIdentifiersWithNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.HomeKitDaemon.Local"));

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "clientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

uint64_t __62__HMDCharacteristic_isNotificationEnabledForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __51__HMDCharacteristic_isNonClientNotificationEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "clientID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.HomeKit.client.")) ^ 1;

  return v3;
}

uint64_t __50__HMDCharacteristic_isNonHomeNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.HomeKitDaemon")))
  {
    objc_msgSend(v2, "clientID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.HomeKitDaemon.homeNotifications")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __48__HMDCharacteristic_isClientNotificationEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "clientID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.HomeKit.client."));

  return v3;
}

void __30__HMDCharacteristic_dumpState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "clientID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@"), v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)currentTargetStateCharacteristicTypeMap
{
  if (currentTargetStateCharacteristicTypeMap_onceToken != -1)
    dispatch_once(&currentTargetStateCharacteristicTypeMap_onceToken, &__block_literal_global_138_74523);
  return (id)currentTargetStateCharacteristicTypeMap_characteristicsMap;
}

void __60__HMDCharacteristic_currentTargetStateCharacteristicTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8B08];
  v1 = *MEMORY[0x1E0CB8848];
  v14[0] = *MEMORY[0x1E0CB8890];
  v14[1] = v1;
  v2 = *MEMORY[0x1E0CB8AC0];
  v15[0] = v0;
  v15[1] = v2;
  v3 = *MEMORY[0x1E0CB8AF8];
  v4 = *MEMORY[0x1E0CB8838];
  v14[2] = *MEMORY[0x1E0CB8880];
  v14[3] = v4;
  v5 = *MEMORY[0x1E0CB8AA8];
  v15[2] = v3;
  v15[3] = v5;
  v6 = *MEMORY[0x1E0CB8AE0];
  v7 = *MEMORY[0x1E0CB8850];
  v14[4] = *MEMORY[0x1E0CB8868];
  v14[5] = v7;
  v8 = *MEMORY[0x1E0CB8AC8];
  v15[4] = v6;
  v15[5] = v8;
  v9 = *MEMORY[0x1E0CB8AF0];
  v10 = *MEMORY[0x1E0CB8888];
  v14[6] = *MEMORY[0x1E0CB8878];
  v14[7] = v10;
  v11 = *MEMORY[0x1E0CB8B00];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x1E0CB8898];
  v15[8] = *MEMORY[0x1E0CB8B10];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)currentTargetStateCharacteristicTypeMap_characteristicsMap;
  currentTargetStateCharacteristicTypeMap_characteristicsMap = v12;

}

void __32__HMDCharacteristic_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v44;
  logCategory__hmf_once_v44 = v0;

}

@end
