@implementation GEOCountryConfigurationLocalProxy

void __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _BYTE *v36;
  _QWORD v37[4];
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!v8)
  {
    if (GEOConfigGetBOOL(GeoServicesConfig_ShouldOverrideCountryCode, (uint64_t)off_1EDF4CC68))
    {
      _getValue(GeoServicesConfig_OverrideCountryCode, (uint64_t)off_1EDF4CC78, 1, 0, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Overriding country code to '%{private}@' (is actually '%{private}@')", buf, 0x16u);
      }

      a3 = 258;
    }
    else
    {
      v13 = v7;
    }
    +[_GEOCountryConfigurationInfo get]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_GEOCountryConfigurationInfo countryCode:source:]((uint64_t)_GEOCountryConfigurationInfo, v13, a3);
    v15 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length")
      && v15
      && (objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "containsObject:", v13),
          v16,
          (v17 & 1) != 0))
    {
      if ((objc_msgSend((id)v15, "isEqual:", v12) & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v43 = __Block_byref_object_copy__17;
        v44 = __Block_byref_object_dispose__17;
        v45 = 0;
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 8);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2_245;
        v33[3] = &unk_1E1C061A8;
        v36 = buf;
        v33[4] = v18;
        v34 = v12;
        v35 = (id)v15;
        _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1EDF4CC58, v19, v33);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v20;

        _Block_object_dispose(buf, 8);
      }
      *(_QWORD *)buf = *(_QWORD *)(v15 + 16);
      v46[0] = CFSTR("cc");
      v46[1] = CFSTR("source");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v15 + 8));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46[2] = CFSTR("date");
      v23 = *(_QWORD *)(v15 + 24);
      *(_QWORD *)&buf[8] = v22;
      *(_QWORD *)&buf[16] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v46, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _setValue(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1EDF4CC58, v24, 1, 0);

      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_27;
      GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_DEBUG, "Finished updating country configuration. Calling callback.", buf, 2u);
      }

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_246;
      v31[3] = &unk_1E1C01F48;
      v26 = *(NSObject **)(a1 + 40);
      v32 = *(id *)(a1 + 48);
      dispatch_async(v26, v31);
      v27 = v32;
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Country code '%{public}@' is not a valid ISO 3166-1 alpha-2 country code. Ignoring...", buf, 0xCu);
      }

      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_27;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("Received non-ISO 3166-1 alpha-2 country code"), *MEMORY[0x1E0C9AFB0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v29;
      if (v13)
        objc_msgSend(v29, "setObject:forKey:", v13, CFSTR("Country Code"));
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_244;
      v37[3] = &unk_1E1C01F48;
      v30 = *(NSObject **)(a1 + 40);
      v38 = *(id *)(a1 + 48);
      dispatch_async(v30, v37);

    }
LABEL_27:

    v7 = v13;
    goto LABEL_28;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Could not determine current country code: %{public}@", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_238;
    block[3] = &unk_1E1BFF970;
    v41 = v10;
    v40 = v8;
    dispatch_async(v11, block);

    v12 = v41;
LABEL_28:

  }
}

uint64_t __82___GEOCountryConfigurationLocalProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCountryCodeWithCallbackQueue:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 72))
  {
    v3 = *(void **)(v2 + 48);
    v9 = 0;
    objc_msgSend(v3, "getCurrentDataSubscriptionContextSync:", &v9);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v9;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = v4;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v5;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Could not get active cellular data context: %{public}@", buf, 0xCu);
      }

    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 80));
}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (MGGetBoolAnswer())
  {
    if (CoreTelephonyLibraryCore())
    {
      v2 = objc_msgSend(objc_alloc((Class)getCoreTelephonyClientClass()), "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 48);
      *(_QWORD *)(v3 + 48) = v2;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDelegate:");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = geo_CTServerConnectionCreateOnTargetQueue(0, (uint64_t)CFSTR("com.apple.GeoServices.GEOCountryConfiguration"), *(void **)(*(_QWORD *)(a1 + 32) + 8), 0);
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Failed to create connection to telephony server. Will not use MCC country code lookup", v6, 2u);
        }

      }
    }
  }
}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_220(uint64_t a1)
{
  void *v2;
  void *v3;
  void *global_queue;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v2 = (void *)MEMORY[0x18D764E2C]();
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initializeIfNecessary");

  objc_autoreleasePoolPop(v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  v9 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  global_queue = (void *)geo_get_global_queue();
  _GEOConfigAddBlockListenerForKey(GeoServicesConfig_OverrideCountryCode, (uint64_t)off_1EDF4CC78, global_queue, &__block_literal_global_225);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_2(uint64_t a1)
{
  id v2;

  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNetworkReachableObserver:selector:", *(_QWORD *)(a1 + 32), sel__reachabilityChanged_);

}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_3()
{
  id v0;

  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateCountryConfiguration:", 0);

}

uint64_t __60___GEOCountryConfigurationLocalProxy_servingNetworkChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdate:", GEOConfigGetDouble(GeoServicesConfig_CountryConfigurationUpdateTimerInterval, (uint64_t)off_1EDF4D068));
}

void __60___GEOCountryConfigurationLocalProxy_currentDataSimChanged___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
}

void __59___GEOCountryConfigurationLocalProxy__reachabilityChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t v9[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("GEONetworkObserverReachable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Became reachable. Scheduling country code update", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdate:", GEOConfigGetDouble(GeoServicesConfig_CountryConfigurationUpdateTimerInterval, (uint64_t)off_1EDF4D068));
  }
}

uint64_t __54___GEOCountryConfigurationLocalProxy__scheduleUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t *v3;
  uint64_t v4;
  void *v5;
  uint8_t v7[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Update timer fired. Updating country code", v7, 2u);
  }

  v3 = *(dispatch_source_t **)(a1 + 32);
  if (v3[4])
  {
    dispatch_source_cancel(v3[4]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

    v3 = *(dispatch_source_t **)(a1 + 32);
  }
  return -[dispatch_source_t _updateCountryCodeWithCallbackQueue:callback:](v3, "_updateCountryCodeWithCallbackQueue:callback:", 0, 0);
}

uint64_t __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECDBBBC2 = result;
  return result;
}

void __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_229(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uppercaseString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v1 + 16))(v1, v2, 261, 0);

}

void __65___GEOCountryConfigurationLocalProxy__determineGeoIPCountryCode___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v5 = a1[4];
  if (v4 == *(void **)(v5 + 88))
  {
    *(_QWORD *)(v5 + 88) = 0;

  }
  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = a1[5];
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(v7 + 16);
    goto LABEL_13;
  }
  objc_msgSend(v3, "receivedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_12;
  }
  objc_msgSend(v3, "receivedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12 >= 0x65)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_13;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "receivedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v13, "initWithData:encoding:", v14, 4);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();

    goto LABEL_14;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138477827;
    v18 = v8;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Received country code '%{private}@' from network", (uint8_t *)&v17, 0xCu);
  }

  v9 = *(void (**)(void))(a1[5] + 16);
LABEL_13:
  v9();
LABEL_14:

}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_238(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_244(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -14);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2_245(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  GEOConfigRemoveBlockListener(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = dispatch_time(0, 1000000000);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_3;
  block[3] = &unk_1E1C01790;
  block[4] = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  dispatch_after(v4, v7, block);

}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationsForOldInfo:newInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "serverProxy:countryCodeDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke_248(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "serverProxyProvidersDidChange:", *(_QWORD *)(a1 + 32));

}

@end
