@implementation APLocationManager

- (void)start
{
  NSObject *locationQueue;
  _QWORD block[5];

  locationQueue = self->_locationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CF261868;
  block[3] = &unk_1E8C48590;
  block[4] = self;
  dispatch_async(locationQueue, block);
}

+ (id)_authorizationChangedBlocks
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)qword_1ED2BC650;
  objc_sync_exit(v2);

  return v3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  NSObject *locationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  APLocationManager *v9;

  v4 = a3;
  locationQueue = self->_locationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1CF261AB8;
  v7[3] = &unk_1E8C48760;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(locationQueue, v7);

}

- (BOOL)isLocationUpdating
{
  return self->_isLocationUpdating;
}

- (BOOL)isLocationInitialized
{
  return self->_isLocationInitialized;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *locationQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  locationQueue = self->_locationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CF26037C;
  v8[3] = &unk_1E8C48760;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(locationQueue, v8);

}

+ (void)addAuthorizationChangedBlock:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *aBlock;

  v4 = a3;
  if (v4)
  {
    aBlock = v4;
    v5 = a1;
    objc_sync_enter(v5);
    if (qword_1ED2BC650)
    {
      v9 = objc_msgSend_mutableCopy((void *)qword_1ED2BC650, v6, v7, v8);
    }
    else
    {
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v6, 1, v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    v11 = _Block_copy(aBlock);
    objc_msgSend_addObject_(v10, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_copy(v10, v14, v15, v16);
    v18 = (void *)qword_1ED2BC650;
    qword_1ED2BC650 = v17;

    objc_sync_exit(v5);
    v4 = aBlock;
  }

}

- (APLocationManager)init
{
  char *v2;
  APLocationManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *locationQueue;
  _QWORD block[4];
  APLocationManager *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APLocationManager;
  v2 = -[APLocationManager init](&v9, sel_init);
  v3 = (APLocationManager *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 17) = 0;
    *((_DWORD *)v2 + 5) = 0;
    v4 = dispatch_queue_create("com.apple.ap.locationQueue", 0);
    locationQueue = v3->_locationQueue;
    v3->_locationQueue = (OS_dispatch_queue *)v4;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF261EE4;
    block[3] = &unk_1E8C48590;
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v3;
}

- (void)updatePlacemark
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  CLLocation *lastPlacemarkLocation;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int canReverseGeocodeLocation;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  id v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  NSObject *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!self->_updatingPlacemark)
  {
    objc_msgSend_location(self, a2, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    lastPlacemarkLocation = self->_lastPlacemarkLocation;
    if (lastPlacemarkLocation
      && (objc_msgSend_distanceFromLocation_(lastPlacemarkLocation, v7, (uint64_t)v5, v8),
          v11 = *MEMORY[0x1E0C9E4B8],
          v10 < *MEMORY[0x1E0C9E4B8]))
    {
      v32 = v10;
      APLogForCategory(0x18uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v33 = (void *)objc_opt_class();
        v34 = (void *)MEMORY[0x1E0CB37E8];
        v35 = v33;
        objc_msgSend_numberWithDouble_(v34, v36, v37, v38, v11);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v42 = v33;
        v43 = 2048;
        v44 = *(NSObject **)&v32;
        v45 = 2114;
        v46 = v39;
        _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_INFO, "[%{private}@] Distance traveled (%f meters) is less than %{public}@ meters. No need to update Reverse Geolocation.", buf, 0x20u);

      }
    }
    else
    {
      self->_updatingPlacemark = 1;
      v12 = (void *)objc_opt_class();
      objc_msgSend_createReverseGeocoder(v12, v13, v14, v15);
      v6 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_class();
      canReverseGeocodeLocation = objc_msgSend_canReverseGeocodeLocation_(v16, v17, (uint64_t)v6, v18);
      APLogForCategory(0x18uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (canReverseGeocodeLocation)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = (void *)objc_opt_class();
          v23 = (void *)MEMORY[0x1E0C99DC8];
          v24 = v22;
          objc_msgSend_localeWithLocaleIdentifier_(v23, v25, (uint64_t)CFSTR("en_US"), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v42 = v22;
          v43 = 2117;
          v44 = v5;
          v45 = 2113;
          v46 = v27;
          _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_DEBUG, "[%{private}@ updatePlacemark]: calling reverseGeocodeLocation with parameters:\nlocation = %{sensitive}@\npreferredLocale = %{private}@\nheading = -1\nlocalResultsOnly = NO", buf, 0x20u);

        }
        objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v28, (uint64_t)CFSTR("en_US"), v29);
        v21 = objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = sub_1CF25EA9C;
        v40[3] = &unk_1E8C48718;
        v40[4] = self;
        objc_msgSend_reverseGeocodeLocation_preferredLocale_heading_localResultsOnly_completionHandler_(v6, v30, (uint64_t)v5, (uint64_t)v21, 0, v40, -1.0);
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v42 = (id)objc_opt_class();
        v31 = v42;
        _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_ERROR, "[%{private}@] Error: localized reverse geolocation is not possible.", buf, 0xCu);

      }
    }
    goto LABEL_13;
  }
  APLogForCategory(0x18uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v42 = (id)objc_opt_class();
    v6 = v42;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_DEBUG, "[%{private}@] Reverse Geolocation update already in-flight.", buf, 0xCu);
LABEL_13:

  }
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (CLPlacemark)currentPlacemark
{
  return self->_currentPlacemark;
}

+ (id)sharedInstance
{
  if (qword_1ED2BC978 != -1)
    dispatch_once(&qword_1ED2BC978, &unk_1E8C48050);
  return (id)qword_1ED2BC968;
}

+ (BOOL)locationEnabledFor:(int)a3
{
  return (a3 - 3) < 2;
}

- (BOOL)locationEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_callerStatus(self, a2, v2, v3);
  return objc_msgSend_locationEnabledFor_(APLocationManager, v5, v4, v6);
}

- (int)callerStatus
{
  return self->_callerStatus;
}

- (id)locationInfo
{
  NSObject *locationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1CF27E64C;
  v10 = sub_1CF27E65C;
  v11 = 0;
  locationQueue = self->_locationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1CF260AD0;
  v5[3] = &unk_1E8C486F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(locationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (void)stop
{
  NSObject *locationQueue;
  _QWORD block[5];

  locationQueue = self->_locationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CF25ED74;
  block[3] = &unk_1E8C48590;
  block[4] = self;
  dispatch_async(locationQueue, block);
}

- (void)setUpdatingPlacemark:(BOOL)a3
{
  self->_updatingPlacemark = a3;
}

- (void)setLastPlacemarkLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlacemarkLocation, a3);
}

- (void)setIsLocationUpdating:(BOOL)a3
{
  self->_isLocationUpdating = a3;
}

- (void)setIsLocationInitialized:(BOOL)a3
{
  self->_isLocationInitialized = a3;
}

- (void)setCurrentPlacemark:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlacemark, a3);
}

- (void)setClLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_clLocationManager, a3);
}

- (void)setCallerStatus:(int)a3
{
  self->_callerStatus = a3;
}

+ (id)createReverseGeocoder
{
  return objc_alloc_init(MEMORY[0x1E0C9E390]);
}

+ (BOOL)canReverseGeocodeLocation:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  APLogForCategory(0x18uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1CF251000, v7, OS_LOG_TYPE_ERROR, "%{public}@ didFailWithError %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

- (id)locationQueue
{
  return self->_locationQueue;
}

+ (void)removeAuthorizationChangedBlocks
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)qword_1ED2BC650;
  qword_1ED2BC650 = 0;

  objc_sync_exit(obj);
}

- (BOOL)updatingPlacemark
{
  return self->_updatingPlacemark;
}

- (CLLocation)lastPlacemarkLocation
{
  return self->_lastPlacemarkLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlacemarkLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_locationQueue, 0);
}

@end
