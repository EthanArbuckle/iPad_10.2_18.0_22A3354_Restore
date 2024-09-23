@implementation AXMAVPlayerItemNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("AVPlayerItem");
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  objc_super v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("AXMAVPlayerItemNode does not support remote triggering"));
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)AXMAVPlayerItemNode;
    -[AXMSourceNode setShouldProcessRemotely:](&v3, sel_setShouldProcessRemotely_);
  }
}

- (void)nodeInitialize
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *avkit_queue;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMAVPlayerItemNode;
  -[AXMSourceNode nodeInitialize](&v6, sel_nodeInitialize);
  v3 = (OS_dispatch_queue *)dispatch_queue_create("AXMAVPlayerItemNode-avkit-queue", 0);
  avkit_queue = self->_avkit_queue;
  self->_avkit_queue = v3;

  +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMAVPlayerItemNode setAnalysisOptions:](self, "setAnalysisOptions:", v5);

}

- (void)autoTriggerLegibilityEventsWithAVPlayerItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AXMAVPlayerItemNode *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke;
  v6[3] = &unk_1E625CB18;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _AXMPlayerItemLegibleOutput *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    AXMediaLogCaptionDescriptions();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *v1;
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1B0E3B000, v3, OS_LOG_TYPE_DEFAULT, "Will begin processing legibility events with player item: %@", (uint8_t *)&v13, 0xCu);
    }

    v6 = *(void **)(a1 + 40);
    v5 = (id *)(a1 + 40);
    objc_msgSend(v6, "targetPlayerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*v5, "targetPlayerItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)*v1;

      AXMediaLogCaptionDescriptions();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (_AXMPlayerItemLegibleOutput *)v10;
      if (v8 == v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *v1;
          v13 = 138412290;
          v14 = v12;
          _os_log_impl(&dword_1B0E3B000, &v11->super.super.super, OS_LOG_TYPE_DEFAULT, "Asked to auto-trigger events with item: '%@', but same targetPalyerItem was already set!", (uint8_t *)&v13, 0xCu);
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke_cold_1(v1, v5, &v11->super.super.super);

      objc_msgSend(*v5, "_mainQueue_endAutoTriggerOfLegibilityEvents");
    }
    v11 = objc_alloc_init(_AXMPlayerItemLegibleOutput);
    -[AVPlayerItemLegibleOutput setDelegate:queue:](v11, "setDelegate:queue:", *v5, *((_QWORD *)*v5 + 7));
    objc_msgSend((id)*v1, "addOutput:", v11);
    objc_msgSend(*v5, "setTargetPlayerItem:", *v1);
LABEL_10:

  }
}

- (void)_mainQueue_endAutoTriggerOfLegibilityEvents
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[AXMAVPlayerItemNode targetPlayerItem](self, "targetPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogCaptionDescriptions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v3;
    _os_log_impl(&dword_1B0E3B000, v4, OS_LOG_TYPE_DEFAULT, "Will stop processing legibility events for player item: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "outputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v3, "removeOutput:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  -[AXMAVPlayerItemNode setTargetPlayerItem:](self, "setTargetPlayerItem:", 0);
  self->_triggeringLegibilityEvents = 0;

}

- (void)endAutoTriggerOfLegibilityEvents
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AXMAVPlayerItemNode_endAutoTriggerOfLegibilityEvents__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __55__AXMAVPlayerItemNode_endAutoTriggerOfLegibilityEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_endAutoTriggerOfLegibilityEvents");
}

- (id)axmDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXMAVPlayerItemNode;
  -[AXMVisionEngineNode axmDescription](&v8, sel_axmDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMAVPlayerItemNode targetPlayerItem](self, "targetPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ playerItem:<%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)legibleOutput:(id)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 forItemTime:(id *)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  AXMediaLogCaptionDescriptions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AXMAVPlayerItemNode legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:].cold.1((uint64_t)v7, v8);

  self->_triggeringLegibilityEvents = 1;
  if (objc_msgSend(v7, "count"))
  {
    v25[0] = CFSTR("sourceProvidesResults");
    v25[1] = CFSTR("diagnosticsEnabled");
    v26[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMAVPlayerItemNode analysisOptions](self, "analysisOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          +[AXMVisionFeature featureWithMediaLegibility:](AXMVisionFeature, "featureWithMediaLegibility:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendFeature:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    v19.receiver = self;
    v19.super_class = (Class)AXMAVPlayerItemNode;
    -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v19, sel_triggerWithContext_cacheKey_resultHandler_, v12, 0, 0);

  }
}

- (BOOL)isTriggeringLegibilityEvents
{
  return self->_triggeringLegibilityEvents;
}

- (AVPlayerItem)targetPlayerItem
{
  return (AVPlayerItem *)objc_loadWeakRetained((id *)&self->_targetPlayerItem);
}

- (void)setTargetPlayerItem:(id)a3
{
  objc_storeWeak((id *)&self->_targetPlayerItem, a3);
}

- (AXMVisionAnalysisOptions)analysisOptions
{
  return self->_analysisOptions;
}

- (void)setAnalysisOptions:(id)a3
{
  objc_storeStrong((id *)&self->_analysisOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisOptions, 0);
  objc_destroyWeak((id *)&self->_targetPlayerItem);
  objc_storeStrong((id *)&self->_avkit_queue, 0);
}

void __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke_cold_1(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(*a2, "targetPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B0E3B000, a3, OS_LOG_TYPE_ERROR, "Asked to auto-trigger events with item: '%@', but targetPalyerItem already exists: '%@'. Unregistering current targetPalyerItem first. ", (uint8_t *)&v6, 0x16u);

}

- (void)legibleOutput:(uint64_t)a1 didOutputAttributedStrings:(NSObject *)a2 nativeSampleBuffers:forItemTime:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "legibility event: %@", (uint8_t *)&v2, 0xCu);
}

@end
