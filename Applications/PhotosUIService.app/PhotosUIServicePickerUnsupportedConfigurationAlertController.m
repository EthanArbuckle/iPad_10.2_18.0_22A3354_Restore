@implementation PhotosUIServicePickerUnsupportedConfigurationAlertController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PhotosUIServicePickerUnsupportedConfigurationAlertController;
  v3 = -[PhotosUIServicePickerUnsupportedConfigurationAlertController viewDidLoad](&v6, "viewDidLoad");
  if (PLHasInternalUI(v3))
    v4 = objc_claimAutoreleasedReturnValue(-[PhotosUIServicePickerUnsupportedConfigurationAlertController createInternalAlertViewController](self, "createInternalAlertViewController"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[PhotosUIServicePickerUnsupportedConfigurationAlertController createAlertViewController](self, "createAlertViewController"));
  v5 = (void *)v4;
  -[PhotosUIServicePickerUnsupportedConfigurationAlertController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_tearDownRemoteViewController
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosUIServicePickerUnsupportedConfigurationAlertController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "deactivate");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PhotosUIServicePickerUnsupportedConfigurationAlertController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "invalidate");

}

- (id)createAlertViewController
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  objc_initWeak(&location, self);
  v3 = PXLocalizedString(CFSTR("PICKER_CONFIGURATION_ALERT_TITLE"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = PXLocalizedString(CFSTR("PICKER_CONFIGURATION_ALERT_MESSAGE"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v7, 1));

  v10 = PXLocalizedString(CFSTR("PICKER_CONFIGURATION_ALERT_BUTTON_LEARN_MORE"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005058;
  v20[3] = &unk_100008210;
  objc_copyWeak(&v21, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v20));
  objc_msgSend(v8, "addAction:", v12);

  v14 = PXLocalizedString(CFSTR("PICKER_CONFIGURATION_ALERT_BUTTON_OK"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000513C;
  v18[3] = &unk_100008210;
  objc_copyWeak(&v19, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v18));
  objc_msgSend(v8, "addAction:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v8;
}

- (id)createInternalAlertViewController
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc_init((Class)PXRadarConfiguration);
  objc_msgSend(v2, "setComponent:", 0);
  objc_msgSend(v2, "setClassification:", 6);
  objc_msgSend(v2, "setAttachmentsIncludeAnyUserAsset:", 0);
  objc_msgSend(v2, "setWantsSystemDiagnostics:", 1);
  objc_msgSend(v2, "setWantsPhotosDiagnostics:", 1);
  objc_msgSend(v2, "setTitle:", CFSTR("[Picker] Photo or Video Unavailable - Unsupported Configuration"));
  objc_msgSend(v2, "setDescription:", CFSTR("Please add the app name and a screenshot if possible."));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004FF8;
  v15[3] = &unk_100008238;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v2, "setCompletionHandler:", v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Photo or Video Unavailable"), CFSTR("This app is using the Photos picker in an unsupported configuration. Please take a screenshot and file a radar.\n[Internal Only]"), 1));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005024;
  v13[3] = &unk_100008260;
  v4 = v2;
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v13));
  objc_msgSend(v3, "addAction:", v5);

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10000502C;
  v11 = &unk_100008210;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &v8));
  objc_msgSend(v3, "addAction:", v6, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v3;
}

@end
