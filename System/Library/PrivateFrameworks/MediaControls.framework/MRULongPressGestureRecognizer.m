@implementation MRULongPressGestureRecognizer

- (void)addCancellationHandler:(id)a3
{
  id v4;
  NSMutableArray *cancellationHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  cancellationHandlers = self->_cancellationHandlers;
  aBlock = v4;
  if (!cancellationHandlers)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_cancellationHandlers;
    self->_cancellationHandlers = v6;

    v4 = aBlock;
    cancellationHandlers = self->_cancellationHandlers;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](cancellationHandlers, "addObject:", v8);

}

- (void)setState:(int64_t)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MRULongPressGestureRecognizer;
  -[MRULongPressGestureRecognizer setState:](&v14, sel_setState_);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_cancellationHandlers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (NSMutableArray)cancellationHandlers
{
  return self->_cancellationHandlers;
}

- (void)setCancellationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationHandlers, 0);
}

@end
