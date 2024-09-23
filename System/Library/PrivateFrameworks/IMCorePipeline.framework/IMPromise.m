@implementation IMPromise

- (IMPromise)initWithValue:(id)a3
{
  id v4;
  IMPromise *v5;
  IMResult *v6;
  IMResult *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMPromise;
  v5 = -[IMPromise init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMResult initWithSuccess:]([IMResult alloc], "initWithSuccess:", v4);
    v7 = v5->_result;
    v5->_result = v6;

  }
  return v5;
}

- (IMPromise)initWithError:(id)a3
{
  id v4;
  IMPromise *v5;
  IMResult *v6;
  IMResult *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMPromise;
  v5 = -[IMPromise init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMResult initWithError:]([IMResult alloc], "initWithError:", v4);
    v7 = v5->_result;
    v5->_result = v6;

  }
  return v5;
}

- (BOOL)completed
{
  return self->_result != 0;
}

- (void)fullfillWithValue:(id)a3
{
  id v4;
  IMResult *v5;
  IMResult *result;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *completionBlocks;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[IMResult initWithSuccess:]([IMResult alloc], "initWithSuccess:", v4);
  result = self->_result;
  self->_result = v5;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_completionBlocks;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

}

- (void)failWithError:(id)a3
{
  id v4;
  IMResult *v5;
  IMResult *result;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *completionBlocks;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[IMResult initWithError:]([IMResult alloc], "initWithError:", v4);
  result = self->_result;
  self->_result = v5;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_completionBlocks;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

}

- (void)registerCompletionBlock:(id)a3
{
  NSMutableArray *completionBlocks;
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void (**v10)(id, IMResult *);

  v10 = (void (**)(id, IMResult *))a3;
  if (-[IMPromise completed](self, "completed"))
  {
    v10[2](v10, self->_result);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    if (completionBlocks)
    {
      v5 = (void *)MEMORY[0x2207572DC](v10);
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v5);

    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v7 = (void *)MEMORY[0x2207572DC](v10);
      v8 = (NSMutableArray *)objc_msgSend(v6, "initWithObjects:", v7, 0);
      v9 = self->_completionBlocks;
      self->_completionBlocks = v8;

    }
  }

}

+ (id)all:(id)a3
{
  id v3;
  IMPromise *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  IMPromise *v14;
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  int v18;
  _QWORD v19[3];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v3 = a3;
  v4 = objc_alloc_init(IMPromise);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  if (!objc_msgSend(v3, "count"))
  {
    -[IMPromise fullfillWithValue:](v4, "fullfillWithValue:", v5);
    *((_BYTE *)v22 + 24) = 1;
  }
  v8 = 0;
  v9 = MEMORY[0x24BDAC760];
  while (objc_msgSend(v3, "count") > v8)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = sub_21AD47DF4;
    v13[3] = &unk_24DDFFEB0;
    v16 = &v21;
    v14 = v4;
    v11 = v5;
    v18 = v8;
    v15 = v11;
    v17 = v19;
    objc_msgSend(v10, "registerCompletionBlock:", v13);

    ++v8;
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v4;
}

- (id)then:(id)a3
{
  id v4;
  IMPromise *v5;
  IMPromise *v6;
  id v7;
  void *v8;
  IMPromise *v9;
  _QWORD v11[4];
  IMPromise *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(IMPromise);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_21AD47F9C;
  v11[3] = &unk_24DDFFF00;
  v6 = v5;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  -[IMPromise registerCompletionBlock:](self, "registerCompletionBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
