@implementation DSPrivateRelayController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSPrivateRelayController");
    v3 = (void *)DSLogPrivateRelay;
    DSLogPrivateRelay = (uint64_t)v2;

  }
}

- (DSPrivateRelayController)init
{
  void *v3;
  void *v4;
  void *v5;
  DSPrivateRelayController *v6;
  objc_super v8;

  DSUILocStringForKey(CFSTR("PRIVATE_RELAY_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("network.badge.shield.half.filled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)DSPrivateRelayController;
  v6 = -[DSPrivateRelayController initWithTitle:detailText:icon:](&v8, sel_initWithTitle_detailText_icon_, v4, 0, v5);

  return v6;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sharedWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke;
  v7[3] = &unk_24EFF3B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPrivateRelayRestricted"))
  {
    v2 = DSLogPrivateRelay;
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_INFO, "Private Relay restricted by ScreenTime/MDM", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BE6B748];
    sharedWorkQueue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_199;
    v6[3] = &unk_24EFF3B18;
    v5 = *(id *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v3, "getPrivacyProxyAccountType:completionHandler:", v4, v6);

  }
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_199(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR))
      __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_199_cold_1();
    goto LABEL_6;
  }
  if (a2 != 2)
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_7;
  }
  v6 = (void *)MEMORY[0x24BE6B748];
  sharedWorkQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_200;
  v9[3] = &unk_24EFF3AF0;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v6, "getServiceStatus:completionHandler:", v7, v9);

LABEL_7:
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR))
    __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_200_cold_1();
  v7 = objc_msgSend(v5, "serviceStatus");
  objc_msgSend(*(id *)(a1 + 32), "setProxyServiceStatus:", v7);
  if (v7 == 6)
  {
    v8 = DSLogPrivateRelay;
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2278DF000, v8, OS_LOG_TYPE_INFO, "User has Private Relay access but is in an unsupported region", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BE6B748];
    sharedWorkQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_201;
    v11[3] = &unk_24EFF3AC8;
    v12 = *(id *)(a1 + 40);
    v13 = v7;
    objc_msgSend(v9, "getGeohashSharingPreference:completionHandler:", v10, v11);

  }
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_201(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR))
    __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_201_cold_1();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 1)
    v7 = a2;
  else
    v7 = 0;
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DSPrivateRelayController;
  -[DSOBWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  -[DSPrivateRelayController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivateRelayController privateRelayDetailText](self, "privateRelayDetailText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetailText:", v4);

  -[DSPrivateRelayController enableButtonTitle](self, "enableButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v5, self, sel_turnOnPrivateRelay);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivateRelayController setEnableButton:](self, "setEnableButton:", v6);

  DSUILocStringForKey(CFSTR("SKIP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivateRelayController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v7, v8, sel_pushNextPane);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivateRelayController setLinkButton:](self, "setLinkButton:", v9);

  v10 = +[DSUIUtilities setUpLearnMoreButtonForController:selector:](DSUIUtilities, "setUpLearnMoreButtonForController:selector:", self, sel_learnMorePressed);
}

- (void)turnOnPrivateRelay
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[DSPrivateRelayController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showButtonsBusy");

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke;
  v4[3] = &unk_24EFF3730;
  objc_copyWeak(&v5, &location);
  -[DSPrivateRelayController setPrivateRelayEnabledWithHandler:](self, "setPrivateRelayEnabledWithHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR))
      __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_cold_1();
    DSUILocStringForKey(CFSTR("PRIVATE_RELAY_FAILURE_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("PRIVATE_RELAY_FAILURE_DETAIL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v5;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_220;
    v12[3] = &unk_24EFF3418;
    v12[4] = v5;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_2;
    v11[3] = &unk_24EFF3418;
    objc_msgSend(v5, "presentErrorAlertWithTitle:message:continueHandler:tryAgainHandler:", v7, v9, v12, v11);

  }
  else
  {
    objc_msgSend(WeakRetained, "buttonTray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showButtonsAvailable");

    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushNextPane");
  }

}

void __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_220(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsAvailable");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushNextPane");

}

uint64_t __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "turnOnPrivateRelay");
}

- (void)setPrivateRelayEnabledWithHandler:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  sharedWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke;
  block[3] = &unk_24EFF3898;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BE6B748];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_2;
  v2[3] = &unk_24EFF38E8;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "setUserTier:queue:completionHandler:", 2, MEMORY[0x24BDAC9B8], v2);

}

void __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BE6B748];
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_3;
    v3[3] = &unk_24EFF38E8;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v2, "setGeohashSharingPreference:queue:completionHandler:", 0, MEMORY[0x24BDAC9B8], v3);

  }
}

uint64_t __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)learnMorePressed
{
  void *v3;
  void *v4;
  id v5;

  -[DSPrivateRelayController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("PRIVATE_RELAY_LEARN_MORE_URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "learnMorePressedForController:withURL:", self, v4);

}

- (id)enableButtonTitle
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (-[DSPrivateRelayController proxyServiceStatus](self, "proxyServiceStatus") == 1)
    v2 = CFSTR("ENABLE_BROAD_IP_TITLE");
  else
    v2 = CFSTR("ENABLE_PRIVATE_RELAY_TITLE");
  DSUILocStringForKey(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)privateRelayDetailText
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (-[DSPrivateRelayController proxyServiceStatus](self, "proxyServiceStatus") == 1)
    v2 = CFSTR("PRIVATE_RELAY_USER_HAS_LOCALIZED_ADDRESS_DETAIL");
  else
    v2 = CFSTR("PRIVATE_RELAY_SUBSCRIPTION_TURNED_OFF_DETAIL");
  DSUILocStringForKey(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBBoldTrayButton)enableButton
{
  return self->_enableButton;
}

- (void)setEnableButton:(id)a3
{
  objc_storeStrong((id *)&self->_enableButton, a3);
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (unint64_t)proxyServiceStatus
{
  return self->_proxyServiceStatus;
}

- (void)setProxyServiceStatus:(unint64_t)a3
{
  self->_proxyServiceStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_199_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "An error occurred while getting Private Relay account type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_200_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "An error occurred while getting Private Relay service status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_201_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "An error occurred while getting Private Relay IP Address setting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Error enabling private relay: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
