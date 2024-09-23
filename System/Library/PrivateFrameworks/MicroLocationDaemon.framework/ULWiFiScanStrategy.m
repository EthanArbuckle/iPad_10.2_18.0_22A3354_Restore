@implementation ULWiFiScanStrategy

- (ULWiFiScanStrategy)initWithChannels:(id)a3 scanType:(unint64_t)a4 numberOfScans:(unint64_t)a5 scanIterations:(unint64_t)a6 restTime:(unint64_t)a7 dwellTime:(unint64_t)a8 acceptableCacheAge:(unint64_t)a9 maximumAge:(unint64_t)a10 isLowPriority:(BOOL)a11 isLowLatency:(BOOL)a12 doAbortOngoingScan:(BOOL)a13
{
  id v19;
  ULWiFiScanStrategy *v20;
  ULWiFiScanStrategy *v21;
  objc_super v23;

  v19 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ULWiFiScanStrategy;
  v20 = -[ULWiFiScanStrategy init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[ULWiFiScanStrategy setChannels:](v20, "setChannels:", v19);
    -[ULWiFiScanStrategy setScanType:](v21, "setScanType:", a4);
    -[ULWiFiScanStrategy setNumberOfScans:](v21, "setNumberOfScans:", a5);
    -[ULWiFiScanStrategy setScanIterations:](v21, "setScanIterations:", a6);
    -[ULWiFiScanStrategy setRestTimeInMilliSeconds:](v21, "setRestTimeInMilliSeconds:", a7);
    -[ULWiFiScanStrategy setDwellTimeMilliSeconds:](v21, "setDwellTimeMilliSeconds:", a8);
    -[ULWiFiScanStrategy setAcceptableCacheAge:](v21, "setAcceptableCacheAge:", a9);
    -[ULWiFiScanStrategy setMaximumAge:](v21, "setMaximumAge:", a10);
    -[ULWiFiScanStrategy setIsLowLatency:](v21, "setIsLowLatency:", a12);
    -[ULWiFiScanStrategy setIsLowPriority:](v21, "setIsLowPriority:", a11);
    -[ULWiFiScanStrategy setDoAbortOngoingScan:](v21, "setDoAbortOngoingScan:", a13);
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  ULWiFiScanStrategy *v14;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  ULWiFiScanStrategy *v19;

  v19 = [ULWiFiScanStrategy alloc];
  -[ULWiFiScanStrategy channels](self, "channels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", a3);
  v18 = -[ULWiFiScanStrategy scanType](self, "scanType");
  v17 = -[ULWiFiScanStrategy numberOfScans](self, "numberOfScans");
  v7 = -[ULWiFiScanStrategy scanIterations](self, "scanIterations");
  v8 = -[ULWiFiScanStrategy restTimeInMilliSeconds](self, "restTimeInMilliSeconds");
  v9 = -[ULWiFiScanStrategy dwellTimeMilliSeconds](self, "dwellTimeMilliSeconds");
  v10 = -[ULWiFiScanStrategy acceptableCacheAge](self, "acceptableCacheAge");
  v11 = -[ULWiFiScanStrategy maximumAge](self, "maximumAge");
  v12 = -[ULWiFiScanStrategy isLowPriority](self, "isLowPriority");
  v13 = -[ULWiFiScanStrategy isLowLatency](self, "isLowLatency");
  BYTE2(v16) = -[ULWiFiScanStrategy doAbortOngoingScan](self, "doAbortOngoingScan");
  BYTE1(v16) = v13;
  LOBYTE(v16) = v12;
  v14 = -[ULWiFiScanStrategy initWithChannels:scanType:numberOfScans:scanIterations:restTime:dwellTime:acceptableCacheAge:maximumAge:isLowPriority:isLowLatency:doAbortOngoingScan:](v19, "initWithChannels:scanType:numberOfScans:scanIterations:restTime:dwellTime:acceptableCacheAge:maximumAge:isLowPriority:isLowLatency:doAbortOngoingScan:", v6, v18, v17, v7, v8, v9, v10, v11, v16);

  return v14;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[ULWiFiScanStrategy channels](self, "channels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", channels: %@"), v7);

  v8 = -[ULWiFiScanStrategy scanType](self, "scanType");
  v9 = CFSTR("Invalid");
  if (v8 == 1)
    v9 = CFSTR("ScanTypePassive");
  if (!v8)
    v9 = CFSTR("ScanTypeActive");
  objc_msgSend(v6, "appendFormat:", CFSTR(", scanType: %@"), v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanStrategy numberOfScans](self, "numberOfScans"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfScans: %@"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanStrategy scanIterations](self, "scanIterations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", scanIterations: %@"), v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanStrategy restTimeInMilliSeconds](self, "restTimeInMilliSeconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", restTime: %@"), v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanStrategy dwellTimeMilliSeconds](self, "dwellTimeMilliSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", dwellTime: %@"), v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanStrategy acceptableCacheAge](self, "acceptableCacheAge"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", acceptableCacheAge: %@"), v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanStrategy maximumAge](self, "maximumAge"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", maximumAge: %@"), v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULWiFiScanStrategy isLowPriority](self, "isLowPriority"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isLowPriority: %@"), v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULWiFiScanStrategy isLowLatency](self, "isLowLatency"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isLowLatency: %@"), v17);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULWiFiScanStrategy doAbortOngoingScan](self, "doAbortOngoingScan"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", doAbortOngoingScan: %@"), v18);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)decrementScanIterationsOnWiFiScanComplete
{
  if (-[ULWiFiScanStrategy scanIterations](self, "scanIterations"))
    -[ULWiFiScanStrategy setScanIterations:](self, "setScanIterations:", -[ULWiFiScanStrategy scanIterations](self, "scanIterations") - 1);
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (unint64_t)scanType
{
  return self->_scanType;
}

- (void)setScanType:(unint64_t)a3
{
  self->_scanType = a3;
}

- (unint64_t)numberOfScans
{
  return self->_numberOfScans;
}

- (void)setNumberOfScans:(unint64_t)a3
{
  self->_numberOfScans = a3;
}

- (unint64_t)scanIterations
{
  return self->_scanIterations;
}

- (void)setScanIterations:(unint64_t)a3
{
  self->_scanIterations = a3;
}

- (BOOL)isLowPriority
{
  return self->_isLowPriority;
}

- (void)setIsLowPriority:(BOOL)a3
{
  self->_isLowPriority = a3;
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

- (BOOL)doAbortOngoingScan
{
  return self->_doAbortOngoingScan;
}

- (void)setDoAbortOngoingScan:(BOOL)a3
{
  self->_doAbortOngoingScan = a3;
}

- (unint64_t)restTimeInMilliSeconds
{
  return self->_restTimeInMilliSeconds;
}

- (void)setRestTimeInMilliSeconds:(unint64_t)a3
{
  self->_restTimeInMilliSeconds = a3;
}

- (unint64_t)dwellTimeMilliSeconds
{
  return self->_dwellTimeMilliSeconds;
}

- (void)setDwellTimeMilliSeconds:(unint64_t)a3
{
  self->_dwellTimeMilliSeconds = a3;
}

- (unint64_t)acceptableCacheAge
{
  return self->_acceptableCacheAge;
}

- (void)setAcceptableCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = a3;
}

- (unint64_t)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(unint64_t)a3
{
  self->_maximumAge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
}

@end
