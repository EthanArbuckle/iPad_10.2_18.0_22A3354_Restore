@implementation FLPreferencesController

- (id)topLevelSpecifiers
{
  return -[FLPreferencesController _topLevelSpecifiersForGroup:](self, "_topLevelSpecifiersForGroup:", 2);
}

- (id)_topLevelSpecifiersForGroup:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSString *primaryAccountID;
  NSArray *secondaryAccountIDs;
  void *v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  NSArray *v27;
  NSArray *v28;
  NSObject *p_super;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  int v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t Nanoseconds;
  NSObject *v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v64;
  NSArray *obj;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  FLPreferencesController *v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  FLPreferencesController *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = _FLSignpostCreate();
  _FLSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FLPreferencesController _topLevelSpecifiersForGroup:].cold.4(v4, v5);

  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[FLPreferencesController _specifierGroupString:](self, "_specifierGroupString:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v82 = v7;
    _os_log_impl(&dword_21641D000, v6, OS_LOG_TYPE_DEFAULT, "Building top level specifiers for %@ specifiers", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_groups)
    goto LABEL_22;
  primaryAccountID = self->_primaryAccountID;
  self->_primaryAccountID = 0;

  secondaryAccountIDs = self->_secondaryAccountIDs;
  self->_secondaryAccountIDs = 0;

  if (a3 != 2)
  {
    -[AIDAServiceOwnersManager accountForService:](self->_serviceOwnersManager, "accountForService:", *MEMORY[0x24BE06080]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = self->_primaryAccountID;
    self->_primaryAccountID = v11;

    if (!self->_primaryAccountID)
    {
      -[AIDAServiceOwnersManager accountForService:](self->_serviceOwnersManager, "accountForService:", *MEMORY[0x24BE060A0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_primaryAccountID;
      self->_primaryAccountID = v14;

    }
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dmc_visibleRemoteManagementAccounts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
    {
      _FLLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[FLPreferencesController _topLevelSpecifiersForGroup:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    objc_msgSend(v17, "valueForKey:", CFSTR("identifier"));
    v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v27 = self->_secondaryAccountIDs;
    self->_secondaryAccountIDs = v26;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FLViewModel groupsForPrimaryAccount:secondaryAccounts:](self->_topViewModel, "groupsForPrimaryAccount:secondaryAccounts:", self->_primaryAccountID, self->_secondaryAccountIDs);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      _FLLogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[FLPreferencesController _topLevelSpecifiersForGroup:].cold.2((uint64_t *)&self->_topViewModel, p_super);
      goto LABEL_21;
    }
    -[FLViewModel groups](self->_topViewModel, "groups");
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  p_super = &self->_groups->super;
  self->_groups = v28;
LABEL_21:

LABEL_22:
  v59 = v4;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = self->_groups;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  v31 = a3;
  if (!v30)
    goto LABEL_59;
  v32 = v30;
  v66 = 0;
  v71 = *(_QWORD *)v77;
  v69 = *MEMORY[0x24BE1B2D8];
  v67 = *MEMORY[0x24BE1B2F8];
  v68 = *MEMORY[0x24BE1B2E0];
  v61 = *MEMORY[0x24BE75A68];
  v62 = *MEMORY[0x24BE1B300];
  v60 = *MEMORY[0x24BE1B308];
  v70 = self;
  while (2)
  {
    for (i = 0; i != v32; ++i)
    {
      if (*(_QWORD *)v77 != v71)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      objc_msgSend(v34, "items");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v35, "count"))
        goto LABEL_55;
      objc_msgSend(v34, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", v69);

      objc_msgSend(v34, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", v68);

      objc_msgSend(v34, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", v67);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v37)
        {
          objc_msgSend(v34, "accountID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isEqualToString:", v70->_primaryAccountID);

          if (v41)
            goto LABEL_34;
        }
        else
        {
          v43 = 0;
          if (v41)
          {
LABEL_34:
            objc_msgSend(v34, "accountID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "isEqualToString:", v70->_primaryAccountID);

            v31 = a3;
            goto LABEL_36;
          }
        }
      }
      else
      {
        v43 = 0;
      }
      v45 = 0;
LABEL_36:
      if (v31)
        v46 = 1;
      else
        v46 = v43;
      if (((v46 | v39) & 1) == 0 && !v45)
      {

        goto LABEL_59;
      }
      if (v31 != 1 || ((v43 | v39 | v45) & 1) == 0)
      {
        v47 = v37 | v41;
        v66 |= v37;
        if ((v66 & 1) == 0)
          v47 = v39 | v37 | v41;
        if ((v47 & 1) == 0)
        {
          v48 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v34, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("FollowUps"), "stringByAppendingFormat:", CFSTR(": %@"), v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "groupTitle");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "groupSpecifierWithID:name:", v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v49) = objc_msgSend(v53, "isEqualToString:", v62);

          if ((_DWORD)v49)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v60, CFSTR("Items above require approval..."));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_49;
          }
          objc_msgSend(v34, "footerText");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
LABEL_49:
            objc_msgSend(v52, "setProperty:forKey:", v54, v61);
          v31 = a3;

          objc_msgSend(v64, "addObject:", v52);
        }
        if (objc_msgSend(v34, "shouldCoalesceItems"))
        {
          -[FLPreferencesController _specifierForGroup:](v70, "_specifierForGroup:", v34);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v55);
        }
        else
        {
          v72[0] = MEMORY[0x24BDAC760];
          v72[1] = 3221225472;
          v72[2] = __55__FLPreferencesController__topLevelSpecifiersForGroup___block_invoke;
          v72[3] = &unk_24D55CEF8;
          v73 = v64;
          v74 = v70;
          v75 = v34;
          objc_msgSend(v35, "enumerateObjectsUsingBlock:", v72);
          v55 = v73;
        }

      }
LABEL_55:

    }
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v32)
      continue;
    break;
  }
LABEL_59:

  Nanoseconds = _FLSignpostGetNanoseconds();
  _FLSignpostLogSystem();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    -[FLPreferencesController _topLevelSpecifiersForGroup:].cold.1(Nanoseconds, v59, v57);

  return v64;
}

- (id)_specifierGroupString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("all");
  if (a3 == 1)
    v3 = CFSTR("general");
  if (a3)
    return (id)v3;
  else
    return CFSTR("account");
}

- (void)setListViewController:(id)a3
{
  objc_storeWeak((id *)&self->_listViewController, a3);
}

- (FLPreferencesController)initWithViewModel:(id)a3
{
  id v5;
  FLPreferencesController *v6;
  FLPreferencesController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  AIDAServiceOwnersManager *serviceOwnersManager;
  uint64_t v12;
  NSMutableDictionary *generatedSpecifiersByIdentifier;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLPreferencesController;
  v6 = -[FLPreferencesController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_topViewModel, a3);
    v8 = objc_alloc(MEMORY[0x24BE060E0]);
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithAccountStore:", v9);
    serviceOwnersManager = v7->_serviceOwnersManager;
    v7->_serviceOwnersManager = (AIDAServiceOwnersManager *)v10;

    v12 = objc_opt_new();
    generatedSpecifiersByIdentifier = v7->_generatedSpecifiersByIdentifier;
    v7->_generatedSpecifiersByIdentifier = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (void)setItemChangeObserver:(id)a3
{
  id v4;
  FLViewModel *topViewModel;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  topViewModel = self->_topViewModel;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__FLPreferencesController_setItemChangeObserver___block_invoke;
  v7[3] = &unk_24D55CD90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FLViewModel setItemChangeHandler:](topViewModel, "setItemChangeHandler:", v7);

}

- (FLPreferencesController)init
{
  id v3;
  void *v4;
  FLPreferencesController *v5;

  v3 = objc_alloc(MEMORY[0x24BE1B3E0]);
  v4 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:clientIdentifier:", *MEMORY[0x24BE1B2B0], 0);
  v5 = -[FLPreferencesController initWithViewModel:](self, "initWithViewModel:", v4);

  return v5;
}

void __55__FLPreferencesController__topLevelSpecifiersForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_specifiersForItem:group:", a2, *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)_specifiersForItem:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableDictionary *generatedSpecifiersByIdentifier;
  void *v41;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1B2F8]);

  if (v9)
  {
    +[FLPreferencesFollowUpItemListSpeficierFactory detailSpecifiersForFollowUpItem:target:selector:](FLPreferencesFollowUpItemListSpeficierFactory, "detailSpecifiersForFollowUpItem:target:selector:", v6, self, sel__handleActionForSpecifier_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_msgSend(v6, "displayStyle");
    objc_msgSend(v6, "extensionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (v11 & 2) != 0)
    {
      -[FLPreferencesController _deferredLoadSpecifierWithName:](self, "_deferredLoadSpecifierWithName:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FLPreferencesController _urlBasedSpecifierWithName:](self, "_urlBasedSpecifierWithName:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;

    v16 = (void *)*MEMORY[0x24BE1B2B8];
    objc_msgSend(v6, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIdentifier:", v18);

    if ((objc_msgSend(v6, "displayStyle") & 0x10) == 0)
      objc_msgSend(v15, "setProperty:forKey:", &unk_24D560958, *MEMORY[0x24BE75898]);
    v49[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", v19, *MEMORY[0x24BE1B298]);

    objc_msgSend(v6, "representingBundlePath");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v6, "bundleIconName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v6, "bundleIconName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProperty:forKey:", v23, *MEMORY[0x24BE758B0]);

        v24 = (void *)MEMORY[0x24BDD1488];
        objc_msgSend(v6, "representingBundlePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundleWithPath:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        _FLLogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "bundleIconName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v28;
          v47 = 2112;
          v48 = v26;
          _os_log_impl(&dword_21641D000, v27, OS_LOG_TYPE_DEFAULT, "Creating CFU with bundle icon: %@ <%@>", buf, 0x16u);

        }
        objc_msgSend(v15, "setupIconImageWithBundle:", v26);

      }
    }
    _FLLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "displayStyle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v30;
      _os_log_impl(&dword_21641D000, v29, OS_LOG_TYPE_DEFAULT, "Creating CFU with display style: %@", buf, 0xCu);

    }
    if ((v11 & 2) != 0
      || (objc_msgSend(MEMORY[0x24BE1B398], "currentEnvironment"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "followUpZeroActionsForTheWorld"),
          v31,
          v32))
    {
      objc_msgSend(v15, "setProperty:forKey:", v6, *MEMORY[0x24BE1B2C8]);
      objc_msgSend(v6, "actions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperty:forKey:", v34, *MEMORY[0x24BE1B2C0]);

    }
    objc_msgSend(v6, "extensionIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      v36 = objc_alloc(MEMORY[0x24BE1B3D0]);
      v44 = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v36, "initWithItems:", v37);

      objc_msgSend(v15, "setProperty:forKey:", v38, *MEMORY[0x24BE1B2D0]);
    }
    -[FLPreferencesController _updateSpecifier:withCommonPropertiesForGroup:](self, "_updateSpecifier:withCommonPropertiesForGroup:", v15, v7);
    if (v15)
    {
      objc_msgSend(v15, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        generatedSpecifiersByIdentifier = self->_generatedSpecifiersByIdentifier;
        objc_msgSend(v15, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](generatedSpecifiersByIdentifier, "setObject:forKeyedSubscript:", v15, v41);

      }
    }
    v43 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_specifierForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__FLPreferencesController__specifierForGroup___block_invoke;
  v18[3] = &unk_24D55CF20;
  v18[4] = &v19;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);

  if (*((_BYTE *)v20 + 24))
  {
    objc_msgSend(v4, "rowTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLPreferencesController _deferredLoadSpecifierWithName:](self, "_deferredLoadSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "rowTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLPreferencesController _urlBasedSpecifierWithName:](self, "_urlBasedSpecifierWithName:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x24BE1B3D0]);
    objc_msgSend(v4, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "initWithItems:", v10);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x24BE1B2D0]);
  }

  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BE1B2B8], "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v15, *MEMORY[0x24BE75898]);

  objc_msgSend(v4, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v16, *MEMORY[0x24BE1B298]);

  -[FLPreferencesController _updateSpecifier:withCommonPropertiesForGroup:](self, "_updateSpecifier:withCommonPropertiesForGroup:", v7, v4);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __46__FLPreferencesController__specifierForGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)_deferredLoadSpecifierWithName:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, 0, 0, 0, 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setControllerLoadAction:", sel_loadSpecifier_);
  return v3;
}

- (id)_urlBasedSpecifierWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = a3;
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateSpecifier:(id)a3 withCommonPropertiesForGroup:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  v6 = objc_opt_class();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B2E0]);

  if (v8)
  {
    objc_msgSend(v15, "propertyForKey:", *MEMORY[0x24BE1B298]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "informativeFooterText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "informativeFooterText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v10, "displayExpirationDate"))
      {
        objc_msgSend(v10, "formattedExpirationDate");
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
      }

      if (!v11)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v5, "subtitleText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    v6 = objc_opt_class();
    objc_msgSend(v15, "setProperty:forKey:", v11, *MEMORY[0x24BE75D28]);
    goto LABEL_11;
  }
LABEL_12:
  v13 = v15;
  if (v6)
  {
    objc_msgSend(v15, "setProperty:forKey:", v6, *MEMORY[0x24BE75948]);
    v13 = v15;
  }
  objc_msgSend(v13, "setProperty:forKey:", &unk_24D560970, *MEMORY[0x24BE75850]);
  objc_msgSend(v5, "rowTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v14, *MEMORY[0x24BE75D50]);

  objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
}

- (id)spyglassSpecifiers
{
  NSSet *v3;
  NSSet *spyglassAllowList;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  FLPreferencesFollowUpItemListViewController *v11;
  FLPreferencesFollowUpItemListViewController *spyglassController;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;

  if (!self->_spyglassAllowList)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("verifyPrimaryEmail"), CFSTR("com.apple.AAFollowUpIdentifier.StartUsing"), CFSTR("com.apple.AAFollowUpIdentifier.VerifyTerms"), 0);
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    spyglassAllowList = self->_spyglassAllowList;
    self->_spyglassAllowList = v3;

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSSet count](self->_spyglassAllowList, "count"));
  -[FLViewModel allPendingItems](self->_topViewModel, "allPendingItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__FLPreferencesController_spyglassSpecifiers__block_invoke;
  v19[3] = &unk_24D55CE80;
  v19[4] = self;
  v7 = v5;
  v20 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", CFSTR("verifyPrimaryEmail")))
  {
    v9 = CFSTR("verifyPrimaryEmail");
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.AAFollowUpIdentifier.StartUsing")))
  {
    v9 = CFSTR("com.apple.AAFollowUpIdentifier.StartUsing");
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.AAFollowUpIdentifier.VerifyTerms")))
  {
    v9 = CFSTR("com.apple.AAFollowUpIdentifier.VerifyTerms");
LABEL_9:
    objc_msgSend(v7, "valueForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_10;
LABEL_18:
    v16 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_19;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v10 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v8, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_18;
LABEL_10:
  if (!self->_spyglassController)
  {
    v11 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
    spyglassController = self->_spyglassController;
    self->_spyglassController = v11;

    -[FLPreferencesController listViewController](self, "listViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLPreferencesFollowUpItemListViewController setPresentationContext:](self->_spyglassController, "setPresentationContext:", v13);

  }
  objc_msgSend(v10, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_18;
  -[FLPreferencesFollowUpItemListViewController detailSpecifiersForFollowUpItem:](self->_spyglassController, "detailSpecifiersForFollowUpItem:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v16;
}

void __45__FLPreferencesController_spyglassSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = v3;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4 || (objc_msgSend(v8, "displayStyle") & 4) != 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v8, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v7);

  }
}

- (void)loadSpecifier:(id)a3
{
  id v4;
  _BOOL4 activityIndicatorActive;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  FLNetworkStatePrompter *v18;
  void *v19;
  FLNetworkStatePrompter *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  activityIndicatorActive = self->_activityIndicatorActive;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (activityIndicatorActive)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FLPreferencesController loadSpecifier:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_21641D000, v7, OS_LOG_TYPE_DEFAULT, "Loading specifier: %@", buf, 0xCu);
    }

    -[FLPreferencesController startSpinnerForSpecifier:](self, "startSpinnerForSpecifier:", v4);
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE1B298]);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v7, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "groupIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE1B2D8]);

    if (v17)
    {
      v18 = [FLNetworkStatePrompter alloc];
      -[FLPreferencesController listViewController](self, "listViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[FLNetworkStatePrompter initWithPresenter:](v18, "initWithPresenter:", v19);

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __41__FLPreferencesController_loadSpecifier___block_invoke;
      v21[3] = &unk_24D55CEA8;
      v21[4] = self;
      v22 = v4;
      -[FLNetworkStatePrompter preflightNetworkStateWithCompletionHandler:](v20, "preflightNetworkStateWithCompletionHandler:", v21);

    }
    else
    {
      -[FLPreferencesController _refreshItemsAndPresentDetailForSpecifier:](self, "_refreshItemsAndPresentDetailForSpecifier:", v4);
    }
  }

}

uint64_t __41__FLPreferencesController_loadSpecifier___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    return objc_msgSend(v3, "_refreshItemsAndPresentDetailForSpecifier:", v4);
  else
    return objc_msgSend(v3, "stopSpinnerForSpecifier:", v4);
}

- (void)_refreshItemsAndPresentDetailForSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  FLViewModel *topViewModel;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "Starting to refresh items for specifier: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE1B298]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  topViewModel = self->_topViewModel;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke;
  v9[3] = &unk_24D55CF48;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[FLViewModel refreshItems:withCompletionHandler:](topViewModel, "refreshItems:withCompletionHandler:", v6, v9);

}

void __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke_2;
  block[3] = &unk_24D55CC50;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke_2(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a1[4], "stopSpinnerForSpecifier:", a1[5]);
  objc_msgSend(a1[6], "objectForKeyedSubscript:", *MEMORY[0x24BE1B310]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v2 = a1[5];
    objc_msgSend(a1[5], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)*((_QWORD *)a1[4] + 6);
      objc_msgSend(a1[5], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
        v7 = a1[5];
      v8 = v7;

      v2 = v8;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3D0]), "initWithItems:", v10);
    objc_msgSend(v2, "setProperty:forKey:", v9, *MEMORY[0x24BE1B2D0]);
    objc_msgSend(a1[4], "_presentSpecifier:fromEventSource:", v2, 3);

  }
  else
  {
    objc_msgSend(a1[4], "_handleEmptyRefreshResult:", a1[6]);
  }

}

- (void)_presentSpecifier:(id)a3 fromEventSource:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FLPreferencesFollowUpItemListViewController *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  _QWORD v17[5];
  id v18;
  _BYTE *v19;
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  FLSpecifierTapHandler *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _FLLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_21641D000, v7, OS_LOG_TYPE_DEFAULT, "Presenting specifier: %@ with eventSource: %lu", buf, 0x16u);
  }

  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE1B2C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE1B3D8], "sharedTelemetryController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "captureItemView:", v8);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v21 = __Block_byref_object_copy__2;
    v22 = __Block_byref_object_dispose__2;
    v23 = objc_alloc_init(FLSpecifierTapHandler);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDelegate:", self);
    v10 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__FLPreferencesController__presentSpecifier_fromEventSource___block_invoke;
    v17[3] = &unk_24D55CF70;
    v17[4] = self;
    v18 = v8;
    v19 = buf;
    objc_msgSend(v10, "actionTapped:eventSource:withCompletionHandler:", v6, a4, v17);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE1B298]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_2);
    -[FLPreferencesController listViewController](self, "listViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
    -[FLPreferencesFollowUpItemListViewController setSpecifier:](v13, "setSpecifier:", v6);
    -[FLPreferencesFollowUpItemListViewController setParentController:](v13, "setParentController:", v12);
    objc_msgSend(v12, "splitViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "splitViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "showInitialViewController:", v13);

    }
    else
    {
      objc_msgSend(v12, "showController:", v13);
    }

  }
}

void __61__FLPreferencesController__presentSpecifier_fromEventSource___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_zeroActionFailure:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __61__FLPreferencesController__presentSpecifier_fromEventSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BE1B3D8];
  v3 = a2;
  objc_msgSend(v2, "sharedTelemetryController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureItemView:", v3);

}

- (void)_handleActionForSpecifier:(id)a3
{
  -[FLPreferencesController _presentSpecifier:fromEventSource:](self, "_presentSpecifier:fromEventSource:", a3, 4);
}

- (void)_zeroActionFailure:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE1B398], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternal");

  if (v6)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __46__FLPreferencesController__zeroActionFailure___block_invoke;
    v16 = &unk_24D55CDB8;
    v17 = v4;
    +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", CFSTR("Tap-To-Radar"), 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", CFSTR("Dismiss"), 0, 0, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Follow Up Error [INTERNAL]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Did you notice an error? If so, file a radar."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLPreferencesController listViewController](self, "listViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FLAlertControllerHelper presentAlertWithTitle:message:actions:presentingController:](FLAlertControllerHelper, "presentAlertWithTitle:message:actions:presentingController:", v10, v11, v9, v12);

  }
}

void __46__FLPreferencesController__zeroActionFailure___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x24BE1B3E8];
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CFU access failure: %@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tapToRadarWithTitle:initialMessage:", v3, 0);

}

- (void)startPresentingForHandler:(id)a3 withRemoteController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21641D000, v6, OS_LOG_TYPE_DEFAULT, "Start presenting identifier: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "setModalPresentationStyle:", 5);
  -[FLPreferencesController listViewController](self, "listViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)preflightNetworkConnectivityForHandler:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  FLNetworkStatePrompter *v6;
  void *v7;
  FLNetworkStatePrompter *v8;

  v5 = a4;
  v6 = [FLNetworkStatePrompter alloc];
  -[FLPreferencesController listViewController](self, "listViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FLNetworkStatePrompter initWithPresenter:](v6, "initWithPresenter:", v7);

  -[FLNetworkStatePrompter preflightNetworkStateWithCompletionHandler:](v8, "preflightNetworkStateWithCompletionHandler:", v5);
}

uint64_t __49__FLPreferencesController_setItemChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)startSpinnerForSpecifier:(id)a3
{
  self->_activityIndicatorActive = 1;
  objc_msgSend(a3, "fl_startSpinner");
}

- (void)stopSpinnerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  self->_activityIndicatorActive = 0;
  v4 = a3;
  objc_msgSend(v4, "fl_stopSpinner");
  -[FLPreferencesController listViewController](self, "listViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForSpecifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 0);
}

- (void)performPreferencesActionForGroup:(id)a3 item:(id)a4 action:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  id *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  FLPreferencesFollowUpItemListViewController *v40;
  FLPreferencesTapActionResult *v41;
  id v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD);
  _QWORD v45[4];
  void (**v46)(_QWORD, _QWORD);
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD *v50;
  _QWORD v51[4];
  _QWORD v52[2];
  id v53;
  void (**v54)(_QWORD, _QWORD);
  _QWORD v55[5];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  char v61;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12 != 0;
  if (!v12)
    objc_msgSend(v10, "shouldCoalesceItems");
  objc_msgSend(v10, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE1B2F8];
  v17 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE1B2F8]);

  if (v11)
  {
    v18 = objc_msgSend(v11, "displayStyle");
    if (v12)
    {
      v19 = (v18 >> 1) & 1;
LABEL_7:
      v42 = v12;
      goto LABEL_12;
    }
    if ((v18 & 2) != 0)
    {
      objc_msgSend(v11, "actions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v42 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(v19) = 1;
      goto LABEL_12;
    }
    LOBYTE(v19) = 0;
  }
  else
  {
    LOBYTE(v19) = 0;
    if (v12)
      goto LABEL_7;
  }
  v42 = 0;
LABEL_12:
  v44 = (void (**)(_QWORD, _QWORD))v13;
  if (objc_msgSend(v10, "shouldCoalesceItems", v42))
  {
    objc_msgSend(v10, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "na_any:", &__block_literal_global_72);

    if ((v22 & 1) != 0)
    {
      v14 = 0;
LABEL_20:
      objc_initWeak(location, self->_topViewModel);
      v27 = (void *)MEMORY[0x24BE6B608];
      v28 = MEMORY[0x24BDAC760];
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2;
      v57[3] = &unk_24D55D040;
      v29 = v11;
      v58 = v29;
      v30 = v10;
      v59 = v30;
      v61 = v17;
      objc_copyWeak(&v60, location);
      objc_msgSend(v27, "lazyFutureWithBlock:", v57);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__2;
      v55[4] = __Block_byref_object_dispose__2;
      v56 = 0;
      if (v14)
      {
        v47[0] = v28;
        v47[1] = 3221225472;
        v47[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_4;
        v47[3] = &unk_24D55D130;
        v50 = v55;
        v48 = v29;
        v32 = v43;
        v49 = v43;
        objc_msgSend(v31, "flatMap:", v47);
        v33 = v44;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = &v48;
        v36 = v49;
      }
      else
      {
        v51[0] = v28;
        v51[1] = 3221225472;
        v51[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_77;
        v51[3] = &unk_24D55D090;
        v52[0] = v30;
        v52[1] = self;
        v53 = v29;
        v33 = v44;
        v54 = v44;
        objc_msgSend(v31, "flatMap:", v51);
        v32 = v43;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id *)v52;

        v36 = v53;
      }

      v45[0] = v28;
      v45[1] = 3221225472;
      v45[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_8;
      v45[3] = &unk_24D55D158;
      v46 = v33;
      v38 = (id)objc_msgSend(v34, "addCompletionBlock:", v45);

      _Block_object_dispose(v55, 8);
      objc_destroyWeak(&v60);

      objc_destroyWeak(location);
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v10, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", v16);

    if ((v24 & 1) != 0)
      goto LABEL_20;
    objc_msgSend(v11, "extensionIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 ? 1 : v19;

    v14 = v19;
    if ((v26 & 1) != 0)
      goto LABEL_20;
  }
  if ((objc_msgSend(v10, "shouldCoalesceItems") & 1) != 0)
  {
    -[FLPreferencesController _specifierForGroup:](self, "_specifierForGroup:", v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FLPreferencesController _specifiersForItem:group:](self, "_specifiersForItem:group:", v11, v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v32 = v43;
  v33 = v44;
  v40 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
  -[FLPreferencesFollowUpItemListViewController setSpecifier:](v40, "setSpecifier:", v37);
  v41 = -[FLPreferencesTapActionResult initWithViewControllerToPresent:presentationStyle:]([FLPreferencesTapActionResult alloc], "initWithViewControllerToPresent:presentationStyle:", v40, 0);
  ((void (**)(_QWORD, FLPreferencesTapActionResult *))v33)[2](v33, v41);

LABEL_28:
}

BOOL __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "extensionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    _FLLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "shouldCoalesceItems") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "items");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v13 = (void *)v12;
    goto LABEL_10;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v17[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x24BDBD1A8];
LABEL_10:
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "finishWithResult:", v13);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_75;
    v15[3] = &unk_24D55D018;
    v16 = v3;
    objc_msgSend(WeakRetained, "refreshItems:withCompletionHandler:", v13, v15);

  }
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE1B310]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v10);
  }
  else
  {
    v7 = objc_msgSend(v5, "count");
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "finishWithResult:", v6);
    }
    else
    {
      FLError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithError:", v9);

    }
  }

}

id __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BE6B608];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_3;
  v11[3] = &unk_24D55D068;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v15 = v3;
  v16 = *(id *)(a1 + 56);
  v8 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_3(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  FLPreferencesFollowUpItemListViewController *v6;
  FLPreferencesTapActionResult *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldCoalesceItems");
  v3 = *(void **)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "_specifierForGroup:", *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "_specifiersForItem:group:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3D0]), "initWithItems:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v8, "setProperty:forKey:", v5, *MEMORY[0x24BE1B2D0]);
  v6 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
  -[FLPreferencesFollowUpItemListViewController setSpecifier:](v6, "setSpecifier:", v8);
  v7 = -[FLPreferencesTapActionResult initWithViewControllerToPresent:presentationStyle:]([FLPreferencesTapActionResult alloc], "initWithViewControllerToPresent:presentationStyle:", v6, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

id __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x24BE6B608];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_5;
  v5[3] = &unk_24D55D108;
  v8 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "lazyFutureWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  v3 = a2;
  +[FLHeadlessActionHandler handlerWithItem:](FLFollowUpActionHandler, "handlerWithItem:", a1[4]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_6;
  v18[3] = &unk_24D55D0B8;
  v9 = v3;
  v19 = v9;
  v20 = v21;
  objc_msgSend(v7, "setExtensionRequestedViewControllerPresentation:", v18);
  v10 = a1[5];
  v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_7;
  v14[3] = &unk_24D55D0E0;
  v16 = v21;
  v12 = v9;
  v13 = a1[6];
  v15 = v12;
  v17 = v13;
  objc_msgSend(v11, "handleAction:completion:", v10, v14);

  _Block_object_dispose(v21, 8);
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  FLPreferencesTapActionResult *v4;

  v3 = a2;
  v4 = -[FLPreferencesTapActionResult initWithViewControllerToPresent:presentationStyle:]([FLPreferencesTapActionResult alloc], "initWithViewControllerToPresent:presentationStyle:", v3, 1);

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_7(uint64_t a1)
{
  FLPreferencesTapActionResult *v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = -[FLPreferencesTapActionResult initWithViewControllerToPresent:presentationStyle:]([FLPreferencesTapActionResult alloc], "initWithViewControllerToPresent:presentationStyle:", 0, 1);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v2);

  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FLPreferencesTapActionResult *v4;

  if (a3)
  {
    v4 = -[FLPreferencesTapActionResult initWithViewControllerToPresent:presentationStyle:]([FLPreferencesTapActionResult alloc], "initWithViewControllerToPresent:presentationStyle:", 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

+ (BOOL)shouldPreflightNetworkAccessForGroup:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B2D8]);

  if (v8)
  {
    if (v6)
      v9 = ((unint64_t)objc_msgSend(v6, "displayStyle") >> 1) & 1;
    else
      LOBYTE(v9) = 0;
    if (objc_msgSend(v5, "shouldCoalesceItems"))
    {
      objc_msgSend(v5, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v10, "na_any:", &__block_literal_global_82);
    }
    else
    {
      objc_msgSend(v6, "extensionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

BOOL __69__FLPreferencesController_shouldPreflightNetworkAccessForGroup_item___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "extensionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (PSListController)listViewController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listViewController);
}

- (id)itemChangeObserver
{
  return self->_itemChangeObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemChangeObserver, 0);
  objc_destroyWeak((id *)&self->_listViewController);
  objc_storeStrong((id *)&self->_secondaryAccountIDs, 0);
  objc_storeStrong((id *)&self->_primaryAccountID, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_generatedSpecifiersByIdentifier, 0);
  objc_storeStrong((id *)&self->_spyglassAllowList, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_spyglassController, 0);
  objc_storeStrong((id *)&self->_topViewModel, 0);
}

- (void)_topLevelSpecifiersForGroup:(os_log_t)log .cold.1(unint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = (double)a1 / 1000000000.0;
  _os_log_debug_impl(&dword_21641D000, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: GenerateTopSpecifiers", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_topLevelSpecifiersForGroup:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21641D000, a2, OS_LOG_TYPE_ERROR, "Unhandled state, no method of obtaining groups from %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_topLevelSpecifiersForGroup:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21641D000, a1, a3, "Improperly handled state, multiple secondary accounts, will be searching for the first one", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_topLevelSpecifiersForGroup:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_21641D000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: GenerateTopSpecifiers", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)loadSpecifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21641D000, a1, a3, "Ignoring load request, already loading...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

@end
