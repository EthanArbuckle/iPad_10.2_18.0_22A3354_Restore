@implementation BMAccessDelegate

- (BMAccessDelegate)initWithDelegates:(id)a3
{
  id v5;
  BMAccessDelegate *v6;
  BMAccessDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAccessDelegate;
  v6 = -[BMAccessDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegates, a3);

  return v7;
}

- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_delegates;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v11 &= objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "prepareResource:withMode:", v6, a4, (_QWORD)v14);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (NSArray)delegates
{
  return self->_delegates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
