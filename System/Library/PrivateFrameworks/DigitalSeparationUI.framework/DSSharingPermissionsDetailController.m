@implementation DSSharingPermissionsDetailController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSharingByPersonDetail");
    v3 = (void *)DSLogSharingPermissionsDetail;
    DSLogSharingPermissionsDetail = (uint64_t)v2;

  }
}

+ (id)detailControllerWithPeople:(id)a3 startingViewController:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
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
  DSSharingPermissionsDetailController *v19;
  void *v20;
  DSSharingPermissionsDetailController *v21;
  id v23;

  v7 = a3;
  v23 = a5;
  v8 = a4;
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  DSUILocStringForKey(CFSTR("REVIEW_SHARING_WITH_FORMAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("SHARING_PERMISSION_DETAIL_TEXT_FORMAT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [DSSharingPermissionsDetailController alloc];
  objc_msgSend(v9, "iconForDetail");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](v19, "initWithTitle:detailText:icon:shouldShowSearchBar:", v14, v18, v20, 0);

  -[DSSharingPermissionsDetailController setSharingPerson:](v21, "setSharingPerson:", v9);
  -[DSSharingPermissionsDetailController setRemainingPeople:](v21, "setRemainingPeople:", v10);
  -[DSSharingPermissionsDetailController setStartingViewController:](v21, "setStartingViewController:", v8);

  -[DSSharingPermissionsDetailController setDelegate:](v21, "setDelegate:", v23);
  return v21;
}

+ (id)detailControllerWithSharingTypes:(id)a3 startingViewController:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DSSharingPermissionsDetailController *v17;
  void *v18;
  DSSharingPermissionsDetailController *v19;
  void *v20;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)MEMORY[0x24BE2CC80];
  objc_msgSend(v10, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sourceDescriptorForSource:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "localizedStopByTypeSubtitleForSharingType:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [DSSharingPermissionsDetailController alloc];
  objc_msgSend(v10, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](v17, "initWithTitle:detailText:icon:shouldShowSearchBar:", v18, v16, 0, 0);

  objc_msgSend(v10, "iconForDetail");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController addBorderedIcon:](v19, "addBorderedIcon:", v20);

  -[DSSharingPermissionsDetailController setSharingType:](v19, "setSharingType:", v10);
  -[DSSharingPermissionsDetailController setRemainingSharingTypes:](v19, "setRemainingSharingTypes:", v11);
  -[DSSharingPermissionsDetailController setStartingViewController:](v19, "setStartingViewController:", v9);

  -[DSSharingPermissionsDetailController setDelegate:](v19, "setDelegate:", v8);
  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DSSharingPermissionsDetailController;
  -[DSTableWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  -[DSSharingPermissionsDetailController reloadTableViewData](self, "reloadTableViewData");
  DSUILocStringForKey(CFSTR("SKIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, self, sel_next);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v4);

  DSUILocStringForKey(CFSTR("STOP_ALL_SHARING"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v5, self, sel_stopAllSharing);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setLinkButton:](self, "setLinkButton:", v6);

}

- (void)reloadTableViewData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedSourceNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController setSortedSourceNames:](self, "setSortedSourceNames:", v4);

  -[DSSharingPermissionsDetailController sharingType](self, "sharingType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController setSortedPeople:](self, "setSortedPeople:", v6);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
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
  DSIconTableViewCell *v14;
  DSIconTableViewCell *v15;

  v5 = a4;
  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DSSharingPermissionsDetailController sourceNameForIndexPath:](self, "sourceNameForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE2CC80], "sourceDescriptorForSource:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStopByPerson:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[OBTableWelcomeController tableView](self, "tableView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "iconForTable");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v11, v12, v10, v13);
        v14 = (DSIconTableViewCell *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      goto LABEL_9;
    }
  }
  else
  {
    -[DSSharingPermissionsDetailController personForIndexPath:](self, "personForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v15 = [DSIconTableViewCell alloc];
      objc_msgSend(v7, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iconForTable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[DSIconTableViewCell initWithRightAlignedLabel:detail:icon:](v15, "initWithRightAlignedLabel:detail:icon:", v8, &stru_24EFF4790, v10);
LABEL_9:

      -[DSIconTableViewCell setAccessoryType:](v14, "setAccessoryType:", 0);
      return v14;
    }
  }
  v14 = 0;
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;

  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[DSSharingPermissionsDetailController sortedSourceNames](self, "sortedSourceNames");
  else
    -[DSSharingPermissionsDetailController sortedPeople](self, "sortedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 0)
  {
    v8 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissionsDetailController tableView:numberOfRowsInSection:].cold.1(v8);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (id)sourceNameForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "row") < 0
    || (v5 = objc_msgSend(v4, "row"),
        -[DSSharingPermissionsDetailController sortedSourceNames](self, "sortedSourceNames"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 >= v7))
  {
    v11 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissionsDetailController sourceNameForIndexPath:].cold.1((uint64_t)v4, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "row");
    -[DSSharingPermissionsDetailController sortedSourceNames](self, "sortedSourceNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)personForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "row") < 0
    || (v5 = objc_msgSend(v4, "row"),
        -[DSSharingPermissionsDetailController sortedPeople](self, "sortedPeople"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 >= v7))
  {
    v11 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissionsDetailController personForIndexPath:].cold.1((uint64_t)v4, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "row");
    -[DSSharingPermissionsDetailController sortedPeople](self, "sortedPeople");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)stopAllSharing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[2];
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[DSSharingPermissionsDetailController sortedSourceNames](self, "sortedSourceNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v3, "copy");

  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "termsOfAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    DSUILocStringForKey(CFSTR("STOP_ALL_SHARING_BY_PEOPLE_ALERT_LABEL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BDD1458]);
    DSUILocAttributedStringForKey(CFSTR("STOP_ALL_SHARING_BY_PEOPLE_ALERT_DETAIL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDD0DE8];
    v40 = *MEMORY[0x24BDD0DE8];
    v39 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithFormat:options:locale:context:", v11, 0, 0, v14, v6, v6, v6);

    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "containsObject:", *MEMORY[0x24BE2CC28]))
    {
      v17 = objc_alloc(MEMORY[0x24BDD1458]);
      DSUILocAttributedStringForKey(CFSTR("FIND_MY_NOTIFICATION_WARNING_SPECIFIC"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v8;
      v37 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v17, "initWithFormat:options:locale:context:", v18, 0, 0, v20, v6);

      v35[0] = v16;
      objc_msgSend(v21, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" "));
      v24 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v24;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x24BE2CC80];
    -[DSSharingPermissionsDetailController sharingType](self, "sharingType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "source");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sourceDescriptorForSource:", v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "localizedStopAllAlertLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "supportsResourceTypes"))
    {
      objc_msgSend(v6, "localizedStopAllAlertDetail");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[DSSharingPermissionsDetailController sharingType](self, "sharingType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allPeople");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStopAllAlertDetailForPeople:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[DSSharingPermissionsDetailController sortedPeople](self, "sortedPeople");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __54__DSSharingPermissionsDetailController_stopAllSharing__block_invoke;
  v32[3] = &unk_24EFF3670;
  objc_copyWeak(&v33, &location);
  -[DSSharingPermissionsDetailController stopSharingSources:people:alertLabel:alertDetail:completion:](self, "stopSharingSources:people:alertLabel:alertDetail:completion:", v31, v30, v9, v16, v32);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __54__DSSharingPermissionsDetailController_stopAllSharing__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadTableViewData");
  objc_msgSend(WeakRetained, "next");

}

- (id)alertTextForSources:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = *MEMORY[0x24BE2CC30];
  v6 = objc_msgSend(v4, "containsObject:", *MEMORY[0x24BE2CC30]);
  v7 = *MEMORY[0x24BE2CC28];
  if (!v6 || !objc_msgSend(v4, "containsObject:", *MEMORY[0x24BE2CC28]))
  {
    if (objc_msgSend(v4, "containsObject:", v7))
    {
      v15 = (void *)MEMORY[0x24BE2CC80];
      v16 = v7;
    }
    else
    {
      v17 = objc_msgSend(v4, "containsObject:", v5);
      v18 = (void *)MEMORY[0x24BE2CC80];
      if (!v17)
      {
        objc_msgSend(v4, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sourceDescriptorForSource:", v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      v15 = (void *)MEMORY[0x24BE2CC80];
      v16 = v5;
    }
    objc_msgSend(v15, "sourceDescriptorForSource:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedAlertTextForPerson:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  DSUILocStringForKey(CFSTR("HEALTH_AND_FIND_MY_COMBO_STOP_BY_PERSON_ALERT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v8, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v14;
}

- (void)stopSelectedSharing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v33 = 0uLL;
    v34 = 0uLL;
    v31 = 0uLL;
    v32 = 0uLL;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          -[DSSharingPermissionsDetailController sourceNameForIndexPath:](self, "sourceNameForIndexPath:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    -[DSSharingPermissionsDetailController alertTextForSources:](self, "alertTextForSources:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("STOP_SHARING_MULTIPLE_BY_PERSON_ALERT_LABEL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0uLL;
    v30 = 0uLL;
    v27 = 0uLL;
    v28 = 0uLL;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v15);
          -[DSSharingPermissionsDetailController personForIndexPath:](self, "personForIndexPath:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v6, "addObject:", v19);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

    -[DSSharingPermissionsDetailController sharingType](self, "sharingType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "source");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2CC80], "sourceDescriptorForSource:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedAlertDetailForSelectedPeople:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedAlertButtonLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __59__DSSharingPermissionsDetailController_stopSelectedSharing__block_invoke;
  v24[3] = &unk_24EFF3670;
  objc_copyWeak(&v25, &location);
  -[DSSharingPermissionsDetailController stopSharingSources:people:alertLabel:alertDetail:completion:](self, "stopSharingSources:people:alertLabel:alertDetail:completion:", v5, v6, v14, v13, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __59__DSSharingPermissionsDetailController_stopSelectedSharing__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(WeakRetained, "tableView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(WeakRetained, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(WeakRetained, "_updateButton");
  objc_msgSend(WeakRetained, "reloadTableViewData");
  objc_msgSend(WeakRetained, "next");

}

- (void)sharingStoppedForPerson:(id)a3 sourceNames:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DSSharingPermissionsDetailController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_error_impl(&dword_2278DF000, v13, OS_LOG_TYPE_ERROR, "Failed to stop sharing %{public}@ from %{public}@ because %{public}@", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(v12, "stopSharingFailedWithError:", v10);
  }
  else
  {
    objc_msgSend(v11, "sharingStoppedForPerson:sourceNames:", v8, v9);
  }

}

- (void)sharingStoppedForType:(id)a3 people:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DSSharingPermissionsDetailController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = (void *)DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      objc_msgSend(v8, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v15;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_2278DF000, v14, OS_LOG_TYPE_ERROR, "Failed to stop sharing %{public}@ with %{public}@ because %{public}@", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(v12, "stopSharingFailedWithError:", v10);
  }
  else
  {
    objc_msgSend(v11, "sharingStoppedForType:people:", v8, v9);
  }

}

- (void)stopSharingSources:(id)a3 people:(id)a4 alertLabel:(id)a5 alertDetail:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v29 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v31 = a5;
  -[DSSharingPermissionsDetailController sharingPerson](self, "sharingPerson");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController sharingType](self, "sharingType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, v14, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, &__block_literal_global_1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BEBD3A8];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_2;
  v32[3] = &unk_24EFF36E0;
  v32[4] = self;
  v33 = v15;
  v37 = v12;
  v38 = v13;
  v34 = v29;
  v35 = v17;
  v36 = v16;
  v30 = v12;
  v23 = v16;
  v24 = v17;
  v25 = v13;
  v26 = v29;
  v27 = v15;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v31, 2, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v28);
  objc_msgSend(v18, "addAction:", v21);
  -[DSSharingPermissionsDetailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

}

void __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id *v31;
  id *v32;
  id *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsBusy");

  if (a1[5])
  {
    v3 = objc_msgSend(a1[6], "count");
    objc_msgSend(a1[5], "sortedSourceNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    v6 = a1[5];
    if (v3 == v5)
    {
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_3;
      v51[3] = &unk_24EFF36B8;
      v7 = a1[5];
      v51[4] = a1[4];
      v52 = v7;
      v53 = a1[6];
      v54 = a1[10];
      objc_msgSend(v6, "stopAllSharingOnQueue:completion:", MEMORY[0x24BDAC9B8], v51);

      v8 = v52;
    }
    else
    {
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_4;
      v47[3] = &unk_24EFF36B8;
      v25 = a1[5];
      v26 = a1[6];
      v47[4] = a1[4];
      v48 = v25;
      v49 = a1[6];
      v50 = a1[10];
      objc_msgSend(v6, "stopSharingSourceNames:queue:completion:", v26, MEMORY[0x24BDAC9B8], v47);

      v8 = v48;
    }

  }
  else
  {
    objc_msgSend(a1[7], "permissions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allPublicSharingTypes");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x24BDBD1A8];
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v18), "source");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[8], "source");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v20, "isEqualToString:", v22);

          if ((v23 & 1) != 0)
          {
            v24 = 1;
            goto LABEL_18;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v16)
          continue;
        break;
      }
    }
    v24 = 0;
LABEL_18:

    v27 = objc_msgSend(a1[9], "count");
    objc_msgSend(a1[8], "sortedPeople");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    v30 = a1[8];
    if ((v24 & 1) != 0 || v27 != v29)
    {
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_6;
      v35[3] = &unk_24EFF36B8;
      v35[4] = a1[4];
      v31 = &v36;
      v34 = a1[9];
      v36 = a1[8];
      v32 = &v37;
      v37 = a1[9];
      v33 = &v38;
      v38 = a1[10];
      objc_msgSend(v30, "stopSharingPeople:queue:completion:", v34, MEMORY[0x24BDAC9B8], v35);
    }
    else
    {
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_5;
      v39[3] = &unk_24EFF36B8;
      v39[4] = a1[4];
      v31 = &v40;
      v40 = a1[8];
      v32 = &v41;
      v41 = a1[9];
      v33 = &v42;
      v42 = a1[10];
      objc_msgSend(v30, "stopAllSharingOnQueue:completion:", MEMORY[0x24BDAC9B8], v39);
    }

  }
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "sharingStoppedForPerson:sourceNames:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showButtonsAvailable");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "sharingStoppedForPerson:sourceNames:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showButtonsAvailable");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "sharingStoppedForType:people:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showButtonsAvailable");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "sharingStoppedForType:people:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showButtonsAvailable");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)next
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[DSSharingPermissionsDetailController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsDetailController remainingPeople](self, "remainingPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[DSSharingPermissionsDetailController remainingPeople](self, "remainingPeople");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsDetailController startingViewController](self, "startingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSSharingPermissionsDetailController detailControllerWithPeople:startingViewController:delegate:](DSSharingPermissionsDetailController, "detailControllerWithPeople:startingViewController:delegate:", v5, v6, v12);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DSSharingPermissionsDetailController remainingSharingTypes](self, "remainingSharingTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
LABEL_7:
      objc_msgSend(v12, "reviewSelectedSharingFlowCompleted");
      goto LABEL_8;
    }
    -[DSSharingPermissionsDetailController remainingSharingTypes](self, "remainingSharingTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsDetailController startingViewController](self, "startingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSSharingPermissionsDetailController detailControllerWithSharingTypes:startingViewController:delegate:](DSSharingPermissionsDetailController, "detailControllerWithSharingTypes:startingViewController:delegate:", v5, v6, v12);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  if (!v10)
    goto LABEL_7;
  -[DSSharingPermissionsDetailController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v10, 1);

LABEL_8:
}

- (void)_updateButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  char **v9;
  void *v10;
  id v11;

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = CFSTR("STOP_SHARING");
  else
    v8 = CFSTR("SKIP");
  if (v6)
    v9 = &selRef_stopSelectedSharing;
  else
    v9 = &selRef_next;
  DSUILocStringForKey(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v10, 0);

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, *v9, 64);

}

- (DSSharingPerson)sharingPerson
{
  return self->_sharingPerson;
}

- (void)setSharingPerson:(id)a3
{
  objc_storeStrong((id *)&self->_sharingPerson, a3);
}

- (NSArray)remainingPeople
{
  return self->_remainingPeople;
}

- (void)setRemainingPeople:(id)a3
{
  objc_storeStrong((id *)&self->_remainingPeople, a3);
}

- (DSSharingType)sharingType
{
  return self->_sharingType;
}

- (void)setSharingType:(id)a3
{
  objc_storeStrong((id *)&self->_sharingType, a3);
}

- (NSArray)remainingSharingTypes
{
  return self->_remainingSharingTypes;
}

- (void)setRemainingSharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_remainingSharingTypes, a3);
}

- (NSArray)sortedSourceNames
{
  return self->_sortedSourceNames;
}

- (void)setSortedSourceNames:(id)a3
{
  objc_storeStrong((id *)&self->_sortedSourceNames, a3);
}

- (NSArray)sortedPeople
{
  return self->_sortedPeople;
}

- (void)setSortedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_sortedPeople, a3);
}

- (UIViewController)startingViewController
{
  return self->_startingViewController;
}

- (void)setStartingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_startingViewController, a3);
}

- (DSSharingPermissionsDetailDelegate)delegate
{
  return (DSSharingPermissionsDetailDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startingViewController, 0);
  objc_storeStrong((id *)&self->_sortedPeople, 0);
  objc_storeStrong((id *)&self->_sortedSourceNames, 0);
  objc_storeStrong((id *)&self->_remainingSharingTypes, 0);
  objc_storeStrong((id *)&self->_sharingType, 0);
  objc_storeStrong((id *)&self->_remainingPeople, 0);
  objc_storeStrong((id *)&self->_sharingPerson, 0);
}

- (void)tableView:(os_log_t)log numberOfRowsInSection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2278DF000, log, OS_LOG_TYPE_FAULT, "Too many sources to count", v1, 2u);
}

- (void)sourceNameForIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2278DF000, a2, a3, "Failed to find a source for index path %{public}@", a5, a6, a7, a8, 2u);
}

- (void)personForIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2278DF000, a2, a3, "Failed to find a person for index path %{public}@", a5, a6, a7, a8, 2u);
}

@end
