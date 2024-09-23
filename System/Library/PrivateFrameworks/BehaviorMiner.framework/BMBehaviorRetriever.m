@implementation BMBehaviorRetriever

- (BMBehaviorRetriever)init
{
  void *v3;
  BMBehaviorRetriever *v4;

  +[BMBehaviorStorage defaultURL](BMBehaviorStorage, "defaultURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BMBehaviorRetriever initWithURL:](self, "initWithURL:", v3);

  return v4;
}

- (BMBehaviorRetriever)initWithURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMBehaviorRetriever *v7;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMBehaviorRetriever initWithURL:taskSpecificItemTypes:](self, "initWithURL:taskSpecificItemTypes:", v5, v6);

  return v7;
}

- (BMBehaviorRetriever)initWithURL:(id)a3 taskSpecificItemTypes:(id)a4
{
  id v6;
  id v7;
  BMBehaviorRetriever *v8;
  BMBehaviorStorage *v9;
  BMBehaviorStorage *storage;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BMBehaviorRetriever;
  v8 = -[BMBehaviorRetriever init](&v21, sel_init);
  if (v8)
  {
    v9 = -[BMBehaviorStorage initWithURL:readOnly:]([BMBehaviorStorage alloc], "initWithURL:readOnly:", v6, 1);
    storage = v8->_storage;
    v8->_storage = v9;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          +[BMItemType registerItemType:](BMItemType, "registerItemType:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

    v8->_fetchLimit = 2048;
  }

  return v8;
}

- (id)retrieveRulesWithFilters:(id)a3
{
  return -[BMBehaviorRetriever retrieveRulesWithSupport:confidence:filters:](self, "retrieveRulesWithSupport:confidence:filters:", a3, 0.0, 0.0);
}

- (id)retrieveRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a5)
  {
    -[BMBehaviorRetriever retrieveRulesWithSupport:confidence:filters:error:](self, "retrieveRulesWithSupport:confidence:filters:error:", a5, 0, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMBehaviorRetriever retrieveRulesWithSupport:confidence:filters:error:](self, "retrieveRulesWithSupport:confidence:filters:error:", v9, 0, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
    v10 = v8;
  else
    v10 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v10;

  return v11;
}

- (id)retrieveRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a5;
  -[BMBehaviorRetriever storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRulesWithSupport:confidence:filters:limit:error:", v10, self->_fetchLimit, a6, a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)retrieveRulesWithAbsoluteSupport:(unint64_t)a3 support:(double)a4 confidence:(double)a5 conviction:(double)a6 lift:(double)a7 rulePowerFactor:(double)a8 uniqueDaysLastWeek:(unint64_t)a9 uniqueDaysTotal:(unint64_t)a10 filters:(id)a11 error:(id *)a12
{
  id v22;
  void *v23;
  void *v24;

  v22 = a11;
  -[BMBehaviorRetriever storage](self, "storage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fetchRulesWithAbsoluteSupport:support:confidence:conviction:lift:rulePowerFactor:uniqueDaysLastWeek:uniqueDaysTotal:filters:limit:error:", a3, a9, a10, v22, self->_fetchLimit, a12, a4, a5, a6, a7, a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BMBehaviorStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
