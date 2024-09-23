@implementation _CUTUnsafePromise

- (_CUTUnsafePromise)init
{
  _CUTUnsafePromise *v2;
  _CUTUnsafePromise *v3;
  NSMutableArray *v4;
  NSMutableArray *resultBlocks;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CUTUnsafePromise;
  v2 = -[CUTUnsafePromise _init](&v7, sel__init);
  v3 = v2;
  if (v2)
  {
    v2->_done = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resultBlocks = v3->_resultBlocks;
    v3->_resultBlocks = v4;

  }
  return v3;
}

- (_CUTUnsafePromise)initWithResult:(id)a3
{
  id v5;
  _CUTUnsafePromise *v6;
  _CUTUnsafePromise *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CUTUnsafePromise;
  v6 = -[CUTUnsafePromise _init](&v9, sel__init);
  v7 = v6;
  if (v6)
  {
    v6->_done = 1;
    objc_storeStrong((id *)&v6->_result, a3);
  }

  return v7;
}

- (void)_fulfillWithResult:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *resultBlocks;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[_CUTUnsafePromise done](self, "done"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CUTUnsafePromise.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.done"));

  }
  -[_CUTUnsafePromise setDone:](self, "setDone:", 1);
  -[_CUTUnsafePromise setResult:](self, "setResult:", v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_resultBlocks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  resultBlocks = self->_resultBlocks;
  self->_resultBlocks = 0;

}

- (void)registerResultBlock:(id)a3
{
  void *v4;
  NSMutableArray *resultBlocks;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  if (-[_CUTUnsafePromise done](self, "done"))
  {
    -[_CUTUnsafePromise result](self, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v4);
  }
  else
  {
    resultBlocks = self->_resultBlocks;
    v4 = (void *)MEMORY[0x1A1B015EC](v6);
    -[NSMutableArray addObject:](resultBlocks, "addObject:", v4);
  }

}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSMutableArray)resultBlocks
{
  return self->_resultBlocks;
}

- (void)setResultBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_resultBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBlocks, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
