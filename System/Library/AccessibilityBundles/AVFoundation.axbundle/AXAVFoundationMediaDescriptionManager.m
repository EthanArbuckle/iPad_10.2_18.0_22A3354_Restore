@implementation AXAVFoundationMediaDescriptionManager

+ (id)sharedManagerIfExists
{
  return (id)_SharedManager;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)_SharedManager;
}

void __54__AXAVFoundationMediaDescriptionManager_sharedManager__block_invoke()
{
  AXAVFoundationMediaDescriptionManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXAVFoundationMediaDescriptionManager);
  v1 = (void *)_SharedManager;
  _SharedManager = (uint64_t)v0;

}

- (AXAVFoundationMediaDescriptionManager)init
{
  AXAVFoundationMediaDescriptionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  AXMVisionEngine *engine;
  uint64_t v7;
  NSMapTable *queue_nodeToPlayerMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXAVFoundationMediaDescriptionManager;
  v2 = -[AXAVFoundationMediaDescriptionManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXAVFoundationMediaDescriptionManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE7F8]), "initWithIdentifier:", CFSTR("avkit-accessibility"));
    engine = v2->_engine;
    v2->_engine = (AXMVisionEngine *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    queue_nodeToPlayerMap = v2->_queue_nodeToPlayerMap;
    v2->_queue_nodeToPlayerMap = (NSMapTable *)v7;

  }
  return v2;
}

- (BOOL)beginObservingPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *queue;
  id v9;
  id v10;
  AXMVisionEngine *engine;
  id v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("legibility-%p"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE768]), "initWithIdentifier:", v5);
    v7 = MEMORY[0x24BDAC760];
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke;
    block[3] = &unk_250140570;
    block[4] = self;
    v9 = v4;
    v18 = v9;
    v10 = v6;
    v19 = v10;
    dispatch_sync(queue, block);
    objc_msgSend(v10, "addResultHandler:", &__block_literal_global_186);
    engine = self->_engine;
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_188;
    v15[3] = &unk_2501405D8;
    v15[4] = self;
    v16 = v10;
    v12 = v10;
    -[AXMVisionEngine updateEngineConfiguration:](engine, "updateEngineConfiguration:", v15);
    AXMediaLogCaptionDescriptions();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_23238A000, v13, OS_LOG_TYPE_INFO, "Will begin observing player: %@", buf, 0xCu);
    }

    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 15, AXMediaPlayerObserverContext);
  }

  return v4 != 0;
}

uint64_t __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AXPerformBlockOnMainThread();

}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  AXMediaLogCaptionDescriptions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_2(a1, v2);

  if (*(_QWORD *)(a1 + 32) && UIAccessibilityIsVoiceOverRunning())
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v5)
    {
      AXMediaLogCaptionDescriptions();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_1(v5, v6);

    }
    else if (v4)
    {
      UIAccessibilityPostNotification(0x420u, v4);
    }

  }
}

uint64_t __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_188(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addSourceNode:", *(_QWORD *)(a1 + 40));
}

- (void)endObservingPlayer:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  id v7;
  AXMVisionEngine *engine;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke;
  block[3] = &unk_250140600;
  v15 = &v16;
  block[4] = self;
  v7 = v4;
  v14 = v7;
  dispatch_sync(queue, block);
  if (v17[5])
  {
    engine = self->_engine;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_2;
    v12[3] = &unk_250140628;
    v12[4] = self;
    v12[5] = &v16;
    -[AXMVisionEngine updateEngineConfiguration:](engine, "updateEngineConfiguration:", v12);
    v9 = self->_queue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_3;
    v11[3] = &unk_250140628;
    v11[4] = self;
    v11[5] = &v16;
    dispatch_sync(v9, v11);
  }
  AXMediaLogCaptionDescriptions();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_23238A000, v10, OS_LOG_TYPE_INFO, "Will end observing player: %@", buf, 0xCu);
  }

  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), AXMediaPlayerObserverContext);
  _Block_object_dispose(&v16, 8);

}

void __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_itemNodeForPlayer:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeSourceNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)isTappingMediaDescriptions
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__AXAVFoundationMediaDescriptionManager_isTappingMediaDescriptions__block_invoke;
  v5[3] = &unk_250140628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __67__AXAVFoundationMediaDescriptionManager_isTappingMediaDescriptions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "keyEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isTriggeringLegibilityEvents"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_queue_itemNodeForPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable keyEnumerator](self->_queue_nodeToPlayerMap, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_queue_nodeToPlayerMap, "objectForKey:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v12 = v10;

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  NSObject *queue;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  AXAVFoundationMediaDescriptionManager *v27;
  NSObject *v28;
  _BYTE *v29;
  _QWORD block[5];
  NSObject *v31;
  _BYTE *v32;
  uint8_t v33[4];
  NSObject *v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  if ((void *)AXMediaPlayerObserverContext == a6
    && objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
  {
    AXMediaLogCaptionDescriptions();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v36 = v12;
      _os_log_impl(&dword_23238A000, v13, OS_LOG_TYPE_INFO, "Did observe change on. path:'%@' object:%@ change:%@", buf, 0x20u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    v38 = 0;
    queue = self->_queue;
    v15 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_250140600;
    v32 = buf;
    block[4] = self;
    v16 = v11;
    v31 = v16;
    dispatch_sync(queue, block);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E78]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if (v18)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "endAutoTriggerOfLegibilityEvents");
      }
      else
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[AXAVFoundationMediaDescriptionManager _shouldAttachLegibilityOutputToItem:](self, "_shouldAttachLegibilityOutputToItem:", v19))
          {
            AXMediaLogCaptionDescriptions();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v33 = 138412290;
              v34 = v19;
              _os_log_impl(&dword_23238A000, v20, OS_LOG_TYPE_INFO, "Will attach legibility node to item: %@", v33, 0xCu);
            }

            v23 = v15;
            v24 = 3221225472;
            v25 = __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke_192;
            v26 = &unk_250140650;
            v27 = self;
            v29 = buf;
            v19 = v19;
            v28 = v19;
            AXPerformBlockOnMainThread();

          }
          else
          {
            AXMediaLogCaptionDescriptions();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v33 = 138412290;
              v34 = v19;
              _os_log_impl(&dword_23238A000, v21, OS_LOG_TYPE_INFO, "Will NOT attach legibility node to item: %@", v33, 0xCu);
            }

          }
        }
      }
    }
    else
    {
      AXMediaLogCaptionDescriptions();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v33 = 138412290;
        v34 = v16;
        _os_log_impl(&dword_23238A000, v19, OS_LOG_TYPE_DEFAULT, "No legibility node found for player: %@", v33, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)AXAVFoundationMediaDescriptionManager;
    -[AXAVFoundationMediaDescriptionManager observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_itemNodeForPlayer:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke_192(uint64_t a1)
{
  uint64_t result;

  if (UIAccessibilityIsVoiceOverRunning())
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "autoTriggerLegibilityEventsWithAVPlayerItem:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "isVoiceOverInTheTripleClickMenu");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "autoTriggerLegibilityEventsWithAVPlayerItem:", *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)isVoiceOverInTheTripleClickMenu
{
  const void *v2;
  int v3;

  v2 = (const void *)_AXSTripleClickCopyOptions();
  v3 = _AXSTripleClickContainsOption();
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (BOOL)_shouldAttachLegibilityOutputToItem:(id)a3
{
  return AXProcessIsSystemApplication() ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_nodeToPlayerMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ax_nonRedundantDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_23238A000, a2, OS_LOG_TYPE_ERROR, "Failed to archive data: %@", (uint8_t *)&v4, 0xCu);

}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_23238A000, a2, OS_LOG_TYPE_DEBUG, "handling engine legibility result: %@", (uint8_t *)&v3, 0xCu);
}

@end
