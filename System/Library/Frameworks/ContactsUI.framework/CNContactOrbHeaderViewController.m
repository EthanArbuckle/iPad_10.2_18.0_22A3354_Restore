@implementation CNContactOrbHeaderViewController

- (CNContactOrbHeaderViewController)initWithContacts:(id)a3
{
  id v5;
  CNContactOrbHeaderViewController *v6;
  CNContactOrbHeaderViewController *v7;
  CNAvatarCardHeaderView *v8;
  CNContactOrbHeaderView *headerView;
  CNContactOrbHeaderViewController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactOrbHeaderViewController;
  v6 = -[CNContactOrbHeaderViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contacts, a3);
    v8 = -[CNContactOrbHeaderView initWithContact:frame:]([CNAvatarCardHeaderView alloc], "initWithContact:frame:", 0, 0.0, 0.0, 55.0, 55.0);
    headerView = v7->_headerView;
    v7->_headerView = &v8->super;

    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
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
  objc_super v39;
  _QWORD v40[6];

  v40[4] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)CNContactOrbHeaderViewController;
  -[CNContactOrbHeaderViewController viewDidLoad](&v39, sel_viewDidLoad);
  -[CNContactOrbHeaderViewController suggestedHeaderWidth](self, "suggestedHeaderWidth");
  v4 = v3;
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v4, 55.0);

  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatterWithFallBacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactFormatter:", v6);

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlwaysShowsMonogram:", 1);

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCentersPhotoAndLabels:", 1);

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentMargins:", 10.0, 10.0, 10.0, 10.0);

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNContactOrbHeaderViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController contacts](self, "contacts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateWithContacts:", v15);

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v34;
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v29;
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v19;
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v25);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CNContactOrbHeaderViewController;
  -[CNContactOrbHeaderViewController viewWillAppear:](&v17, sel_viewWillAppear_, a3);
  -[CNContactOrbHeaderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  if (v5 == 0.0)
  {
    -[CNContactOrbHeaderViewController suggestedHeaderWidth](self, "suggestedHeaderWidth");
    v8 = v9;
  }
  else
  {
    -[CNContactOrbHeaderViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;

  }
  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148846080;
  LODWORD(v12) = 1112014848;
  objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 0.0, v11, v12);
  v14 = v13;

  -[CNContactOrbHeaderViewController headerView](self, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  -[CNContactOrbHeaderViewController setPreferredContentSize:](self, "setPreferredContentSize:", v16, v14);

}

- (double)suggestedHeaderWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;

  -[CNContactOrbHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CNContactOrbHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 >= v8)
    v5 = v8;
  -[CNContactOrbHeaderViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "horizontalSizeClass");

  if (v10 != 1)
  {
    -[CNContactOrbHeaderViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    if (v12 >= 320.0)
    {
      -[CNContactOrbHeaderViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;

      if (v15 < 414.0)
      {
        -[CNContactOrbHeaderViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v5 = v17;

        return v5;
      }
    }
    else
    {

    }
    if (v5 > 414.0)
      return 414.0;
  }
  return v5;
}

- (CNContactOrbHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
