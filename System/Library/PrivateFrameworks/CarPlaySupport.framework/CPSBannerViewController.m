@implementation CPSBannerViewController

- (CPSBannerViewController)initWithBannerItem:(id)a3
{
  CPSBannerViewController *v3;
  double v4;
  double v5;
  CPSBannerViewController *v7;
  objc_super v8;
  id location[2];
  CPSBannerViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)CPSBannerViewController;
  v10 = -[CPSBannerViewController init](&v8, sel_init);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bannerItem, location[0]);
    CGSizeMake_16();
    -[CPSBannerViewController setPreferredContentSize:](v10, "setPreferredContentSize:", v4, v5);
  }
  v7 = v10;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (void)_wheelChangedWithEvent:(id)a3
{
  CPSBannerViewControllerDelegate *v3;
  objc_super v4;
  char v5;
  id location[2];
  CPSBannerViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  if (objc_msgSend(location[0], "type") == 7
    && (objc_msgSend(location[0], "subtype") == 202
     || objc_msgSend(location[0], "subtype") == 200
     || objc_msgSend(location[0], "subtype") == 201))
  {
    v3 = -[CPSBannerViewController delegate](v7, "delegate");
    -[CPSBannerViewControllerDelegate bannerViewController:requestsDismissalWithReason:](v3, "bannerViewController:requestsDismissalWithReason:", v7, CFSTR("KnobDismissed"));

    v5 = 1;
  }
  if ((v5 & 1) == 0)
  {
    v4.receiver = v7;
    v4.super_class = (Class)CPSBannerViewController;
    -[CPSBannerViewController _wheelChangedWithEvent:](&v4, sel__wheelChangedWithEvent_, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  PLPlatterView *v6;
  PLPlatterView *v7;
  id v8;
  CPSGuidanceBannerView *v9;
  CPSGuidanceBannerView *v10;
  CPSBannerItem *v11;
  CPSGuidanceBannerView *v12;
  CPSGuidanceBannerView *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CPSGuidanceBannerView *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CPSGuidanceBannerView *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  CPSGuidanceBannerView *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  CPSGuidanceBannerView *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  PLPlatterView *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  PLPlatterView *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  PLPlatterView *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  PLPlatterView *v56;
  CPSGuidanceBannerView *v57;
  CPSGuidanceBannerView *v58;
  CPSGuidanceBannerView *v59;
  id v60;
  id v61;
  id v62;
  objc_super v63;
  SEL v64;
  CPSBannerViewController *v65;
  _QWORD v66[9];

  v66[8] = *MEMORY[0x24BDAC8D0];
  v65 = self;
  v64 = a2;
  v63.receiver = self;
  v63.super_class = (Class)CPSBannerViewController;
  -[CPSBannerViewController viewDidLoad](&v63, sel_viewDidLoad);
  v5 = (id)objc_msgSend(MEMORY[0x24BE72FA0], "platterViewWithStyle:", *MEMORY[0x24BE72FA8]);
  -[CPSBannerViewController setPlatterView:](v65, "setPlatterView:");

  v6 = -[CPSBannerViewController platterView](v65, "platterView");
  -[PLPlatterView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (id)-[CPSBannerViewController view](v65, "view");
  v7 = -[CPSBannerViewController platterView](v65, "platterView");
  objc_msgSend(v8, "addSubview:");

  v9 = [CPSGuidanceBannerView alloc];
  v11 = -[CPSBannerViewController bannerItem](v65, "bannerItem");
  v10 = -[CPSGuidanceBannerView initWithBannerItem:](v9, "initWithBannerItem:");
  -[CPSBannerViewController setBannerView:](v65, "setBannerView:");

  v12 = -[CPSBannerViewController bannerView](v65, "bannerView");
  -[CPSGuidanceBannerView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (id)-[CPSBannerViewController view](v65, "view");
  v13 = -[CPSBannerViewController bannerView](v65, "bannerView");
  objc_msgSend(v14, "addSubview:");

  v15 = (void *)MEMORY[0x24BDD1628];
  v56 = -[CPSBannerViewController platterView](v65, "platterView");
  v55 = (id)-[PLPlatterView leadingAnchor](v56, "leadingAnchor");
  v54 = (id)-[CPSBannerViewController view](v65, "view");
  v53 = (id)objc_msgSend(v54, "leadingAnchor");
  v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
  v66[0] = v52;
  v51 = -[CPSBannerViewController platterView](v65, "platterView");
  v50 = (id)-[PLPlatterView trailingAnchor](v51, "trailingAnchor");
  v49 = (id)-[CPSBannerViewController view](v65, "view");
  v48 = (id)objc_msgSend(v49, "trailingAnchor");
  v47 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v66[1] = v47;
  v46 = -[CPSBannerViewController platterView](v65, "platterView");
  v45 = (id)-[PLPlatterView topAnchor](v46, "topAnchor");
  v44 = (id)-[CPSBannerViewController view](v65, "view");
  v43 = (id)objc_msgSend(v44, "topAnchor");
  v42 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
  v66[2] = v42;
  v41 = -[CPSBannerViewController platterView](v65, "platterView");
  v40 = (id)-[PLPlatterView bottomAnchor](v41, "bottomAnchor");
  v39 = (id)-[CPSBannerViewController view](v65, "view");
  v38 = (id)objc_msgSend(v39, "bottomAnchor");
  v37 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v66[3] = v37;
  v36 = -[CPSBannerViewController bannerView](v65, "bannerView");
  v35 = (id)-[CPSGuidanceBannerView leadingAnchor](v36, "leadingAnchor");
  v34 = (id)-[CPSBannerViewController view](v65, "view");
  v33 = (id)objc_msgSend(v34, "leadingAnchor");
  v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
  v66[4] = v32;
  v31 = -[CPSBannerViewController bannerView](v65, "bannerView");
  v30 = (id)-[CPSGuidanceBannerView trailingAnchor](v31, "trailingAnchor");
  v29 = (id)-[CPSBannerViewController view](v65, "view");
  v28 = (id)objc_msgSend(v29, "trailingAnchor");
  v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
  v66[5] = v27;
  v26 = -[CPSBannerViewController bannerView](v65, "bannerView");
  v25 = (id)-[CPSGuidanceBannerView topAnchor](v26, "topAnchor");
  v24 = (id)-[CPSBannerViewController view](v65, "view");
  v23 = (id)objc_msgSend(v24, "topAnchor");
  v22 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
  v66[6] = v22;
  v21 = -[CPSBannerViewController bannerView](v65, "bannerView");
  v20 = (id)-[CPSGuidanceBannerView bottomAnchor](v21, "bottomAnchor");
  v19 = (id)-[CPSBannerViewController view](v65, "view");
  v18 = (id)objc_msgSend(v19, "bottomAnchor");
  v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v66[7] = v17;
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 8);
  objc_msgSend(v15, "activateConstraints:");

  v2 = objc_alloc(MEMORY[0x24BDF6E80]);
  v62 = (id)objc_msgSend(v2, "initWithTarget:action:", v65, 0x1F5F928AEuLL);
  v57 = -[CPSBannerViewController bannerView](v65, "bannerView");
  -[CPSGuidanceBannerView addGestureRecognizer:](v57, "addGestureRecognizer:", v62);

  v3 = objc_alloc(MEMORY[0x24BDF6E80]);
  v61 = (id)objc_msgSend(v3, "initWithTarget:action:", v65, 0x1F5F928AEuLL);
  objc_msgSend(v61, "setAllowedPressTypes:", &unk_24E29A938);
  v58 = -[CPSBannerViewController bannerView](v65, "bannerView");
  -[CPSGuidanceBannerView addGestureRecognizer:](v58, "addGestureRecognizer:", v61);

  v4 = objc_alloc(MEMORY[0x24BDF6E80]);
  v60 = (id)objc_msgSend(v4, "initWithTarget:action:", v65, sel__handleBackGesture_);
  objc_msgSend(v60, "setAllowedPressTypes:", &unk_24E29A950);
  v59 = -[CPSBannerViewController bannerView](v65, "bannerView");
  -[CPSGuidanceBannerView addGestureRecognizer:](v59, "addGestureRecognizer:", v60);

  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
}

- (void)updateBannerWithBannerItem:(id)a3
{
  CPSGuidanceBannerView *v3;
  id location[2];
  CPSBannerViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_bannerItem, location[0]);
  v3 = -[CPSBannerViewController bannerView](v5, "bannerView");
  -[CPSGuidanceBannerView updateBannerWithBannerItem:](v3, "updateBannerWithBannerItem:", location[0]);

  objc_storeStrong(location, 0);
}

- (NSString)requesterIdentifier
{
  NSString *v3;
  CPSBannerItem *v4;
  id v5;

  v4 = -[CPSBannerViewController bannerItem](self, "bannerItem");
  v3 = -[CPSBannerItem bundleIdentifier](v4, "bundleIdentifier");
  v5 = CPSRequesterIdentifierForBundleIdentifier(v3);

  return (NSString *)v5;
}

- (NSString)requestIdentifier
{
  NSString *v2;
  NSString *requestIdentifier;
  id v5;

  if (!self->_requestIdentifier)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v2 = (NSString *)(id)objc_msgSend(v5, "UUIDString");
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v2;

  }
  return self->_requestIdentifier;
}

- (UIViewController)viewController
{
  return self;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return 1;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v3;
  NSUUID *v4;
  CPSBannerItem *v5;
  CPSBannerViewControllerDelegate *v6;
  CPSBannerViewControllerDelegate *v7;
  char v8;
  id v9;
  id v10;
  id location[2];
  CPSBannerViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(MEMORY[0x24BDF70D0]);
  v10 = (id)objc_msgSend(v3, "initWithEnvironment:", v12);
  objc_msgSend(v10, "setAllowsDeferral:", 0);
  v9 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v12);
  objc_msgSend(v9, "_requestFocusUpdate:", v10);
  v7 = -[CPSBannerViewController delegate](v12, "delegate");
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v6 = -[CPSBannerViewController delegate](v12, "delegate");
    v5 = -[CPSBannerViewController bannerItem](v12, "bannerItem");
    v4 = -[CPSBannerItem identifier](v5, "identifier");
    -[CPSBannerViewControllerDelegate bannerViewControllerDidAppearWithIdentifier:](v6, "bannerViewControllerDidAppearWithIdentifier:");

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  NSUUID *v4;
  CPSBannerItem *v5;
  CPSBannerViewControllerDelegate *v6;
  CPSBannerViewControllerDelegate *v8;
  char v9;
  id v10;
  id location[2];
  CPSBannerViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v8 = -[CPSBannerViewController delegate](v12, "delegate");
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSBannerViewController delegate](v12, "delegate");
    v5 = -[CPSBannerViewController bannerItem](v12, "bannerItem");
    v4 = -[CPSBannerItem identifier](v5, "identifier");
    -[CPSBannerViewControllerDelegate bannerViewControllerDidDisappearWithIdentifier:](v6, "bannerViewControllerDidDisappearWithIdentifier:");

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  -[CPSBannerViewController preferredContentSize](self, "preferredContentSize");
  CGSizeMake_16();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_bannerTapped:(id)a3
{
  NSString *v3;
  CPSBannerItem *v4;
  id v5;
  NSUUID *v6;
  CPSBannerItem *v7;
  CPSBannerViewControllerDelegate *v8;
  CPSBannerViewControllerDelegate *v9;
  char v10;
  id location[2];
  CPSBannerViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = -[CPSBannerViewController delegate](v12, "delegate");
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v8 = -[CPSBannerViewController delegate](v12, "delegate");
    v7 = -[CPSBannerViewController bannerItem](v12, "bannerItem");
    v6 = -[CPSBannerItem identifier](v7, "identifier");
    -[CPSBannerViewControllerDelegate bannerViewControllerTappedWithIdentifier:](v8, "bannerViewControllerTappedWithIdentifier:");

  }
  v5 = (id)objc_msgSend(MEMORY[0x24BE380B0], "dashboardService");
  v4 = -[CPSBannerViewController bannerItem](v12, "bannerItem");
  v3 = -[CPSBannerItem bundleIdentifier](v4, "bundleIdentifier");
  objc_msgSend(v5, "openApplication:withOptions:completion:");

  objc_storeStrong(location, 0);
}

- (void)_handleBackGesture:(id)a3
{
  CPSBannerViewControllerDelegate *v3;
  id location[2];
  CPSBannerViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSBannerViewController delegate](v5, "delegate");
  -[CPSBannerViewControllerDelegate bannerViewController:requestsDismissalWithReason:](v3, "bannerViewController:requestsDismissalWithReason:", v5, CFSTR("BackButton"));

  objc_storeStrong(location, 0);
}

- (CPSBannerViewControllerDelegate)delegate
{
  return (CPSBannerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CPSBannerItem)bannerItem
{
  return self->_bannerItem;
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (CPSGuidanceBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_bannerItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
