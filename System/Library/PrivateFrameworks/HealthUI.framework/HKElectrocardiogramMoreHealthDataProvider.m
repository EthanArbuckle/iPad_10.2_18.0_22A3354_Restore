@implementation HKElectrocardiogramMoreHealthDataProvider

- (HKElectrocardiogramMoreHealthDataProvider)init
{
  HKElectrocardiogramMoreHealthDataProvider *v2;
  uint64_t v3;
  NSMutableArray *dataSource;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKElectrocardiogramMoreHealthDataProvider;
  v2 = -[HKElectrocardiogramMoreHealthDataProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    dataSource = v2->_dataSource;
    v2->_dataSource = (NSMutableArray *)v3;

  }
  return v2;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramMoreHealthDataProvider removeItemWithIdentifier:](self, "removeItemWithIdentifier:", v5);

    -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

  }
}

- (void)removeItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_itemForIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

  }
}

- (id)cellForRow:(int64_t)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    -[HKElectrocardiogramMoreHealthDataProvider _sentinelCell](self, "_sentinelCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("MoreHealthReuseIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v6, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKElectrocardiogramMoreHealthDataProvider _defaultCellWithBackgroundColor:](self, "_defaultCellWithBackgroundColor:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKElectrocardiogramMoreHealthDataProvider _itemViewForRow:](self, "_itemViewForRow:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v11);

      -[HKElectrocardiogramMoreHealthDataProvider _configureLayoutForView:inCell:](self, "_configureLayoutForView:inCell:", v11, v9);
    }
  }

  return v9;
}

- (id)_itemViewForRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 10.0);

  objc_msgSend(v6, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

  return v6;
}

- (id)_defaultCellWithBackgroundColor:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3D50];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("MoreHealthReuseIdentifier"));
  objc_msgSend(v6, "setBackgroundColor:", v5);
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  -[HKElectrocardiogramMoreHealthDataProvider _offscreenInsets](self, "_offscreenInsets");
  objc_msgSend(v6, "setSeparatorInset:");
  return v6;
}

- (void)_configureLayoutForView:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  objc_msgSend(v7, "hk_alignHorizontalConstraintsWithView:margin:", v8, 0.0);

  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v7)
    v9 = 10.0;

  objc_msgSend(v6, "contentView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_alignVerticalConstraintsWithView:insets:", v13, v9, 0.0, 0.0, 0.0);
}

- (UIEdgeInsets)_offscreenInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.79769313e308;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (id)_sentinelCell
{
  return objc_alloc_init(MEMORY[0x1E0DC3D50]);
}

- (id)unitTesting_itemsForIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HKElectrocardiogramMoreHealthDataProvider dataSource](self, "dataSource");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v20 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v21;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
              objc_msgSend(v10, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v16) = objc_msgSend(v17, "isEqualToString:", v16);

              if ((_DWORD)v16)
                objc_msgSend(v6, "addObject:", v10);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  return v6;
}

- (NSMutableArray)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
