@implementation CNCapabilitiesManager

+ (id)defaultCapabilitiesManager
{
  void *v2;
  CNCapabilitiesManager *v3;
  void *v4;

  v2 = (void *)_sharedCapabilitiesManager;
  if (!_sharedCapabilitiesManager)
  {
    v3 = objc_alloc_init(CNCapabilitiesManager);
    v4 = (void *)_sharedCapabilitiesManager;
    _sharedCapabilitiesManager = (uint64_t)v3;

    v2 = (void *)_sharedCapabilitiesManager;
  }
  return v2;
}

- (BOOL)hasCellularTelephonyHardwareCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)areFavoritesAvailable
{
  _BOOL4 v3;

  v3 = -[CNCapabilitiesManager hasCellularTelephonyCapability](self, "hasCellularTelephonyCapability");
  if (v3)
    LOBYTE(v3) = -[CNCapabilitiesManager hasCellularTelephonyHardwareCapability](self, "hasCellularTelephonyHardwareCapability");
  return v3;
}

- (BOOL)hasCellularTelephonyCapability
{
  return objc_msgSend((Class)getTUCallCapabilitiesClass[0](), "supportsTelephonyCalls");
}

- (BOOL)isMadridConfigured
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNCapabilitiesManager _startListeningToIDSServiceAvailabilityIfNecessary](self, "_startListeningToIDSServiceAvailabilityIfNecessary");
  objc_msgSend((Class)getIDSServiceAvailabilityControllerClass[0](), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getIDSServiceNameiMessage[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.addressbookui"), v3) == 1;

  return v4;
}

- (BOOL)isConferencingAvailable
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[CNCapabilitiesManager isConferencingEverGonnaBeAvailable](self, "isConferencingEverGonnaBeAvailable"))
    return 0;
  -[CNCapabilitiesManager _startListeningToIDSServiceAvailabilityIfNecessary](self, "_startListeningToIDSServiceAvailabilityIfNecessary");
  objc_msgSend((Class)getIDSServiceAvailabilityControllerClass[0](), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getIDSServiceNameFaceTime[0]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "availabilityForListenerID:forService:", CFSTR("com.apple.addressbookui"), v4) == 1;

  return v5;
}

- (void)_startListeningToIDSServiceAvailabilityIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_isListeningToIDSServiceAvailability)
  {
    objc_msgSend((Class)getIDSServiceAvailabilityControllerClass[0](), "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    getIDSServiceNameiMessage[0]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addListenerID:forService:", CFSTR("com.apple.addressbookui"), v3);

    getIDSServiceNameFaceTime[0]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addListenerID:forService:", CFSTR("com.apple.addressbookui"), v4);

    self->_isListeningToIDSServiceAvailability = 1;
  }
}

- (BOOL)isConferencingEverGonnaBeAvailable
{
  int v2;

  v2 = isConferencingEverGonnaBeAvailable_sIsConferencingEverGonnaBeAvailable;
  if (isConferencingEverGonnaBeAvailable_sIsConferencingEverGonnaBeAvailable == -1)
  {
    v2 = MGGetBoolAnswer();
    isConferencingEverGonnaBeAvailable_sIsConferencingEverGonnaBeAvailable = v2;
  }
  return v2 != 0;
}

- (BOOL)hasForceTouchCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)isFaceTimeAppAvailable
{
  return -[CNCapabilitiesManager _isAppAvailable:](self, "_isAppAvailable:", CFSTR("com.apple.facetime"));
}

- (BOOL)_isAppAvailable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "appWhitelistState") == 2)
  {
    objc_msgSend(v4, "effectiveWhitelistedAppBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v3);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isPhoneAppAvailable
{
  return -[CNCapabilitiesManager _isAppAvailable:](self, "_isAppAvailable:", CFSTR("com.apple.mobilephone"));
}

- (BOOL)isMessagesAppAvailable
{
  return -[CNCapabilitiesManager _isAppAvailable:](self, "_isAppAvailable:", CFSTR("com.apple.MobileSMS"));
}

- (BOOL)isMailAppAvailable
{
  return -[CNCapabilitiesManager _isAppAvailable:](self, "_isAppAvailable:", CFSTR("com.apple.mobilemail"));
}

- (BOOL)isMMSConfigured
{
  return CPCanSendMMS() != 0;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return objc_msgSend((Class)getTUCallCapabilitiesClass[0](), "supportsFaceTimeAudioCalls");
}

- (BOOL)hasSiriCapability
{
  return MGGetBoolAnswer();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (self->_isListeningToIDSServiceAvailability)
  {
    objc_msgSend((Class)getIDSServiceAvailabilityControllerClass[0](), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getIDSServiceNameiMessage[0]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.addressbookui"), v4);

    getIDSServiceNameFaceTime[0]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.addressbookui"), v5);

  }
  if (self->_isListeningToIDSQueryController)
  {
    objc_msgSend((Class)getIDSIDQueryControllerClass[0](), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getIDSServiceNameFaceTime[0]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeDelegate:forService:listenerID:", self, v7, CFSTR("com.apple.addressbookui"));

  }
  v8.receiver = self;
  v8.super_class = (Class)CNCapabilitiesManager;
  -[CNCapabilitiesManager dealloc](&v8, sel_dealloc);
}

- (BOOL)isSensitiveUIAllowed
{
  return MGGetBoolAnswer();
}

- (BOOL)hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasCellularDataCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasSMSCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasVibratorCapability
{
  void *v2;
  BOOL v3;

  if (!MGGetBoolAnswer())
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (BOOL)hasCameraCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)isEmailConfigured
{
  double v2;
  uint64_t v3;
  BOOL v4;
  void *v5;

  if (!isEmailConfigured_lastCheckDate
    || (objc_msgSend((id)isEmailConfigured_lastCheckDate, "timeIntervalSinceNow"), v2 < -30.0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
      v4 = CPCanSendMail() != 0;
    else
      v4 = 0;
    isEmailConfigured_isConfigured = v4;
    v5 = (void *)isEmailConfigured_lastCheckDate;
    isEmailConfigured_lastCheckDate = v3;

  }
  return isEmailConfigured_isConfigured;
}

- (BOOL)hasPreviouslyConferencedWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  dispatch_time_t v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  if (v4 && -[CNCapabilitiesManager isConferencingEverGonnaBeAvailable](self, "isConferencingEverGonnaBeAvailable"))
  {
    -[CNCapabilitiesManager _startListeningToIDSIDQueryControllerIfNecessary](self, "_startListeningToIDSIDQueryControllerIfNecessary");
    -[NSMutableDictionary objectForKey:](self->_destinationStatus, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "intValue") == 1;
    }
    else
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v8 = dispatch_semaphore_create(0);
      objc_msgSend((Class)getIDSIDQueryControllerClass[0](), "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getIDSServiceNameFaceTime[0]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__CNCapabilitiesManager_hasPreviouslyConferencedWithID___block_invoke;
      v16[3] = &unk_1E2047A00;
      v18 = &v19;
      v12 = v8;
      v17 = v12;
      v13 = objc_msgSend(v9, "currentIDStatusForDestination:service:listenerID:queue:completionBlock:", v4, v10, CFSTR("com.apple.addressbookui"), v11, v16);

      if (v13)
      {
        v14 = dispatch_time(0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_semaphore_wait(v12, v14);
      }

      v7 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)conferenceURLForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[CNCapabilitiesManager isConferencingEverGonnaBeAvailable](self, "isConferencingEverGonnaBeAvailable"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13C68]), "initWithStringValue:type:", v4, 2);
    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_faceTimeVideoURLWithHandle:contact:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)conferenceURLForDestinationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[CNCapabilitiesManager isConferencingEverGonnaBeAvailable](self, "isConferencingEverGonnaBeAvailable"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13C68]), "initWithStringValue:type:", v4, 2);
    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_faceTimeVideoURLWithHandle:contact:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addIDSServiceAvailabilityListener:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[CNCapabilitiesManager _startListeningToIDSServiceAvailabilityIfNecessary](self, "_startListeningToIDSServiceAvailabilityIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  getIDSServiceAvailabilityDidChangeNotification[0]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v6, a4, v7, 0);

}

- (void)removeIDSServiceAvailabilityListener:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  getIDSServiceAvailabilityDidChangeNotification[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v4, v5, 0);

}

- (void)_startListeningToIDSIDQueryControllerIfNecessary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *destinationStatus;
  void *v5;
  id v6;

  if (!self->_isListeningToIDSQueryController)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    destinationStatus = self->_destinationStatus;
    self->_destinationStatus = v3;

    objc_msgSend((Class)getIDSIDQueryControllerClass[0](), "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    getIDSServiceNameFaceTime[0]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDelegate:forService:listenerID:queue:", self, v5, CFSTR("com.apple.addressbookui"), MEMORY[0x1E0C80D38]);

    self->_isListeningToIDSQueryController = 1;
  }
}

- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  void (*v6)(void);
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (*)(void))getIDSServiceNameFaceTime[0];
  v7 = a4;
  v6();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_destinationStatus, "addEntriesFromDictionary:", v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", ABCapabilitiesConferenceHistoryChanged, self);

  }
}

- (BOOL)hasAdditionalTextTones
{
  return MGGetBoolAnswer();
}

- (BOOL)isWeiboServiceAvailable
{
  Class v2;
  void *v3;

  v2 = (Class)getSLComposeViewControllerClass[0]();
  getSLServiceTypeSinaWeibo[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[objc_class isAvailableForServiceType:](v2, "isAvailableForServiceType:", v3);

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationStatus, 0);
}

intptr_t __56__CNCapabilitiesManager_hasPreviouslyConferencedWithID___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_setDefaultCapabilitiesManager:(id)a3
{
  objc_storeStrong((id *)&_sharedCapabilitiesManager, a3);
}

@end
