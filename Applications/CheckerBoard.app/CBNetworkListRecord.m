@implementation CBNetworkListRecord

- (CBNetworkListRecord)initWithScanResult:(id)a3
{
  int64_t v5;
  id v6;
  NSString *bootIntentSSID;

  v5 = qword_10008BD40++;
  self->_identifier = v5;
  objc_storeStrong((id *)&self->_scanResult, a3);
  v6 = a3;
  self->_isBootIntentRecord = 0;
  bootIntentSSID = self->_bootIntentSSID;
  self->_bootIntentSSID = (NSString *)&stru_1000769A0;

  self->_isBootIntentPasswordProtected = 0;
  return self;
}

- (CBNetworkListRecord)initWithBootIntentSSID:(id)a3 passwordProtected:(BOOL)a4
{
  NSString *v6;
  int64_t v7;
  CWFScanResult *scanResult;
  NSString *bootIntentSSID;

  v6 = (NSString *)a3;
  v7 = qword_10008BD40++;
  scanResult = self->_scanResult;
  self->_identifier = v7;
  self->_scanResult = 0;

  self->_isBootIntentRecord = 1;
  bootIntentSSID = self->_bootIntentSSID;
  self->_bootIntentSSID = v6;

  self->_isBootIntentPasswordProtected = a4;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CBNetworkListRecord *v4;
  void *v5;
  id v6;
  CBNetworkListRecord *v7;

  v4 = [CBNetworkListRecord alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord scanResult](self, "scanResult"));
  v6 = objc_msgSend(v5, "copy");
  v7 = -[CBNetworkListRecord initWithScanResult:](v4, "initWithScanResult:", v6);

  return v7;
}

- (BOOL)canBeDisplayedAsCurrent
{
  return 0;
}

- (id)hotspotBatteryLife
{
  return &off_100078CB0;
}

- (id)hotspotCellularProtocol
{
  return &stru_1000769A0;
}

- (id)hotspotSignalStrength
{
  return 0;
}

- (BOOL)iOSHotspot
{
  void *v4;
  unsigned __int8 v5;

  if (-[CBNetworkListRecord isBootIntentRecord](self, "isBootIntentRecord"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord scanResult](self, "scanResult"));
  v5 = objc_msgSend(v4, "isPersonalHotspot");

  return v5;
}

- (BOOL)isAdhoc
{
  return 0;
}

- (BOOL)isEnterprise
{
  return 0;
}

- (BOOL)isEquivalentRecord:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ssid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord ssid](self, "ssid"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)isInstantHotspot
{
  return 0;
}

- (BOOL)isKnown
{
  return 0;
}

- (BOOL)isPopular
{
  return 0;
}

- (BOOL)isSecure
{
  void *v3;
  unsigned __int8 v4;

  if (-[CBNetworkListRecord isBootIntentRecord](self, "isBootIntentRecord"))
    return -[CBNetworkListRecord isBootIntentPasswordProtected](self, "isBootIntentPasswordProtected");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord scanResult](self, "scanResult"));
  v4 = objc_msgSend(v3, "requiresPassword");

  return v4;
}

- (BOOL)isUnconfiguredAccessory
{
  return 0;
}

- (BOOL)prominentDisplay
{
  return 0;
}

- (int64_t)rssi
{
  void *v4;
  id v5;

  if (-[CBNetworkListRecord isBootIntentRecord](self, "isBootIntentRecord"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord scanResult](self, "scanResult"));
  v5 = objc_msgSend(v4, "RSSI");

  return (int64_t)v5;
}

- (float)scaledRSSI
{
  void *v4;
  float v5;

  if (-[CBNetworkListRecord isBootIntentRecord](self, "isBootIntentRecord"))
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord scanResult](self, "scanResult"));
  v5 = WFScaleRSSI((int)objc_msgSend(v4, "RSSI"));

  return v5;
}

- (unint64_t)signalBars
{
  return 0;
}

- (id)ssid
{
  void *v3;
  void *v4;

  if (-[CBNetworkListRecord isBootIntentRecord](self, "isBootIntentRecord"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord bootIntentSSID](self, "bootIntentSSID"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord scanResult](self, "scanResult"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "networkName"));

  }
  return v3;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (BOOL)isBootIntentRecord
{
  return self->_isBootIntentRecord;
}

- (NSString)bootIntentSSID
{
  return self->_bootIntentSSID;
}

- (BOOL)isBootIntentPasswordProtected
{
  return self->_isBootIntentPasswordProtected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootIntentSSID, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end
