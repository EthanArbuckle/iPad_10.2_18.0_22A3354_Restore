@implementation _GEOMirroredProgress

- (void)_replaceObservedProgressWith:(id)a3
{
  NSProgress *v4;
  NSProgress *originalProgress;

  v4 = (NSProgress *)a3;
  -[_GEOMirroredProgress _unregisterForKVO](self, "_unregisterForKVO");
  originalProgress = self->_originalProgress;
  self->_originalProgress = v4;

  -[_GEOMirroredProgress _registerForKVO](self, "_registerForKVO");
  -[_GEOMirroredProgress _update](self, "_update");
}

- (void)_unregisterForKVO
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(&unk_1E1E85648, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(&unk_1E1E85648);
        -[NSProgress removeObserver:forKeyPath:context:](self->_originalProgress, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), _ProgressMirrorObserverContext);
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E1E85648, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)_registerForKVO
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(&unk_1E1E85648, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(&unk_1E1E85648);
        -[NSProgress addObserver:forKeyPath:options:context:](self->_originalProgress, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, _ProgressMirrorObserverContext);
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E1E85648, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)_update
{
  _GEOMirroredProgress *v3;
  uint64_t v4;
  _BOOL4 v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  if (-[NSProgress isCancelled](self->_originalProgress, "isCancelled"))
  {
    -[_GEOMirroredProgress cancel](self, "cancel");
  }
  else
  {
    if (-[NSProgress isIndeterminate](self->_originalProgress, "isIndeterminate"))
    {
      -[_GEOMirroredProgress setTotalUnitCount:](self, "setTotalUnitCount:", -1);
      v3 = self;
      v4 = -1;
    }
    else
    {
      v5 = -[NSProgress isFinished](self->_originalProgress, "isFinished");
      -[_GEOMirroredProgress setTotalUnitCount:](self, "setTotalUnitCount:", 100);
      if (v5)
      {
        v4 = -[_GEOMirroredProgress totalUnitCount](self, "totalUnitCount");
      }
      else
      {
        -[NSProgress fractionCompleted](self->_originalProgress, "fractionCompleted");
        v4 = (uint64_t)(v6 * 100.0);
      }
      v3 = self;
    }
    -[_GEOMirroredProgress setCompletedUnitCount:](v3, "setCompletedUnitCount:", v4);
  }
  -[_GEOMirroredProgress kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress kind](self->_originalProgress, "kind");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

    goto LABEL_14;
  }
  v9 = (void *)v8;
  -[_GEOMirroredProgress kind](self, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress kind](self->_originalProgress, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    -[NSProgress kind](self->_originalProgress, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GEOMirroredProgress setKind:](self, "setKind:", v7);
LABEL_14:

  }
  -[NSProgress userInfo](self->_originalProgress, "userInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NSProgress _geo_setUserInfo:](self, "_geo_setUserInfo:", v13);

}

- (_GEOMirroredProgress)initWithMirroredProgress:(id)a3
{
  _GEOMirroredProgress *v3;
  _GEOMirroredProgress *v4;

  v3 = -[_GEOMirroredProgress _initWithMirroredProgressForSubclasses:](self, "_initWithMirroredProgressForSubclasses:", a3);
  v4 = v3;
  if (v3)
  {
    -[_GEOMirroredProgress _registerForKVO](v3, "_registerForKVO");
    -[_GEOMirroredProgress _update](v4, "_update");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[_GEOMirroredProgress _unregisterForKVO](self, "_unregisterForKVO");
  v3.receiver = self;
  v3.super_class = (Class)_GEOMirroredProgress;
  -[_GEOMirroredProgress dealloc](&v3, sel_dealloc);
}

- (id)_initWithMirroredProgressForSubclasses:(id)a3
{
  id v5;
  _GEOMirroredProgress *v6;
  _GEOMirroredProgress *v7;
  _GEOMirroredProgress *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)_GEOMirroredProgress;
    v6 = -[_GEOMirroredProgress initWithParent:userInfo:](&v10, sel_initWithParent_userInfo_, 0, 0);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_originalProgress, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalProgress, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)_ProgressMirrorObserverContext == a6)
  {
    -[_GEOMirroredProgress _update](self, "_update", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_GEOMirroredProgress;
    -[_GEOMirroredProgress observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end
