@implementation SUUIPageComponentContext

- (SUUIPageComponentContext)init
{
  SUUIPageComponentContext *v2;
  void *v3;
  _BOOL8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIPageComponentContext;
  v2 = -[SUUIPageComponentContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

    v2->_layoutStyle = v4;
    v2->_pageGenerationTime = CFAbsoluteTimeGetCurrent();
  }
  return v2;
}

- (void)addUnavailableItemIdentifiers:(id)a3
{
  id v4;
  NSMutableSet *unavailableItems;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  unavailableItems = self->_unavailableItems;
  v8 = v4;
  if (!unavailableItems)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = self->_unavailableItems;
    self->_unavailableItems = v6;

    v4 = v8;
    unavailableItems = self->_unavailableItems;
  }
  -[NSMutableSet addObjectsFromArray:](unavailableItems, "addObjectsFromArray:", v4);

}

- (BOOL)isUnavailableItemIdentifier:(id)a3
{
  return -[NSMutableSet containsObject:](self->_unavailableItems, "containsObject:", a3);
}

- (id)itemForItemIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_unavailableItems, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_items, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
  NSMutableSet *unavailableItems;
  id v6;
  objc_class *v7;
  id v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  _QWORD v11[5];

  unavailableItems = self->_unavailableItems;
  if (unavailableItems)
  {
    v6 = a3;
    -[NSMutableSet removeAllObjects](unavailableItems, "removeAllObjects");
  }
  else
  {
    v7 = (objc_class *)MEMORY[0x24BDBCEF0];
    v8 = a3;
    v9 = (NSMutableSet *)objc_alloc_init(v7);
    v10 = self->_unavailableItems;
    self->_unavailableItems = v9;

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SUUIPageComponentContext_setUnavailableItemIdentifiers___block_invoke;
  v11[3] = &unk_2511F5A48;
  v11[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);

}

uint64_t __58__SUUIPageComponentContext_setUnavailableItemIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_componentDictionary, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSArray copyWithZone:](self->_ineligibleGratisIdentifiers, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDictionary copyWithZone:](self->_items, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_layoutStyle;
  v12 = -[NSDictionary copyWithZone:](self->_platformKeyProfileOverrides, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  v14 = -[NSMutableSet mutableCopyWithZone:](self->_unavailableItems, "mutableCopyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  return v5;
}

- (NSSet)allUnavailableItemIdentifiers
{
  return &self->_unavailableItems->super;
}

- (NSDictionary)componentDictionary
{
  return self->_componentDictionary;
}

- (void)setComponentDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)ineligibleGratisIdentifiers
{
  return self->_ineligibleGratisIdentifiers;
}

- (void)setIneligibleGratisIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (double)pageGenerationTime
{
  return self->_pageGenerationTime;
}

- (NSDictionary)platformKeyProfileOverrides
{
  return self->_platformKeyProfileOverrides;
}

- (void)setPlatformKeyProfileOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableItems, 0);
  objc_storeStrong((id *)&self->_platformKeyProfileOverrides, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_ineligibleGratisIdentifiers, 0);
  objc_storeStrong((id *)&self->_componentDictionary, 0);
}

@end
