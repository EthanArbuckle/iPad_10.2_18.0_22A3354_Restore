@implementation SGList

- (SGList)init
{
  SGList *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGList;
  v2 = -[SGList init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SGList setArray:](v2, "setArray:", v3);

  }
  return v2;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_array, "count");
}

- (BOOL)addItem:(id)a3
{
  id v4;
  char v5;
  void *v6;
  NSMutableArray *array;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_array, "containsObject:", v4);
  if ((v5 & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_array, "addObject:", v4);
    -[SGList comparator](self, "comparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      array = self->_array;
      -[SGList comparator](self, "comparator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray sortUsingComparator:](array, "sortUsingComparator:", v8);

    }
    v9 = -[NSMutableArray indexOfObject:](self->_array, "indexOfObject:", v4);
    -[SGList delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "list:didAddItem:atIndex:", self, v4, v9);

  }
  return v5 ^ 1;
}

- (BOOL)removeItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_array, "indexOfObjectIdenticalTo:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_array, "removeObjectAtIndex:", v5);
    -[SGList delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "list:didRemoveItem:atIndex:", self, v4, v5);

  }
  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeAllItems
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v4 = (id)-[NSMutableArray copy](self->_array, "copy");
  -[NSMutableArray removeAllObjects](self->_array, "removeAllObjects");
  if (objc_msgSend(v4, "count"))
  {
    -[SGList delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __24__SGList_removeAllItems__block_invoke;
      v5[3] = &unk_1E62D6ED0;
      v5[4] = self;
      objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v5);
    }
  }

}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", a3);
}

- (id)itemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", a3);
}

- (unint64_t)indexOfItem:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_array, "indexOfObject:", a3);
}

- (id)items
{
  return self->_array;
}

- (void)setComparator:(id)a3
{
  id v4;
  void *v5;
  id comparator;
  void *v7;
  NSMutableArray *array;
  void *v9;
  id v10;

  v4 = a3;
  if (self->_comparator != v4)
  {
    v10 = v4;
    v5 = _Block_copy(v4);
    comparator = self->_comparator;
    self->_comparator = v5;

    -[SGList comparator](self, "comparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v10;
    if (v7)
    {
      array = self->_array;
      -[SGList comparator](self, "comparator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray sortUsingComparator:](array, "sortUsingComparator:", v9);

      v4 = v10;
    }
  }

}

- (SGListDelegate)delegate
{
  return (SGListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)comparator
{
  return self->_comparator;
}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __24__SGList_removeAllItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "list:didRemoveItem:atIndex:", *(_QWORD *)(a1 + 32), v6, a3);

}

@end
