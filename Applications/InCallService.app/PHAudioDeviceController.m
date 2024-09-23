@implementation PHAudioDeviceController

+ (AVSystemController)sharedSystemController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v13;

  v2 = (void *)CUTWeakLinkClass(CFSTR("AVSystemController"), CFSTR("Celestial"));
  if (!v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Weak linking of AVSystemController failed")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v3);

    _TUAssertShouldCrashApplication();
  }
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sharedAVSystemController"));
  v5 = (void *)v4;
  if (!v4)
  {
    v10 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] +[AVSystemController sharedAVSystemController] returned nil value", buf, 2u);
    }
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass(v4, v2) & 1) == 0)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = (id)objc_opt_class(v5, v8);
      v9 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] +[AVSystemController sharedAVSystemController] returned something that isn't an AVSystemController class: %@", buf, 0xCu);

    }
LABEL_9:

  }
  return (AVSystemController *)v5;
}

+ (PHAudioDeviceController)sharedAudioDeviceController
{
  if (qword_1002DC9B8 != -1)
    dispatch_once(&qword_1002DC9B8, &stru_100286530);
  return (PHAudioDeviceController *)(id)qword_1002DC9B0;
}

- (PHAudioDeviceController)init
{
  PHAudioDeviceController *v2;
  void *v3;
  void *v4;
  id v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *modifyingStateLock;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  TUCallCenter *v11;
  TUCallCenter *fetchRoutesBackgroundCallCenter;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHAudioDeviceController;
  v2 = -[PHAudioDeviceController init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_audioRouteInformationChanged", TUAudioSystemAudioPickableRoutesChanged, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_audioRouteInformationChanged", TUCallAudioPropertiesChangedNotification, 0);

    v5 = +[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController");
    v6 = dispatch_semaphore_create(1);
    modifyingStateLock = v2->_modifyingStateLock;
    v2->_modifyingStateLock = (OS_dispatch_semaphore *)v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("PHAudioDeviceController.serialQueue", v9);
    v11 = (TUCallCenter *)objc_msgSend(objc_alloc((Class)TUCallCenter), "initWithQueue:wantsCallNotifications:", v10, 0);
    fetchRoutesBackgroundCallCenter = v2->_fetchRoutesBackgroundCallCenter;
    v2->_fetchRoutesBackgroundCallCenter = v11;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHAudioDeviceController;
  -[PHAudioDeviceController dealloc](&v4, "dealloc");
}

- (NSArray)routes
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController routesForUnformattedPickableRoutes:](self, "routesForUnformattedPickableRoutes:", v3));

  return (NSArray *)v4;
}

- (void)fetchRoutesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController fetchRoutesBackgroundCallCenter](self, "fetchRoutesBackgroundCallCenter"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100077604;
  v8[3] = &unk_100285050;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (id)routesForUnformattedPickableRoutes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = objc_alloc((Class)TUAudioRoute);
        v12 = objc_msgSend(v11, "initWithDictionary:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (id)callForPickableRoutes
{
  return -[PHAudioDeviceController callForPickableRoutesUsingBackgroundQueue:](self, "callForPickableRoutesUsingBackgroundQueue:", 0);
}

- (id)callForPickableRoutesUsingBackgroundQueue:(BOOL)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController fetchRoutesBackgroundCallCenter](self, "fetchRoutesBackgroundCallCenter"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = v3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostCall"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVideoCall"));
  v9 = v8;

  return v9;
}

- (BOOL)speakerRouteAvailable
{
  PHAudioDeviceController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes"));
  LOBYTE(v2) = -[PHAudioDeviceController speakerRouteAvailableForUnformattedPickableRoutes:](v2, "speakerRouteAvailableForUnformattedPickableRoutes:", v3);

  return (char)v2;
}

- (BOOL)speakerRouteAvailableForUnformattedPickableRoutes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[PHAudioDeviceController _routeIsSpeaker:](self, "_routeIsSpeaker:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)handsetRouteAvailable
{
  PHAudioDeviceController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes"));
  LOBYTE(v2) = -[PHAudioDeviceController handsetRouteAvailableForUnformattedPickableRoutes:](v2, "handsetRouteAvailableForUnformattedPickableRoutes:", v3);

  return (char)v2;
}

- (BOOL)handsetRouteAvailableForUnformattedPickableRoutes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[PHAudioDeviceController _routeIsHandset:](self, "_routeIsHandset:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)pickSpeakerRoute
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asked to pick the speaker route", buf, 2u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (-[PHAudioDeviceController _routeIsSpeaker:](self, "_routeIsSpeaker:", v10))
        {
          -[PHAudioDeviceController _pickRoute:](self, "_pickRoute:", v10);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)pickHandsetRoute
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asked to pick the handset route", buf, 2u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (-[PHAudioDeviceController _routeIsHandset:](self, "_routeIsHandset:", v10))
        {
          -[PHAudioDeviceController _pickRoute:](self, "_pickRoute:", v10);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)pickRouteWithUID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to pick route with UID %@", buf, 0xCu);
  }

  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", AVSystemController_RouteDescriptionKey_RouteUID));
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            -[PHAudioDeviceController _pickRoute:](self, "_pickRoute:", v12);

            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (objc_msgSend(v4, "isEqualToString:", TUCallSourceIdentifierSpeakerRoute))
      -[PHAudioDeviceController pickSpeakerRoute](self, "pickSpeakerRoute");
  }
LABEL_15:

}

- (TUAudioRoute)currentRoute
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)TUAudioRoute);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickedRoute](self, "_pickedRoute"));
  v5 = objc_msgSend(v3, "initWithDictionary:", v4);

  return (TUAudioRoute *)v5;
}

- (void)restorePickedRoute
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restoring picked route", v5, 2u);
  }

  if (self->_pickedRoute)
    -[PHAudioDeviceController _pickRoute:](self, "_pickRoute:");
}

- (void)clearCachedRoutes
{
  id v3;
  NSObject *v4;
  NSDictionary *pickedRoute;
  uint8_t v6[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing cached routes", v6, 2u);
  }

  pickedRoute = self->_pickedRoute;
  self->_pickedRoute = 0;

}

- (BOOL)speakerRouteIsPicked
{
  PHAudioDeviceController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickedRoute](self, "_pickedRoute"));
  LOBYTE(v2) = -[PHAudioDeviceController _routeIsSpeaker:](v2, "_routeIsSpeaker:", v3);

  return (char)v2;
}

- (BOOL)receiverRouteIsPicked
{
  PHAudioDeviceController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickedRoute](self, "_pickedRoute"));
  LOBYTE(v2) = -[PHAudioDeviceController _routeIsReceiver:](v2, "_routeIsReceiver:", v3);

  return (char)v2;
}

- (id)_pickedRoute
{
  NSDictionary *pickedRoute;
  NSDictionary **p_pickedRoute;
  id v6;
  NSObject *v7;
  NSDictionary *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  NSDictionary *v31;

  p_pickedRoute = &self->_pickedRoute;
  pickedRoute = self->_pickedRoute;
  if (pickedRoute)
    return pickedRoute;
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController callForPickableRoutes](self, "callForPickableRoutes"));
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Refreshing picked route based on call: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController"));
  v10 = objc_msgSend(v9, "isTTY");

  if ((v10 & 1) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutes](self, "_pickableRoutes", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
LABEL_8:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked));
        v18 = objc_msgSend(v17, "BOOLValue");

        if ((v18 & 1) != 0)
          break;
        if (v13 == (id)++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v13)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
      v19 = v16;

      if (v19)
        goto LABEL_17;
    }
    else
    {
LABEL_14:

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioDeviceController sharedSystemController](PHAudioDeviceController, "sharedSystemController"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "attributeForKey:", AVSystemController_PickedRouteAttribute));

LABEL_17:
  objc_storeStrong((id *)p_pickedRoute, v19);
  v21 = sub_1000C5588();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *p_pickedRoute;
    *(_DWORD *)buf = 138412290;
    v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Refreshed picked route: %@", buf, 0xCu);
  }

  v24 = *p_pickedRoute;
  return v24;
}

- (id)_pickableRoutesUsingAttribute
{
  void **v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!qword_1002DC9C0)
  {
    v2 = (void **)CUTWeakLinkSymbol("AVSystemController_PickableRoutesAttribute", CFSTR("Celestial"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&qword_1002DC9C0, v3);
    if (!qword_1002DC9C0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to weak link AVSystemController_PickableRoutesAttribute")));
      NSLog(CFSTR("** TUAssertion failure: %@"), v4);

      _TUAssertShouldCrashApplication();
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioDeviceController sharedSystemController](PHAudioDeviceController, "sharedSystemController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributeForKey:", qword_1002DC9C0));

  return v6;
}

- (NSArray)_pickableRoutes
{
  return (NSArray *)-[PHAudioDeviceController _pickableRoutesUsingBackgroundQueue:](self, "_pickableRoutesUsingBackgroundQueue:", 0);
}

- (id)_pickableRoutesUsingBackgroundQueue:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController delegate](self, "delegate"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController delegate](self, "delegate")),
        v8 = objc_msgSend(v7, "isPendingAudioSessionActivation"),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutesUsingAttribute](self, "_pickableRoutesUsingAttribute"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "category"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _unformattedPickableRoutesForAudioSessionCategory:usingBackgroundQueue:](self, "_unformattedPickableRoutesForAudioSessionCategory:usingBackgroundQueue:", v11, v3));

  }
  return v9;
}

- (id)_unformattedPickableRoutesForAudioSessionCategory:(id)a3
{
  return -[PHAudioDeviceController _unformattedPickableRoutesForAudioSessionCategory:usingBackgroundQueue:](self, "_unformattedPickableRoutesForAudioSessionCategory:usingBackgroundQueue:", a3, 0);
}

- (id)_unformattedPickableRoutesForAudioSessionCategory:(id)a3 usingBackgroundQueue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  uint8_t v24[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a4;
  if (objc_msgSend(a3, "isEqualToString:", AVAudioSessionCategoryVoiceMail))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutesForCategory:mode:](self, "_pickableRoutesForCategory:mode:", CFSTR("Voicemail"), 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController"));
    v8 = objc_msgSend(v7, "isTTY");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickableRoutesForTTY"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController callForPickableRoutesUsingBackgroundQueue:](self, "callForPickableRoutesUsingBackgroundQueue:", v4));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioCategory"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioCategory"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioMode"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController _pickableRoutesForCategory:mode:](self, "_pickableRoutesForCategory:mode:", v11, v12));

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bestGuessPickableRoutesForAnyCall"));
      }

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (-[PHAudioDeviceController _routeIsAirTunes:](self, "_routeIsAirTunes:", v19))
        {
          v20 = sub_1000C5588();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PHAudioDeviceController: Filtering out AirTunes audio route until better support is available within the app", v24, 2u);
          }

        }
        else
        {
          objc_msgSend(v13, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v22 = v13;
  return v22;
}

- (id)_pickableRoutesForCategory:(id)a3 mode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100078960;
  v16 = sub_100078970;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUAudioSystemController sharedAudioSystemController](TUAudioSystemController, "sharedAudioSystemController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100078978;
  v11[3] = &unk_100286558;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "getPickableRoutesForCategory:mode:completion:", v6, v7, v11);

  -[PHAudioDeviceController _acquireLock](self, "_acquireLock");
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)_pickRoute:(id)a3
{
  NSDictionary *v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  NSDictionary *pickedRoute;
  NSDictionary *v13;
  id v14;
  uint8_t buf[4];
  NSDictionary *v16;

  v4 = (NSDictionary *)a3;
  -[PHAudioDeviceController clearCachedRoutes](self, "clearCachedRoutes");
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioDeviceController: Picking new route = %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioDeviceController sharedSystemController](PHAudioDeviceController, "sharedSystemController"));
  v14 = 0;
  v8 = objc_msgSend(v7, "setAttribute:forKey:error:", v4, AVSystemController_PickedRouteAttribute, &v14);
  v9 = v14;

  if ((v8 & 1) == 0)
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001A9944((uint64_t)v9, v11);

  }
  pickedRoute = self->_pickedRoute;
  self->_pickedRoute = v4;
  v13 = v4;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100286578);
}

- (BOOL)_routeIsAirTunes:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", AVSystemController_RouteDescriptionKey_AVAudioRouteName));
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("AirTunes"));

  return v4;
}

- (BOOL)_routeIsSpeaker:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", AVSystemController_RouteDescriptionKey_AVAudioRouteName));
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("Speaker"));

  return v4;
}

- (BOOL)_routeIsReceiver:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", AVSystemController_RouteDescriptionKey_AVAudioRouteName));
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("Receiver"));

  return v4;
}

- (BOOL)_routeIsDefault:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", AVSystemController_RouteDescriptionKey_RouteType));
  v4 = objc_msgSend(v3, "isEqual:", AVSystemController_PickableRouteType_Default);

  return v4;
}

- (BOOL)_routeIsHandset:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = -[PHAudioDeviceController _routeIsReceiver:](self, "_routeIsReceiver:", v4);
  v6 = -[PHAudioDeviceController _routeIsDefault:](self, "_routeIsDefault:", v4);
  v7 = -[PHAudioDeviceController _routeIsSpeaker:](self, "_routeIsSpeaker:", v4);

  if ((v5 & 1) != 0)
    return 1;
  else
    return v6 & (v7 ^ 1);
}

- (void)_acquireLock
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController modifyingStateLock](self, "modifyingStateLock"));
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_releaseLock
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController modifyingStateLock](self, "modifyingStateLock"));
  dispatch_semaphore_signal(v2);

}

- (void)_audioRouteInformationChanged
{
  -[PHAudioDeviceController clearCachedRoutes](self, "clearCachedRoutes");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100286598);
}

- (NSDictionary)pickedRoute
{
  return self->_pickedRoute;
}

- (OS_dispatch_semaphore)modifyingStateLock
{
  return self->_modifyingStateLock;
}

- (TUCallCenter)fetchRoutesBackgroundCallCenter
{
  return self->_fetchRoutesBackgroundCallCenter;
}

- (PHAudioDeviceControllerDelegate)delegate
{
  return (PHAudioDeviceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchRoutesBackgroundCallCenter, 0);
  objc_storeStrong((id *)&self->_modifyingStateLock, 0);
  objc_storeStrong((id *)&self->_pickedRoute, 0);
}

@end
