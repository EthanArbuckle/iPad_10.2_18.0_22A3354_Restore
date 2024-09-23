@implementation AKCarrierBundleUtilities

- (AKCarrierBundleUtilities)init
{
  AKCarrierBundleUtilities *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *carrierUtilitiesQueue;
  uint64_t v6;
  CoreTelephonyClient *telephonyClient;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKCarrierBundleUtilities;
  v2 = -[AKCarrierBundleUtilities init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.accounts.carrierUtilities.queue", v3);
    carrierUtilitiesQueue = v2->_carrierUtilitiesQueue;
    v2->_carrierUtilitiesQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_carrierUtilitiesQueue);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v6;

    -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);
  }
  return v2;
}

+ (AKCarrierBundleUtilities)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  return (AKCarrierBundleUtilities *)(id)sharedInstance_sharedInstance;
}

void __42__AKCarrierBundleUtilities_sharedInstance__block_invoke()
{
  AKCarrierBundleUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(AKCarrierBundleUtilities);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)phoneBundleInfoWithAdditionalInfo:(id)a3 error:(id *)a4
{
  CoreTelephonyClient *telephonyClient;
  void *v7;
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  telephonyClient = self->_telephonyClient;
  v53 = 0;
  -[CoreTelephonyClient getSubscriptionInfoWithError:](telephonyClient, "getSubscriptionInfoWithError:", &v53);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v53;
  v9 = v8;
  if (v7)
  {
    v38 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](self->_telephonyClient, "getCurrentDataSubscriptionContextSync:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreTelephonyClient getUserDefaultVoiceSubscriptionContext:](self->_telephonyClient, "getUserDefaultVoiceSubscriptionContext:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subscriptionsInUse");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v39 = v7;
    objc_msgSend(v7, "subscriptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v46)
    {
      v41 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v50 != v41)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v44, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v12 == v13;

          objc_msgSend(v43, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15 == v16;

          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __68__AKCarrierBundleUtilities_phoneBundleInfoWithAdditionalInfo_error___block_invoke;
          v48[3] = &unk_1E2E5F250;
          v48[4] = v11;
          v18 = objc_msgSend(v42, "indexOfObjectPassingTest:", v48);
          v56[0] = CFSTR("slotID");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "slotID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = v19;
          v56[1] = CFSTR("dataPreferred");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v57[1] = v20;
          v56[2] = CFSTR("defaultVoice");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v57[2] = v21;
          v57[3] = MEMORY[0x1E0C9AAB0];
          v56[3] = CFSTR("physicalSim");
          v56[4] = CFSTR("inUse");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18 != 0x7FFFFFFFFFFFFFFFLL);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v57[4] = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          -[CoreTelephonyClient getMobileSubscriberHomeCountryList:error:](self->_telephonyClient, "getMobileSubscriberHomeCountryList:error:", v11, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "phoneNumber");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKCarrierBundleUtilities _formattedValueForPhoneNumber:countryCode:](self, "_formattedValueForPhoneNumber:countryCode:", v27, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("number"));
          objc_msgSend(v11, "label");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v11, "label");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("label"));

          }
          if (v47)
          {
            objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("PhoneCertificate"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = objc_msgSend(v31, "slotID");
              if (v32 == objc_msgSend(v11, "slotID"))
              {
                objc_msgSend(v31, "phoneCertificate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, CFSTR("PAC"));

              }
            }

          }
          _AKLogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v24;
            _os_log_debug_impl(&dword_19202F000, v34, OS_LOG_TYPE_DEBUG, "Populating results with bundle info: %@", buf, 0xCu);
          }

          v35 = (void *)objc_msgSend(v24, "copy");
          objc_msgSend(v45, "addObject:", v35);

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v46);
    }

    v9 = v38;
    v7 = v39;
  }
  else
  {
    _AKLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[AKCarrierBundleUtilities phoneBundleInfoWithAdditionalInfo:error:].cold.1((uint64_t)v9, v36);

    v45 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v45;
}

uint64_t __68__AKCarrierBundleUtilities_phoneBundleInfoWithAdditionalInfo_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)_formattedValueForPhoneNumber:(id)a3 countryCode:(id)a4
{
  id v4;
  const char *v5;
  char *v6;
  CFStringRef v7;
  CFStringRef v8;
  uint64_t v9;
  const void *v10;
  void *String;

  v4 = a4;
  v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  if (v5)
  {
    v6 = (char *)v5;
    v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0x8000100u);
    if (v7)
    {
      v8 = v7;
      v9 = CFPhoneNumberCreate();
      if (v9)
      {
        v10 = (const void *)v9;
        String = (void *)CFPhoneNumberCreateString();
        CFRelease(v10);
      }
      else
      {
        String = 0;
      }
      CFRelease(v8);
    }
    else
    {
      String = 0;
    }
    free(v6);
  }
  else
  {
    String = 0;
  }

  return String;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierUtilitiesQueue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

- (void)phoneBundleInfoWithAdditionalInfo:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch subscription info with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
