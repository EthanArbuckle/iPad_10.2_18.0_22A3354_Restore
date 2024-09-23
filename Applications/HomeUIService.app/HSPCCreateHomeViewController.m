@implementation HSPCCreateHomeViewController

- (HSPCCreateHomeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCCreateHomeViewController *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSPCCreateHomeViewController;
  v4 = -[HSPCTextFieldViewController initWithCoordinator:config:](&v9, "initWithCoordinator:config:", a3, a4);
  if (v4)
  {
    v5 = HULocalizedString(CFSTR("HUProximityCardNameNewHomeCardTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[HSPCCreateHomeViewController setTitle:](v4, "setTitle:", v6);

    v7 = objc_msgSend(objc_alloc((Class)HFHomeBuilder), "initWithExistingObject:inHome:", 0, 0);
    -[HSPCCreateHomeViewController setBuilder:](v4, "setBuilder:", v7);

  }
  return v4;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id location;

  -[HSPCTextFieldViewController endEditing](self, "endEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textFieldText](self, "textFieldText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v5 = objc_msgSend(v4, "isSetupInitiatedByOtherMatterEcosystem");

  if (v5)
  {
    v7 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
    v9 = v8;
    if (v8)
    {
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class(v9, v14));

      }
    }
    else
    {
      v11 = 0;
    }

    v22 = objc_msgSend(objc_alloc((Class)MTSDeviceSetupHome), "initWithName:", v3);
    objc_msgSend(v11, "setSelectedPartnerHome:", v22);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8188));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCreateHomeViewController builder](self, "builder"));
    objc_msgSend(v15, "setName:", v3);

    objc_initWeak(&location, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCreateHomeViewController builder](self, "builder"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commitItem"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100021788;
    v24[3] = &unk_1000A0F68;
    objc_copyWeak(&v25, &location);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flatMap:", v24));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textFieldText](self, "textFieldText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Create Home \"%@\"), v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hs_commitConfigurationFutureWithContextMessage:", v20));

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v21;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allHomesFuture"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000218CC;
  v7[3] = &unk_1000A1C90;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v7));

  return v5;
}

- (HFHomeBuilder)builder
{
  return (HFHomeBuilder *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBuilder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
