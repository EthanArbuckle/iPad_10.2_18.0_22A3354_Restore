@implementation HMDBulletinNotificationRegistrationUtilities

+ (id)createAndAddLocalConditionsToRegistration:(id)a3 moc:(id)a4 conditions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__HMDBulletinNotificationRegistrationUtilities_createAndAddLocalConditionsToRegistration_moc_conditions___block_invoke;
  v14[3] = &unk_24E789528;
  v16 = v9;
  v17 = a1;
  v15 = v8;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a5, "na_map:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)createAndAddLocalPresenceConditionToRegistration:(id)a3 moc:(id)a4 condition:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)MEMORY[0x24BDBB658];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[MKFLocalBulletinConditionPresence entity](MKFLocalBulletinConditionPresence, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPresenceEventType:", objc_msgSend(v8, "presenceEventType"));
  objc_msgSend(v13, "setPresenceEventUserType:", objc_msgSend(v8, "presenceEventUserType"));
  objc_msgSend(v8, "userUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setUserModelIDs:", v14);
  objc_msgSend(v13, "setRegistration:", v10);
  objc_msgSend(v10, "addConditionsObject:", v13);

  return v13;
}

+ (id)createAndAddLocalTimePeriodConditionToRegistration:(id)a3 moc:(id)a4 condition:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBB658];
  v11 = a3;
  +[MKFLocalBulletinConditionTimePeriod entity](MKFLocalBulletinConditionTimePeriod, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertNewObjectForEntityForName:inManagedObjectContext:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "endElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "startElement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      objc_msgSend(v9, "endElement");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      objc_msgSend(a1, "createLocalElementFromTimeOfDay:moc:", v20, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setStartElement:", v24);
      objc_msgSend(a1, "createLocalElementFromTimeOfDay:moc:", v23, v8);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v26 = (void *)v25;

      objc_msgSend(v14, "setEndElement:", v26);
      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "startElement");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v9, "endElement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = objc_opt_isKindOfClass();

  if ((v28 & 1) != 0)
  {
    objc_msgSend(v9, "startElement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
    v31 = v30;

    objc_msgSend(v9, "endElement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v23 = v33;

    objc_msgSend(a1, "createLocalElementFromSunriseSunset:moc:", v31, v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setStartElement:", v34);
    objc_msgSend(a1, "createLocalElementFromSunriseSunset:moc:", v23, v8);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_22:
  objc_msgSend(v14, "setRegistration:", v11);
  objc_msgSend(v11, "addConditionsObject:", v14);

  return v14;
}

+ (id)createLocalElementFromTimeOfDay:(id)a3 moc:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x24BDBB658];
  v6 = a4;
  v7 = a3;
  +[MKFLocalElementTimePeriodTimeOfDay entity](MKFLocalElementTimePeriodTimeOfDay, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "hour"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHour:", v11);

  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = objc_msgSend(v7, "minute");

  objc_msgSend(v12, "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinute:", v14);

  return v10;
}

+ (id)createLocalElementFromSunriseSunset:(id)a3 moc:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BDBB658];
  v6 = a4;
  v7 = a3;
  +[MKFLocalElementTimePeriodSunriseSunSet entity](MKFLocalElementTimePeriodSunriseSunSet, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "significantEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSignificantEvent:", v11);

  objc_msgSend(v7, "offset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setOffset:", v12);
  return v10;
}

+ (id)conditionsFromLocalConditions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__HMDBulletinNotificationRegistrationUtilities_conditionsFromLocalConditions___block_invoke;
  v4[3] = &__block_descriptor_40_e35__16__0__MKFLocalBulletinCondition_8l;
  v4[4] = a1;
  objc_msgSend(a3, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)presenceConditionFromLocalCondition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  id v9;
  HMDPresenceNotificationCondition *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDPresenceNotificationCondition *v16;

  v3 = a3;
  objc_msgSend(v3, "userModelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && v6)
    {
      objc_msgSend(v4, "na_map:", &__block_literal_global_147767);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v4;
    }
    v9 = v8;

    v5 = v9;
  }
  v10 = [HMDPresenceNotificationCondition alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "presenceEventType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend(v3, "presenceEventUserType");

  objc_msgSend(v13, "numberWithLongLong:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDPresenceNotificationCondition initWithPresenceEventType:presenceEventUserType:userUUIDs:](v10, "initWithPresenceEventType:presenceEventUserType:userUUIDs:", v12, objc_msgSend(v15, "unsignedIntegerValue"), v5);

  return v16;
}

+ (id)timePeriodConditionFromLocalCondition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  HMDTimeOfDayTimePeriodElement *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDTimeOfDayTimePeriodElement *v17;
  HMDTimeOfDayTimePeriodElement *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDTimeOfDayTimePeriodElement *v22;
  HMDTimePeriodNotificationCondition *v23;
  HMDTimePeriodNotificationCondition *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  HMDSunriseSunsetTimePeriodElement *v32;
  void *v33;
  HMDSunriseSunsetTimePeriodElement *v34;
  HMDSunriseSunsetTimePeriodElement *v35;
  void *v36;
  HMDSunriseSunsetTimePeriodElement *v37;
  HMDTimePeriodNotificationCondition *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      v10 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      v13 = [HMDTimeOfDayTimePeriodElement alloc];
      objc_msgSend(v9, "hour");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");
      objc_msgSend(v9, "minute");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v13, "initWithHour:minute:", v15, objc_msgSend(v16, "unsignedIntegerValue"));

      v18 = [HMDTimeOfDayTimePeriodElement alloc];
      objc_msgSend(v12, "hour");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      objc_msgSend(v12, "minute");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v18, "initWithHour:minute:", v20, objc_msgSend(v21, "unsignedIntegerValue"));

      v23 = [HMDTimePeriodNotificationCondition alloc];
      v24 = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:](v23, "initWithStartElement:endElement:", v17, v22);

LABEL_19:
      goto LABEL_23;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
      v27 = v26;

      v28 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v30 = v29;

      objc_msgSend(a1, "adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:", v27);
      v17 = (HMDTimeOfDayTimePeriodElement *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = [HMDSunriseSunsetTimePeriodElement alloc];
      objc_msgSend(v27, "significantEvent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:](v32, "initWithSignificantEvent:offset:", v33, v17);

      v35 = [HMDSunriseSunsetTimePeriodElement alloc];
      objc_msgSend(v30, "significantEvent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:](v35, "initWithSignificantEvent:offset:", v36, v31);

      v38 = [HMDTimePeriodNotificationCondition alloc];
      v24 = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:](v38, "initWithStartElement:endElement:", v34, v37);

      goto LABEL_19;
    }
  }
  v39 = (void *)MEMORY[0x227676638]();
  v40 = a1;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138543874;
    v45 = v42;
    v46 = 2112;
    v47 = v5;
    v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized local time period start element: %@ end element: %@, unable to convert", (uint8_t *)&v44, 0x20u);

  }
  objc_autoreleasePoolPop(v39);
  v24 = 0;
LABEL_23:

  return v24;
}

+ (id)adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "offset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hour");
  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v6 = v5;
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "setHour:", v4);
  v7 = objc_msgSend(v3, "minute");
  if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setMinute:", v7);

  return v6;
}

+ (id)accessoryRegistrationFromLocalRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryBulletinNotificationRegistration *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  HMDAccessoryBulletinNotificationRegistration *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "serviceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "characteristicInstanceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromLocalConditions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMDAccessoryBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:]([HMDAccessoryBulletinNotificationRegistration alloc], "initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:", v5, v6, v7, v9);
  v11 = (void *)MEMORY[0x227676638]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v14;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v11);

  return v10;
}

+ (id)serviceRegistrationFromLocalRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDServiceBulletinNotificationRegistration *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  HMDServiceBulletinNotificationRegistration *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "serviceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromLocalConditions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDServiceBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:conditions:]([HMDServiceBulletinNotificationRegistration alloc], "initWithAccessoryUUID:serviceInstanceID:conditions:", v5, v6, v8);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v13;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v10);

  return v9;
}

+ (id)cameraSignificantEventRegistrationFromLocalRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDCameraSignificantEventBulletinNotificationRegistration *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  HMDCameraSignificantEventBulletinNotificationRegistration *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "notificationModes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "significantEventTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "personFamiliarityOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "conditions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromLocalConditions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HMDCameraSignificantEventBulletinNotificationRegistration initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:]([HMDCameraSignificantEventBulletinNotificationRegistration alloc], "initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:", v5, v7, v9, v11, v13);
  v15 = (void *)MEMORY[0x227676638]();
  v16 = a1;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v18;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v20, 0x20u);

  }
  objc_autoreleasePoolPop(v15);

  return v14;
}

+ (id)cameraReachabilityRegistrationFromLocalRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraReachabilityBulletinNotificationRegistration *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  HMDCameraReachabilityBulletinNotificationRegistration *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromLocalConditions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDCameraReachabilityBulletinNotificationRegistration initWithAccessoryUUID:conditions:]([HMDCameraReachabilityBulletinNotificationRegistration alloc], "initWithAccessoryUUID:conditions:", v5, v7);
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

  return v8;
}

+ (id)cameraAccessModeRegistrationFromLocalRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraAccessModeBulletinNotificationRegistration *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  HMDCameraAccessModeBulletinNotificationRegistration *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromLocalConditions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDCameraAccessModeBulletinNotificationRegistration initWithAccessoryUUID:conditions:]([HMDCameraAccessModeBulletinNotificationRegistration alloc], "initWithAccessoryUUID:conditions:", v5, v7);
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

  return v8;
}

+ (id)accessoryRegistrationFromMKFRegistration:(id)a3
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  HMDAccessoryBulletinNotificationRegistration *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  HMDDeviceAddress *v26;
  HMDBulletinNotificationRegistrationSource *v27;
  HMDAccessoryBulletinNotificationRegistrationRemote *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  HMDAccessoryBulletinNotificationRegistrationRemote *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromMKFConditions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "instanceID");
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "characteristic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "instanceID");
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = [HMDAccessoryBulletinNotificationRegistration alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v15;
  v40 = (void *)v13;
  v18 = -[HMDAccessoryBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:](v16, "initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:", v10, v13, v15, v17);

  objc_msgSend(v4, "deviceIdsIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdsDestination");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "modelID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isRestrictedGuestEnabled");

    if (v24)
    {
      objc_msgSend(v4, "guest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "modelID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
  }
  v36 = (void *)v20;
  v37 = (void *)v19;
  v26 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v19, v20);
  v27 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v22, v26);
  v38 = (void *)v18;
  v28 = -[HMDAccessoryBulletinNotificationRegistrationRemote initWithAccessoryBulletinNotificationRegistration:source:]([HMDAccessoryBulletinNotificationRegistrationRemote alloc], "initWithAccessoryBulletinNotificationRegistration:source:", v18, v27);
  v29 = (void *)MEMORY[0x227676638]();
  v30 = a1;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v35 = v10;
    v32 = v6;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v33;
    v43 = 2112;
    v44 = v28;
    v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    v6 = v32;
    v10 = v35;
  }

  objc_autoreleasePoolPop(v29);
  return v28;
}

+ (id)cameraSignificantEventRegistrationFromMKFRegistration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  HMDCameraSignificantEventBulletinNotificationRegistration *v15;
  void *v16;
  HMDCameraSignificantEventBulletinNotificationRegistration *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDDeviceAddress *v22;
  HMDBulletinNotificationRegistrationSource *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  HMDCameraSignificantEventBulletinNotificationRegistration *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraSignificantEventBulletinNotificationRegistrationRemote *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  HMDCameraSignificantEventBulletinNotificationRegistrationRemote *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromMKFConditions:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelID");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "notificationModes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "significantEventTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "personFamiliarityOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  v15 = [HMDCameraSignificantEventBulletinNotificationRegistration alloc];
  v33 = (void *)v6;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v8;
  v17 = -[HMDCameraSignificantEventBulletinNotificationRegistration initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:](v15, "initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:", v8, v10, v12, v14, v16);

  objc_msgSend(v4, "deviceIdsIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdsDestination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "modelID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v18, v19);
  v23 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v21, v22);
  v34 = -[HMDCameraSignificantEventBulletinNotificationRegistrationRemote initWithCameraCameraSignificantEventBulletinNotificationRegistration:source:]([HMDCameraSignificantEventBulletinNotificationRegistrationRemote alloc], "initWithCameraCameraSignificantEventBulletinNotificationRegistration:source:", v17, v23);
  v24 = (void *)MEMORY[0x227676638]();
  v25 = a1;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v31 = v19;
    v27 = v18;
    v28 = v17;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v29;
    v37 = 2112;
    v38 = v34;
    v39 = 2112;
    v40 = v4;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    v17 = v28;
    v18 = v27;
    v19 = v31;
  }

  objc_autoreleasePoolPop(v24);
  return v34;
}

+ (id)cameraReachabilityRegistrationFromMKFRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraReachabilityBulletinNotificationRegistration *v9;
  void *v10;
  HMDCameraReachabilityBulletinNotificationRegistration *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDDeviceAddress *v16;
  HMDBulletinNotificationRegistrationSource *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCameraReachabilityBulletinNotificationRegistration *v25;
  void *v26;
  void *v27;
  HMDCameraReachabilityBulletinNotificationRegistrationRemote *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  HMDCameraReachabilityBulletinNotificationRegistrationRemote *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromMKFConditions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMDCameraReachabilityBulletinNotificationRegistration alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCameraReachabilityBulletinNotificationRegistration initWithAccessoryUUID:conditions:](v9, "initWithAccessoryUUID:conditions:", v8, v10);

  objc_msgSend(v4, "deviceIdsIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdsDestination");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)v13;
  v27 = (void *)v12;
  v16 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v12, v13);
  v17 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v15, v16);
  v28 = -[HMDCameraReachabilityBulletinNotificationRegistrationRemote initWithCameraReachabilityBulletinNotificationRegistration:source:]([HMDCameraReachabilityBulletinNotificationRegistrationRemote alloc], "initWithCameraReachabilityBulletinNotificationRegistration:source:", v11, v17);
  v18 = (void *)MEMORY[0x227676638]();
  v19 = a1;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = v11;
    v21 = v8;
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v23;
    v31 = 2112;
    v32 = v28;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    v6 = v22;
    v8 = v21;
    v11 = v25;
  }

  objc_autoreleasePoolPop(v18);
  return v28;
}

+ (id)audioAnalysisNotificationRegistrationFromRemoteRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDDeviceAddress *v19;
  HMDBulletinNotificationRegistrationSource *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v25;
  void *v26;
  void *v28;
  void *v29;
  HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromMKFConditions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = [HMDAudioAnalysisEventBulletinNotificationRegistration alloc];
  objc_msgSend(v4, "classifierOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  objc_msgSend(v4, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v8;
  v14 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:](v9, "initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:", v8, v11, v13);

  objc_msgSend(v4, "deviceIdsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdsDestination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "modelID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v15, v16);
  v20 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v18, v19);
  v30 = -[HMDAudioAnalysisEventBulletinNotificationRegistrationRemote initWithAudioAnalysisEventBulletinNotificationRegistration:source:]([HMDAudioAnalysisEventBulletinNotificationRegistrationRemote alloc], "initWithAudioAnalysisEventBulletinNotificationRegistration:source:", v14, v20);
  v21 = (void *)MEMORY[0x227676638]();
  v22 = a1;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v28 = v16;
    v24 = v15;
    v25 = v14;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v26;
    v33 = 2112;
    v34 = v30;
    v35 = 2112;
    v36 = v4;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    v14 = v25;
    v15 = v24;
    v16 = v28;
  }

  objc_autoreleasePoolPop(v21);
  return v30;
}

+ (id)cameraAccessModeRegistrationFromMKFRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraAccessModeBulletinNotificationRegistration *v9;
  void *v10;
  HMDCameraAccessModeBulletinNotificationRegistration *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDDeviceAddress *v16;
  HMDBulletinNotificationRegistrationSource *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCameraAccessModeBulletinNotificationRegistration *v25;
  void *v26;
  void *v27;
  HMDCameraAccessModeBulletinNotificationRegistrationRemote *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  HMDCameraAccessModeBulletinNotificationRegistrationRemote *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conditionsFromMKFConditions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMDCameraAccessModeBulletinNotificationRegistration alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCameraAccessModeBulletinNotificationRegistration initWithAccessoryUUID:conditions:](v9, "initWithAccessoryUUID:conditions:", v8, v10);

  objc_msgSend(v4, "deviceIdsIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdsDestination");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)v13;
  v27 = (void *)v12;
  v16 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v12, v13);
  v17 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v15, v16);
  v28 = -[HMDCameraAccessModeBulletinNotificationRegistrationRemote initWithCameraAccessModeBulletinNotificationRegistration:source:]([HMDCameraAccessModeBulletinNotificationRegistrationRemote alloc], "initWithCameraAccessModeBulletinNotificationRegistration:source:", v11, v17);
  v18 = (void *)MEMORY[0x227676638]();
  v19 = a1;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = v11;
    v21 = v8;
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v23;
    v31 = 2112;
    v32 = v28;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    v6 = v22;
    v8 = v21;
    v11 = v25;
  }

  objc_autoreleasePoolPop(v18);
  return v28;
}

+ (id)conditionsFromMKFConditions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__HMDBulletinNotificationRegistrationUtilities_conditionsFromMKFConditions___block_invoke;
  v4[3] = &__block_descriptor_40_e32__16__0___MKFBulletinCondition__8l;
  v4[4] = a1;
  objc_msgSend(a3, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

HMDTimePeriodNotificationCondition *__76__HMDBulletinNotificationRegistrationUtilities_conditionsFromMKFConditions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMDPresenceNotificationCondition *v11;
  void *v12;
  HMDTimePeriodNotificationCondition *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  HMDTimeOfDayTimePeriodElement *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDTimeOfDayTimePeriodElement *v24;
  HMDTimeOfDayTimePeriodElement *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMDTimeOfDayTimePeriodElement *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  HMDSunriseSunsetTimePeriodElement *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDSunriseSunsetTimePeriodElement *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDSunriseSunsetTimePeriodElement *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  int v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557D0A00))
  {
    v4 = v3;
    objc_msgSend(v4, "presenceEventType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    objc_msgSend(v4, "presenceEventUserType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "users");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_313_147709);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [HMDPresenceNotificationCondition alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[HMDPresenceNotificationCondition initWithPresenceEventType:presenceEventUserType:userUUIDs:](v11, "initWithPresenceEventType:presenceEventUserType:userUUIDs:", v6, v8, v12);
    goto LABEL_20;
  }
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557CD560))
  {
    v14 = v3;
    objc_msgSend(v14, "startElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "conformsToProtocol:", &unk_2557D1198) & 1) != 0)
    {
      objc_msgSend(v14, "endElement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_2557D1198);

      if (v17)
      {
        objc_msgSend(v14, "startElement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endElement");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = [HMDTimeOfDayTimePeriodElement alloc];
        objc_msgSend(v18, "hour");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");
        objc_msgSend(v18, "minute");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v20, "initWithHour:minute:", v22, objc_msgSend(v23, "unsignedIntegerValue"));

        v25 = [HMDTimeOfDayTimePeriodElement alloc];
        objc_msgSend(v19, "hour");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "unsignedIntegerValue");
        objc_msgSend(v19, "minute");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v25, "initWithHour:minute:", v27, objc_msgSend(v28, "unsignedIntegerValue"));

        v13 = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:]([HMDTimePeriodNotificationCondition alloc], "initWithStartElement:endElement:", v24, v29);
LABEL_14:

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v14, "startElement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "conformsToProtocol:", &unk_2558766F8) & 1) != 0)
    {
      objc_msgSend(v14, "endElement");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "conformsToProtocol:", &unk_2558766F8);

      if (v36)
      {
        objc_msgSend(v14, "startElement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endElement");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = [HMDSunriseSunsetTimePeriodElement alloc];
        objc_msgSend(v18, "significantEvent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "offsetSeconds");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        HMDTimeOffsetToDateComponents(objc_msgSend(v39, "integerValue"), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:](v37, "initWithSignificantEvent:offset:", v38, v40);

        v41 = [HMDSunriseSunsetTimePeriodElement alloc];
        objc_msgSend(v19, "significantEvent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "offsetSeconds");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        HMDTimeOffsetToDateComponents(objc_msgSend(v43, "integerValue"), 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:](v41, "initWithSignificantEvent:offset:", v42, v44);

        v13 = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:]([HMDTimePeriodNotificationCondition alloc], "initWithStartElement:endElement:", v24, v45);
        goto LABEL_14;
      }
    }
    else
    {

    }
    v46 = (void *)MEMORY[0x227676638]();
    v47 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startElement");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endElement");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 138543874;
      v54 = v49;
      v55 = 2112;
      v56 = v50;
      v57 = 2112;
      v58 = v51;
      _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized time period start element: %@ end element: %@, unable to convert", (uint8_t *)&v53, 0x20u);

    }
    objc_autoreleasePoolPop(v46);
    v13 = 0;
    goto LABEL_19;
  }
  v30 = (void *)MEMORY[0x227676638]();
  v31 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = v33;
    v55 = 2112;
    v56 = v3;
    _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized condition: %@, unable to convert", (uint8_t *)&v53, 0x16u);

  }
  objc_autoreleasePoolPop(v30);
  v13 = 0;
LABEL_20:

  return v13;
}

id __76__HMDBulletinNotificationRegistrationUtilities_conditionsFromMKFConditions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __84__HMDBulletinNotificationRegistrationUtilities_presenceConditionFromLocalCondition___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

id __78__HMDBulletinNotificationRegistrationUtilities_conditionsFromLocalConditions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    +[HMDBulletinNotificationRegistrationUtilities presenceConditionFromLocalCondition:](HMDBulletinNotificationRegistrationUtilities, "presenceConditionFromLocalCondition:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = (void *)v7;

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v6 = v9;

    +[HMDBulletinNotificationRegistrationUtilities timePeriodConditionFromLocalCondition:](HMDBulletinNotificationRegistrationUtilities, "timePeriodConditionFromLocalCondition:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized local condition: %@, unable to convert", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_15:

  return v10;
}

id __105__HMDBulletinNotificationRegistrationUtilities_createAndAddLocalConditionsToRegistration_moc_conditions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(*(id *)(a1 + 48), "createAndAddLocalPresenceConditionToRegistration:moc:condition:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_13;
    }
    v8 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v6 = v9;

    objc_msgSend(*(id *)(a1 + 48), "createAndAddLocalTimePeriodConditionToRegistration:moc:condition:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

LABEL_13:
  return v10;
}

@end
