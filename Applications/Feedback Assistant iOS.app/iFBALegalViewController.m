@implementation iFBALegalViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
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
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];

  v26.receiver = self;
  v26.super_class = (Class)iFBALegalViewController;
  -[iFBALegalViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants currentiOSLegalDoc](iFBAConstants, "currentiOSLegalDoc"));
  v29[0] = NSDocumentTypeDocumentAttribute;
  v29[1] = NSCharacterEncodingDocumentAttribute;
  v30[0] = NSRTFTextDocumentType;
  v30[1] = &off_1000EE9B8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v6 = objc_msgSend(v3, "initWithURL:options:documentAttributes:error:", v4, v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController textView](self, "textView"));
  objc_msgSend(v7, "setAttributedText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DECLINE"), &stru_1000EA660, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController declineButton](self, "declineButton"));
  objc_msgSend(v10, "setTitle:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_1000EA660, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController acceptButton](self, "acceptButton"));
  objc_msgSend(v13, "setTitle:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v27[0] = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v27[1] = v15;
  v28[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v28[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController view](self, "view"));
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "backgroundColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController textView](self, "textView"));
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController textView](self, "textView"));
  objc_msgSend(v25, "setTextColor:", v24);

  -[iFBALegalViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)iFBALegalViewController;
  -[iFBALegalViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController textView](self, "textView"));
  objc_msgSend(v3, "setContentOffset:", CGPointZero.x, CGPointZero.y);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)iFBALegalViewController;
  -[iFBALegalViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBALegalViewController textView](self, "textView"));
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)iFBALegalViewController;
  -[iFBALegalViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)decline:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AGREEMENT_REQUIREMENT"), &stru_1000EA660, 0));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", &stru_1000EA660, v5, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 1, 0));
  objc_msgSend(v9, "addAction:", v8);

  -[iFBALegalViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)accept:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants sharedUserDefaults](iFBAConstants, "sharedUserDefaults", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[FBKSharedConstants currentLegalVersion](FBKSharedConstants, "currentLegalVersion")));
  objc_msgSend(v4, "setValue:forKey:", v5, FBKAgreedLegalVersionKey);

  -[iFBALegalViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(-[iFBALegalViewController completion](self, "completion"));
  v6[2](v6, 1);

}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIBarButtonItem)acceptButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_acceptButton);
}

- (void)setAcceptButton:(id)a3
{
  objc_storeWeak((id *)&self->_acceptButton, a3);
}

- (UIBarButtonItem)declineButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_declineButton);
}

- (void)setDeclineButton:(id)a3
{
  objc_storeWeak((id *)&self->_declineButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_declineButton);
  objc_destroyWeak((id *)&self->_acceptButton);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end
