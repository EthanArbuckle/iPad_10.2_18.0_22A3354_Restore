@implementation CDMDCSContextualPredicate

void __59___CDMDCSContextualPredicate_predicateForUserIsLeavingHome__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[_CDUserContextQueries keyPathForUserIsLeavingHomeStatus](_CDUserContextQueries, "keyPathForUserIsLeavingHomeStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_predicateForChangeAtKeyPath:identifier:", v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)predicateForUserIsLeavingHome_contextualPredicate;
  predicateForUserIsLeavingHome_contextualPredicate = v4;

}

void __62___CDMDCSContextualPredicate_predicateForUserIsArrivingAtHome__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[_CDUserContextQueries keyPathForUserIsArrivingAtHomeStatus](_CDUserContextQueries, "keyPathForUserIsArrivingAtHomeStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_predicateForChangeAtKeyPath:identifier:", v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)predicateForUserIsArrivingAtHome_contextualPredicate;
  predicateForUserIsArrivingAtHome_contextualPredicate = v4;

}

void __67___CDMDCSContextualPredicate_predicateForPhotosAppBecameForeground__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("SUBQUERY(self.%@.value, $appInfo, $appInfo.%@ == %@) .@count > 0"), v3, v4, CFSTR("com.apple.mobileslideshow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_predicateForKeyPath:withPredicate:identifier:", v8, v5, CFSTR("2984e253-ce6b-f5b2-77af-000000000000"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)predicateForPhotosAppBecameForeground_contextualPredicate;
  predicateForPhotosAppBecameForeground_contextualPredicate = v6;

}

void __60___CDMDCSContextualPredicate_predicateForNetworkQualityFair__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  +[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  +[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  +[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  +[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("self.%@.value >= %@ or self.%@.value >= %@ or self.%@.value >= %@"), v8, &unk_1E26DFCF8, v9, &unk_1E26DFCF8, v10, &unk_1E26DFCF8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contextualPredicateForKeyPaths:withPredicate:identifier:", v6, v11, CFSTR("0f403649-9be2-e755-d0fa-000000000000"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)predicateForNetworkQualityFair_contextualPredicate;
  predicateForNetworkQualityFair_contextualPredicate = v12;

}

void __59___CDMDCSContextualPredicate_predicateForNetworkQualityBad__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  +[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  +[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  +[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  +[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("self.%@.value <= %@ and self.%@.value <= %@ and self.%@.value <= %@"), v8, &unk_1E26DFD10, v9, &unk_1E26DFD10, v10, &unk_1E26DFD10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contextualPredicateForKeyPaths:withPredicate:identifier:", v6, v11, CFSTR("a56a7166-c833-0cbd-948e-000000000000"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)predicateForNetworkQualityBad_contextualPredicate;
  predicateForNetworkQualityBad_contextualPredicate = v12;

}

void __58___CDMDCSContextualPredicate_predicateForIsConnectedToCar__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  +[_CDContextQueries keyPathForCarplayConnectedStatus](_CDContextQueries, "keyPathForCarplayConnectedStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForCarConnectedStatus](_CDContextQueries, "keyPathForCarConnectedStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v11[0] = v3;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:identifier:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)predicateForIsConnectedToCar_contextualPredicate;
  predicateForIsConnectedToCar_contextualPredicate = v9;

}

void __75___CDMDCSContextualPredicate_predicateForIsConnectedToAudioBluetoothDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[_CDContextQueries keyPathForBluetoothDataDictionary](_CDContextQueries, "keyPathForBluetoothDataDictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries bluetoothConnectionStatusKey](_CDContextQueries, "bluetoothConnectionStatusKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries bluetoothDeviceTypeKey](_CDContextQueries, "bluetoothDeviceTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.%@.value.%@ == %@ and self.%@.value.%@ in %@"), v9, v2, MEMORY[0x1E0C9AAB0], v9, v3, &unk_1E26DFEC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_predicateForKeyPath:withPredicate:identifier:", v9, v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)predicateForIsConnectedToAudioBluetoothDevice_contextualPredicate;
  predicateForIsConnectedToAudioBluetoothDevice_contextualPredicate = v7;

}

void __51___CDMDCSContextualPredicate_predicateForNextAlarm__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  +[_CDContextQueries keyPathForNextAlarm](_CDContextQueries, "keyPathForNextAlarm");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_predicateForChangeAtKeyPath:identifier:", v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)predicateForNextAlarm_contextualPredicate;
  predicateForNextAlarm_contextualPredicate = v4;

}

void __59___CDMDCSContextualPredicate_predicateForBacklightOnStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[_CDContextQueries keyPathForBacklightOnStatus](_CDContextQueries, "keyPathForBacklightOnStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_predicateForChangeAtKeyPath:identifier:", v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)predicateForBacklightOnStatus_contextualPredicate;
  predicateForBacklightOnStatus_contextualPredicate = v4;

}

void __55___CDMDCSContextualPredicate_predicateForForegroundApp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[_CDContextQueries keyPathForForegroundApp](_CDContextQueries, "keyPathForForegroundApp");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_predicateForChangeAtKeyPath:identifier:", v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)predicateForForegroundApp_contextualPredicate;
  predicateForForegroundApp_contextualPredicate = v4;

}

void __54___CDMDCSContextualPredicate_predicateWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "predicates");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "identifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(v2, "copy");
  v11 = (void *)predicateWithIdentifier__mapping;
  predicateWithIdentifier__mapping = v10;

}

void __40___CDMDCSContextualPredicate_predicates__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  +[_CDMDCSContextualPredicate predicateForUserIsLeavingHome](_CDMDCSContextualPredicate, "predicateForUserIsLeavingHome");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v0;
  +[_CDMDCSContextualPredicate predicateForUserIsArrivingAtHome](_CDMDCSContextualPredicate, "predicateForUserIsArrivingAtHome");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v1;
  +[_CDMDCSContextualPredicate predicateForPhotosAppBecameForeground](_CDMDCSContextualPredicate, "predicateForPhotosAppBecameForeground");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v2;
  +[_CDMDCSContextualPredicate predicateForNetworkQualityFair](_CDMDCSContextualPredicate, "predicateForNetworkQualityFair");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v3;
  +[_CDMDCSContextualPredicate predicateForNetworkQualityBad](_CDMDCSContextualPredicate, "predicateForNetworkQualityBad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v4;
  +[_CDMDCSContextualPredicate predicateForIsConnectedToCar](_CDMDCSContextualPredicate, "predicateForIsConnectedToCar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v5;
  +[_CDMDCSContextualPredicate predicateForIsConnectedToAudioBluetoothDevice](_CDMDCSContextualPredicate, "predicateForIsConnectedToAudioBluetoothDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v6;
  +[_CDMDCSContextualPredicate predicateForNextAlarm](_CDMDCSContextualPredicate, "predicateForNextAlarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)predicates_predicates;
  predicates_predicates = v8;

  if (os_variant_has_internal_content())
  {
    v10 = (void *)predicates_predicates;
    +[_CDMDCSContextualPredicate predicateForBacklightOnStatus](_CDMDCSContextualPredicate, "predicateForBacklightOnStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    +[_CDMDCSContextualPredicate predicateForForegroundApp](_CDMDCSContextualPredicate, "predicateForForegroundApp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)predicates_predicates;
    predicates_predicates = v14;

  }
}

void __44___CDMDCSContextualPredicate_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)initWithCoder__allowedParameterClasses;
  initWithCoder__allowedParameterClasses = v5;

}

@end
