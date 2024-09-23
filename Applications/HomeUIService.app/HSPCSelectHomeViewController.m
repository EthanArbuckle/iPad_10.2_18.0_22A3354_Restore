@implementation HSPCSelectHomeViewController

- (HSPCSelectHomeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCSelectHomeViewController *v9;
  HSPCSelectHomeViewController *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HSPCSelectHomeViewController;
  v9 = -[HSPCSelectHomeViewController init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString(CFSTR("HUProximityCardSetupAccessorySelectHomeVCTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCSelectHomeViewController setTitle:](v10, "setTitle:", v12);

    v13 = -[HSPCSelectHomeViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
  }

  return v10;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickerView"));
  v5 = objc_msgSend(v4, "selectedRowInComponent:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v8 = objc_msgSend(v7, "count");

  if (v5 < v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController config](self, "config"));
    v10 = objc_msgSend(v9, "isSetupInitiatedByOtherMatterEcosystem");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v5));
    if (v10)
    {

      v15 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v14);
      v16 = (id)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController config](self, "config"));
      v17 = v16;
      if (v16)
      {
        if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
        v12 = v18;
        if (!v12)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
          objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class(v17, v21));

        }
      }
      else
      {
        v12 = 0;
      }

      objc_msgSend(v12, "setSelectedPartnerHome:", v13);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController config](self, "config"));
      objc_msgSend(v22, "setHome:", v13);

      v13 = v11;
    }

  }
  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7FA8));
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCSelectHomeViewController;
  -[HSPCSelectHomeViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickerView"));
  objc_msgSend(v5, "reloadAllComponents");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pickerView"));
  objc_msgSend(v7, "selectRow:inComponent:animated:", 0, 0, 0);

}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController coordinator](self, "coordinator", a3, a4));
  v6 = objc_msgSend(v5, "isUsingCHIPCommunicationProtocol");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  v9 = objc_msgSend(v8, "count");

  LODWORD(v10) = v6 ^ 1;
  if (v9)
    v10 = v10;
  else
    v10 = 1;
  return (int64_t)v9 + v10;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider", a3, a4, a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  if ((unint64_t)objc_msgSend(v8, "count") <= a4)
  {
    v14 = HULocalizedString(CFSTR("HUProximityCardSetupAccessorySelectHomeVCPickerCreateNewHome"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userFacingStringForItem:", v12));

  }
  return v13;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCHomeProviderFactory providerForCoordinator:config:](HSPCHomeProviderFactory, "providerForCoordinator:config:", v3, v4));
  -[HSPCSelectHomeViewController setHomeProvider:](self, "setHomeProvider:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectHomeViewController homeProvider](self, "homeProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reschedule:", v8));

  return v9;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSPCDataProvider)homeProvider
{
  return (HSPCDataProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomeProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
