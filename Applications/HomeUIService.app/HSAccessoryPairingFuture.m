@implementation HSAccessoryPairingFuture

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  objc_msgSend(v3, "removePairingObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HSAccessoryPairingFuture;
  -[HSAccessoryPairingFuture dealloc](&v4, "dealloc");
}

- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 discoveredAccessory:(id)a4
{
  return -[HSAccessoryPairingFuture initWithPairingContext:discoveredAccessory:accessoryAlreadyStaged:](self, "initWithPairingContext:discoveredAccessory:accessoryAlreadyStaged:", a3, a4, 0);
}

- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 accessoryAlreadyStaged:(BOOL)a4
{
  return -[HSAccessoryPairingFuture initWithPairingContext:discoveredAccessory:accessoryAlreadyStaged:](self, "initWithPairingContext:discoveredAccessory:accessoryAlreadyStaged:", a3, 0, 1);
}

- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 discoveredAccessory:(id)a4 accessoryAlreadyStaged:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  HSAccessoryPairingFuture *v11;
  HSAccessoryPairingFuture *v12;
  NAPromise *v13;
  NAPromise *promise;
  objc_class *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  HFSetupPairingController *pairingController;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  objc_super v39;
  uint8_t buf[4];
  void *v41;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)HSAccessoryPairingFuture;
  v11 = -[HSAccessoryPairingFuture init](&v39, "init");
  v12 = v11;
  if (!v11)
    goto LABEL_17;
  objc_storeStrong((id *)&v11->_pairingContext, a3);
  v12->_phase = 0;
  v13 = (NAPromise *)objc_alloc_init((Class)NAPromise);
  promise = v12->_promise;
  v12->_promise = v13;

  if (v5)
  {
    v15 = (objc_class *)HFSetupStagedAccessoryPairingController;
LABEL_7:
    v19 = [v15 alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingContext](v12, "pairingContext"));
    v18 = objc_msgSend(v19, "initWithContext:", v17);
    goto LABEL_8;
  }
  if (!v10)
  {
    v15 = (objc_class *)HFSetupAutomaticDiscoveryPairingController;
    goto LABEL_7;
  }
  v16 = objc_alloc((Class)HFSetupSingleAccessoryPairingController);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingContext](v12, "pairingContext"));
  v18 = objc_msgSend(v16, "initWithContext:discoveredAccessory:", v17, v10);
LABEL_8:
  v20 = v18;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingContext](v12, "pairingContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "setupAccessoryDescription"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "setupAccessoryPayload"));

  if (v23)
  {
    v24 = objc_alloc((Class)HFSetupAccessoryResult);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingContext](v12, "pairingContext"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "setupAccessoryDescription"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "setupAccessoryPayload"));
    v28 = objc_msgSend(v24, "initWithPayload:", v27);
    objc_msgSend(v20, "setSetupResult:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "setupResult"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "error"));

    if (v30)
    {
      v31 = HFLogForCategory(58);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_100061208((uint64_t)v30, v32, v33);

      -[NAPromise finishWithError:](v12->_promise, "finishWithError:", v30);
    }

  }
  objc_msgSend(v20, "addPairingObserver:", v12);
  pairingController = v12->_pairingController;
  v12->_pairingController = (HFSetupPairingController *)v20;

  v35 = HFLogForCategory(58);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingContext](v12, "pairingContext"));
    *(_DWORD *)buf = 138412290;
    v41 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "HSAccessoryPairingFuture initialized: %@", buf, 0xCu);

  }
LABEL_17:

  return v12;
}

- (id)startPairingWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture promise](self, "promise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
  v7 = objc_msgSend(v6, "isFinished");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture promise](self, "promise"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture cancelPairing](self, "cancelPairing"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100059A40;
    v11[3] = &unk_1000A1838;
    v11[4] = self;
    v12 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v11));

  }
  return v9;
}

- (id)cancelPairing
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing controller cancelled: %@", (uint8_t *)&v9, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cancel"));

  return v7;
}

- (id)cancelPairingWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v21 = 138412546;
    v22 = v10;
    v23 = 2112;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "-[%@ cancelPairingWithError:%@]", (uint8_t *)&v21, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveredAccessoryToPair"));

  objc_msgSend(v12, "updateStatus:error:", 3, v4);
  v13 = HFLogForCategory(58);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_100061288(self, (uint64_t)v4, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_mappedHMError:](NSError, "hf_mappedHMError:", v4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "context"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "setupAccessoryDescription"));
  objc_msgSend(v18, "setCancellationReason:", v15);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture cancelPairing](self, "cancelPairing"));
  return v19;
}

- (void)pairingController:(id)a3 didTransitionToPhase:(unint64_t)a4 statusTitle:(id)a5 statusDescription:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  id v35;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[HSAccessoryPairingFuture phase](self, "phase");
  -[HSAccessoryPairingFuture setPhase:](self, "setPhase:", a4);
  v14 = HFLogForCategory(58);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", v13));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a4));
    v26 = 138413314;
    v27 = v16;
    v28 = 2048;
    v29 = v13;
    v30 = 2112;
    v31 = v17;
    v32 = 2048;
    v33 = a4;
    v34 = 2112;
    v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Prox Card Pairing Phase Transition %@ (%ld) -> %@ (%ld) | statusTitle: %@", (uint8_t *)&v26, 0x34u);

  }
  if (v13 != a4)
  {
    if (a4 == 9)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "discoveredAccessoryToPair"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));
      v22 = v21;
      if (v21)
        v23 = v21;
      else
        v23 = (id)objc_claimAutoreleasedReturnValue(+[NSError na_genericError](NSError, "na_genericError"));
      v18 = v23;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture promise](self, "promise"));
      objc_msgSend(v19, "finishWithError:", v18);
    }
    else
    {
      if (a4 != 10)
        goto LABEL_12;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture promise](self, "promise"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pairedAccessories"));
      objc_msgSend(v18, "finishWithResult:", v19);
    }

  }
LABEL_12:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingObserver](self, "pairingObserver"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingObserver](self, "pairingObserver"));
    objc_msgSend(v25, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", v10, a4, v11, v12);

  }
}

- (NSString)pairingStatusTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "statusTitle"));

  return (NSString *)v3;
}

- (NSString)pairingStatusDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "statusDescription"));

  return (NSString *)v3;
}

- (void)updateSetupPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)HFSetupAccessoryResult), "initWithPayload:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingFuture pairingController](self, "pairingController"));
  objc_msgSend(v5, "setSetupResult:", v6);

}

- (HFSetupPairingObserver)pairingObserver
{
  return (HFSetupPairingObserver *)objc_loadWeakRetained((id *)&self->_pairingObserver);
}

- (void)setPairingObserver:(id)a3
{
  objc_storeWeak((id *)&self->_pairingObserver, a3);
}

- (NAPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (HFSetupPairingController)pairingController
{
  return self->_pairingController;
}

- (void)setPairingController:(id)a3
{
  objc_storeStrong((id *)&self->_pairingController, a3);
}

- (HFSetupPairingContext)pairingContext
{
  return self->_pairingContext;
}

- (void)setPairingContext:(id)a3
{
  objc_storeStrong((id *)&self->_pairingContext, a3);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingContext, 0);
  objc_storeStrong((id *)&self->_pairingController, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_destroyWeak((id *)&self->_pairingObserver);
}

@end
