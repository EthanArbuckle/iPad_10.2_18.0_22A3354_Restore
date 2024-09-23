@implementation FCSetValueMapTable

- (id)description
{
  void *v2;
  void *v3;

  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCSetValueMapTable)init
{
  FCSetValueMapTable *v2;
  uint64_t v3;
  FCMapTable *backingMapTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCSetValueMapTable;
  v2 = -[FCSetValueMapTable init](&v6, sel_init);
  if (v2)
  {
    +[FCMapTable mapTableWithKeyOptions:valueOptions:](FCMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    backingMapTable = v2->_backingMapTable;
    v2->_backingMapTable = (FCMapTable *)v3;

  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FCSetValueMapTable *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  FCSetValueMapTable *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = -[FCSetValueMapTable init](+[FCSetValueMapTable allocWithZone:](FCSetValueMapTable, "allocWithZone:"), "init");
  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  -[FCSetValueMapTable backingMapTable](v5, "backingMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
        objc_msgSend(v7, "setObject:forKey:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v18;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[FCSetValueMapTable _setForKey:](self, "_setForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[FCSetValueMapTable _setForKey:](self, "_setForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

- (void)addObjects:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[FCSetValueMapTable _setForKey:](self, "_setForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v6);

}

- (id)objectsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeObjectsForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)objectEnumerator
{
  void *v2;
  void *v3;

  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_setForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCSetValueMapTable backingMapTable](self, "backingMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKey:", v6, v4);
  }

  return v6;
}

- (FCMapTable)backingMapTable
{
  return self->_backingMapTable;
}

- (void)setBackingMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_backingMapTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingMapTable, 0);
}

@end
