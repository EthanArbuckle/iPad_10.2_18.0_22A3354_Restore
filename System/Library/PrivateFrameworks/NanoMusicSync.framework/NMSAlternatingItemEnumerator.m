@implementation NMSAlternatingItemEnumerator

- (NMSAlternatingItemEnumerator)initWithItemEnumerators:(id)a3
{
  id v4;
  NMSAlternatingItemEnumerator *v5;
  uint64_t v6;
  NSMutableArray *itemEnumerators;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSAlternatingItemEnumerator;
  v5 = -[NMSAlternatingItemEnumerator init](&v9, sel_init);
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
  unint64_t itemEnumeratorIndex;
  unint64_t v7;

  for (i = self->_itemEnumerators; -[NSMutableArray count](i, "count"); i = self->_itemEnumerators)
  {
    -[NSMutableArray objectAtIndex:](self->_itemEnumerators, "objectAtIndex:", self->_itemEnumeratorIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_6;
    -[NSMutableArray removeObjectAtIndex:](self->_itemEnumerators, "removeObjectAtIndex:", self->_itemEnumeratorIndex);
    itemEnumeratorIndex = self->_itemEnumeratorIndex;
    self->_itemEnumeratorIndex = itemEnumeratorIndex % -[NSMutableArray count](self->_itemEnumerators, "count");
  }
  v5 = 0;
LABEL_6:
  v7 = self->_itemEnumeratorIndex + 1;
  self->_itemEnumeratorIndex = v7 % -[NSMutableArray count](self->_itemEnumerators, "count");
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemEnumerators, 0);
}

@end
