@implementation PhotosUIServiceUserSafetyViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosUIServiceUserSafetyViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_rootSheetPresentationController"));
  objc_msgSend(v7, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "actions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  -[PhotosUIServiceUserSafetyViewController setAction:](self, "setAction:", v7);

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PhotosUIServiceUserSafetyViewController;
  -[PhotosUIServiceUserSafetyViewController viewDidLoad](&v10, "viewDidLoad");
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1000046D8;
  v7 = &unk_1000081E8;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PXSharingUserSafetyController interventionViewControllerWithAction:](PXSharingUserSafetyController, "interventionViewControllerWithAction:", &v4));
  -[PhotosUIServiceUserSafetyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)finish:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004600;
  v3[3] = &unk_100008198;
  v3[4] = self;
  v4 = a3;
  -[PhotosUIServiceUserSafetyViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (BSAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
