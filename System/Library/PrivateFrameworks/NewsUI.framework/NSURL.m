@implementation NSURL

void __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NUBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("“%@” wants to open “%@”"), &stru_24D5A3F98, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6;
  objc_msgSend(v7, "stringWithFormat:", v6, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v11, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v12);
  v13 = (void *)MEMORY[0x24BDF67E8];
  NUBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24D5A3F98, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_2;
  v26[3] = &unk_24D5A2E10;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF67E8];
  NUBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Open"), &stru_24D5A3F98, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_3;
  v24[3] = &unk_24D5A2E38;
  objc_copyWeak(&v25, &location);
  v24[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v21);
  objc_msgSend(v12, "addAction:", v17);
  objc_msgSend(v12, "setPreferredAction:", v17);
  objc_msgSend(v4, "presentViewController:animated:completion:", v12, 1, 0);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1B8], 0);

}

@end
