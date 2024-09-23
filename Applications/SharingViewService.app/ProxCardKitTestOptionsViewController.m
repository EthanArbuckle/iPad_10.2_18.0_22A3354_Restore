@implementation ProxCardKitTestOptionsViewController

- (ProxCardKitTestOptionsViewController)initWithContentView:(id)a3
{
  id v4;
  ProxCardKitTestOptionsViewController *v5;
  ProxCardKitTestOptionsViewController *v6;
  void *v7;
  id v8;
  ProxCardKitTestOptionsViewController *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ProxCardKitTestOptionsViewController;
  v5 = -[ProxCardKitTestOptionsViewController initWithContentView:](&v17, "initWithContentView:", v4);
  v6 = v5;
  if (v5)
  {
    -[ProxCardKitTestOptionsViewController setDismissalType:](v5, "setDismissalType:", 1);
    -[ProxCardKitTestOptionsViewController setTitle:](v6, "setTitle:", CFSTR("Select A Chime"));
    -[ProxCardKitTestOptionsViewController setSubtitle:](v6, "setSubtitle:", CFSTR("Tap a sound to hear it."));
    -[ProxCardKitTestOptionsViewController setOptions:](v6, "setOptions:", &off_1001837F0);
    location = 0;
    objc_initWeak(&location, v6);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100109BE8;
    v14 = &unk_10017E008;
    objc_copyWeak(&v15, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Continue"), 0, &v11));
    v8 = -[ProxCardKitTestOptionsViewController addAction:](v6, "addAction:", v7, v11, v12, v13, v14);

    v9 = v6;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

@end
