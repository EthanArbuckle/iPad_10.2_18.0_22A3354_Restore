@implementation MXAppProtectionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_58);
  return (id)sharedInstance_sSharedInstance_7;
}

MXAppProtectionManager *__40__MXAppProtectionManager_sharedInstance__block_invoke()
{
  MXAppProtectionManager *result;

  result = objc_alloc_init(MXAppProtectionManager);
  sharedInstance_sSharedInstance_7 = (uint64_t)result;
  return result;
}

- (MXAppProtectionManager)init
{
  MXAppProtectionManager *v2;
  NSObject *v3;
  NSObject *mSerialQueue;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXAppProtectionManager;
  v2 = -[MXAppProtectionManager init](&v7, sel_init);
  if (v2)
  {
    if (MX_FeatureFlags_IsProtectedAppsEnabled())
    {
      v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->mSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.AppProtectionManager", v3);
      v2->mLockedApps = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v2->mLockedAppsToBeRemovedFromNowPlayingAppStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      mSerialQueue = v2->mSerialQueue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __30__MXAppProtectionManager_init__block_invoke;
      v6[3] = &unk_1E3099900;
      v6[4] = v2;
      MXDispatchAsync((uint64_t)"-[MXAppProtectionManager init]", (uint64_t)"MX_AppProtectionManager.m", 85, 0, 0, mSerialQueue, (uint64_t)v6);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

uint64_t __30__MXAppProtectionManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v2 = (void *)getAPSubjectClass_softClass;
  v20 = getAPSubjectClass_softClass;
  if (!getAPSubjectClass_softClass)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __getAPSubjectClass_block_invoke;
    v25 = &unk_1E3099018;
    v26 = &v15;
    __getAPSubjectClass_block_invoke((uint64_t)&v22);
    v2 = (void *)v16[5];
  }
  _Block_object_dispose(&v15, 8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(v2, "subjectMonitorRegistry"), "addMonitor:subjectMask:", +[MXAppProtectionManager sharedInstance](MXAppProtectionManager, "sharedInstance"), 1);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v3 = (void *)getAPApplicationClass_softClass;
  v20 = getAPApplicationClass_softClass;
  if (!getAPApplicationClass_softClass)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __getAPApplicationClass_block_invoke;
    v25 = &unk_1E3099018;
    v26 = &v15;
    __getAPApplicationClass_block_invoke((uint64_t)&v22);
    v3 = (void *)v16[5];
  }
  _Block_object_dispose(&v15, 8);
  v4 = (void *)objc_msgSend(v3, "lockedApplications");
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  v6 = result;
  if (result)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "bundleIdentifier");
        if (v9)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
      v6 = result;
    }
    while (result);
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)dealloc
{
  NSObject *mSerialQueue;
  objc_super v4;

  mSerialQueue = self->mSerialQueue;
  if (mSerialQueue)
  {
    dispatch_release(mSerialQueue);
    self->mSerialQueue = 0;
  }

  self->mLockedApps = 0;
  self->mLockedAppsToBeRemovedFromNowPlayingAppStack = 0;
  -[APSubjectMonitorSubscription invalidate](self->mSubjectMonitor, "invalidate");
  self->mSubjectMonitor = 0;
  v4.receiver = self;
  v4.super_class = (Class)MXAppProtectionManager;
  -[MXAppProtectionManager dealloc](&v4, sel_dealloc);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  NSObject *mSerialQueue;
  _QWORD v5[6];

  mSerialQueue = self->mSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__MXAppProtectionManager_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v5[3] = &unk_1E309CCF0;
  v5[4] = a3;
  v5[5] = self;
  MXDispatchSync((uint64_t)"-[MXAppProtectionManager appProtectionSubjectsChanged:forSubscription:]", (uint64_t)"MX_AppProtectionManager.m", 132, 0, 0, mSerialQueue, (uint64_t)v5);
}

uint64_t __71__MXAppProtectionManager_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "bundleIdentifier");
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", v8);
        if (objc_msgSend(v7, "isLocked"))
        {
          if ((v9 & 1) == 0)
          {
            if (dword_1EE2B3F38)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v8, v14, v15);
            v12 = CMSMNP_CopyNowPlayingAppSession();
            v13 = CMSUtility_CopyBundleID(v12);
            if ((objc_msgSend(v13, "isEqualToString:", v8) & 1) == 0)
              objc_msgSend(*(id *)(a1 + 40), "scheduleLockedAppRemovalFromNowPlayingAppStack:", v8);

          }
        }
        else if (v9)
        {
          if (dword_1EE2B3F38)
          {
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v8, v14, v15);
          objc_msgSend(*(id *)(a1 + 40), "cancelLockedAppRemovalFromNowPlayingAppStack:", v8);
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)handlePlayingStateChangedForNowPlayingApp:(id)a3 isCurrentlyPlaying:(BOOL)a4
{
  id v7;
  NSObject *mSerialQueue;
  _QWORD v9[6];
  BOOL v10;

  v7 = a3;
  mSerialQueue = self->mSerialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__MXAppProtectionManager_handlePlayingStateChangedForNowPlayingApp_isCurrentlyPlaying___block_invoke;
  v9[3] = &unk_1E309D770;
  v9[4] = self;
  v9[5] = a3;
  v10 = a4;
  MXDispatchAsync((uint64_t)"-[MXAppProtectionManager handlePlayingStateChangedForNowPlayingApp:isCurrentlyPlaying:]", (uint64_t)"MX_AppProtectionManager.m", 176, 0, 0, mSerialQueue, (uint64_t)v9);
}

void __87__MXAppProtectionManager_handlePlayingStateChangedForNowPlayingApp_isCurrentlyPlaying___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v2, "cancelLockedAppRemovalFromNowPlayingAppStack:", v3);
    else
      objc_msgSend(v2, "scheduleLockedAppRemovalFromNowPlayingAppStack:", v3);
  }

}

- (void)scheduleLockedAppRemovalFromNowPlayingAppStack:(id)a3
{
  NSMutableArray *mLockedAppsToBeRemovedFromNowPlayingAppStack;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  dispatch_time_t v7;
  NSObject *mSerialQueue;
  _QWORD block[6];
  os_log_type_t type;
  int v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[MXNowPlayingAppManager doesNowPlayingAppStackContain:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "doesNowPlayingAppStackContain:", a3))
  {
    mLockedAppsToBeRemovedFromNowPlayingAppStack = self->mLockedAppsToBeRemovedFromNowPlayingAppStack;
    v12 = a3;
    v13[0] = objc_msgSend(MEMORY[0x1E0C99D68], "now");
    -[NSMutableArray addObject:](mLockedAppsToBeRemovedFromNowPlayingAppStack, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    if (dword_1EE2B3F38)
    {
      v11 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = dispatch_time(0, 30000000000);
    mSerialQueue = self->mSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MXAppProtectionManager_scheduleLockedAppRemovalFromNowPlayingAppStack___block_invoke;
    block[3] = &unk_1E309DAB0;
    block[4] = self;
    block[5] = 30;
    dispatch_after(v7, mSerialQueue, block);
  }
}

void __73__MXAppProtectionManager_scheduleLockedAppRemovalFromNowPlayingAppStack___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v1 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    v14 = v1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = objc_msgSend((id)objc_msgSend(v7, "allKeys"), "firstObject");
        v9 = objc_msgSend((id)objc_msgSend(v7, "allValues"), "firstObject");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "now"), "timeIntervalSinceDate:", v9);
        if (v10 >= (double)*(uint64_t *)(v1 + 40))
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v1 = v14;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "removeObject:", v7, v12, v13);
          -[MXNowPlayingAppManager removeFromNowPlayingAppStack:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "removeFromNowPlayingAppStack:", v8);
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (void)cancelLockedAppRemovalFromNowPlayingAppStack:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableArray copy](self->mLockedAppsToBeRemovedFromNowPlayingAppStack, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "allKeys"), "firstObject"), "isEqualToString:", a3))
        {
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[NSMutableArray removeObject:](self->mLockedAppsToBeRemovedFromNowPlayingAppStack, "removeObject:", v9, v11, v12);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)dumpDebugInfo
{
  NSObject *mSerialQueue;
  _QWORD v3[5];

  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__MXAppProtectionManager_dumpDebugInfo__block_invoke;
  v3[3] = &unk_1E3099900;
  v3[4] = self;
  MXDispatchSync((uint64_t)"-[MXAppProtectionManager dumpDebugInfo]", (uint64_t)"MX_AppProtectionManager.m", 250, 0, 0, mSerialQueue, (uint64_t)v3);
}

void __39__MXAppProtectionManager_dumpDebugInfo__block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  NSObject *v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  int *v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  os_log_type_t type;
  unsigned int v55;
  int v56;
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    v55 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v45 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v45, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss:ms"));
  if (dword_1EE2B3F38)
  {
    v55 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v44 = a1;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v63, 16, v38, v41);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v51 != v7)
          objc_enumerationMutation(v4);
        if (dword_1EE2B3F38)
        {
          v9 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          v55 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v11 = v55;
          if (os_log_type_enabled(v10, type))
            v12 = v11;
          else
            v12 = v11 & 0xFFFFFFFE;
          if (v12)
          {
            v56 = 136315394;
            v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
            v58 = 2114;
            v59 = v9;
            LODWORD(v42) = 22;
            v39 = &v56;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v6);
  }
  if (dword_1EE2B3F38)
  {
    v55 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v14 = v55;
    if (os_log_type_enabled(v13, type))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if (v15)
    {
      v56 = 136315138;
      v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
      LODWORD(v42) = 12;
      v39 = &v56;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F38)
    {
      v55 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v17 = v55;
      if (os_log_type_enabled(v16, type))
        v18 = v17;
      else
        v18 = v17 & 0xFFFFFFFE;
      if (v18)
      {
        v56 = 136315138;
        v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
        LODWORD(v42) = 12;
        v39 = &v56;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = *(void **)(*(_QWORD *)(v44 + 32) + 24);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v62, 16, v39, v42);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        v25 = objc_msgSend((id)objc_msgSend(v24, "allKeys", v40, v43), "firstObject");
        v26 = objc_msgSend((id)objc_msgSend(v24, "allValues"), "firstObject");
        if (dword_1EE2B3F38)
        {
          v27 = v26;
          v55 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v29 = v55;
          if (os_log_type_enabled(v28, type))
            v30 = v29;
          else
            v30 = v29 & 0xFFFFFFFE;
          if (v30)
          {
            v31 = objc_msgSend(v45, "stringFromDate:", v27);
            v56 = 136315650;
            v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
            v58 = 2114;
            v59 = v25;
            v60 = 2114;
            v61 = v31;
            LODWORD(v43) = 32;
            v40 = &v56;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    }
    while (v21);
  }
  if (dword_1EE2B3F38)
  {
    v55 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v33 = v55;
    if (os_log_type_enabled(v32, type))
      v34 = v33;
    else
      v34 = v33 & 0xFFFFFFFE;
    if (v34)
    {
      v56 = 136315138;
      v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  if (dword_1EE2B3F38)
  {
    v55 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v36 = v55;
    if (os_log_type_enabled(v35, type))
      v37 = v36;
    else
      v37 = v36 & 0xFFFFFFFE;
    if (v37)
    {
      v56 = 136315138;
      v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end
