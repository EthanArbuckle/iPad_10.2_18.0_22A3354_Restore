@implementation BuddyPasscodeEntryController

- (void)loadView
{
  DevicePINController *v2;
  DevicePINController *pinController;
  id v4;
  id v5;
  UILabel *v6;
  UILabel *statusLabel;
  UILabel *v8;
  UIFont *v9;
  id v10;
  NSNotificationCenter *v11;
  id location[2];
  BuddyPasscodeEntryController *v13;

  v13 = self;
  location[1] = (id)a2;
  v2 = (DevicePINController *)objc_alloc_init((Class)DevicePINController);
  pinController = v13->_pinController;
  v13->_pinController = v2;

  location[0] = objc_msgSend(objc_alloc((Class)BFFPasscodeView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(location[0], "setAutoresizingMask:", 18);
  objc_msgSend(location[0], "setPasscodeViewController:", v13);
  v4 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v5 = objc_msgSend(v4, "backgroundColor");
  objc_msgSend(location[0], "setBackgroundColor:", v5);

  -[BuddyPasscodeEntryController setView:](v13, "setView:", location[0]);
  v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  statusLabel = v13->_statusLabel;
  v13->_statusLabel = v6;

  v8 = v13->_statusLabel;
  v9 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  -[UILabel setFont:](v8, "setFont:", v9);

  -[UILabel setTextAlignment:](v13->_statusLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v13->_statusLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](v13->_statusLabel, "setLineBreakMode:", 0);
  v10 = -[BuddyPasscodeEntryController view](v13, "view");
  objc_msgSend(v10, "addSubview:", v13->_statusLabel);

  v11 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v11, "addObserver:selector:name:object:", v13, "updateStatusMessage", UIApplicationDidBecomeActiveNotification, 0);

  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddyPasscodeEntryController *v5;

  v5 = self;
  v4 = a2;
  -[NSTimer invalidate](self->_statusTimer, "invalidate");
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyPasscodeEntryController;
  -[BuddyPasscodeEntryController dealloc](&v3, "dealloc");
}

- (id)passcodeView
{
  objc_super v3;
  SEL v4;
  BuddyPasscodeEntryController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyPasscodeEntryController;
  return -[BuddyPasscodeEntryController view](&v3, "view");
}

- (BOOL)usesSimplePasscodeEntry
{
  unsigned __int8 v2;
  BOOL v3;
  unint64_t v4;

  v2 = -[BuddyPasscodeEntryController isNumeric](self, "isNumeric", a2);
  v3 = 0;
  if ((v2 & 1) != 0)
  {
    v4 = -[BuddyPasscodeEntryController numericLength](self, "numericLength");
    v3 = 1;
    if (v4 != 4)
      return (id)-[BuddyPasscodeEntryController numericLength](self, "numericLength") == (id)6;
  }
  return v3;
}

- (void)_setupFirstEntry
{
  unsigned int v2;
  id v3;
  NSString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSString *v10;
  id v11;
  id location;
  unsigned int v13;
  int v14;
  id v15[2];
  BuddyPasscodeEntryController *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v14 = 0;
  v13 = objc_msgSend(v15[0], "unlockScreenTypeWithOutSimplePasscodeType:", &v14);
  if (v13)
  {
    if (v13 == 1)
    {
      -[BuddyPasscodeEntryController setNumeric:](v16, "setNumeric:", 1);
      -[BuddyPasscodeEntryController setNumericLength:](v16, "setNumericLength:", 0);
    }
    else
    {
      -[BuddyPasscodeEntryController setNumeric:](v16, "setNumeric:", 0);
    }
  }
  else
  {
    -[BuddyPasscodeEntryController setNumeric:](v16, "setNumeric:", 1);
    if (v14)
      v2 = 6;
    else
      v2 = 4;
    -[BuddyPasscodeEntryController setNumericLength:](v16, "setNumericLength:", v2);
  }
  -[BuddyPasscodeEntryController configurePasscodeTypeUsingAnimations:](v16, "configurePasscodeTypeUsingAnimations:", 0);
  v3 = -[BuddyPasscodeEntryController passcodeView](v16, "passcodeView");
  v4 = -[BuddyPasscodeEntryController titleText](v16, "titleText");
  objc_msgSend(v3, "setTitle:", v4);

  location = 0;
  if (-[BuddyPasscodeEntryController usesSimplePasscodeEntry](v16, "usesSimplePasscodeEntry"))
  {
    v5 = objc_alloc((Class)BFFSimplePasscodeInputView);
    v6 = objc_msgSend(v5, "initWithFrame:numberOfEntryFields:", -[BuddyPasscodeEntryController numericLength](v16, "numericLength"), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  else
  {
    v8 = objc_alloc((Class)BFFComplexPasscodeInputView);
    v6 = objc_msgSend(v8, "initWithFrame:numericOnly:", -[BuddyPasscodeEntryController isNumeric](v16, "isNumeric"), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  v7 = location;
  location = v6;

  v9 = objc_msgSend(location, "instructions");
  v10 = -[BuddyPasscodeEntryController instructions](v16, "instructions");
  objc_msgSend(v9, "setText:", v10);

  v11 = -[BuddyPasscodeEntryController passcodeView](v16, "passcodeView");
  objc_msgSend(v11, "transitionToPasscodeInput:delegate:", location, v16);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  BuddyPasscodeEntryController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)BuddyPasscodeEntryController;
  -[BuddyPasscodeEntryController viewDidLoad](&v2, "viewDidLoad");
  -[BuddyPasscodeEntryController setExtendedLayoutIncludesOpaqueBars:](v4, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[BuddyPasscodeEntryController _setupFirstEntry](v4, "_setupFirstEntry");
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  BuddyPasscodeEntryController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyPasscodeEntryController;
  -[BuddyPasscodeEntryController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v3 = -[BuddyPasscodeEntryController passcodeView](v11, "passcodeView");
  v7 = objc_msgSend(v3, "passcodeInputView");

  objc_msgSend(v7, "becomeFirstResponder");
  v4 = -[BuddyPasscodeEntryController navigationItem](v11, "navigationItem");
  v5 = objc_msgSend(v4, "rightBarButtonItem");
  v6 = objc_msgSend(v7, "passcode");
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v6, "length") != 0);

  -[BuddyPasscodeEntryController updateStatusMessage](v11, "updateStatusMessage");
  objc_storeStrong(&v7, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyPasscodeEntryController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyPasscodeEntryController;
  -[BuddyPasscodeEntryController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v3 = -[BuddyPasscodeEntryController view](v8, "view");
  v4 = objc_msgSend(v3, "passcodeInputView");

  objc_msgSend(v4, "resignFirstResponder");
  objc_storeStrong(&v4, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyPasscodeEntryController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyPasscodeEntryController;
  -[BuddyPasscodeEntryController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  -[BuddyPasscodeEntryController clear](v6, "clear");
}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  double v17;
  UILabel *statusLabel;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  objc_super v39;
  uint64_t v40;
  SEL v41;
  BuddyPasscodeEntryController *v42;

  v42 = self;
  v41 = a2;
  v40 = 0x4024000000000000;
  v39.receiver = self;
  v39.super_class = (Class)BuddyPasscodeEntryController;
  -[BuddyPasscodeEntryController viewDidLayoutSubviews](&v39, "viewDidLayoutSubviews");
  v2 = -[BuddyPasscodeEntryController view](v42, "view");
  v3 = -[BuddyPasscodeEntryController passcodeView](v42, "passcodeView");
  v4 = objc_msgSend(v3, "passcodeInputView");
  v5 = objc_msgSend(v4, "passcodeField");
  objc_msgSend(v5, "frame");
  v35 = v6;
  v34 = v7;
  v37 = v8;
  v36 = v9;
  v10 = -[BuddyPasscodeEntryController passcodeView](v42, "passcodeView");
  v11 = objc_msgSend(v10, "passcodeInputView");
  objc_msgSend(v2, "convertRect:fromView:", v11, v34, v35, v36, v37);
  v38.origin.y = v12;
  v38.origin.x = v13;
  v38.size.height = v14;
  v38.size.width = v15;

  v16 = -[BuddyPasscodeEntryController view](v42, "view");
  objc_msgSend(v16, "bounds");
  v32 = v17;

  statusLabel = v42->_statusLabel;
  sub_10004EC70();
  -[UILabel sizeThatFits:](statusLabel, "sizeThatFits:", v19, v20);
  v33 = v21;
  v22 = -[BuddyPasscodeEntryController view](v42, "view");
  objc_msgSend(v22, "bounds");
  v28 = v23;
  v27 = v24;
  v30 = v25;
  v29 = v26;
  *(float *)&v24 = (v26 - v32) / 2.0;
  v31 = floorf(*(float *)&v24);

  -[UILabel setFrame:](v42->_statusLabel, "setFrame:", v31, CGRectGetMaxY(v38) + 10.0, v32, v33, v27, v28, *(_QWORD *)&v29, v30);
}

- (void)_finishedWithPasscode:(id)a3
{
  id WeakRetained;
  id location[2];
  BuddyPasscodeEntryController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[DevicePINController attemptValidationWithPIN:](v5->_pinController, "attemptValidationWithPIN:", location[0]) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    objc_msgSend(WeakRetained, "passcodeEntryController:didEnterPasscode:", v5, location[0]);

  }
  else
  {
    -[BuddyPasscodeEntryController updateStatusMessage](v5, "updateStatusMessage");
    -[BuddyPasscodeEntryController clear](v5, "clear");
  }
  objc_storeStrong(location, 0);
}

- (void)nextButtonPressed
{
  id v2;
  id v3;
  id location[2];
  BuddyPasscodeEntryController *v5;

  v5 = self;
  location[1] = (id)a2;
  v2 = -[BuddyPasscodeEntryController passcodeView](self, "passcodeView");
  v3 = objc_msgSend(v2, "passcodeInputView");
  location[0] = objc_msgSend(v3, "passcode");

  -[BuddyPasscodeEntryController passcodeInput:enteredPasscode:](v5, "passcodeInput:enteredPasscode:", 0, location[0]);
  objc_storeStrong(location, 0);
}

- (void)updateStatusMessage
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  UILabel *statusLabel;
  NSBundle *v8;
  NSString *v9;
  id v10;
  NSString *v11;
  NSTimer *v12;
  NSTimer *statusTimer;
  UILabel *v14;
  NSBundle *v15;
  NSString *v16;
  NSString *v17;
  id v18;
  unint64_t v19;
  id location;
  unint64_t v21;
  double v22;
  unsigned __int8 v23;
  SEL v24;
  BuddyPasscodeEntryController *v25;

  v25 = self;
  v24 = a2;
  v23 = 0;
  v23 = -[DevicePINController isBlocked](self->_pinController, "isBlocked") & 1;
  v2 = -[BuddyPasscodeEntryController passcodeView](v25, "passcodeView");
  v3 = objc_msgSend(v2, "passcodeInputView");
  objc_msgSend(v3, "setEnabled:", (v23 ^ 1) & 1);

  if ((v23 & 1) != 0)
  {
    v22 = 0.0;
    -[DevicePINController unblockTime](v25->_pinController, "unblockTime");
    v5 = v4;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v22 = v5 - v6;
    *(float *)&v6 = (v5 - v6) / 60.0;
    v21 = (unint64_t)ceilf(*(float *)&v6);
    location = objc_opt_new(NSDateComponentsFormatter);
    objc_msgSend(location, "setUnitsStyle:", 3);
    objc_msgSend(location, "setAllowedUnits:", 64);
    statusLabel = v25->_statusLabel;
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("PASSCODE_BLOCKED_TRY_AGAIN_%@"), &stru_100284738, CFSTR("Localizable"));
    v10 = objc_msgSend(location, "stringFromTimeInterval:", (double)v21 * 60.0);
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10);
    -[UILabel setText:](statusLabel, "setText:", v11);

    -[NSTimer invalidate](v25->_statusTimer, "invalidate");
    v12 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v25, "updateStatusMessage", 0, 0, (double)((int)v22 % 60 + 1));
    statusTimer = v25->_statusTimer;
    v25->_statusTimer = v12;

    objc_storeStrong(&location, 0);
  }
  else
  {
    v19 = (unint64_t)-[DevicePINController numberOfFailedAttempts](v25->_pinController, "numberOfFailedAttempts");
    if ((v19 & 0x8000000000000000) != 0)
    {
      -[UILabel setText:](v25->_statusLabel, "setText:", &stru_100284738);
    }
    else
    {
      v14 = v25->_statusLabel;
      v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ATTEMPT_FAILURES"), &stru_100284738, CFSTR("Localizable"));
      v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v19);
      -[UILabel setText:](v14, "setText:", v17);

    }
  }
  v18 = -[BuddyPasscodeEntryController view](v25, "view");
  objc_msgSend(v18, "setNeedsLayout");

}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  id v5;
  id v6;
  id v7;
  id location[2];
  BuddyPasscodeEntryController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[BuddyPasscodeEntryController navigationItem](v9, "navigationItem");
  v6 = objc_msgSend(v5, "rightBarButtonItem");
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "length") != 0);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v5;
  void *v6;
  void **v7;
  int v8;
  int v9;
  id (*v10)(uint64_t);
  void *v11;
  BuddyPasscodeEntryController *v12;
  id v13;
  dispatch_time_t v14;
  uint64_t v15;
  id v16;
  id location[2];
  BuddyPasscodeEntryController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = objc_msgSend(location[0], "passcodeField");
  objc_msgSend(v5, "forceDisplayIfNeeded");

  v15 = 0x3FB374BC6A7EF9DBLL;
  v14 = dispatch_time(0, (uint64_t)(0.076 * 1000000000.0));
  v6 = &_dispatch_main_q;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_10004F400;
  v11 = &unk_100280D00;
  v12 = v18;
  v13 = v16;
  dispatch_after(v14, (dispatch_queue_t)v6, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)clear
{
  id v2;
  id v3;

  v2 = -[BuddyPasscodeEntryController passcodeView](self, "passcodeView", a2, self);
  v3 = objc_msgSend(v2, "passcodeInputView");
  objc_msgSend(v3, "setPasscode:", &stru_100284738);

}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  id v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  id v8;
  BOOL v9;
  SEL v10;
  BuddyPasscodeEntryController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  if (-[BuddyPasscodeEntryController usesSimplePasscodeEntry](self, "usesSimplePasscodeEntry"))
  {
    v3 = -[BuddyPasscodeEntryController navigationItem](v11, "navigationItem");
    objc_msgSend(v3, "setRightBarButtonItem:animated:", 0, v9);

  }
  else
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_100284738, CFSTR("Localizable"));
    v8 = objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, v11, "nextButtonPressed");

    v7 = -[BuddyPasscodeEntryController navigationItem](v11, "navigationItem");
    objc_msgSend(v7, "setRightBarButtonItem:animated:", v8, v9);

    objc_storeStrong(&v8, 0);
  }
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (unint64_t)numericLength
{
  return self->_numericLength;
}

- (void)setNumericLength:(unint64_t)a3
{
  self->_numericLength = a3;
}

- (BuddyPasscodeEntryDelegate)delegate
{
  return (BuddyPasscodeEntryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_pinController, 0);
}

@end
