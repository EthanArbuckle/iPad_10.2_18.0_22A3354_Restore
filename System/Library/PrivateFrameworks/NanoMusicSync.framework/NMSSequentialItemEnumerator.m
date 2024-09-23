@implementation NMSSequentialItemEnumerator

- (NMSSequentialItemEnumerator)initWithItemEnumerators:(id)a3
{
  id v4;
  NMSSequentialItemEnumerator *v5;
  uint64_t v6;
  NSMutableArray *itemEnumerators;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSSequentialItemEnumerator;
  v5 = -[NMSSequentialItemEnumerator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    itemEnumerators = v5->_itemEnumerators;
    v5->_itemEnumerators = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)nextItem
{
  NSMutableArray *i;
  void *v4;
  void *v5;

  for (i = self->_itemEnumerators; -[NSMutableArray count](i, "count"); i = self->_itemEnumerators)
  {
    -[NSMutableArray firstObject](self->_itemEnumerators, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return v5;
    -[NSMutableArray removeObjectAtIndex:](self->_itemEnumerators, "removeObjectAtIndex:", 0);
  }
  v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemEnumerators, 0);
}

@end
