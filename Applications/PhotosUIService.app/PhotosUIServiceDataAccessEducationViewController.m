@implementation PhotosUIServiceDataAccessEducationViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosUIServiceDataAccessEducationViewController view](self, "view"));
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
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PhotosUIServiceDataAccessEducationViewController;
  -[PhotosUIServiceDataAccessEducationViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosUIServiceDataAccessEducationViewController createEducationViewController](self, "createEducationViewController"));
  -[PhotosUIServiceDataAccessEducationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)buttonTapped:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004A58;
  v5[3] = &unk_1000081C0;
  objc_copyWeak(&v6, &location);
  -[PhotosUIServiceDataAccessEducationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (id)createEducationViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = PXLocalizedString(CFSTR("PICKER_DATA_ACCESS_EDUCATION_UI_TITLE"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = PXLocalizedString(CFSTR("PICKER_DATA_ACCESS_EDUCATION_UI_DETAIL_TEXT"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = PXLocalizedString(CFSTR("PICKER_DATA_ACCESS_EDUCATION_UI_BUTTON_TITLE"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage px_imageNamed:](UIImage, "px_imageNamed:", CFSTR("PhotosPrivacyIcon")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  objc_msgSend(v12, "setTitle:forState:", v10, 0);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "buttonTapped:", 0x2000);
  v13 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v4, v7, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headerView"));
  objc_msgSend(v14, "setAllowFullWidthIcon:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buttonTray"));
  objc_msgSend(v15, "addButton:", v12);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "buttonTapped:"));
  objc_msgSend(v13, "addKeyCommand:", v16);

  objc_msgSend(v13, "setModalInPresentation:", 1);
  objc_msgSend(v13, "setModalPresentationStyle:", 2);

  return v13;
}

@end
