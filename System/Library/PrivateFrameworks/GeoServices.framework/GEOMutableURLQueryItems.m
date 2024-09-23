@implementation GEOMutableURLQueryItems

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)addItemWithName:(id)a3 uintValue:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%u"), v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMutableURLQueryItems addItemWithName:value:](self, "addItemWithName:value:", v7, v8);

}

- (void)addItemWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[GEOMutableURLQueryItems items](self, "items");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v8);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)addItemsFromArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEOMutableURLQueryItems items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (GEOMutableURLQueryItems)initWithItems:(id)a3
{
  id v4;
  GEOMutableURLQueryItems *v5;
  id v6;
  uint64_t v7;
  NSMutableArray *items;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMutableURLQueryItems;
  v5 = -[GEOMutableURLQueryItems init](&v10, sel_init);
  if (v5)
  {
    if (v4)
      v6 = v4;
    else
      v6 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSMutableArray *)v7;

  }
  return v5;
}

- (GEOMutableURLQueryItems)init
{
  return -[GEOMutableURLQueryItems initWithItems:](self, "initWithItems:", 0);
}

- (void)addItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEOMutableURLQueryItems items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addItemWithName:(id)a3 intValue:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMutableURLQueryItems addItemWithName:value:](self, "addItemWithName:value:", v7, v8);

}

- (void)addItemWithName:(id)a3 uint64Value:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%llu"), a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMutableURLQueryItems addItemWithName:value:](self, "addItemWithName:value:", v7, v8);

}

@end
