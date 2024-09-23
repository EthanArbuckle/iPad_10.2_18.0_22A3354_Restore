@implementation NMSMutableItemEnumerator

- (NMSMutableItemEnumerator)init
{
  NMSMutableItemEnumerator *v2;
  uint64_t v3;
  NSMutableArray *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSMutableItemEnumerator;
  v2 = -[NMSMutableItemEnumerator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    items = v2->_items;
    v2->_items = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addItem:(id)a3
{
  -[NSMutableArray addObject:](self->_items, "addObject:", a3);
}

- (id)nextItem
{
  unint64_t itemIndex;
  unint64_t v4;
  NSMutableArray *items;
  void *v6;
  unint64_t v7;

  itemIndex = self->_itemIndex;
  v4 = -[NSMutableArray count](self->_items, "count");
  items = self->_items;
  if (itemIndex >= v4)
  {
    -[NSMutableArray removeAllObjects](items, "removeAllObjects");
    v7 = 0;
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](items, "objectAtIndex:", self->_itemIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_itemIndex + 1;
  }
  self->_itemIndex = v7;
  return v6;
}

- (BOOL)hasItems
{
  return -[NSMutableArray count](self->_items, "count") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
