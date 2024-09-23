uint64_t BPSSystemAppIsRemovable(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = BPSSystemAppIsRemovable_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&BPSSystemAppIsRemovable_onceToken, &__block_literal_global_333);
  v3 = objc_msgSend((id)BPSSystemAppIsRemovable_removableSystemAppBundles, "containsObject:", v2);

  return v3;
}

id BPSIsIconForBundleIDRemote(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = a1;
  objc_msgSend(v1, "setWithObjects:", CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.NanoAlarm"), CFSTR("com.apple.reminders"), CFSTR("com.apple.SessionTrackerApp"), CFSTR("com.apple.BridgeHealthSettings"), CFSTR("com.apple.private.PodcastsBridgeSettings"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = objc_msgSend(v3, "containsObject:", v2);

  objc_msgSend(v4, "numberWithBool:", v5 ^ 1u);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BPSGetRelevantScreenStringForProduct(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  v3 = 0;
  switch(BPSVariantSizeForProductType())
  {
    case 1:
      objc_msgSend(v2, "regular");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      objc_msgSend(v2, "compact");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
      objc_msgSend(v2, "size448h");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 8:
      objc_msgSend(v2, "size394h");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 13:
      objc_msgSend(v2, "size484h");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 14:
      objc_msgSend(v2, "size430h");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 19:
      objc_msgSend(v2, "size502h");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 20:
      objc_msgSend(v2, "size446h");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 21:
      objc_msgSend(v2, "size496h");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v3 = (void *)v4;
      break;
    default:
      break;
  }

  return v3;
}

uint64_t BPSVariantSizeForProductType()
{
  unsigned int v0;

  v0 = NRDeviceSizeForProductType() - 1;
  if (v0 > 8)
    return 0;
  else
    return qword_2114A3450[(__int16)v0];
}

id BPSLocalIconName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", &unk_24CBF0138);
  +[BPSBridgeAppContext shared](BPSBridgeAppContext, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BPSIsDeviceCompatibleWithVersions(CFSTR("3"), CFSTR("5"), v4);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("contacts-v4");
LABEL_5:
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("com.apple.MobileAddressBook"));
    goto LABEL_6;
  }
  +[BPSBridgeAppContext shared](BPSBridgeAppContext, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BPSIsDeviceCompatibleWithVersions(CFSTR("2"), CFSTR("3"), v8);

  if (v9)
  {
    v6 = CFSTR("contacts-v3");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v2, "objectForKey:", v1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t BPSIsDeviceCompatibleWithVersions(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  int IsGreaterThanOrEqual;
  unsigned int v11;
  uint64_t v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (OverriddenProductVersion == -1)
    NRWatchOSVersionForRemoteDevice();
  v8 = NRRawVersionFromString();
  v9 = NRRawVersionFromString();
  if (v8 == -1)
    IsGreaterThanOrEqual = 1;
  else
    IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
  if (v9 == -1)
    v11 = 1;
  else
    v11 = NRVersionIsGreaterThanOrEqual() ^ 1;
  if (IsGreaterThanOrEqual)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

void BPSRemoveHiddenAppsFromSpecifiers(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  BPSRemovablePhoneAppMapping();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (BPSSystemAppIsRemoved(v8)
          && (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) == 0)
        {
          objc_msgSend(v2, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "specifierForID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "removeObject:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

uint64_t BPSSystemAppIsRemoved(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v9 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 0, &v9);
  v3 = v9;
  if (v3)
  {
    bps_utility_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v1;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "Error while retrieving application record %@ with error %@", buf, 0x16u);
    }

  }
  objc_msgSend(v2, "applicationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isInstalled") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v2, "applicationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isPlaceholder") ^ 1;

  }
  return v6;
}

id BPSRemovablePhoneAppMapping()
{
  if (BPSRemovablePhoneAppMapping_onceToken != -1)
    dispatch_once(&BPSRemovablePhoneAppMapping_onceToken, &__block_literal_global_471);
  return (id)BPSRemovablePhoneAppMapping_mapping;
}

id BPSDevicePickerCellBackgroundColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void BPSApplyStyleToToolbar(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(v1, "setBarStyle:", 1);
  objc_msgSend(v1, "setTranslucent:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTintColor:", v2);

}

void BPSApplyStyleToNavBarOptions(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "configureWithDefaultBackground");
  objc_msgSend(v3, "setStandardAppearance:", v4);
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v5);

  objc_msgSend(v3, "setPrefersLargeTitles:", a2);
  v14 = *MEMORY[0x24BDF6600];
  v6 = v14;
  BPSTextColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleTextAttributes:", v8);

  v12[0] = v6;
  BPSTextColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v12[1] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 32.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleTextAttributes:", v11);

}

id BPSMappedNanoBundleIDForNanoSettingsBundleID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = v1;
  v4 = v2;

  return v4;
}

id BPSTextColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BPSForceColorToDarkAppearance(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDF6F30];
  v2 = a1;
  objc_msgSend(v1, "traitCollectionWithUserInterfaceStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedColorWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id BPSGetActiveDevice()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activeDeviceSelectorBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

__CFString *_WatchImageNameForStyle(uint64_t a1, char a2)
{
  __CFString *v2;

  if ((unint64_t)(a1 - 1) <= 7)
  {
    v2 = off_24CBE4F08[a1 - 1];
    if ((a2 & 1) != 0)
      return v2;
    goto LABEL_5;
  }
  v2 = &stru_24CBE59D0;
  if ((a2 & 1) == 0)
  {
LABEL_5:
    BPSDeviceRemoteAssetString(v2);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id BPSDeviceRemoteAssetString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, *MEMORY[0x24BE6E4B0], v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t BPSDeviceHasAllCapabilitiesForStrings(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  id v35;
  void *v36;
  id v37;
  id obj;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = v8;
  v11 = v9;
  v12 = a4;
  v39 = v11;
  if (v7)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v54;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v13);
        if (!BPSDeviceHasCapabilityForString(*(void **)(*((_QWORD *)&v53 + 1) + 8 * v17), v12))
          goto LABEL_41;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          if (v15)
            goto LABEL_4;
          break;
        }
      }
    }

    v11 = v39;
  }
  if (v10)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v13 = v10;
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
LABEL_14:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v13);
        if ((BPSDeviceHasCapabilityForString(*(void **)(*((_QWORD *)&v49 + 1) + 8 * v21), v12) & 1) != 0)
          break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          if (v19)
            goto LABEL_14;
          goto LABEL_20;
        }
      }
LABEL_41:

      v33 = 0;
      v11 = v39;
      goto LABEL_45;
    }
LABEL_20:

    v11 = v39;
  }
  if (v11)
  {
    v35 = v12;
    v36 = v10;
    v37 = v7;
    objc_msgSend(v11, "allKeys");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v22)
    {
      v23 = v22;
      v40 = *(_QWORD *)v46;
      LOBYTE(v24) = 1;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v46 != v40)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v11, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v42;
            v24 &= 1u;
            while (2)
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v42 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(objc_retainAutorelease(v26), "cStringUsingEncoding:", 4);
                objc_msgSend(objc_retainAutorelease(v32), "cStringUsingEncoding:", 4);
                if ((v24 & _os_feature_enabled_impl()) != 1)
                {
                  LOBYTE(v24) = 0;
                  goto LABEL_37;
                }
                v24 = 1;
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
              if (v29)
                continue;
              break;
            }
LABEL_37:
            v11 = v39;
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v23);
    }
    else
    {
      LOBYTE(v24) = 1;
    }

    v33 = v24 & 1;
    v10 = v36;
    v7 = v37;
    v12 = v35;
  }
  else
  {
    v33 = 1;
  }
LABEL_45:

  return v33;
}

uint64_t BPSDeviceHasCapabilityForString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "launchedToTest")
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("ntk-customization")) & 1) != 0)
  {
    goto LABEL_15;
  }
  if (BPSDeviceHasCapabilityForString_onceToken == -1)
  {
    if (v3)
      goto LABEL_5;
LABEL_15:
    v6 = 1;
    goto LABEL_16;
  }
  dispatch_once(&BPSDeviceHasCapabilityForString_onceToken, &__block_literal_global_103);
  if (!v3)
    goto LABEL_15;
LABEL_5:
  objc_msgSend((id)BPSDeviceHasCapabilityForString__capabilityMapping, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "supportsCapability:", v5);
  }
  else
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("internal")))
    {
      v7 = (_QWORD *)MEMORY[0x24BE6B350];
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("tinker-paired")))
      {
        v6 = 0;
        goto LABEL_13;
      }
      v7 = (_QWORD *)MEMORY[0x24BE6B340];
    }
    objc_msgSend(v4, "valueForProperty:", *v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "BOOLValue");

  }
LABEL_13:

LABEL_16:
  return v6;
}

uint64_t BPSDeviceHasStandaloneAppsCapability(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (objc_class *)MEMORY[0x24BDD1880];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithUUIDString:", CFSTR("1CFACCB8-FFEB-4682-A50E-16F853583912"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

id _CachePathForIcon(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v10;

  v1 = a1;
  _BridgeIconCachePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___CachePathForIcon_block_invoke;
  block[3] = &unk_24CBE4838;
  v10 = v2;
  v3 = _CachePathForIcon_onceToken;
  v4 = v2;
  if (v3 != -1)
    dispatch_once(&_CachePathForIcon_onceToken, block);
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[BPSIconCachePrivacyHelper saltedHashForString:](BPSIconCachePrivacyHelper, "saltedHashForString:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id _BridgeIconCachePath()
{
  if (_BridgeIconCachePath_onceToken != -1)
    dispatch_once(&_BridgeIconCachePath_onceToken, &__block_literal_global_98);
  return (id)_BridgeIconCachePath___bridgeIconCachePath;
}

void sub_2114830C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

id BPSCreateRoundedGizmoAppIconForSquareImage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  const void *v7;
  void *v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = objc_retainAutorelease(v1);
  objc_msgSend(v6, "CGImage");
  v7 = (const void *)LICreateIconForImage();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v7, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFRelease(v7);
  if (objc_msgSend(v6, "flipsForRightToLeftLayoutDirection"))
  {
    objc_msgSend(v8, "imageFlippedForRightToLeftLayoutDirection");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

uint64_t BPSBridgeTintColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

uint64_t BPSForegroundColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_secondarySystemGroupedBackgroundColor");
}

uint64_t BPSBackgroundColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_systemGroupedBackgroundColor");
}

uint64_t BPSSeparatorColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_separatorColor");
}

uint64_t BPSProgressBarTrackTintColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_separatorColor");
}

uint64_t BPSProgressBarTintColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

uint64_t BPSAccessoryColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_quaternaryLabelColor");
}

void BPSApplyStyleToNavBar(void *a1)
{
  BPSApplyStyleToNavBarOptions(a1, 0);
}

uint64_t BPSSetupTintColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

uint64_t BPSOffSwitchBorderColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_tertiarySystemGroupedBackgroundColor");
}

uint64_t BPSEditablePlaceholderColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_separatorColor");
}

id BPSDetailTextColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BPSPairingPendingMigrationDevices()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE6B4B8], "sharedMigrator");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "migratableDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BPSMigrationDevices()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE6B4B8], "sharedMigrator");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "migratableDevicesRequiringConsent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

double _ScreenInsets(uint64_t a1, uint64_t a2)
{
  double v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  double *v9;

  v4 = *MEMORY[0x24BDBEFB0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  switch(a1)
  {
    case 1:
      if (a2 == 1)
        return 39.5;
      else
        return 36.0;
    case 2:
      v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          v9 = (double *)&unk_2114A2630;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        v9 = (double *)&unk_2114A24E0;
        return v9[v8];
      }
      return v4;
    case 3:
      v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          v9 = (double *)&unk_2114A28D0;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        v9 = (double *)&unk_2114A2780;
        return v9[v8];
      }
      return v4;
    case 4:
      v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          v9 = (double *)&unk_2114A2E10;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        v9 = (double *)&unk_2114A2CC0;
        return v9[v8];
      }
      return v4;
    case 5:
      if (v7 <= 2.0)
        return 24.0;
      else
        return 28.0;
    case 6:
      v8 = a2 - 1;
      if ((unint64_t)(a2 - 1) < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        v9 = (double *)&unk_2114A2F60;
        return v9[v8];
      }
      return v4;
    case 7:
      v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          v9 = (double *)&unk_2114A2B70;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        v9 = (double *)&unk_2114A2A20;
        return v9[v8];
      }
      return v4;
    default:
      return v4;
  }
}

id BPSDevicePickerCellHighlightColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "systemGray4Color");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BPSCellHightlightColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "_tertiarySystemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id bps_setup_log()
{
  if (bps_setup_log_onceToken != -1)
    dispatch_once(&bps_setup_log_onceToken, &__block_literal_global_3);
  return (id)bps_setup_log___logger;
}

void __bps_utility_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BridgePreferences", "utility");
  v1 = (void *)bps_utility_log___logger;
  bps_utility_log___logger = (uint64_t)v0;

}

void __bps_setup_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BridgePreferences", "setup");
  v1 = (void *)bps_setup_log___logger;
  bps_setup_log___logger = (uint64_t)v0;

}

id NPSQueue()
{
  if (NPSQueue_onceToken != -1)
    dispatch_once(&NPSQueue_onceToken, &__block_literal_global_495);
  return (id)NPSQueue___npsQueue;
}

const __CFString *_BPSUnlocalizedNameForMaterial(unint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;

  if (a1 < 0x27 && ((0x4023FFFFBFuLL >> a1) & 1) != 0)
    return *(&off_24CBE54B8 + a1);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isInternalInstall");

  if (!v3)
    return &stru_24CBE59D0;
  bps_utility_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    _BPSUnlocalizedNameForMaterial_cold_1(a1, v4);

  return CFSTR("UNKNOWN_NAME");
}

uint64_t BPSStockholmSupportedInGizmoRegion(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v1 = a1;
  NPSQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke;
  block[3] = &unk_24CBE4EA8;
  v4 = v1;
  v13 = v4;
  dispatch_async(v2, block);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getNPKCompanionAgentConnectionClass_softClass_0;
  v18 = getNPKCompanionAgentConnectionClass_softClass_0;
  if (!getNPKCompanionAgentConnectionClass_softClass_0)
  {
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __getNPKCompanionAgentConnectionClass_block_invoke_0;
    v14[3] = &unk_24CBE4A00;
    v14[4] = &v15;
    __getNPKCompanionAgentConnectionClass_block_invoke_0((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v7 = objc_alloc_init(v6);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_3;
  v10[3] = &unk_24CBE53B0;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "shouldShowApplePaySettingsWithCompletion:", v10);

  return 1;
}

void sub_211485568(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getNPKCompanionAgentConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!NanoPassKitLibraryCore_frameworkLibrary)
  {
    NanoPassKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoPassKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getNPKCompanionAgentConnectionClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("NPKCompanionAgentConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getNPKCompanionAgentConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPKCompanionAgentConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;

  NanoPassKitLibrary();
  result = objc_getClass("NPKCompanionAgentConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNPKCompanionAgentConnectionClass_block_invoke_cold_1();
  getNPKCompanionAgentConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoPassKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoPassKitLibraryCore_frameworkLibrary_0)
    NanoPassKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = NanoPassKitLibraryCore_frameworkLibrary_0;
  if (!NanoPassKitLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t BPSDeviceHasCellularDataCapability(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = (objc_class *)MEMORY[0x24BDD1880];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithUUIDString:", CFSTR("4AA3FF3B-3224-42E6-995E-481F49AE9260"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  bps_utility_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    if ((_DWORD)v4)
      v6 = "YES";
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "CoreTelephony in Bridge: NRDevice hasTelephony=%s capability", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

id bps_utility_log()
{
  if (bps_utility_log_onceToken != -1)
    dispatch_once(&bps_utility_log_onceToken, &__block_literal_global_1);
  return (id)bps_utility_log___logger;
}

void sub_211485D38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getNSSManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  NanoSystemSettingsLibrary();
  result = objc_getClass("NSSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNSSManagerClass_block_invoke_cold_1();
  getNSSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoSystemSettingsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
    NanoSystemSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NanoSystemSettingsLibraryCore_frameworkLibrary;
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2114863F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  _Block_object_dispose((const void *)(v49 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_211486A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void _BPSUnlocalizedNameForMaterial_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_21147E000, a2, OS_LOG_TYPE_FAULT, "BPS BPSUnlocalizedNameForMaterial Unknown Material (%{public}@)", (uint8_t *)&v4, 0xCu);

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2114874A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id getkNSSAccountDSIDKey()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getkNSSAccountDSIDKeySymbolLoc_ptr;
  v6 = getkNSSAccountDSIDKeySymbolLoc_ptr;
  if (!getkNSSAccountDSIDKeySymbolLoc_ptr)
  {
    v1 = (void *)NanoSystemSettingsLibrary();
    v0 = (id *)dlsym(v1, "kNSSAccountDSIDKey");
    v4[3] = (uint64_t)v0;
    getkNSSAccountDSIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
  return *v0;
}

void sub_211487548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkNSSAccountAltDSIDKey()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getkNSSAccountAltDSIDKeySymbolLoc_ptr;
  v6 = getkNSSAccountAltDSIDKeySymbolLoc_ptr;
  if (!getkNSSAccountAltDSIDKeySymbolLoc_ptr)
  {
    v1 = (void *)NanoSystemSettingsLibrary();
    v0 = (id *)dlsym(v1, "kNSSAccountAltDSIDKey");
    v4[3] = (uint64_t)v0;
    getkNSSAccountAltDSIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
  return *v0;
}

void sub_2114875E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkNSSAccountUsernameKey()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getkNSSAccountUsernameKeySymbolLoc_ptr;
  v6 = getkNSSAccountUsernameKeySymbolLoc_ptr;
  if (!getkNSSAccountUsernameKeySymbolLoc_ptr)
  {
    v1 = (void *)NanoSystemSettingsLibrary();
    v0 = (id *)dlsym(v1, "kNSSAccountUsernameKey");
    v4[3] = (uint64_t)v0;
    getkNSSAccountUsernameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
  return *v0;
}

void sub_211487678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getFAProfilePictureStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!FamilyCircleUILibraryCore_frameworkLibrary)
  {
    FamilyCircleUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FamilyCircleUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getFAProfilePictureStoreClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("FAProfilePictureStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getFAProfilePictureStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2114880D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211488A6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  Class result;

  PassKitCoreLibrary();
  result = objc_getClass("PKPassLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPKPassLibraryClass_block_invoke_cold_1();
  getPKPassLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PassKitCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PassKitCoreLibraryCore_frameworkLibrary;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_21148F39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

Class __getAMSAcknowledgePrivacyTaskClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AMSAcknowledgePrivacyTask");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAMSAcknowledgePrivacyTaskClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BPSMuteForTodaySectionIdentifiersChanged(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_loadMutedSectionIdentifiers");
  objc_msgSend(v2, "_updateObservers");

}

void sub_211493414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BPSToday()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "components:fromDate:", 28, v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

const __CFString *BPSDeviceAssetDirectoryPath()
{
  return CFSTR("DeviceAssets/");
}

uint64_t BPSDeviceAssetString(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("DeviceAssets/"), a1);
}

const __CFString *BPSWatchViewStyleDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("BPSWatchViewStyleUnknown");
  else
    return off_24CBE4F48[a1 - 1];
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

Class __getNanoResourceGrabberClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
  {
    NanoResourceGrabberLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getNanoResourceGrabberClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("NanoResourceGrabber");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getNanoResourceGrabberClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BPSSetupBackgroundColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_systemBackgroundColor");
}

uint64_t BPSAccessoryHighlightColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

uint64_t BPSFontWithSize(double a1)
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], a1, *MEMORY[0x24BDF7880]);
}

uint64_t BPSRegularFontWithSize(double a1)
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], a1, *MEMORY[0x24BDF7888]);
}

uint64_t BPSBoldFontWithSize(double a1)
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], a1, *MEMORY[0x24BDF7868]);
}

id BPSTitleFont()
{
  void *v0;
  void *v6;
  _OWORD v8[4];
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = &unk_24CBEFFB0;
  v10[0] = &unk_24CBEFFF8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __asm { FMOV            V1.2D, #26.0 }
  v8[0] = xmmword_2114A33B0;
  v8[1] = _Q1;
  v8[2] = _Q1;
  v8[3] = _Q1;
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], BPSScreenValueGetRelevantZoomValue((double *)v8, v0), *MEMORY[0x24BDF7888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

double BPSScreenValueGetRelevantZoomValue(double *a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  double RelevantValue;
  void *v25;
  _OWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  objc_msgSend(v4, "nativeScale");
  v8 = v7;
  objc_msgSend(v4, "scale");
  if (v8 < v9 || v6 == 693.0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v3, "allKeys", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          v18 = v17;

          v20 = objc_msgSend(v15, "intValue") - 1;
          v19 = a1;
          switch(v20)
          {
            case 0:
              goto LABEL_15;
            case 1:
              v19 = a1 + 1;
              goto LABEL_15;
            case 2:
              v19 = a1 + 2;
              goto LABEL_15;
            case 3:
            case 8:
              v19 = a1 + 3;
              goto LABEL_15;
            case 4:
              v19 = a1 + 4;
              goto LABEL_15;
            case 6:
              v19 = a1 + 6;
              goto LABEL_15;
            case 7:
              v19 = a1 + 7;
LABEL_15:
              *v19 = v18;
              break;
            default:
              continue;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    v4 = v25;
  }
  v21 = *((_OWORD *)a1 + 1);
  v26[0] = *(_OWORD *)a1;
  v26[1] = v21;
  v22 = *((_OWORD *)a1 + 3);
  v26[2] = *((_OWORD *)a1 + 2);
  v26[3] = v22;
  RelevantValue = BPSScreenValueGetRelevantValue((uint64_t)v26);

  return RelevantValue;
}

uint64_t BPSProgressBarStalledTintColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
}

id BPSNavBarBackgroundPointImage()
{
  if (BPSNavBarBackgroundPointImage_onceToken != -1)
    dispatch_once(&BPSNavBarBackgroundPointImage_onceToken, &__block_literal_global_5);
  return (id)BPSNavBarBackgroundPointImage___backgroundPointImage;
}

id _BPSPointImageWithColor(void *a1, int a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGRect v14;

  v3 = (void *)MEMORY[0x24BDF6D38];
  v4 = a1;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  v9 = 1.0;
  if (a2)
    v10 = 1.0 / v8;
  else
    v10 = 1.0;
  v11 = v10;
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v9, 0, 0.0);
  objc_msgSend(v4, "set");

  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = v10;
  UIRectFill(v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v12;
}

id BPSNavBarShadowPointImage()
{
  if (BPSNavBarShadowPointImage_onceToken != -1)
    dispatch_once(&BPSNavBarShadowPointImage_onceToken, &__block_literal_global_28);
  return (id)BPSNavBarShadowPointImage___shadowPointImage;
}

id BPSSetupTintDisabledColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void BPSPresentGizmoUnreachableAlertWithDismissalHandler(void *a1)
{
  BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler(CFSTR("Unknown Caller (Profiles/Phone/LockUnlock)"), a1);
}

void BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a1;
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_GIZMO_UNREACHABLE_MESSAGE"), &stru_24CBE59D0, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sf_isInternalInstall");

  if (v7)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n\n[Internal Only: %@]"), v9);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  _BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler(v5, v3);

}

void BPSPresentGizmoUnreachableOrLockedServiceAlertWithDismissalHandler(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a1;
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_GIZMO_UNREACHABLE_LOCKED_MESSAGE"), &stru_24CBE59D0, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sf_isInternalInstall");

  if (v7)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n\n[Internal Only: %@]"), v9);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  _BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler(v5, v3);

}

void _BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint8_t v33[16];
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ALERT_GIZMO_UNREACHABLE_TITLE"), &stru_24CBE59D0, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilitySetInterfaceStyleIntent:", 1);

  v10 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ALERT_GIZMO_UNREACHABLE_BUTTON"), &stru_24CBE59D0, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = ___BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler_block_invoke;
  v41[3] = &unk_24CBE4AD0;
  v14 = v4;
  v42 = v14;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connectedScenes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v18)
  {
    v19 = v13;
    v20 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "windows");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "rootViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v18 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v18)
        continue;
      break;
    }
LABEL_11:
    v13 = v19;
  }

  objc_msgSend(v18, "presentedViewController");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = 0;
    do
    {
      v25 = v18;

      objc_msgSend(v25, "presentedViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "presentedViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v25;
    }
    while (v27);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "presentingViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dismissViewControllerAnimated:completion:", 1, 0);

    v29 = v25;
    v18 = v29;
  }
  if (v18)
  {
    objc_msgSend(v18, "transitionCoordinator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v34[0] = v13;
      v34[1] = 3221225472;
      v34[2] = ___BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler_block_invoke_524;
      v34[3] = &unk_24CBE5450;
      v35 = v18;
      v36 = v8;
      objc_msgSend(v30, "animateAlongsideTransition:completion:", 0, v34);
      bps_utility_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_21147E000, v31, OS_LOG_TYPE_DEFAULT, "We are in mid transition. Waiting until transition is complete to present BPS alert", v33, 2u);
      }

    }
    else
    {
      bps_utility_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_21147E000, v32, OS_LOG_TYPE_DEFAULT, "BPS presented 'transport became unreachable' alert", v33, 2u);
      }

      objc_msgSend(v18, "presentViewController:animated:completion:", v8, 1, 0);
    }

  }
}

id BPSLocalizedNameForMaterial(unint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  _BPSUnlocalizedNameForMaterial(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24CBE59D0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *BPSLocalizedShortEdition(unint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("Watch"));
    if (v8)
    {
      objc_msgSend(v6, "substringFromIndex:", v7 + v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));

  }
  v11 = &stru_24CBE59D0;
  if (a1 <= 0x16)
  {
    if (((1 << a1) & 0x10CF00) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("EDITION_EDITION_SHORT");
      goto LABEL_13;
    }
    if (((1 << a1) & 0x68001E) != 0 && v10)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("SPORT_EDITION_SHORT");
LABEL_13:
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24CBE59D0, CFSTR("Localizable"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("VICTORY_EDITION_SHORT");
    goto LABEL_18;
  }
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ZEUS_EDITION_SHORT");
LABEL_18:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24CBE59D0, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v18;
  }
  return v11;
}

uint64_t BPSVariantSizeForNRDeviceSize(int a1)
{
  if ((a1 - 1) > 8)
    return 0;
  else
    return qword_2114A3450[(__int16)(a1 - 1)];
}

uint64_t BPSVariantSizeForArtworkDeviceSubType()
{
  unsigned int v0;

  v0 = NRDeviceSizeForArtworkDeviceSubType() - 1;
  if (v0 > 8)
    return 0;
  else
    return qword_2114A3450[(__int16)v0];
}

id BPSLocalizedVariantSizeForProductType(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[11];

  v25[9] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1488];
  v18 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("COMPACT_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REGULAR_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("394H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("448H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("430H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("484H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("502H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("446H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable-N218"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("496H_VARIANT"), &stru_24CBE59D0, CFSTR("Localizable-N218"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BPSScreenStringObj screenStringsWithArray:](BPSScreenStringObj, "screenStringsWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BPSGetRelevantScreenStringForProduct((uint64_t)v18, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

id BPSShortLocalizedVariantSizeForProductType(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[11];

  v25[9] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1488];
  v18 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("COMPACT_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REGULAR_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("394H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("448H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("430H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("484H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("502H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("446H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable-N218"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("496H_VARIANT_SHORT"), &stru_24CBE59D0, CFSTR("Localizable-N218"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BPSScreenStringObj screenStringsWithArray:](BPSScreenStringObj, "screenStringsWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BPSGetRelevantScreenStringForProduct((uint64_t)v18, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

id BPSRemoveVersionIncompatibleSpecifiersFromArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  BPSGetActiveSetupCompletedDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "propertyForKey:", CFSTR("minimumWatchVersion"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertyForKey:", CFSTR("deprecatedInWatchVersion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (BPSIsDeviceCompatibleWithVersions(v9, v10, v2))
          objc_msgSend(v12, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v12;
}

id BPSGetActiveSetupCompletedDevice()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  BPSGetActiveDevice();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForProperty:", *MEMORY[0x24BE6B360]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "BOOLValue"))
    v2 = v0;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

BOOL _BPSIsPairingCompatible(unint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x24BE6B4E8];
  v4 = a2;
  objc_msgSend(v3, "systemVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minPairingCompatibilityVersionForChipID:", v4);

  objc_msgSend(MEMORY[0x24BE6B4E8], "systemVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxPairingCompatibilityVersion");

  return v6 <= a1 && v8 >= a1;
}

uint64_t _BPSOverrideDeviceCompatibleVersions()
{
  uint64_t result;

  result = NRRawVersionFromString();
  OverriddenProductVersion = result;
  return result;
}

id BPSRemoveCapabilityIncompatibleSpecifiersFromArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  BPSGetActiveSetupCompletedDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "propertyForKey:", CFSTR("requiredWatchCapabilities"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertyForKey:", CFSTR("forbiddenWatchCapabilities"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (BPSDeviceHasAllCapabilitiesForStrings(v9, v10, 0, v2))
          objc_msgSend(v12, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v12;
}

uint64_t BPSMGMaterialForPBMaterial(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 0xA && ((0x3DFu >> v2) & 1) != 0)
    return dword_2114A3498[v2];
  bps_utility_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "%@ not covered in MGEnclosure Enum", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

uint64_t BPSPBMaterialForMGMaterial(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1 - 1;
  if ((a1 - 1) < 0xA && ((0x3DFu >> v2) & 1) != 0)
    return qword_2114A34C0[v2];
  bps_utility_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "%@ not covered in MGEnclosure Enum", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

uint64_t BPSOverrideScreenType(uint64_t result)
{
  __ScreenTypeOverride = result;
  return result;
}

uint64_t BPSCurrentScreenType()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = 4;
  v1 = MGGetProductType();
  if (v1 <= 2080700390)
  {
    if (v1 <= 1169082143)
    {
      if (v1 > 502329936)
      {
        if (v1 > 910181309)
        {
          if (v1 == 910181310)
            return 5;
          if (v1 != 1060988941)
            return 1;
          return 6;
        }
        if (v1 == 502329937)
          return 3;
        v5 = 689804742;
        goto LABEL_45;
      }
      if (v1 > 337183580)
      {
        if (v1 != 337183581)
        {
          v4 = 445396642;
          goto LABEL_51;
        }
        return 2;
      }
      if (v1 == 42878382)
        return 3;
      v3 = 253148925;
LABEL_59:
      if (v1 == v3)
        return 3;
      return 1;
    }
    if (v1 <= 1434404432)
    {
      if (v1 <= 1371389548)
      {
        if (v1 == 1169082144)
          return 7;
        v2 = 1234705395;
        goto LABEL_30;
      }
      if (v1 == 1371389549)
        return v0;
      v6 = 1429914406;
    }
    else
    {
      if (v1 > 1737882205)
      {
        if (v1 == 1737882206)
          return 3;
        if (v1 == 2021146989)
          return 7;
        v2 = 2032616841;
LABEL_30:
        if (v1 != v2)
          return 1;
        return 5;
      }
      if (v1 == 1434404433)
        return 6;
      v6 = 1721691077;
    }
    if (v1 != v6)
      return 1;
    return v0;
  }
  if (v1 <= 2781508712)
  {
    if (v1 > 2309863437)
    {
      if (v1 > 2468178734)
      {
        if (v1 != 2468178735)
        {
          if (v1 != 2688879999)
          {
            v2 = 2722529672;
            goto LABEL_30;
          }
          return 8;
        }
        return 3;
      }
      if (v1 != 2309863438)
      {
        v4 = 2311900306;
        goto LABEL_51;
      }
      return 8;
    }
    if (v1 <= 2162679682)
    {
      if (v1 != 2080700391)
      {
        v4 = 2081274472;
        goto LABEL_51;
      }
      return 5;
    }
    if (v1 != 2162679683)
    {
      v4 = 2270970153;
LABEL_51:
      if (v1 == v4)
        return 2;
      return 1;
    }
    return 2;
  }
  if (v1 <= 3242623366)
  {
    if (v1 <= 3001488777)
    {
      if (v1 == 2781508713)
        return 2;
      v5 = 2940697645;
      goto LABEL_45;
    }
    if (v1 != 3001488778)
    {
      v3 = 3196805751;
      goto LABEL_59;
    }
    return 7;
  }
  if (v1 <= 3743999267)
  {
    if (v1 == 3242623367)
      return 3;
    v5 = 3585085679;
LABEL_45:
    if (v1 != v5)
      return 1;
    return 7;
  }
  if (v1 != 3743999268)
  {
    if (v1 != 3885279870)
    {
      if (v1 != 4201643249)
        return 1;
      return 8;
    }
    return 6;
  }
  return v0;
}

double BPSScreenValueGetRelevantValue(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  NSObject *v5;
  const char *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  switch(__ScreenTypeOverride)
  {
    case 0:
      v2 = BPSScreenValueGetRelevantValue__deviceHeight;
      if (!BPSScreenValueGetRelevantValue__deviceHeight)
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
        BPSScreenValueGetRelevantValue__deviceHeight = (unint64_t)v4;

        v2 = BPSScreenValueGetRelevantValue__deviceHeight;
      }
      if (v2 > 779)
      {
        if (v2 <= 843)
        {
          if (v2 == 780)
            goto LABEL_25;
          if (v2 == 812)
            goto LABEL_17;
        }
        else
        {
          switch(v2)
          {
            case 844:
              goto LABEL_10;
            case 896:
              goto LABEL_11;
            case 926:
              goto LABEL_9;
          }
        }
        goto LABEL_30;
      }
      if (v2 > 692)
      {
        if (v2 == 693)
          goto LABEL_17;
        if (v2 == 736)
          goto LABEL_28;
        goto LABEL_30;
      }
      if (v2 != 568)
      {
        if (v2 == 667)
          goto LABEL_21;
LABEL_30:
        bps_utility_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 134217984;
          v9 = BPSScreenValueGetRelevantValue__deviceHeight;
          v6 = "BPSScreenValueGetRelevantValue: %lu height not found, defaulting to 812h value";
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      return *(double *)a1;
    case 1:
      return *(double *)a1;
    case 2:
LABEL_21:
      a1 += 8;
      return *(double *)a1;
    case 3:
LABEL_28:
      a1 += 16;
      return *(double *)a1;
    case 4:
    case 9:
      goto LABEL_17;
    case 5:
LABEL_11:
      a1 += 32;
      return *(double *)a1;
    case 6:
LABEL_25:
      a1 += 40;
      return *(double *)a1;
    case 7:
LABEL_10:
      a1 += 48;
      return *(double *)a1;
    case 8:
LABEL_9:
      a1 += 56;
      return *(double *)a1;
    default:
      bps_utility_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 134217984;
        v9 = __ScreenTypeOverride;
        v6 = "BPSScreenValueGetRelevantValue: %lu height override not found, defaulting to 812h value";
LABEL_15:
        _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
      }
LABEL_16:

LABEL_17:
      a1 += 24;
      return *(double *)a1;
  }
}

id BPSPillDeselectedColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "_secondarySystemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BPSPillSelectedColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "_tertiarySystemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForceColorToDarkAppearance(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BPSPillButtonBackground(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  CGSize v6;

  v1 = a1;
  if (BPSPillButtonBackground_onceToken != -1)
    dispatch_once(&BPSPillButtonBackground_onceToken, &__block_literal_global_252);
  objc_msgSend((id)BPSPillButtonBackground_pillMapping, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6.width = 18.0;
    v6.height = 18.0;
    UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 18.0, 18.0, 8.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "set");
    objc_msgSend(v3, "fill");
    UIGraphicsGetImageFromCurrentImageContext();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stretchableImageWithLeftCapWidth:topCapHeight:", 9, 9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    objc_msgSend((id)BPSPillButtonBackground_pillMapping, "setObject:forKey:", v2, v1);

  }
  return v2;
}

double BPSPillButtonImageDesiredSize(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDF6750];
  v2 = a1;
  objc_msgSend(v1, "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setLineBreakMode:", 4);
  objc_msgSend(v4, "setAlignment:", 1);
  v13[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], 17.0, *MEMORY[0x24BDF7880]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF6628];
  v14[0] = v5;
  v14[1] = v4;
  v7 = *MEMORY[0x24BDF6600];
  v13[1] = v6;
  v13[2] = v7;
  BPSTextColor();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "sizeWithAttributes:", v9);
  v11 = v10;

  return v11 + 40.0;
}

id BPSPillButtonImageWithColors(void *a1, double a2, double a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double RelevantValue;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  float v36;
  CGFloat v37;
  CGFloat v38;
  float v39;
  float v40;
  void *v41;
  _OWORD v43[4];
  _QWORD v44[3];
  _QWORD v45[4];
  CGSize v46;

  v45[3] = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDF6750];
  v13 = a5;
  objc_msgSend(v12, "defaultParagraphStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "setLineBreakMode:", 4);
  objc_msgSend(v15, "setAlignment:", 1);
  __asm { FMOV            V1.2D, #16.0 }
  v43[0] = xmmword_2114A2340;
  v43[1] = _Q1;
  v43[2] = _Q1;
  v43[3] = _Q1;
  RelevantValue = BPSScreenValueGetRelevantValue((uint64_t)v43);
  v44[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], RelevantValue, *MEMORY[0x24BDF7880]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDF6628];
  v45[0] = v22;
  v45[1] = v15;
  v24 = *MEMORY[0x24BDF6600];
  v44[1] = v23;
  v44[2] = v24;
  v45[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v10, v25);
  else
    v26 = 0;
  v27 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v27, "setAttributedText:", v26);
  objc_msgSend(v27, "setNumberOfLines:", 0);
  objc_msgSend(v27, "setLineBreakMode:", 0);
  LODWORD(v28) = 0.5;
  objc_msgSend(v27, "_setHyphenationFactor:", v28);
  objc_msgSend(v10, "sizeWithAttributes:", v25);
  v30 = v29;
  v32 = v31;
  BPSPillButtonBackground(v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "stretchableImageWithLeftCapWidth:topCapHeight:", 8, 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v30 + 40.0;
  if (v30 + 40.0 < a2)
    v35 = a2;
  v36 = v35;
  v37 = floorf(v36);
  v38 = fmax(a3, 50.0);
  v46.width = v37;
  v46.height = v38;
  UIGraphicsBeginImageContextWithOptions(v46, 0, 0.0);
  objc_msgSend(v34, "drawInRect:", 0.0, 0.0, v37, v38);
  v39 = (v37 - v30) * 0.5;
  v40 = (v38 - v32) * 0.5;
  objc_msgSend(v10, "drawInRect:withAttributes:", v25, floorf(v39), floorf(v40), v30, v32);
  UIGraphicsGetImageFromCurrentImageContext();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v41;
}

id BPSPillButtonImageWithColor(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a1;
  BPSTextColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BPSPillButtonImageWithColors(v9, a2, a3, 0, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id BPSArchivedDevices()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global_261);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

BOOL BPSHasMigrationDevices()
{
  void *v0;
  _BOOL8 v1;

  BPSMigrationDevices();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count") != 0;

  return v1;
}

void BPSMigrateDevices(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        bps_utility_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v7;
          _os_log_impl(&dword_21147E000, v8, OS_LOG_TYPE_DEFAULT, "Consent: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BE6B4B8], "sharedMigrator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __BPSMigrateDevices_block_invoke;
        v10[3] = &unk_24CBE5228;
        v10[4] = v7;
        objc_msgSend(v9, "setMigrationConsented:forDevice:withBlock:", 1, v7, v10);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v3);
  }

}

BOOL BPSTestMultipleMigrationChoice()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("testMultipleWatchMigration"), CFSTR("com.apple.Bridge"), 0) != 0;
}

id BPSPillButtonImage(void *a1, double a2, double a3, uint64_t a4, char a5)
{
  id v8;
  void *v9;
  void *v10;

  v8 = a1;
  if ((a5 & 1) != 0)
    BPSPillSelectedColor();
  else
    BPSPillDeselectedColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BPSPillButtonImageWithColor(v8, a2, a3, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id BPSGetActivePairedDevice()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  BPSGetActiveDevice();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForProperty:", *MEMORY[0x24BE6B358]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "BOOLValue"))
    v2 = v0;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

uint64_t BPSTintedImage(void *a1, const char *a2)
{
  return objc_msgSend(a1, "imageWithTintColor:renderingMode:", a2, 1);
}

id BPSTintedSymbol(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = a2;
  objc_msgSend(v3, "systemImageNamed:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BPSScaledTintedSymbol(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  v6 = (void *)MEMORY[0x24BDF6AE0];
  v7 = a3;
  v8 = a1;
  objc_msgSend(v6, "configurationWithScale:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemImageNamed:withConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imageWithTintColor:renderingMode:", v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void _BPSRemoveSystemDeletedAppFromSpecifiers(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = a1;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___BPSRemoveSystemDeletedAppFromSpecifiers_block_invoke;
  v8[3] = &unk_24CBE5250;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v4, "removeObjectsAtIndexes:", v6);

}

BOOL BPSBundleIDIsForAppleApp(void *a1)
{
  uint64_t v1;

  objc_msgSend(a1, "rangeOfString:options:", CFSTR("com.apple."), 9);
  return v1 != 0;
}

void BPSRemoveSystemDeletedAppBundleSettingsFromSpecifiers(void *a1)
{
  _BPSRemoveSystemDeletedAppFromSpecifiers(a1, &__block_literal_global_331);
}

id BPSWatchAppBundleIDForSettingsBundleSpecifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "propertyForKey:", CFSTR("watchAppBundleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(v1, "identifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

void BPSRemoveSystemDeletedAppBundleIDsFromSpecifiers(void *a1)
{
  _BPSRemoveSystemDeletedAppFromSpecifiers(a1, &__block_literal_global_332);
}

__CFString *_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  v1 = a1;
  if (_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_onceToken != -1)
    dispatch_once(&_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_onceToken, &__block_literal_global_369);
  if (((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.NanoContactsBridgeSettingsPaired")) & 1) != 0
     || objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.NanoContactsBridgeSettingsTinker")))
    && (BPSGetActiveDevice(),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("CBF3763A-5F42-4463-B714-39903987FE90")), v4 = objc_msgSend(v2, "supportsCapability:", v3), v3, v2, (v4 & 1) != 0))
  {
    v5 = CFSTR("com.apple.NanoContacts");
  }
  else
  {
    objc_msgSend((id)_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_mapping, "objectForKey:", v1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id BPSWatchAppBundleIDForSettingsBundle(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "objectForInfoDictionaryKey:", CFSTR("watchAppBundleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(v1, "bundleIdentifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

uint64_t BPSIsNewsAllowed()
{
  void *v0;
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.news"), 0, &v9);
  v1 = v9;
  if (v1)
  {
    bps_utility_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = CFSTR("com.apple.news");
      v12 = 2112;
      v13 = v1;
      _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "Error while retrieving application record %@ with error %@", buf, 0x16u);
    }

  }
  +[BPSBridgeAppContext shared](BPSBridgeAppContext, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (BPSDeviceHasCapabilityForString(CFSTR("news-app"), v4))
  {
    objc_msgSend(v0, "applicationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isRestricted") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v0, "applicationState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isValid");

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t BPSIsWalkieTalkieAppInstalled()
{
  id v0;
  unsigned int v1;
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
  unsigned __int8 v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (BPSIsWalkieTalkieAppInstalled_onceToken != -1)
    dispatch_once(&BPSIsWalkieTalkieAppInstalled_onceToken, &__block_literal_global_491);
  v0 = (id)objc_msgSend((id)BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain, "synchronize");
  v6 = 0;
  v1 = objc_msgSend((id)BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("AppIsInstalled"), &v6);
  v2 = v1;
  if (v6)
    v3 = v1;
  else
    v3 = 1;
  bps_utility_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v8 = "BOOL BPSIsWalkieTalkieAppInstalled()";
    v9 = 1024;
    v10 = v3;
    v11 = 1024;
    v12 = v6;
    v13 = 1024;
    v14 = v2;
    _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "%s returning %d{BOOL} (keyExists=%d{BOOL} isWalkieTalkieInstalled=%d{BOOL})", buf, 0x1Eu);
  }

  return v3;
}

id getNPKDefaultsDomain()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getNPKDefaultsDomainSymbolLoc_ptr;
  v6 = getNPKDefaultsDomainSymbolLoc_ptr;
  if (!getNPKDefaultsDomainSymbolLoc_ptr)
  {
    v1 = (void *)NanoPassKitLibrary();
    v0 = (id *)dlsym(v1, "NPKDefaultsDomain");
    v4[3] = (uint64_t)v0;
    getNPKDefaultsDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
  return *v0;
}

void sub_21149E808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id BPSMappedNanoSettingsBundleIDForNanoBundleID(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[27];
  _QWORD v9[28];

  v9[27] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("com.apple.NanoMaps");
  v8[1] = CFSTR("com.apple.AppStore");
  v9[0] = CFSTR("com.apple.NanoMapsBridgeSettings");
  v9[1] = CFSTR("com.apple.BridgeAppStoreDaemonSettings");
  v8[2] = CFSTR("com.apple.NanoMusic");
  v8[3] = CFSTR("com.apple.NanoMail");
  v9[2] = CFSTR("com.apple.NanoMusicBridgeSettings");
  v9[3] = CFSTR("com.apple.NanoMailBridgeSettings");
  v8[4] = CFSTR("com.apple.NanoPassbook");
  v8[5] = CFSTR("com.apple.NanoPhotos");
  v9[4] = CFSTR("com.apple.NanoPassbookBridgeSettings");
  v9[5] = CFSTR("com.apple.NanoPhotosBridgeSettings");
  v8[6] = CFSTR("com.apple.MobileAddressBook");
  v8[7] = CFSTR("com.apple.NanoSleep.watchkitapp");
  v9[6] = CFSTR("com.apple.NanoContactsBridgeSettingsTinker");
  v9[7] = CFSTR("com.apple.NanoBedtimeBridgeSettings");
  v8[8] = CFSTR("com.apple.MobileSMS");
  v8[9] = CFSTR("com.apple.NanoAlarm");
  v9[8] = CFSTR("com.apple.MessagesBridgeSettings");
  v9[9] = CFSTR("com.apple.NanoClockBridgeSettings");
  v8[10] = CFSTR("com.apple.NanoPhone");
  v8[11] = CFSTR("com.apple.NanoCalendar");
  v9[10] = CFSTR("com.apple.PhoneBridgeSettings");
  v9[11] = CFSTR("com.apple.NanoCalendarBridgeSettings");
  v8[12] = CFSTR("com.apple.weather.watchapp");
  v8[13] = CFSTR("com.apple.stocks.watchapp");
  v9[12] = CFSTR("com.apple.weatherbridgesettings");
  v9[13] = CFSTR("com.apple.StocksBridgeSettings");
  v8[14] = CFSTR("com.apple.ActivityMonitorApp");
  v8[15] = CFSTR("com.apple.SessionTrackerApp");
  v9[14] = CFSTR("com.apple.HealthAppsSettings");
  v9[15] = CFSTR("com.apple.SessionTrackerAppSettings");
  v8[16] = CFSTR("com.apple.DeepBreathing");
  v8[17] = CFSTR("com.apple.HeartRate");
  v9[16] = CFSTR("com.apple.DeepBreathingSettings");
  v9[17] = CFSTR("com.apple.HeartRateSettings");
  v8[18] = CFSTR("com.apple.tincan");
  v8[19] = CFSTR("com.apple.Noise");
  v9[18] = CFSTR("com.apple.tincan.settings");
  v9[19] = CFSTR("com.apple.Noise.settings");
  v8[20] = CFSTR("com.apple.NanoBooks");
  v8[21] = CFSTR("com.apple.podcasts");
  v9[20] = CFSTR("com.apple.NanoBooks.BridgeSettings");
  v9[21] = CFSTR("com.apple.private.PodcastsBridgeSettings");
  v8[22] = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
  v8[23] = CFSTR("com.apple.Mind");
  v9[22] = CFSTR("com.apple.OxygenSaturationSettings");
  v9[23] = CFSTR("com.apple.MindSettings");
  v8[24] = CFSTR("com.apple.NanoTips");
  v8[25] = CFSTR("com.apple.NanoMenstrualCycles");
  v9[24] = CFSTR("com.apple.NanoTipsBridgeSettings");
  v9[25] = CFSTR("com.apple.NanoMenstrualCyclesCompanionSettings");
  v8[26] = CFSTR("com.apple.Depth");
  v9[26] = CFSTR("com.apple.DepthCompanionSettings");
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v9, v8, 27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v2;
  v6 = v4;

  return v6;
}

uint64_t BPSShouldOfferSiriForDeviceLanguage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  NSObject *v13;
  const char *v14;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  _BYTE buf[24];
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  +[BPSBridgeAppContext shared](BPSBridgeAppContext, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B3E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B3F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  if (v5)
  {
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v17 = 0;
      v8 = objc_msgSend(getAFConnectionClass(), "siriIsSupportedForLanguageCode:productName:productVersion:error:", v7, v2, v3, &v17);
      v9 = v17;
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    bps_utility_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      v23 = v3;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v8;
      HIWORD(v24) = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v9;
      v14 = "siriLanguageCode: %@, watchProductName %@, watchProductVersion %@; shouldOfferSiri: %d, phoneError: %@; watchError: %@";
LABEL_18:
      _os_log_impl(&dword_21147E000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x3Au);
    }
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v11 = (uint64_t (*)(uint64_t))get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr;
    v21 = get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr;
    if (!get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __get_VSCopyLanguageIdentifierForLocaleSymbolLoc_block_invoke;
      v23 = &unk_24CBE4A00;
      v24 = &v18;
      __get_VSCopyLanguageIdentifierForLocaleSymbolLoc_block_invoke((uint64_t)buf);
      v11 = (uint64_t (*)(uint64_t))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v11)
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
    v7 = (void *)v11(v10);
    if (v7)
    {
      objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isCurrentLocaleNativelySupported"))
      {
        v16 = 0;
        v8 = objc_msgSend(getAFConnectionClass(), "siriIsSupportedForLanguageCode:productName:productVersion:error:", v7, v2, v3, &v16);
        v9 = v16;
      }
      else
      {
        v9 = 0;
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    bps_utility_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      v23 = v3;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v8;
      HIWORD(v24) = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v9;
      v14 = "phoneLanguageCode: %@, watchProductName %@, watchProductVersion %@; shouldOfferSiri: %d, phoneError: %@; watchError: %@";
      goto LABEL_18;
    }
  }

  return v8;
}

void sub_21149EF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_24CBE4A00;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21149EFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFConnectionClass_softClass;
  v7 = getAFConnectionClass_softClass;
  if (!getAFConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFConnectionClass_block_invoke;
    v3[3] = &unk_24CBE4A00;
    v3[4] = &v4;
    __getAFConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21149F0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BPSDefaultTitleTextAttributes()
{
  if (BPSDefaultTitleTextAttributes_onceToken != -1)
    dispatch_once(&BPSDefaultTitleTextAttributes_onceToken, &__block_literal_global_509);
  return (id)BPSDefaultTitleTextAttributes_sDefaultTitleTextAttributes;
}

id BPSDefaultDetailTextAttributes()
{
  if (BPSDefaultDetailTextAttributes_onceToken != -1)
    dispatch_once(&BPSDefaultDetailTextAttributes_onceToken, &__block_literal_global_511);
  return (id)BPSDefaultDetailTextAttributes_sDefaultDetailTextAttributes;
}

void BPSOpenSensitiveURLAsync(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSensitive:", 1);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __BPSOpenSensitiveURLAsync_block_invoke;
  v5[3] = &unk_24CBE5428;
  v6 = v1;
  v4 = v1;
  objc_msgSend(v3, "openURL:configuration:completionHandler:", v4, v2, v5);

}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFPreferencesClass_block_invoke_cold_1();
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AssistantServicesLibrary()
{
  void *v0;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAFConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFConnectionClass_block_invoke_cold_1();
  getAFConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getNSSManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getFAProfilePictureStoreClass_block_invoke_cold_1(v0);
}

void __getFAProfilePictureStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

void __getPKPassLibraryClass_block_invoke_cold_1()
{
  abort_report_np();
  __getNPKCompanionAgentConnectionClass_block_invoke_cold_1();
}

void __getNPKCompanionAgentConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1(v0);
}

void __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1()
{
  abort_report_np();
  __getNanoResourceGrabberClass_block_invoke_cold_1();
}

void __getNanoResourceGrabberClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFPreferencesClass_block_invoke_cold_1(v0);
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFConnectionClass_block_invoke_cold_1(v0);
}

void __getAFConnectionClass_block_invoke_cold_1()
{
  CATransform3D *v0;
  CATransform3D *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;

  v0 = (CATransform3D *)abort_report_np();
  CATransform3DScale(v1, v0, v2, v3, v4);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE108](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x24BE67100]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t NRDeviceSizeForArtworkDeviceSubType()
{
  return MEMORY[0x24BE6B408]();
}

uint64_t NRDeviceSizeForProductType()
{
  return MEMORY[0x24BE6B410]();
}

uint64_t NRRawVersionFromString()
{
  return MEMORY[0x24BE6B480]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x24BE6B488]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x24BE6B498]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t PBAdvertisingInfoFromPayload()
{
  return MEMORY[0x24BE6E4A8]();
}

uint64_t PBIsInternalInstall()
{
  return MEMORY[0x24BE6E4D0]();
}

uint64_t PSIsInternalInstall()
{
  return MEMORY[0x24BE75AF8]();
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x24BE75C68]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BDF7CC8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BDF7CF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t pbb_accountsignin_log()
{
  return MEMORY[0x24BE6E4D8]();
}

uint64_t pbb_bridge_log()
{
  return MEMORY[0x24BE6E4E0]();
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

