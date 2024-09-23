@implementation AFLinkedListItem

- (AFLinkedListItem)initWithObject:(id)a3
{
  id v5;
  AFLinkedListItem *v6;
  AFLinkedListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFLinkedListItem;
  v6 = -[AFLinkedListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (void)insertBeforeItem:(id)a3
{
  AFLinkedListItem *v4;
  AFLinkedListItem *v5;

  v5 = (AFLinkedListItem *)a3;
  -[AFLinkedListItem previousItem](v5, "previousItem");
  v4 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue();
  if (v5 != self && v4 != self)
  {
    -[AFLinkedListItem setNextItem:](v4, "setNextItem:", self);
    -[AFLinkedListItem setPreviousItem:](self, "setPreviousItem:", v4);
    -[AFLinkedListItem setNextItem:](self, "setNextItem:", v5);
    -[AFLinkedListItem setPreviousItem:](v5, "setPreviousItem:", self);
  }

}

- (void)insertAfterItem:(id)a3
{
  AFLinkedListItem *v4;
  AFLinkedListItem *v5;

  v5 = (AFLinkedListItem *)a3;
  -[AFLinkedListItem nextItem](v5, "nextItem");
  v4 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue();
  if (v5 != self && v4 != self)
  {
    -[AFLinkedListItem setNextItem:](v5, "setNextItem:", self);
    -[AFLinkedListItem setPreviousItem:](self, "setPreviousItem:", v5);
    -[AFLinkedListItem setNextItem:](self, "setNextItem:", v4);
    -[AFLinkedListItem setPreviousItem:](v4, "setPreviousItem:", self);
  }

}

- (void)removeFromList
{
  void *v3;
  id v4;

  -[AFLinkedListItem previousItem](self, "previousItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFLinkedListItem nextItem](self, "nextItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNextItem:", v3);
  -[AFLinkedListItem setPreviousItem:](self, "setPreviousItem:", 0);
  -[AFLinkedListItem setNextItem:](self, "setNextItem:", 0);
  objc_msgSend(v3, "setPreviousItem:", v4);

}

- (id)object
{
  return self->_object;
}

- (AFLinkedListItem)previousItem
{
  return self->_previousItem;
}

- (void)setPreviousItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousItem, a3);
}

- (AFLinkedListItem)nextItem
{
  return self->_nextItem;
}

- (void)setNextItem:(id)a3
{
  objc_storeStrong((id *)&self->_nextItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
