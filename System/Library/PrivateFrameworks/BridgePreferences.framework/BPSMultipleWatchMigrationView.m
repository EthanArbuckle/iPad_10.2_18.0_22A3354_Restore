@implementation BPSMultipleWatchMigrationView

- (BPSMultipleWatchMigrationView)initWithFrame:(CGRect)a3 andStyle:(unint64_t)a4
{
  BPSMultipleWatchMigrationView *v5;
  BPSMultipleWatchMigrationView *v6;
  BPSMultipleWatchMigrationPickerTableView *v7;
  uint64_t v8;
  BPSMultipleWatchMigrationPickerTableView *devicesTable;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BPSMultipleWatchMigrationView;
  v5 = -[BPSMultipleWatchMigrationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = [BPSMultipleWatchMigrationPickerTableView alloc];
    v8 = -[BPSMultipleWatchMigrationPickerTableView initWithFrame:style:](v7, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    devicesTable = v6->_devicesTable;
    v6->_devicesTable = (BPSMultipleWatchMigrationPickerTableView *)v8;

    -[BPSMultipleWatchMigrationPickerTableView setAlwaysBounceVertical:](v6->_devicesTable, "setAlwaysBounceVertical:", 0);
    -[BPSMultipleWatchMigrationPickerTableView registerClass:forCellReuseIdentifier:](v6->_devicesTable, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("COSMultipleWatchViewCellID"));
    -[BPSMultipleWatchMigrationPickerTableView setAutoresizingMask:](v6->_devicesTable, "setAutoresizingMask:", 18);
    -[BPSMultipleWatchMigrationPickerTableView setDelegate:](v6->_devicesTable, "setDelegate:", v6);
    -[BPSMultipleWatchMigrationPickerTableView setDataSource:](v6->_devicesTable, "setDataSource:", v6);
    -[BPSMultipleWatchMigrationView addSubview:](v6, "addSubview:", v6->_devicesTable);
  }
  return v6;
}

- (void)layoutSubviews
{
  -[BPSMultipleWatchMigrationView bounds](self, "bounds");
  -[BPSMultipleWatchMigrationPickerTableView setFrame:](self->_devicesTable, "setFrame:");
}

- (void)setMigratableDevices:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *selectedStates;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_migratableDevices, a3);
  v5 = -[NSArray count](self->_migratableDevices, "count");
  v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v5);
  selectedStates = self->_selectedStates;
  self->_selectedStates = v6;

  if (v5 >= 1)
  {
    v8 = 0;
    v9 = MEMORY[0x24BDBD1C8];
    do
    {
      v10 = self->_selectedStates;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v11);

      ++v8;
    }
    while (v5 != v8);
  }
  -[BPSMultipleWatchMigrationPickerTableView reloadData](self->_devicesTable, "reloadData");

}

- (double)tableHeight
{
  return 80.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat Width;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  Width = CGRectGetWidth(v22);
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (double)objc_msgSend(v15, "maxPairedDeviceCount");
  -[BPSMultipleWatchMigrationView tableHeight](self, "tableHeight");
  v18 = v17 * v16;

  v19 = Width;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *selectedStates;
  void *v9;
  void *v10;
  int v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  selectedStates = self->_selectedStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](selectedStates, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = self->_selectedStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11 ^ 1u);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v14);

  v16[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 5);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_migratableDevices, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BPSMultipleWatchMigrationView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *selectedStates;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("COSMultipleWatchViewCellID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  -[NSArray objectAtIndex:](self->_migratableDevices, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B2E0]);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B398]);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v11;
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B300]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  BPSLocalizedShortEdition(objc_msgSend(MEMORY[0x24BE6E4A0], "materialFromDevice:", v9), objc_msgSend(v29, "integerValue"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v13;
  BPSShortLocalizedVariantSizeForProductType(v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (objc_msgSend(v14, "length"))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BIXBY_SIZE_EDITION_FORMATTER_%@_%@"), &stru_24CBE59D0, CFSTR("Localizable"));
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v20, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    self = v19;
  }
  objc_msgSend(v7, "deviceDetailLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v16);

  objc_msgSend(v7, "watchView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAdvertisingName:", v10);

  objc_msgSend(v7, "checkmarkView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  selectedStates = self->_selectedStates;
  v25 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "row"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](selectedStates, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIsChecked:", objc_msgSend(v27, "BOOLValue"));

  return v7;
}

- (id)selectedMigrationDevices
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_selectedStates, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_selectedStates, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if (v11)
        {
          -[NSArray objectAtIndexedSubscript:](self->_migratableDevices, "objectAtIndexedSubscript:", objc_msgSend(v9, "integerValue"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)migratableDevices
{
  return self->_migratableDevices;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BPSMultipleWatchMigrationPickerTableView)devicesTable
{
  return self->_devicesTable;
}

- (void)setDevicesTable:(id)a3
{
  objc_storeStrong((id *)&self->_devicesTable, a3);
}

- (NSMutableDictionary)selectedStates
{
  return self->_selectedStates;
}

- (void)setSelectedStates:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedStates, 0);
  objc_storeStrong((id *)&self->_devicesTable, 0);
  objc_storeStrong((id *)&self->_migratableDevices, 0);
}

@end
