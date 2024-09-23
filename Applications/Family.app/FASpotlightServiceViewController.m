@implementation FASpotlightServiceViewController

- (void)viewDidLoad
{
  SPUIContactViewController **p_spotlightViewController;
  objc_class *v4;
  SPUIContactViewController *v5;
  id v6;
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
  id v31;
  _QWORD v32[4];

  p_spotlightViewController = &self->_spotlightViewController;
  v31 = objc_alloc_init((Class)SPUIContactViewController);
  objc_storeStrong((id *)p_spotlightViewController, v31);
  v4 = (objc_class *)objc_opt_class(SPUIContactViewController);
  if (class_getProperty(v4, "isBackgroundColorViewHidden"))
  {
    v5 = *p_spotlightViewController;
    v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", 1);
    -[SPUIContactViewController setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("isBackgroundColorViewHidden"));

  }
  -[SPUIContactViewController setDelegate:](*p_spotlightViewController, "setDelegate:", self);
  -[FASpotlightServiceViewController addChildViewController:](self, "addChildViewController:", *p_spotlightViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FASpotlightServiceViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIContactViewController view](*p_spotlightViewController, "view"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIContactViewController view](*p_spotlightViewController, "view"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIContactViewController view](*p_spotlightViewController, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FASpotlightServiceViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v32[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIContactViewController view](*p_spotlightViewController, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leftAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FASpotlightServiceViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v32[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIContactViewController view](*p_spotlightViewController, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FASpotlightServiceViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v10));
  v32[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIContactViewController view](*p_spotlightViewController, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FASpotlightServiceViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v32[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  -[SPUIContactViewController didMoveToParentViewController:](*p_spotlightViewController, "didMoveToParentViewController:", self);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FASpotlightServiceVCProtocol);
}

- (void)updateWithContactIdentifier:(id)a3
{
  -[SPUIContactViewController updateWithContactIdentifier:preferredBundleIdentifiers:](self->_spotlightViewController, "updateWithContactIdentifier:preferredBundleIdentifiers:", a3, &__NSArray0__struct);
}

- (SPUIContactViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
}

@end
