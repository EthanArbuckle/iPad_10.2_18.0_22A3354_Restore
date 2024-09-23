@implementation NFMultiDelegate

- (NFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  NFMultiDelegate *v10;
  uint64_t v11;
  NSHashTable *children;
  NFUnfairLock *v13;
  NFUnfairLock *lock;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NFMultiDelegate;
  v10 = -[NFMultiDelegate init](&v16, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    children = v10->_children;
    v10->_children = (NSHashTable *)v11;

    if (v8)
      -[NSHashTable addObject:](v10->_children, "addObject:", v8);
    objc_storeStrong((id *)&v10->_delegateProtocol, a4);
    if ((v5 & 1) != 0)
    {
      v13 = objc_alloc_init(NFUnfairLock);
      lock = v10->_lock;
      v10->_lock = v13;

    }
  }

  return v10;
}

- (void)addDelegate:(id)a3
{
  NFUnfairLock *lock;
  id v5;
  void *v6;

  if (a3)
  {
    lock = self->_lock;
    v5 = a3;
    -[NFUnfairLock lock](lock, "lock");
    -[NFMultiDelegate children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    -[NFUnfairLock unlock](self->_lock, "unlock");
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NFUnfairLock lock](self->_lock, "lock");
  -[NFMultiDelegate children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NFUnfairLock unlock](self->_lock, "unlock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if (v12)
        {
          objc_msgSend(v4, "selector", (_QWORD)v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v4, "invokeWithTarget:", v12);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)NFMultiDelegate;
  -[NFMultiDelegate methodSignatureForSelector:](&v21, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[NFUnfairLock lock](self->_lock, "lock");
    -[NFMultiDelegate children](self, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    -[NFUnfairLock unlock](self->_lock, "unlock");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
          if (v14)
          {
            objc_msgSend(v14, "methodSignatureForSelector:", a3, (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v6 = v15;
              goto LABEL_14;
            }
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_14:

  }
  return v6;
}

- (NSHashTable)children
{
  return self->_children;
}

- (NFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4
{
  return -[NFMultiDelegate initWithDelegate:delegateProtocol:options:](self, "initWithDelegate:delegateProtocol:options:", a3, a4, 0);
}

- (void)removeDelegate:(id)a3
{
  NFUnfairLock *lock;
  id v5;
  void *v6;

  if (a3)
  {
    lock = self->_lock;
    v5 = a3;
    -[NFUnfairLock lock](lock, "lock");
    -[NFMultiDelegate children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v5);

    -[NFUnfairLock unlock](self->_lock, "unlock");
  }
}

- (void)replaceDelegate:(id)a3 withDelegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 != v6)
  {
    -[NFUnfairLock lock](self->_lock, "lock");
    if (v9)
    {
      -[NFMultiDelegate children](self, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v9);

    }
    if (v6)
    {
      -[NFMultiDelegate children](self, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v6);

    }
    -[NFUnfairLock unlock](self->_lock, "unlock");
  }

}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NFMultiDelegate;
  if (-[NFMultiDelegate conformsToProtocol:](&v8, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else if (v4)
  {
    -[NFMultiDelegate delegateProtocol](self, "delegateProtocol");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6 == v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)NFMultiDelegate;
  if (-[NFMultiDelegate respondsToSelector:](&v17, sel_respondsToSelector_))
    return 1;
  -[NFUnfairLock lock](self->_lock, "lock");
  -[NFMultiDelegate children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NFUnfairLock unlock](self->_lock, "unlock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        if (*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v4 = 1;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v4 = 0;
LABEL_14:

  return v4;
}

- (Protocol)delegateProtocol
{
  return self->_delegateProtocol;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_delegateProtocol, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
