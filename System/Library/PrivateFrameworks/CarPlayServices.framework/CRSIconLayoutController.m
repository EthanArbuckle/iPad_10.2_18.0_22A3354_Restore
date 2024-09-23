@implementation CRSIconLayoutController

- (CRSIconLayoutController)init
{
  CRSIconLayoutController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BSServiceConnection *connection;
  BSServiceConnection *v8;
  CRSIconLayoutController *v9;
  uint64_t Serial;
  OS_dispatch_queue *callbackQueue;
  NSObject *v12;
  BSServiceConnection *v13;
  _QWORD v15[4];
  CRSIconLayoutController *v16;
  objc_super v17;
  uint8_t buf[4];
  BSServiceConnection *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)CRSIconLayoutController;
  v2 = -[CRSIconLayoutController init](&v17, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BE0FA08];
    +[CRSIconLayoutServiceSpecification identifier](CRSIconLayoutServiceSpecification, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.service"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v6;

    v8 = v2->_connection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __31__CRSIconLayoutController_init__block_invoke;
    v15[3] = &unk_24CD38938;
    v9 = v2;
    v16 = v9;
    -[BSServiceConnection configureConnection:](v8, "configureConnection:", v15);
    Serial = BSDispatchQueueCreateSerial();
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)Serial;

    CRSLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_212138000, v12, OS_LOG_TYPE_INFO, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v2->_connection, "activate");
  }
  return v2;
}

void __31__CRSIconLayoutController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[CRSIconLayoutServiceSpecification serviceQuality](CRSIconLayoutServiceSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v3);

  +[CRSIconLayoutServiceSpecification interface](CRSIconLayoutServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_3);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_45);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_47);

}

void __31__CRSIconLayoutController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }

}

void __31__CRSIconLayoutController_init__block_invoke_44(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "[CRSIconLayoutController] connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __31__CRSIconLayoutController_init__block_invoke_46(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRSIconLayoutController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CRSIconLayoutController;
  -[CRSIconLayoutController dealloc](&v4, sel_dealloc);
}

- (void)fetchIconStateForVehicleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    CRSLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_212138000, v8, OS_LOG_TYPE_INFO, "Fetching icon state for vehicle: %{public}@", buf, 0xCu);
    }

    -[CRSIconLayoutController connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTarget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke;
    v11[3] = &unk_24CD38B48;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v10, "fetchIconStateForVehicleID:completion:", v6, v11);

  }
}

void __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "iconOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("iconOrder"));

  objc_msgSend(v3, "hiddenIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_map:", &__block_literal_global_55);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("hiddenIcons"));
  objc_msgSend(v3, "oemIconLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("OEMIconLabel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "displaysOEMIcon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("displaysOEMIcon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "rows"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("rows"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v3, "columns");

  objc_msgSend(v11, "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("columns"));

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke_3;
  v17[3] = &unk_24CD38B20;
  v15 = *(id *)(a1 + 40);
  v18 = v4;
  v19 = v15;
  v16 = v4;
  dispatch_async(v14, v17);

}

uint64_t __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

void __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)exportIconStateForCertificateSerial:(id)a3 categories:(unint64_t)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v6 = a5;
  if (v6)
  {
    v7 = a3;
    CRSLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212138000, v8, OS_LOG_TYPE_INFO, "Exporting icon state for vehicle by certificate serial.", buf, 2u);
    }

    v9 = v6;
    CRVehicleIdentifierForCertificateSerial();

  }
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_2;
  v5[3] = &unk_24CD38BC0;
  v3 = (void *)a1[5];
  v4 = (void *)a1[4];
  v7 = a1[6];
  v5[4] = v4;
  v6 = v3;
  objc_msgSend(v4, "fetchIconStateForVehicleID:completion:", a2, v5);

}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;

  v3 = (objc_class *)MEMORY[0x24BE15258];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_3;
  v18[3] = &unk_24CD38B98;
  v9 = *(_QWORD *)(a1 + 48);
  v19 = v5;
  v21 = v9;
  v10 = v6;
  v20 = v10;
  v11 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_92;
  block[3] = &unk_24CD38B20;
  v13 = *(id *)(a1 + 40);
  v16 = v10;
  v17 = v13;
  v14 = v10;
  dispatch_async(v12, block);

}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4;
  v7[3] = &unk_24CD38B70;
  v4 = *(id *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v10 = v5;
  v9 = v6;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v7);

}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4(uint64_t a1, void *a2)
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
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.cardisplay.OEM")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.cardisplay.nowplaying")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE15250], "requiredInfoKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsForInfoDictionaryKeys:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE15250], "requiredEntitlementKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitlementValuesForKeys:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE15250], "declarationForBundleIdentifier:info:entitlements:", v3, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "effectivePolicyForAppDeclaration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 48);
    if ((v12 & 1) == 0 && (objc_msgSend(v10, "applicationCategory") & v12) == 0)
    {
      CRSLogForCategory(1uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_1((uint64_t)v3, v11, v16);
      goto LABEL_38;
    }
    objc_msgSend(v4, "localizedNameForContext:", CFSTR("Car"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v4, "localizedNameForContext:", 0);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    if ((objc_msgSend(v11, "applicationCategory") & 0x10) != 0)
    {
      v18 = CFSTR("audio");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 4) != 0)
    {
      v18 = CFSTR("calling");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 2) != 0)
    {
      v18 = CFSTR("messaging");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 8) != 0)
    {
      v18 = CFSTR("navigation");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 0x20) != 0)
    {
      v18 = CFSTR("automaker");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 0x200) != 0)
    {
      v18 = CFSTR("parking");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 0x100) != 0)
    {
      v18 = CFSTR("charging");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 0x80) != 0)
    {
      v18 = CFSTR("quick ordering");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 0x400) != 0)
    {
      v18 = CFSTR("productivity");
    }
    else if ((objc_msgSend(v11, "applicationCategory") & 0x800) != 0)
    {
      v18 = CFSTR("fueling");
    }
    else
    {
      if ((objc_msgSend(v11, "applicationCategory") & 0x1000) == 0)
      {
        CRSLogForCategory(1uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_2((uint64_t)v3, v17);
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      v18 = CFSTR("driving task");
    }
    v19 = *(void **)(a1 + 40);
    v21[0] = CFSTR("CARApplicationLocalizedNameKey");
    v21[1] = CFSTR("CARApplicationBundleIdentifierKey");
    v20 = &stru_24CD39530;
    if (v16)
      v20 = (const __CFString *)v16;
    v22[0] = v20;
    v22[1] = v3;
    v21[2] = CFSTR("CARApplicationCategoryKey");
    v22[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v17);
    goto LABEL_37;
  }
LABEL_39:

}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_92(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setIconOrder:(id)a3 hiddenIcons:(id)a4 forVehicleID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  CRSIconLayoutPage *v12;
  CRSIconLayoutState *v13;
  void *v14;
  CRSIconLayoutState *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "bs_map:", &__block_literal_global_97);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_map:", &__block_literal_global_99);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CRSIconLayoutPage initWithIcons:]([CRSIconLayoutPage alloc], "initWithIcons:", v10);
  v13 = [CRSIconLayoutState alloc];
  v21[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CRSIconLayoutState initWithPages:hiddenIcons:](v13, "initWithPages:hiddenIcons:", v14, v11);

  CRSLogForCategory(1uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v19 = 138543362;
    v20 = v8;
    _os_log_impl(&dword_212138000, v16, OS_LOG_TYPE_INFO, "Setting icon state for vehicle: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  -[CRSIconLayoutController connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "remoteTarget");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIconState:forVehicleID:", v15, v8);

}

CRSApplicationIcon *__65__CRSIconLayoutController_setIconOrder_hiddenIcons_forVehicleID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRSApplicationIcon *v3;

  v2 = a2;
  v3 = -[CRSApplicationIcon initWithBundleIdentifier:]([CRSApplicationIcon alloc], "initWithBundleIdentifier:", v2);

  return v3;
}

CRSApplicationIcon *__65__CRSIconLayoutController_setIconOrder_hiddenIcons_forVehicleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  CRSApplicationIcon *v3;

  v2 = a2;
  v3 = -[CRSApplicationIcon initWithBundleIdentifier:]([CRSApplicationIcon alloc], "initWithBundleIdentifier:", v2);

  return v3;
}

- (void)resetIconStateForVehicleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CRSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_INFO, "Resetting icon state for vehicle: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[CRSIconLayoutController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetIconStateForVehicleID:", v4);

}

- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 vehicleID:(id)a4 showBorder:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v7 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    CRSLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_212138000, v13, OS_LOG_TYPE_INFO, "Fetching icon information for bundle ID: %@, vehicle: %{public}@", buf, 0x16u);
    }

    -[CRSIconLayoutController connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke;
    v17[3] = &unk_24CD38C70;
    v17[4] = self;
    v18 = v12;
    objc_msgSend(v15, "fetchApplicationIconInformationForBundleIdentifier:vehicleID:drawBorder:completion:", v10, v11, v16, v17);

  }
}

void __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke_2;
  v7[3] = &unk_24CD38B20;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CRSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRSIconLayoutController connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);

  }
  -[CRSIconLayoutController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "applicationCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_212138000, a3, OS_LOG_TYPE_DEBUG, "Ignoring app %@ with categories %@", (uint8_t *)&v6, 0x16u);

}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_212138000, a2, OS_LOG_TYPE_DEBUG, "Unable to determine a category for %@", (uint8_t *)&v2, 0xCu);
}

@end
