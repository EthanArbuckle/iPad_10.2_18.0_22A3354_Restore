@implementation SUUIITunesPassLearnMoreAlertDelegate

- (SUUIITunesPassLearnMoreAlertDelegate)initWithRedeemConfiguration:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUIITunesPassLearnMoreAlertDelegate *v9;
  SUUIITunesPassLearnMoreAlertDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIITunesPassLearnMoreAlertDelegate;
  v9 = -[SUUIITunesPassLearnMoreAlertDelegate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_redeemConfiguration, a3);
  }

  return v10;
}

+ (void)beginThrottleInterval
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDouble:forKey:", CFSTR("SUUILastITunesPassLearnMoreAlertTime"), CFAbsoluteTimeGetCurrent());
  objc_msgSend(v2, "synchronize");

}

+ (BOOL)shouldShowAlertForRedeem:(id)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v5 = a3;
  objc_msgSend(a4, "ITunesPassConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "learnMoreAlertView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ITunesPassLearnMoreAlertInterval");
  v9 = v8;

  if (v9 >= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("SUUILastITunesPassLearnMoreAlertTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      if (v15 > -v9)
      {

        v7 = 0;
      }

    }
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10 != 0;
}

- (void)show
{
  void *v3;
  id object;

  -[SUUIRedeemConfiguration ITunesPassConfiguration](self->_redeemConfiguration, "ITunesPassConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "learnMoreAlertView");
  object = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(object, "setDelegate:", self);
  objc_setAssociatedObject(object, "com.apple.iTunesStoreUI.SUUIITunesPassLearnMoreAlertDelegate", self, (void *)1);
  objc_msgSend(object, "show");
  objc_msgSend((id)objc_opt_class(), "beginThrottleInterval");

}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  void *v6;
  SUUIRedeemITunesPassLearnMoreViewController *v7;
  void *v8;
  id object;

  object = a3;
  if (objc_msgSend(object, "cancelButtonIndex") != a4)
  {
    -[SUUIITunesPassLearnMoreAlertDelegate presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
      -[SUUIRedeemStepViewController setClientContext:](v7, "setClientContext:", self->_clientContext);
      -[SUUIRedeemStepViewController setConfiguration:](v7, "setConfiguration:", self->_redeemConfiguration);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v7);
      objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }
  objc_msgSend(object, "setDelegate:", 0);
  objc_setAssociatedObject(object, "com.apple.iTunesStoreUI.SUUIITunesPassLearnMoreAlertDelegate", 0, (void *)1);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
