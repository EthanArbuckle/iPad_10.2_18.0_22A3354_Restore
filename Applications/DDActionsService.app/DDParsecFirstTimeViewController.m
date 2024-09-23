@implementation DDParsecFirstTimeViewController

- (DDParsecFirstTimeViewController)initWithNibName:(id)a3 bundle:(id)a4 bag:(id)a5 sceneAwareVariant:(BOOL)a6
{
  id v6;
  id v7;
  NSString *v8;
  id v9;
  id v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  UIScrollView *v23;
  id v24;
  DDParsecFirstTimeViewController *v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  id v35;
  char v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  int v42;
  objc_super v43;
  BOOL v44;
  id v45;
  id v46;
  id location[2];
  id v48;
  DDParsecFirstTimeViewController *v49;

  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v46 = 0;
  objc_storeStrong(&v46, a4);
  v45 = 0;
  objc_storeStrong(&v45, a5);
  v44 = a6;
  v6 = v48;
  v48 = 0;
  v43.receiver = v6;
  v43.super_class = (Class)DDParsecFirstTimeViewController;
  v28 = -[DDParsecFirstTimeViewController initWithNibName:bundle:](&v43, "initWithNibName:bundle:", location[0], v46);
  v48 = v28;
  objc_storeStrong(&v48, v28);
  if (v28)
  {
    v23 = objc_opt_new(UIScrollView);
    objc_msgSend(v48, "setView:");

    v24 = objc_msgSend(v48, "view");
    objc_msgSend(v24, "setAlwaysBounceVertical:", 1);

    v41 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
    v38 = 0;
    v36 = 0;
    if (v44)
    {
      v39 = objc_msgSend(v45, "sceneAwareLookupFirstUseDescriptionText");
      v38 = 1;
      v22 = v39;
    }
    else
    {
      v37 = objc_msgSend(v45, "firstUseDescriptionText");
      v36 = 1;
      v22 = v37;
    }
    v21 = objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v41);
    v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ "), v21);

    if ((v36 & 1) != 0)
    if ((v38 & 1) != 0)

    v20 = objc_msgSend(v45, "firstUseLearnMoreText");
    v33 = 0;
    if (v20)
    {
      v7 = v20;
    }
    else
    {
      v34 = (id)DDLocalizedString(CFSTR("Learn more…"), CFSTR("Title of the button text that shows more information about lookup"));
      v33 = 1;
      v7 = v34;
    }
    v35 = v7;
    if ((v33 & 1) != 0)

    v18 = objc_msgSend(v35, "stringByTrimmingCharactersInSet:", v41);
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ "), v18);
    v9 = v35;
    v35 = v8;

    v19 = objc_alloc((Class)SearchUIFirstTimeExperienceViewController);
    v31 = 0;
    v29 = 0;
    if (v44)
    {
      v32 = objc_msgSend(v45, "sceneAwareLookupEnabledDomains");
      v31 = 1;
      v17 = v32;
    }
    else
    {
      v30 = objc_msgSend(v45, "enabledDomains");
      v29 = 1;
      v17 = v30;
    }
    v16 = (id)DDLocalizedString(CFSTR("Continue"), CFSTR("LookUp Continue Button Text"));
    v10 = objc_msgSend(v19, "initWithDomains:explanationText:learnMoreText:continueButtonTitle:", v17, v40, v35);
    v11 = (void *)*((_QWORD *)v48 + 1);
    *((_QWORD *)v48 + 1) = v10;

    if ((v29 & 1) != 0)
    if ((v31 & 1) != 0)

    objc_msgSend(v48, "addChildViewController:", *((_QWORD *)v48 + 1));
    v14 = objc_msgSend(v48, "view");
    v13 = objc_msgSend(*((id *)v48 + 1), "view");
    objc_msgSend(v14, "addSubview:");

    v15 = objc_msgSend(*((id *)v48 + 1), "view");
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v49 = (DDParsecFirstTimeViewController *)v48;
    v42 = 1;
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v49 = (DDParsecFirstTimeViewController *)v48;
    v42 = 1;
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v48, 0);
  return v49;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  DDParsecFirstTimeViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)DDParsecFirstTimeViewController;
  -[DDParsecFirstTimeViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
  -[DDParsecFirstTimeViewController updateForCurrentTraitCollection](v6, "updateForCurrentTraitCollection");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  DDParsecFirstTimeViewController *v10;
  id location[2];
  DDParsecFirstTimeViewController *v12;
  CGSize v13;

  v13 = a3;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = location[0];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100009B04;
  v9 = &unk_100020808;
  v10 = v12;
  objc_msgSend(v4, "animateAlongsideTransition:completion:");
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)updateForCurrentTraitCollection
{
  double v2;
  double v3;
  double v4;
  UIColor *v5;
  UIColor *v6;
  id v7;
  id v8;
  double v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *leadingConstraint;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *trailingConstraint;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  double v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  char v39;
  UIColor *v40;
  id location;
  char v42;
  UIColor *v43;
  id v44;
  double v45;
  id v46;
  id v47;
  char v48;
  SEL v49;
  DDParsecFirstTimeViewController *v50;

  v50 = self;
  v49 = a2;
  v48 = 0;
  v29 = -[SearchUIFirstTimeExperienceViewController delegate](self->_firstExperienceViewController, "delegate");
  v30 = objc_msgSend(v29, "presentsWithMargins");

  v48 = v30 & 1;
  v33 = -[DDParsecFirstTimeViewController traitCollection](v50, "traitCollection");
  objc_msgSend(v33, "displayScale");
  v31 = v2;
  v32 = -[SearchUIFirstTimeExperienceViewController delegate](v50->_firstExperienceViewController, "delegate");
  objc_msgSend(v32, "setDDViewScale:", v31);

  v47 = -[SearchUIFirstTimeExperienceViewController view](v50->_firstExperienceViewController, "view");
  v46 = -[DDParsecFirstTimeViewController view](v50, "view");
  v3 = 0.0;
  v45 = 0.0;
  if ((v30 & 1) == 0)
    v3 = 8.0;
  v45 = v3;
  v34 = objc_msgSend(v47, "layer");
  objc_msgSend(v34, "cornerRadius");
  v35 = v4 == v45;

  if (!v35)
  {
    v28 = objc_msgSend(v47, "layer");
    objc_msgSend(v28, "setCornerRadius:", v45);

  }
  v42 = 0;
  if ((v48 & 1) != 0)
  {
    v5 = (UIColor *)0;
  }
  else
  {
    v43 = +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
    v42 = 1;
    v5 = v43;
  }
  v44 = v5;
  if ((v42 & 1) != 0)

  v39 = 0;
  if ((v48 & 1) != 0)
  {
    v40 = +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
    v39 = 1;
    v6 = v40;
  }
  else
  {
    v6 = (UIColor *)0;
  }
  location = v6;
  if ((v39 & 1) != 0)

  v7 = objc_msgSend(v47, "backgroundColor");
  v27 = v7 == v44;

  if (!v27)
    objc_msgSend(v47, "setBackgroundColor:", v44);
  v8 = objc_msgSend(v46, "backgroundColor");
  v26 = v8 == location;

  if (!v26)
    objc_msgSend(v46, "setBackgroundColor:", location);
  v9 = 0.0;
  if ((v48 & 1) == 0)
    v9 = 8.0;
  v38 = v9;
  if (v50->_leadingConstraint)
  {
    -[NSLayoutConstraint constant](v50->_leadingConstraint, "constant");
    if (v14 != v38)
      -[NSLayoutConstraint setConstant:](v50->_leadingConstraint, "setConstant:", v38);
    -[NSLayoutConstraint constant](v50->_trailingConstraint, "constant");
    if (v15 != v38)
      -[NSLayoutConstraint setConstant:](v50->_trailingConstraint, "setConstant:", v38);
  }
  else
  {
    v22 = objc_msgSend(v47, "leadingAnchor");
    v21 = objc_msgSend(v46, "safeAreaLayoutGuide");
    v20 = objc_msgSend(v21, "leadingAnchor");
    v10 = (NSLayoutConstraint *)objc_msgSend(v22, "constraintEqualToAnchor:constant:", v38);
    leadingConstraint = v50->_leadingConstraint;
    v50->_leadingConstraint = v10;

    -[NSLayoutConstraint setActive:](v50->_leadingConstraint, "setActive:", 1);
    v25 = objc_msgSend(v46, "safeAreaLayoutGuide");
    v24 = objc_msgSend(v25, "trailingAnchor");
    v23 = objc_msgSend(v47, "trailingAnchor");
    v12 = (NSLayoutConstraint *)objc_msgSend(v24, "constraintEqualToAnchor:constant:", v38);
    trailingConstraint = v50->_trailingConstraint;
    v50->_trailingConstraint = v12;

    -[NSLayoutConstraint setActive:](v50->_trailingConstraint, "setActive:", 1);
  }
  v18 = -[DDParsecFirstTimeViewController view](v50, "view");
  objc_msgSend(v18, "layoutIfNeeded");

  objc_msgSend(v47, "frame");
  v36 = v16;
  v37 = v17;
  v19 = -[DDParsecFirstTimeViewController view](v50, "view");
  objc_msgSend(v19, "setContentSize:", v36, v37);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
}

- (void)setDelegate:(id)a3
{
  id location[2];
  DDParsecFirstTimeViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SearchUIFirstTimeExperienceViewController setDelegate:](v4->_firstExperienceViewController, "setDelegate:", location[0]);
  objc_storeStrong(location, 0);
}

- (SearchUIFirstTimeExperienceDelegate)delegate
{
  return (SearchUIFirstTimeExperienceDelegate *)-[SearchUIFirstTimeExperienceViewController delegate](self->_firstExperienceViewController, "delegate", a2, self);
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_firstExperienceViewController, 0);
}

@end
