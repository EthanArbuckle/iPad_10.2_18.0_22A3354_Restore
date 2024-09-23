@implementation SUUISettingsObjectStore

- (SUUISettingsObjectStore)init
{
  SUUISettingsObjectStore *v2;
  SUUISettingsObjectStore *v3;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *allObjects;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *visibleObjects;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUISettingsObjectStore;
  v2 = -[SUUISettingsObjectStore init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dirty = 0;
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    allObjects = v3->_allObjects;
    v3->_allObjects = v4;

    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    visibleObjects = v3->_visibleObjects;
    v3->_visibleObjects = v6;

  }
  return v3;
}

- (id)allObjects
{
  return (id)-[NSMutableOrderedSet copy](self->_allObjects, "copy");
}

- (void)addObject:(id)a3 hidden:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[NSMutableOrderedSet addObject:](self->_allObjects, "addObject:");
  if (!a4)
    -[NSMutableOrderedSet addObject:](self->_visibleObjects, "addObject:", v6);

}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_allObjects, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateObjects:(id)a3
{
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->_allObjects, "enumerateObjectsUsingBlock:", a3);
}

- (void)enumerateVisibleObjects:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_dirty)
    -[SUUISettingsObjectStore _updateVisibleOrder](self, "_updateVisibleOrder");
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->_visibleObjects, "enumerateObjectsUsingBlock:", v4);

}

- (void)hideObject:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->_visibleObjects, "removeObject:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_allObjects, "indexOfObject:", a3);
}

- (unint64_t)indexOfVisibleObject:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (self->_dirty)
    -[SUUISettingsObjectStore _updateVisibleOrder](self, "_updateVisibleOrder");
  v5 = -[NSMutableOrderedSet indexOfObject:](self->_visibleObjects, "indexOfObject:", v4);

  return v5;
}

- (unint64_t)numberOfObjects
{
  return -[NSMutableOrderedSet count](self->_allObjects, "count");
}

- (unint64_t)numberOfVisibleObjects
{
  return -[NSMutableOrderedSet count](self->_visibleObjects, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_allObjects, "objectAtIndex:", a3);
}

- (BOOL)objectIsVisible:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_visibleObjects, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeObject:(id)a3
{
  NSMutableOrderedSet *allObjects;
  id v5;

  allObjects = self->_allObjects;
  v5 = a3;
  -[NSMutableOrderedSet removeObject:](allObjects, "removeObject:", v5);
  -[NSMutableOrderedSet removeObject:](self->_visibleObjects, "removeObject:", v5);

}

- (void)revealObject:(id)a3
{
  NSMutableOrderedSet *visibleObjects;
  id v5;

  visibleObjects = self->_visibleObjects;
  v5 = a3;
  self->_dirty = -[NSMutableOrderedSet count](visibleObjects, "count") != 0;
  -[NSMutableOrderedSet addObject:](self->_visibleObjects, "addObject:", v5);

}

- (id)visibleObjectAtIndex:(unint64_t)a3
{
  if (self->_dirty)
    -[SUUISettingsObjectStore _updateVisibleOrder](self, "_updateVisibleOrder");
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_visibleObjects, "objectAtIndex:", a3);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  const __CFString *v11;
  objc_class *v12;
  void *v13;
  NSMutableOrderedSet *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v20.receiver = self;
  v20.super_class = (Class)SUUISettingsObjectStore;
  -[SUUISettingsObjectStore description](&v20, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: ["), v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_allObjects;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[NSMutableOrderedSet containsObject:](self->_visibleObjects, "containsObject:", v10))
          v11 = CFSTR("\nX ");
        else
          v11 = CFSTR("\n  ");
        objc_msgSend(v5, "appendString:", v11);
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("<%@: %p>"), v13, v10);

      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n]"));
  return v5;
}

- (void)_updateVisibleOrder
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSMutableOrderedSet *visibleObjects;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_allObjects;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[NSMutableOrderedSet indexOfObject:](self->_visibleObjects, "indexOfObject:", v9, (_QWORD)v11) != 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableOrderedSet addObject:](v3, "addObject:", v9);
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  visibleObjects = self->_visibleObjects;
  self->_visibleObjects = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleObjects, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

@end
