@implementation HFServiceLikeItemResultFactory

+ (id)populateStandardResultsForHomeKitObject:(id)a3 withBackingAccessory:(id)a4 displayMetadata:(id)a5 readResponse:(id)a6 batteryLevelResults:(id)a7 valueSource:(id)a8 updateOptions:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  HFSymptomResultContextProvider *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v64;
  void *v65;
  id v66;
  id v67;
  HFSymptomResultContextProvider *v68;
  void *v70;
  id v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v72 = a6;
  v17 = a7;
  v71 = a8;
  v18 = a9;
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "primaryState"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("state"));

  if (objc_msgSend(v16, "transitioningPrimaryState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "transitioningPrimaryState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("transitioningState"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "priority"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22);

  objc_msgSend(v16, "sortKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_safeSetObject:forKey:", v23, CFSTR("sortKey"));

  v70 = v18;
  objc_msgSend(v18, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "BOOLValue") & 1) != 0)
  {

    goto LABEL_26;
  }
  v25 = +[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo");

  if (!v25)
  {
    v26 = (void *)objc_opt_new();
    v27 = [HFSymptomResultContextProvider alloc];
    objc_opt_class();
    v67 = v14;
    v28 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;
    v66 = v28;

    v68 = -[HFSymptomResultContextProvider initWithAccessory:mediaSystem:](v27, "initWithAccessory:mediaSystem:", v15, v30);
    objc_msgSend(v16, "error");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v16, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v32, CFSTR("underlyingError"));

      objc_msgSend(v16, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFErrorResultComponent componentForDisplayError:symptomContextProvider:](HFErrorResultComponent, "componentForDisplayError:symptomContextProvider:", v33, v68);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        HFLogForCategory(0x29uLL);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "error");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "allFailedReadResponses");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v74 = v65;
          v75 = 2112;
          v76 = v34;
          v77 = 2112;
          v78 = v28;
          v79 = 2112;
          v80 = v64;
          _os_log_error_impl(&dword_1DD34E000, v35, OS_LOG_TYPE_ERROR, "Displaying error %@ as %@ for %@ read errors %@", buf, 0x2Au);

        }
        objc_msgSend(v26, "addObject:", v34);
      }

    }
    objc_msgSend(v72, "allCharacteristics", v64);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFErrorResultComponent componentForWriteErrorForCharacteristics:valueSource:](HFErrorResultComponent, "componentForWriteErrorForCharacteristics:valueSource:", v36, v71);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_safeAddObject:", v37);

    +[HFErrorResultComponent componentForAccessoryReprovisionState:](HFErrorResultComponent, "componentForAccessoryReprovisionState:", objc_msgSend(v15, "accessoryReprovisionState"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_safeAddObject:", v38);

    if (objc_msgSend(v26, "count"))
    {
      +[HFItemResultComponent combinedResultsForComponents:](HFErrorResultComponent, "combinedResultsForComponents:", v26);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addEntriesFromDictionary:", v39);

    }
    objc_msgSend(v70, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "BOOLValue"))
    {

      v14 = v67;
    }
    else
    {
      objc_msgSend(v16, "error");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "underlyingError");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "na_isCancelledError");

      v14 = v67;
      if (!v43)
      {
LABEL_21:
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("errorDescription"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "na_safeSetObject:forKey:", v44, CFSTR("description"));

        if (objc_msgSend(v26, "count"))
        {
          HFLogForCategory(0x29uLL);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v74 = v66;
            v75 = 2112;
            v76 = v19;
            _os_log_error_impl(&dword_1DD34E000, v45, OS_LOG_TYPE_ERROR, "Added HFErrorResultComponent to results for object %@: %@", buf, 0x16u);
          }

        }
        goto LABEL_26;
      }
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("readsSkipped"));
    goto LABEL_21;
  }
LABEL_26:
  if (objc_msgSend(v16, "primaryState"))
    goto LABEL_32;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    goto LABEL_28;
  if (!+[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionUpdating"), CFSTR("HFServiceDescriptionUpdating"), 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v47, CFSTR("description"));

    if (objc_msgSend(v15, "hf_isSuspended"))
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicValuePowerStateOff"), CFSTR("HFCharacteristicValuePowerStateOff"), 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v46, CFSTR("description"));
LABEL_28:

    }
  }
LABEL_32:
  objc_msgSend(v72, "allCharacteristics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "mutableCopy");

  objc_msgSend(v15, "hf_softwareUpdateDependentObjects");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "unionSet:", v50);

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "unionSet:", v51);

  if (objc_msgSend(v49, "count"))
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v49, CFSTR("dependentHomeKitObjects"));
  if (objc_msgSend(v15, "supportsSoftwareUpdateV2"))
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasSoftwareUpdateV2Dependency"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("batteryLow"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "BOOLValue"))
  {
    v53 = +[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo");

    if (!v53)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("longErrorDescription"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
      {
        _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionBatteryLow"), CFSTR("HFServiceDescriptionBatteryLow"), 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v55, CFSTR("longErrorDescription"));

      }
      objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA7CC670, CFSTR("badge"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA7CC688, CFSTR("descriptionBadge"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("lowBattery"));
      objc_msgSend(v19, "hf_setMinimumDisplayPriority:", 1);
    }
  }
  else
  {

  }
  if (objc_msgSend(v15, "certificationStatus") == 1
    && !+[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceLongFormPersistentWarningHomeKitUncertified"), CFSTR("HFServiceLongFormPersistentWarningHomeKitUncertified"), 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v56, CFSTR("persistentWarningDescription"));

  }
  objc_msgSend(a1, "_appendSoftwareUpdateResultsForAccessory:toResults:", v15, v19);
  objc_msgSend(a1, "_appendDestinationURLResultsForHomeKitObject:backingAccessory:toResults:", v14, v15, v19);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "supportsIdentify"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v57, CFSTR("isIdentifiable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "suspendedState"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v58, CFSTR("suspendedState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "hf_canSyncExternalSettings") ^ 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v59, CFSTR("externalSettingIsDisabled"));

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("priority"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61 > 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v62, CFSTR("descriptionStyle"));

  return v19;
}

+ (void)_appendSoftwareUpdateResultsForAccessory:(id)a3 toResults:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __CFString *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  if (!objc_msgSend(v13, "isFirmwareUpdateAvailable"))
  {
    objc_msgSend(v13, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hf_currentUserIsOwner"))
    {
      v10 = objc_msgSend(v13, "hf_softwareUpdatePossessesNecessaryDocumentation");

      if (!v10)
        goto LABEL_17;
      if (objc_msgSend(v13, "hf_isReadyToInstallSoftwareUpdate")
        && objc_msgSend(v13, "isControllable"))
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CC6A0, CFSTR("badge"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CC670, CFSTR("descriptionBadge"));
        _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDetailedControlDescriptionSoftwareUpdateAvailable"), CFSTR("HFServiceDetailedControlDescriptionSoftwareUpdateAvailable"), 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("detailedControlDescription"));

      }
      if (objc_msgSend(v13, "hf_isInstallingSoftwareUpdate"))
      {
        v12 = CFSTR("HFFirmwareUpdateInstallingDescription");
      }
      else
      {
        if (!objc_msgSend(v13, "hf_isDownloadingSoftwareUpdate"))
          goto LABEL_17;
        v12 = CFSTR("HFFirmwareUpdateDownloadingDescription");
      }
      _HFLocalizedStringWithDefaultValue(v12, v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_17;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("description"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("detailedControlDescription"));
    }

    goto LABEL_17;
  }
  if (!_os_feature_enabled_impl()
    || (objc_msgSend(v13, "home"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest"),
        v6,
        (v7 & 1) == 0))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDetailedControlDescriptionFirmwareUpdateAvailable"), CFSTR("HFServiceDetailedControlDescriptionFirmwareUpdateAvailable"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("detailedControlDescription"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CC6A0, CFSTR("badge"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CC670, CFSTR("descriptionBadge"));
  }
LABEL_17:

}

+ (void)_appendDestinationURLResultsForHomeKitObject:(id)a3 backingAccessory:(id)a4 toResults:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a5;
  objc_msgSend(a4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 4;
      goto LABEL_7;
    }
    v9 = 5;
  }
  objc_msgSend(v13, "uniqueIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v10;
LABEL_7:
  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:", v9, 2, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("alternateQuickControlURL"));

  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:", v9, 1, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("itemDetailsURL"));

}

@end
