@implementation IKAppDataSet

- (IKAppDataSet)initWithItems:(id)a3 usedPrototypesByIdentifier:(id)a4 indexTitles:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKAppDataSet *v11;
  uint64_t v12;
  NSArray *items;
  uint64_t v14;
  NSDictionary *usedPrototypesByIdentifier;
  uint64_t v16;
  NSDictionary *indexTitles;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IKAppDataSet;
  v11 = -[IKAppDataSet init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    usedPrototypesByIdentifier = v11->_usedPrototypesByIdentifier;
    v11->_usedPrototypesByIdentifier = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    indexTitles = v11->_indexTitles;
    v11->_indexTitles = (NSDictionary *)v16;

  }
  return v11;
}

- (NSArray)itemIDs
{
  NSArray *itemIDs;
  NSArray *v3;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  itemIDs = self->_itemIDs;
  if (itemIDs)
  {
    v3 = itemIDs;
  }
  else
  {
    -[IKAppDataSet items](self, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_itemIDs;
    self->_itemIDs = v6;

    v3 = v6;
  }
  return v3;
}

- (NSArray)items
{
  return self->_items;
}

- (NSDictionary)usedPrototypesByIdentifier
{
  return self->_usedPrototypesByIdentifier;
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexTitles, 0);
  objc_storeStrong((id *)&self->_usedPrototypesByIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

@end
