@implementation DSWifiSyncDetailController

- (DSWifiSyncDetailController)initWithPairedComputer:(id)a3
{
  id v5;
  void *v6;
  DSWifiSyncDetailController *v7;
  NSMutableArray *v8;
  NSMutableArray *orderedCells;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v5 = a3;
  objc_msgSend(v5, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)DSWifiSyncDetailController;
  v7 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v29, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v6, &stru_24EFF4790, 0, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_pairedComputer, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    orderedCells = v7->_orderedCells;
    v7->_orderedCells = v8;

    objc_msgSend(v5, "marketingName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v7->_orderedCells;
      DSUILocStringForKey(CFSTR("WIFI_SYNC_DEVICE_MODEL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "marketingName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSWifiSyncDetailController cellWithText:secondaryText:](v7, "cellWithText:secondaryText:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v11, "addObject:", v15);

    }
    objc_msgSend(v5, "serialNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v7->_orderedCells;
      DSUILocStringForKey(CFSTR("WIFI_SYNC_DEVICE_SERIAL_NUMBER"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serialNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSWifiSyncDetailController cellWithText:secondaryText:](v7, "cellWithText:secondaryText:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v17, "addObject:", v21);

    }
    objc_msgSend(v5, "datePaired");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = v7->_orderedCells;
      DSUILocStringForKey(CFSTR("WIFI_SYNC_TIME_SYNCED_2"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSWifiSyncDetailController dateDescription](v7, "dateDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSWifiSyncDetailController cellWithText:secondaryText:](v7, "cellWithText:secondaryText:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v23, "addObject:", v27);

    }
  }

  return v7;
}

- (id)cellWithText:(id)a3 secondaryText:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x24BEBD9F8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BEBD728], "valueCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessoryType:", 0);
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_msgSend(v9, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  objc_msgSend(v9, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineBreakMode:", 0);

  objc_msgSend(v9, "setText:", v7);
  objc_msgSend(v9, "setSecondaryText:", v6);

  objc_msgSend(v8, "setContentConfiguration:", v9);
  return v8;
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
  v8.super_class = (Class)DSWifiSyncDetailController;
  -[DSTableWelcomeController viewDidLoad](&v8, sel_viewDidLoad);
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsSelection:", 0);

  DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v6, self, sel_returnFromDetailAndRemoveComputer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v7);

}

- (void)returnFromDetailAndRemoveComputer
{
  void *v3;
  id v4;

  -[DSWifiSyncDetailController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSWifiSyncDetailController pairedComputer](self, "pairedComputer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnFromDetailAndRemoveComputer:", v3);

}

- (id)dateDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setTimeStyle:", 1);
  objc_msgSend(v3, "setDateStyle:", 1);
  -[DSPairedComputer datePaired](self->_pairedComputer, "datePaired");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)back
{
  id v2;
  id v3;

  -[DSWifiSyncDetailController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  -[DSWifiSyncDetailController orderedCells](self, "orderedCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[DSWifiSyncDetailController orderedCells](self, "orderedCells", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (DSWifiSyncDelegate)delegate
{
  return (DSWifiSyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSPairedComputer)pairedComputer
{
  return self->_pairedComputer;
}

- (void)setPairedComputer:(id)a3
{
  objc_storeStrong((id *)&self->_pairedComputer, a3);
}

- (NSMutableArray)orderedCells
{
  return self->_orderedCells;
}

- (void)setOrderedCells:(id)a3
{
  objc_storeStrong((id *)&self->_orderedCells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedCells, 0);
  objc_storeStrong((id *)&self->_pairedComputer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
