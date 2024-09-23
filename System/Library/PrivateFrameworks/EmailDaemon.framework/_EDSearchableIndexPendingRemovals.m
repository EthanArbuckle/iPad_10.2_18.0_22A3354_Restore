@implementation _EDSearchableIndexPendingRemovals

- (_EDSearchableIndexPendingRemovals)initWithPurgeReasons:(id)a3 exclusionReasons:(id)a4
{
  id v6;
  id v7;
  _EDSearchableIndexPendingRemovals *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *reasonsByIdentifier;
  uint64_t v11;
  NSSet *purgeReasons;
  uint64_t v13;
  NSSet *exclusionReasons;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EDSearchableIndexPendingRemovals;
  v8 = -[_EDSearchableIndexPendingRemovals init](&v16, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reasonsByIdentifier = v8->_reasonsByIdentifier;
    v8->_reasonsByIdentifier = v9;

    v11 = objc_msgSend(v6, "copy");
    purgeReasons = v8->_purgeReasons;
    v8->_purgeReasons = (NSSet *)v11;

    v13 = objc_msgSend(v7, "copy");
    exclusionReasons = v8->_exclusionReasons;
    v8->_exclusionReasons = (NSSet *)v13;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPurgeReasons:exclusionReasons:", self->_purgeReasons, self->_exclusionReasons);
  v5 = -[NSMutableDictionary mutableCopy](self->_reasonsByIdentifier, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_reasonsByIdentifier, "count");
}

- (NSArray)identifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_reasonsByIdentifier, "allKeys");
}

- (id)_identifiersPassingReasonsTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *reasonsByIdentifier;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  -[_EDSearchableIndexPendingRemovals purgeReasons](self, "purgeReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EDSearchableIndexPendingRemovals exclusionReasons](self, "exclusionReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  reasonsByIdentifier = self->_reasonsByIdentifier;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68___EDSearchableIndexPendingRemovals__identifiersPassingReasonsTest___block_invoke;
  v16[3] = &unk_1E94A13B8;
  v9 = v4;
  v20 = v9;
  v10 = v5;
  v17 = v10;
  v11 = v6;
  v18 = v11;
  v12 = v7;
  v19 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](reasonsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v16);
  v13 = v19;
  v14 = v12;

  return v14;
}

- (NSArray)purgedIdentifiers
{
  return (NSArray *)-[_EDSearchableIndexPendingRemovals _identifiersPassingReasonsTest:](self, "_identifiersPassingReasonsTest:", &__block_literal_global_149_0);
}

- (NSArray)deletedIdentifiers
{
  return (NSArray *)-[_EDSearchableIndexPendingRemovals _identifiersPassingReasonsTest:](self, "_identifiersPassingReasonsTest:", &__block_literal_global_150);
}

- (void)addIdentifiers:(id)a3 withReasons:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_reasonsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "unionSet:", v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reasonsByIdentifier, "setObject:forKeyedSubscript:");
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)removeIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_reasonsByIdentifier, "removeObjectForKey:", a3);
}

- (void)removeAllIdentifiers
{
  -[NSMutableDictionary removeAllObjects](self->_reasonsByIdentifier, "removeAllObjects");
}

- (NSSet)purgeReasons
{
  return self->_purgeReasons;
}

- (void)setPurgeReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)exclusionReasons
{
  return self->_exclusionReasons;
}

- (void)setExclusionReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionReasons, 0);
  objc_storeStrong((id *)&self->_purgeReasons, 0);
  objc_storeStrong((id *)&self->_reasonsByIdentifier, 0);
}

@end
