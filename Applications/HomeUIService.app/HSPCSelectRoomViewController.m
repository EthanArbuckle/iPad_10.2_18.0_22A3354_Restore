@implementation HSPCSelectRoomViewController

- (HSPCSelectRoomViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCSelectRoomViewController *v9;
  HSPCSelectRoomViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HSPCSelectRoomViewController;
  v9 = -[HSPCSelectRoomViewController init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryCategoryOrPrimaryServiceType"));
    v13 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardSelectRoomCardTitle"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[HSPCSelectRoomViewController setTitle:](v10, "setTitle:", v14);

    v15 = -[HSPCSelectRoomViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCSelectRoomViewController;
  -[HSPCSelectRoomViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
  v5 = objc_msgSend(v4, "initialRowIndex");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pickerView"));
  objc_msgSend(v7, "selectRow:inComponent:animated:", v5, 0, 0);

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
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickerView"));
  v5 = objc_msgSend(v4, "selectedRowInComponent:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config"));
  v10 = v9;
  if (v5 >= v8)
  {
    objc_msgSend(v9, "setRoomName:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8428));
  }
  else
  {
    v11 = objc_msgSend(v9, "isSetupInitiatedByOtherMatterEcosystem");

    if (v11)
    {
      v13 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config"));
      v15 = v14;
      if (v14)
      {
        if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;
        if (!v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v13, objc_opt_class(v15, v20));

        }
      }
      else
      {
        v17 = 0;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "items"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v5));
      objc_msgSend(v17, "setSelectedPartnerRoom:", v30);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8428));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "items"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v5));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config"));
      objc_msgSend(v25, "setRoomName:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "configureRoom"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hs_commitConfigurationFutureWithContextMessage:", CFSTR("Set Room")));

    }
  }
  return v21;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCRoomProviderFactory providerForCoordinator:config:](HSPCRoomProviderFactory, "providerForCoordinator:config:", v3, v4));
  -[HSPCSelectRoomViewController setRoomProvider:](self, "setRoomProvider:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reschedule:", v8));

  return v9;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config", a3, a4));
  v6 = objc_msgSend(v5, "isSetupInitiatedByOtherMatterEcosystem");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  v9 = objc_msgSend(v8, "count");

  return (int64_t)v9 + (v6 ^ 1);
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

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider", a3, a4, a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  if ((unint64_t)objc_msgSend(v8, "count") <= a4)
  {
    v14 = HULocalizedString(CFSTR("HUProximityCardSetupAccessorySelectRoomVCPickerCreateNewRoom"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userFacingStringForItem:", v12));

  }
  return v13;
}

- (id)shouldSkip
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController config](self, "config"));
  v4 = objc_msgSend(v3, "isSetupInitiatedByOtherMatterEcosystem");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectRoomViewController roomProvider](self, "roomProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 < 2)
    v8 = v4;
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v9));

  return v10;
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

- (HSPCDataProvider)roomProvider
{
  return (HSPCDataProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRoomProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
