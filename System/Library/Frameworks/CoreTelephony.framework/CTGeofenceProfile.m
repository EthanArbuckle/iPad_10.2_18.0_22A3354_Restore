@implementation CTGeofenceProfile

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  const char *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTGeofenceProfile dataSetName](self, "dataSetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataSetName=%@"), v4);

  -[CTGeofenceProfile versionNumber](self, "versionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", versionNumber=%@"), v5);

  -[CTGeofenceProfile csgNetworkIdentifier](self, "csgNetworkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", csgNetworkIdentifier=%@"), v6);

  -[CTGeofenceProfile networkIdentifier](self, "networkIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", networkIdentifier=%@"), v7);

  -[CTGeofenceProfile geofenceList](self, "geofenceList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", geofenceList=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(", cellularDataPreferred=%d"), -[CTGeofenceProfile cellularDataPreferred](self, "cellularDataPreferred"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", enableNRStandalone=%d"), -[CTGeofenceProfile enableNRStandalone](self, "enableNRStandalone"));
  v9 = -[CTGeofenceProfile NRStandaloneMode](self, "NRStandaloneMode");
  v10 = "CTNRStandaloneModeEnabled";
  if (v9 == 2)
    v10 = "CTNRStandaloneModeDisabled";
  if (!v9)
    v10 = "CTNRStandaloneModeUnknown";
  objc_msgSend(v3, "appendFormat:", CFSTR(", NRStandalonemode=%s"), v10);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
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
  -[CTGeofenceProfile dataSetName](self, "dataSetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("dataSetName"));

  -[CTGeofenceProfile versionNumber](self, "versionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("versionNumber"));

  -[CTGeofenceProfile csgNetworkIdentifier](self, "csgNetworkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("csgNetworkIdentifier"));

  -[CTGeofenceProfile networkIdentifier](self, "networkIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("networkIdentifier"));

  -[CTGeofenceProfile geofenceList](self, "geofenceList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("geofenceList"));

  objc_msgSend(v9, "encodeBool:forKey:", -[CTGeofenceProfile cellularDataPreferred](self, "cellularDataPreferred"), CFSTR("cellularDataPreferred"));
  objc_msgSend(v9, "encodeBool:forKey:", -[CTGeofenceProfile enableNRStandalone](self, "enableNRStandalone"), CFSTR("enableNRStandalone"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[CTGeofenceProfile NRStandaloneMode](self, "NRStandaloneMode"), CFSTR("NRStandaloneMode"));

}

- (CTGeofenceProfile)initWithCoder:(id)a3
{
  id v4;
  CTGeofenceProfile *v5;
  uint64_t v6;
  NSString *dataSetName;
  uint64_t v8;
  NSString *versionNumber;
  uint64_t v10;
  NSString *csgNetworkIdentifier;
  uint64_t v12;
  NSString *networkIdentifier;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *geofenceList;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CTGeofenceProfile;
  v5 = -[CTGeofenceProfile init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataSetName"));
    v6 = objc_claimAutoreleasedReturnValue();
    dataSetName = v5->_dataSetName;
    v5->_dataSetName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("versionNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    versionNumber = v5->_versionNumber;
    v5->_versionNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("csgNetworkIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    csgNetworkIdentifier = v5->_csgNetworkIdentifier;
    v5->_csgNetworkIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    networkIdentifier = v5->_networkIdentifier;
    v5->_networkIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("geofenceList"));
    v17 = objc_claimAutoreleasedReturnValue();
    geofenceList = v5->_geofenceList;
    v5->_geofenceList = (NSArray *)v17;

    v5->_cellularDataPreferred = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellularDataPreferred"));
    v5->_enableNRStandalone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableNRStandalone"));
    v5->_NRStandaloneMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NRStandaloneMode"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)dataSetName
{
  return self->_dataSetName;
}

- (void)setDataSetName:(id)a3
{
  objc_storeStrong((id *)&self->_dataSetName, a3);
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_versionNumber, a3);
}

- (NSString)csgNetworkIdentifier
{
  return self->_csgNetworkIdentifier;
}

- (void)setCsgNetworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, a3);
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkIdentifier, a3);
}

- (NSArray)geofenceList
{
  return self->_geofenceList;
}

- (void)setGeofenceList:(id)a3
{
  objc_storeStrong((id *)&self->_geofenceList, a3);
}

- (BOOL)cellularDataPreferred
{
  return self->_cellularDataPreferred;
}

- (void)setCellularDataPreferred:(BOOL)a3
{
  self->_cellularDataPreferred = a3;
}

- (BOOL)enableNRStandalone
{
  return self->_enableNRStandalone;
}

- (void)setEnableNRStandalone:(BOOL)a3
{
  self->_enableNRStandalone = a3;
}

- (int64_t)NRStandaloneMode
{
  return self->_NRStandaloneMode;
}

- (void)setNRStandaloneMode:(int64_t)a3
{
  self->_NRStandaloneMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geofenceList, 0);
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_dataSetName, 0);
}

@end
