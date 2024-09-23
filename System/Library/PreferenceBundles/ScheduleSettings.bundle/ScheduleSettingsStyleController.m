@implementation ScheduleSettingsStyleController

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)ScheduleSettingsStyleController;
  -[PSListItemsController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (self->_isExchangeAccount)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_DAFoldersThatExternalClientsCareAboutChanged, CFSTR("ASAccountFoldersThatExternalClientsCareAboutExternallyChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_DAFolderHierarchyChanged, CFSTR("ASAccountFolderHierarchyExternallyChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accountsChanged, *MEMORY[0x24BDB3FB0], 0);
  v8.receiver = self;
  v8.super_class = (Class)ScheduleSettingsStyleController;
  -[PSListItemsController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  objc_super v7;

  v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  if (self->_isExchangeAccount)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("ASAccountFoldersThatExternalClientsCareAboutExternallyChangedNotification"), 0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, self, CFSTR("ASAccountFolderHierarchyExternallyChangedNotification"), 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)ScheduleSettingsStyleController;
  -[PSListItemsController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (id)specifiers
{
  void *v2;
  void *v4;
  ACAccount *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *mailboxInfos;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  ScheduleSettingsStyleController *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v2)
  {
    v31 = (int)*MEMORY[0x24BE756E0];
    v41.receiver = self;
    v41.super_class = (Class)ScheduleSettingsStyleController;
    v2 = (void *)objc_msgSend(-[PSListItemsController specifiers](&v41, sel_specifiers), "mutableCopy");
    v4 = (void *)objc_msgSend((id)-[ScheduleSettingsStyleController specifier](self, "specifier"), "userInfo");

    v5 = (ACAccount *)(id)objc_msgSend(v4, "objectForKey:", CFSTR("ScheduleSettingsAccountKey"));
    self->_account = v5;
    v6 = -[ACAccountType identifier](-[ACAccount accountType](v5, "accountType"), "identifier");
    self->_isExchangeAccount = -[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDB4030]);

    self->_mailAccountUniqueId = 0;
    v7 = objc_msgSend(v4, "objectForKey:", CFSTR("ScheduleSettingsAccountUniqueIdentifierKey"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = (void *)objc_msgSend(MEMORY[0x24BE66358], "mailAccounts");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v13, "uniqueIdForPersistentConnection"), "isEqualToString:", v7))
          {
            self->_mailAccountUniqueId = (NSString *)(id)objc_msgSend(v13, "uniqueID");
            self->_supportsUserPushedMailboxes = objc_msgSend(v13, "supportsUserPushedMailboxes");
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:
    v14 = (void *)objc_msgSend(v2, "objectAtIndex:", 0);
    objc_msgSend(v14, "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SELECT_SCHEDULE"), &stru_24E147A80, CFSTR("ScheduleSettings")));
    v15 = -[ScheduleSettingsStyleController notAvailableText](self, "notAvailableText");
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v14, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);
      if (objc_msgSend(v16, "_isNaturallyRTL"))
        v17 = 2;
      else
        v17 = 0;
      v18 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
      objc_msgSend(v14, "setProperty:forKey:", v18, *MEMORY[0x24BE75A28]);
      v19 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
      objc_msgSend(v14, "setProperty:forKey:", v19, *MEMORY[0x24BE75860]);
    }
    v32 = self;
    if (-[ScheduleSettingsStyleController shouldShowMailboxes](self, "shouldShowMailboxes"))
    {
      mailboxInfos = self->_mailboxInfos;
      if (!mailboxInfos)
      {
        -[ScheduleSettingsStyleController reloadFolders](self, "reloadFolders");
        mailboxInfos = self->_mailboxInfos;
      }
      if (-[NSArray count](mailboxInfos, "count"))
      {
        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PUSHED_MAILBOXES"), &stru_24E147A80, CFSTR("ScheduleSettings"))));
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v21 = self->_mailboxInfos;
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v34;
          v25 = *MEMORY[0x24BE636C0];
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v34 != v24)
                objc_enumerationMutation(v21);
              v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
              v28 = objc_msgSend(v27, "objectForKey:", v25);
              v29 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, 0, 0, 0, 0, 13, 0);
              objc_msgSend(v29, "setProperty:forKey:", v27, CFSTR("mailbox"));
              objc_msgSend(v2, "addObject:", v29);
            }
            v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v23);
        }
      }
    }

    *(Class *)((char *)&v32->super.super.super.super.super.super.isa + v31) = (Class)v2;
  }
  return v2;
}

- (void)reloadFolders
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *mailAccountUniqueId;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];

  self->_mailboxInfos = 0;
  self->_monitored = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = *MEMORY[0x24BE636D8];
  v8[0] = *MEMORY[0x24BE636C0];
  v8[1] = v3;
  v4 = *MEMORY[0x24BE636D0];
  v8[2] = *MEMORY[0x24BE636C8];
  v8[3] = v4;
  v8[4] = *MEMORY[0x24BE636E0];
  v5 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 5);
  mailAccountUniqueId = self->_mailAccountUniqueId;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__ScheduleSettingsStyleController_reloadFolders__block_invoke;
  v7[3] = &unk_24E1478A0;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BE636E8], "mailboxListingForAccountWithUniqueIdentifier:keys:completionBlock:", mailAccountUniqueId, v5, v7);
}

uint64_t __48__ScheduleSettingsStyleController_reloadFolders__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1424) = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1424);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    v7 = *MEMORY[0x24BE636D0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v7), "BOOLValue"))
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "addObject:", v9);
        ++v8;
      }
      while (v5 != v8);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)shouldShowMailboxes
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_msgSend((id)-[ScheduleSettingsStyleController specifier](self, "specifier"), "userInfo"), "objectForKey:", CFSTR("ScheduleSettingsAccountUniqueIdentifierKey"));
  return !objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]), "styleForAccount:uniqueIdentifier:", self->_account, v3)&& self->_supportsUserPushedMailboxes;
}

- (id)notAvailableText
{
  uint64_t v3;
  int v4;
  const __CFString *v5;

  v3 = objc_msgSend((id)objc_msgSend((id)-[ScheduleSettingsStyleController specifier](self, "specifier"), "userInfo"), "objectForKey:", CFSTR("ScheduleSettingsAccountUniqueIdentifierKey"));
  v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]), "styleForAccount:uniqueIdentifier:", self->_account, v3);
  if (!v4)
  {
    v5 = CFSTR("WHEN_PUSH_NOT_AVAILABLE");
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v5, &stru_24E147A80, CFSTR("ScheduleSettings"));
  }
  if (v4 == 2)
  {
    v5 = CFSTR("WHEN_FETCH_NOT_AVAILABLE");
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v5, &stru_24E147A80, CFSTR("ScheduleSettings"));
  }
  return 0;
}

- (void)listItemSelected:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ScheduleSettingsStyleController;
  -[PSListItemsController listItemSelected:](&v4, sel_listItemSelected_, a3);
  objc_msgSend((id)-[ScheduleSettingsStyleController table](self, "table"), "noteNumberOfRowsChanged");
  -[ScheduleSettingsStyleController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)setPushStateForMailbox:(id)a3 state:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  dispatch_time_t v7;
  _QWORD block[5];

  v4 = a4;
  self->_ignoringNotifications = 1;
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE636E0]);
  objc_msgSend(MEMORY[0x24BE636E8], "setPushStateForMailboxWithPath:account:pushState:error:", v6, self->_mailAccountUniqueId, v4, 0);
  v7 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ScheduleSettingsStyleController_setPushStateForMailbox_state___block_invoke;
  block[3] = &unk_24E147818;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
}

uint64_t __64__ScheduleSettingsStyleController_setPushStateForMailbox_state___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1442) = 0;
  return result;
}

- (void)_reloadFoldersAndSpecifiersForced:(BOOL)a3
{
  NSMutableSet *v5;

  if (!self->_ignoringNotifications)
  {
    if (objc_msgSend(MEMORY[0x24BE66358], "accountWithUniqueId:", self->_mailAccountUniqueId))
    {
      v5 = self->_monitored;
      -[ScheduleSettingsStyleController reloadFolders](self, "reloadFolders");
      if (a3 || (-[NSMutableSet isEqualToSet:](self->_monitored, "isEqualToSet:", v5) & 1) == 0)
        -[ScheduleSettingsStyleController reloadSpecifiers](self, "reloadSpecifiers");

    }
    else
    {
      objc_msgSend((id)-[ScheduleSettingsStyleController navigationController](self, "navigationController"), "popViewControllerAnimated:", 1);
    }
  }
}

- (void)_reloadFoldersAndSpecifiers
{
  -[ScheduleSettingsStyleController _reloadFoldersAndSpecifiersForced:](self, "_reloadFoldersAndSpecifiersForced:", 1);
}

- (void)_accountsChanged
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadFoldersAndSpecifiers, 0);
  -[ScheduleSettingsStyleController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadFoldersAndSpecifiers, 0, 0.1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PushedMailboxTableCell *v10;
  uint64_t v11;
  objc_super v13;

  v7 = -[ScheduleSettingsStyleController indexForIndexPath:](self, "indexForIndexPath:", a4);
  v8 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v7), "propertyForKey:", CFSTR("mailbox"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (PushedMailboxTableCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PushedMailboxTableCell"));
    if (!v10)
      v10 = -[PushedMailboxTableCell initWithStyle:reuseIdentifier:]([PushedMailboxTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PushedMailboxTableCell"));
    v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE636D8]), "integerValue");
    -[PushedMailboxTableCell setType:](v10, "setType:", (int)v11);
    -[PushedMailboxTableCell setLevel:](v10, "setLevel:", objc_msgSend((id)objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE636C8]), "intValue"));
    -[PushedMailboxTableCell setMailboxName:](v10, "setMailboxName:", objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE636C0]));
    -[PushedMailboxTableCell setEnabled:](v10, "setEnabled:", v11 << 32 != 0x700000000);
    -[PushedMailboxTableCell setChecked:](v10, "setChecked:", -[NSMutableSet containsObject:](self->_monitored, "containsObject:", v9));
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ScheduleSettingsStyleController;
    return -[PSListItemsController tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  }
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableSet *monitored;
  objc_super v13;

  v7 = -[ScheduleSettingsStyleController indexForIndexPath:](self, "indexForIndexPath:", a4);
  v8 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v7), "propertyForKey:", CFSTR("mailbox"));
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
    v11 = objc_msgSend(v10, "isChecked") ^ 1;
    objc_msgSend(v10, "setChecked:", v11);
    monitored = self->_monitored;
    if ((v11 & 1) != 0)
      -[NSMutableSet addObject:](monitored, "addObject:", v9);
    else
      -[NSMutableSet removeObject:](monitored, "removeObject:", v9);
    -[ScheduleSettingsStyleController setPushStateForMailbox:state:](self, "setPushStateForMailbox:state:", v9, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ScheduleSettingsStyleController;
    -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, a3, a4);
  }
}

@end
