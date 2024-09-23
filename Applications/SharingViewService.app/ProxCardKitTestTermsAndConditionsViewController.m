@implementation ProxCardKitTestTermsAndConditionsViewController

- (ProxCardKitTestTermsAndConditionsViewController)init
{
  ProxCardKitTestTermsAndConditionsViewController *v2;
  ProxCardKitTestTermsAndConditionsViewController *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  ProxCardKitTestTermsAndConditionsViewController *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ProxCardKitTestTermsAndConditionsViewController;
  v2 = -[ProxCardKitTestTermsAndConditionsViewController init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    -[ProxCardKitTestTermsAndConditionsViewController setTitle:](v2, "setTitle:", CFSTR("Terms and Conditions"));
    -[ProxCardKitTestTermsAndConditionsViewController setSubtitle:](v3, "setSubtitle:", CFSTR("Please read and agree to the terms and conditions"));
    -[ProxCardKitTestTermsAndConditionsViewController setDisclaimer:](v3, "setDisclaimer:", CFSTR("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur varius neque sed nibh porttitor, sit amet ornare sem feugiat. Donec quam diam, bibendum in nisl eu, facilisis egestas dolor. Nunc elementum, dui et tempus congue, ante sem interdum sem."));
    location = 0;
    objc_initWeak(&location, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("View Terms and Conditions"), 0, &stru_10017DAD0));
    -[ProxCardKitTestTermsAndConditionsViewController setMoreInfoAction:](v3, "setMoreInfoAction:", v4);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100109518;
    v13[3] = &unk_10017E008;
    objc_copyWeak(&v14, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Agree"), 0, v13));
    v6 = -[ProxCardKitTestTermsAndConditionsViewController addAction:](v3, "addAction:", v5);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10010957C;
    v11[3] = &unk_10017E008;
    objc_copyWeak(&v12, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Don't Agree"), 1, v11));
    v8 = -[ProxCardKitTestTermsAndConditionsViewController addAction:](v3, "addAction:", v7);

    v9 = v3;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v3;
}

@end
