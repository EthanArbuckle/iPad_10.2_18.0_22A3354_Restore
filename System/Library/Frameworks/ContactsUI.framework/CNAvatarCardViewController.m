@implementation CNAvatarCardViewController

- (CNAvatarCardViewController)initWithContacts:(id)a3
{
  id v4;
  CNAvatarCardViewController *v5;
  void *v6;
  void *v7;
  int v8;
  CNAvatarCardActionsView *v9;
  CNAvatarCardActionsView *v10;
  void *v11;
  CNContactActionsController *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNAvatarCardViewController;
  v5 = -[CNAvatarCardViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
    goto LABEL_5;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isUnknown"))
  {

LABEL_5:
    v9 = [CNAvatarCardActionsView alloc];
    v10 = -[CNAvatarCardActionsView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNAvatarCardActionsView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAvatarCardActionsView setDelegate:](v10, "setDelegate:", v5);
    -[CNAvatarCardActionsView setContacts:](v10, "setContacts:", v4);
    -[CNAvatarCardViewController setLegacyContactActionsView:](v5, "setLegacyContactActionsView:", v10);
    goto LABEL_6;
  }
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSuggestedMe");

  if (v8)
    goto LABEL_5;
  if (objc_msgSend(v4, "count") != 1)
    goto LABEL_7;
  v13 = [CNContactActionsController alloc];
  objc_msgSend(v4, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactActionsController supportedActionTypes](CNContactActionsController, "supportedActionTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactActionsController initWithContact:actionTypes:](v13, "initWithContact:actionTypes:", v14, v15);

  -[CNAvatarCardActionsView setDisplayMenuIconAtTopLevel:](v10, "setDisplayMenuIconAtTopLevel:", 1);
  -[CNAvatarCardActionsView setDelegate:](v10, "setDelegate:", v5);
  -[CNAvatarCardViewController setActionsController:](v5, "setActionsController:", v10);
LABEL_6:

LABEL_7:
  -[CNAvatarCardViewController setBorderMargin:](v5, "setBorderMargin:", 10.0);
  -[CNAvatarCardViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
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
  double v39;
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
  double v53;
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
  objc_super v64;
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[6];
  _QWORD v68[8];

  v68[6] = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController viewDidLoad](&v64, sel_viewDidLoad);
  -[CNAvatarCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);
  -[CNAvatarCardViewController willAddActionsViewToHierarchy](self, "willAddActionsViewToHierarchy");
  v4 = 0;
  v5 = 0;
  if (-[CNAvatarCardViewController hasHeader](self, "hasHeader"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    +[CNUIColorRepository contactStyleDefaultBackgroundColor](CNUIColorRepository, "contactStyleDefaultBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 13.0);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v5);
    -[CNAvatarCardViewController setHeaderContainerView:](self, "setHeaderContainerView:", v5);
    -[CNAvatarCardViewController cardController](self, "cardController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4);
  }
  -[CNAvatarCardViewController actionsView](self, "actionsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 13.0);

  v60 = v9;
  objc_msgSend(v9, "setClipsToBounds:", 1);
  -[CNAvatarCardViewController updateActionsViewBackgroundColor](self, "updateActionsViewBackgroundColor");
  v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "addSubview:", v17);
  -[CNAvatarCardViewController actionsView](self, "actionsView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  -[CNAvatarCardViewController actionsView](self, "actionsView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(v3, "addSubview:", v16);
  -[CNAvatarCardViewController didAddActionsViewToHierarchy](self, "didAddActionsViewToHierarchy");
  -[CNAvatarCardViewController setEffectView:](self, "setEffectView:", v16);
  -[CNAvatarCardViewController setActionsListView:](self, "setActionsListView:", v16);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v5;
  v63 = v3;
  v61 = v4;
  v59 = v17;
  if (v5 && v4)
  {
    v67[0] = CFSTR("headerContainerView");
    v67[1] = CFSTR("headerView");
    v68[0] = v5;
    v68[1] = v4;
    v67[2] = CFSTR("actionsView");
    -[CNAvatarCardViewController actionsView](self, "actionsView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v21;
    v68[3] = v16;
    v67[3] = CFSTR("effectView");
    v67[4] = CFSTR("vibrancyView");
    v67[5] = CFSTR("view");
    v68[4] = v17;
    v68[5] = v3;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = v68;
    v24 = v67;
    v25 = 6;
  }
  else
  {
    v65[0] = CFSTR("actionsView");
    -[CNAvatarCardViewController actionsView](self, "actionsView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v21;
    v66[1] = v16;
    v65[1] = CFSTR("effectView");
    v65[2] = CFSTR("vibrancyView");
    v65[3] = CFSTR("view");
    v66[2] = v17;
    v66[3] = v3;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = v66;
    v24 = v65;
    v25 = 4;
  }
  objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNAvatarCardViewController hasHeader](self, "hasHeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[headerView]-(margin)-|"), 0, &unk_1E20D39F8, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v27);

    -[CNAvatarCardViewController headerContainerView](self, "headerContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leftAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "safeAreaLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController borderMargin](self, "borderMargin");
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v33);

    -[CNAvatarCardViewController headerContainerView](self, "headerContainerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "safeAreaLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController borderMargin](self, "borderMargin");
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v38, -v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v40);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[headerView]|"), 0, &unk_1E20D39F8, v26);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v41);

  }
  -[CNAvatarCardViewController effectView](self, "effectView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leftAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController borderMargin](self, "borderMargin");
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v47);

  -[CNAvatarCardViewController effectView](self, "effectView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "safeAreaLayoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController borderMargin](self, "borderMargin");
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v52, -v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v54);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[vibrancyView]-0-|"), 0, &unk_1E20D39F8, v26);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v55);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[vibrancyView]-0-|"), 0, &unk_1E20D39F8, v26);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v56);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[actionsView]-0-|"), 0, &unk_1E20D39F8, v26);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v57);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[actionsView]-0-|"), 0, &unk_1E20D39F8, v26);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v58);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
  objc_msgSend(v63, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController updateViewConstraints](&v15, sel_updateViewConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNAvatarCardViewController verticalConstraints](self, "verticalConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  if (-[CNAvatarCardViewController hasHeader](self, "hasHeader"))
  {
    v18[0] = CFSTR("headerContainerView");
    -[CNAvatarCardViewController headerContainerView](self, "headerContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v18[1] = CFSTR("actionsView");
    -[CNAvatarCardViewController actionsView](self, "actionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v6;
    v18[2] = CFSTR("effectView");
    -[CNAvatarCardViewController effectView](self, "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CNAvatarCardViewController headerOnTop](self, "headerOnTop"))
      v9 = CFSTR("V:|[headerContainerView]-8-[effectView]|");
    else
      v9 = CFSTR("V:|[effectView]-8-[headerContainerView]|");
    v10 = (void *)MEMORY[0x1E0CB3718];
  }
  else
  {
    v16 = CFSTR("effectView");
    -[CNAvatarCardViewController effectView](self, "effectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3718];
    v9 = CFSTR("V:|[effectView]|");
  }
  objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", v9, 0, 0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController setVerticalConstraints:](self, "setVerticalConstraints:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[CNAvatarCardViewController verticalConstraints](self, "verticalConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v14);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNAvatarCardViewController cardController](self, "cardController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFontSizes");

  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

}

- (void)setHeaderOnTop:(BOOL)a3
{
  id v3;

  if (self->_headerOnTop != a3)
  {
    self->_headerOnTop = a3;
    -[CNAvatarCardViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsUpdateConstraints");

  }
}

- (void)setActionsReversed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAvatarCardViewController actionListController](self, "actionListController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionsReversed:", v3);

}

- (BOOL)actionsReversed
{
  void *v2;
  char v3;

  -[CNAvatarCardViewController actionListController](self, "actionListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "actionsReversed");

  return v3;
}

- (void)setDismissesBeforePerforming:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissesBeforePerforming:", v3);

}

- (BOOL)dismissesBeforePerforming
{
  void *v2;
  char v3;

  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dismissesBeforePerforming");

  return v3;
}

- (CGRect)_photoFrameInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[CNAvatarCardViewController cardController](self, "cardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setActionCategories:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionCategories:", v4);

}

- (NSArray)actionCategories
{
  void *v2;
  void *v3;

  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBypassActionValidation:", v3);

}

- (BOOL)bypassActionValidation
{
  void *v2;
  char v3;

  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bypassActionValidation");

  return v3;
}

- (id)actionsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarCardViewController actionsController](self, "actionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (CNAvatarCardActionListOrbSupport)actionListViewController
{
  void *v3;
  void *v4;
  void *v5;

  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarCardViewController actionsController](self, "actionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CNAvatarCardActionListOrbSupport *)v5;
}

- (CNAvatarCardActionListController)actionListController
{
  void *v3;

  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CNAvatarCardViewController actionsController](self, "actionsController");
  else
    -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  return (CNAvatarCardActionListController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)willAddActionsViewToHierarchy
{
  void *v3;
  void *v4;
  id v5;

  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarCardViewController actionsController](self, "actionsController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController addChildViewController:](self, "addChildViewController:", v4);

  }
}

- (void)didAddActionsViewToHierarchy
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarCardViewController actionsController](self, "actionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didMoveToParentViewController:", self);

    -[CNAvatarCardViewController actionsViewControllerHeightConstraint](self, "actionsViewControllerHeightConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3718];
      -[CNAvatarCardViewController actionsViewControllerHeightConstraint](self, "actionsViewControllerHeightConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deactivateConstraints:", v9);

    }
    v10 = (void *)MEMORY[0x1E0CB3718];
    -[CNAvatarCardViewController actionsController](self, "actionsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 8, 0, 0, 0, 0.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController setActionsViewControllerHeightConstraint:](self, "setActionsViewControllerHeightConstraint:", v14);

    -[CNAvatarCardViewController actionsViewControllerHeightConstraint](self, "actionsViewControllerHeightConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1144750080;
    objc_msgSend(v15, "setPriority:", v16);

    -[CNAvatarCardViewController updateActionsControllerHeightConstraint](self, "updateActionsControllerHeightConstraint");
    v17 = (void *)MEMORY[0x1E0CB3718];
    -[CNAvatarCardViewController actionsViewControllerHeightConstraint](self, "actionsViewControllerHeightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v19);

  }
}

- (void)updateActionsControllerHeightConstraint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;

  -[CNAvatarCardViewController actionsViewControllerHeightConstraint](self, "actionsViewControllerHeightConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CNAvatarCardViewController setVisible:](self, "setVisible:", 1);
  -[CNAvatarCardViewController _updatePreferredSize](self, "_updatePreferredSize");
  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CNAvatarCardViewController updateActionsViewBackgroundColor](self, "updateActionsViewBackgroundColor");
}

- (void)updateActionsViewBackgroundColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (UIAccessibilityIsReduceTransparencyEnabled()
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    +[CNUIColorRepository quickActionBackgroundColorReducedTransparency](CNUIColorRepository, "quickActionBackgroundColorReducedTransparency");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNUIColorRepository quickActionBackgroundColorRegular](CNUIColorRepository, "quickActionBackgroundColorRegular");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v5;
  -[CNAvatarCardViewController actionsView](self, "actionsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[CNAvatarCardViewController actionListViewController](self, "actionListViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController cardController](self, "cardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rolloverGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTrackingRolloverWithGestureRecognizer:", v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CNAvatarCardViewController actionListViewController](self, "actionListViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopTrackingRollover");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardViewController;
  -[CNAvatarCardViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CNAvatarCardViewController setVisible:](self, "setVisible:", 0);
  -[CNAvatarCardViewController actionsController](self, "actionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelModels");

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCardViewController;
  v4 = a3;
  -[CNAvatarCardViewController preferredContentSizeDidChangeForChildContentContainer:](&v7, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[CNAvatarCardViewController actionsController](self, "actionsController", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[CNAvatarCardViewController updateActionsControllerHeightConstraint](self, "updateActionsControllerHeightConstraint");
    -[CNAvatarCardViewController _updatePreferredSize](self, "_updatePreferredSize");
  }
}

- (void)_updatePreferredSize
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  CGRect v21;

  -[CNAvatarCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v21);

  -[CNAvatarCardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v6, v7);
  v9 = v8;

  -[CNAvatarCardViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CNAvatarCardViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v12, v14, v16, v9);

  -[CNAvatarCardViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v9);
  -[CNAvatarCardViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[CNAvatarCardViewController delegate](self, "delegate");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cardViewControllerDidUpdatePreferredSize:", self);

  }
}

- (void)refreshActions
{
  id v2;

  -[CNAvatarCardViewController legacyContactActionsView](self, "legacyContactActionsView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshActions");

}

- (id)cardActionsView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  -[CNAvatarCardViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CNAvatarCardViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardViewController:orderedPropertiesForProperties:category:", self, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)cardActionsView:(id)a3 didShowActions:(id)a4
{
  id v5;

  -[CNAvatarCardViewController _updatePreferredSize](self, "_updatePreferredSize", a3, a4);
  -[CNAvatarCardViewController presentationController](self, "presentationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLayoutFittingSizeDidChangeForChildContentContainer:", self);

}

- (id)viewControllerForCardActionsView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNAvatarCardViewController *v7;

  if (-[CNAvatarCardViewController dismissesBeforePerforming](self, "dismissesBeforePerforming", a3))
  {
    -[CNAvatarCardViewController cardController](self, "cardController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardViewController cardController](self, "cardController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewControllerForAvatarCardController:", v6);
    v7 = (CNAvatarCardViewController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
  }
  return v7;
}

- (void)dismissViewControllerForCardActionsView:(id)a3 animated:(BOOL)a4
{
  -[CNAvatarCardViewController dismissAnimated:](self, "dismissAnimated:", a4);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  if (!a3)
  {
    -[CNAvatarCardViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
  -[CNAvatarCardViewController cardController](self, "cardController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CNAvatarCardViewController_dismissAnimated___block_invoke;
  v7[3] = &unk_1E204F648;
  v7[4] = self;
  objc_msgSend(v6, "dismissAnimated:completionHandler:", v3, v7);

}

- (CGRect)transitioningFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double Width;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  -[CNAvatarCardViewController cardController](self, "cardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[CNAvatarCardViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v28);

  -[CNAvatarCardViewController transitioningView](self, "transitioningView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController cardController](self, "cardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", v15, v6, v8, Width, v10);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)transitioningContentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[CNAvatarCardViewController actionsView](self, "actionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CNAvatarCardViewController actionsView](self, "actionsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardViewController transitioningView](self, "transitioningView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toView:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIImage)transitioningImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNAvatarCardViewController cardController](self, "cardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

- (CGRect)transitioningImageFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[CNAvatarCardViewController cardController](self, "cardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentImageFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CNAvatarCardViewController transitioningView](self, "transitioningView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)setTransitioningImageVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = !a3;
  -[CNAvatarCardViewController cardController](self, "cardController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (BOOL)transitioningImageVisible
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CNAvatarCardViewController cardController](self, "cardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden") ^ 1;

  return v5;
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  -[CNAvatarCardViewController dismissAnimated:](self, "dismissAnimated:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  objc_msgSend(v5, "performActionWithContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke;
  v13[3] = &unk_1E204E100;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v7, "addSuccessBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke_2;
  v11[3] = &unk_1E204D1E8;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v7, "addFailureBlock:", v11);

}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNAvatarCardViewController cardController](self, "cardController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithMenuItems:", v5);

}

- (CNAvatarCardController)cardController
{
  return (CNAvatarCardController *)objc_loadWeakRetained((id *)&self->_cardController);
}

- (void)setCardController:(id)a3
{
  objc_storeWeak((id *)&self->_cardController, a3);
}

- (CNAvatarCardViewControllerDelegate)delegate
{
  return (CNAvatarCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)hasHeader
{
  return self->_hasHeader;
}

- (void)setHasHeader:(BOOL)a3
{
  self->_hasHeader = a3;
}

- (BOOL)headerOnTop
{
  return self->_headerOnTop;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CNAvatarCardActionsView)legacyContactActionsView
{
  return self->_legacyContactActionsView;
}

- (void)setLegacyContactActionsView:(id)a3
{
  objc_storeStrong((id *)&self->_legacyContactActionsView, a3);
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (NSLayoutConstraint)actionsViewControllerHeightConstraint
{
  return self->_actionsViewControllerHeightConstraint;
}

- (void)setActionsViewControllerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewControllerHeightConstraint, a3);
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (NSArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalConstraints, a3);
}

- (double)borderMargin
{
  return self->_borderMargin;
}

- (void)setBorderMargin:(double)a3
{
  self->_borderMargin = a3;
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setHeaderContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_headerContainerView, a3);
}

- (UIView)actionsListView
{
  return self->_actionsListView;
}

- (void)setActionsListView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsListView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsListView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_actionsViewControllerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_legacyContactActionsView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_cardController);
}

void __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("Did perform action %@"), *(_QWORD *)(a1 + 32));
}

void __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Did fail to perform action %@, with error: %@"), *(_QWORD *)(a1 + 32), a2);
}

void __46__CNAvatarCardViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 0);

}

@end
