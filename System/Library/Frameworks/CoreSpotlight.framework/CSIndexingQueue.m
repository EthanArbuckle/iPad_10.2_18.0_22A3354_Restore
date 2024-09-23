@implementation CSIndexingQueue

uint64_t __30__CSIndexingQueue_queueItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueItems:", *(_QWORD *)(a1 + 40));
}

- (void)queueItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSIndexingQueue queueItems:](self, "queueItems:", v6, v7, v8);
  }
}

- (void)queueItems:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  tracing_dispatch_async();

}

- (CSIndexingQueue)initWithIdleTime:(double)a3 idleTimeLeeway:(double)a4 maximumBatchSize:(unint64_t)a5 mode:(int64_t)a6 notifyBlock:(id)a7
{
  id v12;
  CSIndexingQueue *v13;
  CSIndexingQueue *v14;
  double v15;
  double v16;
  unint64_t v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *queuedItems;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *coalescingQueue;
  void *v23;
  id notifyBlock;
  void *v25;
  objc_super v27;

  v12 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CSIndexingQueue;
  v13 = -[CSIndexingQueue init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = 5.0;
    if (a3 > 0.0)
      v15 = a3;
    v16 = 1.0;
    if (a4 > 0.0)
      v16 = a4;
    v13->_idleTime = v15;
    v13->_idleTimeLeeway = v16;
    v17 = 100;
    if (a5)
      v17 = a5;
    v13->_maximumBatchSize = v17;
    v13->_mode = a6;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queuedItems = v14->_queuedItems;
    v14->_queuedItems = v18;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.CoreSpotlight.itemCoalescing", v20);
    coalescingQueue = v14->_coalescingQueue;
    v14->_coalescingQueue = (OS_dispatch_queue *)v21;

    v23 = _Block_copy(v12);
    notifyBlock = v14->_notifyBlock;
    v14->_notifyBlock = v23;

    if (v14->_mode == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v14, sel__applicationWillResign_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

    }
  }

  return v14;
}

- (void)_queueItems:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  int64_t mode;
  NSObject *coalescingTimer;
  dispatch_time_t v29;
  OS_dispatch_source *v30;
  OS_dispatch_source *v31;
  NSObject *v32;
  NSObject *v33;
  dispatch_time_t v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  unint64_t maximumBatchSize;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  NSMutableDictionary *queuedItems;
  __int128 v55;
  void *v56;
  CSIndexingQueue *v57;
  id obj;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD handler[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v4;
  v56 = v5;
  v57 = self;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v61)
  {
    v60 = *(_QWORD *)v72;
    *(_QWORD *)&v6 = 138412290;
    v55 = v6;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v72 != v60)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v8, "searchableItem", v55);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_queuedItems, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchableItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "attributeSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "attributeSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "updateWithItem:", v11);
          if ((objc_msgSend(v9, "isUpdate") & 1) != 0)
          {
            objc_msgSend(v13, "_updateWithSearchableItem:", v9);
            logForCSLogCategoryDefault();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v55;
              v78 = v11;
              _os_log_debug_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEBUG, "update: %@", buf, 0xCu);
            }

            goto LABEL_27;
          }
          objc_msgSend(v14, "emailHeaders");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v15, "emailHeaders");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

          }
          else
          {
            v19 = 0;
          }

          objc_msgSend(v14, "HTMLContentData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v15;
          if (v20)
          {
            objc_msgSend(v15, "HTMLContentData");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

          }
          else
          {
            v22 = 0;
          }

          if (v19 || v22)
          {
            if (v19)
            {
              objc_msgSend(v14, "emailHeaders");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setEmailHeaders:", v23);

            }
            if (v22)
            {
              objc_msgSend(v14, "HTMLContentData");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setHTMLContentData:", v24);

            }
          }

          v5 = v56;
          self = v57;
        }
        if (v10)
        {
          logForCSLogCategoryDefault();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v55;
            v78 = v8;
            _os_log_debug_impl(&dword_18C42F000, v25, OS_LOG_TYPE_DEBUG, "queue: %@", buf, 0xCu);
          }

          objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v10);
        }
LABEL_27:

      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v61);
  }

  v26 = -[NSMutableDictionary count](self->_queuedItems, "count");
  if (objc_msgSend(v5, "count") + v26 <= self->_maximumBatchSize)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_queuedItems, "addEntriesFromDictionary:", v5);
    coalescingTimer = self->_coalescingTimer;
    if (coalescingTimer)
    {
      v29 = dispatch_time(0, (uint64_t)(self->_idleTime * 1000000000.0));
      dispatch_source_set_timer(coalescingTimer, v29, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_idleTimeLeeway * 1000000000.0));
    }
    else
    {
      v30 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_coalescingQueue);
      v31 = self->_coalescingTimer;
      self->_coalescingTimer = v30;

      v32 = self->_coalescingTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __31__CSIndexingQueue__queueItems___block_invoke;
      handler[3] = &unk_1E2401238;
      handler[4] = self;
      dispatch_source_set_event_handler(v32, handler);
      v33 = self->_coalescingTimer;
      v34 = dispatch_time(0, (uint64_t)(self->_idleTime * 1000000000.0));
      dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_idleTimeLeeway * 1000000000.0));
      dispatch_resume((dispatch_object_t)self->_coalescingTimer);
    }
  }
  else
  {
    mode = self->_mode;
    switch(mode)
    {
      case 2:
LABEL_33:
        -[NSMutableDictionary addEntriesFromDictionary:](self->_queuedItems, "addEntriesFromDictionary:", v5);
        -[CSIndexingQueue _flushWithAppResigned:forced:](self, "_flushWithAppResigned:forced:", 0, 0);
        break;
      case 1:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v35 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v36 = v5;
        v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v68;
LABEL_39:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v68 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v40);
            -[NSMutableDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v42, v41);
            v43 = -[NSMutableDictionary count](v35, "count");
            maximumBatchSize = v57->_maximumBatchSize;

            if (v43 >= maximumBatchSize)
              break;
            if (v38 == ++v40)
            {
              v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
              if (v38)
                goto LABEL_39;
              goto LABEL_45;
            }
          }
        }
        else
        {
LABEL_45:

          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v36 = v57->_queuedItems;
          v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v64;
LABEL_47:
            v48 = 0;
            while (1)
            {
              if (*(_QWORD *)v64 != v47)
                objc_enumerationMutation(v36);
              v49 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v48);
              -[NSMutableDictionary objectForKeyedSubscript:](v57->_queuedItems, "objectForKeyedSubscript:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v49);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v51)
                -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v50, v49);
              v52 = -[NSMutableDictionary count](v35, "count");
              v53 = v57->_maximumBatchSize;

              if (v52 >= v53)
                break;
              if (v46 == ++v48)
              {
                v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
                if (v46)
                  goto LABEL_47;
                break;
              }
            }
          }
        }

        queuedItems = v57->_queuedItems;
        v57->_queuedItems = v35;

        v5 = v56;
        break;
      case 0:
        goto LABEL_33;
    }
  }

}

- (CSIndexingQueue)initWithMode:(int64_t)a3 notifyBlock:(id)a4
{
  return -[CSIndexingQueue initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:](self, "initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:", 100, a3, a4, 5.0, 1.0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_mode == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillResignActiveNotification"), 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)CSIndexingQueue;
  -[CSIndexingQueue dealloc](&v4, sel_dealloc);
}

- (void)_applicationWillResign:(id)a3
{
  NSObject *coalescingQueue;
  _QWORD block[5];

  if (self->_mode == 2)
  {
    coalescingQueue = self->_coalescingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CSIndexingQueue__applicationWillResign___block_invoke;
    block[3] = &unk_1E2401238;
    block[4] = self;
    dispatch_async(coalescingQueue, block);
  }
}

uint64_t __42__CSIndexingQueue__applicationWillResign___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushWithAppResigned:forced:", 1, 0);
}

uint64_t __31__CSIndexingQueue__queueItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushWithAppResigned:forced:", 0, 0);
}

- (void)_flushWithAppResigned:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *coalescingTimer;
  OS_dispatch_source *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_coalescingQueue);
  coalescingTimer = self->_coalescingTimer;
  if (coalescingTimer)
  {
    dispatch_source_cancel(coalescingTimer);
    v8 = self->_coalescingTimer;
    self->_coalescingTimer = 0;

  }
  -[NSMutableDictionary allValues](self->_queuedItems, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_queuedItems, "removeAllObjects");
  v10 = objc_msgSend(v9, "count");
  if (self->_notifyBlock)
  {
    v11 = v10;
    if (v10)
    {
      logForCSLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13[0] = 67109632;
        v13[1] = v11;
        v14 = 1024;
        v15 = v5;
        v16 = 1024;
        v17 = v4;
        _os_log_impl(&dword_18C42F000, v12, OS_LOG_TYPE_INFO, "flush activites - count: %d resigned: %d forced: %d", (uint8_t *)v13, 0x14u);
      }

      (*((void (**)(void))self->_notifyBlock + 2))();
    }
  }

}

- (void)flush
{
  NSObject *coalescingQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_coalescingQueue);
  coalescingQueue = self->_coalescingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CSIndexingQueue_flush__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  dispatch_sync(coalescingQueue, block);
}

uint64_t __24__CSIndexingQueue_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushWithAppResigned:forced:", 0, 1);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)idleTime
{
  return self->_idleTime;
}

- (void)setIdleTime:(double)a3
{
  self->_idleTime = a3;
}

- (double)idleTimeLeeway
{
  return self->_idleTimeLeeway;
}

- (void)setIdleTimeLeeway:(double)a3
{
  self->_idleTimeLeeway = a3;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (void)setMaximumBatchSize:(unint64_t)a3
{
  self->_maximumBatchSize = a3;
}

- (NSMutableDictionary)queuedItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueuedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)coalescingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoalescingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)coalescingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoalescingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)notifyBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setNotifyBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_coalescingQueue, 0);
  objc_storeStrong((id *)&self->_queuedItems, 0);
}

@end
