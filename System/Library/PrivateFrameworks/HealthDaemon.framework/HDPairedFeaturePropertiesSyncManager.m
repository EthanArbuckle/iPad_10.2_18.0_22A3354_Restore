@implementation HDPairedFeaturePropertiesSyncManager

- (HDPairedFeaturePropertiesSyncManager)initWithFeatureIdentifier:(id)a3 localFeatureAttributes:(id)a4 localCountrySetAvailabilityProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  _HDDeferredFeaturePropertiesWriting *v16;
  void *v17;
  _HDFeaturePropertiesWriting *v18;
  HDPairedFeaturePropertiesSyncManager *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  HKLocalFeaturePropertiesDefaultsDomainForFeatureIdentifier(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB6F18];
  v13 = v11;
  objc_msgSend(v12, "sharedBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAppleWatch");

  if (v15)
  {
    v16 = [_HDDeferredFeaturePropertiesWriting alloc];
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_HDDeferredFeaturePropertiesWriting initWithLocalDomain:pairedDeviceRegistry:](v16, "initWithLocalDomain:pairedDeviceRegistry:", v13, v17);

  }
  else
  {
    v18 = -[_HDFeaturePropertiesWriting initWithLocalDomain:]([_HDFeaturePropertiesWriting alloc], "initWithLocalDomain:", v13);
    v17 = v13;
  }

  v19 = -[HDPairedFeaturePropertiesSyncManager initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:activeRemoteReadSourceProvider:remoteReadSourceForDeviceProvider:localWriteSource:](self, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:activeRemoteReadSourceProvider:remoteReadSourceForDeviceProvider:localWriteSource:", v10, v9, v8, &__block_literal_global_156, &__block_literal_global_271_0, v18);
  return v19;
}

id __125__HDPairedFeaturePropertiesSyncManager_initWithFeatureIdentifier_localFeatureAttributes_localCountrySetAvailabilityProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  int v8;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCompanionCapable");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", v2);
    v6 = (id)objc_msgSend(v5, "synchronize");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAppleWatch");

    if (v8)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v2);
    else
      v5 = 0;
  }

  return v5;
}

id __125__HDPairedFeaturePropertiesSyncManager_initWithFeatureIdentifier_localFeatureAttributes_localCountrySetAvailabilityProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  int v12;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCompanionCapable");

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:pairedDevice:", v6, v5);
    v10 = (id)objc_msgSend(v9, "synchronize");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAppleWatch");

    if (v12)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v6);
    else
      v9 = 0;
  }

  return v9;
}

- (HDPairedFeaturePropertiesSyncManager)initWithFeatureIdentifier:(id)a3 localFeatureAttributes:(id)a4 localCountrySetAvailabilityProvider:(id)a5 activeRemoteReadSourceProvider:(id)a6 remoteReadSourceForDeviceProvider:(id)a7 localWriteSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HDPairedFeaturePropertiesSyncManager *v20;
  uint64_t v21;
  NSString *featureIdentifier;
  uint64_t v23;
  HKFeatureAttributes *localFeatureAttributes;
  void *v25;
  id activeRemoteReadSourceProvider;
  void *v27;
  id remoteReadSourceForDeviceProvider;
  id v29;
  const char *v30;
  NSObject *v31;
  id v32;
  id v34;
  id v35;
  objc_super v36;
  _QWORD handler[4];
  id v38;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)HDPairedFeaturePropertiesSyncManager;
  v20 = -[HDPairedFeaturePropertiesSyncManager init](&v36, sel_init);
  if (v20)
  {
    v34 = v19;
    v35 = v16;
    v21 = objc_msgSend(v14, "copy");
    featureIdentifier = v20->_featureIdentifier;
    v20->_featureIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    localFeatureAttributes = v20->_localFeatureAttributes;
    v20->_localFeatureAttributes = (HKFeatureAttributes *)v23;

    objc_storeStrong((id *)&v20->_localCountrySetAvailabilityProvider, a5);
    v25 = _Block_copy(v17);
    activeRemoteReadSourceProvider = v20->_activeRemoteReadSourceProvider;
    v20->_activeRemoteReadSourceProvider = v25;

    v27 = _Block_copy(v18);
    remoteReadSourceForDeviceProvider = v20->_remoteReadSourceForDeviceProvider;
    v20->_remoteReadSourceForDeviceProvider = v27;

    objc_storeStrong((id *)&v20->_localWriteSource, a8);
    v20->_nanoPreferencesSyncChangeNotificationToken = -1;
    objc_initWeak(&location, v20);
    HKFeaturePropertiesChangeNotificationForFeatureIdentifier();
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const char *)objc_msgSend(v29, "UTF8String");
    v31 = MEMORY[0x1E0C80D38];
    v32 = MEMORY[0x1E0C80D38];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __89__HDPairedFeaturePropertiesSyncManager__registerForNanoPreferencesSyncChangeNotification__block_invoke;
    handler[3] = &unk_1E6CE8390;
    objc_copyWeak(&v38, &location);
    notify_register_dispatch(v30, &v20->_nanoPreferencesSyncChangeNotificationToken, v31, handler);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
    -[HDLocalCountrySetAvailabilityProvider setDelegate:](v20->_localCountrySetAvailabilityProvider, "setDelegate:", v20);
    v19 = v34;
    v16 = v35;
  }

  return v20;
}

- (void)dealloc
{
  int nanoPreferencesSyncChangeNotificationToken;
  objc_super v4;

  if (self)
  {
    nanoPreferencesSyncChangeNotificationToken = self->_nanoPreferencesSyncChangeNotificationToken;
    if (nanoPreferencesSyncChangeNotificationToken != -1)
      notify_cancel(nanoPreferencesSyncChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HDPairedFeaturePropertiesSyncManager;
  -[HDPairedFeaturePropertiesSyncManager dealloc](&v4, sel_dealloc);
}

- (void)synchronizeLocalProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSString *featureIdentifier;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  NSDictionaryPreferencesSyncRepresentationForHKFeatureAttributes(self->_localFeatureAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke;
  v12[3] = &unk_1E6CFEA28;
  v12[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[HDLocalCountrySetAvailabilityProvider countrySet](self->_localCountrySetAvailabilityProvider, "countrySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSDictionaryPreferencesSyncRepresentationForHKCountrySet(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke_2;
  v11[3] = &unk_1E6CFEA28;
  v11[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    featureIdentifier = self->_featureIdentifier;
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = featureIdentifier;
    v10 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Initiating NanoPreferencesSync of feature properties", buf, 0x16u);

  }
  -[HDFeaturePropertiesWriting synchronize](self->_localWriteSource, "synchronize");
}

uint64_t __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", a3, a2);
}

uint64_t __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", a3, a2);
}

- (HKPairedFeatureAttributes)currentPairedFeatureAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(self->_featureIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_activeRemoteReadSourceProvider + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKFeatureAttributesFromSource(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69D0]), "initWithLocalAttributes:pairedAttributes:", self->_localFeatureAttributes, v5);

  return (HKPairedFeatureAttributes *)v6;
}

- (id)pairedFeatureAttributesForPairedDevice:(id)a3
{
  NSString *featureIdentifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  featureIdentifier = self->_featureIdentifier;
  v5 = a3;
  HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(featureIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_remoteReadSourceForDeviceProvider + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKFeatureAttributesFromSource(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69D0]), "initWithLocalAttributes:pairedAttributes:", self->_localFeatureAttributes, v8);

  return v9;
}

- (HKCountrySet)localCountrySet
{
  return -[HDLocalCountrySetAvailabilityProvider countrySet](self->_localCountrySetAvailabilityProvider, "countrySet");
}

- (HKCountrySet)activeRemoteCountrySet
{
  void *v3;
  void *v4;
  void *v5;

  HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(self->_featureIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_activeRemoteReadSourceProvider + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKCountrySetFromSource(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKCountrySet *)v5;
}

- (id)remoteCountrySetForDevice:(id)a3
{
  NSString *featureIdentifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  featureIdentifier = self->_featureIdentifier;
  v5 = a3;
  HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(featureIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_remoteReadSourceForDeviceProvider + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKCountrySetFromSource(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __89__HDPairedFeaturePropertiesSyncManager__registerForNanoPreferencesSyncChangeNotification__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id WeakRetained;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2 = (void *)objc_opt_class();
      v3 = *((_QWORD *)WeakRetained + 1);
      *(_DWORD *)buf = 138543618;
      v8 = v2;
      v9 = 2114;
      v10 = v3;
      v4 = v2;
      _os_log_impl(&dword_1B7802000, v1, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Notifying observers for received NPS change notification", buf, 0x16u);

    }
    v5 = objc_loadWeakRetained((id *)WeakRetained + 8);
    objc_msgSend(v5, "allowedCountriesDataSourceDidUpdateActiveRemoteCountrySet:", WeakRetained);

  }
}

- (void)reloadLocalCountrySetWithCompletion:(id)a3
{
  -[HDLocalCountrySetAvailabilityProvider downloadLatestOTAAvailabilityInfoWithCompletion:](self->_localCountrySetAvailabilityProvider, "downloadLatestOTAAvailabilityInfoWithCompletion:", a3);
}

- (void)regionAvailabilityProvidingDidUpdate:(id)a3
{
  NSObject *v4;
  void *v5;
  NSString *featureIdentifier;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    featureIdentifier = self->_featureIdentifier;
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = featureIdentifier;
    v7 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Notifying observers for local country set update", (uint8_t *)&v9, 0x16u);

  }
  -[HDPairedFeaturePropertiesSyncManager synchronizeLocalProperties](self, "synchronizeLocalProperties");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "allowedCountriesDataSourceDidUpdateLocalCountrySet:", self);

}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (HDAllowedCountriesDataSourceObserver)delegate
{
  return (HDAllowedCountriesDataSourceObserver *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localWriteSource, 0);
  objc_storeStrong(&self->_remoteReadSourceForDeviceProvider, 0);
  objc_storeStrong(&self->_activeRemoteReadSourceProvider, 0);
  objc_storeStrong((id *)&self->_localCountrySetAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_localFeatureAttributes, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
