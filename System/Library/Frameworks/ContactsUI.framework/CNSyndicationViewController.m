@implementation CNSyndicationViewController

- (CNSyndicationViewController)initWithGroup:(id)a3 senderContact:(id)a4 actionsViewConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNSyndicationViewController *v12;
  CNSyndicationViewController *v13;
  CNGroupAvatarViewController *v14;
  CNGroupAvatarViewController *groupAvatarViewController;
  CNContactFormatter *v16;
  uint64_t v17;
  CNContactFormatter *contactFormatter;
  void *v19;
  CNSyndicationViewController *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNSyndicationViewController;
  v12 = -[CNSyndicationViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_senderContact, a4);
    objc_storeStrong((id *)&v13->_actionsViewConfiguration, a5);
    v14 = -[CNGroupAvatarViewController initWithGroup:]([CNGroupAvatarViewController alloc], "initWithGroup:", v9);
    groupAvatarViewController = v13->_groupAvatarViewController;
    v13->_groupAvatarViewController = v14;

    v16 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    v17 = 992;
    contactFormatter = v13->_contactFormatter;
    v13->_contactFormatter = v16;

    -[CNContactFormatter setStyle:](v13->_contactFormatter, "setStyle:", 1000);
    -[CNContactFormatter setFallbackStyle:](v13->_contactFormatter, "setFallbackStyle:", -1);
    if (v10)
    {
      -[CNSyndicationViewController subtitleTextForSenderContact:](v13, "subtitleTextForSenderContact:", v10);
    }
    else
    {
      CNContactsUIBundle();
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "localizedStringForKey:value:table:", CFSTR("SYNDICATION_SHARED_WITH_YOU"), &stru_1E20507A8, CFSTR("Localized"));
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v13->_subtitleText, v19);
    if (!v10)
    {

      v19 = (void *)v17;
    }

    v20 = v13;
  }

  return v13;
}

- (id)subtitleTextForSenderContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SYNDICATION_SHARED_BY_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSyndicationViewController contactFormatter](self, "contactFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromContact:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setSubtitleText:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_subtitleText != v6)
  {
    objc_storeStrong((id *)&self->_subtitleText, a3);
    -[CNSyndicationViewController subtitleLabel](self, "subtitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNSyndicationViewController;
  -[CNSyndicationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNSyndicationViewController setupContainerViews](self, "setupContainerViews");
  -[CNSyndicationViewController setupNameViews](self, "setupNameViews");
  -[CNSyndicationViewController setupActionViews](self, "setupActionViews");
}

- (void)setupContainerViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  _QWORD v37[9];

  v37[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[CNSyndicationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSyndicationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[CNSyndicationViewController setNameContainerView:](self, "setNameContainerView:", v5);
  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[CNSyndicationViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = (void *)objc_msgSend(v7, "initWithFrame:");

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSyndicationViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  -[CNSyndicationViewController setActionsContainerView:](self, "setActionsContainerView:", v9);
  -[CNSyndicationViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v34;
  objc_msgSend(v5, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v30;
  v32 = v5;
  objc_msgSend(v5, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v27;
  objc_msgSend(v9, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v23;
  objc_msgSend(v9, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v13;
  objc_msgSend(v9, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v16;
  objc_msgSend(v9, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v20);

}

- (void)setupNameViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  _QWORD v74[18];

  v74[16] = *MEMORY[0x1E0C80C00];
  -[CNSyndicationViewController nameContainerView](self, "nameContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSyndicationViewController groupAvatarViewController](self, "groupAvatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSyndicationViewController groupAvatarViewController](self, "groupAvatarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSyndicationViewController addChildViewController:](self, "addChildViewController:", v6);

  objc_msgSend(v3, "addSubview:", v5);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v7);
  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[CNSyndicationViewController contactFormatter](self, "contactFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSyndicationViewController group](self, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromGroupIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v11);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(v8, "setFont:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v14);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v8);
  -[CNSyndicationViewController setTitleLabel:](self, "setTitleLabel:", v8);
  v15 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[CNSyndicationViewController subtitleText](self, "subtitleText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v18);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v15);
  -[CNSyndicationViewController setSubtitleLabel:](self, "setSubtitleLabel:", v15);
  v52 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v71;
  objc_msgSend(v5, "centerYAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v68;
  objc_msgSend(v5, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToConstant:", 40.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v65;
  objc_msgSend(v5, "widthAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v5;
  objc_msgSend(v5, "heightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v62;
  v19 = v7;
  objc_msgSend(v7, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 10.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v58;
  objc_msgSend(v7, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v74[5] = v55;
  objc_msgSend(v7, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v74[6] = v51;
  objc_msgSend(v7, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v3;
  objc_msgSend(v3, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v74[7] = v48;
  objc_msgSend(v7, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:", v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v74[8] = v42;
  objc_msgSend(v13, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v74[9] = v39;
  objc_msgSend(v13, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v74[10] = v36;
  objc_msgSend(v13, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v7;
  objc_msgSend(v7, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74[11] = v33;
  objc_msgSend(v15, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v74[12] = v30;
  objc_msgSend(v15, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v13;
  objc_msgSend(v13, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v74[13] = v22;
  v43 = v15;
  objc_msgSend(v15, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[14] = v25;
  objc_msgSend(v15, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v74[15] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v29);

}

- (void)setupActionViews
{
  CNActionsView *v3;
  CNActionsView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  CNActionItem *v19;
  void *v20;
  CNActionsView *v21;
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
  id obj;
  id obja;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[CNSyndicationViewController actionsContainerView](self, "actionsContainerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(CNActionsView);
  -[CNActionsView setActionsDelegate:](v3, "setActionsDelegate:", self);
  v4 = v3;
  -[CNActionsView setStyle:](v3, "setStyle:", 5);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CNSyndicationViewController actionsViewConfiguration](self, "actionsViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedActionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[CNSyndicationViewController actionsViewConfiguration](self, "actionsViewConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "actionsPerType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "image");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "cnui_userActionSymbolImageForActionType:scale:withColor:", v11, 2, 0);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;

        v19 = -[CNActionItem initWithImage:type:]([CNActionItem alloc], "initWithImage:type:", v18, v11);
        -[CNActionsView addActionItem:](v4, "addActionItem:", v19);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  -[CNActionsView setTintColor:](v4, "setTintColor:", v20);

  -[CNActionsView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v35, "addSubview:", v4);
  v30 = (void *)MEMORY[0x1E0CB3718];
  -[CNActionsView leadingAnchor](v4, "leadingAnchor");
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v33;
  -[CNActionsView topAnchor](v4, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v22;
  -[CNActionsView bottomAnchor](v4, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v25;
  -[CNActionsView trailingAnchor](v4, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v29);

}

- (void)didSelectAction:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  id v13;

  v6 = a3;
  -[CNSyndicationViewController actionsViewConfiguration](self, "actionsViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionsPerType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "actionBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v13, "actionBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v12);

    }
  }

}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CNContact)senderContact
{
  return self->_senderContact;
}

- (void)setSenderContact:(id)a3
{
  objc_storeStrong((id *)&self->_senderContact, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNGroupIdentityInlineActionsViewConfiguration)actionsViewConfiguration
{
  return self->_actionsViewConfiguration;
}

- (UIView)nameContainerView
{
  return self->_nameContainerView;
}

- (void)setNameContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_nameContainerView, a3);
}

- (CNGroupAvatarViewController)groupAvatarViewController
{
  return self->_groupAvatarViewController;
}

- (void)setGroupAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_groupAvatarViewController, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (CNActionsView)actionsView
{
  return self->_actionsView;
}

- (void)setActionsView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsView, a3);
}

- (UIView)actionsContainerView
{
  return self->_actionsContainerView;
}

- (void)setActionsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsContainerView, 0);
  objc_storeStrong((id *)&self->_actionsView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_groupAvatarViewController, 0);
  objc_storeStrong((id *)&self->_nameContainerView, 0);
  objc_storeStrong((id *)&self->_actionsViewConfiguration, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_senderContact, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1, &__block_literal_global_4111);
  return (id)descriptorForRequiredKeys_cn_once_object_1;
}

void __56__CNSyndicationViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  v6[0] = *MEMORY[0x1E0C966D0];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSyndicationViewController descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  descriptorForRequiredKeys_cn_once_object_1 = v4;

}

@end
