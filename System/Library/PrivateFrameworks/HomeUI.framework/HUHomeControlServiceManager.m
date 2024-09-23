@implementation HUHomeControlServiceManager

+ (id)sharedInstance
{
  if (qword_1ED580B50 != -1)
    dispatch_once(&qword_1ED580B50, &__block_literal_global_136);
  return (id)_MergedGlobals_626;
}

void __45__HUHomeControlServiceManager_sharedInstance__block_invoke()
{
  HUHomeControlServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(HUHomeControlServiceManager);
  v1 = (void *)_MergedGlobals_626;
  _MergedGlobals_626 = (uint64_t)v0;

}

- (void)launchServiceWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  UIViewController *v8;
  UIViewController *presentingViewController;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "serviceType");
  v6 = objc_msgSend(v4, "serviceType");
  if (!objc_msgSend(v4, "serviceType") || v5 == 1 || v6 == 2)
  {
    objc_msgSend(v4, "presentingViewController");
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    presentingViewController = self->_presentingViewController;
    self->_presentingViewController = v8;

    objc_initWeak(location, self);
    v10 = (void *)MEMORY[0x1E0D22F60];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__HUHomeControlServiceManager_launchServiceWithContext___block_invoke;
    v16[3] = &unk_1E6F567C0;
    objc_copyWeak(&v17, location);
    objc_msgSend(v10, "responderWithHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C80D38];
    objc_msgSend(v11, "setQueue:", v12);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22F58]), "initWithInfo:responder:", 0, v11);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActions:", v15);

    -[HUHomeControlServiceManager _launchServiceWithContext:](self, "_launchServiceWithContext:", v4);
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
  else
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Launching Home Control Service NOT permitted", (uint8_t *)location, 2u);
    }

  }
}

void __56__HUHomeControlServiceManager_launchServiceWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "error");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30598]) & 1) == 0)
    {

LABEL_8:
      goto LABEL_9;
    }
    objc_msgSend(WeakRetained, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "presentingViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v3;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Presenting error %@ from presentingViewController = %@", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_presentAlertForError:", v6);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)launchServiceSuspendedWithUserInfo:(id)a3
{
  -[HUHomeControlServiceManager _launchViewServiceSuspended](self, "_launchViewServiceSuspended", a3);
  -[HUHomeControlServiceManager setSuspendedServiceClientCount:](self, "setSuspendedServiceClientCount:", -[HUHomeControlServiceManager suspendedServiceClientCount](self, "suspendedServiceClientCount") + 1);
}

- (void)_launchServiceWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.Home.HomeControlService"), CFSTR("HCSRemoteAlertServiceViewController"));
  v6 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  objc_msgSend(v6, "setUserInfo:", v10);
  objc_msgSend(v4, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setActions:", v7);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v5, v6);
  objc_msgSend(v8, "addObserver:", self);
  v9 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(v8, "activateWithContext:", v9);
  -[HUHomeControlServiceManager setRemoteAlertHandle:](self, "setRemoteAlertHandle:", v8);

}

- (void)dismissService
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUHomeControlServiceManager remoteAlertHandle](self, "remoteAlertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUHomeControlServiceManager remoteAlertHandle](self, "remoteAlertHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    -[HUHomeControlServiceManager remoteAlertHandle](self, "remoteAlertHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[HUHomeControlServiceManager setRemoteAlertHandle:](self, "setRemoteAlertHandle:", 0);
    -[HUHomeControlServiceManager setPresentingViewController:](self, "setPresentingViewController:", 0);
  }
  else
  {
    -[HUHomeControlServiceManager setSuspendedServiceClientCount:](self, "setSuspendedServiceClientCount:", -[HUHomeControlServiceManager suspendedServiceClientCount](self, "suspendedServiceClientCount") - 1);
    if (!-[HUHomeControlServiceManager suspendedServiceClientCount](self, "suspendedServiceClientCount"))
    {
      objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "terminateApplication:forReason:andReport:withDescription:", CFSTR("com.apple.Home.HomeControlService"), 5, 0, &stru_1E6F60E80);

    }
  }
}

- (void)_launchViewServiceSuspended
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D22D00];
  v5[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openApplication:options:withResult:", CFSTR("com.apple.Home.HomeControlService"), v3, &__block_literal_global_17_3);

}

void __58__HUHomeControlServiceManager__launchViewServiceSuspended__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Error opening Home Control Service Alert using Frontboard System Service [%@]", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_presentAlertForError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;

  v4 = a3;
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "code");

  switch(v6)
  {
    case 'V':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_FailedToStart_Description"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      goto LABEL_16;
    case 'W':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_FailedToStart_TryAgain_Description"), CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v5);
      goto LABEL_16;
    case 'X':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_Ended_Title"), CFSTR("HUDropIn_ErrorAlert_Ended_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_FailedDuringCall_Description"), CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v5);
      goto LABEL_16;
    case 'Y':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_Ended_Title"), CFSTR("HUDropIn_ErrorAlert_Ended_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_FailedDuringCall_TryAgain_Description"), CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v5);
      goto LABEL_16;
    case 'Z':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_Ended_Title"), CFSTR("HUDropIn_ErrorAlert_Ended_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_Ended_Description"), CFSTR("%@"), v37, v38, v39, v40, v41, v42, (uint64_t)v5);
      goto LABEL_16;
    case '[':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_NoLongerAvailable_Title"), CFSTR("HUDropIn_ErrorAlert_NoLongerAvailable_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("HUDropIn_ErrorAlert_WindowExpired_Description");
      goto LABEL_11;
    case '\\':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_AlreadyInProgress_Title"), CFSTR("HUDropIn_ErrorAlert_AlreadyInProgress_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_AlreadyInProgress_Description"), CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v5);
      goto LABEL_16;
    case ']':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("HUDropIn_ErrorAlert_UserAccessNotAllowed_Description");
LABEL_11:
      _HULocalizedStringWithDefaultValue(v43, v43, 1);
      v50 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case '^':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_OnActiveCall_Title"), CFSTR("HUDropIn_ErrorAlert_OnActiveCall_Title"), 1);
      v71 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_ThisDevice_OnActiveCall_Description"), CFSTR("%@"), v51, v52, v53, v54, v55, v56, (uint64_t)v5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v57)
        NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match."), 0);
      v58 = v71;
      goto LABEL_18;
    case '_':
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), CFSTR("HUDropIn_ErrorAlert_UnableToConnect_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_HostDevice_OnActiveCall_Description"), CFSTR("%@"), v59, v60, v61, v62, v63, v64, (uint64_t)v5);
      goto LABEL_16;
    default:
      _HULocalizedStringWithDefaultValue(CFSTR("HUDropIn_ErrorAlert_Ended_Title"), CFSTR("HUDropIn_ErrorAlert_Ended_Title"), 1);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUDropIn_ErrorAlert_ThisDevice_OnActiveCall_Description"), CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v5);
LABEL_16:
      v50 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v58 = v70;
      v57 = (void *)v50;
LABEL_18:
      v72 = v58;
      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v58, v57, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "actionWithTitle:style:handler:", v67, 0, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addAction:", v68);

      -[HUHomeControlServiceManager presentingViewController](self, "presentingViewController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "presentViewController:animated:completion:", v65, 1, 0);

      return;
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[HUHomeControlServiceManager remoteAlertHandle](self, "remoteAlertHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[HUHomeControlServiceManager remoteAlertHandle](self, "remoteAlertHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

    -[HUHomeControlServiceManager setRemoteAlertHandle:](self, "setRemoteAlertHandle:", 0);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  -[HUHomeControlServiceManager setRemoteAlertHandle:](self, "setRemoteAlertHandle:", 0, a4);
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, a3);
}

- (unint64_t)suspendedServiceClientCount
{
  return self->_suspendedServiceClientCount;
}

- (void)setSuspendedServiceClientCount:(unint64_t)a3
{
  self->_suspendedServiceClientCount = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end
