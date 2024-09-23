@implementation BuddyProximityAutomatedDeviceEnrollmentCompletionController

- (BuddyProximityAutomatedDeviceEnrollmentCompletionController)init
{
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentCompletionController;
  location = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController initWithTitle:detailText:symbolName:](&v4, "initWithTitle:detailText:symbolName:", &stru_100284738, 0, 0);
  v2 = (BuddyProximityAutomatedDeviceEnrollmentCompletionController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  DMTEnrollmentCompletionViewModel *v3;
  id v4;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_proximityAutomatedDeviceEnrollmentController, location[0]);
  -[BuddyProximityAutomatedDeviceEnrollmentController setDelegate:](v6->_proximityAutomatedDeviceEnrollmentController, "setDelegate:", v6);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentController completionViewModel](v6->_proximityAutomatedDeviceEnrollmentController, "completionViewModel");
  -[BuddyProximityAutomatedDeviceEnrollmentCompletionController configureViewWithViewModel:](v6, "configureViewWithViewModel:", v3, v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentControllerWantsToDisplayShutdownUI:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SBSPresentPowerDownUI();
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 30;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)configureViewWithViewModel:(id)a3
{
  id v3;
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v4;
  id v5;
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController buttonTray](v17, "buttonTray");
  objc_msgSend(v3, "removeAllButtons");

  -[BuddyProximityAutomatedDeviceEnrollmentCompletionController removeVerboseDescriptionButton](v17, "removeVerboseDescriptionButton");
  v4 = v17;
  v5 = objc_msgSend(location[0], "buttonTitle");
  -[BuddyWelcomeController addBoldButton:action:](v4, "addBoldButton:action:", v5, "shutdownButtonTapped:");

  if ((objc_msgSend(location[0], "hasVerboseDescription") & 1) != 0)
  {
    v6 = v17;
    v7 = objc_msgSend(location[0], "linkButtonTitle");
    v8 = -[BuddyWelcomeController createLinkButtonWithTitle:action:](v6, "createLinkButtonWithTitle:action:", v7, "linkButtonTapped:");
    -[BuddyProximityAutomatedDeviceEnrollmentCompletionController setVerboseDescriptionButton:](v17, "setVerboseDescriptionButton:", v8);

    -[BuddyProximityAutomatedDeviceEnrollmentCompletionController displayVerboseDescriptionButton](v17, "displayVerboseDescriptionButton");
  }
  v9 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController headerView](v17, "headerView");
  v10 = objc_msgSend(location[0], "title");
  objc_msgSend(v9, "setTitle:", v10);

  v11 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController headerView](v17, "headerView");
  v12 = objc_msgSend(location[0], "detailText");
  objc_msgSend(v11, "setDetailText:", v12);

  v13 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController headerView](v17, "headerView");
  v14 = objc_msgSend(location[0], "symbolName");
  objc_msgSend(v13, "setSymbol:accessibilityLabel:", v14, 0);

  v15 = objc_msgSend(location[0], "verboseDescriptionText");
  -[BuddyProximityAutomatedDeviceEnrollmentCompletionController setVerboseDescriptionText:](v17, "setVerboseDescriptionText:", v15);

  objc_storeStrong(location, 0);
}

- (void)shutdownButtonTapped:(id)a3
{
  BuddyProximityAutomatedDeviceEnrollmentController *v3;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController proximityAutomatedDeviceEnrollmentController](v5, "proximityAutomatedDeviceEnrollmentController");
  -[BuddyProximityAutomatedDeviceEnrollmentController shutdownButtonTapped](v3, "shutdownButtonTapped");

  objc_storeStrong(location, 0);
}

- (void)linkButtonTapped:(id)a3
{
  UIColor *v3;
  id v4;
  UIFont *v5;
  UIColor *v6;
  NSString *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSArray *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v42;
  _QWORD v43[8];

  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyProximityAutomatedDeviceEnrollmentCompletionController removeVerboseDescriptionButton](v42, "removeVerboseDescriptionButton");
  v40 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v40, "_setCornerRadius:", 8.0);
  v3 = +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
  objc_msgSend(v40, "setBackgroundColor:", v3);

  v4 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v42, "contentView");
  objc_msgSend(v4, "addSubview:", v40);

  v39 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v39, "setNumberOfLines:", 0);
  v5 = +[UIFont monospacedSystemFontOfSize:weight:](UIFont, "monospacedSystemFontOfSize:weight:", 12.0, UIFontWeightRegular);
  objc_msgSend(v39, "setFont:", v5);

  v6 = +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  objc_msgSend(v39, "setTextColor:", v6);

  v7 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController verboseDescriptionText](v42, "verboseDescriptionText");
  objc_msgSend(v39, "setText:", v7);

  objc_msgSend(v39, "sizeToFit");
  objc_msgSend(v40, "addSubview:", v39);
  v31 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v42, "contentView");
  v37 = objc_msgSend(v40, "topAnchor");
  v38 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v42, "contentView");
  v36 = objc_msgSend(v38, "topAnchor");
  v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v43[0] = v35;
  v33 = objc_msgSend(v40, "bottomAnchor");
  v34 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v42, "contentView");
  v32 = objc_msgSend(v34, "bottomAnchor");
  v30 = objc_msgSend(v33, "constraintEqualToAnchor:");
  v43[1] = v30;
  v28 = objc_msgSend(v40, "leadingAnchor");
  v29 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v42, "contentView");
  v27 = objc_msgSend(v29, "leadingAnchor");
  v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v43[2] = v26;
  v24 = objc_msgSend(v40, "trailingAnchor");
  v25 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v42, "contentView");
  v23 = objc_msgSend(v25, "trailingAnchor");
  v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
  v43[3] = v22;
  v21 = objc_msgSend(v39, "topAnchor");
  v20 = objc_msgSend(v40, "topAnchor");
  v19 = objc_msgSend(v21, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);
  v43[4] = v19;
  v18 = objc_msgSend(v39, "bottomAnchor");
  v8 = objc_msgSend(v40, "bottomAnchor");
  v9 = objc_msgSend(v18, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v8, -1.0);
  v43[5] = v9;
  v10 = objc_msgSend(v39, "leadingAnchor");
  v11 = objc_msgSend(v40, "leadingAnchor");
  v12 = objc_msgSend(v10, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v11, 1.0);
  v43[6] = v12;
  v13 = objc_msgSend(v39, "trailingAnchor");
  v14 = objc_msgSend(v40, "trailingAnchor");
  v15 = objc_msgSend(v13, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v14, -1.0);
  v43[7] = v15;
  v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 8);
  objc_msgSend(v31, "addConstraints:", v16);

  v17 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController view](v42, "view");
  objc_msgSend(v17, "layoutIfNeeded");

  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

- (void)removeVerboseDescriptionButton
{
  OBTrayButton *v2;

  v2 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController verboseDescriptionButton](self, "verboseDescriptionButton", a2);
  -[OBTrayButton removeFromSuperview](v2, "removeFromSuperview");

  -[BuddyProximityAutomatedDeviceEnrollmentCompletionController setVerboseDescriptionButton:](self, "setVerboseDescriptionButton:", 0);
}

- (void)displayVerboseDescriptionButton
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSArray *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentCompletionController *v26;
  _QWORD v27[5];

  v26 = self;
  location[1] = (id)a2;
  location[0] = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController verboseDescriptionButton](self, "verboseDescriptionButton");
  v2 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  objc_msgSend(v2, "addSubview:", location[0]);

  v3 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  v23 = objc_msgSend(location[0], "leadingAnchor");
  v24 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  v22 = objc_msgSend(v24, "leadingAnchor");
  v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
  v27[0] = v21;
  v19 = objc_msgSend(location[0], "trailingAnchor");
  v20 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  v18 = objc_msgSend(v20, "trailingAnchor");
  v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
  v27[1] = v17;
  v15 = objc_msgSend(location[0], "topAnchor");
  v16 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  v14 = objc_msgSend(v16, "topAnchor");
  v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v27[2] = v13;
  v4 = objc_msgSend(location[0], "bottomAnchor");
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  v6 = objc_msgSend(v5, "bottomAnchor");
  v7 = objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v27[3] = v7;
  v8 = objc_msgSend(location[0], "centerXAnchor");
  v9 = -[BuddyProximityAutomatedDeviceEnrollmentCompletionController contentView](v26, "contentView");
  v10 = objc_msgSend(v9, "centerXAnchor");
  v11 = objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v27[4] = v11;
  v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 5);
  objc_msgSend(v3, "addConstraints:", v12);

  objc_storeStrong(location, 0);
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (OBTrayButton)verboseDescriptionButton
{
  return self->_verboseDescriptionButton;
}

- (void)setVerboseDescriptionButton:(id)a3
{
  objc_storeStrong((id *)&self->_verboseDescriptionButton, a3);
}

- (NSString)verboseDescriptionText
{
  return self->_verboseDescriptionText;
}

- (void)setVerboseDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verboseDescriptionText, 0);
  objc_storeStrong((id *)&self->_verboseDescriptionButton, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, 0);
}

@end
