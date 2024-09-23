@implementation HAPBLEAccessoryCache

- (HAPBLEAccessoryCache)initWithPairingIdentifier:(id)a3
{
  id v5;
  HAPBLEAccessoryCache *v6;
  uint64_t v7;
  NSNumber *metadataVersion;
  uint64_t v9;
  NSMutableArray *cachedServices;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HAPBLEAccessoryCache;
  v6 = -[HAPBLEAccessoryCache init](&v12, sel_init);
  if (v6)
  {
    HAPGetHAPMetadataVersion();
    v7 = objc_claimAutoreleasedReturnValue();
    metadataVersion = v6->_metadataVersion;
    v6->_metadataVersion = (NSNumber *)v7;

    objc_storeStrong((id *)&v6->_pairingIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    cachedServices = v6->_cachedServices;
    v6->_cachedServices = (NSMutableArray *)v9;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEAccessoryCache *v4;
  HAPBLEAccessoryCache *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HAPBLEAccessoryCache *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HAPBLEAccessoryCache pairingIdentifier](self, "pairingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEAccessoryCache pairingIdentifier](v5, "pairingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HAPBLEAccessoryCache pairingIdentifier](self, "pairingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)updateWithPeripheralInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryName");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HAPBLEAccessoryCache setPeripheralInfo:](self, "setPeripheralInfo:", v4);
  -[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAccessoryName:", v7);

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HAPBLEAccessoryCache pairingIdentifier](self, "pairingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("PI"));

  -[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("PIN"));

  -[HAPBLEAccessoryCache cachedServices](self, "cachedServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("CS"));

  -[HAPBLEAccessoryCache metadataVersion](self, "metadataVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("MV"));

  -[HAPBLEAccessoryCache lastKeyBagIdentityIndexFailingPV](self, "lastKeyBagIdentityIndexFailingPV");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("PVX"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[HAPBLEAccessoryCache discoveryVersion](self, "discoveryVersion"), CFSTR("DV"));
}

- (HAPBLEAccessoryCache)initWithCoder:(id)a3
{
  id v4;
  HAPBLEAccessoryCache *v5;
  uint64_t v6;
  NSNumber *metadataVersion;
  uint64_t v8;
  NSString *pairingIdentifier;
  uint64_t v10;
  HAPBLEPeripheralInfo *peripheralInfo;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *cachedServices;
  uint64_t v17;
  NSNumber *lastKeyBagIdentityIndexFailingPV;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HAPBLEAccessoryCache;
  v5 = -[HAPBLEAccessoryCache init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MV"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadataVersion = v5->_metadataVersion;
    v5->_metadataVersion = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PI"));
    v8 = objc_claimAutoreleasedReturnValue();
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PIN"));
    v10 = objc_claimAutoreleasedReturnValue();
    peripheralInfo = v5->_peripheralInfo;
    v5->_peripheralInfo = (HAPBLEPeripheralInfo *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("CS"));
    v15 = objc_claimAutoreleasedReturnValue();
    cachedServices = v5->_cachedServices;
    v5->_cachedServices = (NSMutableArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PVX"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastKeyBagIdentityIndexFailingPV = v5->_lastKeyBagIdentityIndexFailingPV;
    v5->_lastKeyBagIdentityIndexFailingPV = (NSNumber *)v17;

    v5->_discoveryVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DV"));
  }

  return v5;
}

- (id)getCachedServiceWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HAPBLEAccessoryCache cachedServices](self, "cachedServices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "serviceUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateWithService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HAPBLEAccessoryCache cachedServices](self, "cachedServices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", v4))
        {
          objc_msgSend(v10, "updateWithService:", v4);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[HAPBLEAccessoryCache cachedServices](self, "cachedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);
LABEL_11:

}

- (void)save
{
  void (**v2)(void);
  void (**v3)(void);

  -[HAPBLEAccessoryCache saveBlock](self, "saveBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)setLastKeyBagIdentityIndexFailingPV:(id)a3
{
  id v5;

  v5 = a3;
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, a3);
    -[HAPBLEAccessoryCache save](self, "save");
  }

}

- (void)updateCurrentPairingIdentityIndexIfNeededForKeyBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HAPBLEAccessoryCache *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPBLEAccessoryCache lastKeyBagIdentityIndexFailingPV](self, "lastKeyBagIdentityIndexFailingPV");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPBLEAccessoryCache lastKeyBagIdentityIndexFailingPV](self, "lastKeyBagIdentityIndexFailingPV");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue") + 1;

    if (objc_msgSend(v4, "isValidIndex:", v7))
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBLEAccessoryCache pairingIdentifier](v9, "pairingIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v11;
        v18 = 2114;
        v19 = v12;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating keybag identity index to %{public}@ for %{public}@.", (uint8_t *)&v16, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v14 = objc_msgSend(v4, "getCurrentIndexInBag");
      objc_msgSend(v4, "setCurrentIndexInBag:", v7);
      objc_msgSend(v4, "currentIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        objc_msgSend(v4, "setCurrentIndexInBag:", v14);
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBLEAccessoryCache cachedServices](self, "cachedServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n\nList of Services: %tu\n"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HAPBLEAccessoryCache cachedServices](self, "cachedServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSNumber)metadataVersion
{
  return self->_metadataVersion;
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (HAPBLEPeripheralInfo)peripheralInfo
{
  return self->_peripheralInfo;
}

- (void)setPeripheralInfo:(id)a3
{
  objc_storeStrong((id *)&self->_peripheralInfo, a3);
}

- (NSMutableArray)cachedServices
{
  return self->_cachedServices;
}

- (NSNumber)lastKeyBagIdentityIndexFailingPV
{
  return self->_lastKeyBagIdentityIndexFailingPV;
}

- (int64_t)discoveryVersion
{
  return self->_discoveryVersion;
}

- (void)setDiscoveryVersion:(int64_t)a3
{
  self->_discoveryVersion = a3;
}

- (id)saveBlock
{
  return self->_saveBlock;
}

- (void)setSaveBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveBlock, 0);
  objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, 0);
  objc_storeStrong((id *)&self->_cachedServices, 0);
  objc_storeStrong((id *)&self->_peripheralInfo, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataVersion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)currentDiscoveryVersion
{
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  return HAPIsHH2Enabled_hh2Enabled;
}

@end
