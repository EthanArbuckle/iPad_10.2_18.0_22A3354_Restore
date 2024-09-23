@implementation MCURLListenerListController

+ (id)originalURLSender
{
  return (id)sOriginalURLSender;
}

+ (void)setOriginalURLSender:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)sOriginalURLSender;
  sOriginalURLSender = v3;

}

- (void)_showSheetToInstallConfigurationProfileFromPurgatoryWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peekProfileDataFromPurgatoryForDeviceType:", objc_msgSend(MEMORY[0x1E0D47220], "thisDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[MCURLListenerListController _showSheetToInstallConfigurationProfileWithData:withCompletion:](self, "_showSheetToInstallConfigurationProfileWithData:withCompletion:", v5, v6);

}

- (void)_showSheetToInstallConfigurationProfileFromInstallationQueueWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popProfileDataFromHeadOfInstallationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[MCURLListenerListController _showSheetToInstallConfigurationProfileWithData:withCompletion:](self, "_showSheetToInstallConfigurationProfileWithData:withCompletion:", v5, v6);

}

- (void)_showSheetToInstallConfigurationProfileWithData:(id)a3 withCompletion:(id)a4
{
  id v6;
  MCInstallProfileViewController *v7;
  MCUINavigationViewController *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = -[MCInstallProfileViewController initWithInstallableProfileData:fromSource:]([MCInstallProfileViewController alloc], "initWithInstallableProfileData:fromSource:", v6, 2);

  v8 = -[MCUINavigationViewController initWithRootViewController:]([MCUINavigationViewController alloc], "initWithRootViewController:", v7);
  if (MCUIIsiPad())
    -[MCUINavigationViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  -[MCURLListenerListController _presentNextController:withCompletion:](self, "_presentNextController:withCompletion:", v8, v9);

}

- (void)_presentNextController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__MCURLListenerListController__presentNextController_withCompletion___block_invoke;
  v10[3] = &unk_1EA2B6418;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __69__MCURLListenerListController__presentNextController_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_pushProfileDetailsForProfileWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  MCRemoveProfileViewController *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    -[MCURLListenerListController specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if (!v10)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[MCURLListenerListController specifiers](self, "specifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(char **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v16, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v6);

            if (v18)
            {
              v19 = *(_QWORD *)&v16[*MEMORY[0x1E0D805B8]];
              if (v19 == objc_opt_class())
              {
                objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "installedProfileWithIdentifier:", v6);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v23 = -[MCRemoveProfileViewController initWithProfile:]([MCRemoveProfileViewController alloc], "initWithProfile:", v20);
                -[MCURLListenerListController navigationController](self, "navigationController");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "pushViewController:animated:", v23, 1);

              }
              else
              {
                CreateDetailControllerInstanceWithClass();
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[MCURLListenerListController rootController](self, "rootController");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setRootController:", v21);

                objc_msgSend(v20, "setParentController:", self);
                objc_msgSend(v20, "setSpecifier:", v16);
                -[MCURLListenerListController showController:animate:](self, "showController:animate:", v20, 0);
              }

              goto LABEL_16;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v13)
            continue;
          break;
        }
      }

      NSLog(CFSTR("Error: Could not find profile “%@”"), v6);
    }
  }
LABEL_16:
  if (v7)
    v7[2](v7);

}

- (void)handleURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("sender"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "setOriginalURLSender:", v4);
  NSLog(CFSTR("MCURLListenerListController handling URL path %@ from sender %@"), v5, v4);
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D472A0]))
  {
    -[MCURLListenerListController _showSheetToInstallConfigurationProfileFromInstallationQueueWithCompletion:](self, "_showSheetToInstallConfigurationProfileFromInstallationQueueWithCompletion:", 0);
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D47298]))
  {
    -[MCURLListenerListController _showSheetToInstallConfigurationProfileFromPurgatoryWithCompletion:](self, "_showSheetToInstallConfigurationProfileFromPurgatoryWithCompletion:", 0);
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D47290]))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("profileID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCURLListenerListController _pushProfileDetailsForProfileWithID:withCompletion:](self, "_pushProfileDetailsForProfileWithID:withCompletion:", v6, 0);

  }
  else
  {
    NSLog(CFSTR("MCURLListenerListController ignoring URL path %@ from sender %@"), v5, v4);
  }

}

@end
