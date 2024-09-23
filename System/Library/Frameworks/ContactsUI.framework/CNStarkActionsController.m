@implementation CNStarkActionsController

- (CNStarkActionsController)initWithContact:(id)a3
{
  id v5;
  CNStarkActionsController *v6;
  CNStarkActionsController *v7;
  CNContactQuickActionsController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CNContactQuickActionsController *quickActionsController;
  void *v16;
  uint64_t v17;
  CNStarkActionView *messageActionView;
  uint64_t v19;
  CNStarkActionView *callActionView;
  uint64_t v21;
  CNStarkActionView *directionsActionView;
  CNStarkActionsController *v23;
  objc_super v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CNStarkActionsController;
  v6 = -[CNStarkActionsController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = [CNContactQuickActionsController alloc];
    v10 = *MEMORY[0x1E0C965F8];
    v26[0] = *MEMORY[0x1E0C96620];
    v9 = v26[0];
    v26[1] = v10;
    v27 = *MEMORY[0x1E0C96608];
    v11 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactQuickActionsDisambiguationMenuPresentation modalPresentation](CNContactQuickActionsDisambiguationMenuPresentation, "modalPresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNContactQuickActionsController initWithActionTypes:contactQuickActionViewContainer:disambiguationMenuPresentation:](v8, "initWithActionTypes:contactQuickActionViewContainer:disambiguationMenuPresentation:", v12, v7, v13);
    quickActionsController = v7->_quickActionsController;
    v7->_quickActionsController = (CNContactQuickActionsController *)v14;

    +[CNUINavigationListStyleProvider carPlayStyle](CNUINavigationListStyleProvider, "carPlayStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController setNavigationListStyle:](v7->_quickActionsController, "setNavigationListStyle:", v16);

    -[CNContactQuickActionsController setDelegate:](v7->_quickActionsController, "setDelegate:", v7);
    +[CNStarkActionView quickActionButtonWithDelegate:](CNStarkActionView, "quickActionButtonWithDelegate:", v7);
    v17 = objc_claimAutoreleasedReturnValue();
    messageActionView = v7->_messageActionView;
    v7->_messageActionView = (CNStarkActionView *)v17;

    -[CNStarkActionView setActionType:](v7->_messageActionView, "setActionType:", v9);
    +[CNStarkActionView quickActionButtonWithDelegate:](CNStarkActionView, "quickActionButtonWithDelegate:", v7);
    v19 = objc_claimAutoreleasedReturnValue();
    callActionView = v7->_callActionView;
    v7->_callActionView = (CNStarkActionView *)v19;

    -[CNStarkActionView setActionType:](v7->_callActionView, "setActionType:", v10);
    +[CNStarkActionView quickActionButtonWithDelegate:](CNStarkActionView, "quickActionButtonWithDelegate:", v7);
    v21 = objc_claimAutoreleasedReturnValue();
    directionsActionView = v7->_directionsActionView;
    v7->_directionsActionView = (CNStarkActionView *)v21;

    -[CNStarkActionView setActionType:](v7->_directionsActionView, "setActionType:", v11);
    v23 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStarkActionsController;
  -[CNStarkActionsController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNStarkActionsController setupViews](self, "setupViews");
  -[CNStarkActionsController updateViews](self, "updateViews");
}

- (void)setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkActionsController callActionView](self, "callActionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkActionsController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[CNStarkActionsController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController callActionView](self, "callActionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[CNStarkActionsController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNStarkActionsController;
  -[CNStarkActionsController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CNStarkActionsController resetLayoutConstraints](self, "resetLayoutConstraints");
}

- (void)resetLayoutConstraints
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkActionsController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController layoutConstraints](self, "layoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", v4);

  -[CNStarkActionsController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  -[CNStarkActionsController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width;
  void *v6;
  double v7;
  int v8;
  objc_super v9;

  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNStarkActionsController;
  -[CNStarkActionsController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CNStarkActionsController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = (int)v7;

  if ((int)width != v8)
  {
    -[CNStarkActionsController setWillTransitionToBoundsWidth:](self, "setWillTransitionToBoundsWidth:", width);
    -[CNStarkActionsController resetLayoutConstraints](self, "resetLayoutConstraints");
  }
}

- (void)updateViewConstraints
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkActionsController;
  -[CNStarkActionsController updateViewConstraints](&v5, sel_updateViewConstraints);
  v3 = *MEMORY[0x1E0D137F8];
  -[CNStarkActionsController layoutConstraints](self, "layoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((_DWORD)v3)
    -[CNStarkActionsController setupLayoutConstraints](self, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[3];
  _QWORD v80[4];
  _QWORD v81[4];
  _QWORD v82[6];

  v82[4] = *MEMORY[0x1E0C80C00];
  -[CNStarkActionsController willTransitionToBoundsWidth](self, "willTransitionToBoundsWidth");
  if ((int)v3)
  {
    -[CNStarkActionsController willTransitionToBoundsWidth](self, "willTransitionToBoundsWidth");
    v5 = v4;
  }
  else
  {
    -[CNStarkActionsController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v5 = v7;

  }
  -[CNStarkActionsController setWillTransitionToBoundsWidth:](self, "setWillTransitionToBoundsWidth:", 0.0);
  v8 = (v5 + -150.0) * 0.25 + 50.0;
  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "safeAreaLayoutGuide");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v64);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v61;
  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "safeAreaLayoutGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v46);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v43;
  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v13, -v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v14;
  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkActionsController callActionView](self, "callActionView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "safeAreaLayoutGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v62);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v59;
  -[CNStarkActionsController callActionView](self, "callActionView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "safeAreaLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v44);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v41;
  -[CNStarkActionsController callActionView](self, "callActionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v23;
  -[CNStarkActionsController callActionView](self, "callActionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "safeAreaLayoutGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v63);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v60;
  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "safeAreaLayoutGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v42;
  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "safeAreaLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v31, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v32;
  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v79[0] = v78;
  v79[1] = v77;
  v79[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_cn_flatten");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController setLayoutConstraints:](self, "setLayoutConstraints:", v37);

  -[CNStarkActionsController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController layoutConstraints](self, "layoutConstraints");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addConstraints:", v39);

}

- (void)updateViews
{
  void *v3;
  id v4;

  -[CNStarkActionsController contact](self, "contact");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController quickActionsController](self, "quickActionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContact:", v4);

}

- (void)actionViewTapped:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = *MEMORY[0x1E0D13848];
  v9 = v4;
  objc_msgSend(v4, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) == 0)
  {
    -[CNStarkActionsController quickActionsController](self, "quickActionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeTapBehaviorForActionType:", v8);

  }
}

- (id)viewForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNStarkActionsController messageActionView](self, "messageActionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  -[CNStarkActionsController callActionView](self, "callActionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  -[CNStarkActionsController directionsActionView](self, "directionsActionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__CNStarkActionsController_viewForActionType___block_invoke;
  v12[3] = &unk_1E204DA10;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "_cn_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)contactQuickActionsController:(id)a3 presentDisambiguationViewController:(id)a4 forActionType:(id)a5
{
  id v6;

  v6 = a4;
  -[CNStarkActionsController addForwardingDelegate](self, "addForwardingDelegate");
  -[CNStarkActionsController showViewController:sender:](self, "showViewController:sender:", v6, 0);
  -[CNStarkActionsController setDisambiguationViewController:](self, "setDisambiguationViewController:", v6);

}

- (void)contactQuickActionsController:(id)a3 dismissDisambiguationViewController:(id)a4 forActionType:(id)a5
{
  CNStarkActionsController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "presentingViewController");
  v6 = (CNStarkActionsController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[CNStarkActionsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    objc_msgSend(v13, "navigationController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v13, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topViewController");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v13)
      {
        objc_msgSend(v13, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);

      }
    }
  }
  -[CNStarkActionsController removeForwardingDelegate](self, "removeForwardingDelegate");
  -[CNStarkActionsController setDisambiguationViewController:](self, "setDisambiguationViewController:", 0);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[CNStarkActionsController forwardDelegateForNavigationController:willShowViewController:animated:](self, "forwardDelegateForNavigationController:willShowViewController:animated:", a3);
  -[CNStarkActionsController disambiguationViewController](self, "disambiguationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNStarkActionsController disambiguationViewController](self, "disambiguationViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v11)
    {
      -[CNStarkActionsController removeForwardingDelegate](self, "removeForwardingDelegate");
      -[CNStarkActionsController quickActionsController](self, "quickActionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNStarkActionsController disambiguationViewController](self, "disambiguationViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "disambiguationViewControllerDismissedExternally:", v10);

      -[CNStarkActionsController setDisambiguationViewController:](self, "setDisambiguationViewController:", 0);
    }
  }

}

- (void)addForwardingDelegate
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkActionsController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionsController setPhoneNavigationControllerDelegate:](self, "setPhoneNavigationControllerDelegate:", v4);

  -[CNStarkActionsController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)forwardDelegateForNavigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  -[CNStarkActionsController phoneNavigationControllerDelegate](self, "phoneNavigationControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CNStarkActionsController phoneNavigationControllerDelegate](self, "phoneNavigationControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController:willShowViewController:animated:", v12, v8, v5);

  }
}

- (void)removeForwardingDelegate
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkActionsController disambiguationViewController](self, "disambiguationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CNStarkActionsController phoneNavigationControllerDelegate](self, "phoneNavigationControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  -[CNStarkActionsController setPhoneNavigationControllerDelegate:](self, "setPhoneNavigationControllerDelegate:", 0);
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactQuickActionsController)quickActionsController
{
  return self->_quickActionsController;
}

- (UIViewController)disambiguationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_disambiguationViewController);
}

- (void)setDisambiguationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_disambiguationViewController, a3);
}

- (UINavigationControllerDelegate)phoneNavigationControllerDelegate
{
  return (UINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_phoneNavigationControllerDelegate);
}

- (void)setPhoneNavigationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_phoneNavigationControllerDelegate, a3);
}

- (CNStarkActionView)messageActionView
{
  return self->_messageActionView;
}

- (CNStarkActionView)callActionView
{
  return self->_callActionView;
}

- (CNStarkActionView)directionsActionView
{
  return self->_directionsActionView;
}

- (double)willTransitionToBoundsWidth
{
  return self->_willTransitionToBoundsWidth;
}

- (void)setWillTransitionToBoundsWidth:(double)a3
{
  self->_willTransitionToBoundsWidth = a3;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_directionsActionView, 0);
  objc_storeStrong((id *)&self->_callActionView, 0);
  objc_storeStrong((id *)&self->_messageActionView, 0);
  objc_destroyWeak((id *)&self->_phoneNavigationControllerDelegate);
  objc_destroyWeak((id *)&self->_disambiguationViewController);
  objc_storeStrong((id *)&self->_quickActionsController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

uint64_t __46__CNStarkActionsController_viewForActionType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "actionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  return +[CNContactQuickActionsController descriptorForRequiredKeys](CNContactQuickActionsController, "descriptorForRequiredKeys");
}

@end
