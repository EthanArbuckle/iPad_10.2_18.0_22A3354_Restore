@implementation ASDBetaAppFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *comments;
  id v5;

  comments = self->_comments;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", comments, CFSTR("A"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_email, CFSTR("B"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imagesData, CFSTR("C"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_incidentID, CFSTR("D"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timestamp, CFSTR("E"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("F"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_appUptime, CFSTR("H"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appVersion, CFSTR("I"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedWatchModel, CFSTR("J"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedWatchOSVersion, CFSTR("K"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_architecture, CFSTR("L"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_batteryPercentage, CFSTR("M"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_carrier, CFSTR("N"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cellularNetworkType, CFSTR("O"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceType, CFSTR("P"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_diskAvailable, CFSTR("Q"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_diskTotal, CFSTR("R"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("S"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_networkConnectionType, CFSTR("T"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersion, CFSTR("U"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_screenHeight, CFSTR("V"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_screenWidth, CFSTR("W"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("X"));

}

- (ASDBetaAppFeedback)initWithCoder:(id)a3
{
  id v4;
  ASDBetaAppFeedback *v5;
  uint64_t v6;
  NSString *comments;
  uint64_t v8;
  NSString *email;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *imagesData;
  uint64_t v15;
  NSString *incidentID;
  uint64_t v17;
  NSString *bundleID;
  uint64_t v19;
  ASDBetaAppVersion *appVersion;
  uint64_t v21;
  NSString *pairedWatchModel;
  uint64_t v23;
  NSString *pairedWatchOSVersion;
  uint64_t v25;
  NSString *architecture;
  uint64_t v27;
  NSString *carrier;
  uint64_t v29;
  NSString *cellularNetworkType;
  uint64_t v31;
  NSString *deviceType;
  uint64_t v33;
  NSString *locale;
  uint64_t v35;
  NSString *networkConnectionType;
  uint64_t v37;
  NSString *osVersion;
  uint64_t v39;
  NSString *timeZone;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ASDBetaAppFeedback;
  v5 = -[ASDBetaAppFeedback init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v6 = objc_claimAutoreleasedReturnValue();
    comments = v5->_comments;
    v5->_comments = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v8 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("C"));
    v13 = objc_claimAutoreleasedReturnValue();
    imagesData = v5->_imagesData;
    v5->_imagesData = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("D"));
    v15 = objc_claimAutoreleasedReturnValue();
    incidentID = v5->_incidentID;
    v5->_incidentID = (NSString *)v15;

    v5->_timestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("E"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("F"));
    v17 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v17;

    v5->_appUptime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("H"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("I"));
    v19 = objc_claimAutoreleasedReturnValue();
    appVersion = v5->_appVersion;
    v5->_appVersion = (ASDBetaAppVersion *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("J"));
    v21 = objc_claimAutoreleasedReturnValue();
    pairedWatchModel = v5->_pairedWatchModel;
    v5->_pairedWatchModel = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("K"));
    v23 = objc_claimAutoreleasedReturnValue();
    pairedWatchOSVersion = v5->_pairedWatchOSVersion;
    v5->_pairedWatchOSVersion = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("L"));
    v25 = objc_claimAutoreleasedReturnValue();
    architecture = v5->_architecture;
    v5->_architecture = (NSString *)v25;

    v5->_batteryPercentage = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("M"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("N"));
    v27 = objc_claimAutoreleasedReturnValue();
    carrier = v5->_carrier;
    v5->_carrier = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("O"));
    v29 = objc_claimAutoreleasedReturnValue();
    cellularNetworkType = v5->_cellularNetworkType;
    v5->_cellularNetworkType = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("P"));
    v31 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v31;

    v5->_diskAvailable = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Q"));
    v5->_diskTotal = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("R"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("S"));
    v33 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("T"));
    v35 = objc_claimAutoreleasedReturnValue();
    networkConnectionType = v5->_networkConnectionType;
    v5->_networkConnectionType = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("U"));
    v37 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v37;

    v5->_screenHeight = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("V"));
    v5->_screenWidth = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("W"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("X"));
    v39 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSString *)v39;

  }
  return v5;
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)email
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEmail:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)imagesData
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImagesData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)incidentID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncidentID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)appUptime
{
  return self->_appUptime;
}

- (void)setAppUptime:(unint64_t)a3
{
  self->_appUptime = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)pairedWatchModel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPairedWatchModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)pairedWatchOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPairedWatchOSVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)architecture
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setArchitecture:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (unsigned)batteryPercentage
{
  return self->_batteryPercentage;
}

- (void)setBatteryPercentage:(unsigned int)a3
{
  self->_batteryPercentage = a3;
}

- (NSString)carrier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCarrier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)cellularNetworkType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCellularNetworkType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (unint64_t)diskAvailable
{
  return self->_diskAvailable;
}

- (void)setDiskAvailable:(unint64_t)a3
{
  self->_diskAvailable = a3;
}

- (unint64_t)diskTotal
{
  return self->_diskTotal;
}

- (void)setDiskTotal:(unint64_t)a3
{
  self->_diskTotal = a3;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)networkConnectionType
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNetworkConnectionType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (unsigned)screenHeight
{
  return self->_screenHeight;
}

- (void)setScreenHeight:(unsigned int)a3
{
  self->_screenHeight = a3;
}

- (unsigned)screenWidth
{
  return self->_screenWidth;
}

- (void)setScreenWidth:(unsigned int)a3
{
  self->_screenWidth = a3;
}

- (NSString)timeZone
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (ASDBetaAppVersion)appVersion
{
  return (ASDBetaAppVersion *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_networkConnectionType, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_cellularNetworkType, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_architecture, 0);
  objc_storeStrong((id *)&self->_pairedWatchOSVersion, 0);
  objc_storeStrong((id *)&self->_pairedWatchModel, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
  objc_storeStrong((id *)&self->_imagesData, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_comments, 0);
}

@end
