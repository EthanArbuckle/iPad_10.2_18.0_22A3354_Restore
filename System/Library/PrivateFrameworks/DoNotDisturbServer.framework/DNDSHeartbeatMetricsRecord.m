@implementation DNDSHeartbeatMetricsRecord

- (DNDSHeartbeatMetricsRecord)init
{
  return (DNDSHeartbeatMetricsRecord *)-[DNDSHeartbeatMetricsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  id v13;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;

  v3 = a3;
  v19 = objc_msgSend(v3, "enabled");
  v18 = objc_msgSend(v3, "manuallyEnabled");
  objc_msgSend(v3, "numberOfSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberOfManualSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "enabledFromControlCenterPhone");
  v16 = objc_msgSend(v3, "enabledFromControlCenterWatch");
  v6 = objc_msgSend(v3, "enabledForOneHour");
  v7 = objc_msgSend(v3, "enabledUntilEvening");
  v8 = objc_msgSend(v3, "enabledUntilMorning");
  v9 = objc_msgSend(v3, "enabledAtLocation");
  v10 = objc_msgSend(v3, "enabledDuringEvent");
  v11 = objc_msgSend(v3, "enabledDrivingMode");
  v12 = objc_msgSend(v3, "enabledSleepMode");

  BYTE6(v15) = v12;
  BYTE5(v15) = v11;
  BYTE4(v15) = v10;
  BYTE3(v15) = v9;
  BYTE2(v15) = v8;
  BYTE1(v15) = v7;
  LOBYTE(v15) = v6;
  v13 = -[DNDSHeartbeatMetricsRecord _initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:](self, "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:", v19, v18, v4, v5, v17, v16, v15);

  return v13;
}

- (id)_initWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfSessions:(id)a5 numberOfManualSessions:(id)a6 enabledFromControlCenterPhone:(BOOL)a7 enabledFromControlCenterWatch:(BOOL)a8 enabledForOneHour:(BOOL)a9 enabledUntilEvening:(BOOL)a10 enabledUntilMorning:(BOOL)a11 enabledAtLocation:(BOOL)a12 enabledDuringEvent:(BOOL)a13 enabledDrivingMode:(BOOL)a14 enabledSleepMode:(BOOL)a15
{
  id v21;
  id v22;
  DNDSHeartbeatMetricsRecord *v23;
  DNDSHeartbeatMetricsRecord *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_super v32;

  v21 = a5;
  v22 = a6;
  v32.receiver = self;
  v32.super_class = (Class)DNDSHeartbeatMetricsRecord;
  v23 = -[DNDSHeartbeatMetricsRecord init](&v32, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_enabled = a3;
    v23->_manuallyEnabled = a4;
    v25 = objc_msgSend(v21, "copy");
    v26 = (void *)v25;
    if (v25)
      v27 = (void *)v25;
    else
      v27 = &unk_1E86DE5F8;
    objc_storeStrong((id *)&v24->_numberOfSessions, v27);

    v28 = objc_msgSend(v22, "copy");
    v29 = (void *)v28;
    if (v28)
      v30 = (void *)v28;
    else
      v30 = &unk_1E86DE5F8;
    objc_storeStrong((id *)&v24->_numberOfManualSessions, v30);

    v24->_enabledFromControlCenterPhone = a7;
    v24->_enabledFromControlCenterWatch = a8;
    v24->_enabledForOneHour = a9;
    v24->_enabledUntilEvening = a10;
    v24->_enabledUntilMorning = a11;
    v24->_enabledAtLocation = a12;
    v24->_enabledDuringEvent = a13;
    v24->_enabledDrivingMode = a14;
    v24->_enabledSleepMode = a15;
  }

  return v24;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v3 = -[DNDSHeartbeatMetricsRecord enabled](self, "enabled");
  v4 = v3 ^ -[DNDSHeartbeatMetricsRecord manuallyEnabled](self, "manuallyEnabled");
  -[DNDSHeartbeatMetricsRecord numberOfSessions](self, "numberOfSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[DNDSHeartbeatMetricsRecord numberOfManualSessions](self, "numberOfManualSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = v8 ^ -[DNDSHeartbeatMetricsRecord enabledFromControlCenterPhone](self, "enabledFromControlCenterPhone") ^ v4;
  v10 = -[DNDSHeartbeatMetricsRecord enabledFromControlCenterWatch](self, "enabledFromControlCenterWatch");
  v11 = v10 ^ -[DNDSHeartbeatMetricsRecord enabledForOneHour](self, "enabledForOneHour");
  v12 = v9 ^ v11 ^ -[DNDSHeartbeatMetricsRecord enabledUntilEvening](self, "enabledUntilEvening");
  v13 = -[DNDSHeartbeatMetricsRecord enabledUntilMorning](self, "enabledUntilMorning");
  v14 = v13 ^ -[DNDSHeartbeatMetricsRecord enabledAtLocation](self, "enabledAtLocation");
  v15 = v14 ^ -[DNDSHeartbeatMetricsRecord enabledDuringEvent](self, "enabledDuringEvent");
  v16 = v12 ^ v15 ^ -[DNDSHeartbeatMetricsRecord enabledDrivingMode](self, "enabledDrivingMode");
  v17 = v16 ^ -[DNDSHeartbeatMetricsRecord enabledSleepMode](self, "enabledSleepMode");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  DNDSHeartbeatMetricsRecord *v6;
  DNDSHeartbeatMetricsRecord *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v6 = (DNDSHeartbeatMetricsRecord *)a3;
  if (self == v6)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = -[DNDSHeartbeatMetricsRecord enabled](self, "enabled");
      if (v8 != -[DNDSHeartbeatMetricsRecord enabled](v7, "enabled")
        || (v9 = -[DNDSHeartbeatMetricsRecord manuallyEnabled](self, "manuallyEnabled"),
            v9 != -[DNDSHeartbeatMetricsRecord manuallyEnabled](v7, "manuallyEnabled")))
      {
        LOBYTE(v10) = 0;
LABEL_42:

        goto LABEL_43;
      }
      -[DNDSHeartbeatMetricsRecord numberOfSessions](self, "numberOfSessions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSHeartbeatMetricsRecord numberOfSessions](v7, "numberOfSessions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[DNDSHeartbeatMetricsRecord numberOfSessions](self, "numberOfSessions");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          LOBYTE(v10) = 0;
          goto LABEL_41;
        }
        v3 = (void *)v13;
        -[DNDSHeartbeatMetricsRecord numberOfSessions](v7, "numberOfSessions");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          LOBYTE(v10) = 0;
LABEL_40:

          goto LABEL_41;
        }
        v15 = (void *)v14;
        -[DNDSHeartbeatMetricsRecord numberOfSessions](self, "numberOfSessions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSHeartbeatMetricsRecord numberOfSessions](v7, "numberOfSessions");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "isEqual:", v4))
        {
          LOBYTE(v10) = 0;
LABEL_39:

          goto LABEL_40;
        }
        v38 = v4;
        v39 = v16;
        v40 = v15;
      }
      -[DNDSHeartbeatMetricsRecord numberOfManualSessions](self, "numberOfManualSessions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSHeartbeatMetricsRecord numberOfManualSessions](v7, "numberOfManualSessions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 != v18)
      {
        -[DNDSHeartbeatMetricsRecord numberOfManualSessions](self, "numberOfManualSessions");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
LABEL_29:

          LOBYTE(v10) = 0;
          goto LABEL_38;
        }
        v4 = (void *)v19;
        -[DNDSHeartbeatMetricsRecord numberOfManualSessions](v7, "numberOfManualSessions");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          LOBYTE(v10) = 0;
LABEL_36:

          goto LABEL_37;
        }
        v21 = (void *)v20;
        v35 = v3;
        v22 = v4;
        -[DNDSHeartbeatMetricsRecord numberOfManualSessions](self, "numberOfManualSessions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSHeartbeatMetricsRecord numberOfManualSessions](v7, "numberOfManualSessions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          LOBYTE(v10) = 0;
          v4 = v22;
          v3 = v35;
LABEL_35:

          goto LABEL_36;
        }
        v34 = v21;
        v4 = v22;
        v3 = v35;
      }
      v24 = -[DNDSHeartbeatMetricsRecord enabledFromControlCenterPhone](self, "enabledFromControlCenterPhone");
      if (v24 != -[DNDSHeartbeatMetricsRecord enabledFromControlCenterPhone](v7, "enabledFromControlCenterPhone")
        || (v25 = -[DNDSHeartbeatMetricsRecord enabledFromControlCenterWatch](self, "enabledFromControlCenterWatch"),
            v25 != -[DNDSHeartbeatMetricsRecord enabledFromControlCenterWatch](v7, "enabledFromControlCenterWatch"))
        || (v26 = -[DNDSHeartbeatMetricsRecord enabledForOneHour](self, "enabledForOneHour"),
            v26 != -[DNDSHeartbeatMetricsRecord enabledForOneHour](v7, "enabledForOneHour"))
        || (v27 = -[DNDSHeartbeatMetricsRecord enabledUntilEvening](self, "enabledUntilEvening"),
            v27 != -[DNDSHeartbeatMetricsRecord enabledUntilEvening](v7, "enabledUntilEvening"))
        || (v28 = -[DNDSHeartbeatMetricsRecord enabledUntilMorning](self, "enabledUntilMorning"),
            v28 != -[DNDSHeartbeatMetricsRecord enabledUntilMorning](v7, "enabledUntilMorning"))
        || (v29 = -[DNDSHeartbeatMetricsRecord enabledAtLocation](self, "enabledAtLocation"),
            v29 != -[DNDSHeartbeatMetricsRecord enabledAtLocation](v7, "enabledAtLocation"))
        || (v30 = -[DNDSHeartbeatMetricsRecord enabledDuringEvent](self, "enabledDuringEvent"),
            v30 != -[DNDSHeartbeatMetricsRecord enabledDuringEvent](v7, "enabledDuringEvent"))
        || (v31 = -[DNDSHeartbeatMetricsRecord enabledDrivingMode](self, "enabledDrivingMode"),
            v31 != -[DNDSHeartbeatMetricsRecord enabledDrivingMode](v7, "enabledDrivingMode")))
      {
        if (v17 != v18)
        {

          goto LABEL_29;
        }
        LOBYTE(v10) = 0;
LABEL_37:

LABEL_38:
        v16 = v39;
        v15 = v40;
        v4 = v38;
        if (v11 != v12)
          goto LABEL_39;
LABEL_41:

        goto LABEL_42;
      }
      v33 = -[DNDSHeartbeatMetricsRecord enabledSleepMode](self, "enabledSleepMode");
      v10 = v33 ^ -[DNDSHeartbeatMetricsRecord enabledSleepMode](v7, "enabledSleepMode") ^ 1;
      v21 = v34;
      if (v17 == v18)
        goto LABEL_37;
      goto LABEL_35;
    }
    LOBYTE(v10) = 0;
  }
LABEL_43:

  return v10;
}

- (NSString)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_opt_class();
  if (-[DNDSHeartbeatMetricsRecord enabled](self, "enabled"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v21 = v3;
  if (-[DNDSHeartbeatMetricsRecord manuallyEnabled](self, "manuallyEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v20 = v4;
  -[DNDSHeartbeatMetricsRecord numberOfSessions](self, "numberOfSessions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSHeartbeatMetricsRecord numberOfManualSessions](self, "numberOfManualSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DNDSHeartbeatMetricsRecord enabledFromControlCenterPhone](self, "enabledFromControlCenterPhone"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v18 = v6;
  if (-[DNDSHeartbeatMetricsRecord enabledFromControlCenterWatch](self, "enabledFromControlCenterWatch"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v17 = v7;
  if (-[DNDSHeartbeatMetricsRecord enabledForOneHour](self, "enabledForOneHour"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[DNDSHeartbeatMetricsRecord enabledUntilEvening](self, "enabledUntilEvening"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[DNDSHeartbeatMetricsRecord enabledUntilMorning](self, "enabledUntilMorning"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[DNDSHeartbeatMetricsRecord enabledAtLocation](self, "enabledAtLocation"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[DNDSHeartbeatMetricsRecord enabledDuringEvent](self, "enabledDuringEvent"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (-[DNDSHeartbeatMetricsRecord enabledDrivingMode](self, "enabledDrivingMode"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (-[DNDSHeartbeatMetricsRecord enabledSleepMode](self, "enabledSleepMode"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; enabled: %@; manuallyEnabled: %@; numberOfSessions: %@; numberOfManualSessions: %@; enabledFromControlCenterPhone: %@; enabledFromControlCenterWatch: %@; enabledForOneHour: %@; enabledUntilEvening: %@; enabledUntilMorning: %@; enabledAtLocation: %@; enabledDuringEvent: %@; enabledDrivingMode: %@; enabledSleepMode: %@>"),
    v22,
    self,
    v21,
    v20,
    v19,
    v5,
    v18,
    v17,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSHeartbeatMetricsRecord _initWithRecord:]([DNDSMutableHeartbeatMetricsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  void *v14;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v21;

  v4 = a3;
  v21 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabled"));
  v19 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("manuallyEnabled"));
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("numOfSessions"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("numOfManualSessions"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledFromControlCenterPhone"));
  v17 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledFromControlCenterWatch"));
  v7 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledForOneHour"));
  v8 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledUntilEvening"));
  v9 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledUntilMorning"));
  v10 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledAtLocation"));
  v11 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledDuringEvent"));
  v12 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledDrivingMode"));
  v13 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("enabledSleepMode"));

  BYTE6(v16) = v13;
  BYTE5(v16) = v12;
  BYTE4(v16) = v11;
  BYTE3(v16) = v10;
  BYTE2(v16) = v9;
  BYTE1(v16) = v8;
  LOBYTE(v16) = v7;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:", v21, v19, v5, v6, v18, v17, v16);

  return v14;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabled](self, "enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord manuallyEnabled](self, "manuallyEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("manuallyEnabled"));

  -[DNDSHeartbeatMetricsRecord numberOfSessions](self, "numberOfSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numOfSessions"));

  -[DNDSHeartbeatMetricsRecord numberOfManualSessions](self, "numberOfManualSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numOfManualSessions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledFromControlCenterPhone](self, "enabledFromControlCenterPhone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("enabledFromControlCenterPhone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledFromControlCenterWatch](self, "enabledFromControlCenterWatch"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("enabledFromControlCenterWatch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledForOneHour](self, "enabledForOneHour"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("enabledForOneHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledUntilEvening](self, "enabledUntilEvening"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("enabledUntilEvening"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledUntilMorning](self, "enabledUntilMorning"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("enabledUntilMorning"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledAtLocation](self, "enabledAtLocation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("enabledAtLocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledDuringEvent](self, "enabledDuringEvent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("enabledDuringEvent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledDrivingMode](self, "enabledDrivingMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("enabledDrivingMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledSleepMode](self, "enabledSleepMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("enabledSleepMode"));

  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)manuallyEnabled
{
  return self->_manuallyEnabled;
}

- (NSNumber)numberOfSessions
{
  return self->_numberOfSessions;
}

- (NSNumber)numberOfManualSessions
{
  return self->_numberOfManualSessions;
}

- (BOOL)enabledFromControlCenterPhone
{
  return self->_enabledFromControlCenterPhone;
}

- (BOOL)enabledFromControlCenterWatch
{
  return self->_enabledFromControlCenterWatch;
}

- (BOOL)enabledForOneHour
{
  return self->_enabledForOneHour;
}

- (BOOL)enabledUntilEvening
{
  return self->_enabledUntilEvening;
}

- (BOOL)enabledUntilMorning
{
  return self->_enabledUntilMorning;
}

- (BOOL)enabledAtLocation
{
  return self->_enabledAtLocation;
}

- (BOOL)enabledDuringEvent
{
  return self->_enabledDuringEvent;
}

- (BOOL)enabledDrivingMode
{
  return self->_enabledDrivingMode;
}

- (BOOL)enabledSleepMode
{
  return self->_enabledSleepMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfManualSessions, 0);
  objc_storeStrong((id *)&self->_numberOfSessions, 0);
}

@end
