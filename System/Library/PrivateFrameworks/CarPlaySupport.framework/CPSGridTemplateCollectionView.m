@implementation CPSGridTemplateCollectionView

- (CPSGridTemplateCollectionView)initWithFrame:(CGRect)a3 gridButtons:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CPSGridTemplateCollectionView *v10;
  CPSGridTemplateCollectionView *v12;
  CPSGridTemplateCollectionView *v13;
  id v14;
  uint64_t v15;
  CPSGridTemplateCollectionView *v16;
  id v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  id location[2];
  CPSGridTemplateCollectionView *v27;
  CGRect v28;

  v28 = a3;
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v25 = (id)objc_opt_new();
  CGSizeMake_7();
  *(double *)&v24 = v4;
  *((double *)&v24 + 1) = v5;
  v23 = v24;
  objc_msgSend(v25, "setItemSize:", v4, v5);
  objc_msgSend(v25, "setMinimumInteritemSpacing:", 4.0);
  UIEdgeInsetsMake_0();
  *(double *)&v21 = v6;
  *((double *)&v21 + 1) = v7;
  *(double *)&v22 = v8;
  *((double *)&v22 + 1) = v9;
  v19 = v21;
  v20 = v22;
  objc_msgSend(v25, "setSectionInset:", v6, v7, v8, v9);
  v10 = v27;
  v27 = 0;
  v18.receiver = v10;
  v18.super_class = (Class)CPSGridTemplateCollectionView;
  v27 = -[CPSGridTemplateCollectionView initWithFrame:collectionViewLayout:](&v18, sel_initWithFrame_collectionViewLayout_, v25, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  objc_storeStrong((id *)&v27, v27);
  if (v27)
  {
    v13 = v27;
    v14 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    -[CPSGridTemplateCollectionView setBackgroundColor:](v13, "setBackgroundColor:");

    v16 = v27;
    v15 = objc_opt_class();
    v17 = +[CPSGridTemplateCollectionCell reuseIdentifier](CPSGridTemplateCollectionCell, "reuseIdentifier");
    -[CPSGridTemplateCollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", v15);

    -[CPSGridTemplateCollectionView setGridButtons:](v27, "setGridButtons:", location[0]);
    -[CPSGridTemplateCollectionView setDelegate:](v27, "setDelegate:", v27);
    -[CPSGridTemplateCollectionView setDataSource:](v27, "setDataSource:", v27);
    -[CPSGridTemplateCollectionView setScrollEnabled:](v27, "setScrollEnabled:", 0);
    -[CPSGridTemplateCollectionView setBounces:](v27, "setBounces:", 0);
  }
  v12 = v27;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v27, 0);
  return v12;
}

- (void)setGridButtons:(id)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  NSArray *v10;
  BOOL v11;
  id v12;
  double v13;
  _QWORD __b[8];
  id v15;
  double v16;
  id location[2];
  CPSGridTemplateCollectionView *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = -[CPSGridTemplateCollectionView gridButtons](v18, "gridButtons");
  v11 = -[NSArray isEqualToArray:](v10, "isEqualToArray:", location[0]);

  if (!v11)
  {
    v16 = 0.0;
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v15 = *(id *)(__b[1] + 8 * v6);
        objc_msgSend(v15, "preferredLabelWidth");
        v13 = v3 + 4.0;
        if (v3 + 4.0 > v16)
          v16 = v13;
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
          if (!v7)
            break;
        }
      }
    }

    v12 = (id)-[CPSGridTemplateCollectionView collectionViewLayout](v18, "collectionViewLayout");
    objc_msgSend(v12, "setPreferredItemWidth:", v16);
    objc_storeStrong((id *)&v18->_gridButtons, location[0]);
    -[CPSGridTemplateCollectionView reloadData](v18, "reloadData");
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  CPSGridTemplateCollectionView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)CPSGridTemplateCollectionView;
  -[CPSGridTemplateCollectionView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, location[0]);
  v3 = (id)-[CPSGridTemplateCollectionView collectionViewLayout](v6, "collectionViewLayout");
  objc_msgSend(v3, "invalidateLayout");
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  NSArray *v5;
  int64_t v6;
  id location[2];
  CPSGridTemplateCollectionView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSGridTemplateCollectionView gridButtons](v8, "gridButtons");
  v6 = -[NSArray count](v5, "count");

  objc_storeStrong(location, 0);
  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  CPSGridTemplateCollectionView *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v6 = location[0];
  v7 = +[CPSGridTemplateCollectionCell reuseIdentifier](CPSGridTemplateCollectionCell, "reuseIdentifier");
  v11 = (id)objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

  v9 = -[CPSGridTemplateCollectionView gridButtons](v14, "gridButtons");
  v8 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", objc_msgSend(v12, "row"));
  objc_msgSend(v11, "setButton:");

  v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_linearFocusMovementSequences
{
  id v3;
  NSArray *v4;
  id v5;
  id v6[2];
  CPSGridTemplateCollectionView *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[1] = (id)a2;
  v3 = objc_alloc(MEMORY[0x24BDF70C0]);
  v4 = -[CPSGridTemplateCollectionView gridButtons](v7, "gridButtons");
  v6[0] = (id)objc_msgSend(v3, "initWithItems:loops:restrictEnteringSequence:");

  v8[0] = v6[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  objc_storeStrong(v6, 0);
  return v5;
}

- (NSArray)gridButtons
{
  return self->_gridButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridButtons, 0);
}

@end
