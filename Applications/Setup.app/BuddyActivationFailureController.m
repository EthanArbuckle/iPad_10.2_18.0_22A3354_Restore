@implementation BuddyActivationFailureController

- (BuddyActivationFailureController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyActivationFailureController *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_ERROR_TITLE"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyActivationFailureController;
  location = -[BuddyActivationFailureController initWithTitle:detailText:icon:](&v7, "initWithTitle:detailText:icon:", v4, 0, 0);
  objc_storeStrong(&location, location);

  v5 = (BuddyActivationFailureController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  BuddyActivationState *v2;
  BuddyActivationError *v3;
  unsigned __int8 v4;
  BuddyActivationState *v5;
  BuddyActivationError *v6;
  unsigned __int8 v7;
  BuddyActivationState *v8;
  BuddyActivationError *v9;
  unsigned __int8 v10;
  BuddyActivationState *v11;
  BuddyActivationError *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSBundle *v16;
  id v17;
  id v18;
  NSString *v19;
  id v20;
  UIImage *v21;
  UIColor *v22;
  id v23;
  BuddyActivationFailureController *v24;
  NSBundle *v25;
  NSString *v26;
  BuddyActivationFailureController *v27;
  NSBundle *v28;
  NSString *v29;
  id location;
  objc_super v31;
  SEL v32;
  BuddyActivationFailureController *v33;

  v33 = self;
  v32 = a2;
  v31.receiver = self;
  v31.super_class = (Class)BuddyActivationFailureController;
  -[BuddyActivationFailureController viewDidLoad](&v31, "viewDidLoad");
  location = 0;
  v2 = -[BuddyActivationFailureController activationState](v33, "activationState");
  v3 = -[BuddyActivationState error](v2, "error");
  v4 = -[BuddyActivationError isConnectionFailure](v3, "isConnectionFailure");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyActivationFailureController activationState](v33, "activationState");
    v6 = -[BuddyActivationState error](v5, "error");
    v7 = -[BuddyActivationError isCellular](v6, "isCellular");

    if ((v7 & 1) != 0)
      objc_storeStrong(&location, CFSTR("ACTIVATION_ERROR_DETAIL_CONNECTION_FAILURE_CELLULAR_WIFI"));
    else
      objc_storeStrong(&location, CFSTR("ACTIVATION_ERROR_DETAIL_CONNECTION_FAILURE_WIRELESS"));
  }
  else
  {
    v8 = -[BuddyActivationFailureController activationState](v33, "activationState");
    v9 = -[BuddyActivationState error](v8, "error");
    v10 = -[BuddyActivationError isCellular](v9, "isCellular");

    if ((v10 & 1) != 0)
      objc_storeStrong(&location, CFSTR("ACTIVATION_ERROR_DETAIL_OTHER_CELLULAR_WIFI"));
    else
      objc_storeStrong(&location, CFSTR("ACTIVATION_ERROR_DETAIL_OTHER_WIRELESS"));
  }
  v11 = -[BuddyActivationFailureController activationState](v33, "activationState");
  v12 = -[BuddyActivationState error](v11, "error");
  v13 = -[BuddyActivationError isCellular](v12, "isCellular");

  if ((v13 & 1) != 0)
  {
    v14 = -[BuddyActivationFailureController navigationItem](v33, "navigationItem");
    objc_msgSend(v14, "setHidesBackButton:", 1);

  }
  v15 = -[BuddyActivationFailureController headerView](v33, "headerView");
  v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", location);
  v18 = (id)SFLocalizableWAPIStringKeyForKey(v17);
  v19 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", v18, &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v15, "setDetailText:", v19);

  v20 = -[BuddyActivationFailureController headerView](v33, "headerView");
  v21 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Alert Icon"));
  v22 = +[UIColor redColor](UIColor, "redColor");
  v23 = -[UIImage _flatImageWithColor:](v21, "_flatImageWithColor:", v22);
  objc_msgSend(v20, "setIcon:accessibilityLabel:", v23, 0);

  v24 = v33;
  v25 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v26 = -[NSBundle localizedStringForKey:value:table:](v25, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v24, "addBoldButton:action:", v26, "_tryAgainTapped:");

  v27 = v33;
  v28 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v29 = -[NSBundle localizedStringForKey:value:table:](v28, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addLinkButton:action:](v27, "addLinkButton:action:", v29, "_otherOptionsTapped:");

  objc_storeStrong(&location, 0);
}

- (void)_tryAgainTapped:(id)a3
{
  id v3;
  void (**v4)(_QWORD);
  id location[2];
  BuddyActivationFailureController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyActivationFailureController restartActivation](v6, "restartActivation");

  if (v3)
  {
    v4 = (void (**)(_QWORD))-[BuddyActivationFailureController restartActivation](v6, "restartActivation");
    v4[2](v4);

  }
  objc_storeStrong(location, 0);
}

- (void)_otherOptionsTapped:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyActivationFailureController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWelcomeController delegate](v5, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", v5);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  BuddyActivationState *v2;
  BuddyActivationError *v3;
  BOOL v4;

  v2 = -[BuddyActivationFailureController activationState](self, "activationState", a2, self);
  v3 = -[BuddyActivationState error](v2, "error");
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (id)restartActivation
{
  return self->_restartActivation;
}

- (void)setRestartActivation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
  objc_storeStrong((id *)&self->_activationState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationState, 0);
  objc_storeStrong(&self->_restartActivation, 0);
}

@end
