@implementation BCSActionCoordinator

- (BCSActionCoordinator)init
{
  BCSActionCoordinator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *parsingQueue;
  BCSActionCoordinator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCSActionCoordinator;
  v2 = -[BCSActionCoordinator init](&v8, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.BarcodeScanner.parsingQueue", 0, v3);
    parsingQueue = v2->_parsingQueue;
    v2->_parsingQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)startParsingVisualCode:(id)a3
{
  id v4;
  NSObject *parsingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  parsingQueue = self->_parsingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__BCSActionCoordinator_startParsingVisualCode___block_invoke;
  v7[3] = &unk_2508638F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(parsingQueue, v7);

}

uint64_t __47__BCSActionCoordinator_startParsingVisualCode___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_parseVisualCode:", *(_QWORD *)(a1 + 40));
}

- (id)actionForVisualCode:(id)a3
{
  id v4;
  NSObject *parsingQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  BCSActionCoordinator *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  parsingQueue = self->_parsingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BCSActionCoordinator_actionForVisualCode___block_invoke;
  block[3] = &unk_250863BA0;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(parsingQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __44__BCSActionCoordinator_actionForVisualCode___block_invoke(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[5];
  if (a1[4] == *(_QWORD *)(v1 + 8))
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(v1 + 24));
}

- (void)_parseVisualCode:(id)a3
{
  id v4;
  BCSQRCodeParser *v5;
  BCSQRCodeParser *qrCodeParser;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BCSAppClipCodeURLDecoder *appClipCodeURLDecoder;
  BCSAppClipCodeURLDecoder *v14;
  BCSAppClipCodeURLDecoder *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  BCSActionCoordinator *v29;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_parsingQueue);
  if (!self->_qrCodeParser)
  {
    v5 = (BCSQRCodeParser *)objc_alloc_init(MEMORY[0x24BE0BA68]);
    qrCodeParser = self->_qrCodeParser;
    self->_qrCodeParser = v5;

  }
  v7 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  v8 = v7;
  if ((unint64_t)v4 + 1 >= 2 && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "Parsing", "start parsing", buf, 2u);
  }

  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __41__BCSActionCoordinator__parseVisualCode___block_invoke;
  v27 = &unk_250863E98;
  v9 = v4;
  v28 = v9;
  v29 = self;
  v10 = _Block_copy(&v24);
  if (objc_msgSend(v9, "codeType", v24, v25, v26, v27) == 1
    && (objc_msgSend(v9, "rawPayload"), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    appClipCodeURLDecoder = self->_appClipCodeURLDecoder;
    if (!appClipCodeURLDecoder)
    {
      v14 = (BCSAppClipCodeURLDecoder *)objc_alloc_init(MEMORY[0x24BE0BA58]);
      v15 = self->_appClipCodeURLDecoder;
      self->_appClipCodeURLDecoder = v14;

      appClipCodeURLDecoder = self->_appClipCodeURLDecoder;
    }
    -[BCSAppClipCodeURLDecoder parseEncodedURLData:version:completion:](appClipCodeURLDecoder, "parseEncodedURLData:version:completion:", v12, objc_msgSend(v9, "codeVersion"), v10);
  }
  else
  {
    objc_msgSend(v9, "payloadString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[BCSQRCodeParser parseCodeFromString:completionHandler:](self->_qrCodeParser, "parseCodeFromString:completionHandler:", v12, v10);
    }
    else
    {
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        -[BCSActionCoordinator _parseVisualCode:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }

}

void __41__BCSActionCoordinator__parseVisualCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id WeakRetained;
  id v16;
  char v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD block[5];
  id v22;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 + 1 >= 2 && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Parsing", "end parsing", buf, 2u);
  }

  v10 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "parsedQRCode", "parsed visual code payload", buf, 2u);
  }
  if (!v6)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = MEMORY[0x24BDAC760];
    v13 = *(NSObject **)(v11 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__BCSActionCoordinator__parseVisualCode___block_invoke_23;
    block[3] = &unk_2508638F8;
    block[4] = v11;
    v14 = v5;
    v22 = v14;
    dispatch_async(v13, block);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
    objc_msgSend(WeakRetained, "actionCoordinator:didParseCode:withAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v14);

    objc_msgSend(v14, "defaultActionTargetApplicationBundleIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.mobilesafari"))
      && !SBSGetScreenLockStatus())
    {
      v17 = objc_msgSend(v14, "isApplePayInitiateAction");

      if ((v17 & 1) != 0)
        goto LABEL_12;
      objc_msgSend(v14, "urlThatCanBeOpened");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "_bcs_isHTTPFamilyURL"))
      {
        objc_msgSend(v14, "clipMetadataRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19[0] = v12;
          v19[1] = 3221225472;
          v19[2] = __41__BCSActionCoordinator__parseVisualCode___block_invoke_2;
          v19[3] = &unk_2508638F8;
          v19[4] = *(_QWORD *)(a1 + 40);
          v16 = v16;
          v20 = v16;
          dispatch_async(MEMORY[0x24BDAC9B8], v19);

        }
      }
    }

LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __41__BCSActionCoordinator__parseVisualCode___block_invoke_cold_1(v6);
LABEL_13:

}

void __41__BCSActionCoordinator__parseVisualCode___block_invoke_23(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __41__BCSActionCoordinator__parseVisualCode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveRedirectionForURL:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_handleSpecialCodesForAction:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  int v8;
  BCSAlertController *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isInvalidDataAction");
  if (v8)
  {
    v9 = objc_alloc_init(BCSAlertController);
    -[BCSAlertController setDelegate:](v9, "setDelegate:", self);
    -[BCSAlertController showInvalidDataAlertForAction:fromViewController:](v9, "showInvalidDataAlertForAction:fromViewController:", v6, v7);

  }
  return v8;
}

- (void)_updateParsedActionWithURL:(id)a3 appLink:(id)a4
{
  id v6;
  id v7;
  NSObject *parsingQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  BCSActionCoordinator *v14;

  v6 = a3;
  v7 = a4;
  parsingQueue = self->_parsingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__BCSActionCoordinator__updateParsedActionWithURL_appLink___block_invoke;
  block[3] = &unk_2508639C0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(parsingQueue, block);

}

void __59__BCSActionCoordinator__updateParsedActionWithURL_appLink___block_invoke(_QWORD *a1)
{
  BCSShadowAction *v2;
  uint64_t v3;
  void *v4;

  v2 = -[BCSShadowAction initWithURL:appLink:originalAction:]([BCSShadowAction alloc], "initWithURL:appLink:originalAction:", a1[4], a1[5], *(_QWORD *)(a1[6] + 24));
  v3 = a1[6];
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)showFirstTimePromptIfNecessary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id firstTimePromptBlock;
  BCSAlertController *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int);
  void *v22;
  id v23;
  void (**v24)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_2564541F0) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "actionCoordinatorPresentingViewController:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[BCSActionCoordinator _handleSpecialCodesForAction:presentingViewController:](self, "_handleSpecialCodesForAction:presentingViewController:", v6, v9))
    {
      v7[2](v7);
    }
    else
    {
      objc_msgSend(v6, "appLinks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "targetApplicationProxy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applicationIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "browserSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.BarcodeScanner.UserExplicitlyAllowsOpeningLinkInApp"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "BOOLValue"))
        {
          v7[2](v7);
        }
        else
        {
          v19 = MEMORY[0x24BDAC760];
          v20 = 3221225472;
          v21 = __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke;
          v22 = &unk_250863EC0;
          v23 = v11;
          v24 = v7;
          v16 = _Block_copy(&v19);
          firstTimePromptBlock = self->_firstTimePromptBlock;
          self->_firstTimePromptBlock = v16;

          v18 = objc_alloc_init(BCSAlertController);
          -[BCSAlertController setDelegate:](v18, "setDelegate:", self, v19, v20, v21, v22);
          -[BCSAlertController showFirstTimePromptToOpenApp:fromViewController:](v18, "showFirstTimePromptToOpenApp:fromViewController:", v13, v9);

        }
      }
      else
      {
        v7[2](v7);
      }

    }
  }
  else
  {
    v7[2](v7);
  }

}

void __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "browserSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.BarcodeScanner.UserExplicitlyAllowsOpeningLinkInApp"));

    v9 = *(void **)(a1 + 32);
    v11 = 0;
    objc_msgSend(v9, "setBrowserSettings:error:", v7, &v11);
    v10 = v11;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke_cold_1(v10);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_resolveRedirectionForURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  _SFLinkRedirectionResolver *v7;
  _SFLinkRedirectionResolver *linkResolver;
  _QWORD v9[5];

  v4 = (objc_class *)MEMORY[0x24BDE81C8];
  v5 = a3;
  v6 = [v4 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke;
  v9[3] = &unk_250863EE8;
  v9[4] = self;
  v7 = (_SFLinkRedirectionResolver *)objc_msgSend(v6, "initWithURL:completionHandler:", v5, v9);

  linkResolver = self->_linkResolver;
  self->_linkResolver = v7;

}

void __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke_cold_1(v9);
  }
  else
  {
    v10 = objc_msgSend(v7, "_bcs_isHTTPFamilyURL");
    if (v8 || (v10 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v13 = 138478083;
        v14 = v7;
        v15 = 2113;
        v16 = v8;
        _os_log_impl(&dword_236DE2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSActionCoordinator: resolved redirection to %{private}@. apps: %{private}@", (uint8_t *)&v13, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_updateParsedActionWithURL:appLink:", v7, v8);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 56);
      *(_QWORD *)(v11 + 56) = 0;

    }
  }

}

- (void)showItemsWithAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  int v10;
  BCSContextMenuController *v11;
  void *v12;
  void *v13;
  id actionPickerItemBlock;
  BCSAlertController *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  BCSActionCoordinator *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "urlThatCanBeOpened");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_bcs_isUPIURL");

  if (v10)
  {
    v11 = objc_alloc_init(BCSContextMenuController);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __55__BCSActionCoordinator_showItemsWithAction_completion___block_invoke;
    v19 = &unk_250863F10;
    v20 = self;
    v21 = v7;
    -[BCSContextMenuController setFinishAction:](v11, "setFinishAction:", &v16);
    objc_msgSend(WeakRetained, "actionCoordinatorViewForContextMenu:", self, v16, v17, v18, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSContextMenuController showMenuForAction:fromView:](v11, "showMenuForAction:fromView:", v6, v12);

  }
  else
  {
    objc_msgSend(WeakRetained, "actionCoordinatorPresentingViewController:", self);
    v11 = (BCSContextMenuController *)objc_claimAutoreleasedReturnValue();
    v13 = _Block_copy(v7);
    actionPickerItemBlock = self->_actionPickerItemBlock;
    self->_actionPickerItemBlock = v13;

    v15 = objc_alloc_init(BCSAlertController);
    -[BCSAlertController setDelegate:](v15, "setDelegate:", self);
    -[BCSAlertController showActionPickerViewForAction:fromViewController:](v15, "showActionPickerViewForAction:fromViewController:", v6, v11);

  }
}

void __55__BCSActionCoordinator_showItemsWithAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  v3 = a2;
  if (!v3)
  {
    v6 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(WeakRetained, "actionCoordinator:willDismissViewController:", *(_QWORD *)(a1 + 32), 0);

    goto LABEL_5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v6 = v3;
    (*(void (**)(void))(v4 + 16))();
LABEL_5:
    v3 = v6;
  }

}

- (id)homeScreenAppIconForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlThatCanBeOpened");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("x-esim://")) & 1) == 0
    && !objc_msgSend(v8, "hasPrefix:", CFSTR("lpa:")))
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_2564541F0))
    {
      v9 = v4;
      if (objc_msgSend(v9, "isWiFiAction"))
      {
        v13 = (void *)MEMORY[0x24BEBD640];
        v14 = CFSTR("Wi-Fi-HomeScreen");
LABEL_9:
        objc_msgSend(v13, "imageNamed:inBundle:", v14, v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_applicationIconImageForFormat:precomposed:", 2, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
      }
      objc_msgSend(v9, "clipMetadataRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("AppClips"), v5);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      if (objc_msgSend(v9, "isContinuityCameraAction"))
      {
        v13 = (void *)MEMORY[0x24BEBD640];
        v14 = CFSTR("AppleTV");
        goto LABEL_9;
      }

    }
    objc_msgSend(v4, "defaultActionTargetApplicationBundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[BCSActionCoordinator homeScreenAppIconWithIdentifier:](self, "homeScreenAppIconWithIdentifier:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("CellularData"), v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_applicationIconImageForFormat:precomposed:", 2, 1);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v11 = (void *)v10;
LABEL_5:

  return v11;
}

- (id)_calendarAppIcon
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v2 = (void *)getISIconClass_softClass;
  v26 = getISIconClass_softClass;
  if (!getISIconClass_softClass)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = (uint64_t)__getISIconClass_block_invoke;
    v21 = &unk_250863E58;
    v22 = &v23;
    __getISIconClass_block_invoke((uint64_t)&v18);
    v2 = (void *)v24[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v23, 8);
  v4 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDate:calendar:format:", v5, v6, 0);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)getISImageDescriptorClass_softClass;
  v26 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = (uint64_t)__getISImageDescriptorClass_block_invoke;
    v21 = &unk_250863E58;
    v22 = &v23;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v18);
    v8 = (void *)v24[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  v18 = 0;
  v19 = (uint64_t)&v18;
  v20 = 0x2020000000;
  v10 = (_QWORD *)getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  v21 = (void *)getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  if (!getkISImageDescriptorHomeScreenSymbolLoc_ptr)
  {
    v11 = (void *)IconServicesLibrary();
    v10 = dlsym(v11, "kISImageDescriptorHomeScreen");
    *(_QWORD *)(v19 + 24) = v10;
    getkISImageDescriptorHomeScreenSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v18, 8);
  if (!v10)
    -[BCSActionCoordinator _calendarAppIcon].cold.1();
  objc_msgSend(v9, "imageDescriptorNamed:", *v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _bcs_mainScreenScale();
  objc_msgSend(v12, "setScale:");
  objc_msgSend(v7, "imageForImageDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BEBD640];
  v15 = objc_msgSend(v13, "CGImage");
  objc_msgSend(v13, "scale");
  objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)homeScreenAppIconWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  int IsPad;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CGImage *v29;
  void *v30;
  void *v31;

  v4 = a3;
  v5 = v4;
  if (homeScreenAppIconWithIdentifier__iconCache)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v12 = (void *)homeScreenAppIconWithIdentifier__iconCache;
    homeScreenAppIconWithIdentifier__iconCache = (uint64_t)v11;

    objc_msgSend((id)homeScreenAppIconWithIdentifier__iconCache, "setCountLimit:", 8);
    if (v5)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)homeScreenAppIconWithIdentifier__iconCache;
      objc_msgSend(v6, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = v9;
        goto LABEL_25;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilecal")))
      {
        -[BCSActionCoordinator _calendarAppIcon](self, "_calendarAppIcon");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_25;
      }
      else
      {
        _bcs_mainScreenScale();
        v22 = v21;
        IsPad = _bcs_deviceIsPad();
        if (v22 == 2.0)
          v24 = 24;
        else
          v24 = 1;
        if (v22 == 2.0)
          v25 = 15;
        else
          v25 = 32;
        if (IsPad)
          v26 = v24;
        else
          v26 = v25;
        objc_msgSend(v6, "iconDataForVariant:", v26);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          v10 = 0;
          goto LABEL_25;
        }
        v28 = (void *)v27;
        v29 = (CGImage *)LICreateIconFromCachedBitmap();
        objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v29, 0, v22);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        CGImageRelease(v29);

        if (!v10)
        {
LABEL_25:

          goto LABEL_26;
        }
      }
      v30 = (void *)homeScreenAppIconWithIdentifier__iconCache;
      objc_msgSend(v6, "bundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v10, v31);

      goto LABEL_25;
    }
  }
  v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v13)
    -[BCSActionCoordinator homeScreenAppIconWithIdentifier:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  v10 = 0;
LABEL_26:

  return v10;
}

- (id)centerGlyphImageForAction:(id)a3
{
  void *v3;
  void *v4;

  if (objc_msgSend(a3, "isApplePayInitiateAction"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("applePay-center-glyph"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)logActivatedEventForAction:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  v3 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "originalAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BE0BA48], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logBarcodeActivatedEventForAction:", v3);

}

- (void)performAction:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[BCSActionCoordinator _performActionAndReturnIfLogged:](self, "_performActionAndReturnIfLogged:"))
    -[BCSActionCoordinator logActivatedEventForAction:](self, "logActivatedEventForAction:", v4);

}

- (BOOL)_performActionAndReturnIfLogged:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id WeakRetained;
  id v9;
  _SFLinkRedirectionResolver *linkResolver;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  objc_msgSend(v4, "defaultActionTargetApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "clipMetadataRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDE81B0]);
      objc_msgSend(v9, "setEntersReaderIfAvailable:", 0);
      objc_msgSend(v9, "_setEphemeral:", 1);
      linkResolver = self->_linkResolver;
      if (linkResolver)
      {
        -[_SFLinkRedirectionResolver safariViewController](linkResolver, "safariViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x24BDE81A8]);
        objc_msgSend(v4, "urlThatCanBeOpened");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v15, "initWithURL:configuration:", v16, v9);

      }
      objc_msgSend(v11, "setDelegate:", self);
      objc_msgSend(v11, "setDismissButtonStyle:", 1);
      objc_msgSend(WeakRetained, "actionCoordinatorPresentingViewController:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentedViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke;
        v23[3] = &unk_2508638F8;
        v23[4] = self;
        v24 = v17;
        objc_msgSend(v24, "presentViewController:animated:completion:", v11, 1, v23);

      }
      goto LABEL_18;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  objc_msgSend(v4, "actionPickerItems");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BCSActionCoordinator _handleActionPickerItemIfSpecialHandlingRequired:](self, "_handleActionPickerItemIfSpecialHandlingRequired:", v11))
  {
LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke_2;
    v20[3] = &unk_250863F38;
    v20[4] = self;
    WeakRetained = WeakRetained;
    v21 = WeakRetained;
    v22 = v4;
    objc_msgSend(v22, "performDefaultActionWithCompletionHandler:", v20);

    v12 = 1;
  }
  else
  {
    v13 = v4;
    if (objc_msgSend(v13, "isInvalidDataAction") && objc_msgSend(v13, "codeType") == 3)
    {
      objc_msgSend(WeakRetained, "actionCoordinatorPresentingViewController:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSActionCoordinator _handleSpecialCodesForAction:presentingViewController:](self, "_handleSpecialCodesForAction:presentingViewController:", v13, v14);

    }
    else
    {
      objc_msgSend(v13, "performAction");
    }
    objc_opt_class();
    v12 = objc_opt_isKindOfClass() ^ 1;

  }
LABEL_19:

  return v12 & 1;
}

uint64_t __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  return objc_msgSend(*(id *)(a1 + 40), "setNeedsStatusBarAppearanceUpdate");
}

void __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke_2(uint64_t a1, void *a2)
{
  BCSAlertController *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = objc_alloc_init(BCSAlertController);
    -[BCSAlertController setDelegate:](v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "actionCoordinatorPresentingViewController:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSAlertController showErrorExplanationForAction:error:fromViewController:](v3, "showErrorExplanationForAction:error:fromViewController:", *(_QWORD *)(a1 + 48), v5, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "actionCoordinator:didFinishPerformingAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)performActionPickerItem:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[BCSActionCoordinator _handleActionPickerItemIfSpecialHandlingRequired:](self, "_handleActionPickerItemIfSpecialHandlingRequired:"))objc_msgSend(v4, "performActionInExternalApp");

}

- (BOOL)_handleActionPickerItemIfSpecialHandlingRequired:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[BCSActionCoordinator _handleActionPickerItemIfContactsAction:](self, "_handleActionPickerItemIfContactsAction:", v4)|| -[BCSActionCoordinator _handleActionPickerItemIfCalendarAction:](self, "_handleActionPickerItemIfCalendarAction:", v4)|| -[BCSActionCoordinator _handleActionPickerItemIfHomeAction:](self, "_handleActionPickerItemIfHomeAction:", v4);

  return v5;
}

- (void)requestDeviceUnlockIfNeededWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (SBSGetScreenLockStatus())
  {
    self->_deviceIsBeingUnlocked = 1;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke;
    v5[3] = &unk_250863F88;
    v5[4] = self;
    v6 = v4;
    -[BCSActionCoordinator _launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:](self, "_launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:", 0, v5);

  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke(uint64_t a1, char a2)
{
  dispatch_time_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke_2;
  block[3] = &unk_250863F60;
  v5 = *(id *)(a1 + 40);
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return result;
}

- (BOOL)_handleActionPickerItemIfContactsAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "contact"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    -[BCSActionCoordinator _handleContactInfo:](self, "_handleContactInfo:", v5);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_tempVCardFileURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BCSActionCoordinator _tempVCardFileURL].cold.1();
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.BarcodeSupport.Notification"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v9);
    v4 = v9;

    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BCSActionCoordinator _tempVCardFileURL].cold.1();
      v5 = 0;
    }
    else
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Transfer.vcf"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (void)_handleContactInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCSActionCoordinator *v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236DE2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSActionCoordinator: Handling contact action", buf, 2u);
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BCSActionCoordinator__handleContactInfo___block_invoke;
  v7[3] = &unk_250863FB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "requestAccessForEntityType:completionHandler:", 0, v7);

}

void __43__BCSActionCoordinator__handleContactInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBAD08];
    v14[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithContacts:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_tempVCardFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v8, "writeToURL:atomically:", v9, 1);
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.MobileAddressBook"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isInstalled") && (objc_msgSend(v10, "isRestricted") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:sourceIsManaged:userInfo:options:delegate:", v9, CFSTR("com.apple.MobileAddressBook"), 0, 0, 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "start");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForSystemPlaceholder:", CFSTR("com.apple.MobileAddressBook"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_LSFailedToOpenURL:withBundle:", 0, v13);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __43__BCSActionCoordinator__handleContactInfo___block_invoke_cold_1(v5);
LABEL_13:

}

- (BOOL)_handleActionPickerItemIfHomeAction:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "targetApplicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Home"));

  if (v5)
  {
    objc_msgSend(v3, "actionURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "_bcs_hasScheme:", CFSTR("X-HM")) & 1) != 0
      || objc_msgSend(v6, "_bcs_hasScheme:", CFSTR("com.apple.Home-private")))
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      LOBYTE(v5) = objc_msgSend(v7, "openSensitiveURL:withOptions:error:", v6, 0, &v17);

      if ((v5 & 1) == 0)
      {
        v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v8)
          -[BCSActionCoordinator _handleActionPickerItemIfHomeAction:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (BOOL)_handleActionPickerItemIfCalendarAction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "targetApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilecal"));

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "icsString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v8 = objc_msgSend(v7, "length");
    LOBYTE(v6) = v8 != 0;
    if (v8)
      -[BCSActionCoordinator _handleCalendarICSString:](self, "_handleCalendarICSString:", v7);

  }
  return v6;
}

- (void)_handleCalendarICSString:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236DE2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSActionCoordinator: Handling event action", buf, 2u);
  }
  v4 = objc_alloc_init(MEMORY[0x24BDC74E8]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BCSActionCoordinator__handleCalendarICSString___block_invoke;
  v7[3] = &unk_250863FB0;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "requestWriteOnlyAccessToEventsWithCompletion:", v7);

}

void __49__BCSActionCoordinator__handleCalendarICSString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v23[0] = CFSTR("ICS");
  v23[1] = CFSTR("NotificationStyle");
  v24[0] = v2;
  v24[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DDUIEventForResults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v22 = 0;
  v6 = objc_msgSend(v5, "saveEvent:span:error:", v4, 0, &v22);
  v7 = v22;
  v8 = v7;
  if ((v6 & 1) != 0 || !v7)
  {
    objc_msgSend(v4, "reset");
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = objc_msgSend(v9, "openSensitiveURL:withOptions:error:", v10, 0, &v21);
    v12 = v21;

    if ((v11 & 1) == 0)
    {
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      objc_msgSend(*(id *)(a1 + 32), "removeEvent:span:error:", v4, 0, 0);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_2(v8);
  }

}

- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v7 = (void *)getFBSSystemServiceClass_softClass;
  v29 = getFBSSystemServiceClass_softClass;
  v8 = MEMORY[0x24BDAC760];
  if (!getFBSSystemServiceClass_softClass)
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = (uint64_t)__getFBSSystemServiceClass_block_invoke;
    v24 = &unk_250863E58;
    v25 = &v26;
    __getFBSSystemServiceClass_block_invoke((uint64_t)&v21);
    v7 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v26, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v21 = 0;
  v22 = (uint64_t)&v21;
  v23 = 0x2020000000;
  v14 = (_QWORD *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  v24 = (void *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    v15 = (void *)FrontBoardServicesLibrary();
    v14 = dlsym(v15, "FBSOpenApplicationOptionKeyUnlockDevice");
    *(_QWORD *)(v22 + 24) = v14;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v21, 8);
  if (!v14)
    -[BCSActionCoordinator _launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:].cold.1();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *v14);
  v21 = 0;
  v22 = (uint64_t)&v21;
  v23 = 0x2020000000;
  v16 = (_QWORD *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  v24 = (void *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    v17 = (void *)FrontBoardServicesLibrary();
    v16 = dlsym(v17, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    *(_QWORD *)(v22 + 24) = v16;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v21, 8);
  if (!v16)
    -[BCSActionCoordinator _launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:].cold.2();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *v16);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke;
  v19[3] = &unk_250864000;
  v20 = v6;
  v18 = v6;
  objc_msgSend(v10, "openApplication:options:withResult:", v12, v13, v19);

}

void __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  char v11;

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") == 7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_cold_1(v4);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_192;
    v9 = &unk_250863FD8;
    v10 = v6;
    v11 = v5;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v7, 3221225472))
      v8((uint64_t)&v7);
    else
      dispatch_sync(MEMORY[0x24BDAC9B8], &v7);

  }
}

uint64_t __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_192(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)alertController:(id)a3 didSelectActionItem:(id)a4
{
  void (**actionPickerItemBlock)(id, id, id);

  actionPickerItemBlock = (void (**)(id, id, id))self->_actionPickerItemBlock;
  if (actionPickerItemBlock)
  {
    actionPickerItemBlock[2](actionPickerItemBlock, a4, a3);
    actionPickerItemBlock = (void (**)(id, id, id))self->_actionPickerItemBlock;
  }
  self->_actionPickerItemBlock = 0;

}

- (void)alertControllerDidAllow:(id)a3
{
  void (**firstTimePromptBlock)(id, uint64_t, id);

  firstTimePromptBlock = (void (**)(id, uint64_t, id))self->_firstTimePromptBlock;
  if (firstTimePromptBlock)
  {
    firstTimePromptBlock[2](firstTimePromptBlock, 1, a3);
    firstTimePromptBlock = (void (**)(id, uint64_t, id))self->_firstTimePromptBlock;
  }
  self->_firstTimePromptBlock = 0;

}

- (void)alertControllerDidCancel:(id)a3
{
  id firstTimePromptBlock;
  id actionPickerItemBlock;
  id WeakRetained;

  firstTimePromptBlock = self->_firstTimePromptBlock;
  self->_firstTimePromptBlock = 0;

  actionPickerItemBlock = self->_actionPickerItemBlock;
  self->_actionPickerItemBlock = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "actionCoordinator:willDismissViewController:", self, 0);

}

- (void)safariViewControllerDidFinish:(id)a3
{
  BCSActionCoordinatorDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "actionCoordinator:willDismissViewController:", self, v5);

}

- (BCSActionCoordinatorDelegate)delegate
{
  return (BCSActionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)deviceIsBeingUnlocked
{
  return self->_deviceIsBeingUnlocked;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appClipCodeURLDecoder, 0);
  objc_storeStrong((id *)&self->_linkResolver, 0);
  objc_storeStrong(&self->_firstTimePromptBlock, 0);
  objc_storeStrong(&self->_actionPickerItemBlock, 0);
  objc_storeStrong((id *)&self->_qrCodeParser, 0);
  objc_storeStrong((id *)&self->_parsedAction, 0);
  objc_storeStrong((id *)&self->_parsingQueue, 0);
  objc_storeStrong((id *)&self->_currentCode, 0);
}

- (void)_parseVisualCode:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSActionCoordinator: there is no payload string in the scanned QR code.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __41__BCSActionCoordinator__parseVisualCode___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSActionCoordinator: cannot decode the payload. Error: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSActionCoordinator: failed to set browser settings %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSActionCoordinator: cannot resolve redirection chain. Error: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_calendarAppIcon
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkISImageDescriptorHomeScreen(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSActionCoordinator.m"), 52, CFSTR("%s"), OUTLINED_FUNCTION_5());

  __break(1u);
}

- (void)homeScreenAppIconWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSActionCoordinator: the action doens't have an associated application.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_tempVCardFileURL
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v0, "BCSActionCoordinator: cannot create folder at URL: %@", v1, v2, v3, v4, v5);
}

void __43__BCSActionCoordinator__handleContactInfo___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSActionCoordinator: error accessing Contacts store: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_handleActionPickerItemIfHomeAction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSActionCoordinator: cannot open Home app with sensitive URL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSActionCoordinator: cannot open Calendar app with the event's externalURL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSActionCoordinator: error saving EKEvent: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyUnlockDevice(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSActionCoordinator.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_5());

  __break(1u);
}

- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyPromptUnlockDevice(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSActionCoordinator.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_5());

  __break(1u);
}

void __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSActionCoordinator: could not open application because %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
