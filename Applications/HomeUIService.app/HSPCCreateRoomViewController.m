@implementation HSPCCreateRoomViewController

- (HSPCCreateRoomViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCCreateRoomViewController *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCCreateRoomViewController;
  v4 = -[HSPCTextFieldViewController initWithCoordinator:config:](&v8, "initWithCoordinator:config:", a3, a4);
  if (v4)
  {
    v5 = HULocalizedString(CFSTR("HUProximityCardNameNewRoomCardTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[HSPCCreateRoomViewController setTitle:](v4, "setTitle:", v6);

  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCCreateRoomViewController;
  -[HSPCCreateRoomViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
    objc_msgSend(v7, "becomeFirstResponder");

  }
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  -[HSPCTextFieldViewController endEditing](self, "endEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textFieldText](self, "textFieldText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v5 = objc_msgSend(v4, "isSetupInitiatedByOtherMatterEcosystem");

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)MTSDeviceSetupRoom), "initWithName:", v3);
    v8 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
    v10 = v9;
    if (v9)
    {
      if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;
      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class(v10, v15));

      }
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v12, "setSelectedPartnerRoom:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8080));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
    objc_msgSend(v16, "setRoomName:", v3);

    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Create Room: \"%@\"), v3));
    v12 = (id)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configureRoom"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hs_commitConfigurationFutureWithContextMessage:", v6));

  }
  return v18;
}

@end
