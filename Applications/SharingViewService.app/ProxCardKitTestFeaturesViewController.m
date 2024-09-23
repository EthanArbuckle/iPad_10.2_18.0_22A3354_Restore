@implementation ProxCardKitTestFeaturesViewController

- (ProxCardKitTestFeaturesViewController)initWithContentView:(id)a3
{
  ProxCardKitTestFeaturesViewController *v3;
  ProxCardKitTestFeaturesViewController *v4;
  ProxCardKitTestFeaturesViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ProxCardKitTestFeaturesViewController;
  v3 = -[ProxCardKitTestFeaturesViewController initWithContentView:](&v7, "initWithContentView:", a3);
  v4 = v3;
  if (v3)
  {
    -[ProxCardKitTestFeaturesViewController setDismissalType:](v3, "setDismissalType:", 3);
    -[ProxCardKitTestFeaturesViewController setTitle:](v4, "setTitle:", CFSTR("ProxCardKit Test"));
    v5 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ProxCardKitTestFeaturesViewController;
  -[ProxCardKitTestFeaturesViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 72.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("list.bullet"), v3));
  -[ProxCardKitTestFeaturesViewController setFeatureImage:](self, "setFeatureImage:", v4);

  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.fill")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature featureWithTitle:detailText:icon:tintColor:](PRXFeature, "featureWithTitle:detailText:icon:tintColor:", CFSTR("Lorem"), CFSTR("Lorem ipsum dolor sit amet, consectetur adipiscing elit."), v5, v6));
  v8 = -[ProxCardKitTestFeaturesViewController addFeature:](self, "addFeature:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("zzz")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPurpleColor](UIColor, "systemPurpleColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature featureWithTitle:detailText:icon:tintColor:](PRXFeature, "featureWithTitle:detailText:icon:tintColor:", CFSTR("Ipsum"), CFSTR("Lorem ipsum dolor sit amet, consectetur adipiscing elit."), v9, v10));
  v12 = -[ProxCardKitTestFeaturesViewController addFeature:](self, "addFeature:", v11);

  v13 = objc_alloc((Class)PRXFeature);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10010A364;
  v24[3] = &unk_10017DAF8;
  objc_copyWeak(&v25, &location);
  v14 = objc_msgSend(v13, "initWithTitle:detailText:icon:tintColor:valueChangedBlock:", CFSTR("Dolor"), CFSTR("Lorem ipsum dolor sit amet, consectetur adipiscing elit."), 0, 0, v24);
  objc_msgSend(v14, "setOn:", 0);
  v15 = -[ProxCardKitTestFeaturesViewController addFeature:](self, "addFeature:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("house.fill")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature optionalFeatureWithTitle:detailText:icon:tintColor:valueChangedBlock:](PRXFeature, "optionalFeatureWithTitle:detailText:icon:tintColor:valueChangedBlock:", CFSTR("Amet"), CFSTR("Lorem ipsum dolor sit amet, consectetur adipiscing elit."), v16, v17, &stru_10017DB38));
  v19 = -[ProxCardKitTestFeaturesViewController addFeature:](self, "addFeature:", v18);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10010A3D8;
  v22[3] = &unk_10017E008;
  objc_copyWeak(&v23, &location);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Next"), 0, v22));
  v21 = -[ProxCardKitTestFeaturesViewController addAction:](self, "addAction:", v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

@end
