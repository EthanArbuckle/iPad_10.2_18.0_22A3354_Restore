@implementation HUMediaAccountUtilities

+ (BOOL)isMusicAppInstalled
{
  return ICSystemApplicationIsInstalled();
}

+ (id)isAppleMusicSubscriptionAvailable
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", &__block_literal_global_10);
}

void __60__HUMediaAccountUtilities_isAppleMusicSubscriptionAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CD8008]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HUMediaAccountUtilities_isAppleMusicSubscriptionAvailable__block_invoke_2;
  v5[3] = &unk_1E6F4CEE8;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "requestCapabilitiesWithCompletionHandler:", v5);

}

void __60__HUMediaAccountUtilities_isAppleMusicSubscriptionAvailable__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E7040498, CFSTR("HOMediaPickerUnavailableReasonKey"));
    v6 = CFSTR("HUMediaPickerUnavailableReasonStoreKitErrorObjectKey");
    v7 = v5;
    v8 = v9;
LABEL_5:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
    goto LABEL_6;
  }
  if ((a2 & 1) == 0)
  {
    v8 = &unk_1E70404B0;
    v6 = CFSTR("HOMediaPickerUnavailableReasonKey");
    v7 = v5;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);

}

+ (id)reasonForMediaPickerNotAvailable:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("HUTriggerMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("HUTriggerMediaPickerUnavailableMusicAppUninstalledPromptMessage");
}

+ (id)musicAppURL
{
  void *v2;
  void *v3;

  ICBundleIdentifierForSystemApplicationType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_appStoreURLForBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultCurrentVolumeForMediaProfiles:(id)a3
{
  id v3;
  float *v4;
  float v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  float *v10;
  uint64_t v11;
  int v12;

  v3 = a3;
  v9 = 0;
  v10 = (float *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HUMediaAccountUtilities_defaultCurrentVolumeForMediaProfiles___block_invoke;
  v8[3] = &unk_1E6F4CF10;
  v8[4] = &v9;
  objc_msgSend(v3, "na_each:", v8);
  v4 = v10;
  v5 = v10[6];
  if (fabsf(v5) < 0.00000011921)
  {
    v10[6] = 0.5;
    v5 = 0.5;
  }
  v4[6] = fminf(fmaxf(v5 * 100.0, 0.0), 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return v6;
}

float __64__HUMediaAccountUtilities_defaultCurrentVolumeForMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  uint64_t v7;
  float result;

  objc_msgSend(a2, "mediaSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  v6 = v5;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = fmaxf(*(float *)(v7 + 24), v6);
  *(float *)(v7 + 24) = result;
  return result;
}

+ (id)determineMediaPickerAvailabilityForHomePodProfiles:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  SEL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  SEL v38;
  _QWORD v39[3];
  const __CFString *v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  const __CFString *v48;
  _QWORD v49[4];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && (v9 = objc_msgSend(v7, "count"), v8) && v9)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "+[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:inHome:]";
      v44 = 2112;
      v45 = v7;
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%s HomePodMediaProfiles %@ Home %@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionPickerButton"), CFSTR("HUMediaSelectionPickerButton"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D18]);

    if (+[HUMediaAccountUtilities isMusicAppInstalled](HUMediaAccountUtilities, "isMusicAppInstalled"))
    {
      +[HUMediaAccountUtilities isAppleMusicSubscriptionAvailable](HUMediaAccountUtilities, "isAppleMusicSubscriptionAvailable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D519C0];
      v40 = CFSTR("HOMediaSelectionPickingForExternalPlayerKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "futureWithResult:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v43 = (const char *)a1;
        v44 = 2112;
        v45 = v19;
        v46 = 2112;
        v47 = v7;
        _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ homePodMediaProfiles [%@]", buf, 0x20u);

      }
      v20 = (void *)MEMORY[0x1E0D519C0];
      v21 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke;
      v34[3] = &unk_1E6F4CFC8;
      v35 = v7;
      v37 = a1;
      v38 = a2;
      v36 = v8;
      objc_msgSend(v20, "futureWithBlock:", v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D519C0];
      v39[0] = v13;
      v39[1] = v17;
      v39[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "combineAllFutures:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v21;
      v31[1] = 3221225472;
      v31[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_5;
      v31[3] = &unk_1E6F4CFF0;
      v11 = v11;
      v32 = v11;
      v33 = a2;
      objc_msgSend(v25, "flatMap:", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E70404C8, CFSTR("HOMediaPickerUnavailableReasonKey"));
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    HFLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "+[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:inHome:]";
      _os_log_error_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_ERROR, "%s Either the parameter mediaprofile or Home is nil", buf, 0xCu);
    }

    v28 = (void *)MEMORY[0x1E0D519C0];
    v48 = CFSTR("Error");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v49[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "futureWithResult:", v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  int v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t v44;
  char v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  const __CFString *v62;
  _QWORD v63[4];

  v63[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_activeiTunesAccount");
  v5 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)v5;
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v35 = v3;
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = v7;
      v54 = 2112;
      v55 = v8;
      v56 = 2112;
      v57 = v38;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ iTunes Account [%@]", buf, 0x20u);

    }
    v9 = objc_msgSend(*(id *)(a1 + 40), "isMultiUserEnabled");
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = v11;
      v54 = 2112;
      v55 = v12;
      v56 = 1024;
      LODWORD(v57) = v9;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ isMultiUserEnabled [%d]", buf, 0x1Cu);

    }
    if (v9)
    {
      v13 = objc_alloc(MEMORY[0x1E0D31988]);
      v14 = *(void **)(a1 + 40);
      objc_msgSend(v14, "currentUser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithHome:user:nameStyle:", v14, v15, 0);
      v37 = objc_msgSend(v16, "isIdentifyVoiceEnabled");

    }
    else
    {
      v37 = 0;
    }
    v36 = v9;
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "hf_displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentUser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v53 = v19;
      v54 = 2112;
      v55 = v20;
      v56 = 2112;
      v57 = v21;
      v58 = 2112;
      v59 = v23;
      v60 = 1024;
      v61 = v37;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ home [%@] currentUser [%@] vrEnabled [%d]", buf, 0x30u);

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v24 = a1;
    v25 = *(id *)(a1 + 32);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v31 = (void *)MEMORY[0x1E0D519C0];
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_34;
          v41[3] = &unk_1E6F4CF60;
          v45 = v36;
          v46 = v37;
          v42 = *(id *)(v24 + 40);
          v43 = v38;
          v44 = v30;
          objc_msgSend(v31, "futureWithBlock:", v41);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v32);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v27);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_3;
    v39[3] = &unk_1E6F4C708;
    v3 = v35;
    v40 = v35;
    v34 = (id)objc_msgSend(v33, "addCompletionBlock:", v39);

  }
  else
  {
    v62 = CFSTR("HOMediaSelectionShowLibraryContentKey");
    v63[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v17);
  }

}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(a1 + 57))
  {
    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_2;
    v10[3] = &unk_1E6F4CF38;
    v11 = v3;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v4, "getHomeMediaAccountForHome:withCompletion:", v5, v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "hf_appleMusicCurrentLoggedInAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "hasSameAppleMusicServiceAltDSID:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v9);

  }
}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "hasSameAppleMusicServiceAltDSID:", a2));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "na_all:", &__block_literal_global_38);
  v4 = *(void **)(a1 + 32);
  v7 = CFSTR("HOMediaSelectionShowLibraryContentKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v6);

}

uint64_t __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

id __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
          objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@ mediaPicker result [%@]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
