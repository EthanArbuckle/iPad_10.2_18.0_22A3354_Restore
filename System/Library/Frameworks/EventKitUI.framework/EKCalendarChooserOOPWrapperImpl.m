@implementation EKCalendarChooserOOPWrapperImpl

- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  EKCalendarChooserOOPWrapperImpl *v21;
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v18 = a6;
  v19 = a7;
  v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)EKCalendarChooserOOPWrapperImpl;
  v21 = -[EKCalendarChooserOOPWrapperImpl init](&v31, sel_init);
  if (v21)
  {
    v22 = -[EKCalendarChooserOOPImpl initWithEventStore:]([_TtC10EventKitUI24EKCalendarChooserOOPImpl alloc], "initWithEventStore:", v19);
    -[EKCalendarChooserOOPWrapperImpl setVc:](v21, "setVc:", v22);

    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSelectionStyle:", a3);

    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDisplayStyle:", a4);

    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEntityType:", a5);

    objc_storeStrong((id *)&v21->_event, a6);
    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLimitedToSource:", v20);

    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShowIdentityChooser:", a9);

    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShowDelegateSetupCell:", a10);

    -[EKCalendarChooserOOPWrapperImpl vc](v21, "vc");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setShowAccountStatus:", a11);

  }
  return v21;
}

- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 eventStore:(id)a6
{
  uint64_t v7;

  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[EKCalendarChooserOOPWrapperImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, a5, 0, a6, 0, v7);
}

- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 eventStore:(id)a5
{
  uint64_t v6;

  BYTE2(v6) = 0;
  LOWORD(v6) = 0;
  return -[EKCalendarChooserOOPWrapperImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, 0, 0, a5, 0, v6);
}

- (void)viewDidLoad
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
  id v39;
  void *v40;
  objc_super v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)EKCalendarChooserOOPWrapperImpl;
  -[EKCalendarChooserOOPWrapperImpl viewDidLoad](&v41, sel_viewDidLoad);
  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calendars"), &stru_1E601DFA8, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarChooserOOPWrapperImpl setTitle:](self, "setTitle:", v40);
  -[EKCalendarChooserOOPWrapperImpl parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v40);

  v39 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBackgroundColor:", v5);

  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKCalendarChooserOOPWrapperImpl setSafeAreaCaulk:](self, "setSafeAreaCaulk:", v39);
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl addChildViewController:](self, "addChildViewController:", v6);

  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v9);

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didMoveToParentViewController:", self);

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v33;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v26;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v15;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v22);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  objc_super v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)EKCalendarChooserOOPWrapperImpl;
  -[EKCalendarChooserOOPWrapperImpl viewWillAppear:](&v42, sel_viewWillAppear_, a3);
  -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolbar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_6;
  }
  v9 = (void *)v8;
  -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toolbar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    v30 = (void *)MEMORY[0x1E0CB3718];
    -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "toolbar");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v36;
    -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "rightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "rightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v29;
    -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v17;
    -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v24);

    -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);
LABEL_6:

  }
  -[EKCalendarChooserOOPWrapperImpl _layoutNavToolbarControls](self, "_layoutNavToolbarControls");
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)hasInProcessNavBar
{
  void *v2;
  void *v3;
  int v4;

  -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isNavigationBarHidden") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)hasAccountThatCanCreateCalendars
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "limitedToSource");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "limitedToSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isWritable");

    if (!v8)
    {
      LOBYTE(v9) = 0;
      return v9;
    }
  }
  else
  {

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EKCalendarChooserOOPWrapperImpl eventStore](self, "eventStore", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "supportsCalendarCreation") && objc_msgSend(v14, "sourceType") != 4)
        {
          LOBYTE(v9) = 1;
          goto LABEL_16;
        }
      }
      v9 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_16:

  return v9;
}

- (void)_layoutNavToolbarControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  UIBarButtonItem *addCalendarButton;
  id v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  if (-[EKCalendarChooserOOPWrapperImpl showsCancelButton](self, "showsCancelButton"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    objc_msgSend(v35, "addObject:", v3);

  }
  if (-[EKCalendarChooserOOPWrapperImpl showsDoneButton](self, "showsDoneButton"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
    objc_msgSend(v35, "addObject:", v4);

  }
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

    objc_msgSend(v35, "removeLastObject");
  }
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

    objc_msgSend(v35, "removeLastObject");
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 0) == 3
    && !-[EKCalendarChooserOOPWrapperImpl disableCalendarEditing](self, "disableCalendarEditing")
    && -[EKCalendarChooserOOPWrapperImpl hasAccountThatCanCreateCalendars](self, "hasAccountThatCanCreateCalendars"))
  {
    addCalendarButton = self->_addCalendarButton;
    if (!addCalendarButton)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
      EventKitUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Add Calendar"), &stru_1E601DFA8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (UIBarButtonItem *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, sel_addCalendarButtonPressed_);
      v15 = self->_addCalendarButton;
      self->_addCalendarButton = v14;

      addCalendarButton = self->_addCalendarButton;
    }
    objc_msgSend(v9, "addObject:", addCalendarButton);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v9, "addObject:", v16);

  }
  if ((objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 0) > 2
     || objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 1) >= 3)
    && -[EKCalendarChooserOOPWrapperImpl selectionStyle](self, "selectionStyle") == 1)
  {
    if (!objc_msgSend(v9, "count"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      objc_msgSend(v9, "addObject:", v17);

    }
    objc_msgSend((id)objc_opt_class(), "showAllString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v18, 0, self, sel_showAllButtonPressed);
    -[EKCalendarChooserOOPWrapperImpl setShowAllButton:](self, "setShowAllButton:", v19);

    -[EKCalendarChooserOOPWrapperImpl showAllButton](self, "showAllButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v20);

    v21 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "showAllString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "hideAllString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithObjects:", v22, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserOOPWrapperImpl showAllButton](self, "showAllButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPossibleTitles:", v24);

  }
  v26 = objc_msgSend(v9, "count");
  -[EKCalendarChooserOOPWrapperImpl safeAreaCaulk](self, "safeAreaCaulk");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v26)
  {
    objc_msgSend(v27, "setHidden:", 1);

    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setToolbarHidden:", 1);
    goto LABEL_25;
  }
  objc_msgSend(v27, "setHidden:", 0);

  -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setToolbarHidden:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "toolbar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBackgroundColor:", v30);

  -[EKCalendarChooserOOPWrapperImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", v9, 1);
  -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = objc_msgSend(v33, "conformsToProtocol:", &unk_1EEF09E78);

  if ((_DWORD)v31)
  {
    -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "calendarChooserUpdatedToolbarItems");
LABEL_25:

  }
}

+ (id)showAllString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show All"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hideAllString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Hide All"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAllSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_allSelected = a3;
  v5 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v5, "hideAllString");
  else
    objc_msgSend(v5, "showAllString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserOOPWrapperImpl showAllButton](self, "showAllButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

}

- (void)remoteCalendarChooserSelectionChanged:(id)a3 allSelected:(BOOL)a4
{
  -[EKCalendarChooserOOPWrapperImpl setAllSelected:](self, "setAllSelected:", a4);
}

- (void)cancel:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calendarChooserDidCancel:", v8);

    }
  }
}

- (void)done:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calendarChooserDidFinish:", v8);

    }
  }
}

- (void)addCalendarButtonPressed:(id)a3
{
  EKCalendarEditor *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  EKAbstractCalendarEditor *v9;
  EKAbstractCalendarEditor *presentedEditor;
  id v11;

  v11 = a3;
  v4 = [EKCalendarEditor alloc];
  -[EKCalendarChooserOOPWrapperImpl eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKCalendarChooserOOPWrapperImpl entityType](self, "entityType");
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "limitedToSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:](v4, "initWithCalendar:eventStore:entityType:limitedToSource:", 0, v5, v6, v8);

  -[EKAbstractCalendarEditor setDelegate:](v9, "setDelegate:", self);
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = v9;

  -[EKCalendarChooserOOPWrapperImpl _commonAddCalendarButtonPressed:](self, "_commonAddCalendarButtonPressed:", v11);
}

- (void)_commonAddCalendarButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 IsRegular;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_presentedEditor);
  if (-[EKCalendarChooserOOPWrapperImpl displayStyle](self, "displayStyle") == 1000)
  {
    objc_msgSend(v4, "setModalPresentationStyle:", 7);
    objc_msgSend(v4, "_setClipUnderlapWhileTransitioning:", 1);
    objc_msgSend(v4, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBarButtonItem:", v10);
LABEL_6:

    goto LABEL_7;
  }
  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
    goto LABEL_6;
  -[EKCalendarChooserOOPWrapperImpl view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

  if (IsRegular)
  {
    objc_msgSend(v4, "setModalPresentationStyle:", 6);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v5);

    goto LABEL_6;
  }
LABEL_7:
  -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4
{
  EKAbstractCalendarEditor *v5;
  void *v6;
  EKAbstractCalendarEditor *v7;

  v5 = (EKAbstractCalendarEditor *)a3;
  if (self->_presentedEditor == v5)
  {
    self->_presentedEditor = 0;
    v7 = v5;

    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = v7;
  }

}

- (EKEventStore)eventStore
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEventStore *)v3;
}

- (int64_t)displayStyle
{
  void *v2;
  int64_t v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayStyle");

  return v3;
}

- (unint64_t)entityType
{
  void *v2;
  unint64_t v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "entityType");

  return v3;
}

- (int64_t)selectionStyle
{
  void *v2;
  int64_t v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionStyle");

  return v3;
}

- (EKCalendarChooserDelegate)delegate
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKCalendarChooserDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  self->_showsCancelButton = a3;
}

- (NSSet)selectedCalendars
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedCalendars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setSelectedCalendars:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedCalendars:", v4);

}

- (BOOL)disableCalendarEditing
{
  return self->_disableCalendarEditing;
}

- (void)setDisableCalendarEditing:(BOOL)a3
{
  self->_disableCalendarEditing = a3;
}

- (void)showAllButtonPressed
{
  -[EKCalendarChooserOOPWrapperImpl setAllSelected:](self, "setAllSelected:", !self->_allSelected);
  -[EKCalendarChooserOOPWrapperImpl _selectAllCalendarsAndNotify:](self, "_selectAllCalendarsAndNotify:", 1);
}

- (void)_selectAllCalendarsAndNotify:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[EKCalendarChooserOOPWrapperImpl delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendarChooserSelectionDidChange:", v7);

    }
  }
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleAllCalendars");

}

- (BOOL)showDetailAccessories
{
  void *v2;
  char v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showDetailAccessories");

  return v3;
}

- (void)setShowDetailAccessories:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowDetailAccessories:", v3);

}

- (int64_t)chooserMode
{
  void *v2;
  int64_t v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "chooserMode");

  return v3;
}

- (void)setChooserMode:(int64_t)a3
{
  id v4;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChooserMode:", a3);

}

- (BOOL)disableCalendarsUnselectedByFocus
{
  void *v2;
  char v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableCalendarsUnselectedByFocus");

  return v3;
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableCalendarsUnselectedByFocus:", v3);

}

- (BOOL)allowsPullToRefresh
{
  void *v2;
  char v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsPullToRefresh");

  return v3;
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsPullToRefresh:", v3);

}

- (EKCalendar)selectedCalendar
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKCalendar *)v3;
}

- (void)setSelectedCalendar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedCalendar:", v4);

}

- (BOOL)showsDeclinedEventsSetting
{
  void *v2;
  char v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDeclinedEventsSetting");

  return v3;
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDeclinedEventsSetting:", v3);

}

- (BOOL)showsCompletedRemindersSetting
{
  return 0;
}

- (int)explanatoryTextMode
{
  void *v2;
  int v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "explanatoryTextMode");

  return v3;
}

- (void)setExplanatoryTextMode:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExplanatoryTextMode:", v3);

}

- (BOOL)showAccountStatus
{
  void *v2;
  char v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showAccountStatus");

  return v3;
}

- (void)setShowAccountStatus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAccountStatus:", v3);

}

- (BOOL)onlyShowUnmanagedAccounts
{
  void *v2;
  char v3;

  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "onlyShowUnmanagedAccounts");

  return v3;
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKCalendarChooserOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnlyShowUnmanagedAccounts:", v3);

}

- (id)centeredCalendar
{
  return objc_alloc_init(MEMORY[0x1E0CA9FF0]);
}

- (id)sourceForSelectedIdentity
{
  return 0;
}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarItems:", v4);

}

- (id)toolbarItems
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbarItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarItems:animated:", v6, v4);

}

- (id)navigationItem
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)navigationController
{
  void *v2;
  void *v3;

  -[EKCalendarChooserOOPWrapperImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  EKUIViewControllerNavigationDelegate **p_navigationDelegate;
  id WeakRetained;
  void *v5;

  p_navigationDelegate = &self->_navigationDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    -[EKCalendarChooserOOPWrapperImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (NSSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
  objc_storeStrong((id *)&self->_vc, a3);
}

- (UIBarButtonItem)showAllButton
{
  return self->_showAllButton;
}

- (void)setShowAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_showAllButton, a3);
}

- (EKAbstractCalendarEditor)presentedEditor
{
  return self->_presentedEditor;
}

- (void)setPresentedEditor:(id)a3
{
  objc_storeStrong((id *)&self->_presentedEditor, a3);
}

- (BOOL)allSelected
{
  return self->_allSelected;
}

- (UIView)safeAreaCaulk
{
  return self->_safeAreaCaulk;
}

- (void)setSafeAreaCaulk:(id)a3
{
  objc_storeStrong((id *)&self->_safeAreaCaulk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAreaCaulk, 0);
  objc_storeStrong((id *)&self->_presentedEditor, 0);
  objc_storeStrong((id *)&self->_showAllButton, 0);
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_addCalendarButton, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
