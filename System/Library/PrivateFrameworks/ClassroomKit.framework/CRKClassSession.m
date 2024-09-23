@implementation CRKClassSession

- (CRKClassSession)initWithIdentifier:(id)a3
{
  id v6;
  void *v7;
  CRKClassSession *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSession.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  objc_msgSend(v6, "crk_endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CRKClassSession;
  v8 = -[CRKSession initWithEndpoint:](&v11, sel_initWithEndpoint_, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_identifier, a3);

  return v8;
}

- (void)foundBeaconWithFlags:(unsigned __int16)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSession.m"), 41, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[CRKClassSession setFlags:](self, "setFlags:", v3);
  -[CRKClassSession logBeaconFound](self, "logBeaconFound");
  v8.receiver = self;
  v8.super_class = (Class)CRKClassSession;
  -[CRKSession foundBeacon](&v8, sel_foundBeacon);
}

- (id)stateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CRKClassSession;
  -[CRKSession stateDictionary](&v8, sel_stateDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("flags");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[CRKClassSession flags](self, "flags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crk_dictionaryByAddingEntriesFromDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)lostBeacon
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  CRKClassSession *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSession.m"), 56, CFSTR("%@ must be called from the main thread"), v10);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSession lastMatchMessageForCurrentDate:](self, "lastMatchMessageForCurrentDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogBluetooth();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[CRKClassSession identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "<%{public}p> Lost beacon for class session %{public}@. %{public}@", buf, 0x20u);

  }
  -[CRKClassSession setLastBeaconFoundDate:](self, "setLastBeaconFoundDate:", 0);
  v11.receiver = self;
  v11.super_class = (Class)CRKClassSession;
  -[CRKSession lostBeacon](&v11, sel_lostBeacon);

}

- (void)logBeaconFound
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  CRKClassSession *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSession lastMatchMessageForCurrentDate:](self, "lastMatchMessageForCurrentDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogBluetooth();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[CRKClassSession identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134349570;
    v9 = self;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "<%{public}p> Found beacon for class session %{public}@. %{public}@", (uint8_t *)&v8, 0x20u);

  }
  -[CRKClassSession setLastBeaconFoundDate:](self, "setLastBeaconFoundDate:", v3);

}

- (id)lastMatchMessageForCurrentDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  v4 = a3;
  -[CRKClassSession lastBeaconFoundDate](self, "lastBeaconFoundDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("last match %0.1f seconds ago"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24D9CB490;
  }

  return v7;
}

- (DMFControlSessionIdentifier)identifier
{
  return self->_identifier;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int16)a3
{
  self->_flags = a3;
}

- (NSDate)lastBeaconFoundDate
{
  return self->_lastBeaconFoundDate;
}

- (void)setLastBeaconFoundDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastBeaconFoundDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBeaconFoundDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
