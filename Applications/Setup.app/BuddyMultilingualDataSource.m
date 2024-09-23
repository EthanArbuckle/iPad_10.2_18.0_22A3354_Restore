@implementation BuddyMultilingualDataSource

- (BuddyMultilingualDataSource)initWithBackingStore:(id)a3 actionText:(id)a4
{
  id v5;
  BuddyMultilingualDataSource *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t i;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t j;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  BuddyMultilingualDataSource *v27;
  uint64_t v29;
  id v30;
  _QWORD v31[8];
  id v32;
  _QWORD __b[8];
  id v34;
  objc_super v35;
  id v36;
  id location[2];
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v5 = v38;
  v38 = 0;
  v35.receiver = v5;
  v35.super_class = (Class)BuddyMultilingualDataSource;
  v6 = -[BuddyMultilingualDataSource init](&v35, "init");
  v38 = v6;
  objc_storeStrong(&v38, v6);
  if (v6)
  {
    *((CGFloat *)v38 + 5) = UITableViewAutomaticDimension;
    v7 = objc_alloc((Class)NSMutableArray);
    v8 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(location[0], "count"));
    v9 = (void *)*((_QWORD *)v38 + 2);
    *((_QWORD *)v38 + 2) = v8;

    v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v11 = (void *)*((_QWORD *)v38 + 4);
    *((_QWORD *)v38 + 4) = v10;

    v12 = objc_msgSend(v36, "copy");
    v13 = (void *)*((_QWORD *)v38 + 3);
    *((_QWORD *)v38 + 3) = v12;

    *((_BYTE *)v38 + 8) = 1;
    *((_BYTE *)v38 + 9) = 0;
    memset(__b, 0, sizeof(__b));
    v14 = location[0];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
    if (v15)
    {
      v16 = *(_QWORD *)__b[2];
      v30 = v14;
      v29 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v15; ++i)
        {
          if (*(_QWORD *)__b[2] != v16)
            objc_enumerationMutation(v14);
          v34 = *(id *)(__b[1] + 8 * i);
          memset(v31, 0, sizeof(v31));
          v18 = v34;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v31, v39, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v31[2];
            do
            {
              for (j = 0; j < (unint64_t)v19; ++j)
              {
                if (*(_QWORD *)v31[2] != v20)
                  objc_enumerationMutation(v18);
                v32 = *(id *)(v31[1] + 8 * j);
                v22 = (void *)*((_QWORD *)v38 + 4);
                v23 = objc_msgSend(v32, "identifier");
                v24 = objc_msgSend(v32, "identifier");
                objc_msgSend(v22, "setObject:forKey:", v23, v24);

                if ((objc_msgSend(v32, "showDetailText") & 1) != 0)
                  *((_BYTE *)v38 + 9) = 1;
              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v31, v39, 16);
            }
            while (v19);
            v14 = v30;
            v16 = v29;
          }

          v25 = (void *)*((_QWORD *)v38 + 2);
          v26 = objc_msgSend(v34, "mutableCopy");
          objc_msgSend(v25, "addObject:", v26);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
      }
      while (v15);
    }

  }
  v27 = (BuddyMultilingualDataSource *)v38;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v38, 0);
  return v27;
}

- (void)tableView:(id)a3 setBackingStore:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t j;
  NSMutableDictionary *fastIdentifierMap;
  id v15;
  id v16;
  NSMutableArray *backingStore;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[8];
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  id location[2];
  BuddyMultilingualDataSource *v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  -[NSMutableArray removeAllObjects](v27->_backingStore, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v27->_fastIdentifierMap, "removeAllObjects");
  memset(__b, 0, sizeof(__b));
  v6 = v25;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)__b[2];
    v20 = v6;
    v19 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(v6);
        v24 = *(id *)(__b[1] + 8 * i);
        memset(v21, 0, sizeof(v21));
        v10 = v24;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v21, v28, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v21[2];
          do
          {
            for (j = 0; j < (unint64_t)v11; ++j)
            {
              if (*(_QWORD *)v21[2] != v12)
                objc_enumerationMutation(v10);
              v22 = *(id *)(v21[1] + 8 * j);
              fastIdentifierMap = v27->_fastIdentifierMap;
              v15 = objc_msgSend(v22, "identifier");
              v16 = objc_msgSend(v22, "identifier");
              -[NSMutableDictionary setObject:forKey:](fastIdentifierMap, "setObject:forKey:", v15, v16);

              if ((objc_msgSend(v22, "showDetailText") & 1) != 0)
                v27->_dataHasDetailedLabelField = 1;
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v21, v28, 16);
          }
          while (v11);
          v6 = v20;
          v8 = v19;
        }

        backingStore = v27->_backingStore;
        v18 = objc_msgSend(v24, "mutableCopy");
        -[NSMutableArray addObject:](backingStore, "addObject:", v18);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(location[0], "reloadData");
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  UIColor *v15;
  id v17;
  id v18;
  int v19;
  id v20;
  id location[2];
  BuddyMultilingualDataSource *v22;
  id v23;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v5 = objc_msgSend(v20, "row");
  v6 = -[BuddyMultilingualDataSource backingStore](v22, "backingStore");
  v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", objc_msgSend(v20, "section"));
  v8 = objc_msgSend(v7, "count");

  if (v5 == v8)
  {
    v23 = -[BuddyMultilingualDataSource addToCollectionCellWithTableView:](v22, "addToCollectionCellWithTableView:", location[0]);
    v19 = 1;
  }
  else
  {
    v18 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("com.purpleBuddy.BuddyMultilingualCell"));
    if (!v18)
    {
      v18 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("com.purpleBuddy.BuddyMultilingualCell"));

    }
    v9 = -[BuddyMultilingualDataSource backingStore](v22, "backingStore");
    v10 = -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", objc_msgSend(v20, "section"));
    v17 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v20, "row"));

    if (!objc_msgSend(v20, "row"))
      -[BuddyMultilingualDataSource _sizeConsistentRowHeight](v22, "_sizeConsistentRowHeight");
    v11 = objc_msgSend(v17, "title", v17);
    v12 = objc_msgSend(v18, "textLabel");
    objc_msgSend(v12, "setText:", v11);

    v13 = objc_msgSend(v17, "detailText");
    v14 = objc_msgSend(v18, "detailTextLabel");
    objc_msgSend(v14, "setText:", v13);

    objc_msgSend(v18, "setSelectionStyle:", 0);
    v15 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
    objc_msgSend(v18, "setBackgroundColor:", v15);

    v23 = v18;
    v19 = 1;
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23;
}

- (id)addToCollectionCellWithTableView:(id)a3
{
  NSString *v3;
  id v4;
  UIColor *v5;
  id v6;
  uint64_t v7;
  UIColor *v8;
  id v9;
  char v11;
  UIColor *v12;
  char v13;
  UIColor *v14;
  id v15;
  id location[2];
  BuddyMultilingualDataSource *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("com.purpleBuddy.BuddyMultilingual.dataAdditionCell"));
  if (!v15)
  {
    v15 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("com.purpleBuddy.BuddyMultilingual.dataAdditionCell"));

  }
  v3 = -[BuddyMultilingualDataSource actionString](v17, "actionString");
  v4 = objc_msgSend(v15, "textLabel");
  objc_msgSend(v4, "setText:", v3);

  v13 = 0;
  v11 = 0;
  if (-[BuddyMultilingualDataSource dataSourceActionEnabled](v17, "dataSourceActionEnabled"))
  {
    v5 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v14 = v5;
    v13 = 1;
  }
  else
  {
    v5 = +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v12 = v5;
    v11 = 1;
  }
  v6 = objc_msgSend(v15, "textLabel");
  objc_msgSend(v6, "setTextColor:", v5);

  if ((v11 & 1) != 0)
  if ((v13 & 1) != 0)

  if (-[BuddyMultilingualDataSource dataSourceActionEnabled](v17, "dataSourceActionEnabled"))
    v7 = 2;
  else
    v7 = 0;
  objc_msgSend(v15, "setSelectionStyle:", v7);
  objc_msgSend(v15, "setUserInteractionEnabled:", -[BuddyMultilingualDataSource dataSourceActionEnabled](v17, "dataSourceActionEnabled"));
  v8 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  objc_msgSend(v15, "setBackgroundColor:", v8);

  v9 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSMutableArray *v5;
  id v6;
  char *v7;
  int64_t v9;
  id location[2];
  BuddyMultilingualDataSource *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v5 = -[BuddyMultilingualDataSource backingStore](v11, "backingStore");
  v6 = -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v9);
  v7 = (char *)objc_msgSend(v6, "count") + 1;

  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSMutableArray *v3;
  id v4;
  id location[2];
  BuddyMultilingualDataSource *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource backingStore](v7, "backingStore");
  v4 = -[NSMutableArray count](v3, "count");

  objc_storeStrong(location, 0);
  return (int64_t)v4;
}

- (BOOL)rowActionableAtIndexPath:(id)a3
{
  NSMutableArray *v3;
  id v4;
  id v5;
  id location[2];
  BuddyMultilingualDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource backingStore](v8, "backingStore");
  v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
  v5 = objc_msgSend(v4, "count");
  LOBYTE(v5) = v5 == objc_msgSend(location[0], "row");

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  BOOL v8;
  unsigned __int8 v9;
  id v11;
  id location[2];
  BuddyMultilingualDataSource *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v5 = objc_msgSend(v11, "row");
  v6 = -[BuddyMultilingualDataSource backingStore](v13, "backingStore");
  v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  v8 = v5 == objc_msgSend(v7, "count");
  v9 = 0;
  if (!v8)
    v9 = -[BuddyMultilingualDataSource itemReorderableAtIndexPath:](v13, "itemReorderableAtIndexPath:", v11);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  int v18;
  id v19;
  id v20;
  id location[2];
  BuddyMultilingualDataSource *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v7 = objc_msgSend(v19, "row");
  v8 = -[BuddyMultilingualDataSource backingStore](v22, "backingStore");
  v9 = -[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", objc_msgSend(v19, "section"));
  v10 = objc_msgSend(v9, "count");

  if (v7 < v10)
  {
    v11 = -[BuddyMultilingualDataSource backingStore](v22, "backingStore");
    v12 = -[NSMutableArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", objc_msgSend(v20, "section"));
    v17 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v20, "row"));

    v13 = -[BuddyMultilingualDataSource backingStore](v22, "backingStore");
    v14 = -[NSMutableArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", objc_msgSend(v20, "section"));
    objc_msgSend(v14, "removeObjectAtIndex:", objc_msgSend(v20, "row"));

    v15 = -[BuddyMultilingualDataSource backingStore](v22, "backingStore");
    v16 = -[NSMutableArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", objc_msgSend(v19, "section"));
    objc_msgSend(v16, "insertObject:atIndex:", v17, objc_msgSend(v19, "row"));

    objc_storeStrong(&v17, 0);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id location[2];
  BuddyMultilingualDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  LOBYTE(a4) = -[BuddyMultilingualDataSource itemEditingOptionsAtIndexPath:](v8, "itemEditingOptionsAtIndexPath:", v6) != 0;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return a4 & 1;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3
{
  char *v3;
  id location[2];
  BuddyMultilingualDataSource *v6;
  int64_t v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource itemEditingOptionsAtIndexPath:](v6, "itemEditingOptionsAtIndexPath:", location[0]);
  if (v3)
  {
    if ((unint64_t)(v3 - 1) < 3)
    {
      v7 = 1;
    }
    else if (v3 == (char *)4)
    {
      if (-[BuddyMultilingualDataSource dataSourceActionEnabled](v6, "dataSourceActionEnabled"))
        v7 = 2;
      else
        v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  NSMutableDictionary *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  NSArray *v15;
  id v16;
  int64_t v17;
  id location[2];
  BuddyMultilingualDataSource *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v16 = 0;
  objc_storeStrong(&v16, a5);
  if (v17 == 1 && -[BuddyMultilingualDataSource itemDeleteableAtIndexPath:](v19, "itemDeleteableAtIndexPath:", v16))
  {
    v7 = -[BuddyMultilingualDataSource fastIdentifierMap](v19, "fastIdentifierMap");
    v8 = -[BuddyMultilingualDataSource backingStore](v19, "backingStore");
    v9 = -[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", objc_msgSend(v16, "section"));
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
    v11 = objc_msgSend(v10, "identifier");
    -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v11);

    v12 = -[BuddyMultilingualDataSource backingStore](v19, "backingStore");
    v13 = -[NSMutableArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", objc_msgSend(v16, "section"));
    objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v16, "row"));

    v14 = location[0];
    v20 = v16;
    v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1);
    objc_msgSend(v14, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 6);

    if (!-[BuddyMultilingualDataSource dataSourceActionEnabled](v19, "dataSourceActionEnabled"))
      -[BuddyMultilingualDataSource tableView:allowAdditionalDataSelection:](v19, "tableView:allowAdditionalDataSelection:", location[0], 1);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)itemEditingOptionsAtIndexPath:(id)a3
{
  id v3;
  unsigned __int8 v4;
  NSMutableArray *v5;
  id v6;
  id v8;
  int v9;
  char v10;
  id v11;
  char v12;
  id v13;
  BOOL v14;
  id location[2];
  BuddyMultilingualDataSource *v16;
  unint64_t v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "row");
  v14 = v3 == (id)-[BuddyMultilingualDataSource _additionRowForSection:](v16, "_additionRowForSection:", objc_msgSend(location[0], "section"));
  v12 = 0;
  v10 = 0;
  v4 = 1;
  if (!v14)
  {
    v13 = -[BuddyMultilingualDataSource backingStore](v16, "backingStore");
    v12 = 1;
    v11 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
    v10 = 1;
    v4 = 1;
    if ((unint64_t)objc_msgSend(v11, "count") > 1)
      v4 = -[BuddyMultilingualDataSource _isEmojiSoleDataItemPostDeletion:](v16, "_isEmojiSoleDataItemPostDeletion:", location[0]);
  }
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  if ((v4 & 1) != 0)
  {
    if (v14)
      v17 = 4;
    else
      v17 = 0;
    v9 = 1;
  }
  else
  {
    v5 = -[BuddyMultilingualDataSource backingStore](v16, "backingStore");
    v6 = -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
    v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(location[0], "row"));

    v17 = (unint64_t)objc_msgSend(v8, "editingOptions");
    v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(location, 0);
  return v17;
}

- (void)tableView:(id)a3 appendItem:(id)a4 inSection:(unint64_t)a5
{
  unint64_t v7;
  NSMutableArray *v8;
  _BOOL8 v9;
  NSAssertionHandler *v10;
  SEL v11;
  BuddyMultilingualDataSource *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  NSMutableDictionary *v16;
  id v17;
  id v18;
  id v19;
  NSArray *v20;
  id v21;
  unint64_t v22;
  id v23;
  id location;
  SEL v25;
  BuddyMultilingualDataSource *v26;
  id v27;

  v26 = self;
  v25 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = a5;
  v7 = a5;
  v8 = -[BuddyMultilingualDataSource backingStore](v26, "backingStore");
  v9 = v7 >= (unint64_t)-[NSMutableArray count](v8, "count");

  if (v9)
  {
    v10 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v11 = v25;
    v12 = v26;
    v13 = -[BuddyMultilingualDataSource backingStore](v26, "backingStore");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("BuddyMultilingualDataSource.m"), 204, CFSTR("OOB check failed store:%@ section:%lu"), v13, v22);

  }
  objc_msgSend(location, "beginUpdates");
  v14 = -[BuddyMultilingualDataSource backingStore](v26, "backingStore");
  v15 = -[NSMutableArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v22);
  objc_msgSend(v15, "addObject:", v23);

  v16 = -[BuddyMultilingualDataSource fastIdentifierMap](v26, "fastIdentifierMap");
  v17 = objc_msgSend(v23, "identifier");
  v18 = objc_msgSend(v23, "identifier");
  -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v18);

  v21 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[BuddyMultilingualDataSource rowForInsertionInSection:](v26, "rowForInsertionInSection:", v22), v22);
  v19 = location;
  v27 = v21;
  v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1);
  objc_msgSend(v19, "insertRowsAtIndexPaths:withRowAnimation:", v20, 0);

  objc_msgSend(location, "endUpdates");
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
}

- (void)tableView:(id)a3 allowAdditionalDataSelection:(BOOL)a4
{
  id location[2];
  BuddyMultilingualDataSource *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 != -[BuddyMultilingualDataSource dataSourceActionEnabled](v6, "dataSourceActionEnabled"))
  {
    -[BuddyMultilingualDataSource setDataSourceActionEnabled:](v6, "setDataSourceActionEnabled:", a4);
    objc_msgSend(location[0], "reloadData");
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)rowForInsertionInSection:(unint64_t)a3
{
  NSMutableArray *v3;
  id v4;
  char *v5;
  char v7;
  id v8;
  char v9;
  NSMutableArray *v10;
  unint64_t v13;

  v3 = -[BuddyMultilingualDataSource backingStore](self, "backingStore");
  v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", a3);
  v9 = 0;
  v7 = 0;
  if (objc_msgSend(v4, "count") == (id)1)
  {
    v5 = 0;
  }
  else
  {
    v10 = -[BuddyMultilingualDataSource backingStore](self, "backingStore");
    v9 = 1;
    v8 = -[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", a3);
    v7 = 1;
    v5 = (char *)objc_msgSend(v8, "count") - 1;
  }
  v13 = (unint64_t)v5;
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  return v13;
}

- (id)itemForPath:(id)a3
{
  NSMutableArray *v3;
  id v4;
  id v5;
  id location[2];
  BuddyMultilingualDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource backingStore](v8, "backingStore");
  v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
  v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(location[0], "row"));

  objc_storeStrong(location, 0);
  return v5;
}

- (id)combinedStore
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t j;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  _QWORD __b[8];
  id v15;
  id location[2];
  BuddyMultilingualDataSource *v17;
  _BYTE v18[128];
  _BYTE v19[128];

  v17 = self;
  location[1] = (id)a2;
  location[0] = objc_opt_new(NSMutableArray);
  memset(__b, 0, sizeof(__b));
  v2 = -[BuddyMultilingualDataSource backingStore](v17, "backingStore");
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(v2);
        v15 = *(id *)(__b[1] + 8 * i);
        memset(v12, 0, sizeof(v12));
        v6 = v15;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v12, v18, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v12[2];
          do
          {
            for (j = 0; j < (unint64_t)v7; ++j)
            {
              if (*(_QWORD *)v12[2] != v8)
                objc_enumerationMutation(v6);
              v13 = *(_QWORD *)(v12[1] + 8 * j);
              objc_msgSend(location[0], "addObject:", v13);
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v12, v18, 16);
          }
          while (v7);
        }

      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
    }
    while (v3);
  }

  v10 = objc_msgSend(location[0], "copy");
  objc_storeStrong(location, 0);
  return v10;
}

- (BOOL)containsKey:(id)a3
{
  NSMutableDictionary *v3;
  id v4;
  BOOL v5;
  id location[2];
  BuddyMultilingualDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource fastIdentifierMap](v8, "fastIdentifierMap");
  v4 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", location[0]);
  v5 = v4 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (id)immutableBackingStore
{
  id v2;
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  id v9;
  id v10;
  _QWORD __b[8];
  id v13;
  id location[2];
  BuddyMultilingualDataSource *v15;
  _BYTE v16[128];

  v15 = self;
  location[1] = (id)a2;
  v2 = objc_alloc((Class)NSMutableArray);
  v3 = -[BuddyMultilingualDataSource backingStore](v15, "backingStore");
  location[0] = objc_msgSend(v2, "initWithCapacity:", -[NSMutableArray count](v3, "count"));

  memset(__b, 0, sizeof(__b));
  v4 = -[BuddyMultilingualDataSource backingStore](v15, "backingStore");
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v4);
        v13 = *(id *)(__b[1] + 8 * i);
        v8 = location[0];
        v9 = objc_msgSend(v13, "copy");
        objc_msgSend(v8, "addObject:", v9);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(location[0], "copy");
  objc_storeStrong(location, 0);
  return v10;
}

- (BOOL)itemReorderableAtIndexPath:(id)a3
{
  BOOL v3;
  id location[2];
  BuddyMultilingualDataSource *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (-[BuddyMultilingualDataSource itemEditingOptionsAtIndexPath:](v6, "itemEditingOptionsAtIndexPath:", location[0], 0) & 1) == 1;
  objc_storeStrong(location, 0);
  return v3;
}

- (BOOL)itemDeleteableAtIndexPath:(id)a3
{
  NSMutableArray *v3;
  id v4;
  unsigned __int8 v5;
  id location[2];
  BuddyMultilingualDataSource *v8;
  BOOL v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource backingStore](v8, "backingStore");
  v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
  v5 = 1;
  if (objc_msgSend(v4, "count") != (id)1)
    v5 = -[BuddyMultilingualDataSource _isEmojiSoleDataItemPostDeletion:](v8, "_isEmojiSoleDataItemPostDeletion:", location[0]);

  v9 = (v5 & 1) == 0
    && (-[BuddyMultilingualDataSource itemEditingOptionsAtIndexPath:](v8, "itemEditingOptionsAtIndexPath:", location[0], 0) & 2) == 2;
  objc_storeStrong(location, 0);
  return v9;
}

- (unint64_t)_additionRowForSection:(int64_t)a3
{
  NSMutableArray *v3;
  id v4;
  id v5;

  v3 = -[BuddyMultilingualDataSource backingStore](self, "backingStore");
  v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", a3);
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (BOOL)_isEmojiSoleDataItemPostDeletion:(id)a3
{
  NSMutableArray *v3;
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  char v11;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  NSMutableArray *v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  NSMutableArray *v28;
  id location[2];
  BuddyMultilingualDataSource *v30;
  char v31;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualDataSource backingStore](v30, "backingStore");
  v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)2)
    goto LABEL_24;
  v6 = -[BuddyMultilingualDataSource backingStore](v30, "backingStore");
  v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
  v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = objc_msgSend(v8, "identifier");
  v27 = 0;
  v25 = 0;
  v23 = 0;
  v21 = 0;
  v10 = 1;
  if ((objc_msgSend(v9, "isEqualToString:", UIKeyboardInputMode_emoji) & 1) == 0)
  {
    v28 = -[BuddyMultilingualDataSource backingStore](v30, "backingStore");
    v27 = 1;
    v26 = -[NSMutableArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
    v25 = 1;
    v24 = objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
    v23 = 1;
    v22 = objc_msgSend(v24, "identifier");
    v21 = 1;
    v10 = objc_msgSend(v22, "isEqualToString:", UIKeyboardInputMode_emoji);
  }
  if ((v21 & 1) != 0)

  if ((v23 & 1) != 0)
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  v19 = 0;
  v17 = 0;
  v15 = 0;
  v13 = 0;
  v11 = 0;
  if ((v10 & 1) != 0)
  {
    v20 = -[BuddyMultilingualDataSource backingStore](v30, "backingStore");
    v19 = 1;
    v18 = -[NSMutableArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
    v17 = 1;
    v16 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(location[0], "row"));
    v15 = 1;
    v14 = objc_msgSend(v16, "identifier");
    v13 = 1;
    v11 = objc_msgSend(v14, "isEqualToString:", UIKeyboardInputMode_emoji) ^ 1;
  }
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  if ((v17 & 1) != 0)

  if ((v19 & 1) != 0)
  if ((v11 & 1) != 0)
    v31 = 1;
  else
LABEL_24:
    v31 = 0;
  objc_storeStrong(location, 0);
  return v31 & 1;
}

- (void)recalculateUnifiedRowHeight
{
  -[BuddyMultilingualDataSource _sizeConsistentRowHeight](self, "_sizeConsistentRowHeight", a2, self);
}

- (double)unifiedRowHeight
{
  double result;

  -[BuddyMultilingualDataSource consistentRowHeight](self, "consistentRowHeight", a2, self);
  return result;
}

- (void)_sizeConsistentRowHeight
{
  UIApplication *v2;
  NSString *v3;
  NSComparisonResult v4;
  double v5;
  id v6;
  const __CFString *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id location[2];
  BuddyMultilingualDataSource *v15;

  v15 = self;
  location[1] = (id)a2;
  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = -[UIApplication preferredContentSizeCategory](v2, "preferredContentSizeCategory");
  v4 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraLarge, v3);

  if (v4 == NSOrderedAscending)
  {
    -[BuddyMultilingualDataSource setConsistentRowHeight:](v15, "setConsistentRowHeight:", UITableViewAutomaticDimension);
  }
  else
  {
    -[BuddyMultilingualDataSource consistentRowHeight](v15, "consistentRowHeight");
    if (v5 == UITableViewAutomaticDimension)
    {
      location[0] = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
      v6 = objc_msgSend(location[0], "textLabel");
      objc_msgSend(v6, "setText:", CFSTR("SIZING_TEXT"));

      if (-[BuddyMultilingualDataSource dataHasDetailedLabelField](v15, "dataHasDetailedLabelField"))
        v7 = CFSTR("SIZING_DETAIL_TEXT");
      else
        v7 = 0;
      v8 = objc_msgSend(location[0], "detailTextLabel");
      objc_msgSend(v8, "setText:", v7);

      objc_msgSend(location[0], "layoutIfNeeded");
      objc_msgSend(location[0], "frame");
      sub_1001C24D4();
      LODWORD(v9) = 1148846080;
      LODWORD(v10) = 1112014848;
      objc_msgSend(location[0], "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v11, v12, v9, v10);
      -[BuddyMultilingualDataSource setConsistentRowHeight:](v15, "setConsistentRowHeight:", v13);
      objc_storeStrong(location, 0);
    }
  }
}

- (NSMutableArray)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_backingStore, a3);
}

- (NSString)actionString
{
  return self->_actionString;
}

- (void)setActionString:(id)a3
{
  objc_storeStrong((id *)&self->_actionString, a3);
}

- (NSMutableDictionary)fastIdentifierMap
{
  return self->_fastIdentifierMap;
}

- (void)setFastIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_fastIdentifierMap, a3);
}

- (BOOL)dataSourceActionEnabled
{
  return self->_dataSourceActionEnabled;
}

- (void)setDataSourceActionEnabled:(BOOL)a3
{
  self->_dataSourceActionEnabled = a3;
}

- (double)consistentRowHeight
{
  return self->_consistentRowHeight;
}

- (void)setConsistentRowHeight:(double)a3
{
  self->_consistentRowHeight = a3;
}

- (BOOL)dataHasDetailedLabelField
{
  return self->_dataHasDetailedLabelField;
}

- (void)setDataHasDetailedLabelField:(BOOL)a3
{
  self->_dataHasDetailedLabelField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastIdentifierMap, 0);
  objc_storeStrong((id *)&self->_actionString, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end
