@implementation SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController

- (void)viewDidLoad
{
  SSSWaitingForImageIdentifierUpdatesAlertContentView *v3;
  SSSWaitingForImageIdentifierUpdatesAlertContentView *spinner;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController;
  -[SSSDebugUICatalogContentViewController viewDidLoad](&v44, "viewDidLoad");
  v3 = objc_alloc_init(SSSWaitingForImageIdentifierUpdatesAlertContentView);
  spinner = self->_spinner;
  self->_spinner = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_spinner);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v6, "setTitle:forState:", CFSTR("+"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 36.0));
  objc_msgSend(v7, "setFont:", v8);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "_addProgress", 64);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v10, "setTitle:forState:", CFSTR("-"), 0);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "_removeProgress", 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "font"));
  objc_msgSend(v11, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", v10);

  -[SSSWaitingForImageIdentifierUpdatesAlertContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertContentView centerXAnchor](self->_spinner, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v17));
  objc_msgSend(v15, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertContentView centerYAnchor](self->_spinner, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v19));
  objc_msgSend(v15, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  objc_msgSend(v15, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v17));
  objc_msgSend(v15, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v17));
  objc_msgSend(v15, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  objc_msgSend(v15, "addObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
  objc_msgSend(v15, "addObject:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
  objc_msgSend(v15, "addObject:", v43);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);
}

- (void)_addProgress
{
  SSSWaitingForImageIdentifierUpdatesAlertContentView *spinner;
  double v3;

  spinner = self->_spinner;
  -[SSSWaitingForImageIdentifierUpdatesAlertContentView progress](spinner, "progress");
  -[SSSWaitingForImageIdentifierUpdatesAlertContentView setProgress:](spinner, "setProgress:", v3 + 0.1);
}

- (void)_removeProgress
{
  SSSWaitingForImageIdentifierUpdatesAlertContentView *spinner;
  double v3;

  spinner = self->_spinner;
  -[SSSWaitingForImageIdentifierUpdatesAlertContentView progress](spinner, "progress");
  -[SSSWaitingForImageIdentifierUpdatesAlertContentView setProgress:](spinner, "setProgress:", v3 + -0.1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
