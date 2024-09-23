@implementation _GEOAggregateProgress

- (_GEOAggregateProgress)initWithParent:(id)a3 userInfo:(id)a4
{
  _GEOAggregateProgress *v4;
  _GEOAggregateProgress *v5;
  _GEOAggregateProgress *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GEOAggregateProgress;
  v4 = -[_GEOAggregateProgress initWithParent:userInfo:](&v8, sel_initWithParent_userInfo_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = v4;
  }

  return v5;
}

- (_GEOAggregateProgress)initWithTotalUnitCount:(int64_t)a3
{
  _GEOAggregateProgress *v4;
  _GEOAggregateProgress *v5;
  _GEOAggregateProgress *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GEOAggregateProgress;
  v4 = -[_GEOAggregateProgress initWithParent:userInfo:](&v8, sel_initWithParent_userInfo_, 0, 0);
  v5 = v4;
  if (v4)
  {
    -[_GEOAggregateProgress setTotalUnitCount:](v4, "setTotalUnitCount:", a3);
    v5->_lock._os_unfair_lock_opaque = 0;
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *obj;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_observedChildren;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = objc_msgSend(&unk_1E1E85630, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(&unk_1E1E85630);
              objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), _AggregationObserverContext);
            }
            while (v9 != v11);
            v9 = objc_msgSend(&unk_1E1E85630, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v9);
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v13.receiver = self;
  v13.super_class = (Class)_GEOAggregateProgress;
  -[_GEOAggregateProgress dealloc](&v13, sel_dealloc);
}

- (void)addChild:(id)a3 withPendingUnitCount:(int64_t)a4
{
  id v6;
  NSMutableArray *observedChildren;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_GEOAggregateProgress;
  -[_GEOAggregateProgress addChild:withPendingUnitCount:](&v18, sel_addChild_withPendingUnitCount_, v6, a4);
  os_unfair_lock_lock_with_options();
  observedChildren = self->_observedChildren;
  if (!observedChildren)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_observedChildren;
    self->_observedChildren = v8;

    observedChildren = self->_observedChildren;
  }
  -[NSMutableArray addObject:](observedChildren, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = objc_msgSend(&unk_1E1E85630, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(&unk_1E1E85630);
        objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 0, _AggregationObserverContext);
      }
      v11 = objc_msgSend(&unk_1E1E85630, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }
  -[_GEOAggregateProgress _update](self, "_update");

}

- (BOOL)isIndeterminate
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_observedChildren, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_observedChildren;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isIndeterminate", (_QWORD)v11))
          {
            v9 = 0;
            goto LABEL_12;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_12:

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
  return v9;
}

- (void)_update
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *observedChildren;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[12];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_observedChildren, "count"))
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 1;
    *(_QWORD *)buf = 0;
    v44 = buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__48;
    v47 = __Block_byref_object_dispose__48;
    v48 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__48;
    v37 = __Block_byref_object_dispose__48;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__48;
    v31 = __Block_byref_object_dispose__48;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__48;
    v25 = __Block_byref_object_dispose__48;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__48;
    v19 = __Block_byref_object_dispose__48;
    v20 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__48;
    v13 = __Block_byref_object_dispose__48;
    v14 = 0;
    observedChildren = self->_observedChildren;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32___GEOAggregateProgress__update__block_invoke;
    v8[3] = &unk_1E1C0C970;
    v8[4] = buf;
    v8[5] = &v49;
    v8[6] = &v33;
    v8[7] = &v39;
    v8[8] = &v27;
    v8[9] = &v21;
    v8[10] = &v15;
    v8[11] = &v9;
    -[NSMutableArray enumerateObjectsUsingBlock:](observedChildren, "enumerateObjectsUsingBlock:", v8);
    os_unfair_lock_unlock(p_lock);
    if (*((_BYTE *)v50 + 24))
      v5 = *((_QWORD *)v44 + 5);
    else
      v5 = 0;
    -[_GEOAggregateProgress setKind:](self, "setKind:", v5);
    if (*((_BYTE *)v50 + 24) && objc_msgSend(*((id *)v44 + 5), "isEqualToString:", *MEMORY[0x1E0CB30F8]))
    {
      if (*((_BYTE *)v40 + 24))
        v6 = v34[5];
      else
        v6 = 0;
      -[_GEOAggregateProgress setFileOperationKind:](self, "setFileOperationKind:", v6);
      -[_GEOAggregateProgress setFileTotalCount:](self, "setFileTotalCount:", v28[5]);
      -[_GEOAggregateProgress setFileCompletedCount:](self, "setFileCompletedCount:", v22[5]);
      -[_GEOAggregateProgress setByteTotalCount:](self, "setByteTotalCount:", v16[5]);
      v7 = v10[5];
    }
    else
    {
      -[_GEOAggregateProgress setFileOperationKind:](self, "setFileOperationKind:", 0);
      -[_GEOAggregateProgress setFileTotalCount:](self, "setFileTotalCount:", 0);
      -[_GEOAggregateProgress setFileCompletedCount:](self, "setFileCompletedCount:", 0);
      -[_GEOAggregateProgress setByteTotalCount:](self, "setByteTotalCount:", 0);
      v7 = 0;
    }
    -[_GEOAggregateProgress setByteCompletedCount:](self, "setByteCompletedCount:", v7);
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v49, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _observedChildren.count > 0", buf, 2u);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)_AggregationObserverContext == a6)
  {
    -[_GEOAggregateProgress _update](self, "_update", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_GEOAggregateProgress;
    -[_GEOAggregateProgress observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedChildren, 0);
}

@end
