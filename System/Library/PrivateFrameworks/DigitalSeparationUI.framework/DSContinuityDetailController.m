@implementation DSContinuityDetailController

- (DSContinuityDetailController)initWithContinuityDevice:(id)a3 detailText:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  DSContinuityDetailController *v11;
  NSMutableArray *v12;
  NSMutableArray *orderedCells;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)DSContinuityDetailController;
  v11 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v35, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v9, v8, v10, 0);

  if (!v11)
    goto LABEL_10;
  objc_storeStrong((id *)&v11->_continuityDevice, a3);
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  orderedCells = v11->_orderedCells;
  v11->_orderedCells = v12;

  objc_msgSend(v7, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_5:
    v16 = v11->_orderedCells;
    DSUILocStringForKey(CFSTR("CONTINUITY_DEVICE_MODEL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityDetailController marketingNameForDevice:](v11, "marketingNameForDevice:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityDetailController cellWithText:secondaryText:](v11, "cellWithText:secondaryText:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v16, "addObject:", v20);

    goto LABEL_6;
  }
  objc_msgSend(v7, "marketingName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v7, "serialNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = v11->_orderedCells;
    DSUILocStringForKey(CFSTR("CONTINUITY_DEVICE_SERIAL_NUMBER"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityDetailController cellWithText:secondaryText:](v11, "cellWithText:secondaryText:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v22, "addObject:", v26);

  }
  objc_msgSend(v7, "initialDiscoveryDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v11->_orderedCells;
    DSUILocStringForKey(CFSTR("CONTINUITY_TIME_PAIRED_2"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initialDiscoveryDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityDetailController stringFromDate:](v11, "stringFromDate:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityDetailController cellWithText:secondaryText:](v11, "cellWithText:secondaryText:", v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v28, "addObject:", v33);

  }
LABEL_10:

  return v11;
}

- (id)cellWithText:(id)a3 secondaryText:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BEBD9F8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
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
  if (v5)
    objc_msgSend(v9, "setSecondaryText:", v5);
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
  v8.super_class = (Class)DSContinuityDetailController;
  -[DSTableWelcomeController viewDidLoad](&v8, sel_viewDidLoad);
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsSelection:", 0);

  DSUILocStringForKey(CFSTR("CONTINUITY_STOP"));
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

  -[DSContinuityDetailController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSContinuityDetailController continuityDevice](self, "continuityDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnFromDetailAndRemoveDevice:", v3);

}

- (id)stringFromDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setTimeStyle:", 1);
  objc_msgSend(v5, "setDateStyle:", 1);
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)marketingNameForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "marketingName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "marketingName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE50880];
    objc_msgSend(v3, "model");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "marketingNameForModel:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)v7;
  }

  return v5;
}

- (void)back
{
  id v2;
  id v3;

  -[DSContinuityDetailController navigationController](self, "navigationController");
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
  -[DSContinuityDetailController orderedCells](self, "orderedCells");
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

  -[DSContinuityDetailController orderedCells](self, "orderedCells", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (DSContinuityDelegate)delegate
{
  return (DSContinuityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSContinuityDevice)continuityDevice
{
  return self->_continuityDevice;
}

- (void)setContinuityDevice:(id)a3
{
  objc_storeStrong((id *)&self->_continuityDevice, a3);
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
  objc_storeStrong((id *)&self->_continuityDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
