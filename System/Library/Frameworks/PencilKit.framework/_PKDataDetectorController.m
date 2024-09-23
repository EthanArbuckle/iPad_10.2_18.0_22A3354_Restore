@implementation _PKDataDetectorController

- (_PKDataDetectorController)init
{
  _PKDataDetectorController *v2;
  uint64_t v3;
  NSMutableSet *currentDataDetectorItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PKDataDetectorController;
  v2 = -[_PKDataDetectorController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    currentDataDetectorItems = v2->_currentDataDetectorItems;
    v2->_currentDataDetectorItems = (NSMutableSet *)v3;

  }
  return v2;
}

- (id)hitTest:(CGPoint)a3
{
  double y;
  double x;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_currentDataDetectorItems;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "_hitTest:", x, y, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setDelegate:(id)a3
{
  _PKDataDetectorControllerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (NSArray)currentItems
{
  return (NSArray *)-[NSMutableSet allObjects](self->_currentDataDetectorItems, "allObjects");
}

- (void)_foundDataDetectorItems:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id WeakRetained;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
      v3 = a2;
    else
      v3 = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(*(id *)(a1 + 8), "mutableCopy");
    objc_msgSend(v5, "minusSet:", v4);
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "minusSet:", *(_QWORD *)(a1 + 8));
    if (objc_msgSend(v5, "count"))
    {
      v7 = os_log_create("com.apple.pencilkit", "DataDetectorController");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v32 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "removed items: %lu", buf, 0xCu);
      }

    }
    if (objc_msgSend(v6, "count"))
    {
      v8 = os_log_create("com.apple.pencilkit", "DataDetectorController");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134217984;
        v32 = v9;
        _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_INFO, "added items: %lu", buf, 0xCu);
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setDelegate:", 0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "setDelegate:", a1, (_QWORD)v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 8), "minusSet:", v10);
    objc_msgSend(*(id *)(a1 + 8), "unionSet:", v15);
    if ((objc_msgSend(v15, "count") || objc_msgSend(v10, "count")) && (*(_BYTE *)(a1 + 16) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "_dataDetectorControllerItemsDidChange:", a1);

    }
  }
}

- (id)dataDetectorItemAllItems:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet count](self->_currentDataDetectorItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_currentDataDetectorItems, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_currentDataDetectorItems;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "coreResult", (_QWORD)v15);
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = objc_msgSend(v4, "coreResult");
    if (v13)
    {
      v19 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (_PKDataDetectorControllerDelegate)delegate
{
  return (_PKDataDetectorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDataDetectorItems, 0);
}

@end
