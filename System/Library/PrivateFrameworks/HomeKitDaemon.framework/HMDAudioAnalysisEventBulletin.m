@implementation HMDAudioAnalysisEventBulletin

- (void)setNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUUID, a3);
}

- (id)localizedKeyForEventStartWithDropIn:(BOOL)a3 homeName:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDAudioAnalysisEventBulletin accessoryNameComposer](self, "accessoryNameComposer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
  {
    HMDLocalizedStringForKey(CFSTR("AUDIOANALYSIS_ALARM_START_CHECK_IN"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v9, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@ %@"), &v21, v6, v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = v21;

    if (!v11)
    {
      v13 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("AUDIOANALYSIS_ALARM_START_CHECK_IN");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v15;
        v24 = 2112;
        v25 = CFSTR("AUDIOANALYSIS_ALARM_START_CHECK_IN");
        v26 = 2112;
        v27 = CFSTR("%@ %@");
        v28 = 2112;
        v29 = v12;
LABEL_9:
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    HMDLocalizedStringForKey(CFSTR("AUDIOANALYSIS_ALARM_START_NO_CHECK_IN"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v9, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), &v20, v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = v20;

    if (!v11)
    {
      v13 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("AUDIOANALYSIS_ALARM_START_NO_CHECK_IN");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v15;
        v24 = 2112;
        v25 = CFSTR("AUDIOANALYSIS_ALARM_START_NO_CHECK_IN");
        v26 = 2112;
        v27 = CFSTR("%@");
        v28 = 2112;
        v29 = v12;
        goto LABEL_9;
      }
LABEL_10:

      objc_autoreleasePoolPop(v13);
      v17 = 0;
      goto LABEL_11;
    }
  }
  v17 = v11;
LABEL_11:
  v18 = v11;

  return v18;
}

- (id)localizedKeyForEventEndWithDropIn:(BOOL)a3 homeName:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v4 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setUnitsStyle:", 3);
  objc_msgSend(v7, "setAllowedUnits:", 64);
  objc_msgSend(v7, "setFormattingContext:", 2);
  objc_msgSend(v7, "setMaximumUnitCount:", 2);
  -[HMDAudioAnalysisEventBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisEventBulletin startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  if (v11 >= 60.0 && v11 < 120.0)
  {
    v12 = CFSTR("AUDIOANALYSIS_ALARM_MORE_THAN_ONE_MINUTE_LESS_THAN_TWO_MINUTE");
LABEL_6:
    HMDLocalizedStringForKey(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v11 < 60.0)
  {
    v12 = CFSTR("AUDIOANALYSIS_ALARM_LESS_THAN_ONE_MINUTE");
    goto LABEL_6;
  }
  objc_msgSend(v7, "stringFromTimeInterval:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = (void *)v13;
  -[HMDAudioAnalysisEventBulletin accessoryNameComposer](self, "accessoryNameComposer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "composedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
  {
    HMDLocalizedStringForKey(CFSTR("AUDIOANALYSIS_ALARM_END_CHECK_IN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v17, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@ %@ %@"), &v29, v6, v14, v16);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = v29;

    if (!v19)
    {
      v21 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("AUDIOANALYSIS_ALARM_END_CHECK_IN");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v23;
        v32 = 2112;
        v33 = CFSTR("AUDIOANALYSIS_ALARM_END_CHECK_IN");
        v34 = 2112;
        v35 = CFSTR("%@ %@ %@");
        v36 = 2112;
        v37 = v20;
LABEL_16:
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    HMDLocalizedStringForKey(CFSTR("AUDIOANALYSIS_ALARM_END_NO_CHECK_IN"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v17, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@ %@"), &v28, v16, v14);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = v28;

    if (!v19)
    {
      v21 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("AUDIOANALYSIS_ALARM_END_NO_CHECK_IN");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v23;
        v32 = 2112;
        v33 = CFSTR("AUDIOANALYSIS_ALARM_END_NO_CHECK_IN");
        v34 = 2112;
        v35 = CFSTR("%@ %@");
        v36 = 2112;
        v37 = v20;
        goto LABEL_16;
      }
LABEL_17:

      objc_autoreleasePoolPop(v21);
      v25 = 0;
      goto LABEL_18;
    }
  }
  v25 = v19;
LABEL_18:
  v26 = v19;

  return v26;
}

- (id)localizedKeyForTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[HMDAudioAnalysisEventBulletin context](self, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HMDAudioAnalysisEventBulletin context](self, "context"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "dropInEnabled"),
        v5,
        v4,
        v6))
  {
    HMDLocalizedStringForKey(CFSTR("AUDIOANALYSIS_ALARM_NOTIFICATION_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAudioAnalysisEventBulletin title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)stringForAudioAnalysisReasonWithHomeName:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  v4 = a3;
  v5 = -[HMDAudioAnalysisEventBulletin state](self, "state");
  if (v5 == 1)
    goto LABEL_6;
  if (v5)
    goto LABEL_9;
  v6 = -[HMDAudioAnalysisEventBulletin reason](self, "reason");
  if (v6 == 4)
    goto LABEL_9;
  if (v6 != 1)
  {
LABEL_6:
    if (-[HMDAudioAnalysisEventBulletin reason](self, "reason") == 1)
    {
      -[HMDAudioAnalysisEventBulletin context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAudioAnalysisEventBulletin localizedKeyForEventEndWithDropIn:homeName:](self, "localizedKeyForEventEndWithDropIn:homeName:", objc_msgSend(v7, "dropInEnabled"), v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    v9 = &stru_24E79DB48;
    goto LABEL_10;
  }
  -[HMDAudioAnalysisEventBulletin context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisEventBulletin localizedKeyForEventStartWithDropIn:homeName:](self, "localizedKeyForEventStartWithDropIn:homeName:", objc_msgSend(v7, "dropInEnabled"), v4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (__CFString *)v8;

LABEL_10:
  return v9;
}

- (HMDAudioAnalysisEventBulletin)initWithReason:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 presence:(id)a6 notificationUUID:(id)a7 state:(unint64_t)a8 soundIdentifier:(id)a9 name:(id)a10 threadIdentifier:(id)a11 accessoryUUID:(id)a12 title:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HMDAudioAnalysisEventBulletin *v26;
  HMDAudioAnalysisEventBulletin *v27;
  uint64_t v28;
  NSDictionary *presence;
  uint64_t v30;
  NSDate *dateOfOccurrence;
  uint64_t v32;
  NSDate *startDate;
  uint64_t v34;
  NSUUID *notificationUUID;
  uint64_t v36;
  NSString *soundIdentifier;
  uint64_t v38;
  NSUUID *accessoryUUID;
  uint64_t v40;
  NSString *title;
  uint64_t v42;
  NSString *name;
  uint64_t v44;
  NSString *threadIdentifier;
  id v48;
  objc_super v49;

  v48 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v49.receiver = self;
  v49.super_class = (Class)HMDAudioAnalysisEventBulletin;
  v26 = -[HMDAudioAnalysisEventBulletin init](&v49, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_reason = a3;
    v28 = objc_msgSend(v19, "copy");
    presence = v27->_presence;
    v27->_presence = (NSDictionary *)v28;

    v30 = objc_msgSend(v18, "copy");
    dateOfOccurrence = v27->_dateOfOccurrence;
    v27->_dateOfOccurrence = (NSDate *)v30;

    v32 = objc_msgSend(v48, "copy");
    startDate = v27->_startDate;
    v27->_startDate = (NSDate *)v32;

    v34 = objc_msgSend(v20, "copy");
    notificationUUID = v27->_notificationUUID;
    v27->_notificationUUID = (NSUUID *)v34;

    v27->_state = a8;
    v36 = objc_msgSend(v21, "copy");
    soundIdentifier = v27->_soundIdentifier;
    v27->_soundIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v24, "copy");
    accessoryUUID = v27->_accessoryUUID;
    v27->_accessoryUUID = (NSUUID *)v38;

    v40 = objc_msgSend(v25, "copy");
    title = v27->_title;
    v27->_title = (NSString *)v40;

    v42 = objc_msgSend(v22, "copy");
    name = v27->_name;
    v27->_name = (NSString *)v42;

    v44 = objc_msgSend(v23, "copy");
    threadIdentifier = v27->_threadIdentifier;
    v27->_threadIdentifier = (NSString *)v44;

  }
  return v27;
}

- (void)configureWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  -[HMDAudioAnalysisEventBulletin configureAccessoryNameComposer](self, "configureAccessoryNameComposer");
}

- (void)configureAccessoryNameComposer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  HMDAccessoryNameComposer *v12;
  HMDAccessoryNameComposer *accessoryNameComposer;
  id v14;

  -[HMDAudioAnalysisEventBulletin context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "configuredName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  v12 = -[HMDAccessoryNameComposer initWithRawAccessoryName:rawRoomName:]([HMDAccessoryNameComposer alloc], "initWithRawAccessoryName:rawRoomName:", v11, v5);
  accessoryNameComposer = self->_accessoryNameComposer;
  self->_accessoryNameComposer = v12;

}

- (id)localizedKeyForBody
{
  void *v3;
  void *v4;

  -[HMDAudioAnalysisEventBulletin title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisEventBulletin stringForAudioAnalysisReasonWithHomeName:](self, "stringForAudioAnalysisReasonWithHomeName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
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
  id v16;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin reason](self, "reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, *MEMORY[0x24BDD5338]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("HMDAudioAnalysisEventBulletinState"));

  -[HMDAudioAnalysisEventBulletin accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("HMDAudioAnalysisEventBulletinAccessoryUUIDKey"));

  -[HMDAudioAnalysisEventBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("HMDAudioAnalysisEventBulletinDateKey"));

  -[HMDAudioAnalysisEventBulletin startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("HMDAudioAnalysisEventBulletinStartDateKey"));

  -[HMDAudioAnalysisEventBulletin name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("HMDAudioAnalysisEventBulletinNameKey"));

  -[HMDAudioAnalysisEventBulletin notificationUUID](self, "notificationUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("HMDAudioAnalysisEventBulletinNotificationUUID"));

  -[HMDAudioAnalysisEventBulletin presence](self, "presence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("HMDAudioAnalysisEventBulletinPresenceKey"));

  -[HMDAudioAnalysisEventBulletin soundIdentifier](self, "soundIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("HMDAudioAnalysisEventBulletinSoundIdentifier"));

  -[HMDAudioAnalysisEventBulletin title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("HMDAudioAnalysisEventBulletinTitleKey"));

  -[HMDAudioAnalysisEventBulletin threadIdentifier](self, "threadIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("HMDAudioAnalysisEventBulletinThreadIdentifierKey"));

}

- (id)serialize
{
  void *v3;
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
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin reason](self, "reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDD5338]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("HMDAudioAnalysisEventBulletinState"));

  -[HMDAudioAnalysisEventBulletin accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("HMDAudioAnalysisEventBulletinAccessoryUUIDKey"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAudioAnalysisEventBulletin startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("HMDAudioAnalysisEventBulletinStartDateKey"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAudioAnalysisEventBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("HMDAudioAnalysisEventBulletinDateKey"));

  -[HMDAudioAnalysisEventBulletin name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("HMDAudioAnalysisEventBulletinNameKey"));

  -[HMDAudioAnalysisEventBulletin notificationUUID](self, "notificationUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("HMDAudioAnalysisEventBulletinNotificationUUID"));

  -[HMDAudioAnalysisEventBulletin presence](self, "presence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("HMDAudioAnalysisEventBulletinPresenceKey"));

  -[HMDAudioAnalysisEventBulletin soundIdentifier](self, "soundIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("HMDAudioAnalysisEventBulletinSoundIdentifier"));

  -[HMDAudioAnalysisEventBulletin title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("HMDAudioAnalysisEventBulletinTitleKey"));

  -[HMDAudioAnalysisEventBulletin threadIdentifier](self, "threadIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("HMDAudioAnalysisEventBulletinThreadIdentifierKey"));

  return v3;
}

- (HMDAudioAnalysisEventBulletin)initWithDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  void *v30;
  HMDAudioAnalysisEventBulletin *v31;
  unsigned int v33;
  unsigned int v34;
  void *v35;

  v3 = *MEMORY[0x24BDD5338];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v34 = objc_msgSend(v7, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v33 = objc_msgSend(v10, "unsignedIntValue");
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMDAudioAnalysisEventBulletinAccessoryUUIDKey"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v11, "dateWithTimeIntervalSince1970:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinNameKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMDAudioAnalysisEventBulletinNotificationUUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinPresenceKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinSoundIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinTitleKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinThreadIdentifierKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisEventBulletinStartDateKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  objc_msgSend(v27, "doubleValue");
  v29 = v28;

  objc_msgSend(v24, "dateWithTimeIntervalSince1970:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = -[HMDAudioAnalysisEventBulletin initWithReason:startDate:endDate:presence:notificationUUID:state:soundIdentifier:name:threadIdentifier:accessoryUUID:title:](self, "initWithReason:startDate:endDate:presence:notificationUUID:state:soundIdentifier:name:threadIdentifier:accessoryUUID:title:", v34, v30, v17, v20, v19, v33, v21, v18, v23, v35, v22);

  return v31;
}

- (HMDAudioAnalysisEventBulletin)initWithCoder:(id)a3
{
  id v3;
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
  HMDAudioAnalysisEventBulletin *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD5338]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v22, "unsignedIntegerValue");
  v4 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("HMDAudioAnalysisEventBulletinPresenceKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinNotificationUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v19, "unsignedIntValue");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinSoundIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinTitleKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinAccessoryUUIDKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinNameKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinThreadIdentifierKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAudioAnalysisEventBulletinStartDateKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HMDAudioAnalysisEventBulletin initWithReason:startDate:endDate:presence:notificationUUID:state:soundIdentifier:name:threadIdentifier:accessoryUUID:title:](self, "initWithReason:startDate:endDate:presence:notificationUUID:state:soundIdentifier:name:threadIdentifier:accessoryUUID:title:", v20, v15, v8, v7, v9, v18, v10, v13, v14, v12, v11);
  return v16;
}

- (NSUUID)notificationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)presence
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)soundIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (HMDAudioAnalysisEventSubscriberContext)context
{
  return (HMDAudioAnalysisEventSubscriberContext *)objc_getProperty(self, a2, 96, 1);
}

- (HMDAccessoryNameComposer)accessoryNameComposer
{
  return self->_accessoryNameComposer;
}

- (void)setAccessoryNameComposer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNameComposer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryNameComposer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_soundIdentifier, 0);
  objc_storeStrong((id *)&self->_presence, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
