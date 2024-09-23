@implementation WFRideOptionsLoader

- (WFRideOptionsLoader)init
{
  WFRideOptionsLoader *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *loadingOptionsQueue;
  uint64_t v5;
  NSMutableArray *completionBlocks;
  WFRideOptionsLoader *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFRideOptionsLoader;
  v2 = -[WFRideOptionsLoader init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Shortcuts.actions.RequestRide.LoadOptionsQueue", 0);
    loadingOptionsQueue = v2->_loadingOptionsQueue;
    v2->_loadingOptionsQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)setRideOptionParameterParameter:(id)a3
{
  id v5;
  WFRideOptionParameter *v6;
  WFRideOptionParameter *v7;
  char v8;
  WFRideOptionParameter *v9;

  v5 = a3;
  v6 = self->_rideOptionParameterParameter;
  v7 = (WFRideOptionParameter *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[WFRideOptionParameter isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_rideOptionParameterParameter, a3);
    -[WFDynamicEnumerationParameter setDataSource:](self->_rideOptionParameterParameter, "setDataSource:", self);
    -[WFDynamicEnumerationParameter reloadPossibleStates](self->_rideOptionParameterParameter, "reloadPossibleStates");
  }
LABEL_9:

}

- (void)setPaymentMethodParameterParameter:(id)a3
{
  id v5;
  WFPaymentMethodParameter *v6;
  WFPaymentMethodParameter *v7;
  char v8;
  WFPaymentMethodParameter *v9;

  v5 = a3;
  v6 = self->_paymentMethodParameterParameter;
  v7 = (WFPaymentMethodParameter *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[WFPaymentMethodParameter isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_paymentMethodParameterParameter, a3);
    -[WFPaymentMethodParameter setDataSource:](self->_paymentMethodParameterParameter, "setDataSource:", self);
    -[WFPaymentMethodParameter reloadPossibleStates](self->_paymentMethodParameterParameter, "reloadPossibleStates");
  }
LABEL_9:

}

- (void)setAppBundleIdentifier:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD block[5];

  v5 = a3;
  -[WFRideOptionsLoader appBundleIdentifier](self, "appBundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
    -[WFRideOptionsLoader loadingOptionsQueue](self, "loadingOptionsQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__WFRideOptionsLoader_setAppBundleIdentifier___block_invoke;
    block[3] = &unk_24F8BB638;
    block[4] = self;
    dispatch_async(v10, block);

  }
LABEL_9:

}

- (void)setPickupLocation:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD block[5];

  v5 = a3;
  -[WFRideOptionsLoader pickupLocation](self, "pickupLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_pickupLocation, a3);
    -[WFRideOptionsLoader loadingOptionsQueue](self, "loadingOptionsQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__WFRideOptionsLoader_setPickupLocation___block_invoke;
    block[3] = &unk_24F8BB638;
    block[4] = self;
    dispatch_async(v10, block);

  }
LABEL_9:

}

- (void)setDropOffLocation:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD block[5];

  v5 = a3;
  -[WFRideOptionsLoader dropOffLocation](self, "dropOffLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_dropOffLocation, a3);
    -[WFRideOptionsLoader loadingOptionsQueue](self, "loadingOptionsQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__WFRideOptionsLoader_setDropOffLocation___block_invoke;
    block[3] = &unk_24F8BB638;
    block[4] = self;
    dispatch_async(v10, block);

  }
LABEL_9:

}

- (void)setRideOptions:(id)a3
{
  NSArray *v4;
  NSArray *rideOptions;
  id v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  rideOptions = self->_rideOptions;
  self->_rideOptions = v4;

  -[WFRideOptionsLoader rideOptionParameterParameter](self, "rideOptionParameterParameter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadPossibleStates");

}

- (void)setPaymentMethods:(id)a3
{
  NSArray *v4;
  NSArray *paymentMethods;
  id v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  paymentMethods = self->_paymentMethods;
  self->_paymentMethods = v4;

  -[WFRideOptionsLoader paymentMethodParameterParameter](self, "paymentMethodParameterParameter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadPossibleStates");

}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
  if (-[WFRideOptionsLoader loadingState](self, "loadingState") != 1)
    -[WFRideOptionsLoader setExecutor:](self, "setExecutor:", 0);
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "value");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v5 = v4;
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 != 8)
    {
      objc_msgSend(v5, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identificationHint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" - %@"), v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    WFLocalizedString(CFSTR("Apple Pay"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
LABEL_7:

LABEL_9:
  return v9;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v11[3] = &unk_24F8BB4F0;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[WFRideOptionsLoader loadRideOptionsValueWithCompletion:](self, "loadRideOptionsValueWithCompletion:", v11);

}

- (void)loadRideOptionsValueWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFRideOptionsLoader loadingOptionsQueue](self, "loadingOptionsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke;
  v7[3] = &unk_24F8BB5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v20;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  objc_msgSend(v20, "parameterStateForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEC4410]))
  {
    objc_msgSend(v8, "intentDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRideOptionsLoader setAppBundleIdentifier:](self, "setAppBundleIdentifier:", v11);

LABEL_22:
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "isEqualToString:", WFRequestRideActionPickupLocationParameterKey))
  {
    v12 = v9;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v16 = v13;

    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "placemark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFRideOptionsLoader setPickupLocation:](self, "setPickupLocation:", v10);
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", WFRequestRideActionDropOffLocationParameterKey))
  {
    v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v18 = v15;

    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "placemark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFRideOptionsLoader setDropOffLocation:](self, "setDropOffLocation:", v10);
    goto LABEL_22;
  }
LABEL_23:

}

- (CLPlacemark)pickupLocation
{
  return self->_pickupLocation;
}

- (CLPlacemark)dropOffLocation
{
  return self->_dropOffLocation;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (WFRideOptionsLoaderDelegate)delegate
{
  return (WFRideOptionsLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFRideOptionParameter)rideOptionParameterParameter
{
  return self->_rideOptionParameterParameter;
}

- (WFPaymentMethodParameter)paymentMethodParameterParameter
{
  return self->_paymentMethodParameterParameter;
}

- (NSArray)rideOptions
{
  return self->_rideOptions;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSError)loadingOptionsError
{
  return self->_loadingOptionsError;
}

- (void)setLoadingOptionsError:(id)a3
{
  objc_storeStrong((id *)&self->_loadingOptionsError, a3);
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (WFIntentExecutor)executor
{
  return self->_executor;
}

- (void)setExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_executor, a3);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (OS_dispatch_queue)loadingOptionsQueue
{
  return self->_loadingOptionsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingOptionsQueue, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_loadingOptionsError, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_rideOptions, 0);
  objc_storeStrong((id *)&self->_paymentMethodParameterParameter, 0);
  objc_storeStrong((id *)&self->_rideOptionParameterParameter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "loadingState") == 2)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "rideOptions");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "paymentMethods");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "loadingOptionsError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v23, v3, v4);

  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "loadingState");
    objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v6, "addObject:", v7);

    if (v5 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pickupLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dropOffLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x24BDD9E10]);
      objc_msgSend(*(id *)(a1 + 32), "pickupLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dropOffLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithPickupLocation:dropOffLocation:", v12, v13);

      objc_msgSend(v14, "_setExecutionContext:", 7);
      objc_msgSend(v14, "_setLaunchId:", v8);
      getWFActionsLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "launchId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[WFRideOptionsLoader loadRideOptionsValueWithCompletion:]_block_invoke";
        v32 = 2114;
        v33 = v16;
        _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_INFO, "%s Retrieving available ride option for app %{public}@", buf, 0x16u);

      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3E18]), "initWithIntent:donateInteraction:groupIdentifier:", v14, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "setExecutor:", v17);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_128;
      v24[3] = &unk_24F8BB568;
      v18 = *(_QWORD *)(a1 + 32);
      v25 = v17;
      v26 = v18;
      v27 = v8;
      v28 = v9;
      v29 = v10;
      v19 = v10;
      v20 = v9;
      v21 = v8;
      v22 = v17;
      objc_msgSend(v22, "startWithCompletionHandler:", v24);

    }
  }
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void (**v33)(void *, id);
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  uint64_t v42;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "executor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {

    goto LABEL_30;
  }
  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {

  }
  else
  {
    if (!v11 || !v12)
    {

      goto LABEL_28;
    }
    v14 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_29;
  }
  v15 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "pickupLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  v11 = v18;
  if (v17 == v18)
  {

  }
  else
  {
    if (!v17 || !v18)
    {

      goto LABEL_28;
    }
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_28;
  }
  v20 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "dropOffLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v21;
  if (v22 != v23)
  {
    v24 = v23;
    if (v22 && v23)
    {
      v25 = objc_msgSend(v22, "isEqual:", v23);

      if ((v25 & 1) == 0)
        goto LABEL_30;
      goto LABEL_23;
    }

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }

LABEL_23:
  objc_msgSend(v5, "intentResponse");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  objc_msgSend(v28, "rideOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setRideOptions:", v29);

  objc_msgSend(v28, "paymentMethods");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setPaymentMethods:", v30);
  v37 = MEMORY[0x24BDAC760];
  v38 = 3221225472;
  v39 = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_2;
  v40 = &unk_24F8BB540;
  v31 = *(id *)(a1 + 32);
  v32 = *(_QWORD *)(a1 + 40);
  v41 = v31;
  v42 = v32;
  v33 = (void (**)(void *, id))_Block_copy(&v37);
  if (v6
    && (objc_msgSend(*(id *)(a1 + 40), "delegate", v37, v38, v39, v40),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_opt_respondsToSelector(),
        v34,
        (v35 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rideOptionsLoader:errorFromListRideOptionsError:updatedErrorHandler:", *(_QWORD *)(a1 + 40), v6, v33);

  }
  else
  {
    v33[2](v33, v6);
  }

LABEL_30:
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BEC4428]);

    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setLoadingOptionsError:", v11);
  objc_msgSend(*(id *)(a1 + 40), "setLoadingState:", 2);
  objc_msgSend(*(id *)(a1 + 40), "completionBlocks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "loadingOptionsQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_3;
    block[3] = &unk_24F8BB638;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v14, block);

  }
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_4;
  v4[3] = &unk_24F8BB518;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_4(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "rideOptions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paymentMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "loadingOptionsError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *, void *))a2)[2](v5, v8, v6, v7);

}

void __85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = &__block_literal_global_48658;
    v10 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      v11 = 0;
      goto LABEL_9;
    }
    v9 = &__block_literal_global_123_48660;
    v10 = v7;
  }
  objc_msgSend(v10, "if_map:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", v11);
  else
    v12 = 0;
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC3E00];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

WFINRideOptionParameterState *__85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFINRideOptionParameterState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFINRideOptionParameterState alloc], "initWithValue:", v2);

  return v3;
}

uint64_t __42__WFRideOptionsLoader_setDropOffLocation___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "loadingState"))
    objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRideOptions:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentMethods:", 0);
}

uint64_t __41__WFRideOptionsLoader_setPickupLocation___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "loadingState"))
    objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRideOptions:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentMethods:", 0);
}

uint64_t __46__WFRideOptionsLoader_setAppBundleIdentifier___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "loadingState"))
    objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRideOptions:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentMethods:", 0);
}

@end
