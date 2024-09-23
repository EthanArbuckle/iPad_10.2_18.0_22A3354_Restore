@implementation HUPersonalRequestsDevicesModuleController

- (HUPersonalRequestsDevicesModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_host_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsDevicesModuleController.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalRequestsDevicesModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUPersonalRequestsDevicesModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUPersonalRequestsDevicesModuleController *v14;
  HUPersonalRequestsDevicesModuleController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUPersonalRequestsDevicesModuleController;
  v14 = -[HUItemModuleController initWithModule:](&v17, sel_initWithModule_, v9);
  v15 = v14;
  if (v14)
    -[HUItemModuleController setHost:](v14, "setHost:", v7);

  return v15;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isItemPersonalRequestsDevice:", v6))
  {

  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isItemPersonalRequestsToggle:", v6);

    if (!v9)
      goto LABEL_8;
  }
  objc_opt_class();
  v10 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setDelegate:", self);
LABEL_8:

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  uint64_t v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  uint8_t buf[4];
  HUPersonalRequestsDevicesModuleController *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = self;
    v42 = 1024;
    v43 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", buf, 0x12u);
  }
  v39 = v4;

  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  objc_opt_class();
  v15 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "sourceItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (v14)
  {
    objc_msgSend(v14, "mediaProfileContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v14, "supportsMultiUser");
  }
  else
  {
    objc_msgSend(v20, "accessory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "accessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v25, "supportsMultiUser");

  }
  -[HUItemModuleController module](self, "module");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isItemPersonalRequestsDevice:", v15))
  {

  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isItemPersonalRequestsToggle:", v15);

    if (!v28)
      goto LABEL_30;
  }
  v37 = v20;
  v29 = v6;
  -[HUItemModuleController module](self, "module", v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isItemPersonalRequestsDevice:", v15))
    v31 = objc_msgSend(v22, "isMultiUserEnabled") & v39;
  else
    v31 = 0;

  -[HUItemModuleController module](self, "module");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "recognitionLanguageIsSupportedVRLanguageForItem:", v15);

  -[HUItemModuleController module](self, "module");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:", v15);

  if (v31 && ((v36 = v33 & v23 ^ 1u, (v36 & 1) != 0) || v35 != 1))
  {
    v6 = v29;
    -[HUPersonalRequestsDevicesModuleController _presentConfirmationForEnablingPersonalRequestsForItem:cell:didTurnOn:isOutdatedOS:unsupportedAccessoryLanguage:hasMismatchedLanguages:](self, "_presentConfirmationForEnablingPersonalRequestsForItem:cell:didTurnOn:isOutdatedOS:unsupportedAccessoryLanguage:hasMismatchedLanguages:", v15, v29, v39, objc_msgSend(v14, "supportsMultiUser") ^ 1, v36, v35 ^ 1u);
  }
  else
  {
    v6 = v29;
    -[HUPersonalRequestsDevicesModuleController _turnOnPersonalRequestForItem:cell:didTurnOn:](self, "_turnOnPersonalRequestForItem:cell:didTurnOn:", v15, v29, v39);
  }
  v20 = v38;
LABEL_30:

}

- (BOOL)_isCurrentDeviceCandidateForLocationDevice
{
  return MGGetSInt32Answer() == 1;
}

- (id)_preflightEnablingPersonalRequests
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (-[HUPersonalRequestsDevicesModuleController _isCurrentDeviceCandidateForLocationDevice](self, "_isCurrentDeviceCandidateForLocationDevice"))
  {
    -[HUPersonalRequestsDevicesModuleController _promptToChangeLocationDeviceIfNecessary](self, "_promptToChangeLocationDeviceIfNecessary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__HUPersonalRequestsDevicesModuleController__preflightEnablingPersonalRequests__block_invoke;
    v6[3] = &unk_1E6F514A0;
    v6[4] = self;
    objc_msgSend(v3, "flatMap:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __79__HUPersonalRequestsDevicesModuleController__preflightEnablingPersonalRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptToEnableSiriIfNecessary");
}

- (id)_promptToEnableSiriIfNecessary
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeLocationDeviceFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke;
    v9[3] = &unk_1E6F504C8;
    v9[4] = self;
    objc_msgSend(v7, "flatMap:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

id __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  if ((objc_msgSend(a2, "isCurrentDevice") & 1) != 0)
  {
    HULocalizedModelString(CFSTR("HUUsersPersonalRequestsSiriDisabledAlertTitle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "module");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedSiriTriggerPhrase(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsSiriDisabledAlertMessage"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v26, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v15 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_2;
    v29[3] = &unk_1E6F4C6E0;
    v18 = v14;
    v30 = v18;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addAction:", v19);
    v20 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsSiriDisabledAlertActionTurnOn"), CFSTR("HUUsersPersonalRequestsSiriDisabledAlertActionTurnOn"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_3;
    v27[3] = &unk_1E6F4C6E0;
    v28 = v18;
    v22 = v18;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addAction:", v23);
    objc_msgSend(v13, "setPreferredAction:", v23);
    objc_msgSend(*(id *)(a1 + 32), "_presentAlert:", v13);
    objc_msgSend(v22, "flatMap:", &__block_literal_global_93);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v24;
}

uint64_t __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

id __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a2, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAssistantIsEnabled:", 1);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_promptToChangeLocationDeviceIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  -[HUItemModuleController module](self, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeLocationDeviceFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke;
  v12[3] = &unk_1E6F504C8;
  v12[4] = self;
  objc_msgSend(v4, "flatMap:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_2;
  v11[3] = &unk_1E6F4F2D0;
  v11[4] = self;
  objc_msgSend(v6, "recover:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_33;
  v10[3] = &unk_1E6F4CD58;
  v10[4] = self;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_msgSend(v6, "isCurrentDevice") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "module"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "onlyShowDeviceSwitches"),
        v7,
        v8))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_promptToChangeLocationDeviceFromCurrentDevice:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

id __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch active location device: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_promptToChangeLocationDeviceFromCurrentDevice:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_33(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (objc_msgSend(a2, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "module");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateLocationDeviceToThisDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_promptToChangeLocationDeviceFromCurrentDevice:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertTitle"), CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke;
  v25[3] = &unk_1E6F504A0;
  v26 = v3;
  v20 = v3;
  __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke((uint64_t)v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v9 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertActionNotNow"), CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertActionNotNow"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_2;
  v23[3] = &unk_1E6F4C6E0;
  v11 = v8;
  v24 = v11;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v12);
  v13 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertActionUseCurrentDevice"), CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertActionUseCurrentDevice"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_3;
  v21[3] = &unk_1E6F4C6E0;
  v15 = v11;
  v22 = v15;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v16);
  objc_msgSend(v7, "setPreferredAction:", v16);
  -[HUPersonalRequestsDevicesModuleController _presentAlert:](self, "_presentAlert:", v7);
  v17 = v15;

  return v17;
}

id __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertMessageFormat"), CFSTR("%@"), v3, v4, v5, v6, v7, v8, (uint64_t)v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertMessageNoCurrentDevice"), CFSTR("HUUsersPersonalRequestsChangeLocationDeviceAlertMessageNoCurrentDevice"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

uint64_t __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAA0]);
}

uint64_t __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

- (void)_presentAlert:(id)a3
{
  void *v4;
  id v5;
  id v6;

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredPresentationType:", 0);
  -[HUItemModuleController host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "moduleController:presentViewControllerForRequest:", self, v6);

}

- (void)_togglePersonalRequestStateForItem:(id)a3
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HUPersonalRequestsDevicesModuleController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  int v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  HUPersonalRequestsDevicesModuleController *v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isItemPersonalRequestsDevice:", v5);

  if (v7)
  {
    objc_opt_class();
    objc_opt_class();
    v8 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v49 = v13;
    objc_msgSend(v13, "accessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_class();
    v15 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "sourceItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    objc_msgSend(v20, "accessories");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v14)
      v23 = v14;
    else
      v23 = (void *)v21;
    v24 = v23;
    HFLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController module](self, "module");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "personalRequestsDevices");
      v47 = self;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v56 = v26;
      v57 = 2112;
      v58 = v24;
      v59 = 2112;
      v60 = v28;
      _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@ toggling PR Set for targetSet = [%@], currentPRDevices = %@", buf, 0x20u);

      self = v47;
    }

    if (!v24)
      goto LABEL_36;
    v29 = self;
    -[HUItemModuleController module](self, "module");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "personalRequestsDevices");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");
    v33 = v32;
    if (v32)
      v34 = v32;
    else
      v34 = (id)objc_opt_new();
    v36 = v34;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v37 = v24;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v38)
    {
      v39 = v38;
      v46 = v22;
      v48 = v20;
      v40 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v51 != v40)
            objc_enumerationMutation(v37);
          v42 = objc_msgSend(v36, "containsObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v43 = v42;
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v39);

      v22 = v46;
      v20 = v48;
      if (v43)
      {
        objc_msgSend(v37, "allObjects");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "removeObjectsInArray:", v44);
LABEL_35:

        -[HUItemModuleController module](v29, "module");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setPersonalRequestsDevices:", v36);

LABEL_36:
        goto LABEL_37;
      }
    }
    else
    {

    }
    objc_msgSend(v37, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObjectsFromArray:", v44);
    goto LABEL_35;
  }
  -[HUItemModuleController module](self, "module");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "toggleAllPersonalRequestsDevices");

LABEL_37:
}

- (void)_presentConfirmationForEnablingPersonalRequestsForItem:(id)a3 cell:(id)a4 didTurnOn:(BOOL)a5 isOutdatedOS:(BOOL)a6 unsupportedAccessoryLanguage:(BOOL)a7 hasMismatchedLanguages:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  BOOL v58;
  id location[2];

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  v14 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    objc_msgSend(v16, "sourceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v14;
  }
  v18 = v17;
  v19 = &unk_1EF2AC470;
  if (objc_msgSend(v18, "conformsToProtocol:", v19))
    v20 = v18;
  else
    v20 = 0;
  v21 = v20;

  v49 = v16;
  if (v16)

  v48 = v21;
  objc_msgSend(v21, "accessories");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "anyObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hf_categoryOrPrimaryServiceType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v25, "recognitionLanguageIsSupportedVRLanguageForCurrentDevice");

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("HUUsersPersonalRequestsAlertTitleForMismatchedUnsupportedDeviceLanguage");
  if ((_DWORD)v23)
    v33 = CFSTR("HUUsersPersonalRequestsAlertTitleForMismatchedSupportedLanguages");
  if (v9)
    v33 = CFSTR("HUUsersPersonalRequestsAlertTitleForMismatchedUnsupportedAccessoryLanguage");
  if (!v8)
    v33 = CFSTR("HUUsersPersonalRequestsAlertTitleForUnsupportedMULanguages");
  if (v10)
    v34 = CFSTR("HUUsersPersonalRequestsAlertTitleForUnsupported");
  else
    v34 = (__CFString *)v33;
  v47 = v24;
  HULocalizedCategoryOrPrimaryServiceTypeStringWithFormat(v34, CFSTR("%@"), v24, v27, v28, v29, v30, v31, (uint64_t)v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "hu_actionSheetWithTitle:message:anchorView:", 0, v35, v13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v37 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsUsePersonalRequestsAnywayActionTitle"), CFSTR("HUUsersPersonalRequestsUsePersonalRequestsAnywayActionTitle"), 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke;
  v54[3] = &unk_1E6F53270;
  objc_copyWeak(&v57, location);
  v40 = v14;
  v55 = v40;
  v41 = v13;
  v56 = v41;
  v58 = a5;
  objc_msgSend(v37, "actionWithTitle:style:handler:", v38, 0, v54);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsUsePersonalRequestsCancelActionTitle"), CFSTR("HUUsersPersonalRequestsUsePersonalRequestsCancelActionTitle"), 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v39;
  v52[1] = 3221225472;
  v52[2] = __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke_2;
  v52[3] = &unk_1E6F4C6E0;
  v45 = v41;
  v53 = v45;
  objc_msgSend(v43, "actionWithTitle:style:handler:", v44, 1, v52);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "addAction:", v42);
  objc_msgSend(v36, "addAction:", v46);
  -[HUPersonalRequestsDevicesModuleController _presentAlert:](self, "_presentAlert:", v36);

  objc_destroyWeak(&v57);
  objc_destroyWeak(location);

}

void __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_turnOnPersonalRequestForItem:cell:didTurnOn:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

uint64_t __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", 0);
}

- (void)_turnOnPersonalRequestForItem:(id)a3 cell:(id)a4 didTurnOn:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a4;
  if (a5)
    -[HUPersonalRequestsDevicesModuleController _preflightEnablingPersonalRequests](self, "_preflightEnablingPersonalRequests");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke;
  v18[3] = &unk_1E6F4D188;
  v18[4] = self;
  v19 = v8;
  v12 = v8;
  objc_msgSend(v10, "addSuccessBlock:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke_2;
  v16[3] = &unk_1E6F4E2D8;
  v17 = v9;
  v14 = v9;
  v15 = (id)objc_msgSend(v13, "addFailureBlock:", v16);

}

uint64_t __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_togglePersonalRequestStateForItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUIWithAnimation:", 1);
}

- (id)turnOnPersonalRequestsForAllMultiUserCapableDevices
{
  void *v3;
  id v4;
  _QWORD v6[5];

  -[HUPersonalRequestsDevicesModuleController _preflightEnablingPersonalRequests](self, "_preflightEnablingPersonalRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__HUPersonalRequestsDevicesModuleController_turnOnPersonalRequestsForAllMultiUserCapableDevices__block_invoke;
  v6[3] = &unk_1E6F502A0;
  v6[4] = self;
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v6);
  return v3;
}

void __96__HUPersonalRequestsDevicesModuleController_turnOnPersonalRequestsForAllMultiUserCapableDevices__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "module");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices");

}

- (id)setPersonalRequestsDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[HUPersonalRequestsDevicesModuleController _preflightEnablingPersonalRequests](self, "_preflightEnablingPersonalRequests");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__HUPersonalRequestsDevicesModuleController_setPersonalRequestsDevices___block_invoke;
  v9[3] = &unk_1E6F4D188;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addSuccessBlock:", v9);

  return v5;
}

void __72__HUPersonalRequestsDevicesModuleController_setPersonalRequestsDevices___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "module");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPersonalRequestsDevices:", *(_QWORD *)(a1 + 40));

}

@end
