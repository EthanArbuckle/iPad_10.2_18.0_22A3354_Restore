@implementation ASCredentialRequestEnableBluetoothViewController

- (ASCredentialRequestEnableBluetoothViewController)initWithPresentationContext:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  id *v9;
  ASCredentialRequestEnableBluetoothViewController *v10;
  ASCredentialRequestEnableBluetoothViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASCredentialRequestEnableBluetoothViewController;
  v9 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v13, sel_initRequiringTableView_, 0);
  v10 = (ASCredentialRequestEnableBluetoothViewController *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 132, a3);
    objc_storeStrong((id *)&v10->_authorizationActivity, a4);
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestEnableBluetoothViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEmptyViewWithSpacing:", 60.0);

  -[ASCredentialRequestEnableBluetoothViewController _setUpTitlePane](self, "_setUpTitlePane");
  -[ASCredentialRequestEnableBluetoothViewController _setUpMessagePane](self, "_setUpMessagePane");
  -[ASCredentialRequestEnableBluetoothViewController _setUpButtonPane](self, "_setUpButtonPane");
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEmptyViewWithSpacing:", 0.0);

  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (void)_setUpTitlePane
{
  id v3;
  void *v4;
  ASCredentialRequestSubPane *v5;
  void *v6;
  id v7;

  _WBSLocalizedString();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE068]);
  objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE200], *MEMORY[0x24BEBE260]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setText:", v7);
  v5 = -[ASCredentialRequestSubPane initWithView:]([ASCredentialRequestSubPane alloc], "initWithView:", v3);
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubPane:withCustomSpacingAfter:", v5, 16.0);

}

- (void)_setUpMessagePane
{
  ASCredentialRequestInfoLabelSubPane *v3;
  void *v4;
  void *v5;
  ASCredentialRequestInfoLabelSubPane *v6;

  v3 = [ASCredentialRequestInfoLabelSubPane alloc];
  -[ASCredentialRequestEnableBluetoothViewController _message](self, "_message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelType:](v3, "initWithString:labelType:", v4, 0);

  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubPane:withCustomSpacingAfter:", v6, 40.0);

}

- (void)_setUpButtonPane
{
  void *v3;
  void *v4;
  void *v5;
  ASCredentialRequestConfirmButtonSubPane *v6;

  v6 = -[ASCredentialRequestConfirmButtonSubPane initWithActivity:]([ASCredentialRequestConfirmButtonSubPane alloc], "initWithActivity:", self->_authorizationActivity);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestConfirmButtonSubPane setButtonText:](v6, "setButtonText:", v3);

  -[ASCredentialRequestConfirmButtonSubPane authorizationButton](v6, "authorizationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:", self, sel__enableBluetooth);

  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubPane:withCustomSpacingAfter:", v6, 80.0);

}

- (id)_message
{
  void *v3;
  void *v4;
  void *v5;

  -[ASCAuthorizationPresentationContext cableAuthenticatorURL](self->_presentationContext, "cableAuthenticatorURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceClass");

  }
  else
  {
    -[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest");
    objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceClass");

  }
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_enableBluetooth
{
  void (**enableBluetoothHandler)(void);

  enableBluetoothHandler = (void (**)(void))self->_enableBluetoothHandler;
  if (enableBluetoothHandler)
    enableBluetoothHandler[2]();
}

- (ASCAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (id)enableBluetoothHandler
{
  return self->_enableBluetoothHandler;
}

- (void)setEnableBluetoothHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enableBluetoothHandler, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
}

@end
