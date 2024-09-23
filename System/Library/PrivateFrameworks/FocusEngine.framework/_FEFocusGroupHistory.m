@implementation _FEFocusGroupHistory

- (_FEFocusGroupHistory)init
{
  _FEFocusGroupHistory *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMapTable *groupToItemMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_FEFocusGroupHistory;
  v2 = -[_FEFocusGroupHistory init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1750], "pointerFunctionsWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1750], "pointerFunctionsWithOptions:", 517);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v3, v4, 10);
    groupToItemMap = v2->_groupToItemMap;
    v2->_groupToItemMap = (NSMapTable *)v5;

  }
  return v2;
}

- (id)lastFocusedItemForGroupIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_groupToItemMap, "objectForKey:", a3);
}

- (void)setLastFocusedItem:(id)a3 forGroupIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusGroupHistory.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusGroupHistory.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[NSMapTable setObject:forKey:](self->_groupToItemMap, "setObject:forKey:", v10, v7);

}

- (void)_uiktest_clearHistory
{
  -[NSMapTable removeAllObjects](self->_groupToItemMap, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupToItemMap, 0);
}

@end
