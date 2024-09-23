@implementation HFCameraItem

id __44__HFCameraItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString **v20;
  __CFString *v21;
  HFCAPackageIconDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "currentAccessMode"))
  {
    objc_msgSend(WeakRetained, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isReachable");

    if (v10)
      v11 = 2;
    else
      v11 = 1;
  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12);

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "profile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObjects:", v15, v16, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("dependentHomeKitObjects"));

  v20 = &HFCAPackageStateOn;
  if (v11 != 2)
    v20 = &HFCAPackageStateOff;
  v21 = *v20;
  v22 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", CFSTR("HFCAPackageIconIdentifierIPCamera"), v21);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("icon"));

  objc_msgSend(WeakRetained, "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "snapshotControl");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mostRecentSnapshot");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("HFResultCameraSnapshotKey"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "profile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "streamControl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "streamState"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("HFResultCameraStreamStateKey"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "profile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "userSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v32, "currentAccessMode"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("HFResultCameraCurrentAccessModeKey"));

  objc_msgSend(WeakRetained, "profile");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "streamControl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "cameraStream");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("HFResultCameraStreamKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v36, "audioStreamSetting"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("HFResultCameraAudioStreamSettingKey"));

  }
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    objc_msgSend(WeakRetained, "accessory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFDemoModeAccessoryManager demoSnapshotURLForCameraName:](HFDemoModeAccessoryManager, "demoSnapshotURLForCameraName:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "accessory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFDemoModeAccessoryManager demoLiveStreamURLForCameraName:](HFDemoModeAccessoryManager, "demoLiveStreamURLForCameraName:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("HFResultCameraDemoSnapshotURLKey"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("HFResultCameraDemoLiveStreamURLKey"));
    HFLogForCategory(0x20uLL);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v40;
      v63 = 2112;
      v64 = v43;
      _os_log_impl(&dword_1DD34E000, v44, OS_LOG_TYPE_DEFAULT, "Snapshot:%@ and movie:%@", buf, 0x16u);
    }

  }
  if (+[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
    v45 = &unk_1EA7CD198;
    v46 = v5;
    v47 = CFSTR("state");
LABEL_18:
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, v47);
    goto LABEL_23;
  }
  objc_msgSend(WeakRetained, "profile");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "userSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = +[HFCameraItem shouldIgnoreStreamErrorForCameraSettings:](HFCameraItem, "shouldIgnoreStreamErrorForCameraSettings:", v49);

  if (v50)
  {
    v47 = CFSTR("persistentWarningDescription");
    v46 = v5;
    v45 = 0;
    goto LABEL_18;
  }
  objc_msgSend(WeakRetained, "profile");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "hf_cameraManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "cachedStreamError");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53 && objc_msgSend(v53, "code") != 23)
  {
    v59 = 0;
    v60 = 0;
    objc_msgSend((id)objc_opt_class(), "getErrorDescription:detailedErrorDescription:forCameraStreamError:", &v60, &v59, v53);
    v54 = v60;
    v55 = v59;
    v56 = v54;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("errorDescription"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("longErrorDescription"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CD1B0, CFSTR("badge"));
  }

LABEL_23:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

+ (BOOL)shouldIgnoreStreamErrorForCameraSettings:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "currentAccessMode"))
    v4 = objc_msgSend(v3, "currentAccessMode") == 3;
  else
    v4 = 1;

  return v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryProfileItem profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItem latestResults](self, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@>"), v5, self, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (_MergedGlobals_306 != -1)
      dispatch_once(&_MergedGlobals_306, &__block_literal_global_15_14);
    v9 = (id)qword_1ED379BC8;
  }
  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  objc_super v20;
  const __CFString *v21;
  uint64_t v22;
  _BYTE location[12];
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessoryProfileItem profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HFAccessoryProfileItem valueSource](self, "valueSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_initWeak((id *)location, self);
      v20.receiver = self;
      v20.super_class = (Class)HFCameraItem;
      -[HFAccessoryProfileItem _subclass_updateWithOptions:](&v20, sel__subclass_updateWithOptions_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __44__HFCameraItem__subclass_updateWithOptions___block_invoke;
      v18[3] = &unk_1EA72AF60;
      objc_copyWeak(&v19, (id *)location);
      objc_msgSend(v8, "flatMap:", v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v19);

      objc_destroyWeak((id *)location);
      goto LABEL_8;
    }
  }
  else
  {

  }
  HFLogForCategory(0xEuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HFAccessoryProfileItem profile](self, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryProfileItem valueSource](self, "valueSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Camera Item: Missing profile accessory:%@ or value source:%@", location, 0x16u);

  }
  v14 = (void *)MEMORY[0x1E0D519C0];
  v21 = CFSTR("hidden");
  v22 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "futureWithResult:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

void __27__HFCameraItem_description__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED379BC8;
  qword_1ED379BC8 = (uint64_t)&stru_1EA741FF8;

}

+ (void)getErrorDescription:(id *)a3 detailedErrorDescription:(id *)a4 forCameraStreamError:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a5;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraErrorNotReachable"), CFSTR("HFCameraErrorNotReachable"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraLongFormErrorNotReachable"), CFSTR("HFCameraLongFormErrorNotReachable"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (v10 && objc_msgSend(v13, "code") == 14)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraErrorBusy"), CFSTR("HFCameraErrorBusy"), 1);
    v11 = objc_claimAutoreleasedReturnValue();

    _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraLongFormErrorBusy"), CFSTR("HFCameraLongFormErrorBusy"), 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
    v8 = (void *)v12;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v8);

}

+ (BOOL)cameraContainsMotionServiceItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v4, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_31_7);

  if (v6)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

uint64_t __48__HFCameraItem_cameraContainsMotionServiceItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isCameraContainedMotionSensor");
}

+ (BOOL)shouldReportNotificationsAsDisabledForProfile:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "cameraProfile userSettings = %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v3, "userSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAccessModeChangeNotificationEnabled") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "userSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isReachabilityEventNotificationEnabled") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "hf_userNotificationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "areNotificationsEnabled");

    }
  }

  return v7 ^ 1;
}

- (BOOL)isCompoundItem
{
  return -[HFCameraItem numberOfCompoundItems](self, "numberOfCompoundItems") != 0;
}

- (unint64_t)numberOfCompoundItems
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFAccessoryProfileItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

@end
