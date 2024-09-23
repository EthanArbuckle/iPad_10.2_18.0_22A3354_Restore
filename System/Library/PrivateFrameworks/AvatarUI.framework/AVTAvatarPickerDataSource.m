@implementation AVTAvatarPickerDataSource

- (AVTAvatarPickerDataSource)initWithRecordDataSource:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  id v9;
  id v10;
  AVTAvatarPickerDataSource *v11;
  AVTAvatarPickerDataSource *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarPickerDataSource;
  v11 = -[AVTAvatarPickerDataSource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordDataSource, a3);
    objc_storeStrong((id *)&v12->_environment, a4);
    v12->_allowAddItem = a5;
  }

  return v12;
}

- (AVTAvatarStore)store
{
  void *v2;
  void *v3;

  -[AVTAvatarPickerDataSource recordDataSource](self, "recordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTAvatarStore *)v3;
}

- (BOOL)canCreateMemoji
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AVTAvatarPickerDataSource allowAddItem](self, "allowAddItem");
  if (v3)
  {
    -[AVTAvatarPickerDataSource recordDataSource](self, "recordDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canCreateAvatar");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)reloadModel
{
  AVTCircularButton *v3;
  AVTCircularButton *v4;
  AVTAvatarListViewItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  AVTAvatarListRecordItem *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AVTAvatarPickerDataSource canCreateMemoji](self, "canCreateMemoji"))
  {
    v3 = [AVTCircularButton alloc];
    v4 = -[AVTCircularButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[AVTCircularButton setSymbolImageWithName:](v4, "setSymbolImageWithName:", CFSTR("plus"));
    v5 = -[AVTAvatarListViewItem initWithView:]([AVTAvatarListViewItem alloc], "initWithView:", v4);
    -[AVTAvatarPickerDataSource setAddItem:](self, "setAddItem:", v5);

    -[AVTAvatarPickerDataSource addItem](self, "addItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v6);

  }
  else
  {
    -[AVTAvatarPickerDataSource setAddItem:](self, "setAddItem:", 0);
  }
  -[AVTAvatarPickerDataSource recordDataSource](self, "recordDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[AVTAvatarPickerDataSource recordDataSource](self, "recordDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfRecords");

  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      -[AVTAvatarPickerDataSource recordDataSource](self, "recordDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = -[AVTAvatarListRecordItem initWithAvatar:]([AVTAvatarListRecordItem alloc], "initWithAvatar:", v12);
      objc_msgSend(v16, "addObject:", v13);

    }
  }
  objc_sync_exit(v7);

  -[AVTAvatarPickerDataSource items](self, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  v15 = (void *)objc_msgSend(v16, "copy");
  -[AVTAvatarPickerDataSource setItems:](self, "setItems:", v15);

  objc_sync_exit(v14);
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[AVTAvatarPickerDataSource items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)itemAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[AVTAvatarPickerDataSource items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[AVTAvatarPickerDataSource items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)isItemAtIndexAddItem:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[AVTAvatarPickerDataSource items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[AVTAvatarPickerDataSource itemAtIndex:](self, "itemAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarPickerDataSource addItem](self, "addItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 == v8;

  return v9;
}

- (int64_t)indexOfAddItem
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[AVTAvatarPickerDataSource addItem](self, "addItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[AVTAvatarPickerDataSource items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarPickerDataSource addItem](self, "addItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return v6;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)allowAddItem
{
  return self->_allowAddItem;
}

- (void)setAllowAddItem:(BOOL)a3
{
  self->_allowAddItem = a3;
}

- (AVTAvatarListItem)addItem
{
  return self->_addItem;
}

- (void)setAddItem:(id)a3
{
  objc_storeStrong((id *)&self->_addItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
