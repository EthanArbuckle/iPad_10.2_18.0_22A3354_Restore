@implementation CNCardActionGroupItem

- (NSArray)actions
{
  return &self->_actions->super;
}

+ (id)actionGroupItemWithAction:(id)a3
{
  id v3;
  CNCardActionGroupItem *v4;

  v3 = a3;
  v4 = -[CNCardActionGroupItem initWithAction:]([CNCardActionGroupItem alloc], "initWithAction:", v3);

  return v4;
}

- (CNCardActionGroupItem)initWithAction:(id)a3
{
  id v4;
  CNCardActionGroupItem *v5;
  CNCardActionGroupItem *v6;

  v4 = a3;
  v5 = -[CNCardActionGroupItem init](self, "init");
  v6 = v5;
  if (v5)
    -[CNCardActionGroupItem addAction:](v5, "addAction:", v4);

  return v6;
}

- (CNCardActionGroupItem)init
{
  CNCardActionGroupItem *v2;
  NSMutableArray *v3;
  NSMutableArray *actions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNCardActionGroupItem;
  v2 = -[CNCardActionGroupItem init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v2->_actions;
    v2->_actions = v3;

  }
  return v2;
}

- (void)addAction:(id)a3
{
  -[NSMutableArray addObject:](self->_actions, "addObject:", a3);
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

+ (id)actionGroupItemWithActions:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") != 1 && objc_msgSend(v5, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNCardActionGroupItem.m"), 49, CFSTR("We currently only support at most two actions in a cell"));

  }
  v6 = objc_alloc_init((Class)a1);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addAction:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

@end
