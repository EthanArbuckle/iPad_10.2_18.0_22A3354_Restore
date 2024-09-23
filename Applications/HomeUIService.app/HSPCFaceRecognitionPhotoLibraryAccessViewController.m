@implementation HSPCFaceRecognitionPhotoLibraryAccessViewController

- (HSPCFaceRecognitionPhotoLibraryAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  HSPCFaceRecognitionPhotoLibraryAccessViewController *v8;
  _QWORD *v9;
  HSPCFaceRecognitionPhotoLibraryAccessViewController *v10;
  HSPCFaceRecognitionPhotoLibraryAccessViewController *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[4];
  HSPCFaceRecognitionPhotoLibraryAccessViewController *v23;

  v6 = a3;
  v7 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000539F8;
  v22[3] = &unk_1000A3460;
  v8 = self;
  v23 = v8;
  v9 = objc_retainBlock(v22);
  v21.receiver = v8;
  v21.super_class = (Class)HSPCFaceRecognitionPhotoLibraryAccessViewController;
  v10 = -[HSPCMVVMShellViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:](&v21, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 2, &stru_1000A3438, v9);
  v11 = v10;
  if (v10)
  {
    -[HSPCFaceRecognitionPhotoLibraryAccessViewController setConfig:](v10, "setConfig:", v7);
    -[HSPCFaceRecognitionPhotoLibraryAccessViewController setCoordinator:](v11, "setCoordinator:", v6);
    v12 = HULocalizedString(CFSTR("HUProximityCardFaceRecognitionPhotoLibraryAccessCard"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[HSPCFaceRecognitionPhotoLibraryAccessViewController setTitle:](v11, "setTitle:", v13);

    v14 = -[HSPCFaceRecognitionPhotoLibraryAccessViewController addProminentButtonWithTitleKey:target:futureSelector:](v11, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v11, "commitConfiguration");
    -[HSPCFaceRecognitionPhotoLibraryAccessViewController setSubtitle:](v11, "setSubtitle:", CFSTR(" "));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFaceRecognitionPhotoLibraryAccessViewController attributedSubtitle](v11, "attributedSubtitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFaceRecognitionPhotoLibraryAccessViewController contentView](v11, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subtitleLabel"));
    objc_msgSend(v17, "setAttributedText:", v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFaceRecognitionPhotoLibraryAccessViewController contentView](v11, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subtitleLabel"));
    objc_msgSend(v19, "setTextAlignment:", 4);

  }
  return v11;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B78);
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult", a3, a4);
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult", a3, a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (id)attributedSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  NSAttributedStringKey v24;
  void *v25;
  NSAttributedStringKey v26;
  void *v27;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 32770));

  objc_msgSend(v23, "pointSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v23));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCaption1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000));

  objc_msgSend(v4, "pointSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4));
  v5 = HULocalizedString(CFSTR("HUProximityCardFaceRecognitionPhotoLibraryAccessCardFeatureSharePeopleWithHouseholdTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v6));

  v9 = (void *)objc_opt_new(NSMutableAttributedString, v8);
  v10 = objc_alloc((Class)NSAttributedString);
  v26 = NSFontAttributeName;
  v27 = v22;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  v12 = objc_msgSend(v10, "initWithString:attributes:", v7, v11);

  v13 = HULocalizedString(CFSTR("HUProximityCardFaceRecognitionPhotoLibraryAccessCardFeatureSharePeopleWithHouseholdSubtitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v14));

  v16 = objc_alloc((Class)NSAttributedString);
  v24 = NSFontAttributeName;
  v25 = v21;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v18 = objc_msgSend(v16, "initWithString:attributes:", v15, v17);

  objc_msgSend(v9, "appendAttributedString:", v12);
  objc_msgSend(v9, "appendAttributedString:", v18);
  v19 = objc_msgSend(v9, "copy");

  return v19;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
