@implementation MSPMapsPushDaemonRemoteProxy

uint64_t __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)addObserver:(id)a3
{
  MSPMapsPushDaemonRemoteProxy *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

+ (MSPMapsPushDaemonRemoteProxy)sharedInstance
{
  if (qword_1ED328400 != -1)
    dispatch_once(&qword_1ED328400, &__block_literal_global_7);
  return (MSPMapsPushDaemonRemoteProxy *)(id)_MergedGlobals_39;
}

- (void)fetchCurrentAnnouncement:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke;
    v6[3] = &unk_1E6653358;
    v7 = v4;
    objc_msgSend(v5, "fetchCurrentAnnouncement:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)_remoteObjectProxy
{
  void *v2;
  void *v3;

  -[MSPMapsPushDaemonRemoteProxy _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_connection
{
  MSPMapsPushDaemonRemoteProxy *v3;
  NSXPCConnection *v4;

  -[MSPMapsPushDaemonRemoteProxy _connectToDaemonIfNeeded](self, "_connectToDaemonIfNeeded");
  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_connection;
  objc_sync_exit(v3);

  return v4;
}

- (void)_connectToDaemonIfNeeded
{
  MSPMapsPushDaemonRemoteProxy *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MSPMapsPushDaemonRemoteXPCProxy *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    objc_initWeak(&location, v2);
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.Maps.mapspushd"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF082480);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchCurrentAnnouncement_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF081FD0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v9);

    v10 = -[MSPMapsPushDaemonRemoteXPCProxy initWithObserver:]([MSPMapsPushDaemonRemoteXPCProxy alloc], "initWithObserver:", v2);
    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v10);

    v11 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke;
    v14[3] = &unk_1E66520A0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v14);
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke_2;
    v12[3] = &unk_1E66520A0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](v2->_connection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

}

void __46__MSPMapsPushDaemonRemoteProxy_sharedInstance__block_invoke()
{
  MSPMapsPushDaemonRemoteProxy *v0;
  void *v1;

  v0 = objc_alloc_init(MSPMapsPushDaemonRemoteProxy);
  v1 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = (uint64_t)v0;

}

- (MSPMapsPushDaemonRemoteProxy)init
{
  MSPMapsPushDaemonRemoteProxy *v2;
  uint64_t v3;
  NSHashTable *observers;
  MSPMapsPushDaemonRemoteProxy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPMapsPushDaemonRemoteProxy;
  v2 = -[MSPMapsPushDaemonRemoteProxy init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)closeConnection
{
  NSXPCConnection *connection;
  MSPMapsPushDaemonRemoteProxy *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSXPCConnection invalidate](obj->_connection, "invalidate");
  connection = obj->_connection;
  obj->_connection = 0;

  objc_sync_exit(obj);
}

- (void)removeObserver:(id)a3
{
  MSPMapsPushDaemonRemoteProxy *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

void __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __56__MSPMapsPushDaemonRemoteProxy__connectToDaemonIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

- (void)_clearConnection
{
  NSXPCConnection *connection;
  MSPMapsPushDaemonRemoteProxy *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSXPCConnection invalidate](obj->_connection, "invalidate");
  connection = obj->_connection;
  obj->_connection = 0;

  objc_sync_exit(obj);
}

- (void)simulateProblemResolution
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "simulateProblemResolution");

  }
}

- (void)simulateUGCPhotoSubmissionResolution
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "simulateUGCPhotoSubmissionResolution");

  }
}

- (void)simulateUGCPhotoAttributionClearedNotification
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "simulateUGCPhotoAttributionClearedNotification");

  }
}

- (void)simulateRAPStatusChangeNotification
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "simulateRAPStatusChangeNotification");

  }
}

- (void)fetchDevicePushToken:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchDevicePushToken:", v5);

  }
  else
  {
    v5[2](v5, 0);
  }

}

void __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MSPMapsPushDaemonRemoteProxy_fetchCurrentAnnouncement___block_invoke_2;
  v6[3] = &unk_1E6653330;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)clearCurrentAnnouncement
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearCurrentAnnouncement");

  }
}

- (void)resetAnnouncements
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetAnnouncements");

  }
}

- (void)clearBulletinWithRecordID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearBulletinWithRecordID:", v5);

  }
}

- (void)showMapsSuggestionsBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showMapsSuggestionsBulletinWithTitle:message:actionURL:", v11, v8, v9);

  }
}

- (void)clearMapsSuggestionsBulletin
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearMapsSuggestionsBulletin");

  }
}

- (void)showAirportArrivalBulletinWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "showAirportArrivalBulletinWithTitle:message:mapRegion:regionName:", v14, v10, v11, v12);

  }
}

- (void)clearAirportArrivalBulletin
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearMapsSuggestionsBulletin");

  }
}

- (void)showVenueBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showMapsSuggestionsBulletinWithTitle:message:actionURL:", v11, v8, v9);

  }
}

- (void)clearVenueBulletin
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearMapsSuggestionsBulletin");

  }
}

- (void)showTrafficIncidentAlertWithID:(id)a3 withReroute:(BOOL)a4 title:(id)a5 description:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a4;
  v13 = a3;
  v10 = a5;
  v11 = a6;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "showTrafficIncidentAlertWithID:withReroute:title:description:", v13, v8, v10, v11);

  }
}

- (void)clearTrafficIncidentBulletinWithAlertID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearTrafficIncidentBulletinWithAlertID:", v5);

  }
}

- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showPredictedRouteTrafficIncidentBulletinForCommuteDetails:", v5);

  }
}

- (void)clearPredictedRouteTrafficIncidentBulletin
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearPredictedRouteTrafficIncidentBulletin");

  }
}

- (void)showLowFuelAlertBulletinForLowFuelDetails:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showLowFuelAlertBulletinForLowFuelDetails:", v5);

  }
}

- (void)clearLowFuelAlertBulletin
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearLowFuelAlertBulletin");

  }
}

- (void)showParkedCarBulletinForEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showParkedCarBulletinForEvent:", v5);

  }
}

- (void)showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showParkedCarReplacementBulletinForEvent:replacingEvent:", v8, v6);

  }
}

- (void)clearParkedCarBulletin
{
  id v3;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearParkedCarBulletin");

  }
}

- (void)handleMapsApplicationRemoval:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    -[MSPMapsPushDaemonRemoteProxy _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleMapsApplicationRemoval:", v5);

  }
  else
  {
    v5[2](v5, 0);
  }

}

- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSPMapsPushDaemonRemoteProxy *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    v11 = self;
    objc_sync_enter(v11);
    -[NSHashTable allObjects](v11->_observers, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v11);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__MSPMapsPushDaemonRemoteProxy_pushDaemonProxyReceivedNotificationData_forType_recordIdentifier___block_invoke;
    v14[3] = &unk_1E6651CA8;
    v15 = v12;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    v13 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

void __97__MSPMapsPushDaemonRemoteProxy_pushDaemonProxyReceivedNotificationData_forType_recordIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "pushDaemonProxyReceivedNotificationData:forType:recordIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
