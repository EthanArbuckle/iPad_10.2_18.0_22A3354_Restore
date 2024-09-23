@implementation NMSItemGroupEnumerator

- (NMSItemGroupEnumerator)initWithItemGroup:(id)a3
{
  id v5;
  NMSItemGroupEnumerator *v6;
  NMSItemGroupEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSItemGroupEnumerator;
  v6 = -[NMSItemGroupEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemGroup, a3);

  return v7;
}

- (id)nextItem
{
  NSArray *itemList;
  unint64_t itemIndex;
  unint64_t v5;
  NSArray *v6;
  NSArray *v7;

  itemList = self->_itemList;
  if (!itemList)
  {
    if (self->_itemIndex)
    {
      itemList = 0;
      return -[NSArray objectAtIndex:](itemList, "objectAtIndex:", self->_itemIndex++);
    }
    -[NMSMediaItemGroup itemList](self->_itemGroup, "itemList");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_itemList;
    self->_itemList = v6;

    itemList = self->_itemList;
    if (!itemList)
      return -[NSArray objectAtIndex:](itemList, "objectAtIndex:", self->_itemIndex++);
  }
  itemIndex = self->_itemIndex;
  v5 = -[NSArray count](itemList, "count");
  itemList = self->_itemList;
  if (itemIndex >= v5)
  {
    self->_itemList = 0;

    itemList = self->_itemList;
  }
  return -[NSArray objectAtIndex:](itemList, "objectAtIndex:", self->_itemIndex++);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_storeStrong((id *)&self->_itemGroup, 0);
}

@end
