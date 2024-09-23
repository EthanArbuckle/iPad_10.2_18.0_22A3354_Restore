@implementation EKAlarmEngine

uint64_t __32___EKAlarmEngine_sharedInstance__block_invoke()
{
  _EKAlarmEngine *v0;
  void *v1;

  v0 = objc_alloc_init(_EKAlarmEngine);
  v1 = (void *)sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance___shared, "start");
}

id __22___EKAlarmEngine_init__block_invoke()
{
  return objc_alloc_init(MEMORY[0x24BDC74E8]);
}

void __23___EKAlarmEngine_start__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "settingForKey:", CFSTR("LastDBSequence"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE128D0]), "initWithSerializedSequenceString:", v2);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "serializedSequenceString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Starting up. Last sequence was %{public}@, context is %@", (uint8_t *)&v9, 0x16u);

  }
}

uint64_t __38___EKAlarmEngine_didRegisterForAlarms__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleTimer");
}

uint64_t __37___EKAlarmEngine_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "Updated next fire date: %@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_timerFired");
}

uint64_t __50___EKAlarmEngine__protectedDataDidBecomeAvailable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleTimer");
}

void __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _QWORD *v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "_haveAlarmsChanged:", v2);
  v4 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    v5 = 0;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v7 = v4[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke_29;
    block[3] = &unk_24D484738;
    block[4] = v4;
    dispatch_async(v7, block);
  }
  else if ((objc_msgSend(v4, "_populateAlarmTable:", v2) & 1) == 0)
  {
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Alarm table population not started.  Will wait until the end of an existing population action to retry.", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
  }

}

uint64_t __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleTimer");
}

void __37___EKAlarmEngine__haveAlarmsChanged___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if ((a2 & 1) != 0)
  {
    if (v11)
    {
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE13E38]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      }
      else
      {
        objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE13E40]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        }
        else
        {
          objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE13E48]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 != 0;

        }
      }

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

void __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v52 = v3;
    _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "There were %lu alarms found which will occur in the next 15 days", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "deleteAllAlarms");
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = *(id *)(a1 + 32);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v4)
    {
      v5 = v4;
      v44 = *(_QWORD *)v47;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v47 != v44)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v6);
          objc_msgSend(*(id *)(a1 + 40), "insertNewAlarm");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "ownerID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "entityID");

          objc_msgSend(v7, "ownerDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "ownerURI");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setEntityURI:", v13);

          v14 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "alarmID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "entityID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAlarmID:", v16);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setEntityID:", v17);

          v18 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "alarmID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "databaseID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setDatabaseID:", v20);

          objc_msgSend(v8, "setEntityDate:", v11);
          objc_msgSend(v7, "ownerTimeZone");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setEntityTimeZone:", v22);

          objc_msgSend(v7, "fireDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setFireTime:", v23);

          objc_msgSend(v7, "externalID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setExternalID:", v24);

          objc_msgSend(v7, "acknowledgedDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAcknowledgedDate:", v25);

          ++v6;
        }
        while (v5 != v6);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v5);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "sequenceToken");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(a1 + 48);
  v28 = *(void **)(v27 + 8);
  *(_QWORD *)(v27 + 8) = v26;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "serializedSequenceString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSetting:forKey:", v29, CFSTR("LastDBSequence"));
  v30 = *(void **)(a1 + 40);
  v31 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceReferenceDate");
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%f"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSetting:forKey:", v33, CFSTR("CacheEndDate"));

  v34 = *(void **)(a1 + 40);
  v45 = 0;
  LOBYTE(v30) = objc_msgSend(v34, "save:", &v45);
  v35 = v45;
  if ((v30 & 1) == 0)
  {
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke_cold_1((uint64_t)v35, v36, v37, v38, v39, v40, v41, v42);

  }
}

uint64_t __35___EKAlarmEngine__populateFinished__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleTimer");
}

void __34___EKAlarmEngine__rescheduleTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[16];
  uint8_t v20[16];

  objc_msgSend(*(id *)(a1 + 32), "nextAlarmFireTime");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "settingForKey:", CFSTR("CacheEndDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      v8 = v7;
      objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = v10;

      +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11 <= v8 + -3600.0)
      {
        if (v13)
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "No alarms found. Setting time to cache end date.", v18, 2u);
        }

        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v8);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "We're close to our cache end date. Going to attempt a rebuild.", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "_updateWithForceForAlarmTable:", 1);
      }
    }
    else
    {
      +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "No cache end date. This means we haven't populated the table. No timer will be set.", v20, 2u);
      }

    }
  }
}

uint64_t __44___EKAlarmEngine__installTimerWithFireDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_installTimerWithFireDate__dateFormatter;
  _installTimerWithFireDate__dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_installTimerWithFireDate__dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

void __37___EKAlarmEngine__notifyAlarmsFired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "Notifying: %lu alarms fired.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("EKAlarmEngineAlarmOccurrencesKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("EKAlarmEngineAlarmsDidFireNotification"), *(_QWORD *)(a1 + 40), v4);

}

void __29___EKAlarmEngine__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  double v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  uint64_t v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  EKCalendarItemAlertInfo *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  EKCalendarItemAlertInfo *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  char v90;
  id v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id obj;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  BOOL v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  BOOL v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint8_t v136[128];
  uint8_t v137[4];
  void *v138;
  uint8_t v139[128];
  uint8_t buf[4];
  _QWORD v141[5];

  v1 = a1;
  *(_QWORD *)((char *)&v141[2] + 4) = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "alarmsBetweenStartDate:endDate:", *(_QWORD *)(*(_QWORD *)(v1 + 40) + 24), *(_QWORD *)(v1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v141[0] = objc_msgSend(v2, "count");
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu alarm(s)", buf, 0xCu);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 40), "_eventStore");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x24BDBCE48]);
    v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    v6 = (void *)CalCopyTimeZone();
    v102 = v5;
    objc_msgSend(v5, "setTimeZone:", v6);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v103 = v2;
    obj = v2;
    v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v139, 16);
    if (v109)
    {
      v108 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v109; ++i)
        {
          if (*(_QWORD *)v133 != v108)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
          objc_msgSend(v8, "entityTimeZone");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)MEMORY[0x24BDBCF38];
            objc_msgSend(v8, "entityTimeZone");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "timeZoneWithName:", v11);
            v126 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v126 = 0;
          }

          objc_msgSend(v8, "entityID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "intValue");

          objc_msgSend(v8, "databaseID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

          objc_msgSend(MEMORY[0x24BDC74F8], "objectIDWithEntityType:rowID:databaseID:", 2, v13, v15);
          v16 = objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(v1 + 40), "_isDataProtected") & 1) != 0)
          {
            objc_msgSend(v8, "entityURI");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = objc_alloc(MEMORY[0x24BDBCF48]);
              objc_msgSend(v8, "entityURI");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "initWithString:", v19);
            }
            else
            {
              +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "entityID");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v137 = 138412290;
                v138 = v35;
                _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Side alarm has no Entity URI, will not fire. rowID: %@", v137, 0xCu);

              }
              v20 = 0;
            }

            objc_msgSend(v8, "allDay");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "BOOLValue");

            objc_msgSend(v8, "acknowledgedDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = 0;
            v113 = 0;
            LOBYTE(v29) = 0;
            v122 = 0;
            v123 = 0;
            v119 = 0;
            v120 = 0;
            v121 = 0;
            v124 = 0;
            v125 = 0;
            v31 = 0.0;
            v34 = 0.0;
            v115 = v23 != 0;
          }
          else
          {
            v21 = i;
            objc_msgSend(v8, "entityDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "eventForObjectID:occurrenceDate:checkValid:", v16, v22, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v23, "title");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "preferredLocationWithoutPrediction");
              v24 = objc_claimAutoreleasedReturnValue();
              -[NSObject address](v24, "address");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject title](v24, "title");
              v26 = (id)objc_claimAutoreleasedReturnValue();
              v123 = v25;
              if (!objc_msgSend(v26, "length"))
              {
                v27 = v25;
                v28 = v26;
                v26 = v27;

              }
              v124 = v26;
              v29 = +[CALNNotificationFilter shouldIgnoreNotificationForEvent:](CALNNotificationFilter, "shouldIgnoreNotificationForEvent:", v23);
              if (v29)
              {
                objc_msgSend(v104, "addObject:", v8);
                +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = 0.0;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v8, "entityID");
                  v32 = v16;
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v137 = 138412290;
                  v138 = v33;
                  _os_log_impl(&dword_215D9B000, v30, OS_LOG_TYPE_DEFAULT, "Removing side alarm for junk or maybe junk event with rowID: %@", v137, 0xCu);

                  v16 = v32;
                }
                v112 = 0;
                v113 = 0;
                v119 = 0;
                v120 = 0;
                v121 = 0;
                v122 = 0;
                v20 = 0;
                v34 = 0.0;
              }
              else
              {
                v38 = v16;
                v39 = objc_msgSend(v23, "participationStatus");
                v40 = objc_msgSend(v23, "status");
                BYTE4(v113) = 0;
                if (objc_msgSend(v23, "isCurrentUserInvitedAttendee") && v39 == 3 && v40 != 3)
                {
                  objc_msgSend(v23, "calendar");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "source");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "constraints");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  BYTE4(v113) = objc_msgSend(v43, "statusesAreAccurate");

                }
                objc_msgSend(v23, "externalURL");
                v20 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "endDate");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject mapKitHandle](v24, "mapKitHandle");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject geoLocation](v24, "geoLocation");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v113) = v44 != 0;

                -[NSObject geoLocation](v24, "geoLocation");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "coordinate");
                v34 = v46;

                -[NSObject geoLocation](v24, "geoLocation");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "coordinate");
                v31 = v48;

                objc_msgSend(v23, "travelStartLocation");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "routing");
                v120 = (void *)objc_claimAutoreleasedReturnValue();

                HIDWORD(v112) = objc_msgSend(v23, "isSelfOrganized") ^ 1;
                objc_msgSend(v23, "organizer");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "emailAddress");
                v119 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v23, "calendar");
                v30 = objc_claimAutoreleasedReturnValue();
                LOBYTE(v112) = -[NSObject isSuggestedEventCalendar](v30, "isSuggestedEventCalendar");
                v16 = v38;
              }

            }
            else
            {
              +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
              v24 = objc_claimAutoreleasedReturnValue();
              v31 = 0.0;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                __29___EKAlarmEngine__timerFired__block_invoke_cold_2(buf, v8, v141, v24);
              v112 = 0;
              v113 = 0;
              LOBYTE(v29) = 0;
              v122 = 0;
              v123 = 0;
              v119 = 0;
              v120 = 0;
              v121 = 0;
              v20 = 0;
              v124 = 0;
              v125 = 0;
              v34 = 0.0;
            }

            v115 = 0;
            v37 = 0;
            i = v21;
          }

          objc_msgSend(v8, "entityDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = (void *)v16;
          objc_msgSend(v116, "eventForObjectID:occurrenceDate:checkValid:", v16, v51, 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          {
            v37 = objc_msgSend(v52, "isAllDay");
            objc_msgSend(v52, "travelTime");
            v54 = v53 > 0.0;
            objc_msgSend(v52, "calendar");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "source");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v110 = v54;
            if ((objc_msgSend(v56, "supportsAlarmAcknowledgedDate") & 1) != 0)
            {
              v118 = 0;
            }
            else
            {
              objc_msgSend(v52, "uniqueIdentifier");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v58 = v123;
            v57 = (void *)v20;

          }
          else
          {
            v57 = (void *)v20;
            v118 = 0;
            v110 = 0;
            v58 = v123;
          }
          objc_msgSend(v8, "acknowledgedDate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            objc_msgSend(v8, "acknowledgedDate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "fireTime");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "timeIntervalSinceDate:", v61);
            v115 = v62 >= 0.0;

          }
          objc_msgSend(v8, "acknowledgedDate");
          v63 = objc_claimAutoreleasedReturnValue();
          v111 = v37;
          if (v63
            && (v64 = (void *)v63,
                objc_msgSend(v8, "acknowledgedDate"),
                v65 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v65, "timeIntervalSinceReferenceDate"),
                v67 = v66,
                v65,
                v64,
                v67 >= 1.0))
          {
            v69 = 0;
          }
          else
          {
            objc_msgSend(v8, "refiring");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "BOOLValue");

          }
          objc_msgSend(*(id *)(v1 + 40), "_alertInfoAlarmIDFromSideAlarm:", v8);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "externalID");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v71 = v57;
          if (v70)
          {
            objc_msgSend(v8, "externalID");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "alarmWithExternalID:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            v70 = (void *)objc_msgSend(v73, "type");
          }
          if (v71)
            v74 = v29;
          else
            v74 = 1;
          if ((v74 & 1) == 0)
          {
            v75 = [EKCalendarItemAlertInfo alloc];
            objc_msgSend(v8, "entityDate");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "externalID");
            v77 = v1;
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "databaseID");
            v107 = v70;
            v79 = i;
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            BYTE2(v101) = v112;
            BYTE1(v101) = v69;
            LOBYTE(v101) = v110;
            BYTE4(v100) = v115;
            LODWORD(v100) = objc_msgSend(v80, "intValue");
            LOBYTE(v99) = BYTE4(v113);
            v81 = -[EKCalendarItemAlertInfo initWithTitle:location:date:endDate:timeZone:allDay:tentative:publisherBulletinID:entityID:appLink:proximity:externalID:databaseID:acknowledged:dismissalID:alarmID:isOffsetFromTravelTimeStart:refiring:pseudoEvent:](v75, "initWithTitle:location:date:endDate:timeZone:allDay:tentative:publisherBulletinID:entityID:appLink:proximity:externalID:databaseID:acknowledged:dismissalID:alarmID:isOffsetFromTravelTimeStart:refiring:pseudoEvent:", v125, v124, v76, v122, v126, v111, v99, 0, v71, 0, 0, v78, v100, v118, v117, v101);

            i = v79;
            v1 = v77;
            v58 = v123;

            -[EKCalendarItemAlertInfo setMapKitHandle:](v81, "setMapKitHandle:", v121);
            -[EKCalendarItemAlertInfo setHasGeoLocationCoordinates:](v81, "setHasGeoLocationCoordinates:", v113);
            -[EKCalendarItemAlertInfo setGeoLocationCoordinates:](v81, "setGeoLocationCoordinates:", v34, v31);
            -[EKCalendarItemAlertInfo setHasOrganizerThatIsNotCurrentUser:](v81, "setHasOrganizerThatIsNotCurrentUser:", HIDWORD(v112));
            -[EKCalendarItemAlertInfo setOrganizerEmailAddress:](v81, "setOrganizerEmailAddress:", v119);
            -[EKCalendarItemAlertInfo setStartLocationRouting:](v81, "setStartLocationRouting:", v120);
            -[EKCalendarItemAlertInfo setLocationAddress:](v81, "setLocationAddress:", v123);
            -[EKCalendarItemAlertInfo setTriggerType:](v81, "setTriggerType:", v107);
            objc_msgSend(v8, "fireTime");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKCalendarItemAlertInfo setFireDate:](v81, "setFireDate:", v82);

            objc_msgSend(v105, "addObject:", v81);
          }

        }
        v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v139, 16);
      }
      while (v109);
    }

    objc_msgSend(*(id *)(v1 + 40), "_notifyAlarmsFired:", v105);
    v83 = v104;
    if (objc_msgSend(v104, "count"))
    {
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v84 = v104;
      v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
      if (v85)
      {
        v86 = v85;
        v87 = *(_QWORD *)v129;
        do
        {
          for (j = 0; j != v86; ++j)
          {
            if (*(_QWORD *)v129 != v87)
              objc_enumerationMutation(v84);
            objc_msgSend(*(id *)(v1 + 32), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j));
          }
          v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
        }
        while (v86);
      }

      v89 = *(void **)(v1 + 32);
      v127 = 0;
      v90 = objc_msgSend(v89, "save:", &v127);
      v91 = v127;
      if ((v90 & 1) == 0)
      {
        +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          __29___EKAlarmEngine__timerFired__block_invoke_cold_1((uint64_t)v91, v92, v93, v94, v95, v96, v97, v98);

      }
      v83 = v104;
    }

    v2 = v103;
  }

}

void __45___EKAlarmEngine__timeDidChangeSignificantly__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 88);
  *(_QWORD *)(v1 + 88) = 0;

}

void __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Unable to save alarm side table: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __29___EKAlarmEngine__timerFired__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Unable to save alarm side table when pruning side alarms: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __29___EKAlarmEngine__timerFired__block_invoke_cold_2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "entityID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_215D9B000, a4, OS_LOG_TYPE_ERROR, "Could not fetch event from sideAlarm object. Somehow got an alarm for a non-event. rowID: %@", a1, 0xCu);

}

@end
