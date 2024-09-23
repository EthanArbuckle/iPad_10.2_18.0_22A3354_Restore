@implementation MAAutoAssetSetPolicy

- (MAAutoAssetSetPolicy)init
{
  MAAutoAssetSetPolicy *v2;
  MAAutoAssetSetPolicy *v3;
  NSDictionary *additionalPolicyControl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MAAutoAssetSetPolicy;
  v2 = -[MAAutoAssetSetPolicy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_blockCheckDownload = 0;
    *(_QWORD *)&v2->_userInitiated = 0;
    additionalPolicyControl = v2->_additionalPolicyControl;
    v2->_additionalPolicyControl = 0;

  }
  return v3;
}

- (MAAutoAssetSetPolicy)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetPolicy *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *additionalPolicyControl;
  objc_super v12;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetSetPolicy;
  v5 = -[MAAutoAssetSetPolicy init](&v12, sel_init);
  if (v5)
  {
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v5->_lockInhibitsEmergencyRemoval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockInhibitsEmergencyRemoval"));
    v5->_supportingShortTermLocks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportingShortTermLocks"));
    v5->_allowCheckDownloadOnBattery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCheckDownloadOnBattery"));
    v5->_allowCheckDownloadWhenBatteryLow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCheckDownloadWhenBatteryLow"));
    v5->_allowCheckDownloadWhenCPUHigh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCheckDownloadWhenCPUHigh"));
    v5->_allowCheckDownloadOverExpensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCheckDownloadOverExpensive"));
    v5->_allowCheckDownloadOverCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCheckDownloadOverCellular"));
    v5->_blockCheckDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockCheckDownload"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("additionalPolicyControl"));
    v9 = objc_claimAutoreleasedReturnValue();
    additionalPolicyControl = v5->_additionalPolicyControl;
    v5->_additionalPolicyControl = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy userInitiated](self, "userInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"), CFSTR("lockInhibitsEmergencyRemoval"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks"), CFSTR("supportingShortTermLocks"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"), CFSTR("allowCheckDownloadOnBattery"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"), CFSTR("allowCheckDownloadWhenBatteryLow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"), CFSTR("allowCheckDownloadWhenCPUHigh"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"), CFSTR("allowCheckDownloadOverExpensive"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"), CFSTR("allowCheckDownloadOverCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"), CFSTR("blockCheckDownload"));
  -[MAAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("additionalPolicyControl"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MAAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[MAAutoAssetSetPolicy summary](self, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@|additional:\n%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MAAutoAssetSetPolicy summary](self, "summary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v19;
  id v20;

  -[MAAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("(w/additional)");
  if (!v3)
    v4 = &stru_1E5D5F930;
  v5 = v4;

  v6 = CFSTR("N");
  if (-[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")
    && -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")
    && -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
    && -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
    && -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
    && -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
    && -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
    && -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    v7 = CFSTR("allOtherBool:Y");
  }
  else if (-[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")
         || -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")
         || -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
         || -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
         || -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
         || -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
         || -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
         || -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (-[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"))
      v8 = CFSTR("Y");
    else
      v8 = CFSTR("N");
    v19 = v8;
    if (-[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks"))
      v9 = CFSTR("Y");
    else
      v9 = CFSTR("N");
    if (-[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"))
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
    if (-[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"))
      v11 = CFSTR("Y");
    else
      v11 = CFSTR("N");
    if (-[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"))
      v12 = CFSTR("Y");
    else
      v12 = CFSTR("N");
    if (-[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"))
      v13 = CFSTR("Y");
    else
      v13 = CFSTR("N");
    if (-[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"))
      v6 = CFSTR("Y");
    if (-[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
      v14 = CFSTR("Y");
    else
      v14 = CFSTR("N");
    v7 = (__CFString *)objc_msgSend(v20, "initWithFormat:", CFSTR("|lockInhibitsRemoval:%@|supportingShortTermLocks:%@|allowCheckDownload(OnBattery:%@,WhenBatteryLow:%@,WhenCPUHigh:%@,OverExpensive:%@,OverCellular:%@)|blockCheckDownload:%@|"), v19, v9, v10, v11, v12, v13, v6, v14);
  }
  else
  {
    v7 = CFSTR("allOtherBool:N");
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  if (-[MAAutoAssetSetPolicy userInitiated](self, "userInitiated"))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("user:%@|%@%@"), v16, v7, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)lockInhibitsEmergencyRemoval
{
  return self->_lockInhibitsEmergencyRemoval;
}

- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3
{
  self->_lockInhibitsEmergencyRemoval = a3;
}

- (BOOL)supportingShortTermLocks
{
  return self->_supportingShortTermLocks;
}

- (void)setSupportingShortTermLocks:(BOOL)a3
{
  self->_supportingShortTermLocks = a3;
}

- (BOOL)allowCheckDownloadOnBattery
{
  return self->_allowCheckDownloadOnBattery;
}

- (void)setAllowCheckDownloadOnBattery:(BOOL)a3
{
  self->_allowCheckDownloadOnBattery = a3;
}

- (BOOL)allowCheckDownloadWhenBatteryLow
{
  return self->_allowCheckDownloadWhenBatteryLow;
}

- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3
{
  self->_allowCheckDownloadWhenBatteryLow = a3;
}

- (BOOL)allowCheckDownloadWhenCPUHigh
{
  return self->_allowCheckDownloadWhenCPUHigh;
}

- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3
{
  self->_allowCheckDownloadWhenCPUHigh = a3;
}

- (BOOL)allowCheckDownloadOverExpensive
{
  return self->_allowCheckDownloadOverExpensive;
}

- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3
{
  self->_allowCheckDownloadOverExpensive = a3;
}

- (BOOL)allowCheckDownloadOverCellular
{
  return self->_allowCheckDownloadOverCellular;
}

- (void)setAllowCheckDownloadOverCellular:(BOOL)a3
{
  self->_allowCheckDownloadOverCellular = a3;
}

- (BOOL)blockCheckDownload
{
  return self->_blockCheckDownload;
}

- (void)setBlockCheckDownload:(BOOL)a3
{
  self->_blockCheckDownload = a3;
}

- (BOOL)blockCheckDownloadWhenRecentUserActivity
{
  return self->_blockCheckDownloadWhenRecentUserActivity;
}

- (void)setBlockCheckDownloadWhenRecentUserActivity:(BOOL)a3
{
  self->_blockCheckDownloadWhenRecentUserActivity = a3;
}

- (BOOL)preferCheckDownloadOverWiFi
{
  return self->_preferCheckDownloadOverWiFi;
}

- (void)setPreferCheckDownloadOverWiFi:(BOOL)a3
{
  self->_preferCheckDownloadOverWiFi = a3;
}

- (BOOL)restrictCheckDownloadToNetwork
{
  return self->_restrictCheckDownloadToNetwork;
}

- (void)setRestrictCheckDownloadToNetwork:(BOOL)a3
{
  self->_restrictCheckDownloadToNetwork = a3;
}

- (NSDictionary)additionalPolicyControl
{
  return self->_additionalPolicyControl;
}

- (void)setAdditionalPolicyControl:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPolicyControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPolicyControl, 0);
}

@end
