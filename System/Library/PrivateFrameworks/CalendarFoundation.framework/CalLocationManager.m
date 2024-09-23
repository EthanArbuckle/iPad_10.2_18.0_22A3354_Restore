@implementation CalLocationManager

+ (id)placemarkForAddress:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  CalCancellableSearch *v11;
  NSObject *v12;
  CalCancellableSearch *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C9E390]);
    CFRetain(v7);
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke;
    v18[3] = &unk_1E2A84338;
    v9 = v5;
    v19 = v9;
    v21 = v6;
    v10 = v7;
    v20 = v10;
    objc_msgSend(v10, "geocodeAddressString:completionHandler:", v9, v18);
    v11 = [CalCancellableSearch alloc];
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_46;
    v15[3] = &unk_1E2A83E68;
    v16 = v9;
    v17 = v10;
    v12 = v10;
    v13 = -[CalCancellableSearch initWithCancellationBlock:](v11, "initWithCancellationBlock:", v15);

  }
  else
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[CalLocationManager placemarkForAddress:withCompletionBlock:].cold.1();
    v13 = 0;
  }

  return v13;
}

void __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_2(v5);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));

}

+ (id)strictGeocodeString:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  uint64_t v16;
  CalCancellableSearch *v17;
  id v18;
  CalCancellableSearch *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[CalLocationManager strictGeocodeString:withCompletionBlock:].cold.5();

  if (!v7)
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CalLocationManager strictGeocodeString:withCompletionBlock:].cold.4();

  }
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_3();

  objc_msgSend(a1, "_loadMapKit");
  v11 = _sMapKitLoaded;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_2();

    v14 = objc_alloc_init(NSClassFromString(CFSTR("MKLocalSearchRequest")));
    objc_msgSend(v14, "_setCanonicalSearchString:", v6);
    v15 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("MKLocalSearch"))), "initWithRequest:", v14);
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke;
    v24[3] = &unk_1E2A84360;
    v25 = v7;
    objc_msgSend(v15, "startWithCompletionHandler:", v24);
    v17 = [CalCancellableSearch alloc];
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_52;
    v21[3] = &unk_1E2A83E68;
    v22 = v6;
    v23 = v15;
    v18 = v15;
    v19 = -[CalCancellableSearch initWithCancellationBlock:](v17, "initWithCancellationBlock:", v21);

  }
  else
  {
    if (v13)
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_1();

    if (!v7)
    {
      v19 = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CalLocationErrorDomain, 4, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v14);
    v19 = 0;
  }

LABEL_18:
  return v19;
}

+ (void)_loadMapKit
{
  if (_loadMapKit_onceToken != -1)
    dispatch_once(&_loadMapKit_onceToken, &__block_literal_global_5);
}

void __33__CalLocationManager__loadMapKit__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  NSObject *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MapKit"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = objc_msgSend(v0, "load");
    _sMapKitLoaded = v2;
    if (v2)
      goto LABEL_8;
  }
  else if (_sMapKitLoaded)
  {
    goto LABEL_8;
  }
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __33__CalLocationManager__loadMapKit__block_invoke_cold_1();

LABEL_8:
}

void __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_cold_1(v5, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)currentLocationWithCompletionBlock:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  __CFString *v21;
  id v22;
  id v23;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if ((v5 & 1) != 0)
    {
      if (v7)
        +[CalLocationManager currentLocationWithCompletionBlock:].cold.4();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        +[CalLocationManager currentLocationWithCompletionBlock:].cold.3();

      if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) == 0)
      {
        +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          +[CalLocationManager currentLocationWithCompletionBlock:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

        v9 = CFSTR("com.apple.iCal");
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke;
      v20[3] = &unk_1E2A84310;
      v21 = v9;
      v22 = v4;
      v23 = a1;
      v19 = v9;
      +[CalLocationAuthorization authorizationStatusForBundleIdentifier:completion:](CalLocationAuthorization, "authorizationStatusForBundleIdentifier:completion:", v19, v20);

    }
    else
    {
      if (v7)
        +[CalLocationManager currentLocationWithCompletionBlock:].cold.5();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CalLocationErrorDomain, 2, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, NSObject *))v4 + 2))(v4, 0, v19);
    }
  }
  else
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[CalLocationManager currentLocationWithCompletionBlock:].cold.1();
  }

}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  unsigned int v3;
  NSObject *v4;
  _BOOL4 v5;
  BOOL v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  __int128 v13;
  _QWORD block[4];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  __int128 v18;

  v3 = a2 - 1;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 <= 1)
  {
    if (v5)
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_1();
LABEL_13:

    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CalLocationErrorDomain, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);
    goto LABEL_16;
  }
  if (v5)
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_4();

  v6 = +[CalEntitlementsVerifier currentProcessHasLocationdEffectiveBundleEntitlement](CalEntitlementsVerifier, "currentProcessHasLocationdEffectiveBundleEntitlement");
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v7)
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_3();
    goto LABEL_13;
  }
  if (v7)
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_2();

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_28;
  v16[3] = &unk_1E2A842E8;
  v17 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 40);
  v9 = (id)v13;
  v18 = v13;
  v10 = (void (**)(_QWORD))MEMORY[0x19400A168](v16);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v10[2](v10);
  }
  else
  {
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_38;
    block[3] = &unk_1E2A83DD8;
    v15 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v12 = v17;
LABEL_16:

}

+ (id)placemarkForLocation:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  CalCancellableSearch *v13;
  CalCancellableSearch *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      +[CalLocationManager placemarkForLocation:withCompletionBlock:].cold.2();

    v9 = objc_alloc_init(MEMORY[0x1E0C9E390]);
    CFRetain(v9);
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke;
    v19[3] = &unk_1E2A84338;
    v11 = v5;
    v20 = v11;
    v22 = v6;
    v12 = v9;
    v21 = v12;
    objc_msgSend(v12, "reverseGeocodeLocation:completionHandler:", v11, v19);
    v13 = [CalCancellableSearch alloc];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_45;
    v16[3] = &unk_1E2A83E68;
    v17 = v11;
    v18 = v12;
    v7 = v12;
    v14 = -[CalCancellableSearch initWithCancellationBlock:](v13, "initWithCancellationBlock:", v16);

  }
  else
  {
    if (v8)
      +[CalLocationManager placemarkForLocation:withCompletionBlock:].cold.1();
    v14 = 0;
  }

  return v14;
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_2(v5);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));

}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_28(uint64_t a1)
{
  CalLocationManagerDelegate *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v2 = [CalLocationManagerDelegate alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30;
  v6[3] = &unk_1E2A842C0;
  v9 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = &v10;
  v4 = -[CalLocationManagerDelegate initWithCurrentBundleID:completionBlock:](v2, "initWithCurrentBundleID:completionBlock:", v3, v6);
  v5 = (void *)v11[5];
  v11[5] = v4;

  _Block_object_dispose(&v10, 8);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_3();

    objc_msgSend(*(id *)(a1 + 48), "_loadMapKit");
    v8 = _sMapKitLoaded;
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_2();

      v11 = objc_alloc_init(NSClassFromString(CFSTR("_MKLocationShifter")));
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_33;
      v16[3] = &unk_1E2A84298;
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v11, "shiftLocation:withCompletionHandler:callbackQueue:", v5, v16, MEMORY[0x1E0C80D38]);

    }
    else
    {
      if (v10)
        __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_1();

      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CalLocationErrorDomain, 4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

}

uint64_t __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isCurrentProcessEntitledToUseLocationServices
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.locationd.effective_bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

uint64_t __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_45(uint64_t a1)
{
  NSObject *v2;

  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_45_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "cancelGeocode");
}

uint64_t __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_46(uint64_t a1)
{
  NSObject *v2;

  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_46_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "cancelGeocode");
}

uint64_t __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_52(uint64_t a1)
{
  NSObject *v2;

  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_52_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

+ (void)currentLocationWithCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Attempting to get our current location without a completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)currentLocationWithCompletionBlock:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, a1, a3, "Bundle id for location lookup being set to [%@].", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)currentLocationWithCompletionBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Current bundle id for location lookup is [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)currentLocationWithCompletionBlock:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Location services is enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)currentLocationWithCompletionBlock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Location services is *disabled*.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Location services is not authorized for Calendar/Reminders.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Current process is code signed and has the correct entitlements.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Current process is not code signed/ does not have the correct entitlements.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Location services is authorized for Calendar/Reminders.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "MapKit *not* loaded.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "MapKit loaded.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_30_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Loading mapkit...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)placemarkForLocation:withCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Attempting to a placemark for a location without a completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)placemarkForLocation:withCompletionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Attempting to get a placemark for the location [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_18FC12000, v0, (uint64_t)v0, "Choosing this placemark [%@] for this location [%@]", v1);
  OUTLINED_FUNCTION_4();
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18FC12000, v2, v3, "Found [%@] placemarks for the location [%@].. placemarks: [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Cancelled geocode for location [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)placemarkForAddress:withCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Attempting to a placemark for the address [%@] without a completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "No placemarks found for [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Cancelled geocode for address [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)strictGeocodeString:withCompletionBlock:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "No completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)strictGeocodeString:withCompletionBlock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Attempting to do strict geocoding for a location string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "mapItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_7(&dword_18FC12000, a2, v8, "Found [%@] locations: [%@].", (uint8_t *)&v9);

}

void __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_52_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Cancelled strict geocode for address [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __33__CalLocationManager__loadMapKit__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18FC12000, v0, OS_LOG_TYPE_ERROR, "Could not load MapKit framework bundle.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

@end
