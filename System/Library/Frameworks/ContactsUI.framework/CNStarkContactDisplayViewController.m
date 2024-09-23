@implementation CNStarkContactDisplayViewController

- (CNStarkContactDisplayViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNStarkContactDisplayViewController *v9;
  CNStarkContactDisplayViewController *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setAllowsActions:", 1);
  objc_msgSend(v6, "setAllowsCardActions:", 0);
  objc_msgSend(v6, "setAllowsEditing:", 0);
  objc_msgSend(v6, "setAllowsAddingToAddressBook:", 0);
  objc_msgSend(v6, "setAllowsSharing:", 0);
  objc_msgSend(v6, "setAllowsAddToFavorites:", 0);
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsConferencing:", objc_msgSend(v8, "isFaceTimeAudioAvailable"));

  v12.receiver = self;
  v12.super_class = (Class)CNStarkContactDisplayViewController;
  v9 = -[CNContactContentDisplayViewController initWithContact:contactViewConfiguration:](&v12, sel_initWithContact_contactViewConfiguration_, v7, v6);

  if (v9)
    v10 = v9;

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNStarkContactDisplayViewController bestiMessageQuery](self, "bestiMessageQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactDisplayViewController;
  -[CNContactContentDisplayViewController dealloc](&v4, sel_dealloc);
}

- (id)title
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double Width;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)CNStarkContactDisplayViewController;
  -[CNContactContentDisplayViewController viewWillLayoutSubviews](&v21, sel_viewWillLayoutSubviews);
  -[CNStarkContactDisplayViewController contactNameView](self, "contactNameView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  Width = CGRectGetWidth(v22);
  -[CNStarkContactDisplayViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v14 = CGRectGetWidth(v23) * 0.6;

  if (Width >= v14)
    Width = v14;
  -[CNStarkContactDisplayViewController contactNameView](self, "contactNameView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v5, v7, Width, v11);

  -[CNStarkContactDisplayViewController contactNameView](self, "contactNameView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

  v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
  -[CNStarkContactDisplayViewController contactNameView](self, "contactNameView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCustomView:", v18);
  -[CNStarkContactDisplayViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactDisplayViewController;
  -[CNContactContentDisplayViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNStarkContactDisplayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactDisplayViewController;
  -[CNContactContentDisplayViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CNStarkContactDisplayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (BOOL)isGeminiAvailable
{
  return 0;
}

- (BOOL)shouldDisplayAvatarHeaderView
{
  return 0;
}

- (CGSize)setupTableHeaderView
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hasTableViewHeaderFirstSection
{
  return 0;
}

- (id)displayHeaderView
{
  return 0;
}

- (id)applyContactStyle
{
  return 0;
}

- (void)loadContactViewControllerViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CNStarkContactNameView *v25;
  void *v26;
  CNStarkContactNameView *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  objc_msgSend(v3, "setCellsLayoutCachingEnabled:", 0);
  objc_msgSend(v3, "setBackgroundView:", 0);
  objc_msgSend(v3, "setTableHeaderView:", 0);
  objc_msgSend(v3, "setShouldUseMapTiles:", 0);
  objc_msgSend(v3, "setLayoutMarginsFollowReadableWidth:", 0);
  v30 = *MEMORY[0x1E0DC1138];
  v5 = v30;
  +[CNUIFontRepository carPlayTableViewCellTitleFont](CNUIFontRepository, "carPlayTableViewCellTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  v31 = *MEMORY[0x1E0DC1140];
  v7 = v31;
  +[CNUIColorRepository carPlayTableViewCellTitleTextColor](CNUIColorRepository, "carPlayTableViewCellTitleTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v8;
  v32 = CFSTR("ABHilightedColorAttributeName");
  +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellTitleTextHighlightedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v30, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabelTextAttributes:", v10);

  v28[0] = v5;
  +[CNUIFontRepository carPlayTableViewCellSubtitleFont](CNUIFontRepository, "carPlayTableViewCellSubtitleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v28[1] = v7;
  +[CNUIColorRepository carPlayTableViewCellSubtitleTextColor](CNUIColorRepository, "carPlayTableViewCellSubtitleTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  v28[2] = CFSTR("ABHilightedColorAttributeName");
  +[CNUIColorRepository carPlayTableViewCellSubtitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellSubtitleTextHighlightedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValueTextAttributes:", v14);

  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  v15 = objc_opt_class();
  +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v15, v16);

  v17 = objc_opt_class();
  +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", *MEMORY[0x1E0C967C0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v17, v18);

  v19 = objc_opt_class();
  +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", *MEMORY[0x1E0C966A8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v19, v20);

  v21 = objc_opt_class();
  +[CNContactView cellIdentifierForFaceTimeGroup](CNContactView, "cellIdentifierForFaceTimeGroup");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v21, v22);

  v23 = objc_opt_class();
  +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", *MEMORY[0x1E0C967F0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v23, v24);

  v25 = [CNStarkContactNameView alloc];
  -[CNContactContentDisplayViewController contact](self, "contact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[CNStarkContactNameView initWithName:](v25, "initWithName:", v26);
  -[CNStarkContactDisplayViewController setContactNameView:](self, "setContactNameView:", v27);

}

- (void)setupConstraints
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNStarkContactDisplayViewController activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "safeAreaLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v25;
  objc_msgSend(v5, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  v23 = v5;
  objc_msgSend(v5, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v8;
  objc_msgSend(v5, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController setActivatedConstraints:](self, "setActivatedConstraints:", v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  -[CNStarkContactDisplayViewController activatedConstraints](self, "activatedConstraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v16);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactDisplayViewController;
  -[CNContactContentDisplayViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNStarkContactDisplayViewController _initiateBestiMessagePropertyQuery](self, "_initiateBestiMessagePropertyQuery");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactDisplayViewController;
  -[CNContactContentDisplayViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  +[CNUIColorRepository carPlayTableViewBackgroundColor](CNUIColorRepository, "carPlayTableViewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  +[CNUIColorRepository carPlayTableViewBackgroundColor](CNUIColorRepository, "carPlayTableViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  return 0;
}

- (void)_initiateBestiMessagePropertyQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNPropertyBestIDSValueQuery *v11;
  void *v12;
  CNPropertyBestIDSValueQuery *v13;
  void *v14;
  id v15;

  -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C967C0]);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C966A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "displayItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  objc_msgSend(v5, "displayItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "displayItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v10);

  }
  v11 = [CNPropertyBestIDSValueQuery alloc];
  getIDSServiceNameiMessage_48992();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNPropertyBestIDSValueQuery initWithPropertyItems:service:](v11, "initWithPropertyItems:service:", v6, v12);
  -[CNStarkContactDisplayViewController setBestiMessageQuery:](self, "setBestiMessageQuery:", v13);

  -[CNStarkContactDisplayViewController bestiMessageQuery](self, "bestiMessageQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

}

- (void)queryComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNCardiMessageEmailGroup *v12;
  void *v13;
  CNCardiMessageEmailGroup *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[CNStarkContactDisplayViewController bestiMessageQuery](self, "bestiMessageQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestIDSProperty");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactDisplayViewController iMessageEmailGroup](self, "iMessageEmailGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v9) & 1) != 0)
    {
      -[CNContactContentDisplayViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C967C0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CNStarkContactDisplayViewController iMessageEmailGroup](self, "iMessageEmailGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v22, "setAllowsIMessage:", 1);
      objc_msgSend(v22, "setAllowsEmail:", 0);
      v12 = [CNCardiMessageEmailGroup alloc];
      -[CNContactContentDisplayViewController contact](self, "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CNCardiMessageEmailGroup initWithContact:propertyItem:](v12, "initWithContact:propertyItem:", v13, v22);
      -[CNStarkContactDisplayViewController setIMessageEmailGroup:](self, "setIMessageEmailGroup:", v14);

    }
    -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexOfObject:", v4);

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      v17 = 0;
    else
      v17 = v16 + 1;
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "beginUpdates");
    -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactDisplayViewController iMessageEmailGroup](self, "iMessageEmailGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v20, v17);

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSections:withRowAnimation:", v21, 6);

    objc_msgSend(v18, "endUpdates");
    goto LABEL_12;
  }
LABEL_13:

}

- (CNPropertyBestIDSValueQuery)bestiMessageQuery
{
  return self->_bestiMessageQuery;
}

- (void)setBestiMessageQuery:(id)a3
{
  objc_storeStrong((id *)&self->_bestiMessageQuery, a3);
}

- (CNCardiMessageEmailGroup)iMessageEmailGroup
{
  return self->_iMessageEmailGroup;
}

- (void)setIMessageEmailGroup:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageEmailGroup, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (CNStarkContactNameView)contactNameView
{
  return self->_contactNameView;
}

- (void)setContactNameView:(id)a3
{
  objc_storeStrong((id *)&self->_contactNameView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactNameView, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_iMessageEmailGroup, 0);
  objc_storeStrong((id *)&self->_bestiMessageQuery, 0);
}

+ (int64_t)tableViewStyle
{
  return 0;
}

@end
