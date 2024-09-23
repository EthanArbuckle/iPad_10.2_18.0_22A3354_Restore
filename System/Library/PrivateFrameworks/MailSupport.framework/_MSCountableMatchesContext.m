@implementation _MSCountableMatchesContext

- (_MSCountableMatchesContext)init
{
  _MSCountableMatchesContext *v2;
  uint64_t v3;
  NSMutableDictionary *contactsCount;
  NSMutableSet *v5;
  NSMutableSet *highestMatches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MSCountableMatchesContext;
  v2 = -[_MSCountableMatchesContext init](&v8, sel_init);
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
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *contactsCount;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  int64_t maxCount;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = v7[2](v7, v11);
        if (v12)
        {
          contactsCount = self->_contactsCount;
          objc_msgSend(v11, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](contactsCount, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          v17 = v16 + v12;
          maxCount = self->_maxCount;
          if (v16 + v12 == maxCount)
          {
            if (v17 <= 0)
              goto LABEL_13;
          }
          else
          {
            if (v16 + v12 <= maxCount)
              goto LABEL_13;
            self->_maxCount = v17;
            -[NSMutableSet removeAllObjects](self->_highestMatches, "removeAllObjects");
            if (v17 < 1)
              goto LABEL_13;
          }
          -[NSMutableSet addObject:](self->_highestMatches, "addObject:", v11);
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16 + v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = self->_contactsCount;
          objc_msgSend(v11, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

          continue;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
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
