@implementation DSShareLocationController

- (DSShareLocationController)init
{
  void *v3;
  void *v4;
  void *v5;
  DSShareLocationController *v6;
  os_log_t v7;
  void *v8;
  uint64_t v9;
  FMFSession *fmfSession;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *locationSharingTypeNames;
  CNContactPickerViewController *v16;
  CNContactPickerViewController *contactsViewController;
  void *v18;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  DSUILocStringForKey(CFSTR("SHARE_LOCATION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("SHARE_LOCATION_DETAIL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("findmy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)DSShareLocationController;
  v6 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v20, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v3, v4, v5, 0);

  if (v6)
  {
    v7 = os_log_create("com.apple.DigitalSeparation", "DSShareLocationController");
    v8 = (void *)DSLog;
    DSLog = (uint64_t)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE2FED0]), "initWithDelegate:", 0);
    fmfSession = v6->_fmfSession;
    v6->_fmfSession = (FMFSession *)v9;

    v6->_selectedLocationSharingType = 3;
    DSUILocStringForKey(CFSTR("SHARE_ONE_HOUR"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    DSUILocStringForKey(CFSTR("SHARE_EOD"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    DSUILocStringForKey(CFSTR("SHARE_INDEFINITELY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v14 = objc_claimAutoreleasedReturnValue();
    locationSharingTypeNames = v6->_locationSharingTypeNames;
    v6->_locationSharingTypeNames = (NSArray *)v14;

    v16 = (CNContactPickerViewController *)objc_alloc_init(MEMORY[0x24BDBAE78]);
    contactsViewController = v6->_contactsViewController;
    v6->_contactsViewController = v16;

    -[CNContactPickerViewController setDelegate:](v6->_contactsViewController, "setDelegate:", v6);
    -[OBTableWelcomeController tableView](v6, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMultipleTouchEnabled:", 0);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSShareLocationController;
  -[DSTableWelcomeController viewDidLoad](&v8, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("SHARE_LOCATION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, self, sel_shareLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v4);

  -[DSShareLocationController manageBoldButton](self, "manageBoldButton");
  DSUILocStringForKey(CFSTR("NOT_NOW"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSShareLocationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v5, v6, sel_pushNextPane);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setLinkButton:](self, "setLinkButton:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;

  -[OBTableWelcomeController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)manageBoldButton
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (-[DSShareLocationController selectedLocationSharingType](self, "selectedLocationSharingType") == 3)
  {
    v3 = 0;
  }
  else
  {
    -[DSShareLocationController selectedContact](self, "selectedContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  -[DSTableWelcomeController boldButton](self, "boldButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)shareLocation
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showsBusyIndicator");

  -[DSShareLocationController fmfSession](self, "fmfSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__DSShareLocationController_shareLocation__block_invoke;
  v5[3] = &unk_24EFF33F0;
  v5[4] = self;
  objc_msgSend(v4, "iCloudAccountNameWithCompletion:", v5);

}

void __42__DSShareLocationController_shareLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BE2FEB0], "handleWithId:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2278DF000, v5, OS_LOG_TYPE_INFO, "Error getting callerID.", buf, 2u);
    }
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "endDateFromNowForOfferTimespan:", objc_msgSend(*(id *)(a1 + 32), "selectedLocationSharingType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "bestDefaultContactProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fmfHandleFromContactProperty:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "fmfSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__DSShareLocationController_shareLocation__block_invoke_217;
  v13[3] = &unk_24EFF33C8;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", v11, 0, v4, v6, v13);

}

void __42__DSShareLocationController_shareLocation__block_invoke_217(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_ERROR))
      __42__DSShareLocationController_shareLocation__block_invoke_217_cold_1((uint64_t)v6, v7);
    v11 = MEMORY[0x24BDAC760];
    v8 = __42__DSShareLocationController_shareLocation__block_invoke_218;
    v9 = &v11;
  }
  else
  {
    v10 = MEMORY[0x24BDAC760];
    v8 = __42__DSShareLocationController_shareLocation__block_invoke_2;
    v9 = &v10;
  }
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v8;
  v9[3] = (uint64_t)&unk_24EFF33A0;
  v9[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __42__DSShareLocationController_shareLocation__block_invoke_218(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "boldButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hidesBusyIndicator");

  return objc_msgSend(*(id *)(a1 + 32), "presentSharingFailedAlert");
}

void __42__DSShareLocationController_shareLocation__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "boldButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hidesBusyIndicator");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushNextPane");

}

- (void)presentSharingFailedAlert
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  DSUILocStringForKey(CFSTR("LOCATION_SHARING_FAILED_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("LOCATION_SHARING_FAILED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__DSShareLocationController_presentSharingFailedAlert__block_invoke;
  v6[3] = &unk_24EFF3418;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__DSShareLocationController_presentSharingFailedAlert__block_invoke_2;
  v5[3] = &unk_24EFF3418;
  -[DSTableWelcomeController presentErrorAlertWithTitle:message:continueHandler:tryAgainHandler:](self, "presentErrorAlertWithTitle:message:continueHandler:tryAgainHandler:", v3, v4, v6, v5);

}

void __54__DSShareLocationController_presentSharingFailedAlert__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pushNextPane");

}

void __54__DSShareLocationController_presentSharingFailedAlert__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSelectedContact:", 0);
  objc_msgSend(*(id *)(a1 + 32), "manageBoldButton");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 3;
  else
    return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BEBD9F8]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = objc_msgSend(v5, "section");
  if (v8 == 1)
  {
    -[DSShareLocationController locationSharingTypeNames](self, "locationSharingTypeNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    objc_msgSend(v6, "setSelectionStyle:", 0);
    v20 = objc_msgSend(v5, "row");
    if (v20 == -[DSShareLocationController selectedLocationSharingType](self, "selectedLocationSharingType"))
      v21 = 3;
    else
      v21 = 0;
LABEL_10:
    objc_msgSend(v6, "setAccessoryType:", v21);
    goto LABEL_11;
  }
  if (!v8)
  {
    -[DSShareLocationController selectedContact](self, "selectedContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      DSUILocStringForKey(CFSTR("SHARE_CONTACT"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDBACC0];
      -[DSShareLocationController selectedContact](self, "selectedContact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromContact:style:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

    }
    else
    {
      DSUILocStringForKey(CFSTR("SHARE_CONTACT"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v11);
    }

    v21 = 1;
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;

  v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v7 = &stru_24EFF4790;
      goto LABEL_7;
    }
    v6 = CFSTR("SHARE_LOCATION_TYPE_FOOTER");
  }
  else
  {
    v6 = CFSTR("SHARE_LOCATION_CONTACT_FOOTER");
  }
  DSUILocStringForKey(v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_msgSend(v7, "section");
  if (v5 == 1)
  {
    -[DSShareLocationController setSelectedLocationSharingType:](self, "setSelectedLocationSharingType:", objc_msgSend(v7, "row"));
    -[DSShareLocationController manageBoldButton](self, "manageBoldButton");
    -[OBTableWelcomeController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
  else if (!v5)
  {
    -[DSShareLocationController pickContact](self, "pickContact");
  }

}

- (void)pickContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBACF8], "ds_meContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %@"), *MEMORY[0x24BDBA2E0], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSShareLocationController contactsViewController](self, "contactsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicateForEnablingContact:", v8);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSShareLocationController contactsViewController](self, "contactsViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicateForSelectionOfContact:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(property == 'emailAddresses') OR (property == 'phoneNumbers')"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSShareLocationController contactsViewController](self, "contactsViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicateForSelectionOfProperty:", v12);

  v14 = *MEMORY[0x24BDBA348];
  v19[0] = *MEMORY[0x24BDBA288];
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSShareLocationController contactsViewController](self, "contactsViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDisplayedPropertyKeys:", v15);

  -[DSShareLocationController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSShareLocationController contactsViewController](self, "contactsViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentViewController:animated:completion:", v18, 1, 0);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;

  objc_storeStrong((id *)&self->_selectedContact, a4);
  -[DSShareLocationController manageBoldButton](self, "manageBoldButton");
  -[DSShareLocationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (id)bestDefaultContactProperty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[DSShareLocationController selectedContact](self, "selectedContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    v10 = *MEMORY[0x24BDBA348];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x24BDBACD0];
        -[DSShareLocationController selectedContact](self, "selectedContact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contactPropertyWithContact:propertyKey:identifier:", v14, v10, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v16);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[DSShareLocationController selectedContact](self, "selectedContact", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emailAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    v22 = *MEMORY[0x24BDBA288];
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v23);
        v25 = (void *)MEMORY[0x24BDBACD0];
        -[DSShareLocationController selectedContact](self, "selectedContact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contactPropertyWithContact:propertyKey:identifier:", v26, v22, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v28);
        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x24BE19320], "bestPropertyComparator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", v29);

  objc_msgSend(v3, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)fmfHandlesFromContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v3, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15), "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unformattedInternationalStringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(MEMORY[0x24BE2FEB0], "handleWithId:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23), (_QWORD)v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  return v18;
}

- (id)fmfHandleFromContactProperty:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDBA348]);

  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unformattedInternationalStringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDBA288]);

    if (v9)
    {
      objc_msgSend(v3, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BE2FEB0], "handleWithId:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)endDateFromNowForOfferTimespan:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "nextDateAfterDate:matchingUnit:value:options:", v4, 32, 4, 1024);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 3600.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactPickerViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsViewController, a3);
}

- (NSArray)locationSharingTypeNames
{
  return self->_locationSharingTypeNames;
}

- (void)setLocationSharingTypeNames:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharingTypeNames, a3);
}

- (CNContact)selectedContact
{
  return self->_selectedContact;
}

- (void)setSelectedContact:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContact, a3);
}

- (int64_t)selectedLocationSharingType
{
  return self->_selectedLocationSharingType;
}

- (void)setSelectedLocationSharingType:(int64_t)a3
{
  self->_selectedLocationSharingType = a3;
}

- (FMFSession)fmfSession
{
  return self->_fmfSession;
}

- (void)setFmfSession:(id)a3
{
  objc_storeStrong((id *)&self->_fmfSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmfSession, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_locationSharingTypeNames, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__DSShareLocationController_shareLocation__block_invoke_217_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "Error offering location. Error - %@", (uint8_t *)&v2, 0xCu);
}

@end
