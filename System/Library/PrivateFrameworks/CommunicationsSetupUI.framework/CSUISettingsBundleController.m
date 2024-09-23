@implementation CSUISettingsBundleController

- (CSUISettingsBundleController)initWithParentListController:(id)a3
{
  CSUISettingsBundleController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSUISettingsBundleController;
  v3 = -[CSUISettingsBundleController initWithParentListController:](&v7, sel_initWithParentListController_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSUISettingsBundleController name](v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addListenerID:capabilities:", v5, *MEMORY[0x24BE509E8]);

  }
  return v3;
}

- (Class)controllerClassToInstantiate:(id)a3
{
  NSString *v4;
  Class v5;
  void *v6;

  -[CSUISettingsBundleController settingsClassName](self, "settingsClassName", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);

  if (MarcoShouldLogRegistration())
  {
    -[CSUISettingsBundleController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MarcoLogRegistration();

  }
  return v5;
}

- (void)_resetSpecifierAction:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  NSStringFromSelector(sel_lazyLoadSpecialBundleForSpecifier_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE759B8]);

  objc_msgSend(v4, "setControllerLoadAction:", sel_lazyLoadSpecialBundleForSpecifier_);
}

- (void)bundleTappedWithSpecifier:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  _QWORD v25[5];

  v4 = (char *)a3;
  if (MarcoShouldLogRegistration())
  {
    -[CSUISettingsBundleController name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4;
    MarcoLogRegistration();

  }
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isConnected");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blockUntilConnected");

  }
  objc_msgSend(v4, "setProperty:forKey:", self, CFSTR("bundleController"));
  objc_msgSend(v4, "propertyForKey:", CFSTR("ft-serviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    if (MarcoShouldLogRegistration())
    {
      -[CSUISettingsBundleController name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      MarcoLogRegistration();

    }
    goto LABEL_19;
  }
  if ((objc_msgSend(v11, "isServiceSupported") & 1) == 0)
  {
    if (MarcoShouldLogRegistration())
    {
      -[CSUISettingsBundleController name](self, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoLogRegistration();

    }
LABEL_19:
    -[CSUISettingsBundleController _resetSpecifierAction:](self, "_resetSpecifierAction:", v4, v24);
    goto LABEL_29;
  }
  if ((objc_msgSend(v12, "isConnected") & 1) == 0)
    objc_msgSend(v12, "connect:", 1);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __58__CSUISettingsBundleController_bundleTappedWithSpecifier___block_invoke;
  v25[3] = &unk_24D076720;
  v25[4] = self;
  objc_msgSend(v12, "setWillLaunchURLBlock:", v25);
  objc_msgSend(v12, "resetNetworkFirstRunAlert");
  CNFRegSetStringTableForServiceType(-[CSUISettingsBundleController serviceType](self, "serviceType"));
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == 1)
  {
    CNFRegSetGlobalAppearanceStyle(2);
    CNFRegSetSupportsAutoRotation(1);
  }
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    if (v10)
    {
      v18 = 0;
      goto LABEL_23;
    }
  }
  objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v18 = (void *)v15;
LABEL_23:
  if (+[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:](CNFRegAppleIDSplashViewController, "shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:", v18, 0))
  {
    v19 = (objc_class *)objc_opt_class();
  }
  else
  {
    v19 = -[CSUISettingsBundleController controllerClassToInstantiate:](self, "controllerClassToInstantiate:", v12);
  }
  v20 = v19;
  objc_msgSend(v4, "setControllerLoadAction:", 0);
  *(_QWORD *)&v4[*MEMORY[0x24BE75740]] = v20;
  if (MarcoShouldLogRegistration())
  {
    -[CSUISettingsBundleController name](self, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (uint64_t)v20;
    MarcoLogRegistration();

  }
  -[CSUISettingsBundleController settingsClassName](self, "settingsClassName", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v22, CFSTR("cnf-completionclass"));

  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("cnf-hideLearnMoreButton"));
LABEL_29:

}

void __58__CSUISettingsBundleController_bundleTappedWithSpecifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("prefs"));

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE75688]));
    objc_msgSend(WeakRetained, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(v8, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (BOOL)_cnfreg_overrideForController:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "pathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2199B8970]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("object"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]));
    objc_msgSend(WeakRetained, "rootController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CHANGE_PASSWORD")) & 1) != 0
      || objc_msgSend(v14, "isEqualToString:", CFSTR("REAUTHORIZE")))
    {
      v56 = v14;
      v54 = v13;
      objc_msgSend(v7, "objectForKey:", CFSTR("appleID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        objc_msgSend(v58, "appleIDAccounts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        if (v18)
        {
          v19 = v18;
          v49 = v8;
          v51 = v12;
          v46 = v6;
          v47 = v11;
          v20 = *(_QWORD *)v67;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v67 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_msgSend(v22, "loginDisplayString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", v16);

              if (v24)
              {
                v55 = v22;
                goto LABEL_16;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
            if (v19)
              continue;
            break;
          }
          v55 = 0;
LABEL_16:
          v6 = v46;
          v11 = v47;
          v8 = v49;
          v12 = v51;
        }
        else
        {
          v55 = 0;
        }

      }
      else
      {
        v55 = 0;
      }
      v35 = v57;
      if (objc_msgSend(v56, "isEqualToString:", CFSTR("CHANGE_PASSWORD")))
      {
        +[FTRegUtilities standaloneNewPasswordControllerWithRegController:appleID:](FTRegUtilities, "standaloneNewPasswordControllerWithRegController:appleID:", v58, v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = v12;
        objc_msgSend(v7, "objectForKey:", CFSTR("authID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("authToken"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((!v36 || !objc_msgSend(v36, "length")) && (!v37 || !objc_msgSend(v37, "length")))
        {
          objc_msgSend(v55, "authorizationID");
          v38 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v55, "authorizationToken");
          v39 = v11;
          v40 = v8;
          v41 = objc_claimAutoreleasedReturnValue();

          v36 = (void *)v38;
          v37 = (void *)v41;
          v8 = v40;
          v11 = v39;
          v35 = v57;
        }
        +[FTRegUtilities standaloneAuthorizationControllerWithRegController:authID:token:](FTRegUtilities, "standaloneAuthorizationControllerWithRegController:authID:token:", v58, v36, v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v53;
      }
    }
    else
    {
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("LOCATION"))
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = 0;
LABEL_46:

        goto LABEL_47;
      }
      v56 = v14;
      v54 = v13;
      v26 = v6;
      objc_msgSend(v7, "objectForKey:", CFSTR("guid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v55 = v26;
      objc_msgSend(v26, "regController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "appleIDAccounts");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v29)
      {
        v50 = v8;
        v52 = v12;
        v48 = v11;
        v30 = *(_QWORD *)v63;
LABEL_22:
        v31 = 0;
        while (1)
        {
          if (*(_QWORD *)v63 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v31);
          objc_msgSend(v32, "uniqueID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", v16);

          if ((v34 & 1) != 0)
            break;
          if (v29 == (void *)++v31)
          {
            v29 = (void *)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            if (v29)
              goto LABEL_22;
            goto LABEL_50;
          }
        }
        v45 = v32;

        if (v45)
        {
          objc_msgSend(v55, "_localeChooserForAccount:", v45);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v45;
LABEL_50:
          v11 = v48;
          v8 = v50;
          v12 = v52;
          goto LABEL_51;
        }
        v29 = 0;
        v11 = v48;
        v8 = v50;
        v12 = v52;
        v35 = v57;
      }
      else
      {
LABEL_51:
        v35 = v57;

      }
    }

    if (v29)
    {
      objc_msgSend(v35, "presentedViewController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v54;
      v14 = v56;
      if (v42)
      {
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __77__CSUISettingsBundleController__cnfreg_overrideForController_withDictionary___block_invoke;
        v59[3] = &unk_24D075680;
        v60 = v35;
        v61 = v29;
        v43 = v29;
        objc_msgSend(v60, "dismissViewControllerAnimated:completion:", 1, v59);

      }
      else
      {
        objc_msgSend(v35, "presentViewController:animated:completion:", v29, 1, 0);
      }

      v25 = 1;
    }
    else
    {
      v25 = 0;
      v13 = v54;
      v14 = v56;
    }
    goto LABEL_46;
  }
  v25 = 0;
LABEL_47:

  return v25;
}

uint64_t __77__CSUISettingsBundleController__cnfreg_overrideForController_withDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (int64_t)serviceType
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSUISettingsBundleController.m"), 228, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

- (id)settingsClassName
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSUISettingsBundleController.m"), 233, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

- (id)name
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSUISettingsBundleController.m"), 238, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

@end
