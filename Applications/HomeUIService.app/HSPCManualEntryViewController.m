@implementation HSPCManualEntryViewController

- (HSPCManualEntryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCManualEntryViewController *v9;
  HSPCManualEntryViewController *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PRXAction *continueAction;
  id v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HSPCManualEntryViewController;
  v9 = -[HSPCManualEntryViewController initWithContentView:](&v18, "initWithContentView:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinator, a3);
    objc_storeStrong((id *)&v10->_config, a4);
    v11 = sub_1000593D8(CFSTR("HSSetupCodeTitleManuallyEnterSetupCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCManualEntryViewController setTitle:](v10, "setTitle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("HomeKitCode")));
    -[HSPCPasscodeEntryViewController setImage:](v10, "setImage:", v13);

    -[HSPCManualEntryViewController setNumberOfDigits:](v10, "setNumberOfDigits:", 8);
    -[HSPCPasscodeEntryViewController setUseMonospacedFont:](v10, "setUseMonospacedFont:", 1);
    v14 = objc_claimAutoreleasedReturnValue(-[HSPCManualEntryViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration"));
    continueAction = v10->_continueAction;
    v10->_continueAction = (PRXAction *)v14;

    -[PRXAction setEnabled:](v10->_continueAction, "setEnabled:", 0);
    v16 = -[HSPCManualEntryViewController addOptionalButtonWithTitleKey:target:futureSelector:](v10, "addOptionalButtonWithTitleKey:target:futureSelector:", CFSTR("HSSetupCodeActionButtonCamera"), v10, "onCameraButton");
  }

  return v10;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCManualEntryViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCManualEntryViewController setupCode](self, "setupCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "didReceiveSetupCode:fromViewController:", v4, self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", &stru_1000A2F48));

  return v6;
}

- (id)onCameraButton
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8590);
}

- (void)configureNextViewController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = objc_opt_class(HSPCCameraScanViewController, v4);
  v8 = v3;
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setMode:", 0);
}

- (void)setNumberOfDigits:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HSPCManualEntryViewController;
  -[HSPCPasscodeEntryViewController setNumberOfDigits:](&v15, "setNumberOfDigits:", a3);
  v4 = objc_alloc((Class)NSAttributedString);
  v5 = -[HSPCPasscodeEntryViewController numberOfDigits](self, "numberOfDigits");
  v12 = sub_1000594F0(CFSTR("HSSetupCodeSubtitleFindSetupCodeFormat"), CFSTR("%ld"), v6, v7, v8, v9, v10, v11, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v4, "initWithString:", v13);
  -[HSPCPasscodeEntryViewController setFootnote:](self, "setFootnote:", v14);

}

- (void)didCompleteTextEntry:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  -[HSPCManualEntryViewController setSetupCode:](self, "setSetupCode:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSPCManualEntryViewController continueAction](self, "continueAction"));
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)textDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");
  v7 = objc_msgSend(v4, "numberOfDigits");

  if (v6 != v7)
  {
    -[HSPCManualEntryViewController setSetupCode:](self, "setSetupCode:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[HSPCManualEntryViewController continueAction](self, "continueAction"));
    objc_msgSend(v8, "setEnabled:", 0);

  }
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (void)setSetupCode:(id)a3
{
  objc_storeStrong((id *)&self->_setupCode, a3);
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
  objc_storeStrong((id *)&self->_continueAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
