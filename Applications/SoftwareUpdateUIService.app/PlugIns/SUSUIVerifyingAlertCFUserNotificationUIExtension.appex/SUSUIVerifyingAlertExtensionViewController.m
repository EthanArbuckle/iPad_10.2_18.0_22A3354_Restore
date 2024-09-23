@implementation SUSUIVerifyingAlertExtensionViewController

- (void)loadView
{
  id v3;

  NSLog(CFSTR("Loading Verify View"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SUSUIVerifyingAlertExtensionViewController viewForAlert](self, "viewForAlert"));
  -[SUSUIVerifyingAlertExtensionViewController setView:](self, "setView:", v3);

}

- (id)viewForAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v26[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUSUIVerifyingAlertExtensionViewController extensionContext](self, "extensionContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inputItems"));

  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
      if (v4)
      {
        v5 = v4;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        if (v6)
        {
          v7 = v6;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeyVerifyingText")));

          if (v8)
            goto LABEL_11;
        }
        else
        {

        }
      }
    }
  }
  if (qword_100008670 != -1)
    dispatch_once(&qword_100008670, &stru_100004160);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100008668, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_VERIFYING_ALERT_BODY"), &stru_1000042E0, CFSTR("ui_alerts")));
LABEL_11:
  v9 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v9, "setColor:", v10);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v11) = 1144750080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v11);
  objc_msgSend(v9, "startAnimating");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v13, 0.0));
  v15 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "setFont:", v14);
  objc_msgSend(v15, "setLineBreakMode:", 2);
  objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v15, "setText:", v8);
  LODWORD(v16) = 1132134400;
  objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);
  v17 = objc_alloc_init((Class)UIView);
  v18 = objc_alloc((Class)UIStackView);
  v26[0] = v9;
  v26[1] = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v20 = objc_msgSend(v18, "initWithArrangedSubviews:", v19);

  objc_msgSend(v17, "addSubview:", v20);
  objc_msgSend(v20, "setAxis:", 0);
  objc_msgSend(v20, "setDistribution:", 2);
  objc_msgSend(v20, "setAlignment:", 3);
  objc_msgSend(v20, "setSpacing:", 1.17549435e-38);
  objc_msgSend(v20, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 10, 0, v17, 10, 1.0, 0.0));
  objc_msgSend(v17, "addConstraint:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 9, 0, v17, 9, 1.0, 0.0));
  objc_msgSend(v17, "addConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 7, -1, v17, 7, 0.899999976, 0.0));
  objc_msgSend(v17, "addConstraint:", v23);

  -[SUSUIVerifyingAlertExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 260.0, 95.0);
  return v17;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
