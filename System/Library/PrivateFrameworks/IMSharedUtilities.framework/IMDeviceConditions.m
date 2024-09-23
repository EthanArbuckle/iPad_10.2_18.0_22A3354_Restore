@implementation IMDeviceConditions

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E30B084;
  block[3] = &unk_1E3FB6278;
  block[4] = a1;
  if (qword_1ECFC74D8 != -1)
    dispatch_once(&qword_1ECFC74D8, block);
  return (id)qword_1ECFC75F8;
}

- (id)_mobileNetworkManager
{
  return (id)objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
}

- (BOOL)isDeviceOnWifi
{
  void *v2;
  char v3;

  -[IMDeviceConditions _mobileNetworkManager](self, "_mobileNetworkManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiUsable");

  return v3;
}

- (BOOL)isDeviceOnData
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D20C10], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataActiveAndReachable");

  return v3;
}

- (BOOL)isOnLowBandwidthCellular
{
  if (-[IMDeviceConditions isDeviceOnWifi](self, "isDeviceOnWifi"))
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel_isDeviceOnData);
}

- (id)_batteryStatus
{
  if (qword_1ECFC6C58 != -1)
    dispatch_once(&qword_1ECFC6C58, &unk_1E3FB3D08);
  return (id)qword_1ECFC6C50;
}

- (BOOL)isDeviceCharging
{
  void *v2;
  char v3;

  -[IMDeviceConditions _batteryStatus](self, "_batteryStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCharging");

  return v3;
}

@end
