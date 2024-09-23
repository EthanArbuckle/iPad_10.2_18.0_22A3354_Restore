@implementation WFServicePINEntryViewController

- (WFServicePINEntryViewController)init
{
  WFServicePINEntryViewController *v2;
  WFServicePINEntryViewController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFServicePINEntryViewController;
  v2 = -[WFServicePINEntryViewController init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = OBJC_IVAR___DevicePINController__mode;
    *(_DWORD *)&v2->DevicePINController_opaque[OBJC_IVAR___DevicePINController__mode] = 3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PSListController appearance](PSListController, "appearance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(v5, "setTextColor:", v6);

    v7 = objc_alloc_init((Class)DevicePINPane);
    objc_msgSend(v7, "setDelegate:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)&v3->DevicePINController_opaque[v4]));
    objc_msgSend(v8, "setProperty:forKey:", v9, CFSTR("mode"));

    -[WFServicePINEntryViewController setSpecifier:](v3, "setSpecifier:", v8);
    -[WFServicePINEntryViewController setPane:](v3, "setPane:", v7);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 16;
  else
    v5 = 17;
  -[WFServicePINEntryViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v5);
  v6.receiver = self;
  v6.super_class = (Class)WFServicePINEntryViewController;
  -[WFServicePINEntryViewController viewDidLoad](&v6, "viewDidLoad");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier"));
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "setProperty:forKey:", v7, kDevicePINControllerDelegate);

    -[WFServicePINEntryViewController setSpecifier:](self, "setSpecifier:", v6);
    v5 = obj;
  }

}

- (void)setPane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFServicePINEntryViewController;
  -[WFServicePINEntryViewController setPane:](&v7, "setPane:", a3);
  v4 = sub_1000026D0(CFSTR("PINCODE_TITLE_LOCKED"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFServicePINEntryViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

}

+ (BOOL)settingEnabled
{
  return +[PSRestrictionsPINController settingEnabled](PSRestrictionsPINController, "settingEnabled");
}

- (id)stringsTable
{
  return CFSTR("WebContentAnalysisUI");
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  return 0;
}

- (BOOL)validatePIN:(id)a3
{
  return +[PSRestrictionsPasscodeController validatePIN:](PSRestrictionsPasscodeController, "validatePIN:", a3);
}

- (BOOL)requiresKeyboard
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 30;
  else
    return 2;
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (__CFString)defaultsID
{
  return CFSTR("com.apple.WebContentAnalysisUI");
}

- (__CFString)failedAttemptsKey
{
  return CFSTR("WCFRestrictedWebsiteFailedAttempts");
}

- (__CFString)blockTimeIntervalKey
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFServicePINEntryViewController;
  return -[WFServicePINEntryViewController blockTimeIntervalKey](&v3, "blockTimeIntervalKey");
}

- (__CFString)blockedStateKey
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFServicePINEntryViewController;
  return -[WFServicePINEntryViewController blockedStateKey](&v3, "blockedStateKey");
}

- (NSObject)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
