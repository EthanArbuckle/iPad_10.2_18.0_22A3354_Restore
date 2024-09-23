@implementation SAUIAppPunchOut(AssistantUIAdditions)

- (void)afui_populateStoreServicesData:()AssistantUIAdditions
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke;
    block[3] = &unk_24D7A2DF0;
    v8 = v5;
    v9 = a1;
    v10 = v4;
    dispatch_async(v6, block);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)afui_punchOutFailureViews
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "appDisplayName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assistantUILocalizedStringForKey:table:", CFSTR("PUNCHOUT_FAILURE_FOR_APP"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assistantUILocalizedStringForKey:table:", CFSTR("SPEAKABLE_PUNCHOUT_FAILURE_FOR_APP"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@%@"), 0, CFSTR("@{tts#\x1B\\pause=500\\}"), v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assistantUILocalizedStringForKey:table:", CFSTR("PUNCHOUT_FAILURE_GENERIC"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assistantUILocalizedStringForKey:table:", CFSTR("PUNCHOUT_FAILURE_GENERIC"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc_init(MEMORY[0x24BE81870]);
  objc_msgSend(v12, "setText:", v5);
  objc_msgSend(v12, "setSpeakableText:", v9);
  objc_msgSend(v11, "addObject:", v12);
  v13 = objc_alloc_init(MEMORY[0x24BE81858]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAceId:", v15);

  objc_msgSend(v13, "setDialogPhase:", *MEMORY[0x24BE82738]);
  objc_msgSend(v13, "setViews:", v11);

  return v13;
}

- (id)afui_punchOutAppNotAvailableViews
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "appDisplayName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assistantUILocalizedStringForKey:table:", CFSTR("PUNCHOUT_APP_NOT_AVAILABLE_IN_STOREFRONT"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assistantUILocalizedStringForKey:table:", CFSTR("SPEAKABLE_PUNCHOUT_APP_NOT_AVAILABLE_IN_STOREFRONT"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@%@"), 0, CFSTR("@{tts#\x1B\\pause=500\\}"), v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assistantUILocalizedStringForKey:table:", CFSTR("PUNCHOUT_FAILURE_GENERIC"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assistantUILocalizedStringForKey:table:", CFSTR("PUNCHOUT_FAILURE_GENERIC"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc_init(MEMORY[0x24BE81870]);
  objc_msgSend(v12, "setText:", v5);
  objc_msgSend(v12, "setSpeakableText:", v9);
  objc_msgSend(v11, "addObject:", v12);
  v13 = objc_alloc_init(MEMORY[0x24BE81858]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAceId:", v15);

  objc_msgSend(v13, "setDialogPhase:", *MEMORY[0x24BE82738]);
  objc_msgSend(v13, "setViews:", v11);

  return v13;
}

- (void)afui_getInstallAppPunchoutWithCompletion:()AssistantUIAdditions
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, void *);

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("AFUIStoreServicesData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(a1, "_afui_installAppPunchout");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v8);

      }
      else
      {
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __82__SAUIAppPunchOut_AssistantUIAdditions__afui_getInstallAppPunchoutWithCompletion___block_invoke;
        v9[3] = &unk_24D7A25F8;
        v9[4] = a1;
        v10 = v4;
        objc_msgSend(a1, "afui_populateStoreServicesData:", v9);

      }
    }
    else
    {
      v4[2](v4, 0);
    }

  }
}

- (id)_afui_installAppPunchout
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "appStoreUri");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE81888]);
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantUILocalizedStringForKey:table:", CFSTR("INSTALL_APP_BUTTON_TITLE"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "appDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setText:", v7);
    v8 = objc_alloc_init(MEMORY[0x24BE81860]);
    objc_msgSend(v8, "setAppAvailableInStorefront:", 1);
    objc_msgSend(a1, "appStoreUri");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPunchOutUri:", v9);

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setCommands:", v10);

  }
  return v2;
}

@end
