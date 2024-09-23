@implementation _CNCountableMatchesContext

- (_CNCountableMatchesContext)init
{
  _CNCountableMatchesContext *v2;
  uint64_t v3;
  NSMutableDictionary *contactsCount;
  NSMutableSet *v5;
  NSMutableSet *highestMatches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CNCountableMatchesContext;
  v2 = -[_CNCountableMatchesContext init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    contactsCount = v2->_contactsCount;
    v2->_contactsCount = (NSMutableDictionary *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    highestMatches = v2->_highestMatches;
    v2->_highestMatches = v5;

  }
  return v2;
}

- (void)countInstances:(id)a3 usingPredicate:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *contactsCount;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  int64_t maxCount;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v13 = v7[2](v7, v12);
        if (v13)
        {
          v14 = v13;
          contactsCount = self->_contactsCount;
          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](contactsCount, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "integerValue");

          v19 = v18 + v14;
          maxCount = self->_maxCount;
          if (v19 == maxCount)
          {
            if (v19 <= 0)
              goto LABEL_13;
          }
          else
          {
            if (v19 <= maxCount)
              goto LABEL_13;
            self->_maxCount = v19;
            -[NSMutableSet removeAllObjects](self->_highestMatches, "removeAllObjects");
            if (v19 < 1)
              goto LABEL_13;
          }
          -[NSMutableSet addObject:](self->_highestMatches, "addObject:", v12);
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = self->_contactsCount;
          objc_msgSend(v12, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

          continue;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (NSMutableSet)highestMatches
{
  return self->_highestMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highestMatches, 0);
  objc_storeStrong((id *)&self->_contactsCount, 0);
}

@end
