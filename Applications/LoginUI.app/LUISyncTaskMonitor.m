@implementation LUISyncTaskMonitor

+ (BOOL)syncTaskMonitorShouldStart
{
  void *v2;
  unsigned int v3;

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LUIDisableSyncTaskStateIndicator")) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100088CE8 != -1)
    dispatch_once(&qword_100088CE8, &stru_100068D10);
  return (id)qword_100088CE0;
}

- (LUISyncTaskMonitor)init
{
  LUISyncTaskMonitor *v2;
  NSMutableSet *v3;
  NSMutableSet *doneSyncingUIDs;
  NSMutableDictionary *v5;
  NSMutableDictionary *uidPresenterMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *uidSyncStateMap;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *monitorQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LUISyncTaskMonitor;
  v2 = -[LUISyncTaskMonitor init](&v14, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    doneSyncingUIDs = v2->_doneSyncingUIDs;
    v2->_doneSyncingUIDs = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    uidPresenterMap = v2->_uidPresenterMap;
    v2->_uidPresenterMap = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    uidSyncStateMap = v2->_uidSyncStateMap;
    v2->_uidSyncStateMap = v7;

    v2->_syncStateUpdateFrequency = 1.0;
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.LoginUI.LUISyncTaskMonitor", v10);
    monitorQueue = v2->_monitorQueue;
    v2->_monitorQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)addSyncTaskPresenter:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  LUISyncTaskMonitor *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "uid") >= 0x1F7)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor monitorQueue](self, "monitorQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006010;
    block[3] = &unk_100068D60;
    v11 = v8;
    v12 = self;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

- (void)removeSyncTaskPresenter:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor monitorQueue](self, "monitorQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006304;
  v7[3] = &unk_100068C30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_monitorQueueStartObservingSyncTaskStateChangeIfNeeded
{
  if (!-[LUISyncTaskMonitor isObservingSyncState](self, "isObservingSyncState"))
  {
    -[LUISyncTaskMonitor setIsObservingSyncState:](self, "setIsObservingSyncState:", 1);
    -[LUISyncTaskMonitor _monitorQueueScheduleSyncTaskStateUpdate](self, "_monitorQueueScheduleSyncTaskStateUpdate");
  }
}

- (void)_monitorQueueScheduleSyncTaskStateUpdate
{
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  -[LUISyncTaskMonitor syncStateUpdateFrequency](self, "syncStateUpdateFrequency");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  v5 = objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor monitorQueue](self, "monitorQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006558;
  block[3] = &unk_100068C58;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

- (void)_monitorQueueUpdateSyncTaskState
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  void *v38;
  _BYTE v39[128];

  if (-[LUISyncTaskMonitor isObservingSyncState](self, "isObservingSyncState"))
  {
    v3 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG))
      sub_10003B108(v3, v4, v5, v6, v7, v8, v9, v10);
    v38 = 0;
    v11 = MKBCurrentSyncBubbleSessionID(&v38);
    v12 = v38;
    v13 = qword_100088F08;
    v14 = os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14)
        sub_10003B0A4((uint64_t)v12, v13, v15, v16, v17, v18, v19, v20);
    }
    else if (v14)
    {
      sub_10003B030(v11, v13);
    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor uidPresenterMap](self, "uidPresenterMap"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000067F4;
    v32[3] = &unk_100068D88;
    v32[4] = self;
    v32[5] = &v34;
    v33 = v11;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v32);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor doneSyncingUIDs](self, "doneSyncingUIDs", 0));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor uidPresenterMap](self, "uidPresenterMap"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v26);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v23);
    }

    if (*((_BYTE *)v35 + 24))
      -[LUISyncTaskMonitor _monitorQueueScheduleSyncTaskStateUpdate](self, "_monitorQueueScheduleSyncTaskStateUpdate");
    else
      -[LUISyncTaskMonitor setIsObservingSyncState:](self, "setIsObservingSyncState:", 0);
    _Block_object_dispose(&v34, 8);

  }
}

- (void)_monitorQueueNotifyPresentersForUID:(id)a3 syncTaskState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  unint64_t v25;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor uidPresenterMap](self, "uidPresenterMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  v9 = (char *)objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG))
      sub_10003B1F8((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
    for (i = 0; i != v10; ++i)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointerAtIndex:", i));
      v20 = v19;
      if (v19)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100006B78;
        block[3] = &unk_100068DB0;
        v24 = v19;
        v25 = a4;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUISyncTaskMonitor uidPresenterMap](self, "uidPresenterMap"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v6));
    objc_msgSend(v22, "compact");

  }
}

- (void)_monitorQueueIncreaseUpdateFrequency
{
  double v3;
  double v4;

  -[LUISyncTaskMonitor syncStateUpdateFrequency](self, "syncStateUpdateFrequency");
  if (v3 < 7.0)
  {
    -[LUISyncTaskMonitor syncStateUpdateFrequency](self, "syncStateUpdateFrequency");
    -[LUISyncTaskMonitor setSyncStateUpdateFrequency:](self, "setSyncStateUpdateFrequency:", fmin(v4 + v4, 7.0));
  }
}

- (NSMutableDictionary)uidPresenterMap
{
  return self->_uidPresenterMap;
}

- (void)setUidPresenterMap:(id)a3
{
  objc_storeStrong((id *)&self->_uidPresenterMap, a3);
}

- (NSMutableDictionary)uidSyncStateMap
{
  return self->_uidSyncStateMap;
}

- (void)setUidSyncStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_uidSyncStateMap, a3);
}

- (NSMutableSet)doneSyncingUIDs
{
  return self->_doneSyncingUIDs;
}

- (void)setDoneSyncingUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_doneSyncingUIDs, a3);
}

- (BOOL)isObservingSyncState
{
  return self->_isObservingSyncState;
}

- (void)setIsObservingSyncState:(BOOL)a3
{
  self->_isObservingSyncState = a3;
}

- (double)syncStateUpdateFrequency
{
  return self->_syncStateUpdateFrequency;
}

- (void)setSyncStateUpdateFrequency:(double)a3
{
  self->_syncStateUpdateFrequency = a3;
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_monitorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_doneSyncingUIDs, 0);
  objc_storeStrong((id *)&self->_uidSyncStateMap, 0);
  objc_storeStrong((id *)&self->_uidPresenterMap, 0);
}

@end
