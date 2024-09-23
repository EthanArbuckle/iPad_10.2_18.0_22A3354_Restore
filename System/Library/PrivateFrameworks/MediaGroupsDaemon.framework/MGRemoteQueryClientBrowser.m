@implementation MGRemoteQueryClientBrowser

- (MGRemoteQueryClientBrowser)initWithDelegate:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;
  MGRemoteQueryClientBrowser *v8;
  MGRemoteQueryClientBrowser *v9;
  uint64_t v10;
  NSSet *knownTargets;
  void *v12;
  uint64_t v13;
  NSSet *updatedTargets;
  NSError *error;
  NSObject *v16;
  _QWORD block[4];
  MGRemoteQueryClientBrowser *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MGRemoteQueryClientBrowser;
  v8 = -[MGRemoteQueryClientBrowser init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    knownTargets = v9->_knownTargets;
    v9->_knownTargets = (NSSet *)v10;

    -[MGRemoteQueryClientBrowser knownTargets](v9, "knownTargets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    updatedTargets = v9->_updatedTargets;
    v9->_updatedTargets = (NSSet *)v13;

    v9->_invalidated = 0;
    error = v9->_error;
    v9->_error = 0;

    -[MGRemoteQueryClientBrowser dispatchQueue](v9, "dispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__MGRemoteQueryClientBrowser_initWithDelegate_dispatchQueue___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v19 = v9;
    dispatch_async(v16, block);

  }
  return v9;
}

uint64_t __61__MGRemoteQueryClientBrowser_initWithDelegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowsing");
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryClientBrowser _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryClientBrowser;
  -[MGRemoteQueryClientBrowser dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientBrowser knownTargets](self, "knownTargets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientBrowser browser](self, "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MGRemoteQueryClientBrowser invalidated](self, "invalidated");
  v9 = 78;
  if (v8)
    v9 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _targets = %@, _browser = %@, _invalidated = %c>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_startBrowsing
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *descriptor;
  uint8_t buf[4];
  MGRemoteQueryClientBrowser *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientBrowser browser](self, "browser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryClientBrowser browser](self, "browser");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p browser already browsing %@", buf, 0x16u);

    }
LABEL_7:

    return;
  }
  if (-[MGRemoteQueryClientBrowser invalidated](self, "invalidated"))
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v12 = self;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p browser invalidated, not starting", buf, 0xCu);
    }
    goto LABEL_7;
  }
  -[MGRemoteQueryClientBrowser _prepareBrowseDescriptor](self, "_prepareBrowseDescriptor");
  descriptor = objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientBrowser _prepareBrowseParameters](self, "_prepareBrowseParameters");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = nw_browser_create(descriptor, v7);
  -[MGRemoteQueryClientBrowser setBrowser:](self, "setBrowser:", v8);
  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  nw_browser_set_queue(v8, v9);

  -[MGRemoteQueryClientBrowser _prepareBrowserHandlers](self, "_prepareBrowserHandlers");
  nw_browser_start(v8);

}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  MGRemoteQueryClientBrowser *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!-[MGRemoteQueryClientBrowser invalidated](self, "invalidated"))
  {
    MGLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p browser invalidating", buf, 0xCu);
    }

    -[MGRemoteQueryClientBrowser setInvalidated:](self, "setInvalidated:", 1);
    -[MGRemoteQueryClientBrowser browser](self, "browser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClientBrowser setBrowser:](self, "setBrowser:", 0);
    -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__MGRemoteQueryClientBrowser__invalidate__block_invoke;
      block[3] = &unk_24E0AA4F8;
      v7 = v4;
      dispatch_async(v5, block);

    }
    else
    {
      -[MGRemoteQueryClientBrowser _invalidated](self, "_invalidated");
    }

  }
}

void __41__MGRemoteQueryClientBrowser__invalidate__block_invoke(uint64_t a1)
{
  nw_browser_cancel(*(nw_browser_t *)(a1 + 32));
}

- (void)_invalidated
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  MGRemoteQueryClientBrowser *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  MGLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p browser invalidated", buf, 0xCu);
  }

  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__MGRemoteQueryClientBrowser__invalidated__block_invoke;
  block[3] = &unk_24E0AA4F8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __42__MGRemoteQueryClientBrowser__invalidated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browser:invalidatedWithError:", v2, v3);

  }
}

- (id)_prepareBrowseDescriptor
{
  NSObject *v2;
  NSObject *bonjour_service;

  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  bonjour_service = nw_browse_descriptor_create_bonjour_service((const char *)objc_msgSend(CFSTR("_mediagroups._tcp"), "UTF8String"), (const char *)objc_msgSend(CFSTR("local."), "UTF8String"));
  nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
  return bonjour_service;
}

- (id)_prepareBrowseParameters
{
  NSObject *v2;
  NSObject *v3;

  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = nw_parameters_create();
  nw_parameters_prohibit_interface_type(v3, nw_interface_type_cellular);
  nw_parameters_prohibit_interface_type(v3, nw_interface_type_loopback);
  nw_parameters_set_include_peer_to_peer(v3, 0);
  return v3;
}

- (void)_prepareBrowserHandlers
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD state_changed_handler[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  id location;

  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  -[MGRemoteQueryClientBrowser browser](self, "browser");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v12[5];
  v5 = MEMORY[0x24BDAC760];
  state_changed_handler[0] = MEMORY[0x24BDAC760];
  state_changed_handler[1] = 3221225472;
  state_changed_handler[2] = __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke;
  state_changed_handler[3] = &unk_24E0AA520;
  objc_copyWeak(&v10, &location);
  state_changed_handler[4] = &v11;
  nw_browser_set_state_changed_handler(v4, state_changed_handler);
  v6 = v12[5];
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke_8;
  v7[3] = &unk_24E0AA548;
  objc_copyWeak(&v8, &location);
  nw_browser_set_browse_results_changed_handler(v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);

  objc_destroyWeak(&location);
}

void __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  CFErrorRef v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a2 == 3)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    objc_msgSend(v7, "_invalidated");
  }
  else if (a2 == 2 && WeakRetained)
  {
    MGLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218242;
      v13 = v7;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p browser failed, error %@", (uint8_t *)&v12, 0x16u);
    }

    v9 = nw_error_copy_cf_error(v5);
    objc_msgSend(v7, "setError:", v9);
    objc_msgSend(v7, "_invalidate");

  }
}

void __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke_8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  nw_browse_result_change_t changes;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  nw_browse_result_change_t v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "invalidated") & 1) == 0)
  {
    changes = nw_browse_result_get_changes(v7, v8);
    if ((changes & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v10, "_targetForBrowseResult:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_targetForBrowseResult:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v12 | v13;
      if (v12 | v13)
      {
        v15 = (void *)v13;
        if (((objc_msgSend((id)v12, "isEqual:", v13) ^ 1) & 1) != 0)
          goto LABEL_13;
LABEL_9:
        if (!(_DWORD)a4)
        {
          MGLogForCategory(6);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = 134219266;
            v18 = v10;
            v19 = 2048;
            v20 = changes;
            v21 = 2112;
            v22 = v7;
            v23 = 2112;
            v24 = v8;
            v25 = 2112;
            v26 = v12;
            v27 = 2112;
            v28 = v15;
            _os_log_debug_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_DEBUG, "%p browser disregarding inconsequential change %llu from %@ to %@ for %@ to %@", (uint8_t *)&v17, 0x3Eu);
          }

          goto LABEL_14;
        }
LABEL_13:
        objc_msgSend(v10, "_handleBrowseChangeFromTarget:toTarget:applyBatch:", v12, v15, a4);
LABEL_14:

        goto LABEL_15;
      }
    }
    v12 = 0;
    v15 = 0;
    if ((v14 & 1) != 0)
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_15:

}

- (void)_handleBrowseChangeFromTarget:(id)a3 toTarget:(id)a4 applyBatch:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  MGRemoteQueryClientBrowser *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[MGRemoteQueryClientBrowser updatedTargets](self, "updatedTargets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v8)
  {
    MGLogForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134218242;
      v16 = self;
      v17 = 2112;
      v18 = v8;
      _os_log_debug_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_DEBUG, "%p browser losing target %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v12, "removeObject:", v8);
  }
  if (v9)
  {
    MGLogForCategory(6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134218242;
      v16 = self;
      v17 = 2112;
      v18 = v9;
      _os_log_debug_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_DEBUG, "%p browser adding target %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v12, "addObject:", v9);
  }
  -[MGRemoteQueryClientBrowser setUpdatedTargets:](self, "setUpdatedTargets:", v12);
  if (v5)
    -[MGRemoteQueryClientBrowser _applyUpdates](self, "_applyUpdates");

}

- (void)_applyUpdates
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  MGRemoteQueryClientBrowser *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientBrowser knownTargets](self, "knownTargets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientBrowser updatedTargets](self, "updatedTargets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToSet:", v5) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v5, "copy");
    -[MGRemoteQueryClientBrowser setKnownTargets:](self, "setKnownTargets:", v6);

    -[MGRemoteQueryClientBrowser delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "minusSet:", v4);
      v9 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v9, "minusSet:", v5);
      MGLogForCategory(6);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v32 = self;
        v33 = 2048;
        v34 = objc_msgSend(v8, "count");
        v35 = 2048;
        v36 = objc_msgSend(v9, "count");
        v37 = 2048;
        v38 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p browser updated, found(%lu) lost(%lu) now(%lu)", buf, 0x2Au);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v7, "browser:foundTarget:", self, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v13);
      }

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v16 = v9;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v22;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v22 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v7, "browser:lostTarget:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), (_QWORD)v21);
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v18);
      }

    }
  }

}

- (id)_targetForBrowseResult:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  nw_txt_record_t v8;
  nw_txt_record_t v9;
  _QWORD enumerator[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  MGRemoteQueryClientBrowser *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientBrowser dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4 && nw_browse_result_get_interfaces_count(v4))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    enumerator[0] = MEMORY[0x24BDAC760];
    enumerator[1] = 3221225472;
    enumerator[2] = __53__MGRemoteQueryClientBrowser__targetForBrowseResult___block_invoke;
    enumerator[3] = &unk_24E0AA570;
    enumerator[4] = &v12;
    nw_browse_result_enumerate_interfaces(v4, enumerator);
    if (*((_BYTE *)v13 + 24))
    {
      MGLogForCategory(6);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v17 = self;
        v18 = 2112;
        v19 = v4;
        _os_log_debug_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEBUG, "%p browser ignoring loopback result %@", buf, 0x16u);
      }
      v7 = 0;
    }
    else
    {
      v6 = nw_browse_result_copy_endpoint(v4);
      v8 = nw_browse_result_copy_txt_record_object(v4);
      v9 = v8;
      v7 = 0;
      if (v6 && v8)
      {
        +[MGRemoteQueryClientTarget targetWithEndpoint:txtRecord:](MGRemoteQueryClientTarget, "targetWithEndpoint:txtRecord:", v6, v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __53__MGRemoteQueryClientBrowser__targetForBrowseResult___block_invoke(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type;

  type = nw_interface_get_type(interface);
  if (type == nw_interface_type_loopback)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return type != nw_interface_type_loopback;
}

- (MGRemoteQueryClientBrowserDelegate)delegate
{
  return (MGRemoteQueryClientBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (NSSet)knownTargets
{
  return self->_knownTargets;
}

- (void)setKnownTargets:(id)a3
{
  objc_storeStrong((id *)&self->_knownTargets, a3);
}

- (NSSet)updatedTargets
{
  return self->_updatedTargets;
}

- (void)setUpdatedTargets:(id)a3
{
  objc_storeStrong((id *)&self->_updatedTargets, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updatedTargets, 0);
  objc_storeStrong((id *)&self->_knownTargets, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
