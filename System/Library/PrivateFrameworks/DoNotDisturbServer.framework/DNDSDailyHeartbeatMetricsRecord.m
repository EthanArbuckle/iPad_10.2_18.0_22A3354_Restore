@implementation DNDSDailyHeartbeatMetricsRecord

- (DNDSDailyHeartbeatMetricsRecord)init
{
  return (DNDSDailyHeartbeatMetricsRecord *)-[DNDSDailyHeartbeatMetricsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;

  v3 = a3;
  v20 = objc_msgSend(v3, "enabled");
  v19 = objc_msgSend(v3, "manuallyEnabled");
  objc_msgSend(v3, "numberOfSessions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberOfManualSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "enabledFromControlCenterPhone");
  v16 = objc_msgSend(v3, "enabledFromControlCenterWatch");
  v5 = objc_msgSend(v3, "enabledForOneHour");
  v6 = objc_msgSend(v3, "enabledUntilEvening");
  v7 = objc_msgSend(v3, "enabledUntilMorning");
  v8 = objc_msgSend(v3, "enabledAtLocation");
  v9 = objc_msgSend(v3, "enabledDuringEvent");
  v10 = objc_msgSend(v3, "enabledDrivingMode");
  v11 = objc_msgSend(v3, "enabledSleepMode");
  objc_msgSend(v3, "dayOfWeek");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE6(v15) = v11;
  BYTE5(v15) = v10;
  BYTE4(v15) = v9;
  BYTE3(v15) = v8;
  BYTE2(v15) = v7;
  BYTE1(v15) = v6;
  LOBYTE(v15) = v5;
  v13 = -[DNDSDailyHeartbeatMetricsRecord _initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:dayOfWeek:](self, "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:dayOfWeek:", v20, v19, v18, v4, v17, v16, v15, v12);

  return v13;
}

- (id)_initWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfSessions:(id)a5 numberOfManualSessions:(id)a6 enabledFromControlCenterPhone:(BOOL)a7 enabledFromControlCenterWatch:(BOOL)a8 enabledForOneHour:(BOOL)a9 enabledUntilEvening:(BOOL)a10 enabledUntilMorning:(BOOL)a11 enabledAtLocation:(BOOL)a12 enabledDuringEvent:(BOOL)a13 enabledDrivingMode:(BOOL)a14 enabledSleepMode:(BOOL)a15 dayOfWeek:(id)a16
{
  _BOOL8 v16;
  id v18;
  id *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v28;
  _BOOL4 v29;
  objc_super v30;

  v28 = a7;
  v29 = a8;
  v25 = a4;
  v16 = a3;
  v18 = a16;
  v30.receiver = self;
  v30.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  BYTE6(v24) = a15;
  BYTE5(v24) = a14;
  BYTE4(v24) = a13;
  BYTE3(v24) = a12;
  BYTE2(v24) = a11;
  LOWORD(v24) = __PAIR16__(a10, a9);
  v19 = -[DNDSHeartbeatMetricsRecord _initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:](&v30, sel__initWithEnabled_manuallyEnabled_numberOfSessions_numberOfManualSessions_enabledFromControlCenterPhone_enabledFromControlCenterWatch_enabledForOneHour_enabledUntilEvening_enabledUntilMorning_enabledAtLocation_enabledDuringEvent_enabledDrivingMode_enabledSleepMode_, v16, v25, a5, a6, v28, v29, v24);
  if (v19)
  {
    v20 = objc_msgSend(v18, "copy");
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = &unk_1E86DE5F8;
    objc_storeStrong(v19 + 6, v22);

  }
  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  v3 = -[DNDSHeartbeatMetricsRecord hash](&v7, sel_hash);
  -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](self, "dayOfWeek");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DNDSDailyHeartbeatMetricsRecord *v4;
  DNDSDailyHeartbeatMetricsRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (DNDSDailyHeartbeatMetricsRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
      if (-[DNDSHeartbeatMetricsRecord isEqual:](&v14, sel_isEqual_, v5))
      {
        -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](self, "dayOfWeek");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](v5, "dayOfWeek");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
        {
          v12 = 1;
        }
        else
        {
          -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](self, "dayOfWeek");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](v5, "dayOfWeek");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](self, "dayOfWeek");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](v5, "dayOfWeek");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "isEqual:", v11);

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  -[DNDSHeartbeatMetricsRecord description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](self, "dayOfWeek");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@; dayOfWeek: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSDailyHeartbeatMetricsRecord _initWithRecord:]([DNDSMutableDailyHeartbeatMetricsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  void *v16;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  id v23;

  v6 = a3;
  v7 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v6, a4);
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("dayOfWeek"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc((Class)a1);
  v22 = objc_msgSend(v7, "enabled");
  v21 = objc_msgSend(v7, "manuallyEnabled");
  objc_msgSend(v7, "numberOfSessions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberOfManualSessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v7, "enabledFromControlCenterPhone");
  v19 = objc_msgSend(v7, "enabledFromControlCenterWatch");
  v11 = objc_msgSend(v7, "enabledForOneHour");
  LOBYTE(v6) = objc_msgSend(v7, "enabledUntilEvening");
  v12 = objc_msgSend(v7, "enabledUntilMorning");
  v13 = objc_msgSend(v7, "enabledAtLocation");
  v14 = objc_msgSend(v7, "enabledDuringEvent");
  v15 = objc_msgSend(v7, "enabledDrivingMode");
  BYTE6(v18) = objc_msgSend(v7, "enabledSleepMode");
  BYTE5(v18) = v15;
  BYTE4(v18) = v14;
  BYTE3(v18) = v13;
  BYTE2(v18) = v12;
  BYTE1(v18) = (_BYTE)v6;
  LOBYTE(v18) = v11;
  v16 = (void *)objc_msgSend(v23, "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:dayOfWeek:", v22, v21, v9, v10, v20, v19, v18, v8);

  return v16;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  -[DNDSHeartbeatMetricsRecord dictionaryRepresentationWithContext:](&v8, sel_dictionaryRepresentationWithContext_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[DNDSDailyHeartbeatMetricsRecord dayOfWeek](self, "dayOfWeek");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("dayOfWeek"));

  return v5;
}

- (NSNumber)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfWeek, 0);
}

@end
