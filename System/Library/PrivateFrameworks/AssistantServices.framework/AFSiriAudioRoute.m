@implementation AFSiriAudioRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avAudioRouteName, 0);
  objc_storeStrong((id *)&self->_connectedBTProductID, 0);
  objc_storeStrong((id *)&self->_avscRouteDescription, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

- (BOOL)isRouteCurrentlyPicked
{
  return self->_isRouteCurrentlyPicked;
}

- (unint64_t)_getRouteCapabilities
{
  _BOOL4 isRouteCurrentlyPicked;
  unint64_t result;

  if (self->_isRouteCurrentlyPicked && self->_isDoAPCapable && (self->_isHeadsetInEar || !self->_headsetSupportsIED))
    goto LABEL_13;
  if (!+[AFFeatureFlags isAccessibleAnnounceEnabled](AFFeatureFlags, "isAccessibleAnnounceEnabled"))
  {
    isRouteCurrentlyPicked = self->_isRouteCurrentlyPicked;
    goto LABEL_15;
  }
  isRouteCurrentlyPicked = self->_isRouteCurrentlyPicked;
  if (!self->_hearingAidsAnnounceEnabled)
    goto LABEL_27;
  if (!self->_isRouteCurrentlyPicked)
    goto LABEL_17;
  if (!self->_isHearingAidsRoute)
  {
LABEL_27:
    if (self->_builtInSpeakerAnnounceEnabled)
    {
      if (self->_isRouteCurrentlyPicked)
      {
        if (self->_isBuiltInSpeakerRoute && self->_ringerSwitchState == 1)
          goto LABEL_13;
LABEL_16:
        result = 0;
        goto LABEL_18;
      }
LABEL_17:
      result = 0;
      if (!self->_shouldTakeRouteFromOtherConnectedDevice)
        return result;
      goto LABEL_18;
    }
LABEL_15:
    if (isRouteCurrentlyPicked)
      goto LABEL_16;
    goto LABEL_17;
  }
LABEL_13:
  result = 1;
LABEL_18:
  if (self->_headsetSupportsAnnounceCalls
    && self->_isHeadsetInEar
    && (self->_inEarDetectEnabled || !self->_inEarDetectEnabledSpecified)
    && !self->_shouldDeferToOtherConnectedDevice)
  {
    result |= 2uLL;
  }
  return result;
}

- (int64_t)_announcementPlatform
{
  if (-[AFSiriAudioRoute _isHearingAidsRoute](self, "_isHearingAidsRoute"))
    return 3;
  if (-[AFSiriAudioRoute _isBuiltInSpeakerRoute](self, "_isBuiltInSpeakerRoute"))
    return 4;
  return 1;
}

- (void)_initializeInternalState
{
  NSDictionary *avscRouteDescription;
  NSDictionary *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  id v27;
  NSString *v28;
  NSString *connectedBTProductID;
  _BOOL4 v30;
  NSString *v31;
  __CFString *v32;
  NSString *v33;
  NSString *productID;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  NSString *btAddress;
  char isDoAPCapable;
  id *v42;
  void *v43;
  id v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  void *v49;
  NSString *v50;
  NSString *avAudioRouteName;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  avscRouteDescription = self->_avscRouteDescription;
  if (avscRouteDescription)
  {
    v4 = avscRouteDescription;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v5 = (id *)getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr;
    v57 = getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr)
    {
      v6 = MediaExperienceLibrary_24137();
      v5 = (id *)dlsym(v6, "AVSystemController_RouteDescriptionKey_IsGenuineAppleAccessory");
      v55[3] = (uint64_t)v5;
      getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v54, 8);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessory(void)");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 36, CFSTR("%s"), dlerror());
      goto LABEL_49;
    }
    v7 = *v5;
    -[NSDictionary objectForKey:](v4, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isGenuineAppleAccessory = objc_msgSend(v8, "BOOLValue");

    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v9 = (id *)getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
    v57 = getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr)
    {
      v10 = MediaExperienceLibrary_24137();
      v9 = (id *)dlsym(v10, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
      v55[3] = (uint64_t)v9;
      getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v54, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 32, CFSTR("%s"), dlerror());
      goto LABEL_49;
    }
    v11 = *v9;
    -[NSDictionary objectForKey:](v4, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isRouteCurrentlyPicked = objc_msgSend(v12, "BOOLValue");

    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v13 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr;
    v57 = getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr)
    {
      v14 = MediaExperienceLibrary_24137();
      v13 = (id *)dlsym(v14, "AVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP");
      v55[3] = (uint64_t)v13;
      getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&v54, 8);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP(void)");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 30, CFSTR("%s"), dlerror());
      goto LABEL_49;
    }
    v15 = *v13;
    -[NSDictionary objectForKey:](v4, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isDoAPCapable = objc_msgSend(v16, "BOOLValue");

    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v17 = (id *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
    v57 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr)
    {
      v18 = MediaExperienceLibrary_24137();
      v17 = (id *)dlsym(v18, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive");
      v55[3] = (uint64_t)v17;
      getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr = (uint64_t)v17;
    }
    _Block_object_dispose(&v54, 8);
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive(void)");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 27, CFSTR("%s"), dlerror());
      goto LABEL_49;
    }
    v19 = *v17;
    -[NSDictionary objectForKey:](v4, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isHeadsetInEar = objc_msgSend(v20, "BOOLValue");

    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v4, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      self->_inEarDetectEnabledSpecified = 1;
      getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](v4, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inEarDetectEnabled = objc_msgSend(v24, "BOOLValue");

    }
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v25 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
    v57 = getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr)
    {
      v26 = MediaExperienceLibrary_24137();
      v25 = (id *)dlsym(v26, "AVSystemController_RouteDescriptionKey_BTDetails_ProductID");
      v55[3] = (uint64_t)v25;
      getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(&v54, 8);
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_ProductID(void)");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 33, CFSTR("%s"), dlerror());
      goto LABEL_49;
    }
    v27 = *v25;
    -[NSDictionary objectForKey:](v4, "objectForKey:", v27);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    connectedBTProductID = self->_connectedBTProductID;
    self->_connectedBTProductID = v28;

    v30 = -[NSString hasPrefix:](self->_connectedBTProductID, "hasPrefix:", CFSTR("BTHeadphones"));
    v31 = self->_connectedBTProductID;
    if (v30)
    {
      v32 = CFSTR("BTHeadphones");
    }
    else
    {
      if (!-[NSString hasPrefix:](self->_connectedBTProductID, "hasPrefix:", CFSTR("BTHeadset")))
        goto LABEL_24;
      v31 = self->_connectedBTProductID;
      v32 = CFSTR("BTHeadset");
    }
    -[NSString substringFromIndex:](v31, "substringFromIndex:", -[__CFString length](v32, "length"));
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    productID = self->_productID;
    self->_productID = v33;

LABEL_24:
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v35 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
    v57 = getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr)
    {
      v36 = MediaExperienceLibrary_24137();
      v35 = dlsym(v36, "AVSystemController_RouteDescriptionKey_RouteUID");
      v55[3] = (uint64_t)v35;
      getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr = (uint64_t)v35;
    }
    _Block_object_dispose(&v54, 8);
    if (v35)
    {
      -[NSDictionary objectForKey:](v4, "objectForKey:", *v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsSeparatedByString:", CFSTR("-"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndex:", 0);
      v39 = (NSString *)objc_claimAutoreleasedReturnValue();
      btAddress = self->_btAddress;
      self->_btAddress = v39;

      if ((AFBTProductIDSupportsAnnounce(self->_productID) & 1) != 0 || (isDoAPCapable = self->_isDoAPCapable) != 0)
        isDoAPCapable = AFBTAnnounceCallsUnsupportedOnProductID(self->_productID) ^ 1;
      self->_headsetSupportsAnnounceCalls = isDoAPCapable;
      self->_headsetSupportsIED = AFBTProductIDSupportsIED(self->_productID);
      self->_headsetSupportsFauxIED = AFBTProductIDSupportsFauxIED(self->_productID);
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v42 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
      v57 = getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
      if (!getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr)
      {
        v43 = MediaExperienceLibrary_24137();
        v42 = (id *)dlsym(v43, "AVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged");
        v55[3] = (uint64_t)v42;
        getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr = (uint64_t)v42;
      }
      _Block_object_dispose(&v54, 8);
      if (v42)
      {
        v44 = *v42;
        -[NSDictionary objectForKey:](v4, "objectForKey:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isTipiRoute = objc_msgSend(v45, "BOOLValue");

        if (!self->_isTipiRoute && self->_isHeadsetInEar)
          self->_shouldTakeRouteFromOtherConnectedDevice = 1;
        v54 = 0;
        v55 = &v54;
        v56 = 0x2020000000;
        v46 = (id *)getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        v57 = getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr)
        {
          v47 = MediaExperienceLibrary_24137();
          v46 = (id *)dlsym(v47, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
          v55[3] = (uint64_t)v46;
          getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr = (uint64_t)v46;
        }
        _Block_object_dispose(&v54, 8);
        if (v46)
        {
          v48 = *v46;
          -[NSDictionary objectForKey:](v4, "objectForKey:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (NSString *)objc_msgSend(v49, "copy");
          avAudioRouteName = self->_avAudioRouteName;
          self->_avAudioRouteName = v50;

          self->_isBuiltInSpeakerRoute = -[AFSiriAudioRoute _isBuiltInSpeakerRoute](self, "_isBuiltInSpeakerRoute");
          self->_isHearingAidsRoute = -[AFSiriAudioRoute _isHearingAidsRoute](self, "_isHearingAidsRoute");

          return;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 35, CFSTR("%s"), dlerror());
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged(void)");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 31, CFSTR("%s"), dlerror());
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("AFSiriAudioRoute.m"), 34, CFSTR("%s"), dlerror());
    }
LABEL_49:

    __break(1u);
  }
}

- (BOOL)_isHearingAidsRoute
{
  return -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", CFSTR("BluetoothLEOutput"));
}

- (BOOL)_isBuiltInSpeakerRoute
{
  return -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", CFSTR("Speaker"))
      || -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", CFSTR("BestSpeaker"));
}

- (BOOL)isEqualToRoute:(id)a3
{
  void *v3;
  AFSiriAudioRoute *v5;
  AFSiriAudioRoute *v6;
  NSString *productID;
  NSString *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSString *btAddress;
  NSString *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  NSString *avAudioRouteName;
  void *v19;
  unint64_t availableAnnouncementRequestTypes;
  int64_t announcePlatformForRoute;
  _BOOL4 v22;

  v5 = (AFSiriAudioRoute *)a3;
  v6 = v5;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
    goto LABEL_22;
  }
  productID = self->_productID;
  v8 = productID;
  if (!productID)
  {
    -[AFSiriAudioRoute productID](v5, "productID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_10;
    v3 = (void *)v9;
    v8 = self->_productID;
  }
  -[AFSiriAudioRoute productID](v6, "productID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v10);

  if (productID)
  {
    if (!v11)
      goto LABEL_21;
  }
  else
  {

    if (!v11)
      goto LABEL_21;
  }
LABEL_10:
  btAddress = self->_btAddress;
  v14 = btAddress;
  if (!btAddress)
  {
    -[AFSiriAudioRoute btAddress](v6, "btAddress");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_17;
    v3 = (void *)v15;
    v14 = self->_btAddress;
  }
  -[AFSiriAudioRoute btAddress](v6, "btAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSString isEqualToString:](v14, "isEqualToString:", v16);

  if (btAddress)
  {
    if (!v17)
      goto LABEL_21;
    goto LABEL_17;
  }

  if (!v17)
  {
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
LABEL_17:
  avAudioRouteName = self->_avAudioRouteName;
  -[AFSiriAudioRoute routeName](v6, "routeName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(avAudioRouteName) = -[NSString isEqualToString:](avAudioRouteName, "isEqualToString:", v19);

  if (!(_DWORD)avAudioRouteName)
    goto LABEL_21;
  availableAnnouncementRequestTypes = self->_availableAnnouncementRequestTypes;
  if (availableAnnouncementRequestTypes != -[AFSiriAudioRoute availableAnnouncementRequestTypes](v6, "availableAnnouncementRequestTypes"))goto LABEL_21;
  announcePlatformForRoute = self->_announcePlatformForRoute;
  if (announcePlatformForRoute != -[AFSiriAudioRoute announcePlatformForRoute](v6, "announcePlatformForRoute"))
    goto LABEL_21;
  v22 = -[AFSiriAudioRoute hasAuthenticationCapability](self, "hasAuthenticationCapability");
  v12 = v22 ^ -[AFSiriAudioRoute hasAuthenticationCapability](v6, "hasAuthenticationCapability") ^ 1;
LABEL_22:

  return v12;
}

- (BOOL)hasAuthenticationCapability
{
  return self->_isRouteCurrentlyPicked
      && self->_isHeadsetInEar
      && self->_headsetSupportsIED
      && !self->_headsetSupportsFauxIED
      && self->_inEarDetectEnabledSpecified
      && self->_inEarDetectEnabled
      && self->_isGenuineAppleAccessory;
}

- (id)routeName
{
  return self->_avAudioRouteName;
}

- (unint64_t)availableAnnouncementRequestTypes
{
  return self->_availableAnnouncementRequestTypes;
}

- (int64_t)announcePlatformForRoute
{
  return self->_announcePlatformForRoute;
}

- (NSString)productID
{
  return self->_productID;
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (AFSiriAudioRoute)initWithRouteDescription:(id)a3 hearingAidsAnnounceEnabled:(BOOL)a4 builtInSpeakerAnnounceEnabled:(BOOL)a5 ringerSwitchState:(int64_t)a6
{
  id v11;
  AFSiriAudioRoute *v12;
  AFSiriAudioRoute *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriAudioRoute;
  v12 = -[AFSiriAudioRoute init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avscRouteDescription, a3);
    v13->_hearingAidsAnnounceEnabled = a4;
    v13->_builtInSpeakerAnnounceEnabled = a5;
    v13->_ringerSwitchState = a6;
    -[AFSiriAudioRoute _initializeInternalState](v13, "_initializeInternalState");
    v13->_availableAnnouncementRequestTypes = -[AFSiriAudioRoute _getRouteCapabilities](v13, "_getRouteCapabilities");
    v13->_announcePlatformForRoute = -[AFSiriAudioRoute _announcementPlatform](v13, "_announcementPlatform");
  }

  return v13;
}

- (BOOL)isThirdPartyBluetoothHeadset
{
  _BOOL4 v3;

  if (-[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", CFSTR("HeadsetBT"))
    || (v3 = -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", CFSTR("HeadphonesBT"))))
  {
    LOBYTE(v3) = !self->_isGenuineAppleAccessory;
  }
  return v3;
}

- (BOOL)hasBobbleCapability
{
  return self->_headsetSupportsIED && !self->_headsetSupportsFauxIED;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_productID, "hash");
  v4 = -[NSString hash](self->_btAddress, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_name, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AFSiriAudioRoute availableAnnouncementRequestTypes](self, "availableAnnouncementRequestTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFSiriAudioRoute hasAuthenticationCapability](self, "hasAuthenticationCapability"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)supportsVolumeAdjustment
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  BOOL v6;
  NSObject *v7;
  NSString *productID;
  NSString *btAddress;
  int v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_btAddress, "length") != 17)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      productID = self->_productID;
      btAddress = self->_btAddress;
      v11 = 136315650;
      v12 = "-[AFSiriAudioRoute supportsVolumeAdjustment]";
      v13 = 2112;
      v14 = productID;
      v15 = 2112;
      v16 = btAddress;
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s ProductID: %@, BTAddress: %@, route doesn't support volume adjustments", (uint8_t *)&v11, 0x20u);
    }
    return 0;
  }
  v3 = AFIsH1Headset(self->_productID);
  v4 = AFSiriLogContextConnection;
  v5 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      v11 = 136315138;
      v12 = "-[AFSiriAudioRoute supportsVolumeAdjustment]";
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Non H1 based headphones route, doesn't support volume adjustment", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
  if (!v5)
    return 1;
  v11 = 136315138;
  v12 = "-[AFSiriAudioRoute supportsVolumeAdjustment]";
  v6 = 1;
  _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s H1 based headphones route, supports volume adjustment", (uint8_t *)&v11, 0xCu);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AFSiriAudioRoute initWithRouteDescription:hearingAidsAnnounceEnabled:builtInSpeakerAnnounceEnabled:ringerSwitchState:]([AFSiriAudioRoute alloc], "initWithRouteDescription:hearingAidsAnnounceEnabled:builtInSpeakerAnnounceEnabled:ringerSwitchState:", self->_avscRouteDescription, self->_hearingAidsAnnounceEnabled, self->_builtInSpeakerAnnounceEnabled, self->_ringerSwitchState);
}

- (void)setProductID:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (void)setBtAddress:(id)a3
{
  objc_storeStrong((id *)&self->_btAddress, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)connectedBTProductID
{
  return self->_connectedBTProductID;
}

- (void)setConnectedBTProductID:(id)a3
{
  objc_storeStrong((id *)&self->_connectedBTProductID, a3);
}

- (void)setAvailableAnnouncementRequestTypes:(unint64_t)a3
{
  self->_availableAnnouncementRequestTypes = a3;
}

- (NSDictionary)avscRouteDescription
{
  return self->_avscRouteDescription;
}

- (void)setAvscRouteDescription:(id)a3
{
  objc_storeStrong((id *)&self->_avscRouteDescription, a3);
}

- (void)setAnnouncePlatformForRoute:(int64_t)a3
{
  self->_announcePlatformForRoute = a3;
}

@end
