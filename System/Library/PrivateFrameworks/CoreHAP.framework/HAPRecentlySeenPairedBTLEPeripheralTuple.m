@implementation HAPRecentlySeenPairedBTLEPeripheralTuple

- (id)initRecentlySeenPairedHAPBLEPeripheral:(id)a3
{
  id v4;
  HAPRecentlySeenPairedBTLEPeripheralTuple *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPRecentlySeenPairedBTLEPeripheralTuple;
  v5 = -[HAPRecentlySeenPairedBTLEPeripheralTuple init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_advertisementFormat = objc_msgSend(v4, "advertisementFormat");
    v5->_connectionPriority = 0;
    v5->_monitorState = 1;
    -[HAPRecentlySeenPairedBTLEPeripheralTuple updateWithPeripheral:](v5, "updateWithPeripheral:", v4);
  }

  return v5;
}

- (void)updateWithPeripheral:(id)a3
{
  void *v4;
  NSNumber *v5;
  NSNumber *stateNumber;
  void *v7;
  NSNumber *v8;
  NSNumber *configNumber;
  void *v10;
  NSNumber *v11;
  NSNumber *category;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "stateNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v15, "stateNumber");
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    stateNumber = self->_stateNumber;
    self->_stateNumber = v5;

  }
  objc_msgSend(v15, "configNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "configNumber");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    configNumber = self->_configNumber;
    self->_configNumber = v8;

  }
  objc_msgSend(v15, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v15, "category");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    category = self->_category;
    self->_category = v11;

  }
  objc_msgSend(v15, "lastSeen");
  if (v13 > 0.0)
  {
    objc_msgSend(v15, "lastSeen");
    self->_lastSeen = v14;
  }

}

- (void)updatePairedPeripheralConfiguration:(BOOL)a3 connectionPriority:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  HAPRecentlySeenPairedBTLEPeripheralTuple *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (-[HAPRecentlySeenPairedBTLEPeripheralTuple monitorState](self, "monitorState") != a3
    || -[HAPRecentlySeenPairedBTLEPeripheralTuple connectionPriority](self, "connectionPriority") != a4)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPRecentlySeenPairedBTLEPeripheralTuple identifier](v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 2048;
      v20 = a4;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating configuration for %{public}@, monitor: %{public}@, priority: %tu", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    -[HAPRecentlySeenPairedBTLEPeripheralTuple setMonitorState:](v8, "setMonitorState:", v5);
    -[HAPRecentlySeenPairedBTLEPeripheralTuple setConnectionPriority:](v8, "setConnectionPriority:", a4);
  }
}

- (id)description
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = 0.0;
  if (self->_lastSeen > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v3 = v5 - self->_lastSeen;

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HAPRecentlySeenPairedBTLEPeripheralTuple identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPRecentlySeenPairedBTLEPeripheralTuple stateNumber](self, "stateNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 <= 0.0)
    v9 = -1.0;
  else
    v9 = v3 / 60.0;
  -[HAPRecentlySeenPairedBTLEPeripheralTuple monitorState](self, "monitorState");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPRecentlySeenPairedBTLEPeripheralTuple connectionPriority](self, "connectionPriority"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@ - Seen(%0.2fm)/Monitor(%@)/Priority(%@)"), v7, v8, *(_QWORD *)&v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)notifyingCharacteristicUpdated
{
  return self->_notifyingCharacteristicUpdated;
}

- (void)setNotifyingCharacteristicUpdated:(BOOL)a3
{
  self->_notifyingCharacteristicUpdated = a3;
}

- (BOOL)monitorState
{
  return self->_monitorState;
}

- (void)setMonitorState:(BOOL)a3
{
  self->_monitorState = a3;
}

- (unint64_t)connectionPriority
{
  return self->_connectionPriority;
}

- (void)setConnectionPriority:(unint64_t)a3
{
  self->_connectionPriority = a3;
}

- (unint64_t)advertisementFormat
{
  return self->_advertisementFormat;
}

- (void)setAdvertisementFormat:(unint64_t)a3
{
  self->_advertisementFormat = a3;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_stateNumber, a3);
}

- (NSNumber)configNumber
{
  return self->_configNumber;
}

- (void)setConfigNumber:(id)a3
{
  objc_storeStrong((id *)&self->_configNumber, a3);
}

- (NSNumber)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
