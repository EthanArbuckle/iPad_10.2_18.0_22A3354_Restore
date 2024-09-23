@implementation SFHighlightActivityNotificationViewController

- (SFHighlightActivityNotificationViewController)initWithContact:(id)a3
{
  id v4;
  SFHighlightActivityNotificationViewController *v5;
  uint64_t v6;
  CNContact *contact;
  SFHighlightActivityNotificationViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHighlightActivityNotificationViewController;
  v5 = -[SFHighlightActivityNotificationViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFHighlightActivityNotificationViewController)initWithTitleText:(id)a3
{
  id v4;
  SFHighlightActivityNotificationViewController *v5;
  uint64_t v6;
  NSString *titleText;
  SFHighlightActivityNotificationViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHighlightActivityNotificationViewController;
  v5 = -[SFHighlightActivityNotificationViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    titleText = v5->_titleText;
    v5->_titleText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  SFHighlightActivityNotificationViewController *v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CNAvatarViewController *contactViewController;
  SFHighlightActivityNotificationViewController *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  UILabel *v21;
  UILabel *subtitleLabel;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
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
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  SFHighlightActivityNotificationViewController *v94;
  objc_super v95;
  _QWORD v96[9];
  _QWORD v97[2];
  _QWORD v98[7];
  _QWORD v99[3];

  v2 = self;
  v99[1] = *MEMORY[0x1E0C80C00];
  v95.receiver = self;
  v95.super_class = (Class)SFHighlightActivityNotificationViewController;
  -[SFHighlightActivityNotificationViewController viewDidLoad](&v95, sel_viewDidLoad);
  -[SFHighlightActivityNotificationViewController view](v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  objc_msgSend(v3, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = 0x1E0DC1000uLL;
  v6 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1420]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v8);

  objc_msgSend(v4, "setTextAlignment:", 1);
  LODWORD(v9) = 1132593152;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v9);
  LODWORD(v10) = 1144913920;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  objc_msgSend(v3, "addSubview:", v4);
  if (v2->_contact)
  {
    objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97480], "settingsWithContactStore:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97470]), "initWithSettings:", v13);
    contactViewController = v2->_contactViewController;
    v2->_contactViewController = (CNAvatarViewController *)v14;

    v99[0] = v2->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
    v16 = v2;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarViewController setContacts:](v16->_contactViewController, "setContacts:", v17);

    -[CNAvatarViewController view](v16->_contactViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v18);
    v19 = objc_alloc_init(MEMORY[0x1E0C97218]);
    objc_msgSend(v19, "stringFromContact:", v16->_contact);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v20);

    v2 = v16;
    v5 = 0x1E0DC1000;

  }
  else
  {
    objc_msgSend(v4, "setText:", v2->_titleText);
    v18 = 0;
  }
  v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = v2->_subtitleLabel;
  v2->_subtitleLabel = v21;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(v5 + 848), "_preferredFontForTextStyle:weight:", v6, *MEMORY[0x1E0DC1438]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v2->_subtitleLabel, "setFont:", v23);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v2->_subtitleLabel, "setTextColor:", v24);

  -[UILabel setTextAlignment:](v2->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setText:](v2->_subtitleLabel, "setText:", v2->_messageText);
  objc_msgSend(v3, "addSubview:", v2->_subtitleLabel);
  v25 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v25, "setIdentifier:", CFSTR("SFHighlightActivityNotificationText"));
  objc_msgSend(v3, "addLayoutGuide:", v25);
  objc_msgSend(v3, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0x1E0CB3000uLL;
  v81 = (void *)MEMORY[0x1E0CB3718];
  v93 = v4;
  v94 = v2;
  v91 = v18;
  v92 = v3;
  if (v18)
  {
    objc_msgSend(v18, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v75 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintGreaterThanOrEqualToAnchor:", v75);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v89;
    objc_msgSend(v18, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v69 = objc_claimAutoreleasedReturnValue();
    v87 = v28;
    objc_msgSend(v28, "constraintEqualToAnchor:", v69);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v83;
    objc_msgSend(v18, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v29;
    objc_msgSend(v29, "constraintEqualToAnchor:", v77);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v73;
    objc_msgSend(v18, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToConstant:", 32.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v67;
    objc_msgSend(v18, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToConstant:", 32.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v98[4] = v63;
    objc_msgSend(v25, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v31, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v98[5] = v32;
    objc_msgSend(v26, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v34 = v26;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 24.0);
    v36 = v25;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v98[6] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "activateConstraints:", v38);

    v39 = (void *)v69;
    v25 = v36;
    v40 = (void *)v75;

    v26 = v34;
    v27 = 0x1E0CB3000;

    v3 = v92;
    v4 = v93;

    v2 = v94;
  }
  else
  {
    objc_msgSend(v25, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v41;
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 16.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v89;
    objc_msgSend(v26, "trailingAnchor");
    v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v43 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v42;
    v44 = (void *)v42;
    v39 = (void *)v43;
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 16.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v83;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "activateConstraints:");
  }
  v61 = v26;

  v66 = *(void **)(v27 + 1816);
  objc_msgSend(v25, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintGreaterThanOrEqualToAnchor:", v88);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v86;
  objc_msgSend(v25, "centerYAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v82);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v80;
  objc_msgSend(v4, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v76);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v74;
  objc_msgSend(v4, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v70);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v68;
  objc_msgSend(v4, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v62);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v96[4] = v60;
  -[UILabel leadingAnchor](v2->_subtitleLabel, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v96[5] = v57;
  -[UILabel widthAnchor](v2->_subtitleLabel, "widthAnchor");
  v45 = v25;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v96[6] = v47;
  -[UILabel topAnchor](v2->_subtitleLabel, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v96[7] = v50;
  -[UILabel bottomAnchor](v2->_subtitleLabel, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v45;
  objc_msgSend(v45, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v96[8] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "activateConstraints:", v55);

  objc_msgSend(v92, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SFHighlightActivityNotificationViewController setPreferredContentSize:](v94, "setPreferredContentSize:");

}

- (void)setMessageText:(id)a3
{
  NSString *v4;
  NSString *messageText;
  void *v6;
  id v7;

  v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    messageText = self->_messageText;
    self->_messageText = v4;

    -[UILabel setText:](self->_subtitleLabel, "setText:", v7);
    -[SFHighlightActivityNotificationViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[SFHighlightActivityNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
}

@end
