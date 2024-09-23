@implementation BBAssociationSet

+ (id)setWithStrongAssociation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithMemoryPointerFunction:", 0);
}

+ (id)setWithWeakAssociation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithMemoryPointerFunction:", 5);
}

- (id)_initWithMemoryPointerFunction:(unint64_t)a3
{
  BBAssociationSet *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *associationSetKey;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BBAssociationSet;
  v4 = -[BBAssociationSet init](&v11, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), CFSTR("_associationSet"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    associationSetKey = v4->_associationSetKey;
    v4->_associationSetKey = (NSString *)v8;

    v4->_associatedObjectMemoryPointerFunction = a3;
  }
  return v4;
}

- (void)associateObject:(id)a3 withObject:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_sync_enter(v6);
  v7 = -[NSString cStringUsingEncoding:](self->_associationSetKey, "cStringUsingEncoding:", 1);
  objc_getAssociatedObject(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", self->_associatedObjectMemoryPointerFunction | 0x200);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v6, v7, v8, (void *)0x301);
  }
  objc_sync_exit(v6);

  v9 = v8;
  objc_sync_enter(v9);
  objc_msgSend(v9, "addObject:", v10);
  objc_sync_exit(v9);

}

- (id)associatedObjectsForObject:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_sync_enter(v4);
  v5 = -[NSString cStringUsingEncoding:](self->_associationSetKey, "cStringUsingEncoding:", 1);
  objc_getAssociatedObject(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    objc_sync_enter(v8);
    objc_msgSend(v8, "setRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
    {
      objc_setAssociatedObject(v4, v5, 0, (void *)0x301);

      v9 = 0;
    }
    objc_sync_exit(v8);

  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(v4);

  return v9;
}

- (void)copyAssociationsForObject:(id)a3 toObject:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[BBAssociationSet associatedObjectsForObject:](self, "associatedObjectsForObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[BBAssociationSet associateObject:withObject:](self, "associateObject:withObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationSetKey, 0);
}

@end
