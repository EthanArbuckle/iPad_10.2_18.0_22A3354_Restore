@implementation _AMUIPosterUpdate

- (_AMUIPosterUpdate)initWithPosterConfiguration:(id)a3 update:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  _AMUIPosterUpdate *v12;
  _AMUIPosterUpdate *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *userInfo;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_AMUIPosterUpdate;
  v12 = -[_AMUIPosterUpdate init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_posterConfiguration, a3);
    objc_storeStrong((id *)&v13->_update, a4);
    if (v11)
      v14 = v11;
    else
      v14 = (void *)MEMORY[0x24BDBD1B8];
    v15 = objc_msgSend(v14, "copy");
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v15;

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[PRSPosterConfiguration serverUUID](self->_posterConfiguration, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDictionary hash](self->_userInfo, "hash");
  v6 = v5 ^ -[PRSPosterUpdate hash](self->_update, "hash") ^ v4;

  return v6;
}

- (void)appendCompletion:(id)a3
{
  _AMUIPosterUpdate *v4;
  NSMutableArray *completions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void (**v9)(id, PRSPosterConfiguration *, NSError *);

  v9 = (void (**)(id, PRSPosterConfiguration *, NSError *))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_isFinished)
  {
    v9[2](v9, v4->_firedConfiguration, v4->_firedError);
  }
  else
  {
    completions = v4->_completions;
    if (!completions)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = v4->_completions;
      v4->_completions = v6;

      completions = v4->_completions;
    }
    v8 = (void *)objc_msgSend(v9, "copy");
    -[NSMutableArray addObject:](completions, "addObject:", v8);

  }
  objc_sync_exit(v4);

}

- (void)adoptCompletionsFromStaleUpdate:(id)a3
{
  id *v4;
  _AMUIPosterUpdate *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSMutableArray *completions;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4[2];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v5->_isFinished)
        {
          ((void (**)(_QWORD, PRSPosterConfiguration *, NSError *))v10)[2](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v5->_firedConfiguration, v5->_firedError);
        }
        else
        {
          completions = v5->_completions;
          if (!completions)
          {
            v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v13 = v5->_completions;
            v5->_completions = v12;

            completions = v5->_completions;
          }
          v14 = (void *)objc_msgSend(v10, "copy", (_QWORD)v15);
          -[NSMutableArray addObject:](completions, "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)fireCompletionBlocksWithUpdatedPosterConfiguration:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  _AMUIPosterUpdate *v9;
  BOOL isFinished;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSMutableArray *completions;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_isFinished)
  {
    isFinished = 0;
  }
  else
  {
    v9->_isFinished = 1;
    objc_storeStrong((id *)&v9->_firedConfiguration, a3);
    objc_storeStrong((id *)&v9->_firedError, a4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v9->_completions;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    -[NSMutableArray removeAllObjects](v9->_completions, "removeAllObjects", (_QWORD)v17);
    completions = v9->_completions;
    v9->_completions = 0;

    isFinished = v9->_isFinished;
  }
  objc_sync_exit(v9);

  return isFinished;
}

- (BOOL)isEqual:(id)a3
{
  _AMUIPosterUpdate *v4;
  uint64_t v5;
  _AMUIPosterUpdate *v6;
  _AMUIPosterUpdate *v7;
  char v8;
  _AMUIPosterUpdate *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSDictionary *userInfo;
  void *v15;

  v4 = (_AMUIPosterUpdate *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      -[PRSPosterConfiguration serverUUID](self->_posterConfiguration, "serverUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_AMUIPosterUpdate posterConfiguration](v9, "posterConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serverUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqual:", v12);

      userInfo = self->_userInfo;
      -[_AMUIPosterUpdate userInfo](v9, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(userInfo) = -[NSDictionary isEqualToDictionary:](userInfo, "isEqualToDictionary:", v15);

      v8 = v13 & userInfo;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)cancel
{
  _AMUIPosterUpdate *v2;

  v2 = self;
  objc_sync_enter(v2);
  v2->_isFinished = 1;
  objc_sync_exit(v2);

  -[NSMutableArray removeAllObjects](v2->_completions, "removeAllObjects");
}

- (PRSPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (PRSPosterUpdate)update
{
  return self->_update;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_firedConfiguration, 0);
  objc_storeStrong((id *)&self->_firedError, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
