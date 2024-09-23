@implementation _GEOURLManifestListener

- (void)_finish:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  OS_dispatch_source *v6;
  OS_dispatch_source *timeoutTimer;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  v8 = (void *)-[NSMutableArray copy](self->_handlers, "copy");
  -[NSMutableArray removeAllObjects](self->_handlers, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  if (v6)
    dispatch_source_cancel((dispatch_source_t)v6);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "performHandler:", v3, (_QWORD)v17);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest"));

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("GEOPPTTest_ManifestEND"), 0);

  }
}

- (void)waitForManifestWithCallback:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *timeoutTimer;
  NSObject *v18;
  _QWORD v19[6];
  _QWORD v20[3];
  char v21;
  _QWORD block[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = -[NSMutableArray count](self->_handlers, "count");
  -[NSMutableArray addObject:](self->_handlers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
    goto LABEL_11;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("GEOPPTTest_ManifestBEGIN"), 0);

  }
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasActiveTileGroup");

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = v11 ^ 1;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke;
  block[3] = &unk_1E1C03348;
  block[4] = &v23;
  if (waitForManifestWithCallback__once != -1)
  {
    dispatch_once(&waitForManifestWithCallback__once, block);
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v11)
LABEL_7:
    -[_GEOURLManifestListener _finish:](self, "_finish:", 1);
LABEL_8:
  if (*((_BYTE *)v24 + 24))
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openServerConnection");

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke_2;
    v19[3] = &unk_1E1C07E58;
    v19[4] = self;
    v19[5] = v20;
    objc_msgSend(v14, "updateManifest:", v19);

    v15 = MEMORY[0x1E0C80D38];
    v16 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();

    os_unfair_lock_lock_with_options();
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v16;
    v18 = v16;

    os_unfair_lock_unlock(p_lock);
    dispatch_activate(v18);

    _Block_object_dispose(v20, 8);
  }
  _Block_object_dispose(&v23, 8);
LABEL_11:

}

+ (id)sharedListener
{
  if (_MergedGlobals_299 != -1)
    dispatch_once(&_MergedGlobals_299, &__block_literal_global_90_1);
  return (id)qword_1ECDBC728;
}

- (_GEOURLManifestListener)init
{
  _GEOURLManifestListener *v2;
  NSMutableArray *v3;
  NSMutableArray *handlers;
  _GEOURLManifestListener *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_GEOURLManifestListener;
  v2 = -[_GEOURLManifestListener init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    handlers = v2->_handlers;
    v2->_handlers = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
