@implementation FBKBugFormTableViewController

- (void)updateUI:(BOOL)a3
{
  -[FBKBugFormTableViewController updateUI:canDismissKeyboard:withCompletion:](self, "updateUI:canDismissKeyboard:withCompletion:", a3, 0, 0);
}

- (void)updateUI:(BOOL)a3 canDismissKeyboard:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  FBKSectionIdentifierGroup *v17;
  void *v18;
  FBKSectionIdentifierGroup *v19;
  void *v20;
  void *v21;
  FBKSectionIdentifierGroup *v22;
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
  FBKSectionIdentifierGroup *v33;
  void *v34;
  FBKSectionIdentifierGroup *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  unsigned int v69;
  FBKBugFormTableViewController *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  char v78;
  BOOL v79;
  uint8_t buf[4];
  _BYTE v81[10];
  void *v82;
  _BYTE v83[128];
  const __CFString *v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  _QWORD v88[4];

  v5 = a4;
  v6 = a3;
  v88[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v81 = v6;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v5;
    _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_INFO, "updateUI animated? [%i] canDismiss? [%i]", buf, 0xEu);
  }

  -[FBKBugFormTableViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (-[FBKBugFormTableViewController isUpdatingTable](self, "isUpdatingTable"))
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_INFO, "Already updating UI. Will defer to next run loop", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __96__FBKBugFormTableViewController_DiffableDataSource__updateUI_canDismissKeyboard_withCompletion___block_invoke;
      v76[3] = &unk_24E157BE8;
      v76[4] = self;
      v78 = v6;
      v79 = v5;
      v77 = v8;
      objc_msgSend(v13, "addOperationWithBlock:", v76);

    }
    else
    {
      -[FBKBugFormTableViewController setAllowKeyboardDismissalForSnapshot:](self, "setAllowKeyboardDismissalForSnapshot:", v5);
      -[FBKBugFormTableViewController setIsUpdatingTable:](self, "setIsUpdatingTable:", 1);
      v15 = objc_alloc_init(MEMORY[0x24BEBD348]);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
      if (!-[FBKBugFormTableViewController shouldHideAllCells](self, "shouldHideAllCells"))
      {
        if (-[FBKBugFormTableViewController shouldShowUserSwitcherInForm](self, "shouldShowUserSwitcherInForm")
          && !-[FBKBugFormTableViewController showInlineUserInfo](self, "showInlineUserInfo")
          && !-[FBKBugFormTableViewController showUserSwitcherLast](self, "showUserSwitcherLast"))
        {
          v17 = -[FBKSectionIdentifierGroup initWithSectionIdentifier:]([FBKSectionIdentifierGroup alloc], "initWithSectionIdentifier:", CFSTR("UserCell"));
          v88[0] = CFSTR("UserCell");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKSectionIdentifierGroup setGivenRowIdentifiers:](v17, "setGivenRowIdentifiers:", v18);

          objc_msgSend(v16, "addObject:", v17);
        }
        if (-[FBKBugFormTableViewController shouldShowTeamPicker](self, "shouldShowTeamPicker"))
        {
          v19 = -[FBKSectionIdentifierGroup initWithSectionIdentifier:]([FBKSectionIdentifierGroup alloc], "initWithSectionIdentifier:", CFSTR("TeamPicker"));
          -[FBKBugFormTableViewController teamPickerRowIdentifier](self, "teamPickerRowIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKSectionIdentifierGroup setGivenRowIdentifiers:](v19, "setGivenRowIdentifiers:", v21);

          objc_msgSend(v16, "addObject:", v19);
        }
        if (-[FBKBugFormTableViewController shouldShowFormPicker](self, "shouldShowFormPicker"))
        {
          v22 = -[FBKSectionIdentifierGroup initWithSectionIdentifier:]([FBKSectionIdentifierGroup alloc], "initWithSectionIdentifier:", CFSTR("FormPicker"));
          -[FBKBugFormTableViewController topicPickerRowIdentifier](self, "topicPickerRowIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v23;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKSectionIdentifierGroup setGivenRowIdentifiers:](v22, "setGivenRowIdentifiers:", v24);

          objc_msgSend(v16, "addObject:", v22);
        }
        if (-[FBKBugFormTableViewController shouldShowForm](self, "shouldShowForm"))
        {
          -[FBKBugFormTableViewController draftingController](self, "draftingController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "generateSnapshotIdentifiers:", -[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObjectsFromArray:", v26);

        }
        if (-[FBKBugFormTableViewController shouldShowAttachments](self, "shouldShowAttachments"))
        {
          -[FBKBugFormTableViewController devicesController](self, "devicesController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "generateSectionIdentifierGroupsWithDeviceSectionPrefix:deferredDeviceSectionPrefix:", CFSTR("DeviceAttachmentsSectionType"), CFSTR("DeviceAttachmentsSectionTypeDeferred"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "firstObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sectionIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKBugFormTableViewController setIdentifierOfFirstDeviceSection:](self, "setIdentifierOfFirstDeviceSection:", v30);

          objc_msgSend(v28, "lastObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sectionIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKBugFormTableViewController setIdentifierOfLastDeviceSection:](self, "setIdentifierOfLastDeviceSection:", v32);

          objc_msgSend(v16, "addObjectsFromArray:", v28);
          if (-[FBKBugFormTableViewController shouldShowAttachmentButton](self, "shouldShowAttachmentButton"))
          {
            v33 = -[FBKSectionIdentifierGroup initWithSectionIdentifier:]([FBKSectionIdentifierGroup alloc], "initWithSectionIdentifier:", CFSTR("AddAttachments"));
            v85 = CFSTR("AddAttachmentsItem");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[FBKSectionIdentifierGroup setGivenRowIdentifiers:](v33, "setGivenRowIdentifiers:", v34);

            objc_msgSend(v16, "addObject:", v33);
          }

        }
        if (-[FBKBugFormTableViewController shouldShowUserSwitcherInForm](self, "shouldShowUserSwitcherInForm")
          && !-[FBKBugFormTableViewController showInlineUserInfo](self, "showInlineUserInfo")
          && -[FBKBugFormTableViewController showUserSwitcherLast](self, "showUserSwitcherLast"))
        {
          v35 = -[FBKSectionIdentifierGroup initWithSectionIdentifier:]([FBKSectionIdentifierGroup alloc], "initWithSectionIdentifier:", CFSTR("UserCell"));
          v84 = CFSTR("UserCell");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKSectionIdentifierGroup setGivenRowIdentifiers:](v35, "setGivenRowIdentifiers:", v36);

          objc_msgSend(v16, "addObject:", v35);
        }
        DataSourceLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[FBKBugFormTableViewController(DiffableDataSource) updateUI:canDismissKeyboard:withCompletion:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);

        if (v16)
        {
          v69 = v6;
          v70 = self;
          v71 = v8;
          objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_20);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appendSectionsWithIdentifiers:", v45);

          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v68 = v16;
          v46 = v16;
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v73;
            do
            {
              v50 = 0;
              do
              {
                if (*(_QWORD *)v73 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v50);
                DataSourceLog();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v51, "sectionIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "rowIdentifiers");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)v81 = v57;
                  *(_WORD *)&v81[8] = 2114;
                  v82 = v58;
                  _os_log_debug_impl(&dword_21D9A9000, v52, OS_LOG_TYPE_DEBUG, "[%{public}@]:[%{public}@]", buf, 0x16u);

                }
                objc_msgSend(v51, "rowIdentifiers");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "count");

                if (v54)
                {
                  objc_msgSend(v51, "rowIdentifiers");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "sectionIdentifier");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v55, v56);

                }
                ++v50;
              }
              while (v48 != v50);
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
            }
            while (v48);
          }

          self = v70;
          v8 = v71;
          v6 = v69;
        }
        DataSourceLog();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          -[FBKBugFormTableViewController(DiffableDataSource) updateUI:canDismissKeyboard:withCompletion:].cold.1(v59, v60, v61, v62, v63, v64, v65, v66);

      }
      -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource", v68);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "applySnapshot:animatingDifferences:completion:", v15, v6, v8);

      -[FBKBugFormTableViewController setIsUpdatingTable:](self, "setIsUpdatingTable:", 0);
    }
  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, "Update UI came after VC was dismissed. Exiting", buf, 2u);
    }

  }
}

uint64_t __96__FBKBugFormTableViewController_DiffableDataSource__updateUI_canDismissKeyboard_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUI:canDismissKeyboard:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

uint64_t __96__FBKBugFormTableViewController_DiffableDataSource__updateUI_canDismissKeyboard_withCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionIdentifier");
}

- (FBKBugFormTableViewController)initWithCoder:(id)a3
{
  FBKBugFormTableViewController *v3;
  FBKBugFormTableViewController *v4;
  FBKDraftingController *v5;
  FBKDraftingController *draftingController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBKBugFormTableViewController;
  v3 = -[FBKBugFormTableViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_shouldHideQuestions = 0;
    v3->_attemptedSubmission = 0;
    v5 = objc_alloc_init(FBKDraftingController);
    draftingController = v4->_draftingController;
    v4->_draftingController = v5;

    -[FBKDraftingController setDelegate:](v4->_draftingController, "setDelegate:", v4);
    v4->_isUpdatingTable = 0;
    v4->_allowKeyboardDismissalForSnapshot = 0;
    v4->_canShowTopicPicker = 1;
    v4->_shouldShowUserSwitcherInForm = 0;
    v4->_canShowTeamPicker = 1;
    v4->_shouldHideAllCells = 0;
    v4->_canOpenFeedbackInFBA = 1;
    v4->_shouldShowAttachmentButton = 1;
    v4->_disableAccountSwitching = 0;
    v4->_allowsAttachmentDragAndDrop = 1;
    v4->_alternateImagePreviewEnabled = 0;
    v4->_isBeingDismissedBySelf = 0;
    v4->_autoGathersDiagnosticExtensions = 0;
    v4->_alwaysDeletesDrafts = 0;
    v4->_useInlineChoices = 0;
    v4->_isSubmissionPendingOnEnhancedLogging = 0;
    v4->_submissionStyle = 0;
    v4->_isPresentedInSmallDetent = 0;
  }
  return v4;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBKBugFormTableViewController;
  -[FBKBugFormTableViewController awakeFromNib](&v7, sel_awakeFromNib);
  -[FBKBugFormTableViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKBugFormTableViewController splitViewController](self, "splitViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredDisplayMode:", 2);

  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
    -[FBKBugFormTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 414.0, 600.0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FBKLargeSubmitButton *v18;
  void *v19;
  FBKLargeSubmitButton *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  FBKBugFormDiffableDataSource *v42;
  void *v43;
  FBKBugFormDiffableDataSource *v44;
  void *v45;
  void *v46;
  __CFBundle *MainBundle;
  const __CFURL *v48;
  const __CFURL *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id (*v56)(uint64_t, void *, void *, void *);
  void *v57;
  id v58;
  id location;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)FBKBugFormTableViewController;
  -[FBKBugFormTableViewController viewDidLoad](&v60, sel_viewDidLoad);
  -[FBKBugFormTableViewController submitButton](self, "submitButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[FBKBugFormTableViewController updateTitle](self, "updateTitle");
  v6 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Back"), &stru_24E15EAF8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, 0, 0);
  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackBarButtonItem:", v9);

  v11 = *MEMORY[0x24BEBE770];
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRowHeight:", v11);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEstimatedRowHeight:", 80.0);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEstimatedSectionFooterHeight:", 0.0);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSectionFooterHeight:", v11);

  -[FBKBugFormTableViewController addAttachmentsController](self, "addAttachmentsController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDropDelegate:", v16);

  if (!+[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
  {
    v18 = [FBKLargeSubmitButton alloc];
    -[FBKBugFormTableViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FBKLargeSubmitButton initWithTableView:target:action:](v18, "initWithTableView:target:action:", v19, self, sel_didTapLargeSubmitButton_);
    -[FBKBugFormTableViewController setSubmitButtonLarge:](self, "setSubmitButtonLarge:", v20);

  }
  +[FBKDeviceDisplayCell reuseIdentifier](FBKDeviceDisplayCell, "reuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "feedbackCoreFramework");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nibWithNibName:bundle:", v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerNib:forCellReuseIdentifier:", v24, v21);

  +[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "feedbackCoreFramework");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "nibWithNibName:bundle:", v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerNib:forCellReuseIdentifier:", v29, v26);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_class();
  +[FBKModalQuestionCell reuseIdentifier](_TtC12FeedbackCore20FBKModalQuestionCell, "reuseIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerClass:forCellReuseIdentifier:", v32, v33);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AddAttachmentsItem"));

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("UserCell"));

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_class();
  +[FBKExpandedChoiceCell reuseIdentifier](_TtC12FeedbackCore21FBKExpandedChoiceCell, "reuseIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "registerClass:forCellReuseIdentifier:", v37, v38);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_class();
  +[FBKInlineChoiceCell reuseIdentifier](FBKInlineChoiceCell, "reuseIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerClass:forCellReuseIdentifier:", v40, v41);

  objc_initWeak(&location, self);
  v42 = [FBKBugFormDiffableDataSource alloc];
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = MEMORY[0x24BDAC760];
  v55 = 3221225472;
  v56 = __44__FBKBugFormTableViewController_viewDidLoad__block_invoke;
  v57 = &unk_24E15A958;
  objc_copyWeak(&v58, &location);
  v44 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v42, "initWithTableView:cellProvider:", v43, &v54);
  -[FBKBugFormTableViewController setDiffableDataSource:](self, "setDiffableDataSource:", v44, v54, v55, v56, v57);

  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setThisViewController:", self);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setDelegate:", self);

  MainBundle = CFBundleGetMainBundle();
  v48 = CFBundleCopyResourceURL(MainBundle, CFSTR("whoosh"), CFSTR("caf"), 0);
  v49 = v48;
  if (v48)
  {
    if (AudioServicesCreateSystemSoundID(v48, &self->_whooshSoundID))
      self->_whooshSoundID = 0;
    CFRelease(v49);
  }
  -[FBKBugFormTableViewController navigationController](self, "navigationController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "presentationController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setDelegate:", self);

  v52 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[FBKBugFormTableViewController setCellHeights:](self, "setCellHeights:", v52);

  -[FBKBugFormTableViewController registerApplicationNotifications](self, "registerApplicationNotifications");
  LODWORD(v52) = self->_useInlineChoices;
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setUseInlineChoices:", (_DWORD)v52 != 0);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&location);

}

id __44__FBKBugFormTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "tableView:cellForRowAtIndexPath:withItemIdentifier:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setItemIdentifier:", v7);
  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FBKBugFormTableViewController;
  -[FBKBugFormTableViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[FBKBugFormTableViewController registerForKeyboardNotifications](self, "registerForKeyboardNotifications");
  -[FBKBugFormTableViewController setViewHasBecomeVisible:](self, "setViewHasBecomeVisible:", 1);
  -[FBKBugFormTableViewController pendingFeedbackObject](self, "pendingFeedbackObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FBKBugFormTableViewController appToken](self, "appToken");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5;
    if (v5 && (FBKIsInternalInstall(v5, v6) & 1) != 0)
    {
      -[FBKBugFormTableViewController pendingFeedbackObject](self, "pendingFeedbackObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[FBKBugFormTableViewController draftingController](self, "draftingController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormTableViewController pendingFeedbackObject](self, "pendingFeedbackObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormTableViewController requestedPlugIns](self, "requestedPlugIns");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormTableViewController appToken](self, "appToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "loadNewResponseForBugFormStub:requestPlugIns:appToken:", v11, v12, v13);

LABEL_8:
        -[FBKBugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", 0);
        -[FBKBugFormTableViewController setPendingTeam:](self, "setPendingTeam:", 0);
        return;
      }
    }
    else
    {

    }
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController pendingFeedbackObject](self, "pendingFeedbackObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController pendingTeam](self, "pendingTeam");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadResponseForFeedbackObject:withTeam:", v11, v12);
    goto LABEL_8;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBKBugFormTableViewController;
  -[FBKBugFormTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[FBKBugFormTableViewController unregisterForKeyboardNotifications](self, "unregisterForKeyboardNotifications");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FBKDeviceListDidChange"), 0);

}

- (id)largeTitleView:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAxis:", 0);
  objc_msgSend(v8, "setSpacing:", 1.17549435e-38);
  objc_msgSend(v8, "setAlignment:", 3);
  if (v6 && objc_msgSend(v6, "length"))
  {
    v9 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithPaletteColors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x24BEBB5E8], 22.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationByApplyingConfiguration:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v16);
      objc_msgSend(v8, "addArrangedSubview:", v17);
    }
    else
    {
      Log_7();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[FBKBugFormTableViewController largeTitleView:icon:].cold.1((uint64_t)v6, v17, v18);
    }

  }
  v19 = objc_alloc(MEMORY[0x24BEBD708]);
  v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v20, "setText:", v7);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v21);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 22.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v22);
  objc_msgSend(v20, "sizeToFit");
  objc_msgSend(v8, "addArrangedSubview:", v20);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_askDelegateToGoFullScreenIfNeeded);
  objc_msgSend(v8, "addGestureRecognizer:", v23);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v8);

  return v24;
}

- (id)cancelButtonOnRight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x24BEBB610], 22.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithImage:style:target:action:", v9, 0, self, sel_dismiss_);

  return v10;
}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[FBKBugFormTableViewController formStub](self, "formStub");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15 || !objc_msgSend(v15, "length"))
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bugForm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v6;
  }
  v7 = +[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA");
  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setTitleView:", 0);

    -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v15);
  }
  else
  {
    objc_msgSend(v8, "setTitle:", 0);

    -[FBKBugFormTableViewController largeTitleIcon](self, "largeTitleIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController largeTitleView:icon:](self, "largeTitleView:icon:", v15, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftBarButtonItem:animated:", v10, 0);

    -[FBKBugFormTableViewController cancelButtonOnRight](self, "cancelButtonOnRight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:animated:", v13, 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBKBugFormTableViewController;
  -[FBKBugFormTableViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v6, 0);

}

- (void)_hideDevices
{
  id v2;

  +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidesNotConfiguredDevices:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormTableViewController;
  -[FBKBugFormTableViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[FBKBugFormTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[FBKBugFormTableViewController setIsPresentedInSmallDetent:](self, "setIsPresentedInSmallDetent:", v5 <= 65.0 + 65.0);
}

- (BOOL)hasCandidateStubs
{
  return -[FBKBugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount") > 1;
}

- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  -[FBKBugFormTableViewController setLoadDraftCompletion:](self, "setLoadDraftCompletion:", a5);
  -[FBKBugFormTableViewController loadNewResponseForBugFormStub:forTeam:](self, "loadNewResponseForBugFormStub:forTeam:", v9, v8);

}

- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Loading new response with Form [%{public}@], team [%{public}@] ", (uint8_t *)&v12, 0x16u);

  }
  if (-[FBKBugFormTableViewController viewHasBecomeVisible](self, "viewHasBecomeVisible"))
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadNewResponseForBugFormStub:withTeam:", v6, v7);

  }
  else
  {
    -[FBKBugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", v6);
    -[FBKBugFormTableViewController setPendingTeam:](self, "setPendingTeam:", v7);
  }

}

- (void)loadNewResponseForSurvey:(id)a3 forTeam:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[FBKBugFormTableViewController viewHasBecomeVisible](self, "viewHasBecomeVisible"))
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadNewResponseForBugForm:withTeam:", v8, v6);

    v6 = v7;
  }
  else
  {
    -[FBKBugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", v8);
    -[FBKBugFormTableViewController setPendingTeam:](self, "setPendingTeam:", v6);
  }

}

- (void)loadDraft:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[FBKBugFormTableViewController viewHasBecomeVisible](self, "viewHasBecomeVisible"))
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadFormResponseFromContentItem:", v5);

  }
  else
  {
    -[FBKBugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", v5);
  }

}

- (void)preAttachFiles:(id)a3
{
  id v4;

  +[FBKLaunchAction validateURLSchemeFilePathsDictionary:](FBKLaunchAction, "validateURLSchemeFilePathsDictionary:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController setPendingAttachments:](self, "setPendingAttachments:", v4);

}

- (void)postAttachFiles:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[FBKLaunchAction validateURLSchemeFilePathsDictionary:](FBKLaunchAction, "validateURLSchemeFilePathsDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postLaunchAttachLocalFiles:", v5);
}

- (void)setLaunchAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_launchAction, a3);
  objc_msgSend(v12, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[FBKBugFormTableViewController preAttachFiles:](self, "preAttachFiles:", v7);

  }
  objc_msgSend(v12, "questionAnswerPairs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "questionAnswerPairs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController setPendingQandA:](self, "setPendingQandA:", v9);

  }
  objc_msgSend(v12, "extensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v12, "extensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController setExtensions:](self, "setExtensions:", v11);

  }
}

- (void)close
{
  -[FBKBugFormTableViewController closeWithCompletion:](self, "closeWithCompletion:", 0);
}

- (void)closeWithCompletion:(id)a3
{
  -[FBKBugFormTableViewController closeWithError:completion:](self, "closeWithError:completion:", 0, a3);
}

- (void)saveDraftWithIsClosing:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  id location;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVING_DRAFT"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v8);

  if (v4
    && +[FBKSharedConstants usesTemporaryDraftsDirectory](FBKSharedConstants, "usesTemporaryDraftsDirectory"))
  {
    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentDeviceAttachmentManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileCollector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveDraftsDirectory");

  }
  objc_initWeak(&location, self);
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__FBKBugFormTableViewController_saveDraftWithIsClosing_completion___block_invoke;
  v15[3] = &unk_24E15A980;
  v18 = v4;
  objc_copyWeak(&v17, &location);
  v14 = v6;
  v15[4] = self;
  v16 = v14;
  objc_msgSend(v12, "saveFormResponse:completion:", v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __67__FBKBugFormTableViewController_saveDraftWithIsClosing_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13
    && *(_BYTE *)(a1 + 56)
    && !+[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "localizedAttachmentLegalText");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_8:

      goto LABEL_2;
    }
    v5 = (void *)v4;
    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v6, "formResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "localizedAttachmentLegalText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v10, "formResponse");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKSharedConstants saveLocalizedAttachmentLegalText:draftID:](FBKSharedConstants, "saveLocalizedAttachmentLegalText:draftID:", v9, v12);

      goto LABEL_8;
    }
  }
LABEL_2:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "hideSpinner");

}

- (void)closeDraftAndDelete:(BOOL)a3 completion:(id)a4
{
  -[FBKBugFormTableViewController closeDraftAndDelete:withError:completion:](self, "closeDraftAndDelete:withError:completion:", a3, 0, a4);
}

- (void)closeDraftAndDelete:(BOOL)a3 withError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void (**v20)(void *, id);
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31;
  int v32;
  BOOL v33;
  id location;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[FBKBugFormTableViewController setIsBeingDismissedBySelf:](self, "setIsBeingDismissedBySelf:", 1);
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CLOSING_FEEDBACK_EDITOR"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v14);

  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 0);

  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leftBarButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", 0);

  -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  objc_initWeak(&location, self);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke;
  v29 = &unk_24E15A9A8;
  objc_copyWeak(&v31, &location);
  v32 = v12;
  v33 = a3;
  v19 = v9;
  v30 = v19;
  v20 = (void (**)(void *, id))_Block_copy(&v26);
  if (a3)
  {
    Log_7();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v36 = v12;
      _os_log_impl(&dword_21D9A9000, v21, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], deleting", buf, 8u);
    }

    -[FBKBugFormTableViewController _deleteCurrentDraftWithCompletion:](self, "_deleteCurrentDraftWithCompletion:", v20, v26, v27, v28, v29);
    Log_7();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v36 = v12;
      _os_log_impl(&dword_21D9A9000, v22, OS_LOG_TYPE_INFO, "will delete all sessions for form response [%i]", buf, 8u);
    }

    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "abortAllSessions");

  }
  else
  {
    Log_7();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v25)
      {
        *(_DWORD *)buf = 67109120;
        v36 = v12;
        _os_log_impl(&dword_21D9A9000, v24, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d] after error, not saving", buf, 8u);
      }

      v20[2](v20, v8);
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 67109120;
        v36 = v12;
        _os_log_impl(&dword_21D9A9000, v24, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], saving", buf, 8u);
      }

      -[FBKBugFormTableViewController saveDraftWithIsClosing:completion:](self, "saveDraftWithIsClosing:completion:", 1, v20, v26, v27, v28, v29);
    }
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "unregisterApplicationNotifications");

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "setDevicesController:", 0);

  if (a2)
  {
    Log_7();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = objc_loadWeakRetained(v4);
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_loadWeakRetained(v4);
  objc_msgSend(v15, "controller:didRequestDismissalWithSavedDraft:", v16, *(_BYTE *)(a1 + 52) == 0);

  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(void))(v17 + 16))();
  v18 = objc_loadWeakRetained(v4);
  objc_msgSend(v18, "hideSpinner");

}

- (void)_deleteCurrentDraftWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = -[FBKBugFormTableViewController showsDraftDeletionMessage](self, "showsDraftDeletionMessage");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("DELETING_DRAFT");
  else
    v8 = CFSTR("CLOSING_FEEDBACK_EDITOR");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24E15EAF8, CFSTR("CommonStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v9);

  -[FBKBugFormTableViewController itemFromDraft](self, "itemFromDraft");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController itemFromDraft](self, "itemFromDraft");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteDraftFromContentItem:completion:", v12, v4);

  }
  else
  {
    Log_7();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FBKBugFormTableViewController _deleteCurrentDraftWithCompletion:].cold.1(v13);

    v4[2](v4, 0);
  }

}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  if (-[FBKBugFormTableViewController alwaysDeletesDrafts](self, "alwaysDeletesDrafts"))
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDirty") ^ 1;

  }
  else
  {
    v9 = 1;
  }
  Log_7();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[FBKBugFormTableViewController alwaysDeletesDrafts](self, "alwaysDeletesDrafts");
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136446978;
    v14 = "-[FBKBugFormTableViewController closeWithError:completion:]";
    v15 = 1024;
    v16 = v11;
    v17 = 1024;
    v18 = objc_msgSend(v12, "isDirty");
    v19 = 1024;
    v20 = v9;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s self.alwaysDeletesDrafts [%i], self.draftingController.isDirty [%i], shouldDelete [%i]", (uint8_t *)&v13, 0x1Eu);

  }
  -[FBKBugFormTableViewController closeDraftAndDelete:withError:completion:](self, "closeDraftAndDelete:withError:completion:", v9, v7, v6);

}

- (id)itemFromDraft
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)formStub
{
  void *v2;
  void *v3;

  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formStub");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBKFormResponse)formResponse
{
  void *v2;
  void *v3;

  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKFormResponse *)v3;
}

- (FBKBugForm)bugForm
{
  void *v2;
  void *v3;

  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bugForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKBugForm *)v3;
}

- (void)draftingControllerDidBeginLoading:(id)a3
{
  void *v4;
  void *v5;

  -[FBKBugFormTableViewController updateTitle](self, "updateTitle", a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOADING_DRAFT"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v5);

  -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 1);
}

- (void)draftingControllerDidFinishLoading:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  FBKDeviceDiagnosticsController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FBKDeviceDiagnosticsController *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD block[5];
  uint8_t buf[4];
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v42 = objc_msgSend(v10, "intValue");
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "finished loading draft for form response [%i]", buf, 8u);

  }
  -[FBKBugFormTableViewController setHasLoadedFirstDraft:](self, "setHasLoadedFirstDraft:", 1);
  -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", -[FBKBugFormTableViewController isCaptiveModeEnabled](self, "isCaptiveModeEnabled"));
  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "collectsFiles"))
  {
    v12 = +[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA");

    if (!v12)
      goto LABEL_8;
    objc_msgSend(v6, "formResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKSharedConstants localizedAttachmentLegalTextForDraftID:](FBKSharedConstants, "localizedAttachmentLegalTextForDraftID:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[FBKBugFormTableViewController setLocalizedAttachmentLegalText:](self, "setLocalizedAttachmentLegalText:", v11);
  }

LABEL_8:
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
  if (v7)
  {
    Log_7();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FBKBugFormTableViewController draftingControllerDidFinishLoading:withError:].cold.1(v7, v15);

    -[FBKBugFormTableViewController _handleLoadingError:](self, "_handleLoadingError:", v7);
  }
  else
  {
    -[FBKBugFormTableViewController pendingQandA](self, "pendingQandA");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      +[FBKLog currentURLActionActivity](FBKLog, "currentURLActionActivity");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __78__FBKBugFormTableViewController_draftingControllerDidFinishLoading_withError___block_invoke;
      block[3] = &unk_24E156D78;
      block[4] = self;
      os_activity_apply(v17, block);

    }
    -[FBKBugFormTableViewController bugForm](self, "bugForm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "collectsFiles");

    if (v19)
    {
      v20 = [FBKDeviceDiagnosticsController alloc];
      +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController formResponse](self, "formResponse");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController pendingAttachments](self, "pendingAttachments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController extensions](self, "extensions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController formResponse](self, "formResponse");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "draftDevices");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = -[FBKBugFormTableViewController autoGathersDiagnosticExtensions](self, "autoGathersDiagnosticExtensions");
      v27 = -[FBKDeviceDiagnosticsController initWithDeviceManager:delegate:filerForm:pendingFileUrls:pendingURLExtensions:draftDeviceIds:attachmentDescriptors:autoGathersDiagnosticExtensions:](v20, "initWithDeviceManager:delegate:filerForm:pendingFileUrls:pendingURLExtensions:draftDeviceIds:attachmentDescriptors:autoGathersDiagnosticExtensions:", v21, self, v22, v23, v24, v26, 0, v39);
      -[FBKBugFormTableViewController setDevicesController:](self, "setDevicesController:", v27);

      -[FBKBugFormTableViewController setExtensions:](self, "setExtensions:", 0);
    }
    else
    {
      Log_7();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        -[FBKBugFormTableViewController bugForm](self, "bugForm");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");
        *(_DWORD *)buf = 67109120;
        v42 = v31;
        _os_log_impl(&dword_21D9A9000, v28, OS_LOG_TYPE_INFO, "bug form [%i] does not collect files", buf, 8u);

      }
      -[FBKBugFormTableViewController setDevicesController:](self, "setDevicesController:", 0);
      -[FBKBugFormTableViewController _stopSpinner](self, "_stopSpinner");
    }
    -[FBKBugFormTableViewController updateTitle](self, "updateTitle");
    -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leftBarButtonItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setEnabled:", 1);

    -[FBKBugFormTableViewController setAttemptedSubmission:](self, "setAttemptedSubmission:", 0);
    -[FBKBugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");
    -[FBKBugFormTableViewController showQuestions](self, "showQuestions");
    -[FBKBugFormTableViewController updateCachedCandidateStubsCount](self, "updateCachedCandidateStubsCount");
    -[FBKBugFormTableViewController loadDraftCompletion](self, "loadDraftCompletion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[FBKBugFormTableViewController loadDraftCompletion](self, "loadDraftCompletion");
      v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v35[2](v35, 0);

    }
    -[FBKBugFormTableViewController delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "controller:didFinishLoadingDraft:devicesController:draftingController:", self, v37, v38, v6);

  }
}

void __78__FBKBugFormTableViewController_draftingControllerDidFinishLoading_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "draftingController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pendingQandA");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachAnswersToQuestionsWithGivenData:", v2);

}

- (void)_handleLoadingError:(id)a3
{
  id v4;
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
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  FBKBugFormTableViewController *v23;
  id v24;

  v4 = a3;
  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[FBKBugFormTableViewController _stopSpinner](self, "_stopSpinner");
  v7 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GENERIC_DRAFT_LOAD_ERROR_TITLE"), &stru_24E15EAF8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GENERIC_DRAFT_LOAD_ERROR_MESSAGE"), &stru_24E15EAF8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fbaAlertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E15EAF8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __53__FBKBugFormTableViewController__handleLoadingError___block_invoke;
  v22 = &unk_24E15A9D0;
  v23 = self;
  v16 = v4;
  v24 = v16;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, &v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v17, v19, v20, v21, v22, v23);

  -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  Log_7();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[FBKBugFormTableViewController _handleLoadingError:].cold.1(v16, v18);

}

void __53__FBKBugFormTableViewController__handleLoadingError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "unregisterApplicationNotifications");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didFailToLoadDraftWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)questionVisibilityDidUpdateForDraftingController:(id)a3
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)draftingController:(id)a3 madeVisibilityUpdatesWithSnapshotDiff:(id)a4
{
  id v5;

  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", objc_msgSend(a4, "containsAnyAdditionsOrRemovals", a3));
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reevaluateMatcherPredicates");

}

- (id)questionGroupForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "questionGroupForSectionIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)_separatorInset
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__FBKBugFormTableViewController__separatorInset__block_invoke;
  block[3] = &unk_24E156D78;
  block[4] = self;
  if (_separatorInset_onceToken != -1)
    dispatch_once(&_separatorInset_onceToken, block);
  return *(double *)&_separatorInset_inset;
}

void __48__FBKBugFormTableViewController__separatorInset__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKDeviceDisplayCell reuseIdentifier](FBKDeviceDisplayCell, "reuseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dequeueReusableCellWithIdentifier:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "spaceFromSuperViewToLabel");
  _separatorInset_inset = v3;

}

- (void)adjustAttachmentLabelSpacing:(id)a3
{
  id v4;

  v4 = a3;
  -[FBKBugFormTableViewController _separatorInset](self, "_separatorInset");
  objc_msgSend(v4, "updateWithSeparatorSpacing:");
  -[FBKBugFormTableViewController _separatorInset](self, "_separatorInset");
  objc_msgSend(v4, "updateSuperviewToAttachmentLabelSpacing:");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 withItemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  FBKDiffableTableViewCell *v14;
  void *v15;
  void *v16;
  void *v17;
  FBKDiffableTableViewCell *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  __objc2_class *v51;
  void *v52;
  FBKDiffableTableViewCell *v53;
  FBKDiffableTableViewCell *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  double v58;
  uint64_t v59;
  FBKDiffableTableViewCell *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  FBKDiffableTableViewCell *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  FBKDiffableTableViewCell *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  char v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  FBKDiffableTableViewCell *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  void *v117;
  void *v118;
  void *v119;
  FBKDiffableTableViewCell *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  unint64_t v131;
  unint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  char v151;
  void *v152;
  __objc2_class *v153;
  void *v154;
  void *v155;
  FBKDiffableTableViewCell *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  FBKDiffableTableViewCell *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  void *v180;
  FBKDiffableTableViewCell *v181;
  FBKDiffableTableViewCell *v182;
  FBKDiffableTableViewCell *v183;
  FBKDiffableTableViewCell *v184;
  void *v185;
  id obj;
  id obja;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  unint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionIdentifierForSectionContainingItemIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("FBK UI Exception"), CFSTR("Section Identifier is nil, cannot proceed"));
    v14 = 0;
    goto LABEL_105;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("UserCell")))
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("UserCell"), v9);
    v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKDiffableTableViewCell updateWithUser:](v14, "updateWithUser:", v16);
    if (self->_disableAccountSwitching)
    {
      -[FBKDiffableTableViewCell setSelectionStyle:](v14, "setSelectionStyle:", 0);
      -[UITableViewCell disableRemoteHoverEffect](v14, "disableRemoteHoverEffect");
    }
    goto LABEL_5;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("TeamPicker")))
  {
    -[FBKBugFormTableViewController teamPickerRowIdentifier](self, "teamPickerRowIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v17);
    v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v18 = [FBKDiffableTableViewCell alloc];
      -[FBKBugFormTableViewController teamPickerRowIdentifier](self, "teamPickerRowIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[FBKDiffableTableViewCell initWithStyle:reuseIdentifier:](v18, "initWithStyle:reuseIdentifier:", 3, v19);

    }
    -[FBKBugFormTableViewController formStub](self, "formStub");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "teamsMatchingFormID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDiffableTableViewCell configureForTeam:disclosesMoreTeams:](v14, "configureForTeam:disclosesMoreTeams:", v22, (unint64_t)objc_msgSend(v21, "count") > 1);

    goto LABEL_105;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("FormPicker")))
  {
    +[FBKTopicCell reuseIdentifier](_TtC12FeedbackCore12FBKTopicCell, "reuseIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v23, v9);
    v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController formStub](self, "formStub");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDiffableTableViewCell setFormStub:](v14, "setFormStub:", v24);

    -[FBKDiffableTableViewCell setDisclosesMoreForms:](v14, "setDisclosesMoreForms:", -[FBKBugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount") > 1);
    goto LABEL_105;
  }
  if (objc_msgSend(v13, "hasPrefix:", CFSTR("DeviceAttachmentsSectionType")))
  {
    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "maybeAttachmentWithIdentifier:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "maybeDeviceWithIdentifier:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      +[FBKDeviceDisplayCell reuseIdentifier](FBKDeviceDisplayCell, "reuseIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v28, v9);
      v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[FBKDiffableTableViewCell updateWithDevice:](v14, "updateWithDevice:", v27);
      -[FBKBugFormTableViewController _separatorInset](self, "_separatorInset");
      -[UITableViewCell updateWithSeparatorSpacing:](v14, "updateWithSeparatorSpacing:");
LABEL_39:

LABEL_5:
      goto LABEL_105;
    }
    if (v16)
    {
      +[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v31, v9);
      v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[FBKDiffableTableViewCell setShowsIcon:](v14, "setShowsIcon:", 0);
      -[FBKDiffableTableViewCell setAttachment:](v14, "setAttachment:", v16);
      if (+[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA")
        || (-[FBKBugFormTableViewController devicesController](self, "devicesController"),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v32, "devicesInPlay"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v192 = objc_msgSend(v33, "count"),
            v33,
            v32,
            v192 >= 2))
      {
        -[FBKBugFormTableViewController adjustAttachmentLabelSpacing:](self, "adjustAttachmentLabelSpacing:", v14);
      }
      else
      {
        -[FBKBugFormTableViewController tableView](self, "tableView");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "separatorInset");
        -[FBKDiffableTableViewCell updateSuperviewToSeparatorSpacing:](v14, "updateSuperviewToSeparatorSpacing:", v58);

      }
      goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("FBK UI Exception"), CFSTR("Received unexpected diffable object"));
LABEL_25:
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "questionChoiceForSectionIdentifier:itemIdentifier:", v13, v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      +[FBKInlineChoiceCell reuseIdentifier](FBKInlineChoiceCell, "reuseIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v36, v9);
      v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[FBKDiffableTableViewCell setChoice:](v14, "setChoice:", v35);
      -[FBKDiffableTableViewCell textLabel](v14, "textLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setLineBreakMode:", 0);

      -[FBKDiffableTableViewCell textLabel](v14, "textLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setNumberOfLines:", 0);

      -[FBKBugFormTableViewController draftingController](self, "draftingController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "questionForVisibleChoice:sectionIdentifier:", v35, v13);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        -[FBKBugFormTableViewController formResponse](self, "formResponse");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "answerForQuestion:", v40);
        v193 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v193, "values");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "value");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v35;
        v45 = v40;
        v46 = objc_msgSend(v42, "containsObject:", v43);

        v47 = v46;
        v40 = v45;
        v35 = v44;
        -[FBKDiffableTableViewCell showCheckmark:](v14, "showCheckmark:", v47);

      }
      else
      {
        +[FBKLog appHandle](FBKLog, "appHandle");
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          -[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:].cold.2();

      }
LABEL_104:

      goto LABEL_105;
    }
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "visibleQuestionForSectionIdentifier:itemIdentifier:", v13, v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "answerForQuestion:", v40);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v40, "answerType") == 8
      || objc_msgSend(v40, "answerType") == 10
      || objc_msgSend(v40, "answerType") == 9)
    {
      -[FBKBugFormTableViewController tableView](self, "tableView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = _TtC12FeedbackCore15FBKDateTimeCell;
LABEL_32:
      -[__objc2_class reuseIdentifier](v51, "reuseIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "dequeueReusableCellWithIdentifier:forIndexPath:", v52, v9);
      v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

      v53 = 0;
      goto LABEL_33;
    }
    if (objc_msgSend(v40, "answerType") == 7)
    {
      -[FBKBugFormTableViewController tableView](self, "tableView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = _TtC12FeedbackCore13FBKSliderCell;
      goto LABEL_32;
    }
    if (objc_msgSend(v40, "answerType") == 6)
    {
      -[FBKBugFormTableViewController tableView](self, "tableView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = FBKInformationCell;
      goto LABEL_32;
    }
    if (objc_msgSend(v40, "answerType") == 11)
    {
      -[FBKBugFormTableViewController tableView](self, "tableView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = _TtC12FeedbackCore20FBKModalQuestionCell;
      goto LABEL_32;
    }
    v196 = v40;
    if (!self->_useInlineChoices)
      goto LABEL_119;
    v131 = -[FBKBugFormTableViewController maxInlineChoices](self, "maxInlineChoices");
    if (v131 != -1)
    {
      objc_msgSend(v40, "visibleChoices");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend(v49, "count");
      if (v132 > -[FBKBugFormTableViewController maxInlineChoices](self, "maxInlineChoices"))
        goto LABEL_94;
    }
    if (objc_msgSend(v196, "answerType") == 2
      || objc_msgSend(v196, "answerType") == 3
      || objc_msgSend(v196, "answerType") == 4)
    {
      v151 = objc_msgSend(v196, "canDisplayChoicesInline");
      if (v131 != -1)

      if ((v151 & 1) == 0)
      {
        -[FBKBugFormTableViewController tableView](self, "tableView");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKExpandedChoiceCell reuseIdentifier](_TtC12FeedbackCore21FBKExpandedChoiceCell, "reuseIdentifier");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "dequeueReusableCellWithIdentifier:forIndexPath:", v176, v9);
        v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();

        -[UITableViewCell disableRemoteHoverEffectAndClearBackground](v14, "disableRemoteHoverEffectAndClearBackground");
        v53 = 0;
LABEL_132:
        v35 = 0;
        v40 = v196;
LABEL_33:
        switch(objc_msgSend(v40, "answerType"))
        {
          case 0:
          case 1:
            v179 = v35;
            v194 = v40;
            objc_msgSend(v185, "value");
            v59 = objc_claimAutoreleasedReturnValue();
            v60 = v53;
            if (v59
              && (v61 = (void *)v59,
                  objc_msgSend(v185, "value"),
                  v62 = (void *)objc_claimAutoreleasedReturnValue(),
                  v63 = objc_msgSend(v62, "length"),
                  v62,
                  v61,
                  v63))
            {
              objc_msgSend(v185, "value");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setText:", v64);

              objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setTextColor:", v66);
            }
            else
            {
              objc_msgSend(v194, "placeholder");
              v77 = objc_claimAutoreleasedReturnValue();
              if (v77
                && (v78 = (void *)v77,
                    objc_msgSend(v194, "placeholder"),
                    v79 = (void *)objc_claimAutoreleasedReturnValue(),
                    v188 = objc_msgSend(v79, "length"),
                    v79,
                    v78,
                    v188))
              {
                objc_msgSend(v194, "placeholder");
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v189, "stringByTrimmingCharactersInSet:", v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "setText:", v81);

                v83 = v189;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("TEXT_ANSWER_PLACEHOLDER"), &stru_24E15EAF8, 0);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "setText:", v80);
              }

              objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "setTextColor:", v99);

              objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setFont:", v66);
            }

            -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "setDelegate:", self);

            -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "text");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            -[FBKDiffableTableViewCell answerTextView](v60, "answerTextView");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setAccessibilityIdentifier:", v103);

            -[FBKDiffableTableViewCell hideAccessoryView](v60, "hideAccessoryView");
            v40 = v194;
            v53 = v60;
            goto LABEL_101;
          case 2:
          case 3:
            objc_opt_class();
            v179 = v35;
            v195 = v40;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v182 = v53;
              v68 = v40;
              v69 = v14;
              -[FBKDiffableTableViewCell setQuestion:](v69, "setQuestion:", v68);
              -[FBKBugFormTableViewController formResponse](self, "formResponse");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "answerForQuestion:", v68);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell setAnswer:](v69, "setAnswer:", v71);

              -[FBKDiffableTableViewCell setDelegate:](v69, "setDelegate:", self);
              if (!-[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"))
                goto LABEL_65;
              -[FBKBugFormTableViewController draftingController](self, "draftingController");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "invalidQuestionIDs");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "ID");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend(v73, "containsObject:", v74);

              if ((v75 & 1) != 0)
                v76 = 1;
              else
LABEL_65:
                v76 = 0;
              v53 = v182;
              -[FBKDiffableTableViewCell setShowError:](v69, "setShowError:", v76);
              -[FBKDiffableTableViewCell updateCellContent](v69, "updateCellContent");

              v35 = v179;
              goto LABEL_84;
            }
            objc_msgSend(v40, "displayTextForAnswer:", v185);
            v93 = objc_claimAutoreleasedReturnValue();
            v190 = (void *)v93;
            if (v93)
            {
              v94 = v93;
              -[FBKDiffableTableViewCell answerTextView](v53, "answerTextView");
              v95 = v53;
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "setText:", v94);

              objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "setTextColor:", v97);
            }
            else
            {
              v95 = v53;
              objc_msgSend(v40, "allChoices");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isPrompt = YES"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "filteredArrayUsingPredicate:", v125);
              v126 = (void *)objc_claimAutoreleasedReturnValue();

              obja = v126;
              if (objc_msgSend(v126, "count"))
              {
                objc_msgSend(v126, "firstObject");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "title");
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "localizedStringForKey:value:table:", CFSTR("CHOICE_ANSWER_PLACEHOLDER"), &stru_24E15EAF8, 0);
              }
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "setText:", v133);

              objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "setTextColor:", v135);

              objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "setFont:", v137);

              -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "setDelegate:", 0);
              v97 = obja;
            }

            -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "text");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            -[FBKDiffableTableViewCell answerTextView](v95, "answerTextView");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "setAccessibilityIdentifier:", v140);

            v53 = v95;
            -[FBKDiffableTableViewCell showAccessoryView](v95, "showAccessoryView");
            v40 = v195;
            if (objc_msgSend(v195, "canDisplayChoicesInline") && self->_useInlineChoices)
              -[FBKDiffableTableViewCell hideAccessoryView](v95, "hideAccessoryView");

LABEL_101:
            v35 = v179;
            goto LABEL_102;
          case 4:
            v195 = v40;
            objc_opt_class();
            v180 = v35;
            v183 = v53;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v84 = v14;
              -[FBKDiffableTableViewCell setQuestion:](v84, "setQuestion:", v195);
              -[FBKBugFormTableViewController formResponse](self, "formResponse");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "answerForQuestion:", v195);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell setAnswer:](v84, "setAnswer:", v86);

              -[FBKDiffableTableViewCell setDelegate:](v84, "setDelegate:", self);
              if (!-[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"))
                goto LABEL_82;
              -[FBKBugFormTableViewController draftingController](self, "draftingController");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "invalidQuestionIDs");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "ID");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v88, "containsObject:", v89);

              if ((v90 & 1) != 0)
                v91 = 1;
              else
LABEL_82:
                v91 = 0;
              -[FBKDiffableTableViewCell setShowError:](v84, "setShowError:", v91);
              -[FBKDiffableTableViewCell updateCellContent](v84, "updateCellContent");

              v35 = v180;
              v53 = v183;
LABEL_84:
              v40 = v195;
LABEL_102:
              v55 = v185;
            }
            else
            {
              objc_msgSend(v185, "values");
              v105 = objc_claimAutoreleasedReturnValue();
              if (v105
                && (v106 = (void *)v105,
                    objc_msgSend(v185, "values"),
                    v107 = (void *)objc_claimAutoreleasedReturnValue(),
                    v108 = objc_msgSend(v107, "count"),
                    v107,
                    v106,
                    v108))
              {
                v178 = v9;
                -[FBKBugFormTableViewController formResponse](self, "formResponse");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "answerForQuestion:", v195);
                v110 = (void *)objc_claimAutoreleasedReturnValue();

                v111 = (void *)MEMORY[0x24BDBCEB8];
                objc_msgSend(v110, "values");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "arrayWithCapacity:", objc_msgSend(v112, "count"));
                v191 = (void *)objc_claimAutoreleasedReturnValue();

                v199 = 0u;
                v200 = 0u;
                v197 = 0u;
                v198 = 0u;
                v177 = v110;
                objc_msgSend(v110, "values");
                obj = (id)objc_claimAutoreleasedReturnValue();
                v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v201, 16);
                if (v113)
                {
                  v114 = v113;
                  v115 = *(_QWORD *)v198;
                  do
                  {
                    for (i = 0; i != v114; ++i)
                    {
                      if (*(_QWORD *)v198 != v115)
                        objc_enumerationMutation(obj);
                      objc_msgSend(v195, "displayTextForAnswer:", *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * i));
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("• %@"), v117);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v191, "addObject:", v118);

                    }
                    v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v201, 16);
                  }
                  while (v114);
                }

                objc_msgSend(v191, "componentsJoinedByString:", CFSTR("\n"));
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                v120 = v183;
                -[FBKDiffableTableViewCell answerTextView](v183, "answerTextView");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "setText:", v119);

                objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                -[FBKDiffableTableViewCell answerTextView](v183, "answerTextView");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "setTextColor:", v122);

                v9 = v178;
              }
              else
              {
                v128 = v195;
                objc_msgSend(v195, "placeholder");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                if (v129)
                {
                  objc_msgSend(v195, "placeholder");
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "localizedStringForKey:value:table:", CFSTR("CHOICE_ANSWER_PLACEHOLDER"), &stru_24E15EAF8, 0);
                }
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                -[FBKDiffableTableViewCell answerTextView](v183, "answerTextView");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v143, "setText:", v130);

                if (!v129)
                {

                  v130 = v128;
                }

                objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                v120 = v183;
                -[FBKDiffableTableViewCell answerTextView](v183, "answerTextView");
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v145, "setTextColor:", v144);

                objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                -[FBKDiffableTableViewCell answerTextView](v183, "answerTextView");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v147, "setFont:", v146);

              }
              -[FBKDiffableTableViewCell answerTextView](v120, "answerTextView");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "text");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              -[FBKDiffableTableViewCell answerTextView](v120, "answerTextView");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v150, "setAccessibilityIdentifier:", v149);

              -[FBKDiffableTableViewCell showAccessoryView](v120, "showAccessoryView");
              v40 = v195;
              v53 = v120;
              v35 = v180;
              v55 = v185;
              if (objc_msgSend(v195, "canDisplayChoicesInline") && self->_useInlineChoices)
                -[FBKDiffableTableViewCell hideAccessoryView](v53, "hideAccessoryView");
            }
LABEL_103:
            -[FBKDiffableTableViewCell layoutIfNeeded](v14, "layoutIfNeeded");

            break;
          case 6:
            v92 = v14;
            -[NSObject setQuestion:](v92, "setQuestion:", v40);
            -[NSObject disableRemoteHoverEffectAndClearBackground](v92, "disableRemoteHoverEffectAndClearBackground");
            goto LABEL_64;
          case 7:
            v181 = v53;
            v54 = v14;
            -[FBKDiffableTableViewCell setQuestion:](v54, "setQuestion:", v40);
            v55 = v185;
            -[FBKDiffableTableViewCell setAnswer:](v54, "setAnswer:", v185);
            -[FBKDiffableTableViewCell setEditorDelegate:](v54, "setEditorDelegate:", self);
            -[UITableViewCell disableRemoteHoverEffectAndClearBackground](v54, "disableRemoteHoverEffectAndClearBackground");
            -[FBKDiffableTableViewCell updateSliderAndLabel](v54, "updateSliderAndLabel");
            goto LABEL_58;
          case 8:
          case 9:
          case 10:
            v181 = v53;
            v54 = v14;
            -[FBKDiffableTableViewCell setQuestion:](v54, "setQuestion:", v40);
            v55 = v185;
            -[FBKDiffableTableViewCell setAnswer:](v54, "setAnswer:", v185);
            -[FBKDiffableTableViewCell setEditorDelegate:](v54, "setEditorDelegate:", self);
            -[UITableViewCell disableRemoteHoverEffectAndClearBackground](v54, "disableRemoteHoverEffectAndClearBackground");
LABEL_58:

            v53 = v181;
            goto LABEL_103;
          case 11:
            -[FBKDiffableTableViewCell setQuestion:](v14, "setQuestion:", v40);
            goto LABEL_102;
          default:
            Log_7();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              -[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:].cold.1(v40, v92);
LABEL_64:

            goto LABEL_102;
        }
        goto LABEL_104;
      }
    }
    else if (v131 != -1)
    {
LABEL_94:

    }
LABEL_119:
    if (objc_msgSend(v196, "canDisplayChoicesInline") && self->_useInlineChoices)
    {
      -[FBKBugFormTableViewController tableView](self, "tableView");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = FBKQuestionOnlyCell;
    }
    else
    {
      -[FBKBugFormTableViewController tableView](self, "tableView");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = FBKQuestionAnswerCell;
    }
    -[__objc2_class reuseIdentifier](v153, "reuseIdentifier");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "dequeueReusableCellWithIdentifier:forIndexPath:", v154, v9);
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v155;
    -[FBKDiffableTableViewCell setQuestion:](v156, "setQuestion:", v196);
    -[FBKDiffableTableViewCell setAnswer:](v156, "setAnswer:", v185);
    -[FBKDiffableTableViewCell setBugFormEditorDelegate:](v156, "setBugFormEditorDelegate:", self);
    -[FBKDiffableTableViewCell setSelectionStyle:](v156, "setSelectionStyle:", 2);
    objc_msgSend(v196, "text");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v156;
    -[FBKDiffableTableViewCell questionLabel](v156, "questionLabel");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "setText:", v157);

    if (FBKIsInternalInstall(v159, v160))
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = objc_msgSend(v161, "BOOLForKey:", CFSTR("showSortOrderForDebugging"));

      if (v162)
      {
        v163 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v196, "text");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "sortOrder");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "stringValue");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "stringWithFormat:", CFSTR("%@ (%@)"), v164, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKDiffableTableViewCell questionLabel](v184, "questionLabel");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "setText:", v167);

      }
    }
    if (!-[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"))
      goto LABEL_129;
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "invalidQuestionIDs");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "ID");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v170, "containsObject:", v171);

    if (v172)
    {
      v53 = v184;
      v173 = v184;
      v174 = 1;
    }
    else
    {
LABEL_129:
      v53 = v184;
      v173 = v184;
      v174 = 0;
    }
    -[FBKDiffableTableViewCell setShowError:](v173, "setShowError:", v174);
    v14 = v53;
    goto LABEL_132;
  }
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("AddAttachments")))
    goto LABEL_25;
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AddAttachmentsItem"), v9);
  v14 = (FBKDiffableTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (+[FBKAddAttachmentsCell supportsMenu](_TtC12FeedbackCore21FBKAddAttachmentsCell, "supportsMenu"))
  {
    -[FBKBugFormTableViewController addAttachmentsController](self, "addAttachmentsController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "menuForController:", self);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDiffableTableViewCell setMenu:](v14, "setMenu:", v30);

  }
  -[FBKBugFormTableViewController setAddAttachmentCell:](self, "setAddAttachmentCell:", v14);
LABEL_105:

  return v14;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:titleForHeaderInSection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[QuestionGroupTitleViewController viewWithTitle:](_TtC12FeedbackCore32QuestionGroupTitleViewController, "viewWithTitle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  -[FBKBugFormTableViewController cellHeights](self, "cellHeights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = *MEMORY[0x24BEBE770];
  }

  return v9;
}

- (int64_t)legalSectionIndex
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  if (-[FBKBugFormTableViewController shouldShowAttachmentButton](self, "shouldShowAttachmentButton"))
  {
    v3 = CFSTR("AddAttachments");
  }
  else
  {
    -[FBKBugFormTableViewController identifierOfLastDeviceSection](self, "identifierOfLastDeviceSection");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  if (-[FBKBugFormTableViewController legalSectionIndex](self, "legalSectionIndex") == a4)
  {
    -[FBKBugFormTableViewController legalText](self, "legalText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v7, "boundingRectWithSize:options:context:", 3, 0, v8 + -48.0, 3.40282347e38);
    v10 = v9;

    v11 = v10 + 48.0;
  }
  else
  {
    v11 = *MEMORY[0x24BEBE770];
  }

  return v11;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  if (-[FBKBugFormTableViewController legalSectionIndex](self, "legalSectionIndex", a3) == a4)
  {
    -[FBKBugFormTableViewController legalText](self, "legalText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKAttributedStringViewController viewWithAttributedText:](_TtC12FeedbackCore33FBKAttributedStringViewController, "viewWithAttributedText:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  -[FBKBugFormTableViewController cellHeights](self, "cellHeights");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "frame");
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v7);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 useInlineChoices;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  int v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionIdentifierForSectionContainingItemIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  Log_7();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v75 = v9;
    v76 = 2112;
    v77 = v12;
    _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_INFO, "Did select item with identifier [%@] in section [%@]", buf, 0x16u);
  }

  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("UserCell")))
  {
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("DeviceAttachmentsSectionType")))
    {
      -[FBKBugFormTableViewController devicesController](self, "devicesController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "maybeAttachmentWithIdentifier:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKBugFormTableViewController devicesController](self, "devicesController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "maybeDeviceWithIdentifier:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[FBKBugFormTableViewController didTapDevice:indexPath:](self, "didTapDevice:indexPath:", v20, v7);
      }
      else if (v17)
      {
        -[FBKBugFormTableViewController didTapAttachment:indexPath:](self, "didTapAttachment:indexPath:", v17, v7);
      }
      goto LABEL_51;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("AddAttachments")))
    {
      -[FBKBugFormTableViewController addAttachmentsController](self, "addAttachmentsController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController addAttachmentCell](self, "addAttachmentCell");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sheetForController:selectedIndexPath:sender:", self, v7, v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
      goto LABEL_52;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("FormPicker")))
    {
      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController didPressChangeBugForm:](self, "didPressChangeBugForm:", v17);
      goto LABEL_52;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("TeamPicker")))
    {
      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController formStub](self, "formStub");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "teamsMatchingFormID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25 < 2)
        goto LABEL_52;
      objc_msgSend(MEMORY[0x24BEBD9A0], "teamPickerViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPickerDelegate:", self);
      objc_msgSend(v20, "setShowsDismissButton:", 1);
      -[FBKBugFormTableViewController formStub](self, "formStub");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFormStub:", v26);

      -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSelectedTeam:", v27);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v20);
      objc_msgSend(v28, "setModalPresentationStyle:", 7);
      objc_msgSend(v28, "popoverPresentationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSourceView:", v17);

      objc_msgSend(v17, "bounds");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      objc_msgSend(v28, "popoverPresentationController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setSourceRect:", v31, v33, v35, v37);

      objc_msgSend(v28, "popoverPresentationController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setPermittedArrowDirections:", 1);

      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __67__FBKBugFormTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v71[3] = &unk_24E157020;
      v72 = v6;
      v73 = v7;
      -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v28, 1, v71);

      goto LABEL_50;
    }
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "questionChoiceForSectionIdentifier:itemIdentifier:", v12, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      useInlineChoices = self->_useInlineChoices;

      if (useInlineChoices)
      {
        objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormTableViewController draftingController](self, "draftingController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "questionForVisibleChoice:sectionIdentifier:", v17, v12);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        {
          +[FBKLog appHandle](FBKLog, "appHandle");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:].cold.2();
          goto LABEL_58;
        }
        v70 = v42;
        -[FBKBugFormTableViewController formResponse](self, "formResponse");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "answerForQuestion:", v44);
        v46 = objc_claimAutoreleasedReturnValue();

        v47 = objc_msgSend(v44, "answerType");
        if (v47 == 4)
        {
          -[NSObject values](v46, "values");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "value");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v55, "containsObject:", v56);

          v57 = v69;
          -[NSObject values](v46, "values");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v58;
          if (v69)
          {
            v59 = (void *)MEMORY[0x24BDD1758];
            objc_msgSend(v17, "value");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "predicateWithFormat:", CFSTR("SELF != %@"), v66);
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v58;
            v62 = (void *)v60;
            objc_msgSend(v61, "filteredArrayUsingPredicate:", v60);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setValues:](v46, "setValues:", v63);

            v57 = v69;
          }
          else
          {
            objc_msgSend(v17, "value");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "arrayByAddingObject:");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setValues:](v46, "setValues:", v62);
          }

          v42 = v70;
          objc_msgSend(v70, "showCheckmark:", v57 ^ 1u);
        }
        else
        {
          if (v47 != 3
            || (-[NSObject values](v46, "values"),
                v48 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v17, "value"),
                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                v68 = objc_msgSend(v48, "containsObject:", v49),
                v49,
                v48,
                (v68 & 1) != 0))
          {
            v42 = v70;
LABEL_58:

            goto LABEL_52;
          }
          v42 = v70;
          objc_msgSend(v70, "showCheckmark:", 1);
          objc_msgSend(v17, "value");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:](v46, "setValue:", v65);

        }
        -[FBKBugFormTableViewController answerDidChangeForQuestion:](self, "answerDidChangeForQuestion:", v44);
        goto LABEL_58;
      }
    }
    else
    {

    }
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "visibleQuestionForSectionIdentifier:itemIdentifier:", v12, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v20, "canDisplayChoicesInline") & 1) == 0)
    {
      Log_7();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v9;
        _os_log_impl(&dword_21D9A9000, v53, OS_LOG_TYPE_DEFAULT, "Tapped on Q&A with identifier [%@]", buf, 0xCu);
      }

      v51 = v28;
      if ((objc_msgSend(v51, "hasKeyboardFocus") & 1) == 0)
      {
        -[FBKBugFormTableViewController tableView](self, "tableView");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "endEditing:", 1);

      }
    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    switch(objc_msgSend(v20, "answerType"))
    {
      case 0:
      case 1:
        objc_msgSend(v52, "beginEditingQuestion");
        goto LABEL_47;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_45;
        break;
      case 3:
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && !self->_useInlineChoices)
LABEL_45:
            -[FBKBugFormTableViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBKBugFormDetailPresentation"), v52);
        }
        break;
      case 6:
        -[FBKBugFormTableViewController tableView](self, "tableView");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "endEditing:", 1);
        goto LABEL_48;
      case 11:
        -[FBKBugFormTableViewController launchModalViewWithModalQuestion:](self, "launchModalViewWithModalQuestion:", v20);
LABEL_47:
        -[FBKBugFormTableViewController tableView](self, "tableView");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "deselectRowAtIndexPath:animated:", v7, 1);
LABEL_48:

        break;
      default:
        break;
    }

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  if (!self->_disableAccountSwitching)
  {
    -[FBKBugFormTableViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "controller:didClickSwitchAccountsWithCurrentUser:", self, v16);

    -[FBKBugFormTableViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v7, 1);
LABEL_52:

  }
}

uint64_t __67__FBKBugFormTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (BOOL)_tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;

  v5 = a4;
  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifierForSectionContainingItemIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hasPrefix:", CFSTR("DeviceAttachmentsSectionType")))
  {
    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maybeAttachmentWithIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if ((objc_msgSend(v13, "canCancelAttachmentCollection:", v12) & 1) != 0)
      {
        v15 = 1;
LABEL_11:

        goto LABEL_12;
      }
      -[FBKBugFormTableViewController devicesController](self, "devicesController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "canDeleteAttachment:", v12);
    }
    else
    {
      objc_msgSend(v13, "maybeDeviceWithIdentifier:", v7);
      v16 = objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v15 = 0;
        v14 = 0;
        goto LABEL_11;
      }
      -[FBKBugFormTableViewController devicesController](self, "devicesController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "canRemoveDevice:", v16);
      v14 = (void *)v16;
    }

    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
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
  uint64_t v16;
  void *v17;

  v5 = a4;
  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifierForSectionContainingItemIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hasPrefix:", CFSTR("DeviceAttachmentsSectionType")))
  {
    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maybeAttachmentWithIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "trailingSwipeActionConfigurationWithAttachment:fromViewController:", v12, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "maybeDeviceWithIdentifier:", v7);
      v16 = objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[FBKBugFormTableViewController devicesController](self, "devicesController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "trailingSwipeActionConfigurationWithDevice:fromViewController:", v16, self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      v14 = (void *)v16;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)answerDidChangeForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "answerForQuestion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "shouldHaveChoices");
  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "role");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "values");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "Q: [%@] A: [%@]", (uint8_t *)&v17, 0x16u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[FBKBugFormTableViewController answerDidChangeForQuestion:].cold.1(v4, v6, v9);
  }

  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "validate:", 0);

  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didChangeAnswerToQuestion:", v4);

  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_msgSend(v15, "isDirty") & 1) != 0
     || -[FBKBugFormTableViewController isCaptiveModeEnabled](self, "isCaptiveModeEnabled");
  -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", v16);

  -[FBKBugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");
  if (-[FBKBugFormTableViewController isSubmissionPendingOnEnhancedLogging](self, "isSubmissionPendingOnEnhancedLogging"))
  {
    -[FBKBugFormTableViewController checkEnhancedLoggingAndSubmit](self, "checkEnhancedLoggingAndSubmit");
  }

}

- (void)editorDidDismissForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierForVisibleQuestion:hasAttemptedSubmission:", v4, -[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemIdentifier:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6
{
  +[FBKAddAttachmentsController handleErrorAttachingWithAttachment:viewController:devicesDiagnosticsController:error:](_TtC12FeedbackCore27FBKAddAttachmentsController, "handleErrorAttachingWithAttachment:viewController:devicesDiagnosticsController:error:", a4, self, a3, a6);
}

- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5
{
  +[FBKDevicePickerCoordinator showDevicePickerWithChoices:onViewController:completion:](_TtC12FeedbackCore26FBKDevicePickerCoordinator, "showDevicePickerWithChoices:onViewController:completion:", a4, self, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4
{
  +[FBKNoBugSessionAlertViewController showInController:forDevice:](_TtC12FeedbackCore34FBKNoBugSessionAlertViewController, "showInController:forDevice:", self, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 1, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevice:(id)a4
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 1, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 1, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 1, a4, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 1, a4, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5
{
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a4;
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
  if (objc_msgSend(v10, "state") == 2)
  {
    objc_msgSend(v10, "originalLocalFileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(v10, "fileComesFromFBK");

      if (v8)
      {
        -[FBKBugFormTableViewController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "controller:didAttachLocalFile:", self, v10);

      }
    }
  }

}

- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STARTING_BUG_SESSIONS"), &stru_24E15EAF8, CFSTR("CommonStrings"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController _showSpinnerWithStatus:userInteractionEnabled:](self, "_showSpinnerWithStatus:userInteractionEnabled:", v9, 1);

      goto LABEL_11;
    case 1:
      goto LABEL_6;
    case 2:
      Log_7();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Device Diagnostics matched no device", buf, 2u);
      }

LABEL_6:
      -[FBKBugFormTableViewController _stopSpinner](self, "_stopSpinner");
      break;
    case 3:
      v11 = objc_msgSend(v6, "filesBeingAttachedCount");
      if (v11 < 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("COPYING_FILES"), CFSTR("Attaching files"), 0);
      }
      else
      {
        v12 = v11;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Attaching %d files"), &stru_24E15EAF8, CFSTR("Plurals"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v12);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKBugFormTableViewController _showSpinnerWithStatus:userInteractionEnabled:](self, "_showSpinnerWithStatus:userInteractionEnabled:", v8, 1);
LABEL_11:

      break;
    default:
      break;
  }
  -[FBKBugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");

}

- (BOOL)shouldDisplayChangeButton
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL result;

  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "role");

  result = 0;
  if (v4 != 1)
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[FBKBugFormTableViewController hasCandidateStubs](self, "hasCandidateStubs");

      if (v7)
        return 1;
    }
  }
  return result;
}

- (void)didPressChangeBugForm:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FBKBugFormTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

  if (-[FBKBugFormTableViewController shouldDisplayChangeButton](self, "shouldDisplayChangeButton"))
    -[FBKBugFormTableViewController _showFormPickerWithSender:](self, "_showFormPickerWithSender:", v5);

}

- (void)_changeToBugFormStub:(id)a3 force:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teamFormStubMatchingFromFormStub:", v9);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v9;
  -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredTeamForStubPreferringTeam:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController _changeToBugFormStub:withTeam:force:](self, "_changeToBugFormStub:withTeam:force:", v6, v8, 1);

}

- (void)_reallyChangeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD aBlock[5];
  id v47;
  id v48;
  int v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[FBKBugFormTableViewController setPendingStub:](self, "setPendingStub:", 0);
  if (a5)
    goto LABEL_3;
  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
LABEL_3:
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");

    -[FBKBugFormTableViewController hideQuestions](self, "hideQuestions");
    Log_7();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      -[FBKBugFormTableViewController bugForm](self, "bugForm");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");
      objc_msgSend(v8, "ID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      v51 = v20;
      v52 = 1024;
      v53 = objc_msgSend(v21, "intValue");
      _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "Form Swap: changing from form [%i] to form [%i]", buf, 0xEu);

    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke;
    aBlock[3] = &unk_24E15AA20;
    aBlock[4] = self;
    v49 = v16;
    v47 = v8;
    v48 = v9;
    v22 = _Block_copy(aBlock);
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isDirty");

    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("PROMPT_DELETE_DRAFT"), &stru_24E15EAF8, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "fbaAlertControllerWithTitle:message:preferredStyle:", v40, 0, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = v9;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT_CHOICE"), &stru_24E15EAF8, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_151;
      v44[3] = &unk_24E15AA48;
      v44[4] = self;
      v30 = v22;
      v45 = v30;
      objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 2, v44);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "addAction:", v31);
      v32 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SAVE_DRAFT_CHOICE"), &stru_24E15EAF8, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_154;
      v42[3] = &unk_24E15AA48;
      v42[4] = self;
      v43 = v30;
      objc_msgSend(v32, "actionWithTitle:style:handler:", v34, 0, v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v41;
      objc_msgSend(v26, "addAction:", v35);
      -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);

    }
    else
    {
      Log_7();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        -[FBKBugFormTableViewController formResponse](self, "formResponse");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "intValue");
        *(_DWORD *)buf = 67109120;
        v51 = v39;
        _os_log_impl(&dword_21D9A9000, v36, OS_LOG_TYPE_INFO, "_changeToBugForm, deleting the unused FR %d", buf, 8u);

      }
      (*((void (**)(void *, uint64_t))v22 + 2))(v22, 1);
    }

  }
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  int v40;
  _QWORD v41[5];
  id v42;
  id v43;
  int v44;
  uint8_t buf[4];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "devicesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAttachments");

  objc_msgSend(*(id *)(a1 + 32), "formResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (!a2)
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_145;
    v36[3] = &unk_24E15A9F8;
    v40 = v11;
    v25 = *(void **)(a1 + 40);
    v37 = *(id *)(a1 + 32);
    v38 = v25;
    v39 = *(id *)(a1 + 48);
    objc_msgSend(v37, "saveDraftWithIsClosing:completion:", 1, v36);

    v24 = v38;
    goto LABEL_10;
  }
  +[FBKLog ded](FBKLog, "ded");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    v46 = v13;
    _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_INFO, "will delete all bug sessions for form [%i]", buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "devicesController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "abortAllSessions");

  LODWORD(v14) = objc_msgSend(*(id *)(a1 + 32), "showsDraftDeletionMessage");
  v15 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((_DWORD)v14)
    v18 = CFSTR("DELETING_DRAFT");
  else
    v18 = CFSTR("CLOSING_FEEDBACK_EDITOR");
  objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24E15EAF8, CFSTR("CommonStrings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "showSpinnerWithStatus:", v19);

  objc_msgSend(*(id *)(a1 + 32), "itemFromDraft");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemFromDraft");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_144;
    v41[3] = &unk_24E15A9F8;
    v44 = v11;
    v23 = *(void **)(a1 + 40);
    v41[4] = *(_QWORD *)(a1 + 32);
    v42 = v23;
    v43 = *(id *)(a1 + 48);
    objc_msgSend(v21, "deleteDraftFromContentItem:completion:", v22, v41);

    v24 = v42;
LABEL_10:

    return;
  }
  Log_7();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_cold_1(v11, v26, v27, v28, v29, v30, v31, v32);

  v34 = *(void **)(a1 + 32);
  v33 = *(void **)(a1 + 40);
  objc_msgSend(v33, "preferredTeamForStubPreferringTeam:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "loadNewResponseForBugFormStub:forTeam:", v33, v35);

}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_144(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (a2)
  {
    Log_7();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_144_cold_1((uint64_t)a1, v3, v4, v5, v6, v7, v8, v9);

  }
  v10 = (void *)a1[4];
  v11 = (void *)a1[5];
  objc_msgSend(v11, "preferredTeamForStubPreferringTeam:", a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadNewResponseForBugFormStub:forTeam:", v11, v12);

}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_145(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (a2)
  {
    Log_7();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_145_cold_1((uint64_t)a1, v3, v4, v5, v6, v7, v8, v9);

  }
  v10 = (void *)a1[4];
  v11 = (void *)a1[5];
  objc_msgSend(v11, "preferredTeamForStubPreferringTeam:", a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadNewResponseForBugFormStub:forTeam:", v11, v12);

}

uint64_t __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_151(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "formResponse");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v4, "intValue");
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "_changeToBugForm, deleting FR %d", (uint8_t *)v6, 8u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_154(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "formResponse");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v4, "intValue");
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "_changeToBugForm, saving FR %d", (uint8_t *)v6, 8u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_showFormPickerWithSender:(id)a3
{
  id v4;
  NSObject *v5;
  _TtC12FeedbackCore26FBKBugFormPickerController *v6;
  void *v7;
  _TtC12FeedbackCore26FBKBugFormPickerController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  Log_7();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Showing Form Picker from draft view", v13, 2u);
  }

  v6 = [_TtC12FeedbackCore26FBKBugFormPickerController alloc];
  -[FBKBugFormTableViewController candidateFormStubsPredicate](self, "candidateFormStubsPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FBKBugFormPickerController initWithStubsPredicate:](v6, "initWithStubsPredicate:", v7);

  -[FBKBugFormPickerController setPickerDelegate:](v8, "setPickerDelegate:", self);
  -[FBKBugFormTableViewController formStub](self, "formStub");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormPickerController setCurrentSelection:](v8, "setCurrentSelection:", v9);

  -[FBKBugFormPickerController setContext:](v8, "setContext:", 1);
  -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormPickerController setTeam:](v8, "setTeam:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  objc_msgSend(v11, "setModalPresentationStyle:", 7);
  objc_msgSend(v11, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPermittedArrowDirections:", 1);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "setBarButtonItem:", v4);
    }
    else
    {
      objc_msgSend(v12, "setSourceView:", v4);
      objc_msgSend(v4, "bounds");
      objc_msgSend(v12, "setSourceRect:");
    }
  }
  -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKBugFormTableViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__FBKBugFormTableViewController_bugFormPicker_didSelectBugFormStub___block_invoke;
    v10[3] = &unk_24E159BD0;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    -[FBKBugFormTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __68__FBKBugFormTableViewController_bugFormPicker_didSelectBugFormStub___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_changeToBugFormStub:force:", *(_QWORD *)(a1 + 32), 1);

}

- (void)bugFormPickerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  Log_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[FBKBugFormTableViewController bugFormPickerDidCancel:].cold.1(v4);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)teamPicker:(id)a3 didSelectTeam:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke;
  v9[3] = &unk_24E159BD0;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[FBKBugFormTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t v16[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v4 = (id *)(a1 + 32);
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "currentTeam");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
    {
      Log_7();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_INFO, "Selected the current team, not switching.", v16, 2u);
      }
    }
    else
    {
      v10 = *v4;
      v11 = objc_loadWeakRetained(v2);
      objc_msgSend(v11, "formStub");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "teamFormStubMatchingFromFormStub:", v12);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        Log_7();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke_cold_1(v2, v4, v13);

        v14 = objc_loadWeakRetained(v2);
        objc_msgSend(v14, "formStub");
        v9 = objc_claimAutoreleasedReturnValue();

      }
      v15 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "_changeToBugFormStub:withTeam:force:", v9, *v4, 1);

    }
  }
}

- (void)didTapLargeSubmitButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FBKBugFormTableViewController textViewFirstResponder](self, "textViewFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FBKBugFormTableViewController textViewFirstResponder](self, "textViewFirstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController textViewDidEndEditing:](self, "textViewDidEndEditing:", v5);

  }
  -[FBKBugFormTableViewController beginPresubmissionCheck:](self, "beginPresubmissionCheck:", v6);

}

- (void)beginPresubmissionCheck:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_activity_t v20;
  NSObject *v21;
  id v22;
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
  uint64_t *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  FBKBugFormTableViewController *v57;
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD block[4];
  id v61;
  FBKBugFormTableViewController *v62;
  id v63;
  os_activity_t v64;

  -[FBKBugFormTableViewController setAttemptedSubmission:](self, "setAttemptedSubmission:", 1);
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "validate:", 0);

  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
  -[FBKBugFormTableViewController submitButton](self, "submitButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTableFooterView:", 0);

  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unreachableDevicesInPlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) == 0)
  {
    -[FBKBugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");
    v23 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("MISSING_ANSWERS_TITLE"), &stru_24E15EAF8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MISSING_ANSWERS_MESSAGE"), &stru_24E15EAF8, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fbaAlertControllerWithTitle:message:preferredStyle:", v25, v27, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E15EAF8, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    v32 = v30;
    v33 = 0;
LABEL_7:
    objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 1, v33, v53, v54, v55, v56, v57);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v34);

    -[FBKBugFormTableViewController askDelegateToGoFullScreenIfNeeded](self, "askDelegateToGoFullScreenIfNeeded");
    -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
    goto LABEL_8;
  }
  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "collectsFiles") || !objc_msgSend(v11, "count"))
  {

LABEL_10:
    -[FBKBugFormTableViewController bugForm](self, "bugForm");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "collectsFiles") & 1) != 0)
    {
      -[FBKBugFormTableViewController devicesController](self, "devicesController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "hasUnmetRequirementAttachments");

      if (v37)
      {
        v38 = (void *)MEMORY[0x24BEBD3B0];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("MISSING_REQ_FILES"), &stru_24E15EAF8, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("MISSING_REQ_FILES_MESSAGE"), &stru_24E15EAF8, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "fbaAlertControllerWithTitle:message:preferredStyle:", v40, v42, 1);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        v43 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("GATHER_AND_SUBMIT"), &stru_24E15EAF8, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = MEMORY[0x24BDAC760];
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_177;
        v59[3] = &unk_24E15AA98;
        v59[4] = self;
        objc_msgSend(v43, "actionWithTitle:style:handler:", v45, 0, v59);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v47);

        v48 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("SUBMIT_WO_FILES"), &stru_24E15EAF8, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v46;
        v58[1] = 3221225472;
        v58[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_3;
        v58[3] = &unk_24E15AA98;
        v58[4] = self;
        objc_msgSend(v48, "actionWithTitle:style:handler:", v50, 0, v58);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v51);

        v52 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("BACK_TO_DRAFT"), &stru_24E15EAF8, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v46;
        v54 = 3221225472;
        v55 = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_180;
        v56 = &unk_24E15AA98;
        v57 = self;
        v33 = &v53;
        v31 = v52;
        v32 = v30;
        goto LABEL_7;
      }
    }
    else
    {

    }
    -[FBKBugFormTableViewController checkLegalAndSubmit](self, "checkLegalAndSubmit");
    goto LABEL_15;
  }
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "matcherPredicates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_10;
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NOT_REACHABLE_SUBMIT_MESSAGE_NO_DEVICE_NAME"), &stru_24E15EAF8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = _os_activity_create(&dword_21D9A9000, "Submission on non reachable device", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke;
  block[3] = &unk_24E158348;
  v61 = v11;
  v62 = self;
  v63 = v19;
  v64 = v20;
  v21 = v20;
  v22 = v19;
  os_activity_apply(v21, block);

LABEL_8:
LABEL_15:

}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id WeakRetained;
  uint64_t location;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v41;
    location = 138543618;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v41 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        +[FBKLog ded](FBKLog, "ded", location);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "publicLogDescription");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "formResponse");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "ID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "intValue");
          *(_DWORD *)buf = location;
          v45 = v7;
          v46 = 1024;
          v47 = v10;
          _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "tried to submit on non reachable device [%{public}@] FR [%i]", buf, 0x12u);

        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v2);
  }

  v11 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MISSING_REQ_FILES"), &stru_24E15EAF8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fbaAlertControllerWithTitle:message:preferredStyle:", v13, *(_QWORD *)(a1 + 48), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E15EAF8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v18 = (void *)MEMORY[0x24BEBD3A8];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_166;
  v37[3] = &unk_24E15AA70;
  v38 = *(id *)(a1 + 56);
  objc_copyWeak(&v39, (id *)buf);
  objc_msgSend(v18, "actionWithTitle:style:handler:", v16, 1, v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SAVE_DRAFT"), &stru_24E15EAF8, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BEBD3A8];
  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_169;
  v34[3] = &unk_24E15AA70;
  v35 = *(id *)(a1 + 56);
  objc_copyWeak(&v36, (id *)buf);
  objc_msgSend(v22, "actionWithTitle:style:handler:", v21, 0, v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v23);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SUBMIT_WO_FILES"), &stru_24E15EAF8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BEBD3A8];
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_172;
  v31[3] = &unk_24E15AA70;
  v32 = *(id *)(a1 + 56);
  objc_copyWeak(&v33, (id *)buf);
  objc_msgSend(v26, "actionWithTitle:style:handler:", v25, 0, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v27);

  objc_msgSend(*(id *)(a1 + 40), "askDelegateToGoFullScreenIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)buf);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v14, 1, 0);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);

}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_166(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v10);
  +[FBKLog ded](FBKLog, "ded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "formResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");
    *(_DWORD *)buf = 67109120;
    v12 = v8;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Tapped [Cancel] for missing devices for FR [%i]", buf, 8u);

  }
  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "updateSubmitButtonState");

  os_activity_scope_leave(&v10);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_169(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v10);
  +[FBKLog ded](FBKLog, "ded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "formResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");
    *(_DWORD *)buf = 67109120;
    v12 = v8;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Tapped [Save] for missing devices for FR [%i]", buf, 8u);

  }
  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "closeWithCompletion:", 0);

  os_activity_scope_leave(&v10);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v18);
  +[FBKLog ded](FBKLog, "ded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "formResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");
    *(_DWORD *)buf = 67109120;
    v20 = v8;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Tapped [Without Files] for FR [%i]", buf, 8u);

  }
  v9 = (id *)(a1 + 40);
  v10 = objc_loadWeakRetained(v9);
  objc_msgSend(v10, "formResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bugForm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "questionWithRole:", CFSTR(":required_file_zone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v9);
  objc_msgSend(v14, "formResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "answerForQuestion:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setOptedOut:", 1);
  v17 = objc_loadWeakRetained(v9);
  objc_msgSend(v17, "checkLegalAndSubmit");

  os_activity_scope_leave(&v18);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_177(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2;
  block[3] = &unk_24E156D78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "devicesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "answersDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gatherAllMissingRequirementsWithAnswers:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "checkLegalAndSubmit");
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "formResponse");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v4, "intValue");
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Presubmission: chose to submit without files for FR [%d]", (uint8_t *)v10, 8u);

  }
  objc_msgSend(*(id *)(a1 + 32), "formResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bugForm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "questionWithRole:", CFSTR(":required_file_zone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "formResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "answerForQuestion:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setOptedOut:", 1);
  objc_msgSend(*(id *)(a1 + 32), "checkLegalAndSubmit");

}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_180(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2_181;
  block[3] = &unk_24E156D78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2_181(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD15D8];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForRow:inSection:", 0, objc_msgSend(v3, "numberOfSections") - 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 1, 1);

  objc_msgSend(*(id *)(a1 + 32), "updateSubmitButtonState");
}

- (void)checkLegalAndSubmit
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "collectsFiles") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("FBKSuppressPrivacyNotice"));

    if ((v5 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SUBMISSION_PII_TITLE"), &stru_24E15EAF8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SUBMISSION_PII_MESSAGE"), &stru_24E15EAF8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fbaAlertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E15EAF8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke;
      v22[3] = &unk_24E15AA98;
      v22[4] = self;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v16);

      v17 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SUBMIT_BUTTON"), &stru_24E15EAF8, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke_2;
      v21[3] = &unk_24E15AA98;
      v21[4] = self;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v20);

      -[FBKBugFormTableViewController askDelegateToGoFullScreenIfNeeded](self, "askDelegateToGoFullScreenIfNeeded");
      -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

      return;
    }
  }
  else
  {

  }
  -[FBKBugFormTableViewController checkEnhancedLoggingAndSubmit](self, "checkEnhancedLoggingAndSubmit");
}

uint64_t __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke(uint64_t a1)
{
  void *v2;

  +[FBKSharedConstants sharedUserDefaults](iFBKConstants, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("FBKSuppressPrivacyNotice"));

  return objc_msgSend(*(id *)(a1 + 32), "updateSubmitButtonState");
}

uint64_t __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke_2(uint64_t a1)
{
  void *v2;

  +[FBKSharedConstants sharedUserDefaults](iFBKConstants, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("FBKSuppressPrivacyNotice"));

  return objc_msgSend(*(id *)(a1 + 32), "checkEnhancedLoggingAndSubmit");
}

- (void)checkEnhancedLoggingAndSubmit
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 67109120;
    LODWORD(v13) = objc_msgSend(v5, "intValue");
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_INFO, "Checking EL before submission on FR: %d", (uint8_t *)&v12, 8u);

  }
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unansweredRequiredModalQuestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Log_7();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "valueForKeyPath:", CFSTR("tat"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "Found unanswered modal questions [%{public}@]. Showing [%{public}@]", (uint8_t *)&v12, 0x16u);

    }
    -[FBKBugFormTableViewController setIsSubmissionPendingOnEnhancedLogging:](self, "setIsSubmissionPendingOnEnhancedLogging:", 1);
    -[FBKBugFormTableViewController askDelegateToGoFullScreenIfNeeded](self, "askDelegateToGoFullScreenIfNeeded");
    -[FBKBugFormTableViewController launchModalViewWithModalQuestion:](self, "launchModalViewWithModalQuestion:", v8);

  }
  else
  {
    -[FBKBugFormTableViewController setIsSubmissionPendingOnEnhancedLogging:](self, "setIsSubmissionPendingOnEnhancedLogging:", 0);
    -[FBKBugFormTableViewController submit](self, "submit");
  }

}

- (void)submit
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  FBKBugFormTableViewController *v33;
  id v34;
  id v35;
  uint8_t *v36;
  unsigned int v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t *v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v5, "intValue");
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_INFO, "Starting submit for FR %d", buf, 8u);

  }
  -[FBKBugFormTableViewController unregisterApplicationNotifications](self, "unregisterApplicationNotifications");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUBMITTING_FEEDBACK"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v7);

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x2020000000;
  v46 = 0;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __39__FBKBugFormTableViewController_submit__block_invoke;
  v39[3] = &unk_24E159B80;
  v13 = v10;
  v40 = v13;
  v14 = v8;
  v41 = v14;
  v42 = buf;
  v15 = objc_msgSend(v11, "beginBackgroundTaskWithName:expirationHandler:", v12, v39);

  *((_QWORD *)v44 + 3) = v15;
  -[FBKBugFormTableViewController hideAllCells](self, "hideAllCells");
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIsSubmitting:", 1);

  -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  if (+[FBKSharedConstants usesTemporaryDraftsDirectory](FBKSharedConstants, "usesTemporaryDraftsDirectory"))
  {
    objc_msgSend(v16, "currentDeviceAttachmentManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileCollector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "saveDraftsDirectory");

  }
  -[FBKBugFormTableViewController formIdentifier](self, "formIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "role") == 1;

  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "surveyContentItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[FBKBugFormTableViewController whooshSoundID](self, "whooshSoundID");
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __39__FBKBugFormTableViewController_submit__block_invoke_197;
  v31[3] = &unk_24E15AB38;
  v28 = v14;
  v36 = buf;
  v32 = v28;
  v33 = self;
  v29 = v20;
  v34 = v29;
  v38 = v22;
  v37 = v25;
  v30 = v24;
  v35 = v30;
  objc_msgSend(v26, "beginSubmissionForFormResponse:withCollector:completion:", v27, v16, v31);

  _Block_object_dispose(buf, 8);
}

uint64_t __39__FBKBugFormTableViewController_submit__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __39__FBKBugFormTableViewController_submit__block_invoke_cold_1(a1, v2);

  result = objc_msgSend(*(id *)(a1 + 40), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *MEMORY[0x24BEBE030];
  return result;
}

void __39__FBKBugFormTableViewController_submit__block_invoke_197(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  SystemSoundID v19;
  __CFRunLoop *Main;
  void *v21;
  id v22;
  uint64_t v23;
  void (**v24)(_QWORD);
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  char v41;
  id location;
  _QWORD v43[5];
  id v44;
  id v45;
  char v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *MEMORY[0x24BEBE030];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GENERIC_SUBMIT_ERROR_TITLE"), &stru_24E15EAF8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GENERIC_SUBMIT_ERROR_MESSAGE"), &stru_24E15EAF8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    Log_7();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __39__FBKBugFormTableViewController_submit__block_invoke_197_cold_1(a1, v8);

    objc_msgSend(MEMORY[0x24BEBD3B0], "fbaAlertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E15EAF8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __39__FBKBugFormTableViewController_submit__block_invoke_202;
    v43[3] = &unk_24E15AAE8;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = a1 + 40;
    v43[4] = v14;
    v44 = v3;
    v45 = *(id *)(v13 + 8);
    v46 = *(_BYTE *)(v13 + 36);
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v43);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15);

    objc_msgSend(*(id *)v13, "askDelegateToGoFullScreenIfNeeded");
    objc_msgSend(*(id *)v13, "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_stopSpinner");
    Log_7();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "formResponse");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      LODWORD(v48) = objc_msgSend(v18, "intValue");
      _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_INFO, "Submission callback for FR %d: success", buf, 8u);

    }
    v19 = *(_DWORD *)(a1 + 72);
    if (v19)
    {
      Main = CFRunLoopGetMain();
      AudioServicesAddSystemSoundCompletion(v19, Main, 0, (AudioServicesSystemSoundCompletionProc)didFinishPlayingWhooshSound, 0);
      AudioServicesPlaySystemSound(*(_DWORD *)(a1 + 72));
    }
    objc_msgSend(*(id *)(a1 + 40), "setIsBeingDismissedBySelf:", 1);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "controllerWillFinishSubmission:", *(_QWORD *)(a1 + 40));

    objc_initWeak(&location, *(id *)(a1 + 40));
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = __39__FBKBugFormTableViewController_submit__block_invoke_204;
    v36 = &unk_24E15AB10;
    objc_copyWeak(&v40, &location);
    v22 = *(id *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 40);
    v37 = v22;
    v38 = v23;
    v41 = *(_BYTE *)(a1 + 76);
    v39 = *(id *)(a1 + 56);
    v24 = (void (**)(_QWORD))_Block_copy(&v33);
    Log_7();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "formResponse", v33, v34, v35, v36, v37, v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_impl(&dword_21D9A9000, v25, OS_LOG_TYPE_DEFAULT, "Submitted [ FB%{public}@ ]", buf, 0xCu);

    }
    v29 = objc_msgSend(*(id *)(a1 + 40), "submissionStyle");
    if (v29)
    {
      if (v29 == 1)
      {
        Log_7();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21D9A9000, v32, OS_LOG_TYPE_DEFAULT, "Showing submission alert with options", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "askDelegateToGoFullScreenIfNeeded");
        objc_msgSend(*(id *)(a1 + 40), "showSubmissionAlertWithCompletion:", v24);
      }
      else if (v29 == 2)
      {
        Log_7();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21D9A9000, v30, OS_LOG_TYPE_DEFAULT, "Submission complete (not showing any confirmation UI)", buf, 2u);
        }

        v24[2](v24);
      }
    }
    else
    {
      Log_7();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v31, OS_LOG_TYPE_DEFAULT, "Showing thank you alert view", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "askDelegateToGoFullScreenIfNeeded");
      objc_msgSend(*(id *)(a1 + 40), "showThankYouAlertWithCompletion:", v24);
    }

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

}

void __39__FBKBugFormTableViewController_submit__block_invoke_202(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__FBKBugFormTableViewController_submit__block_invoke_2;
  v8[3] = &unk_24E15AAC0;
  v9 = *(id *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "closeWithError:completion:", v5, v8);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __39__FBKBugFormTableViewController_submit__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  +[FBKTargetedSurvey didFinishSubmissionWithFormIdentifier:feedbackId:isSurvey:error:](_TtC12FeedbackCore17FBKTargetedSurvey, "didFinishSubmissionWithFormIdentifier:feedbackId:isSurvey:error:", *(_QWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 64))
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "bugForm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "surveyContentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deleteTargetedSurveyItemFromInboxIfNeeded:", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setIsBeingDismissedBySelf:", 1);

  v8 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v6, "controller:didFinishSubmissionWithError:", v7, *(_QWORD *)(a1 + 40));

}

void __39__FBKBugFormTableViewController_submit__block_invoke_204(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setDevicesController:", 0);

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "formResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKTargetedSurvey didFinishSubmissionWithFormIdentifier:feedbackId:isSurvey:error:](_TtC12FeedbackCore17FBKTargetedSurvey, "didFinishSubmissionWithFormIdentifier:feedbackId:isSurvey:error:", v4, v7, *(unsigned __int8 *)(a1 + 64), 0);

  if (*(_BYTE *)(a1 + 64))
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteTargetedSurveyItemFromInboxIfNeeded:", *(_QWORD *)(a1 + 48));

  }
  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "controller:didFinishSubmissionWithError:", v10, 0);

}

- (id)formIdentifier
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;

  -[FBKBugFormTableViewController bugForm](self, "bugForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "surveyContentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "formTat");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !-[__CFString length](v5, "length"))
  {
    -[FBKBugFormTableViewController formStub](self, "formStub");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tat");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v8;
  }
  v9 = &stru_24E15EAF8;
  if (v6)
    v9 = v6;
  v10 = v9;

  return v10;
}

- (void)showSubmissionAlertWithCompletion:(id)a3
{
  id v4;
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
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Feedback Sent"), CFSTR("Feedback Sent"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Thank you for sending your feedback to Apple. You can view the status of your report in Feedback Assistant."), CFSTR("Thank you for sending your feedback to Apple. You can view the status of your report in Feedback Assistant."), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "fbaAlertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKLaunchAction urlSchemeForFeedbackID:](FBKLaunchAction, "urlSchemeForFeedbackID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FBKBugFormTableViewController canOpenFeedbackInFBA](self, "canOpenFeedbackInFBA"))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "canOpenURL:", v14);

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Open Feedback Assistant"), CFSTR("Open Feedback Assistant"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v4;
      v18 = (void *)MEMORY[0x24BEBD3A8];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke;
      v30[3] = &unk_24E15AB60;
      v19 = v27;
      v32 = v19;
      v31 = v14;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v26, 0, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v20);

      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BEBD3A8];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke_2;
      v28[3] = &unk_24E15AB88;
      v29 = v19;
      v24 = v23;
      v4 = v27;
      objc_msgSend(v24, "actionWithTitle:style:handler:", v22, 1, v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v25);

    }
  }
  -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

void __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:withCompletionHandler:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showThankYouAlertWithCompletion:(id)a3
{
  id v4;
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
  int v16;
  dispatch_time_t v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  int v23;

  v4 = a3;
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("THANK_YOU"), &stru_24E15EAF8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("THANK_YOU_MESSAGE"), &stru_24E15EAF8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fbaAlertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "hasAttachmentsCollecting"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("THANK_YOU_SUBMITTING_MESSAGE"), &stru_24E15EAF8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessage:", v13);

  }
  -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  -[FBKBugFormTableViewController formResponse](self, "formResponse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  v17 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke;
  block[3] = &unk_24E15ABD8;
  v23 = v16;
  v21 = v11;
  v22 = v4;
  v18 = v4;
  v19 = v11;
  dispatch_after(v17, MEMORY[0x24BDAC9B8], block);

}

void __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  int v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke_2;
  v2[3] = &unk_24E15ABB0;
  v4 = *(_DWORD *)(a1 + 48);
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v2);

}

uint64_t __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "did dismiss feedback draft editor for form %d", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _DWORD v40[2];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("FBKBugFormDetailPresentation"));

  if (v9)
  {
    objc_msgSend(v6, "destinationViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "question");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "answerForQuestion:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnswer:", v14);

    objc_msgSend(v11, "setQuestion:", v12);
    objc_msgSend(v11, "setDelegate:", self);
    Log_7();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "ID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = 67109120;
      v40[1] = objc_msgSend(v16, "unsignedIntValue");
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "will show choices for question [%u]", (uint8_t *)v40, 8u);

    }
    -[FBKBugFormTableViewController traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "horizontalSizeClass");
    objc_msgSend(v6, "destinationViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 == 1)
      v21 = 2;
    else
      v21 = 7;
    objc_msgSend(v19, "setModalPresentationStyle:", v21);

    objc_msgSend(v6, "destinationViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTransitioningDelegate:", self);

    objc_msgSend(v6, "destinationViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = v7;
      objc_msgSend(v6, "destinationViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "popoverPresentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSourceView:", v25);

      objc_msgSend(v25, "bounds");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;

      objc_msgSend(v6, "destinationViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "popoverPresentationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSourceRect:", v29, v31, v33, v35);

      objc_msgSend(v6, "destinationViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "popoverPresentationController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setPermittedArrowDirections:", 0);

    }
  }

}

- (void)didTapDevice:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  +[FBKLog ded](FBKLog, "ded");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FBKBugFormTableViewController didTapDevice:indexPath:].cold.1((uint64_t)v6, v8, v9);

  -[FBKBugFormTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)didTapAttachment:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Tapped on attachment [%{public}@]", (uint8_t *)&v17, 0xCu);

  }
  -[FBKBugFormTableViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endEditing:", 1);

  if (objc_msgSend(v6, "canStartGathering"))
  {
    -[FBKBugFormTableViewController devicesController](self, "devicesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "answersDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gatherAttachment:answers:", v6, v13);

    -[FBKBugFormTableViewController updateUI:canDismissKeyboard:withCompletion:](self, "updateUI:canDismissKeyboard:withCompletion:", 0, 1, 0);
  }
  else if (objc_msgSend(v6, "isReadyToDisplayContents"))
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Will show attachment contents for [%{public}@]", (uint8_t *)&v17, 0xCu);

    }
    if (self->_alternateImagePreviewEnabled)
      -[UITableViewController presentAttachmentWithImagePush:fromIndexPath:](self, "presentAttachmentWithImagePush:fromIndexPath:", v6, v7);
    else
      -[UITableViewController presentAttachment:fromIndexPath:](self, "presentAttachment:fromIndexPath:", v6, v7);
  }
  -[FBKBugFormTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)registerApplicationNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  id location;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_saveFormForResigningActive_, *MEMORY[0x24BEBE010], 0);

  objc_initWeak(&location, self);
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__FBKBugFormTableViewController_registerApplicationNotifications__block_invoke;
  v10[3] = &unk_24E15AC00;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("FBKDidRefreshFormStubsNotification"), 0, v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController setDidRefreshFormStubsNotificationObserver:](self, "setDidRefreshFormStubsNotificationObserver:", v7);

  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "Registered for application state notifications", v9, 2u);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __65__FBKBugFormTableViewController_registerApplicationNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateCachedCandidateStubsCount");

}

- (void)unregisterApplicationNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  Log_7();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_INFO, "Unregistering for application state notifications", v9, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE010], 0);

  -[FBKBugFormTableViewController didRefreshFormStubsNotificationObserver](self, "didRefreshFormStubsNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController didRefreshFormStubsNotificationObserver](self, "didRefreshFormStubsNotificationObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v8);

  }
}

- (void)saveFormForResigningActive:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = _os_activity_create(&dword_21D9A9000, "Resign Active Save", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FBKBugFormTableViewController_saveFormForResigningActive___block_invoke;
  block[3] = &unk_24E156D78;
  block[4] = self;
  os_activity_apply(v4, block);

}

void __60__FBKBugFormTableViewController_saveFormForResigningActive___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "Resigning active: Saving form.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "superviewWithClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "saveAnswer");
      Log_7();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "Found and saved in-progress answer.", v8, 2u);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controllerWillResignFirstActive:", *(_QWORD *)(a1 + 32));

}

- (void)registerForKeyboardNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWasShown_, *MEMORY[0x24BEBE448], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardDidHide_, *MEMORY[0x24BEBE440], 0);

}

- (void)unregisterForKeyboardNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE448], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE440], 0);

}

- (void)keyboardWasShown:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[FBKBugFormTableViewController keyboardWasShown:]";
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "%s: keyboardFrame.size.height: %f", (uint8_t *)&v9, 0x16u);
  }

  -[FBKBugFormTableViewController setKeyboardHeight:](self, "setKeyboardHeight:", v7);
}

- (void)keyboardDidHide:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  Log_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[FBKBugFormTableViewController keyboardDidHide:]";
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[FBKBugFormTableViewController setKeyboardHeight:](self, "setKeyboardHeight:", 0.0);
}

- (BOOL)showsDraftDeletionMessage
{
  return !-[FBKBugFormTableViewController alwaysDeletesDrafts](self, "alwaysDeletesDrafts");
}

- (id)legalText
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  -[FBKBugFormTableViewController localizedAttributedLegalString](self, "localizedAttributedLegalString");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FBKBugFormTableViewController localizedAttributedLegalString](self, "localizedAttributedLegalString"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    if (legalText_onceToken != -1)
      dispatch_once(&legalText_onceToken, &__block_literal_global_226);
    -[FBKBugFormTableViewController localizedAttributedLegalString](self, "localizedAttributedLegalString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKBugFormTableViewController localizedAttachmentLegalText](self, "localizedAttachmentLegalText");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          -[FBKBugFormTableViewController localizedAttachmentLegalText](self, "localizedAttachmentLegalText"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v9,
          v11))
    {
      if (legalText_onceToken_227 != -1)
        dispatch_once(&legalText_onceToken_227, &__block_literal_global_229);
      v12 = objc_alloc(MEMORY[0x24BDD1458]);
      -[FBKBugFormTableViewController localizedAttachmentLegalText](self, "localizedAttachmentLegalText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v12, "initWithString:", v13);

    }
    else
    {
      v14 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHORT_SUBMISSION_PII_MESSAGE"), &stru_24E15EAF8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v14, "initWithString:", v16);

    }
  }
  return v7;
}

void __42__FBKBugFormTableViewController_legalText__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  +[FBKLog appHandle](FBKLog, "appHandle");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_DEFAULT, "Using attributed string attachment legal text", v1, 2u);
  }

}

void __42__FBKBugFormTableViewController_legalText__block_invoke_228()
{
  NSObject *v0;
  uint8_t v1[16];

  +[FBKLog appHandle](FBKLog, "appHandle");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_DEFAULT, "Using alternate attachment legal text", v1, 2u);
  }

}

- (id)alertControllerForDismissWithLaunchAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
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
  uint64_t v34;
  void *v35;
  _QWORD v36[5];
  char v37;
  char v38;
  _QWORD v39[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PROMPT_DELETE_DRAFT"), &stru_24E15EAF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fbaAlertControllerWithTitle:message:preferredStyle:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isUnauthenticatedUser");

  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SAVE_DRAFT_CHOICE"), &stru_24E15EAF8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke;
  v39[3] = &unk_24E15AA98;
  v39[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v39);
  v34 = objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v4, "isCaptive");
  v17 = objc_msgSend(v4, "shouldMakeFBAVisible");
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "feedbackCoreFramework");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("DELETE");
    v21 = CFSTR("Delete");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("DELETE_DRAFT_CHOICE");
    v21 = &stru_24E15EAF8;
  }
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, v21, 0, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v15;
  v36[1] = 3221225472;
  v36[2] = __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_2;
  v36[3] = &unk_24E15AC88;
  v37 = v16;
  v36[4] = self;
  v38 = v17;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v22, 2, v36);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E15EAF8, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, &__block_literal_global_243);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v23);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v8, "addAction:", v27);
    objc_msgSend(MEMORY[0x24BDD1488], "feedbackCoreFramework");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CLOSE_DRAFT_PROMPT_NO_SAVE"), CFSTR("Do you want to delete this feedback report?"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v29);

    objc_msgSend(MEMORY[0x24BDD1488], "feedbackCoreFramework");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CLOSE_DRAFT_MESSAGE_NO_SAVE"), CFSTR("Your responses will be deleted and will not be sent to Apple."), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMessage:", v31);

    v32 = v35;
  }
  else
  {
    v32 = v35;
    if (!v4 || (objc_msgSend(v4, "isCaptive") & 1) == 0)
      objc_msgSend(v8, "addAction:", v35);
    objc_msgSend(v8, "addAction:", v27);
  }

  return v8;
}

uint64_t __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeDraftAndDelete:withError:completion:", 0, 0, 0);
}

void __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD *v9;
  _QWORD v10[4];
  char v11;
  uint8_t buf[16];

  v3 = a2;
  if (!*(_BYTE *)(a1 + 40))
  {
    v8 = *(void **)(a1 + 32);
    v9 = 0;
LABEL_8:
    objc_msgSend(v8, "closeDraftAndDelete:withError:completion:", 1, 0, v9);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_240;
    v10[3] = &__block_descriptor_33_e5_v8__0l;
    v11 = *(_BYTE *)(a1 + 41);
    v9 = v10;
    goto LABEL_8;
  }
  Log_7();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "Unit test in progress, cannot log out.", buf, 2u);
  }

LABEL_9:
}

uint64_t __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_240(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  Log_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Draft deleted, exiting restricted mode.", v4, 2u);
  }

  return +[iFBKUtils exitCaptiveModeRemovingFromHomeScreen:](iFBKUtils, "exitCaptiveModeRemovingFromHomeScreen:", *(unsigned __int8 *)(a1 + 32));
}

- (void)dismiss:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[FBKBugFormTableViewController alwaysDeletesDrafts](self, "alwaysDeletesDrafts"))
  {
    v5 = 0;
  }
  else
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDirty") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[FBKBugFormTableViewController launchAction](self, "launchAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isCaptive");

    }
  }
  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDirty");
    -[FBKBugFormTableViewController launchAction](self, "launchAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136447234;
    v18 = "-[FBKBugFormTableViewController dismiss:]";
    v19 = 1024;
    v20 = v10;
    v21 = 1024;
    v22 = objc_msgSend(v11, "isCaptive");
    v23 = 1024;
    v24 = -[FBKBugFormTableViewController alwaysDeletesDrafts](self, "alwaysDeletesDrafts");
    v25 = 1024;
    v26 = v5;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s, self.draftingController.isDirty [%i] self.launchAction.isCaptive [%i] self.alwaysDeletesDrafts [%i], shouldPromptToSave [%i]", (uint8_t *)&v17, 0x24u);

  }
  Log_7();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "User is dismissing draft. Will prompt for confirmation", (uint8_t *)&v17, 2u);
    }

    -[FBKBugFormTableViewController askDelegateToGoFullScreenIfNeeded](self, "askDelegateToGoFullScreenIfNeeded");
    -[FBKBugFormTableViewController launchAction](self, "launchAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController alertControllerForDismissWithLaunchAction:](self, "alertControllerForDismissWithLaunchAction:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBarButtonItem:", v4);

    -[FBKBugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
  }
  else
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "User is dismissing draft. Will close and delete", (uint8_t *)&v17, 2u);
    }

    -[FBKBugFormTableViewController closeDraftAndDelete:withError:completion:](self, "closeDraftAndDelete:withError:completion:", 1, 0, 0);
  }

}

- (void)hideQuestions
{
  -[FBKBugFormTableViewController setShouldHideQuestions:](self, "setShouldHideQuestions:", 1);
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)showQuestions
{
  -[FBKBugFormTableViewController setShouldHideQuestions:](self, "setShouldHideQuestions:", 0);
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)hideAllCells
{
  -[FBKBugFormTableViewController setShouldHideAllCells:](self, "setShouldHideAllCells:", 1);
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)_showSpinnerWithStatus:(id)a3 userInteractionEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  Log_7();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v9;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "feedback editor for form [%li] change to state [%{public}@]", (uint8_t *)&v10, 0x16u);

  }
  -[UIViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v6, v4);

}

- (void)showSpinnerWithStatus:(id)a3
{
  -[FBKBugFormTableViewController _showSpinnerWithStatus:userInteractionEnabled:](self, "_showSpinnerWithStatus:userInteractionEnabled:", a3, 0);
}

- (void)_stopSpinner
{
  -[UIViewController hideSpinner](self, "hideSpinner");
  -[FBKBugFormTableViewController _showInternalToolbarIfNeeded](self, "_showInternalToolbarIfNeeded");
}

- (void)_showInternalToolbarIfNeeded
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_opt_new();
  if (FBKIsInternalInstall(v12, v3))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("showsAutoFillButton"));

    if (v5)
    {
      -[FBKBugFormTableViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setToolbarHidden:animated:", 0, 1);

      v7 = objc_alloc(MEMORY[0x24BEBD410]);
      LocalizationNotNeeded(CFSTR("Fill in all answers"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 0, self, sel_fillInAnswers);

      objc_msgSend(v12, "addObject:", v9);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      objc_msgSend(v12, "addObject:", v10);

    }
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormTableViewController setToolbarItems:](self, "setToolbarItems:", v11);

    }
  }

}

- (void)updateSubmitButtonState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "state"))
  {

    goto LABEL_8;
  }
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if (v7 == 3)
  {
LABEL_8:
    -[FBKBugFormTableViewController submitButton](self, "submitButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", 0);

    -[FBKBugFormTableViewController tableView](self, "tableView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTableFooterView:", 0);
    goto LABEL_15;
  }
LABEL_4:
  if (self->_attemptedSubmission)
  {
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "validate:", 0);
    -[FBKBugFormTableViewController submitButton](self, "submitButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", v9);

    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "validate:", 0);
    if (v12)
    {
      -[FBKBugFormTableViewController submitButtonLarge](self, "submitButtonLarge");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[FBKBugFormTableViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTableFooterView:", v13);

    if (v12)
    -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leftBarButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", 1);
  }
  else
  {
    -[FBKBugFormTableViewController submitButton](self, "submitButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 1);

    -[FBKBugFormTableViewController submitButtonLarge](self, "submitButtonLarge");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormTableViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTableFooterView:", v18);
  }

LABEL_15:
}

- (BOOL)hasFileArea
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBKBugFormTableViewController bugForm](self, "bugForm", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "questionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isFileCollectionGroup") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)shouldShowFormPicker
{
  void *v3;
  BOOL v4;

  if (!-[FBKBugFormTableViewController canShowTopicPicker](self, "canShowTopicPicker"))
    return 0;
  -[FBKBugFormTableViewController formStub](self, "formStub");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldShowTeamPicker
{
  void *v3;
  void *v4;
  char v5;

  if (!-[FBKBugFormTableViewController canShowTeamPicker](self, "canShowTeamPicker")
    || !-[FBKBugFormTableViewController shouldShowFormPicker](self, "shouldShowFormPicker"))
  {
    return 0;
  }
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasManagedTeams");

  return v5;
}

- (NSString)teamPickerRowIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController formStub](self, "formStub");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "teamsMatchingFormID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%i"), v5, v7, (unint64_t)objc_msgSend(v9, "count") > 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)topicPickerRowIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKBugFormTableViewController formStub](self, "formStub");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_24E15EAF8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu"), v7, -[FBKBugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)shouldShowForm
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[FBKBugFormTableViewController shouldHideQuestions](self, "shouldHideQuestions"))
    return 0;
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isLoading") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[FBKBugFormTableViewController formResponse](self, "formResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

  }
  return v3;
}

- (BOOL)shouldShowAttachments
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[FBKBugFormTableViewController shouldShowForm](self, "shouldShowForm");
  if (v3)
  {
    -[FBKBugFormTableViewController bugForm](self, "bugForm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "collectsFiles");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (_TtC12FeedbackCore27FBKAddAttachmentsController)addAttachmentsController
{
  _TtC12FeedbackCore27FBKAddAttachmentsController *addAttachmentsController;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v4;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v5;

  addAttachmentsController = self->_addAttachmentsController;
  if (!addAttachmentsController)
  {
    v4 = -[FBKAddAttachmentsController initWithDelegate:supportsDragAndDrop:]([_TtC12FeedbackCore27FBKAddAttachmentsController alloc], "initWithDelegate:supportsDragAndDrop:", self, -[FBKBugFormTableViewController allowsAttachmentDragAndDrop](self, "allowsAttachmentDragAndDrop"));
    v5 = self->_addAttachmentsController;
    self->_addAttachmentsController = v4;

    addAttachmentsController = self->_addAttachmentsController;
  }
  return addAttachmentsController;
}

- (void)updateCachedCandidateStubsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController candidateFormStubsPredicate](self, "candidateFormStubsPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController currentTeam](self, "currentTeam");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bugFormStubsForPickerWithPredicate:team:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController setCachedCandidateStubsCount:](self, "setCachedCandidateStubsCount:", objc_msgSend(v7, "count"));

  Log_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = -[FBKBugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount");
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Draft has [%lu] candidate stubs", (uint8_t *)&v9, 0xCu);
  }

  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)fillInAnswers
{
  id v3;

  -[FBKBugFormTableViewController setAttemptedSubmission:](self, "setAttemptedSubmission:", 1);
  -[FBKBugFormTableViewController draftingController](self, "draftingController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automaticallyFillInAllAnswers");

}

- (id)currentTeam
{
  void *v2;
  void *v3;

  -[FBKBugFormTableViewController itemFromDraft](self, "itemFromDraft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)textViewDidBeginEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[FBKBugFormTableViewController setTextViewFirstResponder:](self, "setTextViewFirstResponder:", v13);
  objc_msgSend(v13, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "setShowError:", 0);
    -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  }
  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController setCancelBarButtonItem:](self, "setCancelBarButtonItem:", v7);

  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController setSubmitBarButtonItem:](self, "setSubmitBarButtonItem:", v9);

  if (+[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
  {
    -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:animated:", 0, 0);

  }
  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v13, sel_resignFirstResponder);
  objc_msgSend(v11, "setRightBarButtonItem:animated:", v12, 1);

  -[FBKBugFormTableViewController _resizeAndScrollTableAfterTextChangeInTextView:](self, "_resizeAndScrollTableAfterTextChangeInTextView:", v13);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "superviewWithClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "question");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "answerType");

  if (!v12)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("\n")) & 1) != 0)
    {
      v13 = 0;
      goto LABEL_3;
    }
    if (objc_msgSend(v9, "containsString:", CFSTR("\n")))
    {
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "beginningOfDocument");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v16, location);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v17, length);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textRangeFromPosition:toPosition:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "replaceRange:withText:", v19, v15);

      v13 = 0;
      v9 = (id)v15;
      goto LABEL_3;
    }
  }
  v13 = 1;
LABEL_3:

  return v13;
}

- (void)_resizeAndScrollTableAfterTextChangeInTextView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id buf[2];
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (-[FBKBugFormTableViewController isUpdatingTable](self, "isUpdatingTable"))
  {
    Log_7();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Is updating table, will resize cell later", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke;
    v16[3] = &unk_24E157020;
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v6, "addOperationWithBlock:", v16);

  }
  else
  {
    v7 = objc_initWeak(buf, self);
    -[FBKBugFormTableViewController diffableDataSource](self, "diffableDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained(buf);
    objc_msgSend(WeakRetained, "diffableDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke_2;
    v12[3] = &unk_24E15ACF0;
    v13 = v4;
    objc_copyWeak(&v14, buf);
    objc_msgSend(v11, "applySnapshot:animatingDifferences:completion:", v9, 0, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }

}

uint64_t __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resizeAndScrollTableAfterTextChangeInTextView:", *(_QWORD *)(a1 + 40));
}

void __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke_2(uint64_t a1)
{
  void *v1;
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "keyboardHeight");
  objc_msgSend(v1, "scrollTableToAvoidKeyboardInTableView:keyboardHeight:withPadding:", v3);

}

- (void)askDelegateToGoFullScreenIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (-[FBKBugFormTableViewController isPresentedInSmallDetent](self, "isPresentedInSmallDetent"))
  {
    -[FBKBugFormTableViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      Log_7();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Asking delegate to go full screen", v6, 2u);
      }

      -[FBKBugFormTableViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "controllerDidRequestFullScreenWithController:", self);

    }
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "superview");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    while (1)
    {
      v12 = (id)v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v12, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = v5;
      if (!v5)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v12 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "endEditingQuestion");
    -[FBKBugFormTableViewController draftingController](self, "draftingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_msgSend(v6, "isDirty") & 1) != 0
      || -[FBKBugFormTableViewController isCaptiveModeEnabled](self, "isCaptiveModeEnabled");
    -[FBKBugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", v7);

  }
  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController cancelBarButtonItem](self, "cancelBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:animated:", v9, 0);

  -[FBKBugFormTableViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormTableViewController submitBarButtonItem](self, "submitBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:animated:", v11, 0);

  -[FBKBugFormTableViewController setCancelBarButtonItem:](self, "setCancelBarButtonItem:", 0);
  -[FBKBugFormTableViewController setSubmitBarButtonItem:](self, "setSubmitBarButtonItem:", 0);
  -[FBKBugFormTableViewController setTextViewFirstResponder:](self, "setTextViewFirstResponder:", 0);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  Log_7();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FBKBugFormTableViewController presentationControllerForPresentedViewController:presentingViewController:sourceViewController:].cold.1(v5, v6, v7);

  return 0;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[FBKBugFormTableViewController presentedViewController](self, "presentedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[FBKBugFormTableViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v10, "horizontalSizeClass");

    if (v8 != v9)
      -[FBKBugFormTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }

}

- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6
{
  _BOOL4 v7;

  v7 = -[FBKBugFormTableViewController hasFileArea](self, "hasFileArea", a3, a4, a5, a6);
  if (v7)
    LOBYTE(v7) = -[FBKBugFormTableViewController shouldShowForm](self, "shouldShowForm");
  return v7;
}

- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FBKBugFormTableViewController devicesController](self, "devicesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)attachmentsAlertDidSelectOption:(id)a3
{
  id v3;

  -[FBKBugFormTableViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__FBKBugFormTableViewController_presentationControllerDidAttemptToDismiss___block_invoke;
  v5[3] = &unk_24E156D78;
  v5[4] = self;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

void __75__FBKBugFormTableViewController_presentationControllerDidAttemptToDismiss___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 32))
  {
    objc_msgSend(v3, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEnabled");

    if (!v7)
      return;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "navigationItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leftBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismiss:", v4);
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[FBKBugFormTableViewController closeWithCompletion:](self, "closeWithCompletion:", 0);
}

- (BOOL)isCaptiveModeEnabled
{
  FBKBugFormTableViewController *v2;
  void *v3;

  v2 = self;
  -[FBKBugFormTableViewController launchAction](self, "launchAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[FBKBugFormTableViewController isCaptiveModeEnabledForLaunchAction:](v2, "isCaptiveModeEnabledForLaunchAction:", v3);

  return (char)v2;
}

- (BOOL)isCaptiveModeEnabledForLaunchAction:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isCaptive");
  else
    return 0;
}

- (NSDictionary)pendingQandA
{
  return (NSDictionary *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPendingQandA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSSet)extensions
{
  return (NSSet *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSPredicate)candidateFormStubsPredicate
{
  return self->_candidateFormStubsPredicate;
}

- (void)setCandidateFormStubsPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_candidateFormStubsPredicate, a3);
}

- (FBKDraftingController)draftingController
{
  return self->_draftingController;
}

- (void)setDraftingController:(id)a3
{
  objc_storeStrong((id *)&self->_draftingController, a3);
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (NSString)localizedAttachmentLegalText
{
  return self->_localizedAttachmentLegalText;
}

- (void)setLocalizedAttachmentLegalText:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAttachmentLegalText, a3);
}

- (NSAttributedString)localizedAttributedLegalString
{
  return self->_localizedAttributedLegalString;
}

- (void)setLocalizedAttributedLegalString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAttributedLegalString, a3);
}

- (NSString)largeTitleIcon
{
  return self->_largeTitleIcon;
}

- (void)setLargeTitleIcon:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleIcon, a3);
}

- (NSArray)requestedPlugIns
{
  return self->_requestedPlugIns;
}

- (void)setRequestedPlugIns:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPlugIns, a3);
}

- (NSString)appToken
{
  return self->_appToken;
}

- (void)setAppToken:(id)a3
{
  objc_storeStrong((id *)&self->_appToken, a3);
}

- (UITextView)textViewFirstResponder
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textViewFirstResponder);
}

- (void)setTextViewFirstResponder:(id)a3
{
  objc_storeWeak((id *)&self->_textViewFirstResponder, a3);
}

- (BOOL)alwaysDeletesDrafts
{
  return self->_alwaysDeletesDrafts;
}

- (void)setAlwaysDeletesDrafts:(BOOL)a3
{
  self->_alwaysDeletesDrafts = a3;
}

- (FBKBugFormTableViewControllerProtocol)delegate
{
  return (FBKBugFormTableViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canShowTopicPicker
{
  return self->_canShowTopicPicker;
}

- (void)setCanShowTopicPicker:(BOOL)a3
{
  self->_canShowTopicPicker = a3;
}

- (BOOL)shouldShowUserSwitcherInForm
{
  return self->_shouldShowUserSwitcherInForm;
}

- (void)setShouldShowUserSwitcherInForm:(BOOL)a3
{
  self->_shouldShowUserSwitcherInForm = a3;
}

- (BOOL)showInlineUserInfo
{
  return self->_showInlineUserInfo;
}

- (void)setShowInlineUserInfo:(BOOL)a3
{
  self->_showInlineUserInfo = a3;
}

- (BOOL)showUserSwitcherLast
{
  return self->_showUserSwitcherLast;
}

- (void)setShowUserSwitcherLast:(BOOL)a3
{
  self->_showUserSwitcherLast = a3;
}

- (BOOL)canShowTeamPicker
{
  return self->_canShowTeamPicker;
}

- (void)setCanShowTeamPicker:(BOOL)a3
{
  self->_canShowTeamPicker = a3;
}

- (unint64_t)submissionStyle
{
  return self->_submissionStyle;
}

- (void)setSubmissionStyle:(unint64_t)a3
{
  self->_submissionStyle = a3;
}

- (BOOL)canOpenFeedbackInFBA
{
  return self->_canOpenFeedbackInFBA;
}

- (void)setCanOpenFeedbackInFBA:(BOOL)a3
{
  self->_canOpenFeedbackInFBA = a3;
}

- (BOOL)shouldShowAttachmentButton
{
  return self->_shouldShowAttachmentButton;
}

- (void)setShouldShowAttachmentButton:(BOOL)a3
{
  self->_shouldShowAttachmentButton = a3;
}

- (BOOL)disableAccountSwitching
{
  return self->_disableAccountSwitching;
}

- (void)setDisableAccountSwitching:(BOOL)a3
{
  self->_disableAccountSwitching = a3;
}

- (BOOL)alternateImagePreviewEnabled
{
  return self->_alternateImagePreviewEnabled;
}

- (void)setAlternateImagePreviewEnabled:(BOOL)a3
{
  self->_alternateImagePreviewEnabled = a3;
}

- (BOOL)useInlineChoices
{
  return self->_useInlineChoices;
}

- (void)setUseInlineChoices:(BOOL)a3
{
  self->_useInlineChoices = a3;
}

- (unint64_t)maxInlineChoices
{
  return self->_maxInlineChoices;
}

- (void)setMaxInlineChoices:(unint64_t)a3
{
  self->_maxInlineChoices = a3;
}

- (FBKDeviceDiagnosticsController)devicesController
{
  return self->_devicesController;
}

- (void)setDevicesController:(id)a3
{
  objc_storeStrong((id *)&self->_devicesController, a3);
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_cancelButton);
}

- (void)setCancelButton:(id)a3
{
  objc_storeWeak((id *)&self->_cancelButton, a3);
}

- (UIBarButtonItem)submitButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_submitButton);
}

- (void)setSubmitButton:(id)a3
{
  objc_storeWeak((id *)&self->_submitButton, a3);
}

- (FBKLargeSubmitButton)submitButtonLarge
{
  return self->_submitButtonLarge;
}

- (void)setSubmitButtonLarge:(id)a3
{
  objc_storeStrong((id *)&self->_submitButtonLarge, a3);
}

- (BOOL)attemptedSubmission
{
  return self->_attemptedSubmission;
}

- (void)setAttemptedSubmission:(BOOL)a3
{
  self->_attemptedSubmission = a3;
}

- (BOOL)isSubmissionPendingOnEnhancedLogging
{
  return self->_isSubmissionPendingOnEnhancedLogging;
}

- (void)setIsSubmissionPendingOnEnhancedLogging:(BOOL)a3
{
  self->_isSubmissionPendingOnEnhancedLogging = a3;
}

- (NSDictionary)pendingAttachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setPendingAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (id)loadDraftCompletion
{
  return self->_loadDraftCompletion;
}

- (void)setLoadDraftCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (unsigned)whooshSoundID
{
  return self->_whooshSoundID;
}

- (void)setWhooshSoundID:(unsigned int)a3
{
  self->_whooshSoundID = a3;
}

- (BOOL)hasLoadedFirstDraft
{
  return self->_hasLoadedFirstDraft;
}

- (void)setHasLoadedFirstDraft:(BOOL)a3
{
  self->_hasLoadedFirstDraft = a3;
}

- (BOOL)isEstablishingBugSession
{
  return self->_isEstablishingBugSession;
}

- (void)setIsEstablishingBugSession:(BOOL)a3
{
  self->_isEstablishingBugSession = a3;
}

- (BOOL)isPresentedInSmallDetent
{
  return self->_isPresentedInSmallDetent;
}

- (void)setIsPresentedInSmallDetent:(BOOL)a3
{
  self->_isPresentedInSmallDetent = a3;
}

- (BOOL)isBeingDismissedBySelf
{
  return self->_isBeingDismissedBySelf;
}

- (void)setIsBeingDismissedBySelf:(BOOL)a3
{
  self->_isBeingDismissedBySelf = a3;
}

- (NSString)identifierOfFirstDeviceSection
{
  return self->_identifierOfFirstDeviceSection;
}

- (void)setIdentifierOfFirstDeviceSection:(id)a3
{
  objc_storeStrong((id *)&self->_identifierOfFirstDeviceSection, a3);
}

- (NSString)identifierOfLastDeviceSection
{
  return self->_identifierOfLastDeviceSection;
}

- (void)setIdentifierOfLastDeviceSection:(id)a3
{
  objc_storeStrong((id *)&self->_identifierOfLastDeviceSection, a3);
}

- (unint64_t)cachedCandidateStubsCount
{
  return self->_cachedCandidateStubsCount;
}

- (void)setCachedCandidateStubsCount:(unint64_t)a3
{
  self->_cachedCandidateStubsCount = a3;
}

- (id)didRefreshFormStubsNotificationObserver
{
  return self->_didRefreshFormStubsNotificationObserver;
}

- (void)setDidRefreshFormStubsNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_didRefreshFormStubsNotificationObserver, a3);
}

- (BOOL)isUpdatingTable
{
  return self->_isUpdatingTable;
}

- (void)setIsUpdatingTable:(BOOL)a3
{
  self->_isUpdatingTable = a3;
}

- (BOOL)allowKeyboardDismissalForSnapshot
{
  return self->_allowKeyboardDismissalForSnapshot;
}

- (void)setAllowKeyboardDismissalForSnapshot:(BOOL)a3
{
  self->_allowKeyboardDismissalForSnapshot = a3;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (void)setCancelBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, a3);
}

- (UIBarButtonItem)submitBarButtonItem
{
  return self->_submitBarButtonItem;
}

- (void)setSubmitBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_submitBarButtonItem, a3);
}

- (BOOL)autoGathersDiagnosticExtensions
{
  return self->_autoGathersDiagnosticExtensions;
}

- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3
{
  self->_autoGathersDiagnosticExtensions = a3;
}

- (BOOL)allowsAttachmentDragAndDrop
{
  return self->_allowsAttachmentDragAndDrop;
}

- (void)setAllowsAttachmentDragAndDrop:(BOOL)a3
{
  self->_allowsAttachmentDragAndDrop = a3;
}

- (BOOL)shouldHideQuestions
{
  return self->_shouldHideQuestions;
}

- (void)setShouldHideQuestions:(BOOL)a3
{
  self->_shouldHideQuestions = a3;
}

- (BOOL)shouldHideAllCells
{
  return self->_shouldHideAllCells;
}

- (void)setShouldHideAllCells:(BOOL)a3
{
  self->_shouldHideAllCells = a3;
}

- (id)notificationObserver
{
  return objc_getProperty(self, a2, 1256, 1);
}

- (void)setNotificationObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (NSMutableDictionary)cellHeights
{
  return self->_cellHeights;
}

- (void)setCellHeights:(id)a3
{
  objc_storeStrong((id *)&self->_cellHeights, a3);
}

- (FBKBugFormStub)pendingStub
{
  return self->_pendingStub;
}

- (void)setPendingStub:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStub, a3);
}

- (FBKManagedFeedbackObject)pendingFeedbackObject
{
  return self->_pendingFeedbackObject;
}

- (void)setPendingFeedbackObject:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFeedbackObject, a3);
}

- (FBKTeam)pendingTeam
{
  return self->_pendingTeam;
}

- (void)setPendingTeam:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTeam, a3);
}

- (BOOL)viewHasBecomeVisible
{
  return self->_viewHasBecomeVisible;
}

- (void)setViewHasBecomeVisible:(BOOL)a3
{
  self->_viewHasBecomeVisible = a3;
}

- (UITableViewCell)addAttachmentCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_addAttachmentCell);
}

- (void)setAddAttachmentCell:(id)a3
{
  objc_storeWeak((id *)&self->_addAttachmentCell, a3);
}

- (FBKBugFormDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void)setAddAttachmentsController:(id)a3
{
  objc_storeStrong((id *)&self->_addAttachmentsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAttachmentsController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_addAttachmentCell);
  objc_storeStrong((id *)&self->_pendingTeam, 0);
  objc_storeStrong((id *)&self->_pendingFeedbackObject, 0);
  objc_storeStrong((id *)&self->_pendingStub, 0);
  objc_storeStrong((id *)&self->_cellHeights, 0);
  objc_storeStrong(&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_submitBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong(&self->_didRefreshFormStubsNotificationObserver, 0);
  objc_storeStrong((id *)&self->_identifierOfLastDeviceSection, 0);
  objc_storeStrong((id *)&self->_identifierOfFirstDeviceSection, 0);
  objc_storeStrong(&self->_loadDraftCompletion, 0);
  objc_storeStrong((id *)&self->_pendingAttachments, 0);
  objc_storeStrong((id *)&self->_submitButtonLarge, 0);
  objc_destroyWeak((id *)&self->_submitButton);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong((id *)&self->_devicesController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textViewFirstResponder);
  objc_storeStrong((id *)&self->_appToken, 0);
  objc_storeStrong((id *)&self->_requestedPlugIns, 0);
  objc_storeStrong((id *)&self->_largeTitleIcon, 0);
  objc_storeStrong((id *)&self->_localizedAttributedLegalString, 0);
  objc_storeStrong((id *)&self->_localizedAttachmentLegalText, 0);
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_draftingController, 0);
  objc_storeStrong((id *)&self->_candidateFormStubsPredicate, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_pendingQandA, 0);
}

- (void)launchModalViewWithModalQuestion:(id)a3
{
  FBKQuestion *v4;
  FBKBugFormTableViewController *v5;

  v4 = (FBKQuestion *)a3;
  v5 = self;
  FBKBugFormTableViewController.launchModalView(modalQuestion:)(v4);

}

- (void)largeTitleView:(uint64_t)a3 icon:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, a3, "Failed to generate image from [%{public}@]", (uint8_t *)&v3);
  OUTLINED_FUNCTION_7();
}

void __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21D9A9000, a2, a3, "Error While Dismissing Draft on FR [%i]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteCurrentDraftWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "Cannot delete draft because content item is nil", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)draftingControllerDidFinishLoading:(void *)a1 withError:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "draftingControllerDidFinishLoading with error %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)_handleLoadingError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[FBKBugFormTableViewController _handleLoadingError:]";
  v7 = 2114;
  v8 = v3;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a2, v4, "%s %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 withItemIdentifier:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218242;
  v5 = objc_msgSend(a1, "answerType");
  v6 = 2082;
  v7 = "-[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:]";
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a2, v3, "[%lu] question type not handled in [%{public}s]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_1();
}

- (void)tableView:cellForRowAtIndexPath:withItemIdentifier:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_21D9A9000, v0, (uint64_t)v0, "No question found for choice identifier [%@] in section [%@]", v1);
  OUTLINED_FUNCTION_7();
}

- (void)answerDidChangeForQuestion:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_8_1(&dword_21D9A9000, a3, v8, "Q: [%@] A: [%@]", (uint8_t *)&v9);

  OUTLINED_FUNCTION_5_2();
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21D9A9000, a2, a3, "Cannot delete draft with ID [%i] because content item is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_144_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21D9A9000, a2, a3, "Failed to delete form response [%i]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_145_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21D9A9000, a2, a3, "Failed to save form response [%i]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)bugFormPickerDidCancel:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FBKBugFormTableViewController bugFormPickerDidCancel:]";
  _os_log_debug_impl(&dword_21D9A9000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_7();
}

void __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke_cold_1(id *a1, id *a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "currentTeam");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(a1);
  objc_msgSend(v11, "formStub");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543874;
  v17 = v8;
  v18 = 2114;
  v19 = v10;
  v20 = 2114;
  v21 = v14;
  _os_log_error_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_ERROR, "Attempted to switch from team [%{public}@] to team [%{public}@] for stub [%{public}@] but new team does not have a matching form stub. Falling back to old stub.", buf, 0x20u);

}

void __39__FBKBugFormTableViewController_submit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*(id *)(a1 + 32), "intValue");
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "background task expired for form response [%d]", (uint8_t *)v4, 8u);
  OUTLINED_FUNCTION_7();
}

void __39__FBKBugFormTableViewController_submit__block_invoke_197_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109376;
  v5[1] = objc_msgSend(v4, "intValue");
  v6 = 1024;
  v7 = 1;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Submission callback for FR [%i] with error? [%i]", (uint8_t *)v5, 0xEu);

  OUTLINED_FUNCTION_5_2();
}

- (void)didTapDevice:(uint64_t)a3 indexPath:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[FBKBugFormTableViewController didTapDevice:indexPath:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_8_1(&dword_21D9A9000, a2, a3, "%s %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_7();
}

- (void)presentationControllerForPresentedViewController:(NSObject *)a1 presentingViewController:(uint64_t)a2 sourceViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[FBKBugFormTableViewController presentationControllerForPresentedViewController:presentingViewController:sourceViewController:]";
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a1, a3, "[%{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_7();
}

@end
