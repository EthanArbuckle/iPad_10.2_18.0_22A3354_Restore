@implementation NDOACController

+ (NDOACController)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_3);
  return (NDOACController *)(id)sharedController_sharedController;
}

void __35__NDOACController_sharedController__block_invoke()
{
  NDOACController *v0;
  void *v1;

  v0 = -[NDOACController initWithSerialNumber:]([NDOACController alloc], "initWithSerialNumber:", 0);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (NDOACController)initWithSerialNumber:(id)a3
{
  id v4;
  NDOACController *v5;
  NDOACController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NDOSpecifierDataSource *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NDOACController;
  v5 = -[NDOACController init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NDOACController setSpecifierIDToInsertAfter:](v5, "setSpecifierIDToInsertAfter:", CFSTR("SerialNumber"));
    v7 = (void *)objc_opt_new();
    v8 = v7;
    if (v4)
    {
      objc_msgSend(v7, "defaultDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serialNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOACController setIsDefaultDevice:](v6, "setIsDefaultDevice:", objc_msgSend(v10, "isEqualToString:", v4));

    }
    else
    {
      -[NDOACController setIsDefaultDevice:](v6, "setIsDefaultDevice:", 1);
    }
    _NDOLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[NDOACController isDefaultDevice](v6, "isDefaultDevice");
      *(_DWORD *)buf = 136315650;
      v21 = "-[NDOACController initWithSerialNumber:]";
      v22 = 2112;
      v23 = v4;
      v24 = 1024;
      v25 = v12;
      _os_log_impl(&dword_229EC7000, v11, OS_LOG_TYPE_DEFAULT, "%s: initWithSerialNumber: %@ %d", buf, 0x1Cu);
    }

    v13 = -[NDOSpecifierDataSource initWithDefaultDevice:]([NDOSpecifierDataSource alloc], "initWithDefaultDevice:", -[NDOACController isDefaultDevice](v6, "isDefaultDevice"));
    -[NDOACController setNdoSpecifierDataSource:](v6, "setNdoSpecifierDataSource:", v13);

    -[NDOACController ndoSpecifierDataSource](v6, "ndoSpecifierDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSerialNumber:", v4);

    -[NDOACController ndoSpecifierDataSource](v6, "ndoSpecifierDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHostingController:", v6);

    v16 = -[NDOACController isDefaultDevice](v6, "isDefaultDevice");
    -[NDOACController ndoSpecifierDataSource](v6, "ndoSpecifierDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsDefaultDevice:", v16);

  }
  return v6;
}

- (NSArray)specifiers
{
  void *v3;
  void *v4;
  void *v5;

  -[NDOACController ndoSpecifierDataSource](self, "ndoSpecifierDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadSpecifiers");

  -[NDOACController ndoSpecifierDataSource](self, "ndoSpecifierDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ndoSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)updateSpecifiersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[NDOACController ndoSpecifierDataSource](self, "ndoSpecifierDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke;
  v9[3] = &unk_24F334B88;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

void __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "ndoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24F334E58;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNDOSpecifiersWithPolicy:completion:", objc_msgSend(*(id *)(a1 + 40), "generalAboutPolicy"), *(_QWORD *)(a1 + 48));
}

- (void)forceUpdateSpecifiersAndForceUpdateFollowup:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[NDOACController ndoSpecifierDataSource](self, "ndoSpecifierDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__NDOACController_forceUpdateSpecifiersAndForceUpdateFollowup_withCompletionHandler___block_invoke;
  v8[3] = &unk_24F334B88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateNDOSpecifiersWithPolicy:completion:", 2, v8);

}

void __85__NDOACController_forceUpdateSpecifiersAndForceUpdateFollowup_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "ndoSpecifierDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ndoSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", CFSTR("WARRANTY_OFFER"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "propertyForKey:", CFSTR("NDODeviceInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "warranty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)specifierIDToInsertAfter
{
  return self->_specifierIDToInsertAfter;
}

- (void)setSpecifierIDToInsertAfter:(id)a3
{
  objc_storeStrong((id *)&self->_specifierIDToInsertAfter, a3);
}

- (PSListController)parentViewController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (NDOSpecifierDataSource)ndoSpecifierDataSource
{
  return self->_ndoSpecifierDataSource;
}

- (void)setNdoSpecifierDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_ndoSpecifierDataSource, a3);
}

- (BOOL)isDefaultDevice
{
  return self->_isDefaultDevice;
}

- (void)setIsDefaultDevice:(BOOL)a3
{
  self->_isDefaultDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ndoSpecifierDataSource, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_specifierIDToInsertAfter, 0);
}

@end
