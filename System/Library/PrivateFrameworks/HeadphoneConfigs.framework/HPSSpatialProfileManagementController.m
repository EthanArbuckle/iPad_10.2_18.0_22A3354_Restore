@implementation HPSSpatialProfileManagementController

- (HPSSpatialProfileManagementController)init
{
  HPSSpatialProfileManagementController *v2;
  void *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  NSString *downloadAssetPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileManagementController;
  v2 = -[HPSSpatialProfileManagementController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_spatialAudioProfileUpdateHandler_, CFSTR("HPSSpatialAudioProfileUpdated"), 0);

    v2->_spatialProfileAssetState = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v4;

    downloadAssetPath = v2->_downloadAssetPath;
    v2->_downloadAssetPath = 0;

  }
  return v2;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  objc_super v48;
  uint64_t v49;
  _QWORD v50[2];
  NSRange v51;

  v50[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("HPSSpatialAudioProfileTapped"), 0);

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v48.receiver = self;
  v48.super_class = (Class)HPSSpatialProfileManagementController;
  -[HPSSpatialProfileManagementController specifiers](&v48, sel_specifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SP_TOP_GROUP_ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SP_MGMT_GROUP_ID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HPSSpatialProfileManager isProfileExisting](HPSSpatialProfileManager, "isProfileExisting"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_WHAT_ENROLLED_INFO"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v46 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_DETAIL_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0D804E8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_RESET"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, 0, 13, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setButtonAction:", sel_promptResetProfile_);
    v8 = v46;
    objc_msgSend(v18, "setProperty:forKey:", CFSTR("SPATIAL_AUDIO_PROFILE_RESET"), *MEMORY[0x1E0D80868]);
  }
  else
  {
    v19 = +[HPSSpatialProfileManager isSettingsEnrollmentSupported](HPSSpatialProfileManager, "isSettingsEnrollmentSupported");
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v19)
    {
      v47 = v8;
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_WHAT_INFO"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_DETAIL_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v23, v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_CREATE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, 0, 0, 13, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (_os_feature_enabled_impl())
      {
        v29 = objc_alloc(MEMORY[0x1E0C99E08]);
        v49 = *MEMORY[0x1E0D80780];
        v50[0] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithDictionary:", v30);

        objc_msgSend(v18, "setProperties:", v31);
        objc_msgSend(v18, "setButtonAction:", sel_startAssetDownloadAndPresentEnrollmentController_);

      }
      else
      {
        objc_msgSend(v18, "setButtonAction:", sel_presentProfileEnrollmentController_);
      }
      v8 = v47;
    }
    else
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_USER_INFO"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_DETAIL_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v32, v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = 0;
    }
  }
  objc_msgSend(v7, "setProperty:forKey:", v14, *MEMORY[0x1E0D80848]);
  v35 = (objc_class *)objc_opt_class();
  NSStringFromClass(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v36, *MEMORY[0x1E0D80818]);

  objc_msgSend(v7, "setProperty:forKey:", v14, *MEMORY[0x1E0D80838]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_DETAIL_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51.location = objc_msgSend(v14, "rangeOfString:", v38);
  NSStringFromRange(v51);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v39, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v40, *MEMORY[0x1E0D80830]);

  objc_msgSend(v7, "setProperty:forKey:", CFSTR("userDidTapSpatialProfilePrivacyLink:"), *MEMORY[0x1E0D80820]);
  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(v6, "addObject:", v8);
  if (v18)
    objc_msgSend(v6, "addObject:", v18);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v41 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v42 = (int)*MEMORY[0x1E0D80590];
  v43 = *(Class *)((char *)&self->super.super.super.super.super.isa + v42);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v42) = v41;

  v44 = *(id *)((char *)&self->super.super.super.super.super.isa + v42);
  return v44;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v15;
    objc_msgSend(v7, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 0);

    objc_msgSend(v7, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    objc_msgSend(v7, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("SPATIAL_AUDIO_PROFILE_RESET"));

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v13);

    }
    v6 = v15;
  }

}

- (void)spatialAudioProfileUpdateHandler:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HPSSpatialProfileManagementController_spatialAudioProfileUpdateHandler___block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __74__HPSSpatialProfileManagementController_spatialAudioProfileUpdateHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)resetProfile:(id)a3
{
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Reset Profile", buf, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0D03420]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HPSSpatialProfileManagementController_resetProfile___block_invoke;
  v6[3] = &unk_1EA29A6B0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "deleteSoundProfileRecordWithCompletion:", v6);

}

void __54__HPSSpatialProfileManagementController_resetProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HPSSpatialProfileAnalytics *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = (HPSSpatialProfileAnalytics *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
      __54__HPSSpatialProfileManagementController_resetProfile___block_invoke_cold_1((uint64_t)v3, &v4->super);
  }
  else
  {
    v4 = objc_alloc_init(HPSSpatialProfileAnalytics);
    -[HPSSpatialProfileAnalytics submitHPSSpatialProfileResetAnalytics](v4, "submitHPSSpatialProfileResetAnalytics");
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Profile Reset Completed", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("HPSSpatialAudioProfileUpdated"), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)promptResetProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  HPSSpatialProfileManagementController *v25;
  id v26;
  uint8_t buf[16];

  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Prompt Reset", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RESET_SPATIAL_AUDIO_PROFILE_PROMPT_HEAD"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RESET_SPATIAL_AUDIO_PROFILE_PROMPT_CONTENT"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RESET_SPATIAL_AUDIO_PROFILE_CONFIRM"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __60__HPSSpatialProfileManagementController_promptResetProfile___block_invoke;
  v24 = &unk_1EA29AC60;
  v25 = self;
  v26 = v4;
  v15 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v21, v22, v23, v24, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("RESET_SPATIAL_AUDIO_PROFILE_CANCEL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v16);
  objc_msgSend(v11, "addAction:", v20);
  -[HPSSpatialProfileManagementController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __60__HPSSpatialProfileManagementController_promptResetProfile___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Reset Sound Profile", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "resetProfile:", *(_QWORD *)(a1 + 40));
}

- (void)userDidTapSpatialProfilePrivacyLink:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.spatialAudioProfiles"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)cancelEnrollment
{
  -[HPSSpatialProfileManagementController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_5);
}

- (void)startAssetDownloadAndPresentEnrollmentController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  self->_spatialProfileAssetState = 1;
  -[HPSSpatialProfileManagementController spatialAudioProfileUpdateHandler:](self, "spatialAudioProfileUpdateHandler:", 0);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28718]), "initWithCameraSession:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__HPSSpatialProfileManagementController_startAssetDownloadAndPresentEnrollmentController___block_invoke;
  v7[3] = &unk_1EA29ACA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "downloadHRTFAssetV2:withCompletion:", 0, v7);

}

uint64_t __90__HPSSpatialProfileManagementController_startAssetDownloadAndPresentEnrollmentController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDownloadHRTFAsset:isDownloaded:path:error:downloadResult:", *(_QWORD *)(a1 + 40), a2, a3, a4, a5);
}

- (void)_processDownloadHRTFAsset:(id)a3 isDownloaded:(BOOL)a4 path:(id)a5 error:(id)a6 downloadResult:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HPSSpatialProfileManagementController *v20;
  id v21;
  id v22;
  unint64_t v23;
  BOOL v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__HPSSpatialProfileManagementController__processDownloadHRTFAsset_isDownloaded_path_error_downloadResult___block_invoke;
  v18[3] = &unk_1EA29ACF0;
  v19 = v12;
  v20 = self;
  v24 = a4;
  v21 = v13;
  v22 = v14;
  v23 = a7;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void __106__HPSSpatialProfileManagementController__processDownloadHRTFAsset_isDownloaded_path_error_downloadResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _DWORD v27[2];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  objc_msgSend(*(id *)(a1 + 40), "spatialAudioProfileUpdateHandler:", 0);
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64) - 1;
    if (v6 > 3)
      v7 = "Unknown";
    else
      v7 = off_1EA29AD10[v6];
    v27[0] = 67109890;
    v27[1] = v3;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v4;
    v32 = 2080;
    v33 = v7;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "HRTF Asset Download: downloadHRTFAsset isDownloaded %d, path %@ error %@ result %s", (uint8_t *)v27, 0x26u);
  }

  if (*(_BYTE *)(a1 + 72))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1392), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "presentProfileEnrollmentController:", *(_QWORD *)(a1 + 32));
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1376) = 3;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1376) = 2;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_ASSET_DOWNLOAD_FAIL_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_ASSET_DOWNLOAD_FAIL_MESSAGE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    switch(*(_QWORD *)(a1 + 64))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("DOWNLOAD_FAIL_MESSAGE_NOT_CONNCTED_TO_INTERNET");
        goto LABEL_14;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("DOWNLOAD_FAIL_MESSAGE_CANCELLED");
        goto LABEL_12;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("DOWNLOAD_FAIL_MESSAGE_NO_SPACE_LEFT");
LABEL_12:
        objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
        v20 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = CFSTR("TRY_AGAIN");
        goto LABEL_15;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("DOWNLOAD_FAIL_MESSAGE_TIMED_OUT");
LABEL_14:
        objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
        v20 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = CFSTR("OK");
LABEL_15:
        objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
        v24 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v20;

        v13 = (void *)v24;
        break;
      default:
        break;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 0, &__block_literal_global_93);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v26);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v25, 1, 0);
  }
}

- (void)presentProfileEnrollmentController:(id)a3
{
  void *v4;
  void *v5;
  HPSSpatialProfileNavigationController *v6;
  HPSSpatialProfileSingeStepEnrollmentController *v7;

  if (_os_feature_enabled_impl())
  {
    v7 = objc_alloc_init(HPSSpatialProfileSingeStepEnrollmentController);
    -[HPSSpatialProfileSingeStepEnrollmentController setDownloadAssetPath:](v7, "setDownloadAssetPath:", self->_downloadAssetPath);
  }
  else
  {
    v7 = objc_alloc_init(HPSSpatialProfileEnrollmentController);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelEnrollment);
  -[HPSSpatialProfileSingeStepEnrollmentController navigationItem](v7, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  v6 = -[HPSSpatialProfileNavigationController initWithRootViewController:]([HPSSpatialProfileNavigationController alloc], "initWithRootViewController:", v7);
  -[HPSSpatialProfileNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
  -[HPSSpatialProfileNavigationController setModalInPresentation:](v6, "setModalInPresentation:", 1);
  -[HPSSpatialProfileManagementController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  UIActivityIndicatorView *spinner;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileManagementController;
  -[HPSSpatialProfileManagementController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 13)
  {
    v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      objc_msgSend(v5, "setAccessoryView:", self->_spinner);
      spinner = self->_spinner;
      if (self->_spatialProfileAssetState == 1)
        -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
      else
        -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadAssetPath, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

void __54__HPSSpatialProfileManagementController_resetProfile___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: Cannot Reset Profile, Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
