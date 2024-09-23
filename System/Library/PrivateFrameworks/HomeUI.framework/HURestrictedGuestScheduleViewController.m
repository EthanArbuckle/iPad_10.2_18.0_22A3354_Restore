@implementation HURestrictedGuestScheduleViewController

- (HURestrictedGuestScheduleViewController)initWithHome:(id)a3 user:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HURestrictedGuestScheduleItemManager *v11;
  HURestrictedGuestScheduleViewController *v12;
  HURestrictedGuestScheduleViewController *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleViewController.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleViewController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  if ((objc_msgSend(v8, "hf_userIsRestrictedGuest:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleViewController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[home hf_userIsRestrictedGuest:user]"));

  }
  v11 = -[HURestrictedGuestScheduleItemManager initWithHome:user:delegate:]([HURestrictedGuestScheduleItemManager alloc], "initWithHome:user:delegate:", v8, v10, self);
  v19.receiver = self;
  v19.super_class = (Class)HURestrictedGuestScheduleViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v19, sel_initWithItemManager_tableViewStyle_, v11, 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_home, a3);
    objc_storeStrong((id *)&v13->_user, a4);
    objc_storeStrong((id *)&v13->_scheduleItemManager, v11);
    if (-[HURestrictedGuestScheduleItemManager scheduleContext](v11, "scheduleContext"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("HURestrictedGuestScheduleViewController.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemManager.scheduleContext == HUScheduleContextExistingUser"));

    }
  }

  return v13;
}

- (HURestrictedGuestScheduleViewController)initWithSchedule:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HURestrictedGuestScheduleItemManager *v11;
  HURestrictedGuestScheduleViewController *v12;
  HURestrictedGuestScheduleViewController *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleViewController.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schedule"));

    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleViewController.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_8;
LABEL_3:
  v11 = -[HURestrictedGuestScheduleItemManager initWithSchedule:delegate:]([HURestrictedGuestScheduleItemManager alloc], "initWithSchedule:delegate:", v8, self);
  v18.receiver = self;
  v18.super_class = (Class)HURestrictedGuestScheduleViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v18, sel_initWithItemManager_tableViewStyle_, v11, 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_inviteUserSchedule, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_scheduleItemManager, v11);
    if (-[HURestrictedGuestScheduleItemManager scheduleContext](v11, "scheduleContext") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("HURestrictedGuestScheduleViewController.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemManager.scheduleContext == HUScheduleContextNewUser"));

    }
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HURestrictedGuestScheduleViewController;
  -[HUItemTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[HURestrictedGuestScheduleViewController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_currentUserIsRestrictedGuest"))
    v4 = CFSTR("HURestrictedGuestScheduleItem_GuestView_Title");
  else
    v4 = CFSTR("HURestrictedGuestScheduleItem_AdminView_Title");
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HURestrictedGuestScheduleViewController setTitle:](self, "setTitle:", v5);
  _HULocalizedStringWithDefaultValue(CFSTR("HUBackTitle"), CFSTR("HUBackTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURestrictedGuestScheduleViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackButtonTitle:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[HURestrictedGuestScheduleViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  HUScheduleEditorItemModuleController *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setDelegate:", self);
  v8 = -[HUItemModuleController initWithModule:]([HUScheduleEditorItemModuleController alloc], "initWithModule:", v5);

  return v8;
}

- (void)doneButtonPressed:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56[2];
  uint8_t buf[4];
  HURestrictedGuestScheduleViewController *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v58 = self;
    v59 = 2112;
    v60 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", buf, 0x16u);

  }
  -[HURestrictedGuestScheduleViewController _editorItemModule](self, "_editorItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedScheduleBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originalScheduleBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalScheduleBuilder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v58 = self;
      v59 = 2112;
      v60 = v13;
      v61 = 2112;
      v62 = v9;
      v63 = 2112;
      v64 = v14;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Exiting without applying changes...New guest access schedule builder [%@] did not change from original schedule builder [%@].", buf, 0x2Au);

    }
    -[HURestrictedGuestScheduleViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_20:

    goto LABEL_21;
  }
  -[HURestrictedGuestScheduleViewController scheduleItemManager](self, "scheduleItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scheduleContext") == 0;

  if (v17)
  {
    -[HURestrictedGuestScheduleViewController home](self, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleViewController user](self, "user");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "homeAccessControlForUser:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "restrictedGuestAccessSettings");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "guestAccessSchedule");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "build");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA7C8], "hf_restrictedGuestHomeAccessScheduleFromHFSchedule:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v58 = self;
      v59 = 2112;
      v60 = v28;
      v61 = 2112;
      v62 = v45;
      v63 = 2112;
      v64 = v43;
      _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed new guest access schedule [%@] from schedule [%@].", buf, 0x2Au);

    }
    if (objc_msgSend(v44, "isEqual:", v45))
    {
      HFLogForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v58 = self;
        v59 = 2112;
        v60 = v30;
        v61 = 2112;
        v62 = v45;
        v63 = 2112;
        v64 = v44;
        _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ Exiting without applying changes...New guest access schedule [%@] is the same as the current access schedule [%@].", buf, 0x2Au);

      }
      -[HURestrictedGuestScheduleViewController navigationController](self, "navigationController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
      -[HURestrictedGuestScheduleViewController navigationItem](self, "navigationItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "rightBarButtonItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HURestrictedGuestScheduleViewController setSavedButtonBarItem:](self, "setSavedButtonBarItem:", v33);

      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v31);
      -[HURestrictedGuestScheduleViewController navigationItem](self, "navigationItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRightBarButtonItem:", v34);

      objc_msgSend(v31, "startAnimating");
      objc_initWeak((id *)buf, self);
      v36 = (void *)MEMORY[0x1E0D519C0];
      v37 = MEMORY[0x1E0C809B0];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke;
      v52[3] = &unk_1E6F51F50;
      objc_copyWeak(v56, (id *)buf);
      v56[1] = (id)a2;
      v53 = v44;
      v54 = v45;
      v55 = v15;
      objc_msgSend(v36, "futureWithBlock:", v52);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v37;
      v50[1] = 3221225472;
      v50[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2;
      v50[3] = &unk_1E6F4ED68;
      objc_copyWeak(&v51, (id *)buf);
      v39 = (id)objc_msgSend(v38, "addFailureBlock:", v50);
      v48[0] = v37;
      v48[1] = 3221225472;
      v48[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2_63;
      v48[3] = &unk_1E6F4E380;
      objc_copyWeak(&v49, (id *)buf);
      v40 = (id)objc_msgSend(v38, "addCompletionBlock:", v48);
      v46[0] = v37;
      v46[1] = 3221225472;
      v46[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_3;
      v46[3] = &unk_1E6F4F4D0;
      objc_copyWeak(&v47, (id *)buf);
      v41 = (id)objc_msgSend(v38, "addSuccessBlock:", v46);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&v51);

      objc_destroyWeak(v56);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_20;
  }
  -[HURestrictedGuestScheduleViewController scheduleItemManager](self, "scheduleItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "scheduleContext") == 1;

  if (v19)
  {
    objc_msgSend(v9, "build");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HURestrictedGuestScheduleViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v58 = self;
      v59 = 2112;
      v60 = v21;
      v61 = 2112;
      v62 = v22;
      v63 = 2112;
      v64 = v15;
      v65 = 2112;
      v66 = v9;
      _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule [%@] from schedule builder [%@].", buf, 0x34u);

    }
    -[HURestrictedGuestScheduleViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "didUpdateInviteUserSchedule:schedule:", self, v15);

    -[HURestrictedGuestScheduleViewController navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 1, 0);

    goto LABEL_20;
  }
LABEL_21:

}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18[2];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v20 = WeakRetained;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to update (current) guest access schedule [%@] to (new) restricted guest home access schedule [%@] for user [%@] in home [%@].", buf, 0x3Eu);

  }
  v13 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_52;
  v16[3] = &unk_1E6F51F28;
  v14 = *(void **)(a1 + 64);
  v16[4] = WeakRetained;
  v18[1] = v14;
  v15 = v3;
  v17 = v15;
  objc_copyWeak(v18, v4);
  objc_msgSend(v12, "updateRestrictedGuestSchedule:completionHandler:", v13, v16);
  objc_destroyWeak(v18);

}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@:%@ Failed to update guest access schedule for user with error: %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Successfully updated guest access schedule for user.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_54;
    v11[3] = &unk_1E6F4E358;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    objc_msgSend(v8, "dispatchHomeObserverMessage:sender:", v11, 0);

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
    objc_destroyWeak(&v12);
  }

}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_54(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:didUpdateAccessControlForUser:", v4, v5);

  }
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[HURestrictedGuestScheduleViewController doneButtonPressed:]_block_invoke_2";
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Will show error alert for failed attempt to update restricted guest access schedule with error: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_61;
  v6[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

  objc_destroyWeak(&v7);
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_61(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "doneButtonPressed:", 0);

}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2_63(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "savedButtonBarItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRightBarButtonItem:", v1);

  objc_msgSend(WeakRetained, "setSavedButtonBarItem:", 0);
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)scheduleEditorModule:(id)a3 didUpdateScheduleBuilder:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HURestrictedGuestScheduleViewController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Updated schedule builder [%@] results in schedule [%@].", (uint8_t *)&v12, 0x2Au);

  }
  -[HURestrictedGuestScheduleViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v7 != 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  HURestrictedGuestScheduleViewController *v55;
  id v56;
  objc_super v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v57.receiver = self;
  v57.super_class = (Class)HURestrictedGuestScheduleViewController;
  v50 = v6;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v57, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HURestrictedGuestScheduleViewController scheduleItemManager](self, "scheduleItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "scheduleContext") == 0;

  if ((_DWORD)v6)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v44 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v44;
    else
      v11 = 0;
    v48 = v11;

    v12 = objc_msgSend(v48, "type");
    objc_msgSend(MEMORY[0x1E0D31728], "scheduleBuilderFromType:withDefaultRules:", objc_msgSend(v48, "type"), 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleViewController home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleViewController user](self, "user");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeAccessControlForUser:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "restrictedGuestAccessSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v16, "mutableCopy");

    v17 = (void *)MEMORY[0x1E0CBA7C8];
    objc_msgSend(v47, "build");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hf_restrictedGuestHomeAccessScheduleFromHFSchedule:", v18);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "setGuestAccessSchedule:", v43);
    objc_msgSend(v49, "locksWithReducedFunctionalityDueToSchedule");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleViewController _editorItemModule](self, "_editorItemModule");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "originalScheduleBuilder");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rules");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    if (!objc_msgSend(v19, "count") && v12)
      v20 = !-[HURestrictedGuestScheduleViewController didDisplayLimitedLockAlert](self, "didDisplayLimitedLockAlert")
         && objc_msgSend(v45, "count") != 0;

    HFLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = -[HURestrictedGuestScheduleViewController didDisplayLimitedLockAlert](self, "didDisplayLimitedLockAlert");
      v23 = (void *)MEMORY[0x1E0CBA1A8];
      objc_msgSend(v45, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hf_minimumDescriptionsOfAccessories:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CBA1A8];
      objc_msgSend(v49, "accessAllowedToAccessories");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hf_minimumDescriptionsOfAccessories:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316674;
      v59 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]";
      v60 = 1024;
      v61 = v20;
      v62 = 2112;
      v63 = v46;
      v64 = 2112;
      v65 = v47;
      v66 = 1024;
      v67 = v22;
      v68 = 2112;
      v69 = v25;
      v70 = 2112;
      v71 = v29;
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "(%s) shouldDisplayLimitedLockAlert = %{BOOL}d | originalSchedule = %@ | newSchedule = %@ | didDisplayLimitedLockAlert = %{BOOL}d | limitedLockAccessories = %@ | allowedAccessories = %@", buf, 0x40u);

    }
    if (v20)
    {
      objc_initWeak((id *)buf, self);
      if (objc_msgSend(v45, "count") == 1)
        v30 = CFSTR("%@_SingleLock");
      else
        v30 = CFSTR("%@_PluralLocks");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v30, CFSTR("HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert_SingleGuest"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(v31, v31, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "alertControllerWithTitle:message:preferredStyle:", &stru_1E6F60E80, v33, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 0, &__block_literal_global_70);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "addAction:", v37);
      v38 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_87;
      v53[3] = &unk_1E6F51FB8;
      objc_copyWeak(&v56, (id *)buf);
      v54 = v50;
      v55 = self;
      objc_msgSend(v38, "actionWithTitle:style:handler:", v39, 0, v53);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "addAction:", v41);
      v51[0] = v40;
      v51[1] = 3221225472;
      v51[2] = __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_91;
      v51[3] = &unk_1E6F4DD08;
      objc_copyWeak(&v52, (id *)buf);
      -[HURestrictedGuestScheduleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, v51);
      objc_destroyWeak(&v52);

      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'Continue' button about the limit for wallet key and pin code. Proceeding with schedule change.", (uint8_t *)&v1, 0xCu);
  }

}

void __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_87(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'cancel' button about the limit for wallet key/pin code. Going back to 'Anytime' schedule option.", buf, 0xCu);
  }

  objc_opt_class();
  objc_msgSend(WeakRetained, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_90);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(WeakRetained, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForItem:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v15.receiver = *(id *)(a1 + 40);
    v15.super_class = (Class)HURestrictedGuestScheduleViewController;
    objc_msgSendSuper2(&v15, sel_tableView_didSelectRowAtIndexPath_, v11, v10);
  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allDisplayedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
      v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "(%s) Failed to find indexpath for always allowed among %@", buf, 0x16u);

    }
  }

}

BOOL __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_88(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "type") == 0;
  else
    v6 = 0;

  return v6;
}

void __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_91(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Displayed alert about wallet key and pin code limits when updating schedule for restricted guest", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "setDidDisplayLimitedLockAlert:", 1);
}

- (id)_originalScheduleBuilder
{
  void *v2;
  void *v3;

  -[HURestrictedGuestScheduleViewController _editorItemModule](self, "_editorItemModule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalScheduleBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_editorItemModule
{
  void *v2;
  void *v3;
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_93_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __60__HURestrictedGuestScheduleViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HURestrictedGuestScheduleViewControllerDelegate)delegate
{
  return (HURestrictedGuestScheduleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (HFSchedule)inviteUserSchedule
{
  return self->_inviteUserSchedule;
}

- (HURestrictedGuestScheduleItemManager)scheduleItemManager
{
  return self->_scheduleItemManager;
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, a3);
}

- (BOOL)didDisplayLimitedLockAlert
{
  return self->_didDisplayLimitedLockAlert;
}

- (void)setDidDisplayLimitedLockAlert:(BOOL)a3
{
  self->_didDisplayLimitedLockAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_storeStrong((id *)&self->_scheduleItemManager, 0);
  objc_storeStrong((id *)&self->_inviteUserSchedule, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
