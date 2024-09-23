@implementation CBSensorActivityDataProvider

- (CBSensorActivityDataProvider)init
{
  void *v3;
  CBSensorActivityDataProvider *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = -[CBSensorActivityDataProvider initWithSystemStatusServer:](self, "initWithSystemStatusServer:", v3);

  return v4;
}

- (CBSensorActivityDataProvider)initWithSystemStatusServer:(id)a3
{
  id v4;
  CBSensorActivityDataProvider *v5;
  STUIDataAccessStatusDomain *v6;
  STUIDataAccessStatusDomain *dataAccessDomain;
  uint64_t v8;
  NSObject *v9;
  STUIDataAccessStatusDomain *v10;
  STUIDataAccessStatusDomain *v11;
  uint64_t v12;
  NSHashTable *observers;
  void *v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;
  uint8_t buf[4];
  STUIDataAccessStatusDomain *v20;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBSensorActivityDataProvider;
  v5 = -[CBSensorActivityDataProvider init](&v18, "init");
  if (v5)
  {
    v6 = (STUIDataAccessStatusDomain *)objc_msgSend(objc_alloc((Class)STUIDataAccessStatusDomain), "initWithServerHandle:", v4);
    dataAccessDomain = v5->_dataAccessDomain;
    v5->_dataAccessDomain = v6;

    v8 = CheckerBoardLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v5->_dataAccessDomain;
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initializing CBSensorActivityDataProvider with dataAccessDomain %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v5);
    v11 = v5->_dataAccessDomain;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000187F0;
    v16[3] = &unk_100075970;
    objc_copyWeak(&v17, (id *)buf);
    -[STUIDataAccessStatusDomain observeDataWithBlock:](v11, "observeDataWithBlock:", v16);
    v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDataAccessStatusDomain data](v5->_dataAccessDomain, "data"));
    -[CBSensorActivityDataProvider _handleNewDomainData:](v5, "_handleNewDomainData:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STUIDataAccessStatusDomain invalidate](self->_dataAccessDomain, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CBSensorActivityDataProvider;
  -[CBSensorActivityDataProvider dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding sensor activity data provider observer %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider observers](self, "observers"));
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing sensor activity data provider observer %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider observers](self, "observers"));
  objc_msgSend(v7, "removeObject:", v4);

}

- (NSSet)activeAndRecentSensorActivityAttributions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider activeSensorActivityAttributions](self, "activeSensorActivityAttributions"));
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider recentSensorActivityAttributions](self, "recentSensorActivityAttributions"));
  objc_msgSend(v7, "unionSet:", v8);

  v9 = objc_msgSend(v7, "copy");
  return (NSSet *)v9;
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider activeSensorActivityAttributions](self, "activeSensorActivityAttributions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectsPassingTest:", &stru_1000759B0));

  return (NSSet *)v3;
}

- (CBSensorActivityAttribution)mostRecentCameraAndMicrophoneSensorActivityAttribution
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider _recentCameraAndMicrophoneActivityAttributions](self, "_recentCameraAndMicrophoneActivityAttributions"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        if (v9 != v3)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), "bundleIdentifier", (_QWORD)v14));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
          if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
          {
            v12 = objc_msgSend(v9, "sensor");

            if (v12)
              goto LABEL_12;
            v10 = v3;
            v3 = v9;
          }
          else
          {

          }
        }
LABEL_12:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (CBSensorActivityAttribution *)v3;
}

- (id)_recentCameraAndMicrophoneActivityAttributions
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider recentSensorActivityAttributions](self, "recentSensorActivityAttributions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v9, "sensor", (_QWORD)v12) || objc_msgSend(v9, "sensor") == (id)1)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return v10;
}

- (void)_handleNewDomainData:(id)a3
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
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeAttributionData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataAccessAttributions"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bs_map:", &stru_1000759F0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

    -[CBSensorActivityDataProvider setActiveSensorActivityAttributions:](self, "setActiveSensorActivityAttributions:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recentAttributionData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataAccessAttributions"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_map:", &stru_100075A10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

    -[CBSensorActivityDataProvider setRecentSensorActivityAttributions:](self, "setRecentSensorActivityAttributions:", v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    -[CBSensorActivityDataProvider setActiveSensorActivityAttributions:](self, "setActiveSensorActivityAttributions:", v14);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    -[CBSensorActivityDataProvider setRecentSensorActivityAttributions:](self, "setRecentSensorActivityAttributions:", v7);
  }

  v15 = CheckerBoardLogHandleForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notifying sensor activity data provider observers of activity change", v17, 2u);
  }

  -[CBSensorActivityDataProvider _notifyObserversOfActivityChange](self, "_notifyObserversOfActivityChange");
}

- (void)_notifyObserversOfActivityChange
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityDataProvider observers](self, "observers"));
  v4 = objc_msgSend(v3, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "activityDidChangeForSensorActivityDataProvider:", self, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSSet)activeSensorActivityAttributions
{
  return self->_activeSensorActivityAttributions;
}

- (void)setActiveSensorActivityAttributions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)recentSensorActivityAttributions
{
  return self->_recentSensorActivityAttributions;
}

- (void)setRecentSensorActivityAttributions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (STUIDataAccessStatusDomain)dataAccessDomain
{
  return self->_dataAccessDomain;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataAccessDomain, 0);
  objc_storeStrong((id *)&self->_recentSensorActivityAttributions, 0);
  objc_storeStrong((id *)&self->_activeSensorActivityAttributions, 0);
}

@end
