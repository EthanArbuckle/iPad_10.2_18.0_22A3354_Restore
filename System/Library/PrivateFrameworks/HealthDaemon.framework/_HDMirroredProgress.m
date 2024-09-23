@implementation _HDMirroredProgress

- (void)_update
{
  void *v2;
  uint64_t v3;
  double v4;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if (objc_msgSend(*(id *)(a1 + 120), "isCancelled"))
    {
      objc_msgSend((id)a1, "cancel");
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 120), "isIndeterminate"))
      {
        objc_msgSend((id)a1, "setTotalUnitCount:", -1);
        v2 = (void *)a1;
        v3 = -1;
      }
      else
      {
        objc_msgSend((id)a1, "setTotalUnitCount:", 100000);
        objc_msgSend(*(id *)(a1 + 120), "fractionCompleted");
        v3 = (uint64_t)(v4 * 100000.0);
        v2 = (void *)a1;
      }
      objc_msgSend(v2, "setCompletedUnitCount:", v3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    +[_HDMirroredProgress _KVOKeyPaths]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[NSProgress removeObserver:forKeyPath:context:](self->_originalProgress, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), _HDProgressMirrorObserverContext);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  v8.receiver = self;
  v8.super_class = (Class)_HDMirroredProgress;
  -[_HDMirroredProgress dealloc](&v8, sel_dealloc);
}

+ (id)_KVOKeyPaths
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  NSStringFromSelector(sel_fractionCompleted);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  NSStringFromSelector(sel_isIndeterminate);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  NSStringFromSelector(sel_isCancelled);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)_HDProgressMirrorObserverContext == a6)
  {
    -[_HDMirroredProgress _update]((uint64_t)self);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_HDMirroredProgress;
    -[_HDMirroredProgress observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalProgress, 0);
}

@end
