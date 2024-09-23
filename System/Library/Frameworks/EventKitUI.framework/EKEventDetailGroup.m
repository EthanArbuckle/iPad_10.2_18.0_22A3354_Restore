@implementation EKEventDetailGroup

- (EKEventDetailGroup)initWithTag:(int64_t)a3 headerTitle:(id)a4
{
  id v6;
  EKEventDetailGroup *v7;
  EKEventDetailGroup *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKEventDetailGroup;
  v7 = -[EKEventDetailGroup init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EKEventDetailGroup setTag:](v7, "setTag:", a3);
    -[EKEventDetailGroup setHeaderTitle:](v8, "setHeaderTitle:", v6);
  }

  return v8;
}

- (unint64_t)numberOfRows
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKEventDetailGroup items](self, "items", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "numberOfSubitems");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)itemAtIndex:(unint64_t)a3
{
  return -[EKEventDetailGroup itemAtIndex:subitemIndex:](self, "itemAtIndex:subitemIndex:", a3, 0);
}

- (id)itemAtIndex:(unint64_t)a3 subitemIndex:(unint64_t *)a4
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EKEventDetailGroup items](self, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if (a3 - v8 < objc_msgSend(v12, "numberOfSubitems"))
      {
        v13 = v12;

        v9 = v13;
      }
      if (a4)
        *a4 = a3 - v8;
      v8 += objc_msgSend(v12, "numberOfSubitems");
      if (v8 > a3)
        break;
      if (v7 == ++v11)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v6 = a4;
  -[EKEventDetailGroup itemAtIndex:subitemIndex:](self, "itemAtIndex:subitemIndex:", a3, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForSubitemAtIndex:withTraitCollection:", v10, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;

  -[EKEventDetailGroup defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:](self, "defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:", a3, 1, a4);
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  double v8;
  double v9;
  uint64_t v11;

  v5 = a5;
  v11 = 0;
  -[EKEventDetailGroup itemAtIndex:subitemIndex:](self, "itemAtIndex:subitemIndex:", a3, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:", v11, v5, a4);
  v9 = v8;

  return v9;
}

- (BOOL)hasSubitemForIndexPathRow:(unint64_t)a3
{
  void *v3;
  char v4;
  uint64_t v6;

  v6 = 0;
  -[EKEventDetailGroup itemAtIndex:subitemIndex:](self, "itemAtIndex:subitemIndex:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDetailViewControllerAtIndex:", v6);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[EKEventDetailGroup items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateCellLayoutsForRowCountIfNeededUsingWidth:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKEventDetailGroup items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "requiresLayoutForSubitemCount")
          && objc_msgSend(v9, "maximumNumberOfSubItems"))
        {
          v10 = 0;
          do
          {
            objc_msgSend(v9, "cellForSubitemAtIndex:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v11, "layoutForWidth:position:", objc_msgSend(v9, "cellPosition"), a3);

            ++v10;
          }
          while (v10 < objc_msgSend(v9, "maximumNumberOfSubItems"));
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
