@implementation MCRemoveProfileViewController

- (MCRemoveProfileViewController)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MCRemoveProfileViewController *v7;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();

  v10.receiver = self;
  v10.super_class = (Class)MCRemoveProfileViewController;
  v7 = -[MCInstallProfileViewController initWithProfile:viewMode:profileUIDataProvider:](&v10, sel_initWithProfile_viewMode_profileUIDataProvider_, v4, 2, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_profileUIDataProvider, v6);
    v7->_cachedHasYorktownWatch = 0;
    -[MCRemoveProfileViewController updateTitleForProfileInstallationState:](v7, "updateTitleForProfileInstallationState:", 1);
    v9.receiver = v7;
    v9.super_class = (Class)MCRemoveProfileViewController;
    -[MCUIViewController updateExtendedLayoutIncludesOpaqueBars](&v9, sel_updateExtendedLayoutIncludesOpaqueBars);
  }

  return v7;
}

- (void)updateTitleForProfileInstallationState:(int)a3
{
  __CFString *v4;
  void *v5;
  id v6;

  if (a3 == 1)
  {
    v4 = CFSTR("SINGULAR_BLOBS_DESIGNATION");
  }
  else
  {
    if (a3 != 9)
      return;
    v4 = CFSTR("BLOB_JUST_UPDATED_TITLE");
  }
  MCUILocalizedString(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MCRemoveProfileViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (void)setInstallState:(int)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCRemoveProfileViewController;
  -[MCInstallProfileViewController setInstallState:animated:](&v8, sel_setInstallState_animated_, *(_QWORD *)&a3, a4);
  -[MCRemoveProfileViewController updatingProfile](self, "updatingProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    if (v6)
    {
      -[MCRemoveProfileViewController updatingProfile](self, "updatingProfile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCInstallProfileViewController setProfile:](self, "setProfile:", v7);

      -[MCRemoveProfileViewController setUpdatingProfile:](self, "setUpdatingProfile:", 0);
    }
  }
}

- (BOOL)profileViewControllerIsProfileInstalled
{
  return 1;
}

- (void)profileViewControllerDidSelectRemoveProfile:(id)a3
{
  if (-[DMCProfileUIDataProvider isPasscodeSet](self->_profileUIDataProvider, "isPasscodeSet", a3))
    -[MCInstallProfileViewController pinExtensionShowPINSheet](self, "pinExtensionShowPINSheet");
  else
    -[MCRemoveProfileViewController _showRemovalWarningAfterPINVerification](self, "_showRemovalWarningAfterPINVerification");
}

- (void)profileViewControllerDidSelectUpdateProfile:(id)a3
{
  void *v4;
  int v5;

  -[MCInstallProfileViewController profile](self, "profile", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isManagedByProfileService");

  if (v5)
    -[MCRemoveProfileViewController _performReEnroll](self, "_performReEnroll");
  else
    -[MCInstallProfileViewController showReEnrollFailureAlert](self, "showReEnrollFailureAlert");
}

- (BOOL)profileViewControllerShouldDisplayPoll:(id)a3
{
  void *v3;
  char v4;

  -[MCInstallProfileViewController profile](self, "profile", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHRNProfile");

  return v4;
}

- (void)profileViewControllerDidSelectPoll:(id)a3
{
  void *v3;
  char v4;
  id v5;

  -[MCInstallProfileViewController profile](self, "profile", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHRNProfile");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D44760], "sharedClient");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "simulatePushWithCompletion:", &__block_literal_global_1);

  }
  else
  {
    NSLog(CFSTR("MCRemoveProfileViewController cannot poll non-HRN profile"));
  }
}

void __68__MCRemoveProfileViewController_profileViewControllerDidSelectPoll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("MCRemoveProfileViewController failed to poll HRN with error: %@"), a2);
  else
    NSLog(CFSTR("MCRemoveProfileViewController successfully polled HRN"));
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  if (!-[MCInstallProfileViewController installHasFailed](self, "installHasFailed")
    && -[MCRemoveProfileViewController profileWantsToReEnroll](self, "profileWantsToReEnroll"))
  {
    -[MCInstallProfileViewController setPin:](self, "setPin:", v4);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke;
  v5[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v6, &location);
  -[MCRemoveProfileViewController _didFinishEnteringPINWithCompletion:](self, "_didFinishEnteringPINWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id *v4;
  void (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "profileWantsToReEnroll") & 1) != 0)
    {
      v4 = (id *)&v8;
      v7 = MEMORY[0x1E0C809B0];
      v5 = __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_3;
      v6 = &v7;
    }
    else
    {
      v4 = (id *)&v10;
      v9 = MEMORY[0x1E0C809B0];
      v5 = __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_2;
      v6 = &v9;
    }
    v6[1] = 3221225472;
    v6[2] = (uint64_t)v5;
    v6[3] = (uint64_t)&unk_1EA2B5BE8;
    objc_copyWeak(v4, v1);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v4);
    objc_msgSend(v3, "setProfileWantsToReEnroll:", 0);
  }

}

void __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showRemovalWarningAfterPINVerification");
    WeakRetained = v2;
  }

}

void __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_performReEnrollAfterPINVerification");
    WeakRetained = v2;
  }

}

- (void)didCancelEnteringPIN
{
  -[MCRemoveProfileViewController setProfileWantsToReEnroll:](self, "setProfileWantsToReEnroll:", 0);
  -[MCRemoveProfileViewController _didFinishEnteringPINWithCompletion:](self, "_didFinishEnteringPINWithCompletion:", 0);
}

- (void)_didFinishEnteringPINWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCRemoveProfileViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)_showRemovalWarningAfterPINVerification
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MCInstallProfileViewController profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMDMProfile");

    if (v5
      && -[DMCProfileUIDataProvider isProvisionallyEnrolled](self->_profileUIDataProvider, "isProvisionallyEnrolled"))
    {
      -[MCRemoveProfileViewController _showLeaveRemoteManagementAlert](self, "_showLeaveRemoteManagementAlert");
      return;
    }
  }
  else
  {

  }
  -[MCInstallProfileViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isLocked"))
  {
    -[MCInstallProfileViewController profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removalPasscode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  if ((MCUIPreferAlert() & 1) != 0 || v9)
    -[MCRemoveProfileViewController _showRemovalWarningAlert](self, "_showRemovalWarningAlert");
  else
    -[MCRemoveProfileViewController _showRemovalWarningActionSheet](self, "_showRemovalWarningActionSheet");
}

- (void)_performReEnroll
{
  -[MCInstallProfileViewController setInstallHasFailed:](self, "setInstallHasFailed:", 0);
  if (-[DMCProfileUIDataProvider isPasscodeSet](self->_profileUIDataProvider, "isPasscodeSet"))
  {
    -[MCRemoveProfileViewController setProfileWantsToReEnroll:](self, "setProfileWantsToReEnroll:", 1);
    -[MCInstallProfileViewController pinExtensionShowPINSheet](self, "pinExtensionShowPINSheet");
  }
  else
  {
    -[MCRemoveProfileViewController _performReEnrollAfterPINVerification](self, "_performReEnrollAfterPINVerification");
  }
}

- (void)_performReEnrollAfterPINVerification
{
  void *v3;
  DMCProfileUIDataProvider *profileUIDataProvider;
  void *v5;
  id v6;

  -[MCInstallProfileViewController setQuestionsAlreadyAsked:](self, "setQuestionsAlreadyAsked:", 1);
  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCRemoveProfileViewController setUpdatingProfile:](self, "setUpdatingProfile:", v3);

  -[MCInstallProfileViewController showProgressIndicator](self, "showProgressIndicator");
  profileUIDataProvider = self->_profileUIDataProvider;
  -[MCInstallProfileViewController profile](self, "profile");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileUIDataProvider updateProfileWithIdentifier:interactionDelegate:](profileUIDataProvider, "updateProfileWithIdentifier:interactionDelegate:", v5, self);

}

- (void)profileRemovalDidFinish
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCRemoveProfileViewController;
  -[MCInstallProfileViewController profileRemovalDidFinish](&v5, sel_profileRemovalDidFinish);
  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsReboot");

  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowRebootAlertFromViewController:", self);
}

- (void)_showLeaveRemoteManagementAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedStringByDevice(CFSTR("MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT_ALERT_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CANCEL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCUIAddCancelActionWithTitle:", v6);

  objc_initWeak(&location, self);
  MCUILocalizedString(CFSTR("ERASE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __64__MCRemoveProfileViewController__showLeaveRemoteManagementAlert__block_invoke;
  v11 = &unk_1EA2B5BE8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "MCUIAddActionWithTitle:style:completion:", v7, 2, &v8);

  objc_msgSend(v5, "MCUIShowFromController:", self, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __64__MCRemoveProfileViewController__showLeaveRemoteManagementAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showEraseDeviceAlert");
    WeakRetained = v2;
  }

}

- (void)_showEraseDeviceAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  MCUILocalizedStringByDevice(CFSTR("ERASE_ALERT_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEA2E8];
  MCUILocalizedString(CFSTR("ERASE_ALERT_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MCUILocalizedString(CFSTR("CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MCUIAddCancelActionWithTitle:", v7);

  objc_initWeak(&location, self);
  MCUILocalizedString(CFSTR("ERASE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__MCRemoveProfileViewController__showEraseDeviceAlert__block_invoke;
  v12 = &unk_1EA2B5BE8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "MCUIAddActionWithTitle:style:completion:", v8, 2, &v9);

  objc_msgSend(v6, "MCUIShowFromController:", self, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __54__MCRemoveProfileViewController__showEraseDeviceAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_leaveRemoteManagementAndErase");
    WeakRetained = v2;
  }

}

- (void)_leaveRemoteManagementAndErase
{
  DMCProfileUIDataProvider *profileUIDataProvider;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  profileUIDataProvider = self->_profileUIDataProvider;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke;
  v4[3] = &unk_1EA2B5D60;
  objc_copyWeak(&v5, &location);
  -[DMCProfileUIDataProvider unenrollWithCompletionBlock:](profileUIDataProvider, "unenrollWithCompletionBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_2;
  v5[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT_LEAVING_REMOTE_MANAGEMENT_FAILED_ALERT_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT_LEAVING_REMOTE_MANAGEMENT_FAILED_ALERT_BODY"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MCUILocalizedString(CFSTR("OK"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "MCUIAddCancelActionWithTitle:", v6);

      objc_msgSend(v5, "MCUIShowFromController:", WeakRetained);
    }
    else
    {
      NSLog(CFSTR("Unenrolled from DEP. Removing existing MDM profile..."));
      objc_msgSend(WeakRetained, "profile");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_3;
      v7[3] = &unk_1EA2B6118;
      v7[4] = WeakRetained;
      objc_msgSend(WeakRetained, "_removeProfileWithIdentifier:isProtectedProfile:completionHandler:", v4, 1, v7);
    }

  }
}

uint64_t __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Profile removal finished. Error: %@"), a2);
  return objc_msgSend(*(id *)(a1 + 32), "_resetWithMode:", 7);
}

- (void)_showRemovalWarningAlert
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLocked"))
  {
    objc_msgSend(v3, "removalPasscode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    MCUILocalizedString(CFSTR("REMOVE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "isMDMProfile");
  MCUILocalizedString(CFSTR("REMOVE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_8:
    if (v5)
    {
      MCUILocalizedString(CFSTR("BLOB_REMOVE_TITLE_PROTECTED"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("PROFILE_REMOVE_WARNING_PROTECTED");
    }
    else
    {
      MCUILocalizedString(CFSTR("BLOB_REMOVE_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("PROFILE_REMOVE_WARNING");
    }
    MCUILocalizedStringByDevice(v10);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT_REMOVE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCRemoveProfileViewController _mdmProfileRemovalAlertBody](self, "_mdmProfileRemovalAlertBody");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v11 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MCUIAddCancelActionWithTitle:", v13);

  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke;
  v23[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v12, "MCUIAddActionWithTitle:style:completion:", v7, 2, v23);
  if (v5)
  {
    MCUILocalizedString(CFSTR("REMOVAL_PASSCODE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = 3221225472;
    v19 = __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke_2;
    v20 = &unk_1EA2B6140;
    objc_copyWeak(&v22, &location);
    v16 = v15;
    v21 = v16;
    objc_msgSend(v12, "addTextFieldWithConfigurationHandler:", &v17);

    objc_destroyWeak(&v22);
  }
  objc_msgSend(v12, "MCUIShowFromController:", self, v17, v18, v19, v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removalPasscode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3
      && (objc_msgSend(v7, "passwordField"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "text"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v3, "isEqualToString:", v5),
          v5,
          v4,
          !v6))
    {
      objc_msgSend(v7, "_showWrongRemovalPasswordAlert");
    }
    else
    {
      objc_msgSend(v7, "performRemoveAfterFinalVerification");
    }

    WeakRetained = v7;
  }

}

void __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v4, "setPlaceholder:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setSecureTextEntry:", 1);
    objc_msgSend(WeakRetained, "setPasswordField:", v4);
  }

}

- (void)_showRemovalWarningActionSheet
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "isMDMProfile"))
  {
    -[MCRemoveProfileViewController _mdmProfileRemovalAlertBody](self, "_mdmProfileRemovalAlertBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("MOBILE_DEVICE_MANAGEMENT_REMOVE_TITLE");
  }
  else
  {
    v4 = 0;
    v5 = CFSTR("REMOVE");
  }
  MCUILocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MCUIAddCancelActionWithTitle:", v8);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __63__MCRemoveProfileViewController__showRemovalWarningActionSheet__block_invoke;
  v12 = &unk_1EA2B5BE8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "MCUIAddActionWithTitle:style:completion:", v6, 2, &v9);
  objc_msgSend(v7, "MCUIShowFromController:", self, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __63__MCRemoveProfileViewController__showRemovalWarningActionSheet__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removalPasscode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (!v3)
    {
      objc_msgSend(v4, "performRemoveAfterFinalVerification");
      WeakRetained = v4;
    }
  }

}

- (void)_showWrongRemovalPasswordAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  MCUILocalizedString(CFSTR("BLOB_REMOVE_TITLE_PROTECTED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("BLOB_REMOVE_FAILURE_PROTECTED"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  MCUILocalizedString(CFSTR("CANCEL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MCUIAddCancelActionWithTitle:", v6);

  objc_msgSend(v7, "MCUIShowFromController:", self);
}

- (id)_mdmProfileRemovalAlertBody
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  -[MCRemoveProfileViewController profileUIDataProvider](self, "profileUIDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedAppsUninstalledOnMDMRemoval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v6 == 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF78]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedStringByDevice(CFSTR("MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_SINGULAR_APP_%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v6)
    {
      if (-[MCRemoveProfileViewController _hasYorktownWatch](self, "_hasYorktownWatch"))
      {
        MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_YORKTOWN_FULL"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
LABEL_6:
      v7 = 0;
      goto LABEL_13;
    }
    v12 = v6;
    v13 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedStringByDevice(CFSTR("MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_MULTIPLE_APPS_%ld"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v8, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (-[MCRemoveProfileViewController _hasYorktownWatch](self, "_hasYorktownWatch"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_YORKTOWN_ADDITIONAL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %@"), v11, v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v11;
  }

LABEL_13:
  return v7;
}

- (BOOL)_hasYorktownWatch
{
  unint64_t v3;
  BOOL v4;

  v3 = -[MCRemoveProfileViewController cachedHasYorktownWatch](self, "cachedHasYorktownWatch");
  if (v3 == 2)
    return 0;
  if (v3)
    return 1;
  if (!+[MCUISettingsWatchManager hasAnyYorktownEnrolledWatches](MCUISettingsWatchManager, "hasAnyYorktownEnrolledWatches"))
  {
    -[MCRemoveProfileViewController setCachedHasYorktownWatch:](self, "setCachedHasYorktownWatch:", 0);
    return 0;
  }
  v4 = 1;
  -[MCRemoveProfileViewController setCachedHasYorktownWatch:](self, "setCachedHasYorktownWatch:", 1);
  return v4;
}

- (void)_resetWithMode:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)&a3;
  v4 = SBSSpringBoardServerPort();
  NSLog(CFSTR("########### Calling SBDataReset with mode: %d; port: %d"), v3, v4);
  v5 = SBDataReset();
  NSLog(CFSTR("########### SBDataReset returned: %d"), v5);
}

- (BOOL)profileWantsToReEnroll
{
  return self->_profileWantsToReEnroll;
}

- (void)setProfileWantsToReEnroll:(BOOL)a3
{
  self->_profileWantsToReEnroll = a3;
}

- (MCProfile)updatingProfile
{
  return self->_updatingProfile;
}

- (void)setUpdatingProfile:(id)a3
{
  objc_storeStrong((id *)&self->_updatingProfile, a3);
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
  objc_storeStrong((id *)&self->_passwordField, a3);
}

- (DMCProfileUIDataProvider)profileUIDataProvider
{
  return self->_profileUIDataProvider;
}

- (void)setProfileUIDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, a3);
}

- (unint64_t)cachedHasYorktownWatch
{
  return self->_cachedHasYorktownWatch;
}

- (void)setCachedHasYorktownWatch:(unint64_t)a3
{
  self->_cachedHasYorktownWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_updatingProfile, 0);
}

@end
