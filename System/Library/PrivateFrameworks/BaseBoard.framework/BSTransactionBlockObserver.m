@implementation BSTransactionBlockObserver

- (void)addTransactionWillBeginBlock:(id)a3
{
  NSMutableArray *willBeginBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  willBeginBlocks = self->_willBeginBlocks;
  if (!willBeginBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_willBeginBlocks;
    self->_willBeginBlocks = v6;

    willBeginBlocks = self->_willBeginBlocks;
  }
  v9 = (id)objc_msgSend(a3, "copy");
  v8 = (void *)MEMORY[0x18D769CFC]();
  -[NSMutableArray addObject:](willBeginBlocks, "addObject:", v8);

}

- (void)addTransactionDidBeginBlock:(id)a3
{
  NSMutableArray *didBeginBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  didBeginBlocks = self->_didBeginBlocks;
  if (!didBeginBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_didBeginBlocks;
    self->_didBeginBlocks = v6;

    didBeginBlocks = self->_didBeginBlocks;
  }
  v9 = (id)objc_msgSend(a3, "copy");
  v8 = (void *)MEMORY[0x18D769CFC]();
  -[NSMutableArray addObject:](didBeginBlocks, "addObject:", v8);

}

- (void)addTransactionDidFinishWorkBlock:(id)a3
{
  NSMutableArray *didFinishWorkBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  didFinishWorkBlocks = self->_didFinishWorkBlocks;
  if (!didFinishWorkBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_didFinishWorkBlocks;
    self->_didFinishWorkBlocks = v6;

    didFinishWorkBlocks = self->_didFinishWorkBlocks;
  }
  v9 = (id)objc_msgSend(a3, "copy");
  v8 = (void *)MEMORY[0x18D769CFC]();
  -[NSMutableArray addObject:](didFinishWorkBlocks, "addObject:", v8);

}

- (void)addTransactionDidCompleteBlock:(id)a3
{
  NSMutableArray *didCompleteBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  didCompleteBlocks = self->_didCompleteBlocks;
  if (!didCompleteBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_didCompleteBlocks;
    self->_didCompleteBlocks = v6;

    didCompleteBlocks = self->_didCompleteBlocks;
  }
  v9 = (id)objc_msgSend(a3, "copy");
  v8 = (void *)MEMORY[0x18D769CFC]();
  -[NSMutableArray addObject:](didCompleteBlocks, "addObject:", v8);

}

- (void)transactionWillBegin:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_willBeginBlocks, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_willBeginBlocks, "removeAllObjects");
}

- (void)transactionDidBegin:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_didBeginBlocks, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_didBeginBlocks, "removeAllObjects");
}

- (void)transactionDidFinishWork:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_didFinishWorkBlocks, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_didFinishWorkBlocks, "removeAllObjects");
}

- (void)transactionDidComplete:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_didCompleteBlocks, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_didCompleteBlocks, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_didFinishWorkBlocks, 0);
  objc_storeStrong((id *)&self->_didBeginBlocks, 0);
  objc_storeStrong((id *)&self->_willBeginBlocks, 0);
}

@end
