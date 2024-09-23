@implementation MessageListItemHelper

- (id)itemIDBeforeItemID:(id)a3 snapshot:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "indexOfItemIdentifier:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else if (v7)
  {
    v9 = v7 - 1;
    objc_msgSend(v6, "itemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sectionIdentifierForSectionContainingItemIdentifier:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifierForSectionContainingItemIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
      v14 = v11;
    else
      v14 = v5;
    v8 = v14;

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)itemIDAfterItemID:(id)a3 snapshot:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "indexOfItemIdentifier:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7 + 1;
    objc_msgSend(v6, "itemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 >= objc_msgSend(v10, "count"))
    {
      v11 = v5;
    }
    else
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;

  }
  return v8;
}

- (int64_t)cellGroupingForItemID:(id)a3 snapshot:(id)a4 isThreaded:(BOOL)a5
{
  int v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  int v19;
  int v20;
  int v21;
  char v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[MessageListItemHelper delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      v12 = objc_msgSend(v10, "messageListItemHelper:isItemIDExpandedThread:", self, v8) ^ 1;
      v5 = objc_msgSend(v11, "messageListItemHelper:anyExpandedThreadContainsItemID:", self, v8);
      v13 = -[MessageListItemHelper _isNextItemLastExpandedItemID:snapshot:](self, "_isNextItemLastExpandedItemID:snapshot:", v8, v9) & v5 ^ 1;
    }
    else
    {
      v12 = 1;
      v13 = 1;
    }
    v15 = -[MessageListItemHelper _isItemBeforeItemIDSelected:snapshot:](self, "_isItemBeforeItemIDSelected:snapshot:", v8, v9);
    v16 = -[MessageListItemHelper _isItemAfterItemIDSelected:snapshot:](self, "_isItemAfterItemIDSelected:snapshot:", v8, v9);
    v17 = -[MessageListItemHelper _isItemIDSelected:](self, "_isItemIDSelected:", v8);
    if ((v12 & 1) != 0 || v15 && v17)
    {
      v18 = !v17;
      v19 = !v16;
      v20 = v15 || !v17 || !v16;
      v21 = v20 | v5;
      v22 = v20 ^ 1;
      if (v5)
        v22 = v13;
      if (v21)
        v14 = 3;
      else
        v14 = 2;
      if ((v22 & 1) == 0)
      {
        v23 = v13 | v19 | v18;
        v24 = v18 | !v15;
        v25 = v24 | v19;
        v26 = v24 | v16;
        v27 = (v18 | v15 | v16) ^ 1u;
        if (!(v13 | (v16 && v17)))
          v27 = 4;
        if (v26 != 1)
          v27 = 4;
        if (v25 != 1)
          v27 = 3;
        if (!v23)
          v27 = 3;
        if ((v12 | !v15) == 1)
          v14 = v27;
        else
          v14 = 3;
      }
    }
    else
    {
      v14 = 2;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_isItemIDSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[MessageListItemHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "messageListItemHelper:isItemIDSelected:", self, v4);
  else
    v7 = 0;

  return v7;
}

- (MessageListItemHelperDelegate)delegate
{
  return (MessageListItemHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_isNextItemLastExpandedItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  v6 = a3;
  -[MessageListItemHelper itemIDAfterItemID:snapshot:](self, "itemIDAfterItemID:snapshot:", v6, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    if ((id)v7 == v6)
    {
      v11 = 1;
    }
    else
    {
      -[MessageListItemHelper delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "messageListItemHelper:anyExpandedThreadContainsItemID:", self, v8);

      v11 = v10 ^ 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isItemBeforeItemIDSelected:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v13 = v8
     && (objc_msgSend(v8, "isEqual:", v6) & 1) == 0
     && (objc_msgSend(v7, "itemIdentifiers"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v10, "firstObject"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v6, "isEqual:", v11),
         v11,
         v10,
         (v12 & 1) == 0)
     && -[MessageListItemHelper _isItemIDSelected:](self, "_isItemIDSelected:", v9);

  return v13;
}

- (BOOL)_isItemAfterItemIDSelected:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  -[MessageListItemHelper itemIDAfterItemID:snapshot:](self, "itemIDAfterItemID:snapshot:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v13 = v8
     && (objc_msgSend(v8, "isEqual:", v6) & 1) == 0
     && (objc_msgSend(v7, "itemIdentifiers"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v10, "lastObject"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v6, "isEqual:", v11),
         v11,
         v10,
         (v12 & 1) == 0)
     && -[MessageListItemHelper _isItemIDSelected:](self, "_isItemIDSelected:", v9);

  return v13;
}

- (MessageListItemHelper)initWithDelegate:(id)a3
{
  id v4;
  MessageListItemHelper *v5;
  MessageListItemHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MessageListItemHelper;
  v5 = -[MessageListItemHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
