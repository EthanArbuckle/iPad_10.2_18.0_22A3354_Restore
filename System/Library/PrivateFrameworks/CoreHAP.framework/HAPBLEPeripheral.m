@implementation HAPBLEPeripheral

- (HAPBLEPeripheral)initWithName:(id)a3 peripheralUUID:(id)a4 identifier:(id)a5 hapVersion:(id)a6 hkType:(id)a7 advInterval:(id)a8 statusFlags:(id)a9 category:(id)a10 stateNumber:(id)a11 configNumber:(id)a12 setupHash:(id)a13 encryptedPayload:(id)a14 whbStableIdentifier:(id)a15 advDeviceAddress:(id)a16
{
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  HAPBLEPeripheral *v26;
  HAPBLEPeripheral *v27;
  void *v28;
  uint64_t v29;
  NSMutableArray *cbPeripheralUUIDs;
  uint64_t v31;
  NSUUID *uniqueBTIdentifier;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v21 = a4;
  v36 = a5;
  v46 = a5;
  v22 = a6;
  v45 = a7;
  v35 = a8;
  v44 = a8;
  v43 = a9;
  v42 = a10;
  v41 = a11;
  v40 = a12;
  v39 = a13;
  v38 = a14;
  v23 = a15;
  v24 = v22;
  v25 = a16;
  v48.receiver = self;
  v48.super_class = (Class)HAPBLEPeripheral;
  v26 = -[HAPBLEPeripheral init](&v48, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_name, a3);
    objc_storeStrong((id *)&v27->_hkType, a7);
    objc_storeStrong((id *)&v27->_advInterval, v35);
    v27->_advertisementFormat = objc_msgSend(v24, "unsignedIntegerValue");
    objc_storeStrong((id *)&v27->_statusFlags, a9);
    objc_storeStrong((id *)&v27->_identifier, v36);
    objc_storeStrong((id *)&v27->_category, a10);
    objc_storeStrong((id *)&v27->_stateNumber, a11);
    objc_storeStrong((id *)&v27->_configNumber, a12);
    objc_storeStrong((id *)&v27->_setupHash, a13);
    objc_storeStrong((id *)&v27->_encryptedPayload, a14);
    v27->_lastSeen = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v27->_whbStableIdentifier, a15);
    objc_storeStrong((id *)&v27->_advDeviceAddress, a16);
    v49[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");
    cbPeripheralUUIDs = v27->_cbPeripheralUUIDs;
    v27->_cbPeripheralUUIDs = (NSMutableArray *)v29;

    objc_msgSend((id)objc_opt_class(), "uuidForBTLEPeripheral:", v27);
    v31 = objc_claimAutoreleasedReturnValue();
    uniqueBTIdentifier = v27->_uniqueBTIdentifier;
    v27->_uniqueBTIdentifier = (NSUUID *)v31;

  }
  return v27;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEPeripheral *v4;
  HAPBLEPeripheral *v5;
  HAPBLEPeripheral *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HAPBLEPeripheral *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HAPBLEPeripheral identifier](self, "identifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HAPBLEPeripheral identifier](v6, "identifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      -[HAPBLEPeripheral uniqueBTIdentifier](self, "uniqueBTIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral uniqueBTIdentifier](v6, "uniqueBTIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HMFEqualObjects();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HAPBLEPeripheral identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPBLEPeripheral whbStableIdentifier](self, "whbStableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HAPBLEPeripheral advDeviceAddress](self, "advDeviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
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
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;
  id v17;
  __CFString *v18;
  _BOOL4 v19;

  v16 = (id)MEMORY[0x1E0CB3940];
  v19 = HAPIsInternalBuild();
  if (v19)
  {
    -[HAPBLEPeripheral name](self, "name");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("<private>");
  }
  -[HAPBLEPeripheral identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral stateNumber](self, "stateNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral isCached](self, "isCached");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@ (%@, %@, %p) periph[%@] -> %@ (%p: %@)"), v18, v14, v3, v4, self, v6, v8, v9, v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  return v17;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  __CFString *v31;

  v25 = (void *)MEMORY[0x1E0CB3940];
  v30 = HAPIsInternalBuild();
  if (v30)
  {
    -[HAPBLEPeripheral name](self, "name");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("<private>");
  }
  -[HAPBLEPeripheral identifier](self, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral advDeviceAddress](self, "advDeviceAddress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral statusFlags](self, "statusFlags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v27, "unsignedIntValue");
  -[HAPBLEPeripheral category](self, "category");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral stateNumber](self, "stateNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral configNumber](self, "configNumber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HAPBLEPeripheral advertisementFormat](self, "advertisementFormat");
  -[HAPBLEPeripheral isCached](self, "isCached");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral lastSeen](self, "lastSeen");
  if (v5 <= 0.0)
  {
    v10 = CFSTR("N/A");
  }
  else
  {
    v6 = v5;
    v7 = v3;
    if (HAPBLEDateStringForTime_onceToken != -1)
      dispatch_once(&HAPBLEDateStringForTime_onceToken, &__block_literal_global_410);
    v8 = (void *)HAPBLEDateStringForTime_formatter;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v6);
    objc_msgSend(v8, "stringFromDate:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v3 = v7;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "state"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ (%@/%@/%p), sf: 0x%0x, c: %@, s#: %@, c#: %@, v: %tu, cached: %@, seen: '%@', periph[%@]: %@ (%p: %@)"), v31, v29, v28, self, v21, v24, v23, v22, v3, v4, v10, v18, v12, v13, v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  return v26;
}

- (int64_t)compareStateNumber:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[HAPBLEPeripheral stateNumber](self, "stateNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HAPCompareStateNumberWithRollover(v5, v4, 0xFFuLL);

  return v6;
}

- (int64_t)compareConfigNumber:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[HAPBLEPeripheral configNumber](self, "configNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HAPCompareStateNumberWithRollover(v5, v4, 0xFFuLL);

  return v6;
}

- (void)updateStateNumber:(id)a3
{
  id v4;
  void *v5;
  HAPBLEPeripheral *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPBLEPeripheral compareStateNumber:](self, "compareStateNumber:", v4) == -1)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral identifier](v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral stateNumber](v6, "stateNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544130;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating state number for tracked peripheral of %@ to sync-up current/new: %{public}@/%{public}@", (uint8_t *)&v11, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    -[HAPBLEPeripheral setStateNumber:](v6, "setStateNumber:", v4);
  }

}

- (BOOL)updateWithPeripheral:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  double Current;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[HAPBLEPeripheral name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v6 > v8)
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBLEPeripheral setName:](self, "setName:", v9);

  }
  objc_msgSend(v4, "encryptedPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HAPBLEPeripheral encryptedPayload](self, "encryptedPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToData:", v12);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[HAPBLEPeripheral configNumber](self, "configNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {
      -[HAPBLEPeripheral stateNumber](self, "stateNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stateNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqual:", v16))
      {
        -[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "peripheralUUIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "containsObject:", v19))
        {
          -[HAPBLEPeripheral lastSeen](self, "lastSeen");
          v13 = Current - v20 < 600.0;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  -[HAPBLEPeripheral mergeWithPeripheral:](self, "mergeWithPeripheral:", v4);
  return v13 ^ 1;
}

- (void)_updateAverageRSSIWithRSSI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[HAPBLEPeripheral averageRSSI](self, "averageRSSI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      -[HAPBLEPeripheral averageRSSI](self, "averageRSSI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");
      v9 = objc_msgSend(v12, "integerValue");
      v10 = v9 + v8;
      if (v9 + v8 < 0 != __OFADD__(v9, v8))
        ++v10;
      objc_msgSend(v6, "numberWithInteger:", v10 >> 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setAverageRSSI:](self, "setAverageRSSI:", v11);

    }
    else
    {
      -[HAPBLEPeripheral setAverageRSSI:](self, "setAverageRSSI:", v12);
    }

    v4 = v12;
  }

}

- (BOOL)isBroadcasting
{
  void *v2;
  BOOL v3;

  -[HAPBLEPeripheral encryptedPayload](self, "encryptedPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSArray)peripheralUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cbPeripheralUUIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)isReachable
{
  double Current;
  double v4;
  double v5;

  Current = CFAbsoluteTimeGetCurrent();
  -[HAPBLEPeripheral lastSeen](self, "lastSeen");
  if (v4 <= 0.0)
    return 0;
  -[HAPBLEPeripheral lastSeen](self, "lastSeen");
  return Current - v5 < 600.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPBLEPeripheral *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSUUID *uniqueBTIdentifier;
  uint64_t v9;
  NSString *advDeviceAddress;
  void *v11;
  uint64_t v12;
  NSMutableArray *cbPeripheralUUIDs;
  uint64_t v14;
  CBPeripheral *cbPeripheral;

  v4 = objc_alloc_init(HAPBLEPeripheral);
  -[HAPBLEPeripheral identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  -[HAPBLEPeripheral uniqueBTIdentifier](self, "uniqueBTIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  uniqueBTIdentifier = v4->_uniqueBTIdentifier;
  v4->_uniqueBTIdentifier = (NSUUID *)v7;

  -[HAPBLEPeripheral advDeviceAddress](self, "advDeviceAddress");
  v9 = objc_claimAutoreleasedReturnValue();
  advDeviceAddress = v4->_advDeviceAddress;
  v4->_advDeviceAddress = (NSString *)v9;

  -[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mutableCopy");
  cbPeripheralUUIDs = v4->_cbPeripheralUUIDs;
  v4->_cbPeripheralUUIDs = (NSMutableArray *)v12;

  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if ((HAPIsHH2Enabled_hh2Enabled & 1) == 0)
  {
    -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
    v14 = objc_claimAutoreleasedReturnValue();
    cbPeripheral = v4->_cbPeripheral;
    v4->_cbPeripheral = (CBPeripheral *)v14;

  }
  -[HAPBLEPeripheral mergeWithPeripheral:](v4, "mergeWithPeripheral:", self);
  return v4;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  NSData *encryptedPayload;
  NSNumber *averageRSSI;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_lastSeen = 0.0;
  encryptedPayload = self->_encryptedPayload;
  self->_encryptedPayload = 0;

  averageRSSI = self->_averageRSSI;
  self->_averageRSSI = (NSNumber *)&unk_1E8989620;

  -[NSMutableArray removeAllObjects](self->_cbPeripheralUUIDs, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)mergeWithPeripheral:(id)a3
{
  HAPBLEPeripheral *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HAPBLEPeripheral *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  unint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  HAPBLEPeripheral *v80;
  HAPBLEPeripheral *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = (HAPBLEPeripheral *)a3;
  if (self == v4)
    goto LABEL_104;
  -[HAPBLEPeripheral identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheral identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_104;
  -[HAPBLEPeripheral lastSeen](v4, "lastSeen");
  v9 = v8;
  -[HAPBLEPeripheral lastSeen](self, "lastSeen");
  v11 = v9 - v10;
  if (v11 > 0.0)
  {
    -[HAPBLEPeripheral lastSeen](v4, "lastSeen");
    -[HAPBLEPeripheral setLastSeen:](self, "setLastSeen:");
    -[HAPBLEPeripheral encryptedPayload](v4, "encryptedPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBLEPeripheral setEncryptedPayload:](self, "setEncryptedPayload:", v12);

    -[HAPBLEPeripheral setIsCached:](self, "setIsCached:", -[HAPBLEPeripheral isCached](v4, "isCached"));
    -[HAPBLEPeripheral averageRSSI](v4, "averageRSSI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HAPBLEPeripheral averageRSSI](v4, "averageRSSI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral _updateAverageRSSIWithRSSI:](self, "_updateAverageRSSIWithRSSI:", v14);

    }
    -[HAPBLEPeripheral cbPeripheral](v4, "cbPeripheral");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = (void *)MEMORY[0x1D17B7244]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPBLEPeripheral shortDescription](v19, "shortDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPBLEPeripheral cbPeripheral](v4, "cbPeripheral");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v102 = v21;
          v103 = 2112;
          v104 = v22;
          v105 = 2112;
          v106 = v23;
          _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating the BLE peripheral: %@ with CBPeripheral: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        -[HAPBLEPeripheral cbPeripheral](v4, "cbPeripheral");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBLEPeripheral setCbPeripheral:](v19, "setCbPeripheral:", v24);

      }
    }
  }
  -[HAPBLEPeripheral identifier](v4, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v11 > 0.0 || v25 == 0)
  {

    if (v26)
    {
LABEL_17:
      -[HAPBLEPeripheral identifier](v4, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setIdentifier:](self, "setIdentifier:", v28);

    }
  }
  else
  {
    -[HAPBLEPeripheral identifier](self, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      goto LABEL_17;
  }
  -[HAPBLEPeripheral whbStableIdentifier](v4, "whbStableIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v11 <= 0.0 && v29)
  {
    -[HAPBLEPeripheral whbStableIdentifier](self, "whbStableIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      goto LABEL_25;
  }
  else
  {

    if (v30)
    {
LABEL_25:
      -[HAPBLEPeripheral whbStableIdentifier](v4, "whbStableIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setWhbStableIdentifier:](self, "setWhbStableIdentifier:", v33);

    }
  }
  -[HAPBLEPeripheral hkType](v4, "hkType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v11 <= 0.0 && v34)
  {
    -[HAPBLEPeripheral hkType](self, "hkType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_31;
  }
  else
  {

    if (v35)
    {
LABEL_31:
      -[HAPBLEPeripheral hkType](v4, "hkType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setHkType:](self, "setHkType:", v37);

    }
  }
  -[HAPBLEPeripheral advInterval](v4, "advInterval");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v11 <= 0.0 && v38)
  {
    -[HAPBLEPeripheral advInterval](self, "advInterval");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
      goto LABEL_37;
  }
  else
  {

    if (v39)
    {
LABEL_37:
      -[HAPBLEPeripheral advInterval](v4, "advInterval");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setAdvInterval:](self, "setAdvInterval:", v41);

    }
  }
  if (-[HAPBLEPeripheral advertisementFormat](v4, "advertisementFormat")
    && (v11 > 0.0 || !-[HAPBLEPeripheral advertisementFormat](self, "advertisementFormat")))
  {
    -[HAPBLEPeripheral setAdvertisementFormat:](self, "setAdvertisementFormat:", -[HAPBLEPeripheral advertisementFormat](v4, "advertisementFormat"));
  }
  -[HAPBLEPeripheral statusFlags](v4, "statusFlags");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v11 <= 0.0 && v42)
  {
    -[HAPBLEPeripheral statusFlags](self, "statusFlags");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
      goto LABEL_47;
  }
  else
  {

    if (v43)
    {
LABEL_47:
      -[HAPBLEPeripheral statusFlags](v4, "statusFlags");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setStatusFlags:](self, "setStatusFlags:", v45);

    }
  }
  -[HAPBLEPeripheral category](v4, "category");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v11 <= 0.0 && v46)
  {
    -[HAPBLEPeripheral category](self, "category");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
      goto LABEL_53;
  }
  else
  {

    if (v47)
    {
LABEL_53:
      -[HAPBLEPeripheral category](v4, "category");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setCategory:](self, "setCategory:", v49);

    }
  }
  -[HAPBLEPeripheral stateNumber](v4, "stateNumber");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v11 <= 0.0 && v50)
  {
    -[HAPBLEPeripheral stateNumber](self, "stateNumber");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
      goto LABEL_62;
  }
  else
  {

    if (!v51)
      goto LABEL_62;
  }
  if (!-[HAPBLEPeripheral isCached](v4, "isCached")
    || (-[HAPBLEPeripheral stateNumber](v4, "stateNumber"),
        v53 = (void *)objc_claimAutoreleasedReturnValue(),
        v54 = -[HAPBLEPeripheral compareStateNumber:](self, "compareStateNumber:", v53),
        v53,
        v54 == -1))
  {
    -[HAPBLEPeripheral stateNumber](v4, "stateNumber");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBLEPeripheral setStateNumber:](self, "setStateNumber:", v55);

  }
LABEL_62:
  -[HAPBLEPeripheral configNumber](v4, "configNumber");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v11 <= 0.0 && v56)
  {
    -[HAPBLEPeripheral configNumber](self, "configNumber");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      goto LABEL_70;
  }
  else
  {

    if (!v57)
      goto LABEL_70;
  }
  if (!-[HAPBLEPeripheral isCached](v4, "isCached")
    || (-[HAPBLEPeripheral configNumber](v4, "configNumber"),
        v59 = (void *)objc_claimAutoreleasedReturnValue(),
        v60 = -[HAPBLEPeripheral compareConfigNumber:](self, "compareConfigNumber:", v59),
        v59,
        v60 == -1))
  {
    -[HAPBLEPeripheral configNumber](v4, "configNumber");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBLEPeripheral setConfigNumber:](self, "setConfigNumber:", v61);

  }
LABEL_70:
  -[HAPBLEPeripheral setupHash](v4, "setupHash");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v11 <= 0.0 && v62)
  {
    -[HAPBLEPeripheral setupHash](self, "setupHash");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
      goto LABEL_75;
  }
  else
  {

    if (v63)
    {
LABEL_75:
      -[HAPBLEPeripheral setupHash](v4, "setupHash");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setSetupHash:](self, "setSetupHash:", v65);

    }
  }
  -[HAPBLEPeripheral averageRSSI](v4, "averageRSSI");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v11 <= 0.0 && v66)
  {
    -[HAPBLEPeripheral averageRSSI](self, "averageRSSI");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
      goto LABEL_81;
  }
  else
  {

    if (v67)
    {
LABEL_81:
      -[HAPBLEPeripheral averageRSSI](v4, "averageRSSI");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheral setAverageRSSI:](self, "setAverageRSSI:", v69);

    }
  }
  -[HAPBLEPeripheral name](self, "name");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "length");
  -[HAPBLEPeripheral name](v4, "name");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "length");

  if (v71 < v73)
  {
    -[HAPBLEPeripheral name](v4, "name");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBLEPeripheral setName:](self, "setName:", v74);

  }
  -[HAPBLEPeripheral peripheralUUIDs](v4, "peripheralUUIDs");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBLEPeripheral peripheralUUIDs](v4, "peripheralUUIDs");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqual:", v78);

    if ((v79 & 1) == 0)
    {
      if (v11 <= 0.0)
        v80 = v4;
      else
        v80 = self;
      if (v11 <= 0.0)
        v81 = self;
      else
        v81 = v4;
      -[HAPBLEPeripheral peripheralUUIDs](v80, "peripheralUUIDs");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (void *)objc_msgSend(v82, "mutableCopy");

      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      -[HAPBLEPeripheral peripheralUUIDs](v81, "peripheralUUIDs", 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
      if (v85)
      {
        v86 = v85;
        v87 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v86; ++i)
          {
            if (*(_QWORD *)v97 != v87)
              objc_enumerationMutation(v84);
            v89 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
            objc_msgSend(v83, "removeObject:", v89);
            objc_msgSend(v83, "addObject:", v89);
          }
          v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
        }
        while (v86);
      }

      -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "state");

      if (v91)
      {
        -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "identifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "removeObject:", v93);

        -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "identifier");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addObject:", v95);

      }
      if ((unint64_t)objc_msgSend(v83, "count") >= 6)
        objc_msgSend(v83, "removeObjectsInRange:", 0, objc_msgSend(v83, "count") - 5);
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_cbPeripheralUUIDs, v83);
      os_unfair_lock_unlock(&self->_lock);

    }
  }
LABEL_104:

}

- (void)connectedToCBPeripheral:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *cbPeripheralUUIDs;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = v14;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
      -[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](cbPeripheralUUIDs, "removeObject:", v11);

    }
    if (v14)
    {
      v12 = self->_cbPeripheralUUIDs;
      objc_msgSend(v14, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](v12, "removeObject:", v13);

    }
    os_unfair_lock_unlock(&self->_lock);
    v7 = 0;
  }
  -[HAPBLEPeripheral setCbPeripheral:](self, "setCbPeripheral:", v7);

}

- (void)disconnectedFromCBPeripheral:(id)a3 shouldRemove:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *cbPeripheralUUIDs;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[HAPBLEPeripheral setCbPeripheral:](self, "setCbPeripheral:", 0);
  if (v9 && v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](cbPeripheralUUIDs, "removeObject:", v8);

    os_unfair_lock_unlock(p_lock);
  }

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSUUID)uniqueBTIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)hkType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHkType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)advInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAdvInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)advDeviceAddress
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdvDeviceAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)statusFlags
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStatusFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)category
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)stateNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStateNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)configNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfigNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)setupHash
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSetupHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSData)encryptedPayload
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEncryptedPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)averageRSSI
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAverageRSSI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (unint64_t)advertisementFormat
{
  return self->_advertisementFormat;
}

- (void)setAdvertisementFormat:(unint64_t)a3
{
  self->_advertisementFormat = a3;
}

- (CBPeripheral)cbPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCbPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)whbStableIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWhbStableIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSMutableArray)cbPeripheralUUIDs
{
  return self->_cbPeripheralUUIDs;
}

- (void)setCbPeripheralUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cbPeripheralUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbPeripheralUUIDs, 0);
  objc_storeStrong((id *)&self->_whbStableIdentifier, 0);
  objc_storeStrong((id *)&self->_cbPeripheral, 0);
  objc_storeStrong((id *)&self->_averageRSSI, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_statusFlags, 0);
  objc_storeStrong((id *)&self->_advDeviceAddress, 0);
  objc_storeStrong((id *)&self->_advInterval, 0);
  objc_storeStrong((id *)&self->_hkType, 0);
  objc_storeStrong((id *)&self->_uniqueBTIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)uuidForBTLEPeripheral:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "uniqueBTIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "uniqueBTIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (HAPIsHH2Enabled_onceToken != -1)
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
    if (HAPIsHH2Enabled_hh2Enabled == 1
      && (objc_msgSend(v3, "whbStableIdentifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
    {
      objc_msgSend(v3, "advDeviceAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1E894EFE8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "whbStableIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1E894EFE8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(CFSTR("8A0A9F67-9C4E-4BA0-9ECC-"), "stringByAppendingFormat:", CFSTR("%@"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

    }
    else
    {
      objc_msgSend(v3, "peripheralUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

@end
