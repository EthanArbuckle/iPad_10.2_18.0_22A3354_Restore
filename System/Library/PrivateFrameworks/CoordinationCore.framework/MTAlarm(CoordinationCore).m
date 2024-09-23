@implementation MTAlarm(CoordinationCore)

- (id)COPreferredAlarm:()CoordinationCore
{
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (!v4 || objc_msgSend(a1, "isFiring"))
    goto LABEL_6;
  if (objc_msgSend(v4, "isFiring"))
  {
LABEL_4:
    v5 = v4;
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "isSnoozed"))
  {
LABEL_6:
    v5 = a1;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isSnoozed"))
    goto LABEL_4;
  v6 = a1;
  objc_msgSend(v4, "lastModifiedDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "lastModifiedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastModifiedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", v11) == 1)
    {

    }
    else
    {
      objc_msgSend(v6, "lastModifiedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_8;
    }
    v13 = v4;

    v6 = v13;
  }
LABEL_8:

  return v6;
}

- (id)co_sanitizedHomeKitAlarm
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "siriContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE19C48];
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE19C48]);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("COAlarmSiriContextIsMediaSystemKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5 || (objc_msgSend(a1, "isFiring") & 1) != 0 || (objc_msgSend(a1, "isSnoozed") & 1) != 0)
  {
    COCoreLogForCategory(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MTAlarm(CoordinationCore) co_sanitizedHomeKitAlarm].cold.1(a1, v6);

    v7 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v7, "setFiredDate:", 0);
    objc_msgSend(v7, "setSnoozeFireDate:", 0);
    objc_msgSend(v7, "setDismissedDate:", 0);
    if (v4)
    {
      v8 = (void *)objc_msgSend(v2, "mutableCopy");
      objc_msgSend(v8, "removeObjectForKey:", v3);
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("COAlarmSiriContextIsMediaSystemKey"));
      objc_msgSend(v7, "setSiriContext:", v8);

    }
  }
  else
  {
    v7 = a1;
  }

  return v7;
}

- (id)co_targetReference
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "siriContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE19C48]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)co_isMediaSystemOriginating
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "siriContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("COAlarmSiriContextIsMediaSystemKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)co_HomeKitAlarmCopy
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BE67840]);
  objc_msgSend(v2, "setHour:", objc_msgSend(a1, "hour"));
  objc_msgSend(v2, "setMinute:", objc_msgSend(a1, "minute"));
  objc_msgSend(v2, "setEnabled:", objc_msgSend(a1, "isEnabled"));
  objc_msgSend(v2, "setRepeatSchedule:", objc_msgSend(a1, "repeatSchedule"));
  objc_msgSend(a1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  objc_msgSend(a1, "sound");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSound:", v4);

  objc_msgSend(a1, "siriContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSiriContext:", v5);

  return v2;
}

- (id)co_HomeKitSaveDate
{
  return objc_getAssociatedObject(a1, sel_co_HomeKitSaveDate);
}

- (id)co_alarmUpdatedWithHomeKitAlarm:()CoordinationCore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(a1, "lastModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "co_HomeKitSaveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_36;
  if (objc_msgSend(v6, "compare:", v5) == -1)
  {
    v8 = 0;
    goto LABEL_36;
  }
  v9 = objc_msgSend(v4, "isEnabled");
  v10 = objc_msgSend(v4, "hour");
  v11 = objc_msgSend(v4, "minute");
  objc_msgSend(v4, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "repeatSchedule");
  objc_msgSend(v4, "sound");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v9 == objc_msgSend(a1, "isEnabled"))
  {
    if (objc_msgSend(a1, "hour") == v10)
    {
      if (objc_msgSend(a1, "minute") == v11)
      {
        v8 = 0;
        goto LABEL_18;
      }
LABEL_16:
      v8 = (void *)objc_msgSend(a1, "mutableCopy");
      goto LABEL_17;
    }
LABEL_12:
    v8 = (void *)objc_msgSend(a1, "mutableCopy");
    goto LABEL_13;
  }
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "setEnabled:", v9);
  if (objc_msgSend(a1, "hour") == v10)
    goto LABEL_14;
  if (!v8)
    goto LABEL_12;
LABEL_13:
  objc_msgSend(v8, "setHour:", v10);
LABEL_14:
  if (objc_msgSend(a1, "minute") == v11)
    goto LABEL_18;
  if (!v8)
    goto LABEL_16;
LABEL_17:
  objc_msgSend(v8, "setMinute:", v11);
LABEL_18:
  objc_msgSend(a1, "title");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v14)
  {

  }
  else
  {
    v15 = (void *)v14;
    objc_msgSend(a1, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "isEqual:", v16);

    if ((v17 & 1) == 0)
    {
      v18 = v24;
      if (!v8)
        v8 = (void *)objc_msgSend(a1, "mutableCopy");
      objc_msgSend(v8, "setTitle:", v12);
      goto LABEL_25;
    }
  }
  v18 = v24;
LABEL_25:
  if (objc_msgSend(a1, "repeatSchedule") != v18)
  {
    if (!v8)
      v8 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v8, "setRepeatSchedule:", v18);
  }
  objc_msgSend(a1, "sound");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v13 == (void *)v19)
  {

  }
  else
  {
    v20 = (void *)v19;
    objc_msgSend(a1, "sound");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v13, "isEqual:", v21);

    if ((v22 & 1) == 0)
    {
      if (!v8)
        v8 = (void *)objc_msgSend(a1, "mutableCopy");
      objc_msgSend(v8, "setSound:", v13);
    }
  }

LABEL_36:
  return v8;
}

- (void)co_sanitizedHomeKitAlarm
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_215E92000, a2, OS_LOG_TYPE_ERROR, "%@ required sanitizing!", (uint8_t *)&v4, 0xCu);

}

@end
