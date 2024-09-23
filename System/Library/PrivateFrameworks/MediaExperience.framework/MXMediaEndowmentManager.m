@implementation MXMediaEndowmentManager

uint64_t __44__MXMediaEndowmentManager_refreshAssertions__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v33;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v18 = v2;
        v3 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v2);
        if (objc_msgSend(v3, "isPlaying"))
        {
          v4 = objc_msgSend((id)objc_msgSend(v3, "clientPID"), "unsignedIntValue");
          if ((_DWORD)v4)
          {
            v5 = v4;
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v19 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
            v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v22)
            {
              v20 = *(_QWORD *)v29;
              do
              {
                v6 = 0;
                do
                {
                  if (*(_QWORD *)v29 != v20)
                    objc_enumerationMutation(v19);
                  v23 = v6;
                  v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v6);
                  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v7);
                  v24 = 0u;
                  v25 = 0u;
                  v26 = 0u;
                  v27 = 0u;
                  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                  if (v9)
                  {
                    v10 = v9;
                    v11 = *(_QWORD *)v25;
                    do
                    {
                      for (i = 0; i != v10; ++i)
                      {
                        if (*(_QWORD *)v25 != v11)
                          objc_enumerationMutation(v8);
                        v13 = (void *)objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
                        if (objc_msgSend(v13, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5))&& objc_msgSend(v3, "isPlaying"))
                        {
                          objc_msgSend(v1, "addObject:", v7);
                          objc_msgSend(v1, "addObjectsFromArray:", objc_msgSend(v13, "allObjects"));
                        }
                      }
                      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                    }
                    while (v10);
                  }
                  v6 = v23 + 1;
                }
                while (v23 + 1 != v22);
                v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
              }
              while (v22);
            }
          }
        }
        v2 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v17);
  }

  return objc_msgSend(*(id *)(a1 + 32), "refreshDomainAssertions:currentlyActivePIDs:", CFSTR("MediaPlayback"), v1);
}

- (void)refreshDomainAssertions:(id)a3 currentlyActivePIDs:(id)a4
{
  NSMutableDictionary *mMediaPlaybackAssertions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  NSObject *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  os_log_type_t type;
  os_log_type_t v48[4];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  int v56;
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MediaPlayback")))
  {
    mMediaPlaybackAssertions = self->mMediaPlaybackAssertions;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v51 != v9)
            objc_enumerationMutation(a4);
          v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (!-[NSMutableDictionary objectForKey:](mMediaPlaybackAssertions, "objectForKey:", v11, v33, v35))
          {
            v49 = 0;
            v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{originator:\"com.apple.mediaexperience\", clientPID:%@ DomainName:%@}"), v11, a3);
            v13 = objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.mediaexperience"), a3);
            v14 = objc_alloc(MEMORY[0x1E0D87C98]);
            v15 = objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", objc_msgSend(v11, "unsignedIntValue"));
            v62 = v13;
            v16 = (void *)objc_msgSend(v14, "initWithExplanation:target:attributes:", v12, v15, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1));
            if (objc_msgSend(v16, "acquireWithError:", &v49))
            {
              if (dword_1EE2B3F60)
              {
                *(_DWORD *)v48 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              -[NSMutableDictionary setObject:forKey:](mMediaPlaybackAssertions, "setObject:forKey:", v16, v11, v33, v35);
            }
            else
            {
              *(_DWORD *)v48 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }

          }
        }
        v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v8);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMediaPlaybackAssertions, "countByEnumeratingWithState:objects:count:", &v43, v55, 16, v33, v35);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(mMediaPlaybackAssertions);
          v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_msgSend(a4, "containsObject:", v23) & 1) == 0)
            objc_msgSend(obj, "addObject:", v23);
        }
        v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMediaPlaybackAssertions, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v20);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
          objc_msgSend((id)-[NSMutableDictionary objectForKey:](mMediaPlaybackAssertions, "objectForKey:", v28), "invalidate");
          if (dword_1EE2B3F60)
          {
            LODWORD(v49) = 0;
            v48[0] = OS_LOG_TYPE_DEFAULT;
            v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v30 = v49;
            if (os_log_type_enabled(v29, v48[0]))
              v31 = v30;
            else
              v31 = v30 & 0xFFFFFFFE;
            if (v31)
            {
              v56 = 136315650;
              v57 = "-[MXMediaEndowmentManager refreshDomainAssertions:currentlyActivePIDs:]";
              v58 = 2114;
              v59 = a3;
              v60 = 2114;
              v61 = v28;
              LODWORD(v36) = 32;
              v34 = &v56;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[NSMutableDictionary removeObjectForKey:](mMediaPlaybackAssertions, "removeObjectForKey:", v28, v34, v36);
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
      }
      while (v25);
    }
  }
  else
  {
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)processStateUpdateHandler:(id)a3 process:(id)a4 update:(id)a5
{
  int v6;
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "previousState", a3), "endowmentNamespaces"), "containsObject:", CFSTR("com.apple.mediaexperience.session-Media"));
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "state"), "endowmentNamespaces"), "containsObject:", CFSTR("com.apple.mediaexperience.session-Media"));
  if (v6)
  {
    if ((v7 & 1) != 0)
      return;
    if (!dword_1EE2B3F60)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (!v7)
    return;
  if (dword_1EE2B3F60)
  {
LABEL_7:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_8:
  -[MXMediaEndowmentManager handleEndowmentTreeUpdate](+[MXMediaEndowmentManager sharedInstance](MXMediaEndowmentManager, "sharedInstance", v9, v10), "handleEndowmentTreeUpdate");
}

uint64_t __31__MXMediaEndowmentManager_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return -[MXMediaEndowmentManager processStateUpdateHandler:process:update:](+[MXMediaEndowmentManager sharedInstance](MXMediaEndowmentManager, "sharedInstance"), "processStateUpdateHandler:process:update:", a2, a3, a4);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_sSharedInstance_1;
}

- (void)refreshAssertions
{
  NSObject *mSerialQueue;
  _QWORD v3[5];

  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MXMediaEndowmentManager_refreshAssertions__block_invoke;
  v3[3] = &unk_1E3099900;
  v3[4] = self;
  MXDispatchAsync((uint64_t)"-[MXMediaEndowmentManager refreshAssertions]", (uint64_t)"MX_MediaEndowmentManager.m", 658, 0, 0, mSerialQueue, (uint64_t)v3);
}

uint64_t __52__MXMediaEndowmentManager_getRecordingAttributions___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  v15 = result;
  if (result)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v3);
        v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v4);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v17;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v17 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
              v11 = (void *)objc_msgSend(v5, "objectForKey:", v10);
              if (objc_msgSend(v11, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48))))
              {
                v12 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v4), "objectForKey:", v10);
                if (v12)
                  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v7);
        }
        ++v3;
      }
      while (v3 != v15);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v15 = result;
    }
    while (result);
  }
  return result;
}

- (id)getRecordingAttributions:(int)a3
{
  id v5;
  NSObject *mSerialQueue;
  _QWORD v8[6];
  int v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  mSerialQueue = self->mSerialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__MXMediaEndowmentManager_getRecordingAttributions___block_invoke;
  v8[3] = &unk_1E3099978;
  v9 = a3;
  v8[4] = self;
  v8[5] = v5;
  MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager getRecordingAttributions:]", (uint64_t)"MX_MediaEndowmentManager.m", 497, 0, 0, mSerialQueue, (uint64_t)v8);
  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }
  return v5;
}

MXMediaEndowmentManager *__41__MXMediaEndowmentManager_sharedInstance__block_invoke()
{
  MXMediaEndowmentManager *result;

  result = objc_alloc_init(MXMediaEndowmentManager);
  sharedInstance_sSharedInstance_1 = (uint64_t)result;
  return result;
}

- (MXMediaEndowmentManager)init
{
  MXMediaEndowmentManager *v2;
  NSObject *v3;
  RBSProcessMonitor *v4;
  RBSProcessMonitor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXMediaEndowmentManager;
  v2 = -[MXMediaEndowmentManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->mSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.MediaEndowmentManager", v3);
    v2->mEndowments = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->mEndowmentPayloads = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->mEndowmentTrees = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->mMediaPlaybackAssertions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (RBSProcessMonitor *)objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", &__block_literal_global_5);
    v2->mProcessMonitor = v4;
    v5 = v4;
  }
  return v2;
}

uint64_t __31__MXMediaEndowmentManager_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  Class v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  objc_msgSend(v3, "setEndowmentNamespaces:", &unk_1E30C13E0);
  objc_msgSend(a2, "setStateDescriptor:", v3);
  v4 = NSClassFromString(CFSTR("RBSProcessEverythingPredicate"));
  v6[0] = -[objc_class performSelector:](v4, "performSelector:", NSSelectorFromString(CFSTR("everythingPredicate")));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
  return objc_msgSend(a2, "setUpdateHandler:", &__block_literal_global_14);
}

- (void)dealloc
{
  NSObject *mSerialQueue;
  NSMutableDictionary *mEndowments;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableDictionary *mMediaPlaybackAssertions;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  mSerialQueue = self->mSerialQueue;
  if (mSerialQueue)
  {
    dispatch_release(mSerialQueue);
    self->mSerialQueue = 0;
  }
  -[RBSProcessMonitor invalidate](self->mProcessMonitor, "invalidate");

  self->mProcessMonitor = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  mEndowments = self->mEndowments;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mEndowments, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(mEndowments);
        v9 = (void *)-[NSMutableDictionary objectForKey:](self->mEndowments, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend((id)objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j)), "invalidate");
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          }
          while (v11);
        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mEndowments, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }

  self->mEndowments = 0;
  self->mEndowmentPayloads = 0;

  self->mEndowmentTrees = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  mMediaPlaybackAssertions = self->mMediaPlaybackAssertions;
  v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMediaPlaybackAssertions, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(mMediaPlaybackAssertions);
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mMediaPlaybackAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k)), "invalidate");
      }
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMediaPlaybackAssertions, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }

  self->mMediaPlaybackAssertions = 0;
  v19.receiver = self;
  v19.super_class = (Class)MXMediaEndowmentManager;
  -[MXMediaEndowmentManager dealloc](&v19, sel_dealloc);
}

- (void)iterateEndowmentTree:(id)a3 rootPID:(id)a4 environment:(id)a5 endowmentLinks:(id)a6
{
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
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
          objc_enumerationMutation(a6);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mEndowmentTrees, "objectForKey:", a4), "objectForKey:", a5);
        objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "targetPid")));
        -[MXMediaEndowmentManager iterateEndowmentTree:rootPID:environment:endowmentLinks:](self, "iterateEndowmentTree:rootPID:environment:endowmentLinks:", a3, a4, a5, objc_msgSend(a3, "childrenLinks:", v14));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
}

- (void)refreshEndowmentTrees
{
  NSObject *mSerialQueue;
  _QWORD v3[5];

  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__MXMediaEndowmentManager_refreshEndowmentTrees__block_invoke;
  v3[3] = &unk_1E3099900;
  v3[4] = self;
  MXDispatchAsync((uint64_t)"-[MXMediaEndowmentManager refreshEndowmentTrees]", (uint64_t)"MX_MediaEndowmentManager.m", 277, 0, 0, mSerialQueue, (uint64_t)v3);
}

uint64_t __48__MXMediaEndowmentManager_refreshEndowmentTrees__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v23;
  uint64_t v24;
  void *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0D87CF0], "endowmentTreeForNamespace:", CFSTR("com.apple.mediaexperience.session-Media"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (void *)objc_msgSend(v2, "rootLinks");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "targetPid"));
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v8))
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v8);
        v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v8);
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E20], "set"), objc_msgSend(v7, "targetEnvironment"));
        objc_msgSend(*(id *)(a1 + 32), "iterateEndowmentTree:rootPID:environment:endowmentLinks:", v2, v8, objc_msgSend(v7, "targetEnvironment"), objc_msgSend(v2, "childrenLinks:", v7));
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v4);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v15))
        {
          v16 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v15);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v27;
            do
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v27 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend((id)objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k)), "invalidate");
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            }
            while (v18);
          }
          if (dword_1EE2B3F60)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v15, v23, v24);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v12);
  }
  return objc_msgSend(*(id *)(a1 + 32), "storeMediaEndowments");
}

- (void)handleEndowmentTreeUpdate
{
  -[MXMediaEndowmentManager refreshEndowmentTrees](self, "refreshEndowmentTrees");
  -[MXMediaEndowmentManager refreshAssertions](self, "refreshAssertions");
}

- (int)grantMediaEndowment:(int)a3 environmentID:(id)a4 endowmentPayload:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  NSObject *mSerialQueue;
  int v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v16[9];
  int v17;
  os_log_type_t type;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v9 = objc_msgSend(a5, "objectForKey:", CFSTR("AuditToken"));
  v10 = objc_msgSend(a5, "objectForKey:", CFSTR("BundleID"));
  objc_msgSend(a5, "objectForKey:", CFSTR("RecordingWebsite"));
  if (a3 && a4 && (v9 ? (v11 = v10 == 0) : (v11 = 1), !v11))
  {
    mSerialQueue = self->mSerialQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__MXMediaEndowmentManager_grantMediaEndowment_environmentID_endowmentPayload___block_invoke;
    v16[3] = &unk_1E3099928;
    v17 = a3;
    v16[4] = self;
    v16[5] = a4;
    v16[7] = v10;
    v16[8] = &v20;
    v16[6] = a5;
    MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager grantMediaEndowment:environmentID:endowmentPayload:]", (uint64_t)"MX_MediaEndowmentManager.m", 368, 0, 0, mSerialQueue, (uint64_t)v16);
    v13 = *((_DWORD *)v21 + 6);
  }
  else
  {
    v19 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v13 = -15681;
  }
  _Block_object_dispose(&v20, 8);
  return v13;
}

void __78__MXMediaEndowmentManager_grantMediaEndowment_environmentID_endowmentPayload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[19];

  v22[18] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2), "objectForKey:", *(_QWORD *)(a1 + 40)))
  {
    if (dword_1EE2B3F60)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2, v17, v19), "objectForKey:", *(_QWORD *)(a1 + 40)), "invalidate");
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v2), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  v4 = objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:environmentIdentifier:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40));
  if (!v4)
    goto LABEL_11;
  v5 = v4;
  v6 = objc_msgSend(MEMORY[0x1E0D87CE8], "grantWithNamespace:endowment:", CFSTR("com.apple.mediaexperience.session-Media"), *(_QWORD *)(a1 + 48));
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 1);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{originator:\"com.apple.mediaexperience\", bundleID:\"%@\" clientPID:%d, environmentID:\"%@\"}"), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40));
  v11 = objc_alloc(MEMORY[0x1E0D87C98]);
  v22[0] = v7;
  v22[1] = v9;
  v12 = (void *)objc_msgSend(v11, "initWithExplanation:target:attributes:", v10, v5, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2));
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend(v12, "acquireWithError:", &v21) & 1) == 0)
    {
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -15687;
    }
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (dword_1EE2B3F60)
      {
        v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2, v18, v20))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v2);
      }
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2), "setObject:forKey:", v13, *(_QWORD *)(a1 + 40));
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v2), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "refreshEndowmentTrees");
    }

  }
  else
  {
LABEL_11:
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -15687;
  }
}

- (int)revokeMediaEndowment:(int)a3 environmentID:(id)a4
{
  NSObject *mSerialQueue;
  int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v8[7];
  int v9;
  os_log_type_t type;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (a3 && a4)
  {
    mSerialQueue = self->mSerialQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__MXMediaEndowmentManager_revokeMediaEndowment_environmentID___block_invoke;
    v8[3] = &unk_1E3099950;
    v9 = a3;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = &v12;
    MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager revokeMediaEndowment:environmentID:]", (uint64_t)"MX_MediaEndowmentManager.m", 462, 0, 0, mSerialQueue, (uint64_t)v8);
    v5 = *((_DWORD *)v13 + 6);
  }
  else
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v5 = -15681;
  }
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __62__MXMediaEndowmentManager_revokeMediaEndowment_environmentID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    if (dword_1EE2B3F60)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2, v7, v8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v2), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v2), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v2);
    }
    return objc_msgSend(*(id *)(a1 + 32), "refreshEndowmentTrees");
  }
  else
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -15685;
  }
  return result;
}

- (void)storeMediaEndowments
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  NSMutableDictionary *obj;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->mEndowments;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = (void *)-[NSMutableDictionary objectForKey:](self->mEndowments, "objectForKey:", v6);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v7, "setObject:forKey:", objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mEndowmentPayloads, "objectForKey:", v6), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }
        objc_msgSend(v15, "setObject:forKey:", v7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6));

      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("mediaEndowments"), v15);

}

- (void)loadMediaEndowments
{
  double v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  os_log_type_t type;
  unsigned int v37;
  int v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "systemUptime");
  if (v2 > 45.0)
  {
    v3 = (void *)MXCFPreferencesCopyPreference(CFSTR("mediaEndowments"));
    v26 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v26, "setNumberStyle:", 1);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v3;
    v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
    if (!v23)
      goto LABEL_27;
    v22 = *(_QWORD *)v33;
    while (1)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v25 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v4);
        v6 = (void *)objc_msgSend(obj, "objectForKey:", v5, v20, v21);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v29 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              v12 = objc_msgSend(v6, "objectForKey:", v11, v20, v21);
              if (-[MXMediaEndowmentManager grantMediaEndowment:environmentID:endowmentPayload:](self, "grantMediaEndowment:environmentID:endowmentPayload:", objc_msgSend((id)objc_msgSend(v26, "numberFromString:", v5), "unsignedIntValue"), v11, v12))
              {
                v37 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v14 = v37;
                if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                  v15 = v14;
                else
                  v15 = v14 & 0xFFFFFFFE;
                if (v15)
                  goto LABEL_22;
              }
              else
              {
                v37 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v17 = v37;
                if (os_log_type_enabled(v16, type))
                  v18 = v17;
                else
                  v18 = v17 & 0xFFFFFFFE;
                if (v18)
                {
LABEL_22:
                  v38 = 136315906;
                  v39 = "-[MXMediaEndowmentManager loadMediaEndowments]";
                  v40 = 2114;
                  v41 = v5;
                  v42 = 2114;
                  v43 = v11;
                  v44 = 2114;
                  v45 = v12;
                  LODWORD(v21) = 42;
                  v20 = &v38;
                  _os_log_send_and_compose_impl();
                }
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
          }
          while (v8);
        }
        v4 = v25 + 1;
      }
      while (v25 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
      if (!v23)
      {
LABEL_27:

        -[MXMediaEndowmentManager refreshEndowmentTrees](self, "refreshEndowmentTrees");
        return;
      }
    }
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("mediaEndowments"), 0);
  if (dword_1EE2B3F60)
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)dumpDebugInfo
{
  NSObject *mSerialQueue;
  _QWORD v3[5];

  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MXMediaEndowmentManager_dumpDebugInfo__block_invoke;
  v3[3] = &unk_1E3099900;
  v3[4] = self;
  MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager dumpDebugInfo]", (uint64_t)"MX_MediaEndowmentManager.m", 720, 0, 0, mSerialQueue, (uint64_t)v3);
}

uint64_t __40__MXMediaEndowmentManager_dumpDebugInfo__block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  NSObject *v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  NSObject *v51;
  unsigned int v52;
  unsigned int v53;
  NSObject *v54;
  unsigned int v55;
  unsigned int v56;
  NSObject *v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  uint64_t v70;
  NSObject *v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t v74;
  NSObject *v75;
  unsigned int v76;
  unsigned int v77;
  NSObject *v78;
  unsigned int v79;
  unsigned int v80;
  NSObject *v81;
  unsigned int v82;
  unsigned int v83;
  void *v84;
  uint64_t result;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  NSObject *v94;
  unsigned int v95;
  unsigned int v96;
  NSObject *v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  int *v101;
  int *v102;
  int *v103;
  int *v104;
  int *v105;
  int *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id obj;
  id obja;
  id objb;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  os_log_type_t type;
  unsigned int v164;
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  int v171;
  const char *v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  uint64_t v176;
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F60)
  {
    v164 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F60)
    {
      v164 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v125 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v178, 16, v100, v107);
  if (v125)
  {
    v122 = *(_QWORD *)v160;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v160 != v122)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * v3);
        v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v4, v101, v108);
        if (dword_1EE2B3F60)
        {
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v7 = v164;
          if (os_log_type_enabled(v6, type))
            v8 = v7;
          else
            v8 = v7 & 0xFFFFFFFE;
          if (v8)
          {
            v171 = 136315394;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            v173 = 2114;
            v174 = v4;
            LODWORD(v109) = 22;
            v102 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v128 = v3;
        v157 = 0u;
        v158 = 0u;
        v155 = 0u;
        v156 = 0u;
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v155, v177, 16, v102, v109);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v156;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v156 != v11)
                objc_enumerationMutation(v5);
              if (dword_1EE2B3F60)
              {
                v13 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i);
                v164 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v15 = v164;
                if (os_log_type_enabled(v14, type))
                  v16 = v15;
                else
                  v16 = v15 & 0xFFFFFFFE;
                if (v16)
                {
                  v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v13), "explanation");
                  v171 = 136315650;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  v173 = 2114;
                  v174 = v13;
                  v175 = 2114;
                  v176 = v17;
                  LODWORD(v108) = 32;
                  v101 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
          }
          while (v10);
        }
        if (dword_1EE2B3F60)
        {
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v19 = v164;
          if (os_log_type_enabled(v18, type))
            v20 = v19;
          else
            v20 = v19 & 0xFFFFFFFE;
          if (v20)
          {
            v171 = 136315138;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            LODWORD(v108) = 12;
            v101 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v3;
      }
      while ((id)(v128 + 1) != v125);
      v125 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v178, 16);
    }
    while (v125);
  }
  if (dword_1EE2B3F60)
  {
    v164 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v22 = v164;
    if (os_log_type_enabled(v21, type))
      v23 = v22;
    else
      v23 = v22 & 0xFFFFFFFE;
    if (v23)
    {
      v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      LODWORD(v108) = 12;
      v101 = &v171;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F60)
    {
      v164 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v25 = v164;
      if (os_log_type_enabled(v24, type))
        v26 = v25;
      else
        v26 = v25 & 0xFFFFFFFE;
      if (v26)
      {
        v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        LODWORD(v108) = 12;
        v101 = &v171;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v114 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v151, v170, 16, v101, v108);
  if (v116)
  {
    v115 = *(_QWORD *)v152;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v152 != v115)
        {
          v28 = v27;
          objc_enumerationMutation(v114);
          v27 = v28;
        }
        v117 = v27;
        v29 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * v27);
        v126 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v29, v103, v110);
        if (dword_1EE2B3F60)
        {
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v31 = v164;
          if (os_log_type_enabled(v30, type))
            v32 = v31;
          else
            v32 = v31 & 0xFFFFFFFE;
          if (v32)
          {
            v171 = 136315394;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            v173 = 2114;
            v174 = v29;
            LODWORD(v111) = 22;
            v104 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v149 = 0u;
        v150 = 0u;
        v147 = 0u;
        v148 = 0u;
        v123 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v147, v169, 16, v104, v111);
        if (v123)
        {
          obja = *(id *)v148;
          do
          {
            v33 = 0;
            do
            {
              if (*(id *)v148 != obja)
                objc_enumerationMutation(v126);
              v129 = v33;
              v34 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v33);
              if (dword_1EE2B3F60)
              {
                v164 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v36 = v164;
                if (os_log_type_enabled(v35, type))
                  v37 = v36;
                else
                  v37 = v36 & 0xFFFFFFFE;
                if (v37)
                {
                  v171 = 136315394;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  v173 = 2114;
                  v174 = v34;
                  LODWORD(v110) = 22;
                  v103 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              v38 = (void *)objc_msgSend(v126, "objectForKey:", v34, v103, v110);
              v143 = 0u;
              v144 = 0u;
              v145 = 0u;
              v146 = 0u;
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v144;
                do
                {
                  for (j = 0; j != v40; ++j)
                  {
                    if (*(_QWORD *)v144 != v41)
                      objc_enumerationMutation(v38);
                    if (dword_1EE2B3F60)
                    {
                      v43 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * j);
                      v164 = 0;
                      type = OS_LOG_TYPE_DEFAULT;
                      v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      v45 = v164;
                      if (os_log_type_enabled(v44, type))
                        v46 = v45;
                      else
                        v46 = v45 & 0xFFFFFFFE;
                      if (v46)
                      {
                        v47 = objc_msgSend(v38, "objectForKey:", v43);
                        v171 = 136315650;
                        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                        v173 = 2114;
                        v174 = v43;
                        v175 = 2114;
                        v176 = v47;
                        LODWORD(v110) = 32;
                        v103 = &v171;
                        _os_log_send_and_compose_impl();
                      }
                      fig_log_call_emit_and_clean_up_after_send_and_compose();
                    }
                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
                }
                while (v40);
              }
              if (dword_1EE2B3F60)
              {
                v164 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v49 = v164;
                if (os_log_type_enabled(v48, type))
                  v50 = v49;
                else
                  v50 = v49 & 0xFFFFFFFE;
                if (v50)
                {
                  v171 = 136315138;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  LODWORD(v110) = 12;
                  v103 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              v33 = v129 + 1;
            }
            while (v129 + 1 != v123);
            v123 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
          }
          while (v123);
        }
        if (dword_1EE2B3F60)
        {
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v52 = v164;
          if (os_log_type_enabled(v51, type))
            v53 = v52;
          else
            v53 = v52 & 0xFFFFFFFE;
          if (v53)
          {
            v171 = 136315138;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            LODWORD(v110) = 12;
            v103 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v27 = v117 + 1;
      }
      while (v117 + 1 != v116);
      v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
    }
    while (v116);
  }
  if (dword_1EE2B3F60)
  {
    v164 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v55 = v164;
    if (os_log_type_enabled(v54, type))
      v56 = v55;
    else
      v56 = v55 & 0xFFFFFFFE;
    if (v56)
    {
      v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      LODWORD(v110) = 12;
      v103 = &v171;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F60)
    {
      v164 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v58 = v164;
      if (os_log_type_enabled(v57, type))
        v59 = v58;
      else
        v59 = v58 & 0xFFFFFFFE;
      if (v59)
      {
        v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        LODWORD(v110) = 12;
        v103 = &v171;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  objb = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v127 = (id)objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v139, v167, 16, v103, v110);
  if (v127)
  {
    v124 = *(_QWORD *)v140;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v140 != v124)
          objc_enumerationMutation(objb);
        v61 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * v60);
        v62 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v61, v105, v112);
        if (dword_1EE2B3F60)
        {
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v64 = v164;
          if (os_log_type_enabled(v63, type))
            v65 = v64;
          else
            v65 = v64 & 0xFFFFFFFE;
          if (v65)
          {
            v171 = 136315394;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            v173 = 2114;
            v174 = v61;
            LODWORD(v113) = 22;
            v106 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v130 = v60;
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v135, v166, 16, v106, v113);
        if (v66)
        {
          v67 = v66;
          v68 = *(_QWORD *)v136;
          do
          {
            for (k = 0; k != v67; ++k)
            {
              if (*(_QWORD *)v136 != v68)
                objc_enumerationMutation(v62);
              if (dword_1EE2B3F60)
              {
                v70 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * k);
                v164 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v72 = v164;
                if (os_log_type_enabled(v71, type))
                  v73 = v72;
                else
                  v73 = v72 & 0xFFFFFFFE;
                if (v73)
                {
                  v74 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "objectForKey:", v70), "allObjects"), "componentsJoinedByString:", CFSTR(","));
                  v171 = 136315650;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  v173 = 2114;
                  v174 = v70;
                  v175 = 2114;
                  v176 = v74;
                  LODWORD(v112) = 32;
                  v105 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            v67 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v135, v166, 16);
          }
          while (v67);
        }
        if (dword_1EE2B3F60)
        {
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v75 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v76 = v164;
          if (os_log_type_enabled(v75, type))
            v77 = v76;
          else
            v77 = v76 & 0xFFFFFFFE;
          if (v77)
          {
            v171 = 136315138;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            LODWORD(v112) = 12;
            v105 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v60 = v130 + 1;
      }
      while ((id)(v130 + 1) != v127);
      v127 = (id)objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v139, v167, 16);
    }
    while (v127);
  }
  if (dword_1EE2B3F60)
  {
    v164 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v78 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v79 = v164;
    if (os_log_type_enabled(v78, type))
      v80 = v79;
    else
      v80 = v79 & 0xFFFFFFFE;
    if (v80)
    {
      v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      LODWORD(v112) = 12;
      v105 = &v171;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F60)
    {
      v164 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v82 = v164;
      if (os_log_type_enabled(v81, type))
        v83 = v82;
      else
        v83 = v82 & 0xFFFFFFFE;
      if (v83)
      {
        v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        LODWORD(v112) = 12;
        v105 = &v171;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v84 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  result = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v131, v165, 16, v105, v112);
  if (result)
  {
    v86 = result;
    v87 = *(_QWORD *)v132;
    do
    {
      v88 = 0;
      do
      {
        if (*(_QWORD *)v132 != v87)
          objc_enumerationMutation(v84);
        if (dword_1EE2B3F60)
        {
          v89 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * v88);
          v164 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v90 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v91 = v164;
          if (os_log_type_enabled(v90, type))
            v92 = v91;
          else
            v92 = v91 & 0xFFFFFFFE;
          if (v92)
          {
            v93 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v89), "explanation");
            v171 = 136315650;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            v173 = 2114;
            v174 = v89;
            v175 = 2114;
            v176 = v93;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v88;
      }
      while (v86 != v88);
      result = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v131, v165, 16);
      v86 = result;
    }
    while (result);
  }
  if (dword_1EE2B3F60)
  {
    v164 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v94 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v95 = v164;
    if (os_log_type_enabled(v94, type))
      v96 = v95;
    else
      v96 = v95 & 0xFFFFFFFE;
    if (v96)
    {
      v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F60)
    {
      v164 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v98 = v164;
      if (os_log_type_enabled(v97, type))
        v99 = v98;
      else
        v99 = v98 & 0xFFFFFFFE;
      if (v99)
      {
        v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        _os_log_send_and_compose_impl();
      }
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

@end
