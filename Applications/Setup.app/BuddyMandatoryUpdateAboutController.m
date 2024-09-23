@implementation BuddyMandatoryUpdateAboutController

- (BuddyMandatoryUpdateAboutController)initWithScanOptions:(id)a3
{
  id v3;
  BuddyMandatoryUpdateAboutController *v4;
  id v5;
  void *v6;
  BuddyMandatoryUpdateAboutController *v7;
  objc_super v9;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)BuddyMandatoryUpdateAboutController;
  v4 = -[BuddyMandatoryUpdateAboutController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v11 = v4;
  objc_storeStrong(&v11, v4);
  if (v4)
  {
    v5 = objc_msgSend(location[0], "copy");
    v6 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v5;

  }
  v7 = (BuddyMandatoryUpdateAboutController *)v11;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (void)loadView
{
  UIColor *v2;
  id v3;
  id v4;
  UIStackView *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  NSArray *v18;
  id v19;
  id v20;
  id v21;
  id location;
  id v23;
  objc_super v24;
  SEL v25;
  BuddyMandatoryUpdateAboutController *v26;
  _QWORD v27[4];

  v26 = self;
  v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)BuddyMandatoryUpdateAboutController;
  -[BuddyMandatoryUpdateAboutController loadView](&v24, "loadView");
  v2 = +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v3 = -[BuddyMandatoryUpdateAboutController view](v26, "view");
  objc_msgSend(v3, "setBackgroundColor:", v2);

  v4 = -[BuddyMandatoryUpdateAboutController view](v26, "view");
  v5 = -[BuddyMandatoryUpdateAboutController topLevelStackView](v26, "topLevelStackView");
  objc_msgSend(v4, "addSubview:", v5);

  v6 = -[BuddyMandatoryUpdateAboutController view](v26, "view");
  v23 = objc_msgSend(v6, "safeAreaLayoutGuide");

  location = -[BuddyMandatoryUpdateAboutController topLevelStackView](v26, "topLevelStackView");
  v21 = objc_msgSend(v23, "topAnchor");
  v20 = objc_msgSend(location, "topAnchor");
  v19 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", -57.0);
  v27[0] = v19;
  v7 = objc_msgSend(v23, "bottomAnchor");
  v8 = objc_msgSend(location, "bottomAnchor");
  v9 = objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:constant:", v8, 57.0);
  v27[1] = v9;
  v10 = objc_msgSend(v23, "leadingAnchor");
  v11 = objc_msgSend(location, "leadingAnchor");
  v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -sub_10007A3E0((uint64_t)v11, v12));
  v27[2] = v13;
  v14 = objc_msgSend(v23, "trailingAnchor");
  v15 = objc_msgSend(location, "trailingAnchor");
  v17 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, sub_10007A3E0((uint64_t)v15, v16));
  v27[3] = v17;
  v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v23, 0);
}

- (void)viewDidLoad
{
  NSBundle *v2;
  NSString *v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  BuddyMandatoryUpdateAboutController *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyMandatoryUpdateAboutController;
  -[BuddyMandatoryUpdateAboutController viewDidLoad](&v7, "viewDidLoad");
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateAboutController));
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_TITLE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  -[BuddyMandatoryUpdateAboutController setTitle:](v9, "setTitle:", v3);

  v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 0, v9, "_doneTapped:");
  v6 = -[BuddyMandatoryUpdateAboutController navigationItem](v9, "navigationItem");
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

}

- (void)_doneTapped:(id)a3
{
  id location[2];
  BuddyMandatoryUpdateAboutController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyMandatoryUpdateAboutController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_storeStrong(location, 0);
}

- (UIStackView)topLevelStackView
{
  id v2;
  id v3;
  UIStackView *v4;
  UIStackView *topLevelStackView;

  if (!self->_topLevelStackView)
  {
    v2 = objc_alloc((Class)UIStackView);
    v3 = -[BuddyMandatoryUpdateAboutController _makeRowViews](self, "_makeRowViews", a2);
    v4 = (UIStackView *)objc_msgSend(v2, "initWithArrangedSubviews:", v3);
    topLevelStackView = self->_topLevelStackView;
    self->_topLevelStackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_topLevelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_topLevelStackView, "setAxis:", 1);
    -[UIStackView setSpacing:](self->_topLevelStackView, "setSpacing:", 16.0);
  }
  return self->_topLevelStackView;
}

- (id)_makeRowViews
{
  SUScanOptions *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  id location;
  id v14[2];
  BuddyMandatoryUpdateAboutController *v15;
  _BYTE v16[128];

  v15 = self;
  v14[1] = (id)a2;
  v2 = -[BuddyMandatoryUpdateAboutController scanOptions](self, "scanOptions");
  v14[0] = +[BuddyMandatoryUpdateAboutRowViewModel viewModelsWithScanOptions:](BuddyMandatoryUpdateAboutRowViewModel, "viewModelsWithScanOptions:", v2);

  location = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v14[0], "count"));
  memset(v11, 0, sizeof(v11));
  v3 = v14[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v11[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v7 = location;
        v8 = -[BuddyMandatoryUpdateAboutController _makeRowViewWithViewModel:](v15, "_makeRowViewWithViewModel:", v12);
        objc_msgSend(v7, "addObject:", v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
    }
    while (v4);
  }

  v9 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
  return v9;
}

- (id)_makeRowViewWithViewModel:(id)a3
{
  BuddyMandatoryUpdateAboutController *v3;
  NSArray *v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  BuddyMandatoryUpdateAboutController *v13;
  _QWORD v14[3];

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = -[BuddyMandatoryUpdateAboutController _makeTitleLabelWithViewModel:](v13, "_makeTitleLabelWithViewModel:", location[0]);
  v10 = -[BuddyMandatoryUpdateAboutController _makeDetailLabelWithViewModel:](v13, "_makeDetailLabelWithViewModel:", location[0]);
  v9 = -[BuddyMandatoryUpdateAboutController _makeSpacer](v13, "_makeSpacer");
  v3 = v13;
  v14[0] = v11;
  v14[1] = v9;
  v14[2] = v10;
  v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3);
  v8 = -[BuddyMandatoryUpdateAboutController _sortViewsForInterfaceDirection:](v3, "_sortViewsForInterfaceDirection:", v4);

  v7 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v8);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setAlignment:", 2);
  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_makeTitleLabelWithViewModel:(id)a3
{
  id v3;
  double v4;
  BuddyMandatoryUpdateAboutController *v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id location[2];
  BuddyMandatoryUpdateAboutController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = objc_msgSend(location[0], "title");
  objc_msgSend(v10, "setText:", v3);

  LODWORD(v4) = 1144750080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  v5 = v12;
  v6 = objc_msgSend(v10, "font");
  v7 = -[BuddyMandatoryUpdateAboutController _boldFontForFont:](v5, "_boldFontForFont:", v6);
  objc_msgSend(v10, "setFont:", v7);

  v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_makeDetailLabelWithViewModel:(id)a3
{
  id v3;
  id v4;
  id v6;
  id location[2];
  BuddyMandatoryUpdateAboutController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = objc_msgSend(location[0], "detail");
  objc_msgSend(v6, "setText:", v3);

  objc_msgSend(v6, "setNumberOfLines:", 3);
  objc_msgSend(v6, "setTextAlignment:", -[BuddyMandatoryUpdateAboutController _detailTextAlignment](v8, "_detailTextAlignment"));
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_makeSpacer
{
  id v2;
  id v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)UIView);
  objc_msgSend(location[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v2 = objc_msgSend(location[0], "widthAnchor");
  v3 = objc_msgSend(v2, "constraintGreaterThanOrEqualToConstant:", 32.0);
  objc_msgSend(v3, "setActive:", 1);

  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_sortViewsForInterfaceDirection:(id)a3
{
  id v3;
  id location[3];
  id v6;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (sub_10012A424())
  {
    v3 = objc_msgSend(location[0], "reverseObjectEnumerator");
    v6 = objc_msgSend(v3, "allObjects");

  }
  else
  {
    v6 = location[0];
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)_detailTextAlignment
{
  if (sub_10012A424())
    return 0;
  else
    return 2;
}

- (id)_boldFontForFont:(id)a3
{
  id v3;
  UIFont *v4;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "fontDescriptor");
  v6 = objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);

  objc_msgSend(location[0], "pointSize");
  v4 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_topLevelStackView, 0);
}

@end
