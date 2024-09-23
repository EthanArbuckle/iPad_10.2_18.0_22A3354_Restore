@implementation ISRegionDetector

+ (id)sharedRegionDetector
{
  void *v2;
  ISRegionDetector *v3;
  void *v4;

  v2 = (void *)sharedRegionDetector_sharedInstance;
  if (!sharedRegionDetector_sharedInstance)
  {
    v3 = objc_alloc_init(ISRegionDetector);
    v4 = (void *)sharedRegionDetector_sharedInstance;
    sharedRegionDetector_sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedRegionDetector_sharedInstance;
  }
  return v2;
}

- (id)_countryFromTelephony
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  id v14;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
  v14 = 0;
  objc_msgSend(v2, "getSubscriptionInfoWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v4)
  {
    v5 = v4;
LABEL_3:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "subscriptionsInUse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v7, "count");

  if (!v5)
    goto LABEL_3;
  objc_msgSend(v3, "subscriptionsInUse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = (void *)objc_msgSend(v2, "copyMobileCountryCode:error:", v9, &v13);
  v5 = v13;

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v12 = 0;
    v6 = (void *)objc_msgSend(v2, "copyMobileSubscriberIsoCountryCode:error:", v10, &v12);
    v5 = v12;
  }

LABEL_9:
  return v6;
}

- (id)_checkForAliases:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1EA166370, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
          }
          else
          {
            v14[0] = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
            v10 = (id)objc_claimAutoreleasedReturnValue();
          }
          v12 = v10;
          objc_msgSend(v4, "replaceObjectsInRange:withObjectsFromArray:", v7, 1, v10);
          v11 = objc_msgSend(v12, "count");

        }
        else
        {
          v11 = 1;
        }
        v7 += v11;

      }
      while (v7 < v6);
    }
  }
  return v4;
}

- (id)_checkForAliasesOrInvalid:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSSet *validCountries;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_validCountries)
  {
    v25 = v4;
    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      v11 = *MEMORY[0x1E0C997B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v13 = (void *)MEMORY[0x1E0C99DC8];
          objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsFromLocaleIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            -[NSSet addObject:](v6, "addObject:", v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    validCountries = self->_validCountries;
    self->_validCountries = v6;

    v4 = v25;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[ISRegionDetector _checkForAliases:](self, "_checkForAliases:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (-[NSSet containsObject:](self->_validCountries, "containsObject:", v23))
          objc_msgSend(v5, "addObject:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  return v5;
}

- (id)_checkedArrayForString:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISRegionDetector _checkForAliases:](self, "_checkForAliases:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (ISRegionDetector)init
{
  ISRegionDetector *v2;
  ISRegionDetector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISRegionDetector;
  v2 = -[ISRegionDetector init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfWiFiScanAttemptsRemaining = 5;
    if (!v2->_guessedCountries)
    {
      -[ISRegionDetector getCountryFromTelephony](v2, "getCountryFromTelephony");
      if (!v3->_guessedCountries)
        -[ISRegionDetector _startWifiScan](v3, "_startWifiScan");
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[ISRegionDetector _closeWifiConnection](self, "_closeWifiConnection");
  v3.receiver = self;
  v3.super_class = (Class)ISRegionDetector;
  -[ISRegionDetector dealloc](&v3, sel_dealloc);
}

- (id)guessedCountryFromTelephony
{
  return self->_guessedCountryFromTelephony;
}

- (BOOL)getCountryFromTelephony
{
  NSString *guessedCountryFromTelephony;
  NSString *v4;
  NSString *v5;
  NSUInteger v6;
  void *v7;
  void *v8;

  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  if (!guessedCountryFromTelephony)
  {
    -[ISRegionDetector _countryFromTelephony](self, "_countryFromTelephony");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_guessedCountryFromTelephony;
    self->_guessedCountryFromTelephony = v4;

    v6 = -[NSString length](self->_guessedCountryFromTelephony, "length");
    guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    if (v6)
    {
      -[NSString uppercaseString](guessedCountryFromTelephony, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISRegionDetector _checkedArrayForString:](self, "_checkedArrayForString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISRegionDetector setGuessedCountries:](self, "setGuessedCountries:", v8);

      guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    }
  }
  return guessedCountryFromTelephony != 0;
}

- (id)guessedLanguages
{
  ISRegionDetector *v2;
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  ISRegionDetector *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_guessedCountries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v2;
    v5 = v2->_guessedCountries;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0C99DC8], "languagesForRegion:subdivision:withThreshold:filter:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 0, 1, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "reverseObjectEnumerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v12);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    while (1)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = v4;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (!v14)
        break;
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(v19, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            if ((objc_msgSend(v3, "containsObject:", v20) & 1) == 0)
              objc_msgSend(v3, "addObject:", v20);
            objc_msgSend(v19, "removeLastObject");
            v16 = 1;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v15);

      if ((v16 & 1) == 0)
        goto LABEL_25;
    }

LABEL_25:
    v2 = v22;
  }
  else
  {
    v3 = 0;
  }
  if (!v2->_firstGuessedLanguages)
    -[ISRegionDetector setFirstGuessedLanguages:](v2, "setFirstGuessedLanguages:", v3);
  return v3;
}

- (void)_startWifiScan
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  +[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:].cold.1(v0);
}

- (void)_getWifiDevice
{
  __WiFiManagerClient *fWifiManager;
  void *v4;
  void *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  __WiFiDeviceClient *ValueAtIndex;
  CFTypeID v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  fWifiManager = self->fWifiManager;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v4 = getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  v16 = getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  if (!getWiFiManagerClientCopyDevicesSymbolLoc_ptr)
  {
    v5 = (void *)MobileWiFiLibrary();
    v4 = dlsym(v5, "WiFiManagerClientCopyDevices");
    v14[3] = (uint64_t)v4;
    getWiFiManagerClientCopyDevicesSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v13, 8);
  if (!v4)
    -[ISRegionDetector _startWifiScan].cold.1();
  v6 = (const __CFArray *)((uint64_t (*)(__WiFiManagerClient *))v4)(fWifiManager);
  if (v6)
  {
    v7 = v6;
    if (CFArrayGetCount(v6))
    {
      ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v7, 0);
      self->fWifiDevice = ValueAtIndex;
      if (ValueAtIndex)
      {
        v9 = CFGetTypeID(ValueAtIndex);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v10 = getWiFiDeviceClientGetTypeIDSymbolLoc_ptr;
        v16 = getWiFiDeviceClientGetTypeIDSymbolLoc_ptr;
        if (!getWiFiDeviceClientGetTypeIDSymbolLoc_ptr)
        {
          v11 = (void *)MobileWiFiLibrary();
          v10 = dlsym(v11, "WiFiDeviceClientGetTypeID");
          v14[3] = (uint64_t)v10;
          getWiFiDeviceClientGetTypeIDSymbolLoc_ptr = v10;
        }
        _Block_object_dispose(&v13, 8);
        if (!v10)
          -[ISRegionDetector _startWifiScan].cold.1();
        if (v9 == ((uint64_t (*)(uint64_t))v10)(v12))
          CFRetain(self->fWifiDevice);
      }
    }
    CFRelease(v7);
  }
}

- (void)_scanWifiListWithDevice:(__WiFiDeviceClient *)a3
{
  if (a3)
  {
    self->fWifiDevice = a3;
    CFRetain(a3);
    -[ISRegionDetector _scanWifiList](self, "_scanWifiList");
  }
  else
  {
    -[ISRegionDetector _closeWifiConnection](self, "_closeWifiConnection");
  }
}

- (void)_scanWifiList
{
  void *v3;
  void *v4;
  __WiFiDeviceClient *fWifiDevice;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISRegionDetector setWirelessScanStartDate:](self, "setWirelessScanStartDate:", v4);

  fWifiDevice = self->fWifiDevice;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getWiFiDeviceClientScanAsyncSymbolLoc_ptr;
  v13 = getWiFiDeviceClientScanAsyncSymbolLoc_ptr;
  if (!getWiFiDeviceClientScanAsyncSymbolLoc_ptr)
  {
    v7 = (void *)MobileWiFiLibrary();
    v6 = dlsym(v7, "WiFiDeviceClientScanAsync");
    v11[3] = (uint64_t)v6;
    getWiFiDeviceClientScanAsyncSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
    -[ISRegionDetector _startWifiScan].cold.1();
  if (((unsigned int (*)(__WiFiDeviceClient *, void *, _QWORD, ISRegionDetector *))v6)(fWifiDevice, v3, scanComplete, self))
  {
    if (-[ISRegionDetector numberOfWiFiScanAttemptsRemaining](self, "numberOfWiFiScanAttemptsRemaining"))
    {
      -[ISRegionDetector setNumberOfWiFiScanAttemptsRemaining:](self, "setNumberOfWiFiScanAttemptsRemaining:", -[ISRegionDetector numberOfWiFiScanAttemptsRemaining](self, "numberOfWiFiScanAttemptsRemaining") - 1);
      v8 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__ISRegionDetector__scanWifiList__block_invoke;
      block[3] = &unk_1EA14D758;
      block[4] = self;
      dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    }
    else
    {
      -[ISRegionDetector _closeWifiConnection](self, "_closeWifiConnection");
    }
  }

}

_QWORD *__33__ISRegionDetector__scanWifiList__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
  {
    if (result[5])
      return (_QWORD *)objc_msgSend(result, "_scanWifiList");
  }
  return result;
}

- (void)_scanComplete:(id)a3 error:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *j;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  ISRegionDetector *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unsigned int v46;
  _BYTE v47[3];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!a4 && !self->_guessedCountries)
  {
    v32 = self;
    v8 = objc_msgSend(v6, "count");
    if (!v8)
    {
LABEL_43:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "postNotificationName:object:", CFSTR("BYCountryScanCompletedNotification"), 0);

      self = v32;
      goto LABEL_44;
    }
    v9 = v8;
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v11 = 0;
    v46 = 3;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v13 = getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr;
      v51 = getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr;
      if (!getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr)
      {
        v14 = (void *)MobileWiFiLibrary();
        v13 = dlsym(v14, "WiFiNetworkGet11dCountryCodeFromIe");
        v49[3] = (uint64_t)v13;
        getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr = v13;
      }
      _Block_object_dispose(&v48, 8);
      if (!v13)
        -[ISRegionDetector _startWifiScan].cold.1();
      if (((unsigned int (*)(void *, _BYTE *, unsigned int *))v13)(v12, v47, &v46) && v46 >= 2)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v47, 2, 1);
        objc_msgSend(v33, "addObject:", v15);

      }
      ++v11;
    }
    while (v9 != v11);
    -[ISRegionDetector _checkForAliasesOrInvalid:](self, "_checkForAliasesOrInvalid:", v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v17);
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = v10;
    v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v21)
    {
      v22 = 0;
      v23 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          v25 = objc_msgSend(v20, "countForObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j));
          if (v25 > v22)
            v22 = v25;
        }
        v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v21);

      if (!v22)
      {
        v21 = 0;
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v26 = v20;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v35;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v35 != v28)
              objc_enumerationMutation(v26);
            v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k);
            if (objc_msgSend(v26, "countForObject:", v30) == v22)
              objc_msgSend(v21, "addObject:", v30);
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
        }
        while (v27);
      }
    }

LABEL_40:
    if (objc_msgSend(v21, "count"))
      -[ISRegionDetector setGuessedCountries:](v32, "setGuessedCountries:", v21);

    goto LABEL_43;
  }
LABEL_44:
  -[ISRegionDetector _closeWifiConnection](self, "_closeWifiConnection");

}

- (void)_closeWifiConnection
{
  __WiFiManagerClient *fWifiManager;
  CFRunLoopRef Current;
  void *v5;
  void *v6;
  __WiFiDeviceClient *fWifiDevice;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  fWifiManager = self->fWifiManager;
  if (fWifiManager)
  {
    Current = CFRunLoopGetCurrent();
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v5 = getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
    v11 = getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
    if (!getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr)
    {
      v6 = (void *)MobileWiFiLibrary();
      v5 = dlsym(v6, "WiFiManagerClientUnscheduleFromRunLoop");
      v9[3] = (uint64_t)v5;
      getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr = v5;
    }
    _Block_object_dispose(&v8, 8);
    if (!v5)
      -[ISRegionDetector _startWifiScan].cold.1();
    ((void (*)(__WiFiManagerClient *, CFRunLoopRef, _QWORD))v5)(fWifiManager, Current, *MEMORY[0x1E0C9B270]);
    CFRelease(self->fWifiManager);
    self->fWifiManager = 0;
  }
  fWifiDevice = self->fWifiDevice;
  if (fWifiDevice)
  {
    CFRelease(fWifiDevice);
    self->fWifiDevice = 0;
  }
}

- (void)reset
{
  NSString *guessedCountryFromTelephony;

  -[ISRegionDetector setGuessedCountries:](self, "setGuessedCountries:", 0);
  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  self->_guessedCountryFromTelephony = 0;

}

- (NSArray)guessedCountries
{
  return self->_guessedCountries;
}

- (void)setGuessedCountries:(id)a3
{
  objc_storeStrong((id *)&self->_guessedCountries, a3);
}

- (NSArray)firstGuessedLanguages
{
  return self->_firstGuessedLanguages;
}

- (void)setFirstGuessedLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_firstGuessedLanguages, a3);
}

- (BOOL)fakeMode
{
  return self->_fakeMode;
}

- (void)setFakeMode:(BOOL)a3
{
  self->_fakeMode = a3;
}

- (NSDate)wirelessScanStartDate
{
  return self->_wirelessScanStartDate;
}

- (void)setWirelessScanStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessScanStartDate, a3);
}

- (unint64_t)numberOfWiFiScanAttemptsRemaining
{
  return self->_numberOfWiFiScanAttemptsRemaining;
}

- (void)setNumberOfWiFiScanAttemptsRemaining:(unint64_t)a3
{
  self->_numberOfWiFiScanAttemptsRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessScanStartDate, 0);
  objc_storeStrong((id *)&self->_firstGuessedLanguages, 0);
  objc_storeStrong((id *)&self->_validCountries, 0);
  objc_storeStrong((id *)&self->_guessedCountries, 0);
  objc_storeStrong((id *)&self->_guessedCountryFromTelephony, 0);
}

@end
