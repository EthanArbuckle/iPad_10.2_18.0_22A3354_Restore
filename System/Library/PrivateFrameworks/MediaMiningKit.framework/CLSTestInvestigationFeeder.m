@implementation CLSTestInvestigationFeeder

- (CLSTestInvestigationFeeder)initWithItems:(id)a3
{
  id v4;
  CLSTestInvestigationFeeder *v5;
  uint64_t v6;
  NSArray *items;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSTestInvestigationFeeder;
  v5 = -[CLSInvestigationFeeder init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_3436);
    v6 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v6;

  }
  return v5;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (id)localStartDateComponents
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_items, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_localDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localEndDateComponents
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_items, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_localDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localStartDate
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_items, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_localDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localEndDate
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_items, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_localDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)universalStartDate
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_items, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)universalEndDate
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_items, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)approximateLocation
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "clsLocation", (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)allItems
{
  return self->_items;
}

- (id)itemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  -[CLSTestInvestigationFeeder enumerateItemsWithOptions:usingBlock:](self, "enumerateItemsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self->_items, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

uint64_t __44__CLSTestInvestigationFeeder_initWithItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_universalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E10]), "initForTesting");
    v3 = (void *)sCurationModel;
    sCurationModel = v2;

  }
}

@end
