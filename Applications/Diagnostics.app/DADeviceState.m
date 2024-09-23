@implementation DADeviceState

- (DADeviceState)init
{
  DADeviceState *v2;
  DADeviceState *v3;
  NSString *diagnosticEventID;
  NSNumber *suiteID;
  NSString *suiteName;
  NSString *suiteDescription;
  NSArray *suitesAvailable;
  NSNumber *progress;
  NSArray *history;
  NSArray *errors;
  NSNumber *timestamp;
  NSDictionary *attributes;
  NSString *serialNumber;
  uint64_t v15;
  uint64_t v16;
  DASessionSettings *sessionSettings;
  dispatch_queue_t v18;
  OS_dispatch_queue *notificationQueue;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)DADeviceState;
  v2 = -[DADeviceState init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    v2->_phase = 0;
    diagnosticEventID = v2->_diagnosticEventID;
    v2->_diagnosticEventID = 0;

    suiteID = v3->_suiteID;
    v3->_suiteID = 0;

    suiteName = v3->_suiteName;
    v3->_suiteName = 0;

    suiteDescription = v3->_suiteDescription;
    v3->_suiteDescription = 0;

    suitesAvailable = v3->_suitesAvailable;
    v3->_suitesAvailable = (NSArray *)&__NSArray0__struct;

    progress = v3->_progress;
    v3->_progress = (NSNumber *)&off_10013F7D8;

    v3->_durationRemaining = 0.0;
    history = v3->_history;
    v3->_history = (NSArray *)&__NSArray0__struct;

    errors = v3->_errors;
    v3->_errors = (NSArray *)&__NSArray0__struct;

    timestamp = v3->_timestamp;
    v3->_timestamp = 0;

    attributes = v3->_attributes;
    v3->_attributes = (NSDictionary *)&__NSDictionary0__struct;

    serialNumber = v3->_serialNumber;
    v3->_serialNumber = (NSString *)CFSTR("unknown");

    v16 = objc_opt_new(DASessionSettings, v15);
    sessionSettings = v3->_sessionSettings;
    v3->_sessionSettings = (DASessionSettings *)v16;

    v3->_pendingChanges = 0;
    v3->_freezeNotifications = 0;
    v18 = dispatch_queue_create("com.apple.Diagnostics.deviceState.notificationQueue", 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v18;

  }
  return v3;
}

- (DADeviceState)initWithSerialNumber:(id)a3 attributes:(id)a4
{
  id v7;
  id v8;
  DADeviceState *v9;
  DADeviceState *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[DADeviceState init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serialNumber, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (DADeviceState)initWithDEDDevice:(id)a3
{
  id v4;
  DADeviceState *v5;
  uint64_t v6;
  NSString *serialNumber;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *attributes;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[7];

  v4 = a3;
  v5 = -[DADeviceState init](self, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    v20[0] = CFSTR("productClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceClass"));
    v21[0] = v19;
    v20[1] = CFSTR("IMEI");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v21[1] = v8;
    v20[2] = CFSTR("marketingName");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v21[2] = v9;
    v20[3] = CFSTR("deviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productType"));
    v21[3] = v10;
    v20[4] = CFSTR("deviceClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceClass"));
    v21[4] = v11;
    v20[5] = CFSTR("deviceEnclosureColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosureColor"));
    v13 = v12;
    if (!v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v21[5] = v13;
    v20[6] = CFSTR("deviceColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
    v15 = v14;
    if (!v14)
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v21[6] = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 7));
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v16;

    if (!v14)
    if (!v12)

  }
  return v5;
}

- (DADeviceState)initWithCoder:(id)a3
{
  id v4;
  DADeviceState *v5;
  id v6;
  uint64_t v7;
  NSString *diagnosticEventID;
  id v9;
  uint64_t v10;
  NSNumber *suiteID;
  id v12;
  uint64_t v13;
  NSString *suiteName;
  id v15;
  uint64_t v16;
  NSString *suiteDescription;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  uint64_t v21;
  NSArray *suitesAvailable;
  id v23;
  uint64_t v24;
  NSNumber *progress;
  double v26;
  uint64_t v27;
  NSSet *v28;
  void *v29;
  uint64_t v30;
  NSArray *history;
  uint64_t v32;
  NSSet *v33;
  void *v34;
  uint64_t v35;
  NSArray *errors;
  id v37;
  uint64_t v38;
  NSNumber *timestamp;
  id v40;
  uint64_t v41;
  NSString *serialNumber;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSSet *v48;
  void *v49;
  uint64_t v50;
  NSDictionary *attributes;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  DASessionSettings *sessionSettings;

  v4 = a3;
  v5 = -[DADeviceState init](self, "init");
  if (v5)
  {
    v5->_phase = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("phase"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("diagnosticEventID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    diagnosticEventID = v5->_diagnosticEventID;
    v5->_diagnosticEventID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("suiteID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    suiteID = v5->_suiteID;
    v5->_suiteID = (NSNumber *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("suiteName"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    suiteName = v5->_suiteName;
    v5->_suiteName = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("suiteDescription"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    suiteDescription = v5->_suiteDescription;
    v5->_suiteDescription = (NSString *)v16;

    v18 = objc_opt_class(NSArray);
    v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(ASTSuite), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("suitesAvailable")));
    suitesAvailable = v5->_suitesAvailable;
    v5->_suitesAvailable = (NSArray *)v21;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("progress"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    progress = v5->_progress;
    v5->_progress = (NSNumber *)v24;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("durationRemaining"));
    v5->_durationRemaining = v26;
    v27 = objc_opt_class(NSArray);
    v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, objc_opt_class(DAHistoryEntry), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("history")));
    history = v5->_history;
    v5->_history = (NSArray *)v30;

    v32 = objc_opt_class(NSArray);
    v33 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, objc_opt_class(NSError), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("errors")));
    errors = v5->_errors;
    v5->_errors = (NSArray *)v35;

    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("timestamp"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v38;

    v5->_pendingChanges = 0;
    v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("serialNumber"));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v41;

    v43 = objc_opt_class(NSDictionary);
    v44 = objc_opt_class(NSNull);
    v45 = objc_opt_class(NSString);
    v46 = objc_opt_class(NSNumber);
    v47 = objc_opt_class(NSArray);
    v48 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v43, v44, v45, v46, v47, objc_opt_class(NSDateComponents), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("attributes")));
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v50;

    if (!v5->_attributes)
    {
      v5->_attributes = (NSDictionary *)&__NSDictionary0__struct;

    }
    if (!v5->_serialNumber)
    {
      v5->_serialNumber = (NSString *)CFSTR("unknown");

    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[DASessionSettings acceptableValueClasses](DASessionSettings, "acceptableValueClasses"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("sessionSettings")));

    v54 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
    {
      v55 = objc_claimAutoreleasedReturnValue(+[DASessionSettings sessionSettingsWithDictionary:](DASessionSettings, "sessionSettingsWithDictionary:", v53));
      sessionSettings = v5->_sessionSettings;
      v5->_sessionSettings = (DASessionSettings *)v55;

    }
  }

  return v5;
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
  id v17;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DADeviceState phase](self, "phase"), CFSTR("phase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState diagnosticEventID](self, "diagnosticEventID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("diagnosticEventID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteID](self, "suiteID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("suiteID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteName](self, "suiteName"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("suiteName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteDescription](self, "suiteDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("suiteDescription"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suitesAvailable](self, "suitesAvailable"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("suitesAvailable"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState progress](self, "progress"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("progress"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState history](self, "history"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("history"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("errors"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState timestamp](self, "timestamp"));
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("timestamp"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState attributes](self, "attributes"));
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("attributes"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState serialNumber](self, "serialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("serialNumber"));

  v17 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceState sessionSettings](self, "sessionSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dictionary"));
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("sessionSettings"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[4] = self->_phase;
  v6 = -[NSString copyWithZone:](self->_diagnosticEventID, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSNumber copyWithZone:](self->_suiteID, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSString copyWithZone:](self->_suiteName, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[NSString copyWithZone:](self->_suiteDescription, "copyWithZone:", a3);
  v13 = (void *)v5[10];
  v5[10] = v12;

  v14 = -[NSArray copyWithZone:](self->_suitesAvailable, "copyWithZone:", a3);
  v15 = (void *)v5[12];
  v5[12] = v14;

  v16 = -[NSNumber copyWithZone:](self->_progress, "copyWithZone:", a3);
  v17 = (void *)v5[13];
  v5[13] = v16;

  v5[14] = *(_QWORD *)&self->_durationRemaining;
  v18 = -[NSArray copyWithZone:](self->_history, "copyWithZone:", a3);
  v19 = (void *)v5[16];
  v5[16] = v18;

  v20 = -[NSArray copyWithZone:](self->_errors, "copyWithZone:", a3);
  v21 = (void *)v5[17];
  v5[17] = v20;

  v22 = -[NSNumber copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v23 = (void *)v5[18];
  v5[18] = v22;

  v24 = -[NSDictionary copyWithZone:](self->_attributes, "copyWithZone:", a3);
  v25 = (void *)v5[6];
  v5[6] = v24;

  v26 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v27 = (void *)v5[5];
  v5[5] = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings dictionary](self->_sessionSettings, "dictionary"));
  v29 = objc_msgSend(v28, "copyWithZone:", a3);
  v30 = objc_claimAutoreleasedReturnValue(+[DASessionSettings sessionSettingsWithDictionary:](DASessionSettings, "sessionSettingsWithDictionary:", v29));
  v31 = (void *)v5[15];
  v5[15] = v30;

  return v5;
}

- (void)setPhase:(int64_t)a3
{
  DADeviceState *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_phase != a3)
  {
    obj->_phase = a3;
    obj->_pendingChanges |= 1uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](obj, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(obj);

}

- (void)setDiagnosticEventID:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_diagnosticEventID, v6))
  {
    objc_storeStrong((id *)&v5->_diagnosticEventID, a3);
    v5->_pendingChanges |= 0x200uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setSuiteID:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suiteID, v6))
  {
    objc_storeStrong((id *)&v5->_suiteID, a3);
    v5->_pendingChanges |= 0x400uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setSuitesAvailable:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suitesAvailable, v6))
  {
    objc_storeStrong((id *)&v5->_suitesAvailable, a3);
    v5->_pendingChanges |= 0x800uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setSuiteName:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suiteName, v6))
  {
    objc_storeStrong((id *)&v5->_suiteName, a3);
    v5->_pendingChanges |= 2uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setSuiteDescription:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suiteDescription, v6))
  {
    objc_storeStrong((id *)&v5->_suiteDescription, a3);
    v5->_pendingChanges |= 4uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setProgress:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_progress, v6))
  {
    objc_storeStrong((id *)&v5->_progress, a3);
    v5->_pendingChanges |= 8uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setDurationRemaining:(double)a3
{
  DADeviceState *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_durationRemaining != a3)
  {
    obj->_durationRemaining = a3;
    obj->_pendingChanges |= 0x100uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](obj, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(obj);

}

- (void)setSessionSettings:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_sessionSettings, v6))
  {
    objc_storeStrong((id *)&v5->_sessionSettings, a3);
    v5->_pendingChanges |= 0x10uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setHistory:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_history, v6))
  {
    objc_storeStrong((id *)&v5->_history, a3);
    v5->_pendingChanges |= 0x20uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setErrors:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_errors, v6))
  {
    objc_storeStrong((id *)&v5->_errors, a3);
    v5->_pendingChanges |= 0x40uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (void)setTimestamp:(id)a3
{
  DADeviceState *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_timestamp, v6))
  {
    objc_storeStrong((id *)&v5->_timestamp, a3);
    v5->_pendingChanges |= 0x80uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }
  objc_sync_exit(v5);

}

- (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return 1;
}

- (void)transactionWithBlock:(id)a3
{
  void (**v4)(id, _BYTE *);
  _BYTE *v5;

  v4 = (void (**)(id, _BYTE *))a3;
  v5 = -[DADeviceState copy](self, "copy");
  v5[16] = 1;
  v4[2](v4, v5);

  -[DADeviceState updateWithDeviceState:](self, "updateWithDeviceState:", v5);
}

- (void)updateWithDeviceState:(id)a3
{
  DADeviceState *v4;
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
  id v15;

  v15 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v4->_freezeNotifications = 1;
  -[DADeviceState setPhase:](v4, "setPhase:", objc_msgSend(v15, "phase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "diagnosticEventID"));
  -[DADeviceState setDiagnosticEventID:](v4, "setDiagnosticEventID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suiteID"));
  -[DADeviceState setSuiteID:](v4, "setSuiteID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suiteName"));
  -[DADeviceState setSuiteName:](v4, "setSuiteName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suiteDescription"));
  -[DADeviceState setSuiteDescription:](v4, "setSuiteDescription:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suitesAvailable"));
  -[DADeviceState setSuitesAvailable:](v4, "setSuitesAvailable:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "progress"));
  -[DADeviceState setProgress:](v4, "setProgress:", v10);

  objc_msgSend(v15, "durationRemaining");
  -[DADeviceState setDurationRemaining:](v4, "setDurationRemaining:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionSettings"));
  -[DADeviceState setSessionSettings:](v4, "setSessionSettings:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "history"));
  -[DADeviceState setHistory:](v4, "setHistory:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "errors"));
  -[DADeviceState setErrors:](v4, "setErrors:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timestamp"));
  -[DADeviceState setTimestamp:](v4, "setTimestamp:", v14);

  -[DADeviceState _sendChangeNotification](v4, "_sendChangeNotification");
  v4->_freezeNotifications = 0;
  objc_sync_exit(v4);

}

- (void)addErrorCode:(int64_t)a3 userInfo:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DADeviceStateErrorDomain"), a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", v6));
  -[DADeviceState setErrors:](self, "setErrors:", v9);

  objc_sync_exit(v7);
}

- (void)removeErrorCode:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  -[DADeviceState removeErrorCodes:](self, "removeErrorCodes:", v4);

}

- (void)removeErrorCodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "code", obj)));
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if ((v13 & 1) == 0)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v6, "copy");
  -[DADeviceState setErrors:](self, "setErrors:", v14);

  objc_sync_exit(obj);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  void *v18;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState _stringForPhase:](self, "_stringForPhase:", -[DADeviceState phase](self, "phase")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState diagnosticEventID](self, "diagnosticEventID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteID](self, "suiteID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteName](self, "suiteName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteDescription](self, "suiteDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suitesAvailable](self, "suitesAvailable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState progress](self, "progress"));
  -[DADeviceState durationRemaining](self, "durationRemaining");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState sessionSettings](self, "sessionSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState history](self, "history"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState timestamp](self, "timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState attributes](self, "attributes"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("phase: %@; diagnosticEventID: %@; suiteID: %@; suiteName: %@; suiteDescription: %@; suitesAvailable: %@; progress: %@; durationRemaining: %f; sessionSettings: %@; history: %@; errors: %@; timestamp: %@; attributes: %@"),
                v18,
                v17,
                v3,
                v4,
                v5,
                v6,
                v7,
                v9,
                v10,
                v11,
                v12,
                v13,
                v14));

  return v16;
}

- (id)_stringForPhase:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("unknown");
  else
    return *(&off_100133A18 + a3);
}

- (void)_sendChangeNotificationIfNeeded
{
  if (!self->_freezeNotifications)
    -[DADeviceState _sendChangeNotification](self, "_sendChangeNotification");
}

- (void)_sendChangeNotification
{
  unint64_t pendingChanges;
  id v4;
  void *v5;
  NSObject *notificationQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  pendingChanges = self->_pendingChanges;
  v4 = -[DADeviceState copy](self, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DADeviceStateChangeNotificationInfo infoWithChangedProperties:snapshot:](DADeviceStateChangeNotificationInfo, "infoWithChangedProperties:snapshot:", pendingChanges, v4));

  self->_pendingChanges = 0;
  notificationQueue = self->_notificationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027C50;
  v8[3] = &unk_1001328B0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(notificationQueue, v8);

}

- (void)resetState
{
  NSString *diagnosticEventID;
  NSNumber *suiteID;
  NSString *suiteName;
  NSString *suiteDescription;
  NSArray *suitesAvailable;
  NSNumber *progress;
  NSArray *errors;
  NSNumber *timestamp;
  DADeviceState *obj;

  obj = self;
  objc_sync_enter(obj);
  diagnosticEventID = obj->_diagnosticEventID;
  obj->_diagnosticEventID = 0;

  suiteID = obj->_suiteID;
  obj->_suiteID = 0;

  suiteName = obj->_suiteName;
  obj->_suiteName = 0;

  suiteDescription = obj->_suiteDescription;
  obj->_suiteDescription = 0;

  suitesAvailable = obj->_suitesAvailable;
  obj->_suitesAvailable = (NSArray *)&__NSArray0__struct;

  progress = obj->_progress;
  obj->_progress = (NSNumber *)&off_10013F7D8;

  obj->_durationRemaining = 0.0;
  errors = obj->_errors;
  obj->_errors = (NSArray *)&__NSArray0__struct;

  timestamp = obj->_timestamp;
  obj->_timestamp = 0;

  obj->_pendingChanges = 0;
  obj->_freezeNotifications = 0;
  objc_sync_exit(obj);

}

- (int64_t)phase
{
  return self->_phase;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)diagnosticEventID
{
  return self->_diagnosticEventID;
}

- (NSNumber)suiteID
{
  return self->_suiteID;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (NSString)suiteDescription
{
  return self->_suiteDescription;
}

- (NSData)testSuiteImageData
{
  return self->_testSuiteImageData;
}

- (void)setTestSuiteImageData:(id)a3
{
  objc_storeStrong((id *)&self->_testSuiteImageData, a3);
}

- (NSArray)suitesAvailable
{
  return self->_suitesAvailable;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (double)durationRemaining
{
  return self->_durationRemaining;
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (NSArray)history
{
  return self->_history;
}

- (NSArray)errors
{
  return self->_errors;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_sessionSettings, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_suitesAvailable, 0);
  objc_storeStrong((id *)&self->_testSuiteImageData, 0);
  objc_storeStrong((id *)&self->_suiteDescription, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong((id *)&self->_suiteID, 0);
  objc_storeStrong((id *)&self->_diagnosticEventID, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
