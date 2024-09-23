@implementation CPSPointsOfInterestPickerViewController

- (CPSPointsOfInterestPickerViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  CPSPointsOfInterestPickerViewController *v4;
  CPSPointsOfInterestPickerViewController *v6;
  CPSPointsOfInterestPickerViewController *v8;
  objc_super v9;
  id v10;
  id location[2];
  CPSPointsOfInterestPickerViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSPointsOfInterestPickerViewController;
  v8 = -[CPSBaseEntityContentViewController initWithEntity:resourceProvider:](&v9, sel_initWithEntity_resourceProvider_, location[0], v10);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
    v12->_pickerState = 0;
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (id)pointsOfInterest
{
  return -[CPSBaseEntityContentViewController entity](self, "entity", a2, self);
}

- (id)template
{
  void *v3;
  CPEntityProviding *v4;
  CPSEntityResourceProvider *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  v5 = -[CPSBaseEntityContentViewController resourceProvider](self, "resourceProvider");
  v4 = -[CPSEntityResourceProvider entityTemplate](v5, "entityTemplate");
  v6 = CPSSafeCast_3(v3, v4);

  return v6;
}

- (void)didUpdateEntity:(id)a3
{
  UILabel *v3;
  id v4;
  id v5;
  CPSPointsOfInterestTableView *v6;
  objc_super v7;
  id location[2];
  CPSPointsOfInterestPickerViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSPointsOfInterestPickerViewController;
  -[CPSBaseEntityContentViewController didUpdateEntity:](&v7, sel_didUpdateEntity_, location[0]);
  -[CPSPointsOfInterestPickerViewController transitionToPrimaryCard](v9, "transitionToPrimaryCard");
  v5 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v9, "pointsOfInterest");
  v4 = (id)objc_msgSend(v5, "title");
  v3 = -[CPSPointsOfInterestPickerViewController titleLabel](v9, "titleLabel");
  -[UILabel setText:](v3, "setText:", v4);

  v6 = -[CPSPointsOfInterestPickerViewController tableView](v9, "tableView");
  -[CPSPointsOfInterestTableView reloadData](v6, "reloadData");

  objc_storeStrong(location, 0);
}

- (void)loadView
{
  CPSCardPlatterView *v2;
  id v3[2];
  CPSPointsOfInterestPickerViewController *v4;

  v4 = self;
  v3[1] = (id)a2;
  v2 = [CPSCardPlatterView alloc];
  v3[0] = -[CPSCardPlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v3[0], "setClipsToBounds:", 1);
  -[CPSPointsOfInterestPickerViewController setView:](v4, "setView:", v3[0]);
  objc_storeStrong(v3, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSPointsOfInterestPickerViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestPickerViewController;
  -[CPSPointsOfInterestPickerViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSPointsOfInterestPickerViewController setupViews](v4, "setupViews");
}

- (void)setupViews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  CPSPointsOfInterestTableView *v8;
  id v9;
  uint64_t v10;
  CPSPointsOfInterestTableView *v11;
  id v12;
  id v13;
  double *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CPSActionButton *v23;
  CPSPointsOfInterestPickerInfoView *v24;
  CPSPointsOfInterestTableView *v25;
  id v26[2];
  CPSPointsOfInterestPickerViewController *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BDF6B68]);
  v14 = (double *)MEMORY[0x24BDBF090];
  v26[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v26[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = +[CPSEntityStyles pickerTitleFont](CPSEntityStyles, "pickerTitleFont");
  objc_msgSend(v26[0], "setFont:");

  objc_msgSend(v26[0], "setTextAlignment:", 4);
  v5 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v27, "pointsOfInterest");
  v4 = (id)objc_msgSend(v5, "title");
  objc_msgSend(v26[0], "setText:");

  -[CPSPointsOfInterestPickerViewController setTitleLabel:](v27, "setTitleLabel:", v26[0]);
  v6 = (id)-[CPSPointsOfInterestPickerViewController view](v27, "view");
  objc_msgSend(v6, "addSubview:", v26[0]);

  v25 = -[CPSPointsOfInterestTableView initWithFrame:style:]([CPSPointsOfInterestTableView alloc], "initWithFrame:style:", 0, *v14, v14[1], v14[2], v14[3]);
  -[CPSPointsOfInterestTableView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSPointsOfInterestTableView setDataSource:](v25, "setDataSource:", v27);
  -[CPSPointsOfInterestTableView setDelegate:](v25, "setDelegate:", v27);
  v8 = v25;
  v7 = objc_opt_class();
  v9 = +[CPSPointsOfInterestPickerCell identifier](CPSPointsOfInterestPickerCell, "identifier");
  -[CPSPointsOfInterestTableView registerClass:forCellReuseIdentifier:](v8, "registerClass:forCellReuseIdentifier:", v7);

  v11 = v25;
  v10 = objc_opt_class();
  v12 = +[CPSPointsOfInterestPickerExtendedCell identifier](CPSPointsOfInterestPickerExtendedCell, "identifier");
  -[CPSPointsOfInterestTableView registerClass:forCellReuseIdentifier:](v11, "registerClass:forCellReuseIdentifier:", v10);

  -[CPSPointsOfInterestPickerViewController setTableView:](v27, "setTableView:", v25);
  v13 = (id)-[CPSPointsOfInterestPickerViewController view](v27, "view");
  objc_msgSend(v13, "addSubview:", v25);

  v24 = -[CPSPointsOfInterestPickerInfoView initWithFrame:]([CPSPointsOfInterestPickerInfoView alloc], "initWithFrame:", *v14, v14[1], v14[2], v14[3]);
  -[CPSPointsOfInterestPickerInfoView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSPointsOfInterestPickerInfoView setAlpha:](v24, "setAlpha:");
  -[CPSPointsOfInterestPickerInfoView setDelegate:](v24, "setDelegate:", v27);
  -[CPSPointsOfInterestPickerViewController setInfoView:](v27, "setInfoView:", v24);
  v15 = (id)-[CPSPointsOfInterestPickerViewController view](v27, "view");
  objc_msgSend(v15, "addSubview:", v24);

  v23 = objc_alloc_init(CPSActionButton);
  -[CPSActionButton setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSButton setDelegate:](v23, "setDelegate:", v27);
  -[CPSActionButton setLayoutDelegate:](v23, "setLayoutDelegate:", v27);
  -[CPSActionButton setAlpha:](v23, "setAlpha:", 0.0);
  v19 = (id)CPUILocalizedStringForKey();
  v28[0] = v19;
  v18 = (id)CPUILocalizedStringForKey();
  v28[1] = v18;
  v17 = (id)CPUILocalizedStringForKey();
  v28[2] = v17;
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  -[CPSActionButton setAccessibilityUserInputLabels:](v23, "setAccessibilityUserInputLabels:");

  -[CPSPointsOfInterestPickerViewController setCancelButton:](v27, "setCancelButton:", v23);
  v20 = (id)-[CPSPointsOfInterestPickerViewController view](v27, "view");
  objc_msgSend(v20, "addSubview:", v23);

  v22 = (id)-[CPSPointsOfInterestPickerViewController traitCollection](v27, "traitCollection");
  v21 = (id)CPUIImageCancelGlyph();
  -[CPSActionButton setButtonImage:](v23, "setButtonImage:");

  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(v26, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPointsOfInterestPickerViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointsOfInterestPickerViewController;
  -[CPSPointsOfInterestPickerViewController traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSPointsOfInterestPickerViewController resetLayoutConstraints](v5, "resetLayoutConstraints");
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  void *v2;
  NSArray *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;

  v5 = -[CPSPointsOfInterestPickerViewController layoutConstraints](self, "layoutConstraints");
  v6 = -[NSArray count](v5, "count");

  if (v6)
  {
    v2 = (void *)MEMORY[0x24BDD1628];
    v3 = -[CPSPointsOfInterestPickerViewController layoutConstraints](self, "layoutConstraints");
    objc_msgSend(v2, "deactivateConstraints:");

    -[CPSPointsOfInterestPickerViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
    v4 = (id)-[CPSPointsOfInterestPickerViewController view](self, "view");
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  NSArray *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  CPSPointsOfInterestPickerViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointsOfInterestPickerViewController;
  -[CPSPointsOfInterestPickerViewController updateViewConstraints](&v4, sel_updateViewConstraints);
  v2 = -[CPSPointsOfInterestPickerViewController layoutConstraints](v6, "layoutConstraints");
  v3 = -[NSArray count](v2, "count") != 0;

  if (!v3)
    -[CPSPointsOfInterestPickerViewController setupLayoutConstraints](v6, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  UIFont *v8;
  UILabel *v9;
  id v10;
  UILabel *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UILabel *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  UILabel *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  UILabel *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  CPSPointsOfInterestTableView *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  CPSPointsOfInterestTableView *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  CPSPointsOfInterestTableView *v47;
  id v48;
  id v49;
  UILabel *v50;
  id v51;
  CPSPointsOfInterestTableView *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  CPSActionButton *v58;
  id v59;
  id v60;
  UILabel *v61;
  id v62;
  CPSActionButton *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  CPSPointsOfInterestPickerInfoView *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  CPSPointsOfInterestPickerInfoView *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  CPSPointsOfInterestPickerInfoView *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  CPSPointsOfInterestPickerInfoView *v86;
  id v87;
  void *v88;
  NSArray *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95[2];
  CPSPointsOfInterestPickerViewController *v96;
  _QWORD v97[4];
  _QWORD v98[2];
  _QWORD v99[4];
  _QWORD v100[5];

  v100[4] = *MEMORY[0x24BDAC8D0];
  v96 = self;
  v95[1] = (id)a2;
  v95[0] = (id)objc_opt_new();
  v94 = (id)objc_opt_new();
  v6 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  objc_msgSend(v6, "addLayoutGuide:", v94);

  v93 = 0;
  v92 = 0;
  v29 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v28 = (id)-[UILabel topAnchor](v29, "topAnchor");
  v27 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v26 = (id)objc_msgSend(v27, "safeAreaLayoutGuide");
  v25 = (id)objc_msgSend(v26, "topAnchor");
  v24 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:");
  v100[0] = v24;
  v23 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v22 = (id)-[UILabel leadingAnchor](v23, "leadingAnchor");
  v21 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v20 = (id)objc_msgSend(v21, "safeAreaLayoutGuide");
  v19 = (id)objc_msgSend(v20, "leadingAnchor");
  v18 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", 10.0);
  v100[1] = v18;
  v17 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v16 = (id)-[UILabel trailingAnchor](v17, "trailingAnchor");
  v15 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v14 = (id)objc_msgSend(v15, "safeAreaLayoutGuide");
  v13 = (id)objc_msgSend(v14, "trailingAnchor");
  v12 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v100[2] = v12;
  v11 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v10 = (id)-[UILabel heightAnchor](v11, "heightAnchor");
  v9 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v8 = -[UILabel font](v9, "font");
  -[UIFont lineHeight](v8, "lineHeight");
  v7 = (id)objc_msgSend(v10, "constraintEqualToConstant:");
  v100[3] = v7;
  v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100);
  v3 = v93;
  v93 = v2;

  v52 = -[CPSPointsOfInterestPickerViewController tableView](v96, "tableView");
  v51 = (id)-[CPSPointsOfInterestTableView topAnchor](v52, "topAnchor");
  v50 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v49 = (id)-[UILabel bottomAnchor](v50, "bottomAnchor");
  v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:constant:", 8.0);
  v99[0] = v48;
  v47 = -[CPSPointsOfInterestPickerViewController tableView](v96, "tableView");
  v46 = (id)-[CPSPointsOfInterestTableView leadingAnchor](v47, "leadingAnchor");
  v45 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v44 = (id)objc_msgSend(v45, "safeAreaLayoutGuide");
  v43 = (id)objc_msgSend(v44, "leadingAnchor");
  v42 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
  v99[1] = v42;
  v41 = -[CPSPointsOfInterestPickerViewController tableView](v96, "tableView");
  v40 = (id)-[CPSPointsOfInterestTableView trailingAnchor](v41, "trailingAnchor");
  v39 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v38 = (id)objc_msgSend(v39, "safeAreaLayoutGuide");
  v37 = (id)objc_msgSend(v38, "trailingAnchor");
  v36 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v99[2] = v36;
  v35 = -[CPSPointsOfInterestPickerViewController tableView](v96, "tableView");
  v34 = (id)-[CPSPointsOfInterestTableView bottomAnchor](v35, "bottomAnchor");
  v33 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v32 = (id)objc_msgSend(v33, "safeAreaLayoutGuide");
  v31 = (id)objc_msgSend(v32, "bottomAnchor");
  v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
  v99[3] = v30;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 4);
  v5 = v92;
  v92 = v4;

  v63 = -[CPSPointsOfInterestPickerViewController cancelButton](v96, "cancelButton");
  v62 = (id)-[CPSActionButton topAnchor](v63, "topAnchor");
  v61 = -[CPSPointsOfInterestPickerViewController titleLabel](v96, "titleLabel");
  v60 = (id)-[UILabel topAnchor](v61, "topAnchor");
  v59 = (id)objc_msgSend(v62, "constraintEqualToAnchor:");
  v98[0] = v59;
  v58 = -[CPSPointsOfInterestPickerViewController cancelButton](v96, "cancelButton");
  v57 = (id)-[CPSActionButton trailingAnchor](v58, "trailingAnchor");
  v56 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v55 = (id)objc_msgSend(v56, "safeAreaLayoutGuide");
  v54 = (id)objc_msgSend(v55, "trailingAnchor");
  v53 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:", -10.0);
  v98[1] = v53;
  v91 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 2);

  v86 = -[CPSPointsOfInterestPickerViewController infoView](v96, "infoView");
  v85 = (id)-[CPSPointsOfInterestPickerInfoView topAnchor](v86, "topAnchor");
  v84 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v83 = (id)objc_msgSend(v84, "topAnchor");
  v82 = (id)objc_msgSend(v85, "constraintEqualToAnchor:");
  v97[0] = v82;
  v81 = -[CPSPointsOfInterestPickerViewController infoView](v96, "infoView");
  v80 = (id)-[CPSPointsOfInterestPickerInfoView leadingAnchor](v81, "leadingAnchor");
  v79 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v78 = (id)objc_msgSend(v79, "safeAreaLayoutGuide");
  v77 = (id)objc_msgSend(v78, "leadingAnchor");
  v76 = (id)objc_msgSend(v80, "constraintEqualToAnchor:");
  v97[1] = v76;
  v75 = -[CPSPointsOfInterestPickerViewController infoView](v96, "infoView");
  v74 = (id)-[CPSPointsOfInterestPickerInfoView trailingAnchor](v75, "trailingAnchor");
  v73 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v72 = (id)objc_msgSend(v73, "safeAreaLayoutGuide");
  v71 = (id)objc_msgSend(v72, "trailingAnchor");
  v70 = (id)objc_msgSend(v74, "constraintEqualToAnchor:");
  v97[2] = v70;
  v69 = -[CPSPointsOfInterestPickerViewController infoView](v96, "infoView");
  v68 = (id)-[CPSPointsOfInterestPickerInfoView bottomAnchor](v69, "bottomAnchor");
  v67 = (id)-[CPSPointsOfInterestPickerViewController view](v96, "view");
  v66 = (id)objc_msgSend(v67, "safeAreaLayoutGuide");
  v65 = (id)objc_msgSend(v66, "bottomAnchor");
  v64 = (id)objc_msgSend(v68, "constraintEqualToAnchor:constant:", -8.0);
  v97[3] = v64;
  v90 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 4);

  objc_msgSend(v95[0], "addObjectsFromArray:", v93);
  objc_msgSend(v95[0], "addObjectsFromArray:", v91);
  objc_msgSend(v95[0], "addObjectsFromArray:", v92);
  objc_msgSend(v95[0], "addObjectsFromArray:", v90);
  v87 = (id)objc_msgSend(v95[0], "copy");
  -[CPSPointsOfInterestPickerViewController setLayoutConstraints:](v96, "setLayoutConstraints:");

  v88 = (void *)MEMORY[0x24BDD1628];
  v89 = -[CPSPointsOfInterestPickerViewController layoutConstraints](v96, "layoutConstraints");
  objc_msgSend(v88, "activateConstraints:");

  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v92, 0);
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(v95, 0);
}

- (void)actionButtonPressed:(id)a3 forModel:(id)a4
{
  CPSEntityResourceProvider *v5;
  id v6;
  id v7;
  id location[2];
  CPSPointsOfInterestPickerViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[CPSBaseEntityContentViewController resourceProvider](v9, "resourceProvider");
  v6 = -[CPSEntityResourceProvider actionDelegate](v5, "actionDelegate");

  if (v6)
    objc_msgSend(v6, "entityContentViewController:didPressButton:forPOI:", v6, location[0], v7);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  CPSActionButton *v3;
  CPSActionButton *v4;
  BOOL v5;
  id location[2];
  CPSPointsOfInterestPickerViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (CPSActionButton *)location[0];
  v3 = -[CPSPointsOfInterestPickerViewController cancelButton](v7, "cancelButton");
  v5 = v4 != v3;

  if (!v5)
    -[CPSPointsOfInterestPickerViewController cancelButtonPressed:](v7, "cancelButtonPressed:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)cancelButtonPressed:(id)a3
{
  CPSPointsOfInterestPickerViewController *v3;
  id v4;
  CPSPointsOfInterestPickerDelegate *v5;
  id location[2];
  CPSPointsOfInterestPickerViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSPointsOfInterestPickerViewController delegate](v7, "delegate");
  v3 = v7;
  v4 = -[CPSPointsOfInterestPickerViewController selectedItem](v7, "selectedItem");
  -[CPSPointsOfInterestPickerDelegate picker:didUnhighlightModel:](v5, "picker:didUnhighlightModel:", v3);

  -[CPSPointsOfInterestPickerViewController transitionToPrimaryCard](v7, "transitionToPrimaryCard");
  objc_storeStrong(location, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  id v6;
  int64_t v7;
  id location[2];
  CPSPointsOfInterestPickerViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v9, "pointsOfInterest");
  v5 = (id)objc_msgSend(v6, "pointsOfInterest");
  v7 = objc_msgSend(v5, "count");

  objc_storeStrong(location, 0);
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  double v4;
  double v5;
  double Height;
  double v7;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  BOOL v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  id v41;
  id v42;
  id v43;
  id location[2];
  CPSPointsOfInterestPickerViewController *v45;
  CGRect v46;
  CGRect v47;

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  v34 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v45, "pointsOfInterest");
  v33 = (id)objc_msgSend(v34, "pointsOfInterest");
  v41 = (id)objc_msgSend(v33, "objectAtIndex:", objc_msgSend(v43, "row"));

  v35 = (id)objc_msgSend(v41, "summary");
  v36 = objc_msgSend(v35, "length") != 0;

  v40 = v36;
  if (v36)
  {
    v27 = location[0];
    v28 = +[CPSPointsOfInterestPickerExtendedCell identifier](CPSPointsOfInterestPickerExtendedCell, "identifier");
    v39 = (id)objc_msgSend(v27, "dequeueReusableCellWithIdentifier:");

    v29 = (id)objc_msgSend(v41, "title");
    objc_msgSend(v39, "setTitle:");

    v30 = (id)objc_msgSend(v41, "subtitle");
    objc_msgSend(v39, "setSubtitle:");

    v31 = (id)objc_msgSend(v41, "summary");
    objc_msgSend(v39, "setText:");

    objc_storeStrong(&v42, v39);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    v21 = location[0];
    v22 = +[CPSPointsOfInterestPickerCell identifier](CPSPointsOfInterestPickerCell, "identifier");
    v38 = (id)objc_msgSend(v21, "dequeueReusableCellWithIdentifier:");

    v24 = (id)objc_msgSend(v41, "title");
    v23 = (id)objc_msgSend(v38, "textLabel");
    objc_msgSend(v23, "setText:", v24);

    v26 = (id)objc_msgSend(v41, "subtitle");
    v25 = (id)objc_msgSend(v38, "detailTextLabel");
    objc_msgSend(v25, "setText:", v26);

    objc_storeStrong(&v42, v38);
    objc_storeStrong(&v38, 0);
  }
  v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = (id)objc_msgSend(v41, "title");

  if (v20)
  {
    v19 = (id)objc_msgSend(v41, "title");
    objc_msgSend(v37, "addObject:");

  }
  v18 = (id)objc_msgSend(v41, "subtitle");

  if (v18)
  {
    v17 = (id)objc_msgSend(v41, "subtitle");
    objc_msgSend(v37, "addObject:");

  }
  v16 = (id)objc_msgSend(v41, "summary");

  if (v16)
  {
    v15 = (id)objc_msgSend(v41, "summary");
    objc_msgSend(v37, "addObject:");

  }
  v14 = (id)objc_msgSend(v37, "copy");
  objc_msgSend(v42, "setAccessibilityUserInputLabels:");

  -[CPSPointsOfInterestPickerViewController scrollHeight](v45, "scrollHeight");
  if (v4 == 0.0
    || (-[CPSPointsOfInterestPickerViewController scrollHeight](v45, "scrollHeight"),
        v13 = v5,
        objc_msgSend(v42, "frame"),
        Height = CGRectGetHeight(v46),
        v7 = v13,
        v13 > Height))
  {
    objc_msgSend(v42, "frame");
    -[CPSPointsOfInterestPickerViewController setScrollHeight:](v45, "setScrollHeight:", CGRectGetHeight(v47));
  }
  v10 = v42;
  v11 = -[CPSPointsOfInterestPickerViewController template](v45, "template", v7);
  v9 = objc_msgSend(v11, "selectedIndex");
  objc_msgSend(v10, "setChosen:", v9 == objc_msgSend(v43, "row"));

  v12 = v42;
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];
  CPSPointsOfInterestPickerViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v10, "pointsOfInterest");
  v5 = (id)objc_msgSend(v6, "pointsOfInterest");
  v7 = (id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v8, "row"));

  objc_msgSend(location[0], "scrollToNearestSelectedRowAtScrollPosition:animated:", 2, 1);
  -[CPSPointsOfInterestPickerViewController modelDidSelect:](v10, "modelDidSelect:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];
  CPSPointsOfInterestPickerViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v10, "pointsOfInterest");
  v5 = (id)objc_msgSend(v6, "pointsOfInterest");
  v7 = (id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v8, "row"));

  objc_msgSend(location[0], "scrollToNearestSelectedRowAtScrollPosition:animated:", 2, 1);
  -[CPSPointsOfInterestPickerViewController modelDidDeselect:](v10, "modelDidDeselect:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v5;
  id v6;
  id v7;
  CPSPointsOfInterestPickerDelegate *v8;
  id v9;
  id v10;
  id v11;
  CPSPointsOfInterestPickerDelegate *v12;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  CPSPointsOfInterestPickerViewController *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v15 = location[0];
  v16 = (id)objc_msgSend(v26, "nextFocusedIndexPath");
  v24 = (id)objc_msgSend(v15, "cellForRowAtIndexPath:");

  v20 = (id)objc_msgSend(v26, "previouslyFocusedIndexPath");
  v17 = objc_msgSend(v20, "row");
  v19 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v28, "pointsOfInterest");
  v18 = (id)objc_msgSend(v19, "pointsOfInterest");
  v21 = v17 >= objc_msgSend(v18, "count");

  if (!v21)
  {
    v11 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v28, "pointsOfInterest");
    v10 = (id)objc_msgSend(v11, "pointsOfInterest");
    v9 = (id)objc_msgSend(v26, "previouslyFocusedIndexPath");
    v23 = (id)objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));

    v12 = -[CPSPointsOfInterestPickerViewController delegate](v28, "delegate");
    -[CPSPointsOfInterestPickerDelegate picker:didUnhighlightModel:](v12, "picker:didUnhighlightModel:", v28, v23);

    objc_storeStrong(&v23, 0);
  }
  if ((objc_msgSend(v24, "isHighlighted") & 1) != 0)
  {
    v7 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v28, "pointsOfInterest");
    v6 = (id)objc_msgSend(v7, "pointsOfInterest");
    v5 = (id)objc_msgSend(v26, "nextFocusedIndexPath");
    v22 = (id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "row"));

    v8 = -[CPSPointsOfInterestPickerViewController delegate](v28, "delegate");
    -[CPSPointsOfInterestPickerDelegate picker:didHighlightModel:](v8, "picker:didHighlightModel:", v28, v22);

    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)selectedItem
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  CPSPointsOfInterestTableView *v8;
  id location;
  id v10[2];
  CPSPointsOfInterestPickerViewController *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  v8 = -[CPSPointsOfInterestPickerViewController tableView](self, "tableView");
  location = (id)-[CPSPointsOfInterestTableView indexPathForSelectedRow](v8, "indexPathForSelectedRow");

  if (location)
  {
    v7 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v11, "pointsOfInterest");
    v6 = (id)objc_msgSend(v7, "pointsOfInterest");
    v2 = (id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(location, "row"));
    v3 = v10[0];
    v10[0] = v2;

  }
  v5 = v10[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  return v5;
}

- (void)setSelectedItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  CPSPointsOfInterestTableView *v6;
  id v7[2];
  id location[2];
  CPSPointsOfInterestPickerViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPointsOfInterestPickerViewController pointsOfInterest](v9, "pointsOfInterest");
  v3 = (id)objc_msgSend(v4, "pointsOfInterest");
  v5 = (void *)objc_msgSend(v3, "indexOfObject:", location[0]);

  v7[1] = v5;
  v7[0] = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v5, 0);
  v6 = -[CPSPointsOfInterestPickerViewController tableView](v9, "tableView");
  -[CPSPointsOfInterestTableView selectRowAtIndexPath:animated:scrollPosition:](v6, "selectRowAtIndexPath:animated:scrollPosition:", v7[0], 1, 2);

  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

- (void)modelDidSelect:(id)a3
{
  CPSPointsOfInterestPickerInfoView *v3;
  CPSPointsOfInterestPickerDelegate *v4;
  id location[2];
  CPSPointsOfInterestPickerViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSPointsOfInterestPickerViewController infoView](v6, "infoView");
  -[CPSPointsOfInterestPickerInfoView updateWithModel:](v3, "updateWithModel:", location[0]);

  -[CPSPointsOfInterestPickerViewController transitionToSecondaryCard](v6, "transitionToSecondaryCard");
  v4 = -[CPSPointsOfInterestPickerViewController delegate](v6, "delegate");
  -[CPSPointsOfInterestPickerDelegate picker:didSelectModel:](v4, "picker:didSelectModel:", v6, location[0]);

  objc_storeStrong(location, 0);
}

- (void)modelDidDeselect:(id)a3
{
  CPSPointsOfInterestPickerDelegate *v3;
  id location[2];
  CPSPointsOfInterestPickerViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSPointsOfInterestPickerViewController delegate](v5, "delegate");
  -[CPSPointsOfInterestPickerDelegate picker:didDeselectModel:](v3, "picker:didDeselectModel:", v5, location[0]);

  objc_storeStrong(location, 0);
}

- (void)transitionToPrimaryCard
{
  UIViewPropertyAnimator *v2;
  UIViewPropertyAnimator *v3;
  UIViewPropertyAnimator *v4;
  UIViewPropertyAnimator *v5;
  UIViewPropertyAnimator *v6;
  UIViewPropertyAnimator *v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  id location[2];
  CPSPointsOfInterestPickerViewController *v41;

  v41 = self;
  location[1] = (id)a2;
  if (-[CPSPointsOfInterestPickerViewController pickerState](self, "pickerState"))
  {
    -[CPSPointsOfInterestPickerViewController setPickerState:](v41, "setPickerState:", 0);
    objc_initWeak(location, v41);
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF69A0]), "initWithAnimationCurve:", 2);
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:timingParameters:", v39, 0.25);
    -[CPSPointsOfInterestPickerViewController setAnimator:](v41, "setAnimator:", v8);

    v7 = -[CPSPointsOfInterestPickerViewController animator](v41, "animator");
    v33 = MEMORY[0x24BDAC760];
    v34 = -1073741824;
    v35 = 0;
    v36 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke;
    v37 = &unk_24E26F520;
    objc_copyWeak(&v38, location);
    -[UIViewPropertyAnimator addAnimations:](v7, "addAnimations:", &v33);

    v6 = -[CPSPointsOfInterestPickerViewController animator](v41, "animator");
    v27 = MEMORY[0x24BDAC760];
    v28 = -1073741824;
    v29 = 0;
    v30 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_2;
    v31 = &unk_24E26F520;
    objc_copyWeak(&v32, location);
    -[UIViewPropertyAnimator addAnimations:](v6, "addAnimations:", &v27);

    v5 = -[CPSPointsOfInterestPickerViewController animator](v41, "animator");
    v21 = MEMORY[0x24BDAC760];
    v22 = -1073741824;
    v23 = 0;
    v24 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_3;
    v25 = &unk_24E26F520;
    objc_copyWeak(&v26, location);
    -[UIViewPropertyAnimator addAnimations:](v5, "addAnimations:", &v21);

    v4 = -[CPSPointsOfInterestPickerViewController animator](v41, "animator");
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_4;
    v19 = &unk_24E26F520;
    objc_copyWeak(&v20, location);
    -[UIViewPropertyAnimator addAnimations:](v4, "addAnimations:", &v15);

    v3 = -[CPSPointsOfInterestPickerViewController animator](v41, "animator");
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_5;
    v13 = &unk_24E26F548;
    objc_copyWeak(&v14, location);
    -[UIViewPropertyAnimator addCompletion:](v3, "addCompletion:", &v9);

    v2 = -[CPSPointsOfInterestPickerViewController animator](v41, "animator");
    -[UIViewPropertyAnimator startAnimation](v2, "startAnimation");

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v38);
    objc_storeStrong(&v39, 0);
    objc_destroyWeak(location);
  }
}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "titleLabel");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_2(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "tableView");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_3(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "cancelButton");
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_4(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "infoView");
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeTransition:", a2 == 0);

}

- (void)transitionToSecondaryCard
{
  CPSActionButton *v2;
  id v3;
  id v4;
  CPSPointsOfInterestPickerInfoView *v5;
  UIViewPropertyAnimator *v6;
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *v8;
  UIViewPropertyAnimator *v9;
  UIViewPropertyAnimator *v10;
  UIViewPropertyAnimator *v11;
  id v12;
  char v13;
  CPSActionButton *v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  uint64_t v34;
  int v35;
  int v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45[3];
  id v46;
  id location[2];
  CPSPointsOfInterestPickerViewController *v48;

  v48 = self;
  location[1] = (id)a2;
  if (-[CPSPointsOfInterestPickerViewController pickerState](self, "pickerState") != 1)
  {
    -[CPSPointsOfInterestPickerViewController setPickerState:](v48, "setPickerState:", 1);
    objc_initWeak(location, v48);
    v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF69A0]), "initWithAnimationCurve:", 2);
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:timingParameters:", v46, 0.15);
    -[CPSPointsOfInterestPickerViewController setAnimator:](v48, "setAnimator:", v12);

    v11 = -[CPSPointsOfInterestPickerViewController animator](v48, "animator");
    v40 = MEMORY[0x24BDAC760];
    v41 = -1073741824;
    v42 = 0;
    v43 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke;
    v44 = &unk_24E26F520;
    objc_copyWeak(v45, location);
    -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", &v40);

    v10 = -[CPSPointsOfInterestPickerViewController animator](v48, "animator");
    v34 = MEMORY[0x24BDAC760];
    v35 = -1073741824;
    v36 = 0;
    v37 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_2;
    v38 = &unk_24E26F520;
    objc_copyWeak(&v39, location);
    -[UIViewPropertyAnimator addAnimations:](v10, "addAnimations:", &v34);

    v9 = -[CPSPointsOfInterestPickerViewController animator](v48, "animator");
    v28 = MEMORY[0x24BDAC760];
    v29 = -1073741824;
    v30 = 0;
    v31 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_3;
    v32 = &unk_24E26F520;
    objc_copyWeak(&v33, location);
    -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", &v28);

    v8 = -[CPSPointsOfInterestPickerViewController animator](v48, "animator");
    v22 = MEMORY[0x24BDAC760];
    v23 = -1073741824;
    v24 = 0;
    v25 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_4;
    v26 = &unk_24E26F520;
    objc_copyWeak(&v27, location);
    -[UIViewPropertyAnimator addAnimations:](v8, "addAnimations:", &v22);

    v7 = -[CPSPointsOfInterestPickerViewController animator](v48, "animator");
    v16 = MEMORY[0x24BDAC760];
    v17 = -1073741824;
    v18 = 0;
    v19 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_5;
    v20 = &unk_24E26F548;
    objc_copyWeak(&v21, location);
    -[UIViewPropertyAnimator addCompletion:](v7, "addCompletion:", &v16);

    v6 = -[CPSPointsOfInterestPickerViewController animator](v48, "animator");
    -[UIViewPropertyAnimator startAnimation](v6, "startAnimation");

    v5 = -[CPSPointsOfInterestPickerViewController infoView](v48, "infoView");
    v4 = -[CPSPointsOfInterestPickerInfoView _linearFocusItems](v5, "_linearFocusItems");
    v3 = (id)objc_msgSend(v4, "firstObject");
    v13 = 0;
    if (v3)
    {
      v2 = (CPSActionButton *)v3;
    }
    else
    {
      v14 = -[CPSPointsOfInterestPickerViewController cancelButton](v48, "cancelButton");
      v13 = 1;
      v2 = v14;
    }
    v15 = v2;
    if ((v13 & 1) != 0)

    -[CPSPointsOfInterestPickerViewController _updateFocusedItem:](v48, "_updateFocusedItem:", v15);
    objc_storeStrong(&v15, 0);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v39);
    objc_destroyWeak(v45);
    objc_storeStrong(&v46, 0);
    objc_destroyWeak(location);
  }
}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "titleLabel");
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_2(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "tableView");
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_3(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "cancelButton");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_4(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "infoView");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeTransition:", a2 == 0);

}

- (void)completeTransition:(BOOL)a3
{
  if (a3)
    -[CPSPointsOfInterestPickerViewController setAnimator:](self, "setAnimator:", 0);
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_0();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)buttonGlyphSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_0();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_linearFocusItems
{
  id v3;
  CPSPointsOfInterestPickerInfoView *v4;
  CPSActionButton *v5;
  CPSActionButton *v6;
  id v7;
  CPSPointsOfInterestTableView *v8;
  id location;
  id v10[2];
  CPSPointsOfInterestPickerViewController *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)objc_opt_new();
  if (-[CPSPointsOfInterestPickerViewController pickerState](v11, "pickerState"))
  {
    v6 = -[CPSPointsOfInterestPickerViewController cancelButton](v11, "cancelButton");

    if (v6)
    {
      v5 = -[CPSPointsOfInterestPickerViewController cancelButton](v11, "cancelButton");
      objc_msgSend(v10[0], "addObject:");

    }
    v4 = -[CPSPointsOfInterestPickerViewController infoView](v11, "infoView");
    location = -[CPSPointsOfInterestPickerInfoView _linearFocusItems](v4, "_linearFocusItems");

    if (location)
      objc_msgSend(v10[0], "addObjectsFromArray:", location);
    objc_storeStrong(&location, 0);
  }
  else
  {
    v8 = -[CPSPointsOfInterestPickerViewController tableView](v11, "tableView");
    v7 = -[CPSPointsOfInterestTableView visibleCells](v8, "visibleCells");
    objc_msgSend(v10[0], "addObjectsFromArray:");

  }
  v3 = v10[0];
  objc_storeStrong(v10, 0);
  return v3;
}

- (id)preferredFocusEnvironments
{
  UIFocusEnvironment *v3;
  id v4[2];
  CPSPointsOfInterestPickerViewController *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v5 = self;
  v4[1] = (id)a2;
  v3 = -[CPSPointsOfInterestPickerViewController requestedFocusItem](self, "requestedFocusItem");

  if (v3)
  {
    v4[0] = -[CPSPointsOfInterestPickerViewController requestedFocusItem](v5, "requestedFocusItem");
    -[CPSPointsOfInterestPickerViewController setRequestedFocusItem:](v5, "setRequestedFocusItem:");
    v7[0] = v4[0];
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    objc_storeStrong(v4, 0);
  }
  else
  {
    v6 = MEMORY[0x24BDBD1A8];
  }
  return v6;
}

- (void)_updateFocusedItem:(id)a3
{
  id v3;
  id v4;
  id v5;
  id location[2];
  CPSPointsOfInterestPickerViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSPointsOfInterestPickerViewController setRequestedFocusItem:](v7, "setRequestedFocusItem:", location[0]);
  v3 = objc_alloc(MEMORY[0x24BDF70D0]);
  v5 = (id)objc_msgSend(v3, "initWithEnvironment:", v7);
  objc_msgSend(v5, "setAllowsDeferral:", 0);
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v7);
  objc_msgSend(v4, "_requestFocusUpdate:", v5);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (CPSPointsOfInterestPickerDelegate)delegate
{
  return (CPSPointsOfInterestPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (CPSPointsOfInterestTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (CPSActionButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (double)scrollHeight
{
  return self->_scrollHeight;
}

- (void)setScrollHeight:(double)a3
{
  self->_scrollHeight = a3;
}

- (CPSPointsOfInterestPickerInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_infoView, a3);
}

- (unint64_t)pickerState
{
  return self->_pickerState;
}

- (void)setPickerState:(unint64_t)a3
{
  self->_pickerState = a3;
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UIFocusEnvironment)requestedFocusItem
{
  return self->_requestedFocusItem;
}

- (void)setRequestedFocusItem:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFocusItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedFocusItem, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
