@implementation ASDAppEvent

- (id)copyWithZone:(_NSZone *)a3
{
  ASDAppEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = -[ASDAppEvent init](+[ASDAppEvent allocWithZone:](ASDAppEvent, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_accountID, "copyWithZone:", a3);
  -[ASDAppEvent setAccountID:](v5, "setAccountID:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  -[ASDAppEvent setBundleID:](v5, "setBundleID:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  -[ASDAppEvent setBundleVersion:](v5, "setBundleVersion:", v8);

  -[ASDAppEvent setCount:](v5, "setCount:", self->_count);
  v9 = (void *)-[NSString copyWithZone:](self->_cohort, "copyWithZone:", a3);
  -[ASDAppEvent setCohort:](v5, "setCohort:", v9);

  v10 = (void *)-[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  -[ASDAppEvent setDate:](v5, "setDate:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_deviceVendorID, "copyWithZone:", a3);
  -[ASDAppEvent setDeviceVendorID:](v5, "setDeviceVendorID:", v11);

  -[ASDAppEvent setDuration:](v5, "setDuration:", self->_duration);
  -[ASDAppEvent setEventSubtype:](v5, "setEventSubtype:", self->_eventSubtype);
  v12 = (void *)-[NSNumber copyWithZone:](self->_eventTime, "copyWithZone:", a3);
  -[ASDAppEvent setEventTime:](v5, "setEventTime:", v12);

  -[ASDAppEvent setEventType:](v5, "setEventType:", self->_eventType);
  v13 = (void *)-[NSNumber copyWithZone:](self->_evid, "copyWithZone:", a3);
  -[ASDAppEvent setEvid:](v5, "setEvid:", v13);

  -[ASDAppEvent setForegroundUsage:](v5, "setForegroundUsage:", self->_foregroundUsage);
  v14 = (void *)-[NSArray copyWithZone:](self->_foregroundUsageEvents, "copyWithZone:", a3);
  -[ASDAppEvent setForegroundUsageEvents:](v5, "setForegroundUsageEvents:", v14);

  -[ASDAppEvent setHasBeenPosted:](v5, "setHasBeenPosted:", self->_hasBeenPosted);
  v15 = (void *)-[NSString copyWithZone:](self->_appPlatform, "copyWithZone:", a3);
  -[ASDAppEvent setAppPlatform:](v5, "setAppPlatform:", v15);

  -[ASDAppEvent setIsBeta:](v5, "setIsBeta:", self->_isBeta);
  -[ASDAppEvent setIsClip:](v5, "setIsClip:", self->_isClip);
  v16 = (void *)-[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  -[ASDAppEvent setItemID:](v5, "setItemID:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  -[ASDAppEvent setItemName:](v5, "setItemName:", v17);

  v18 = (void *)-[NSNumber copyWithZone:](self->_startTime, "copyWithZone:", a3);
  -[ASDAppEvent setStartTime:](v5, "setStartTime:", v18);

  v19 = (void *)-[NSString copyWithZone:](self->_shortVersion, "copyWithZone:", a3);
  -[ASDAppEvent setShortVersion:](v5, "setShortVersion:", v19);

  v20 = (void *)-[NSNumber copyWithZone:](self->_storefront, "copyWithZone:", a3);
  -[ASDAppEvent setStorefront:](v5, "setStorefront:", v20);

  v21 = (void *)-[NSString copyWithZone:](self->_weekStartDate, "copyWithZone:", a3);
  -[ASDAppEvent setWeekStartDate:](v5, "setWeekStartDate:", v21);

  return v5;
}

- (id)description
{
  NSString *bundleID;
  NSString *bundleVersion;
  NSNumber *itemID;
  NSNumber *evid;
  int64_t eventType;
  NSNumber *eventTime;

  bundleID = self->_bundleID;
  bundleVersion = self->_bundleVersion;
  evid = self->_evid;
  itemID = self->_itemID;
  eventTime = self->_eventTime;
  eventType = self->_eventType;
  if (eventTime)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ bundleID: %@ bundleVersion: %@ itemID: %@ evid: %@ eventType: %ld startTime: %@ eventTime: %@ }"), bundleID, bundleVersion, itemID, evid, eventType, self->_startTime, eventTime);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ bundleID: %@ bundleVersion: %@ itemID: %@ evid: %@ eventType: %ld subtype: %ld count: %ld }"), bundleID, bundleVersion, itemID, evid, eventType, self->_eventSubtype, self->_count);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  -[ASDAppEvent accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[ASDAppEvent appPlatform](self, "appPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("appPlatform"));

  -[ASDAppEvent bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bundleID"));

  -[ASDAppEvent bundleVersion](self, "bundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundleVersion"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDAppEvent count](self, "count"), CFSTR("count"));
  -[ASDAppEvent cohort](self, "cohort");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("cohort"));

  -[ASDAppEvent date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("date"));

  -[ASDAppEvent deviceVendorID](self, "deviceVendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("deviceVendorID"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDAppEvent duration](self, "duration"), CFSTR("duration"));
  -[ASDAppEvent eventTime](self, "eventTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("launchEnd"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDAppEvent eventType](self, "eventType"), CFSTR("eventType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDAppEvent eventSubtype](self, "eventSubtype"), CFSTR("eventSubtype"));
  -[ASDAppEvent evid](self, "evid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("evid"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDAppEvent foregroundUsage](self, "foregroundUsage"), CFSTR("foregroundUsage"));
  -[ASDAppEvent foregroundUsageEvents](self, "foregroundUsageEvents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("foregroundUsageEvents"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAppEvent hasBeenPosted](self, "hasBeenPosted"), CFSTR("hasBeenPosted"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAppEvent isBeta](self, "isBeta"), CFSTR("isBeta"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAppEvent isClip](self, "isClip"), CFSTR("isClip"));
  -[ASDAppEvent itemID](self, "itemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("itemID"));

  -[ASDAppEvent itemName](self, "itemName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("itemName"));

  -[ASDAppEvent startTime](self, "startTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("launchTime"));

  -[ASDAppEvent shortVersion](self, "shortVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("shortVersion"));

  -[ASDAppEvent storefront](self, "storefront");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("storefront"));

  -[ASDAppEvent weekStartDate](self, "weekStartDate");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("weekStartDate"));

}

- (ASDAppEvent)initWithCoder:(id)a3
{
  id v4;
  ASDAppEvent *v5;
  uint64_t v6;
  NSString *accountID;
  uint64_t v8;
  NSString *appPlatform;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *bundleVersion;
  uint64_t v14;
  NSString *cohort;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  NSString *deviceVendorID;
  uint64_t v20;
  NSNumber *eventTime;
  uint64_t v22;
  NSNumber *evid;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *foregroundUsageEvents;
  uint64_t v29;
  NSNumber *itemID;
  uint64_t v31;
  NSString *itemName;
  uint64_t v33;
  NSNumber *startTime;
  uint64_t v35;
  NSString *shortVersion;
  uint64_t v37;
  NSNumber *storefront;
  uint64_t v39;
  NSString *weekStartDate;
  objc_super v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ASDAppEvent;
  v5 = -[ASDAppEvent init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appPlatform"));
    v8 = objc_claimAutoreleasedReturnValue();
    appPlatform = v5->_appPlatform;
    v5->_appPlatform = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v12;

    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cohort"));
    v14 = objc_claimAutoreleasedReturnValue();
    cohort = v5->_cohort;
    v5->_cohort = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v16 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceVendorID"));
    v18 = objc_claimAutoreleasedReturnValue();
    deviceVendorID = v5->_deviceVendorID;
    v5->_deviceVendorID = (NSString *)v18;

    v5->_duration = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("duration"));
    v5->_eventSubtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventSubtype"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchEnd"));
    v20 = objc_claimAutoreleasedReturnValue();
    eventTime = v5->_eventTime;
    v5->_eventTime = (NSNumber *)v20;

    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("evid"));
    v22 = objc_claimAutoreleasedReturnValue();
    evid = v5->_evid;
    v5->_evid = (NSNumber *)v22;

    v5->_foregroundUsage = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("foregroundUsage"));
    v24 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    v43[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("foregroundUsageEvents"));
    v27 = objc_claimAutoreleasedReturnValue();
    foregroundUsageEvents = v5->_foregroundUsageEvents;
    v5->_foregroundUsageEvents = (NSArray *)v27;

    v5->_hasBeenPosted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBeenPosted"));
    v5->_isBeta = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBeta"));
    v5->_isClip = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isClip"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v29 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
    v31 = objc_claimAutoreleasedReturnValue();
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchTime"));
    v33 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSNumber *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortVersion"));
    v35 = objc_claimAutoreleasedReturnValue();
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefront"));
    v37 = objc_claimAutoreleasedReturnValue();
    storefront = v5->_storefront;
    v5->_storefront = (NSNumber *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weekStartDate"));
    v39 = objc_claimAutoreleasedReturnValue();
    weekStartDate = v5->_weekStartDate;
    v5->_weekStartDate = (NSString *)v39;

  }
  return v5;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appPlatform
{
  return self->_appPlatform;
}

- (void)setAppPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cohort
{
  return self->_cohort;
}

- (void)setCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceVendorID
{
  return self->_deviceVendorID;
}

- (void)setDeviceVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (int64_t)foregroundUsage
{
  return self->_foregroundUsage;
}

- (void)setForegroundUsage:(int64_t)a3
{
  self->_foregroundUsage = a3;
}

- (NSArray)foregroundUsageEvents
{
  return self->_foregroundUsageEvents;
}

- (void)setForegroundUsageEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)eventSubtype
{
  return self->_eventSubtype;
}

- (void)setEventSubtype:(int64_t)a3
{
  self->_eventSubtype = a3;
}

- (NSNumber)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSNumber)evid
{
  return self->_evid;
}

- (void)setEvid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)hasBeenPosted
{
  return self->_hasBeenPosted;
}

- (void)setHasBeenPosted:(BOOL)a3
{
  self->_hasBeenPosted = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (void)setIsClip:(BOOL)a3
{
  self->_isClip = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)weekStartDate
{
  return self->_weekStartDate;
}

- (void)setWeekStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekStartDate, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_foregroundUsageEvents, 0);
  objc_storeStrong((id *)&self->_deviceVendorID, 0);
  objc_storeStrong((id *)&self->_cohort, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appPlatform, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
