@implementation _CDContactChangeHistoryEventVisitor

- (_CDContactChangeHistoryEventVisitor)initWithChangeEnumerator:(id)a3
{
  id v5;
  _CDContactChangeHistoryEventVisitor *v6;
  _CDContactChangeHistoryEventVisitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDContactChangeHistoryEventVisitor;
  v6 = -[_CDContactChangeHistoryEventVisitor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_changeEnumerator, a3);
    -[_CDContactChangeHistoryEventVisitor reset](v7, "reset");
  }

  return v7;
}

- (void)visitEventsWithBatchSize:(unint64_t)a3 batchCallback:(id)a4
{
  void (**v6)(id, _CDContactChangeHistoryEventVisitor *, _BYTE *);
  NSEnumerator *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _CDContactChangeHistoryEventVisitor *, _BYTE *))a4;
  v18 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_changeEnumerator;
  v8 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x193FEE914](v8);
        objc_msgSend(v12, "acceptEventVisitor:", self, (_QWORD)v14);
        if (self->_count >= a3)
        {
          v6[2](v6, self, &v18);
          -[_CDContactChangeHistoryEventVisitor reset](self, "reset");
          if (v18)
          {
            objc_autoreleasePoolPop(v13);

            goto LABEL_13;
          }
        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }

  if (self->_count)
  {
    v6[2](v6, self, &v18);
    -[_CDContactChangeHistoryEventVisitor reset](self, "reset");
  }
LABEL_13:

}

- (NSArray)deletedContactIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_deletedContactIdentifiers, "copy");
}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *deletedContactIdentifiers;

  v3 = (NSMutableArray *)objc_opt_new();
  deletedContactIdentifiers = self->_deletedContactIdentifiers;
  self->_deletedContactIdentifiers = v3;

  self->_count = 0;
}

- (void)visitDeleteContactEvent:(id)a3
{
  NSMutableArray *deletedContactIdentifiers;
  void *v5;

  deletedContactIdentifiers = self->_deletedContactIdentifiers;
  objc_msgSend(a3, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](deletedContactIdentifiers, "addObject:", v5);

  ++self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_changeEnumerator, 0);
}

@end
