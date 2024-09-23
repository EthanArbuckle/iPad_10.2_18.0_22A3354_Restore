@implementation BKHIDEventDeliverySequence

- (BKHIDEventDeliverySequence)initWithProcessor:(id)a3 dispatcher:(id)a4 senderInfo:(id)a5 additionalContext:(id)a6 keyCommand:(id)a7 deliveryManager:(id)a8 resolutions:(id)a9 buffers:(id)a10
{
  id v17;
  id v18;
  id v19;
  BKHIDEventDeliverySequence *v20;
  BKHIDEventDeliverySequence *v21;
  NSMutableSet *v22;
  NSMutableSet *currentBuffers;
  NSMutableSet *v24;
  NSMutableSet *buffersWithIncompleteSequences;
  NSMutableSet *v26;
  NSMutableSet *currentResolutions;
  NSMutableSet *v28;
  NSMutableSet *resolutionsWithIncompleteSequences;
  NSMutableSet *v30;
  NSMutableSet *repostedToBuffers;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v38.receiver = self;
  v38.super_class = (Class)BKHIDEventDeliverySequence;
  v20 = -[BKHIDEventDeliverySequence init](&v38, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deliveryManager, a8);
    objc_storeStrong((id *)&v21->_dispatcher, a4);
    objc_storeStrong((id *)&v21->_processor, a3);
    objc_storeStrong(&v21->_additionalContext, a6);
    objc_storeStrong((id *)&v21->_senderInfo, a5);
    objc_storeStrong((id *)&v21->_keyCommand, a7);
    if (v19)
      v22 = (NSMutableSet *)objc_msgSend(v19, "mutableCopy");
    else
      v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    currentBuffers = v21->_currentBuffers;
    v21->_currentBuffers = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    buffersWithIncompleteSequences = v21->_buffersWithIncompleteSequences;
    v21->_buffersWithIncompleteSequences = v24;

    if (v18)
      v26 = (NSMutableSet *)objc_msgSend(v18, "mutableCopy");
    else
      v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    currentResolutions = v21->_currentResolutions;
    v21->_currentResolutions = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    resolutionsWithIncompleteSequences = v21->_resolutionsWithIncompleteSequences;
    v21->_resolutionsWithIncompleteSequences = v28;

    v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    repostedToBuffers = v21->_repostedToBuffers;
    v21->_repostedToBuffers = v30;

  }
  return v21;
}

- (void)dealloc
{
  __IOHIDEvent *firstEvent;
  objc_super v4;

  firstEvent = self->_firstEvent;
  if (firstEvent)
  {
    CFRelease(firstEvent);
    self->_firstEvent = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKHIDEventDeliverySequence;
  -[BKHIDEventDeliverySequence dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)postEvent:(__IOHIDEvent *)a3 position:(int64_t)a4 additionalContext:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  NSMutableSet *obj;
  id obja;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  BKHIDEventDeliverySequence *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (self->_firstEvent)
  {
    -[BKHIDEventDeliverySequence _resolveDispatchTargetsToBuffers](self, "_resolveDispatchTargetsToBuffers");
  }
  else
  {
    self->_firstEvent = (__IOHIDEvent *)IOHIDEventCreateCopy();
    objc_storeStrong(&self->_firstAdditionalContext, a5);
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = self->_currentBuffers;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  v35 = v9;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v41;
    *(_QWORD *)&v12 = 134218498;
    v31 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v16, "dispatchTarget", v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        BKLogEventDelivery();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          BKSHIDEventGetConciseDescription();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v31;
          v46 = self;
          v47 = 2114;
          v48 = v19;
          v49 = 2048;
          v50 = v16;
          _os_log_debug_impl(&dword_1C8914000, v18, OS_LOG_TYPE_DEBUG, "sq:%p append [%{public}@] to buf:%p", buf, 0x20u);

          v9 = v35;
        }

        objc_msgSend(v16, "appendEvent:sender:sequence:additionalContext:", a3, self->_senderInfo, self, v9);
        if (a4 == 3)
        {
          -[NSMutableSet removeObject:](self->_buffersWithIncompleteSequences, "removeObject:", v16);
        }
        else if (a4 == 1)
        {
          -[NSMutableSet addObject:](self->_buffersWithIncompleteSequences, "addObject:", v16);
        }
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v13);
  }

  v20 = (void *)-[NSMutableSet mutableCopy](self->_currentResolutions, "mutableCopy");
  objc_msgSend(v20, "unionSet:", self->_resolutionsWithIncompleteSequences);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obja = v20;
  v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v37;
    *(_QWORD *)&v22 = 134218498;
    v32 = v22;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(obja);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v26, "dispatchingTarget", v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v10, "containsObject:", v27);

        if ((v28 & 1) == 0)
        {
          BKLogEventDelivery();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            BKSHIDEventGetConciseDescription();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v46 = self;
            v47 = 2114;
            v48 = v30;
            v49 = 2114;
            v50 = v26;
            _os_log_debug_impl(&dword_1C8914000, v29, OS_LOG_TYPE_DEBUG, "sq:%p post [%{public}@] to resolution:%{public}@", buf, 0x20u);

          }
          -[BKHIDBufferedEventProcessor postEvent:withContext:toResolution:fromSequence:](self->_processor, "postEvent:withContext:toResolution:fromSequence:", a3, v35, v26, self);
          if (a4 == 3)
          {
            -[NSMutableSet removeObject:](self->_resolutionsWithIncompleteSequences, "removeObject:", v26);
          }
          else if (a4 == 1)
          {
            -[NSMutableSet addObject:](self->_resolutionsWithIncompleteSequences, "addObject:", v26);
          }
        }
      }
      v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v23);
  }

}

- (void)postEvent:(__IOHIDEvent *)a3 position:(int64_t)a4 additionalContext:(id)a5 fromBuffer:(id)a6 toResolution:(id)a7
{
  id v11;
  char v12;
  char v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  __int128 v30;
  void *v31;
  id v32;
  char v33;
  int64_t v34;
  id v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  BKHIDEventDeliverySequence *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v35 = a5;
  v11 = a6;
  v32 = a7;
  objc_msgSend(v32, "dispatchingTarget");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v11;
  v12 = -[NSMutableSet containsObject:](self->_repostedToBuffers, "containsObject:", v11);
  v13 = v12;
  v34 = a4;
  if (a4 <= 1 && (v12 & 1) != 0)
    goto LABEL_19;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = (void *)-[NSMutableSet copy](self->_resolutionsWithIncompleteSequences, "copy");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (!v15)
  {

LABEL_19:
    v18 = 0;
LABEL_20:
    if ((objc_msgSend(v18, "isEqual:", v32) & 1) == 0
      && (v34 != 1
       || (-[NSMutableSet containsObject:](self->_resolutionsWithIncompleteSequences, "containsObject:", v32) & 1) == 0))
    {
      if (-[NSMutableSet containsObject:](self->_buffersWithIncompleteSequences, "containsObject:", v31))
        -[NSMutableSet addObject:](self->_currentResolutions, "addObject:", v32);
      BKLogEventDelivery();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        BKSHIDEventGetConciseDescription();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v43 = self;
        v44 = 2048;
        v45 = v31;
        v46 = 2114;
        v47 = v29;
        v48 = 2114;
        v49 = v32;
        _os_log_debug_impl(&dword_1C8914000, v28, OS_LOG_TYPE_DEBUG, "sq:%p buf:%p post [%{public}@] to resolution:%{public}@", buf, 0x2Au);

      }
      -[BKHIDBufferedEventProcessor postEvent:withContext:toResolution:fromSequence:](self->_processor, "postEvent:withContext:toResolution:fromSequence:", a3, v35, v32, self);
    }
    goto LABEL_28;
  }
  v17 = v15;
  v33 = v13;
  v18 = 0;
  v19 = *(_QWORD *)v39;
  v20 = 1;
  *(_QWORD *)&v16 = 134218754;
  v30 = v16;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v39 != v19)
        objc_enumerationMutation(v14);
      v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v22, "dispatchingTarget", v30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v37, "isEqual:", v23);

      if (v24)
      {
        BKLogEventDelivery();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          BKSHIDEventGetConciseDescription();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v30;
          v43 = self;
          v44 = 2048;
          v45 = v31;
          v46 = 2114;
          v47 = v27;
          v48 = 2114;
          v49 = v32;
          _os_log_debug_impl(&dword_1C8914000, v25, OS_LOG_TYPE_DEBUG, "sq:%p buf:%p unbuffer [%{public}@] to resolution:%{public}@", buf, 0x2Au);

        }
        -[BKHIDBufferedEventProcessor postEvent:withContext:toResolution:fromSequence:](self->_processor, "postEvent:withContext:toResolution:fromSequence:", a3, v35, v22, self);
        v26 = v22;

        v20 = v33;
        if (v34 == 3)
          -[NSMutableSet removeObject:](self->_resolutionsWithIncompleteSequences, "removeObject:", v26);
        v18 = v26;
      }
    }
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  }
  while (v17);

  if ((v20 & 1) != 0)
    goto LABEL_20;
LABEL_28:

}

- (void)bufferDidDrain:(id)a3
{
  -[NSMutableSet removeObject:](self->_currentBuffers, "removeObject:", a3);
}

- (void)repostFirstEventToBufferedTargets:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__BKHIDEventDeliverySequence_repostFirstEventToBufferedTargets___block_invoke;
  v8[3] = &unk_1E81F74B0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  -[BKHIDEventDeliverySequence _resolveDispatchTargetsToBuffers:repostFirstEvent:](self, "_resolveDispatchTargetsToBuffers:repostFirstEvent:", v7, 1);
}

- (id)buffers
{
  return (id)-[NSMutableSet copy](self->_currentBuffers, "copy");
}

- (id)resolutions
{
  return (id)-[NSMutableSet copy](self->_currentResolutions, "copy");
}

- (void)_resolveDispatchTargetsToBuffers
{
  id v3;

  -[BKHIDEventDeliveryManager currentBuffersPerDispatchTarget](self->_deliveryManager, "currentBuffersPerDispatchTarget");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BKHIDEventDeliverySequence _resolveDispatchTargetsToBuffers:repostFirstEvent:](self, "_resolveDispatchTargetsToBuffers:repostFirstEvent:", v3, 0);

}

- (void)_resolveDispatchTargetsToBuffers:(id)a3 repostFirstEvent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  BKHIDEventDeliverySequence *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)-[NSMutableSet copy](self->_currentResolutions, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 134218498;
    v19 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "dispatchingTarget", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[NSMutableSet removeObject:](self->_currentResolutions, "removeObject:", v13);
          -[NSMutableSet addObject:](self->_currentBuffers, "addObject:", v15);
          BKLogEventDelivery();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v19;
            v25 = self;
            v26 = 2114;
            v27 = v13;
            v28 = 2048;
            v29 = v15;
            _os_log_debug_impl(&dword_1C8914000, v16, OS_LOG_TYPE_DEBUG, "sq:%p %{public}@ is now buffering to buf:%p", buf, 0x20u);
          }

          if (v4)
          {
            BKLogEventDelivery();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              BKSHIDEventGetConciseDescription();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v25 = self;
              v26 = 2114;
              v27 = v18;
              v28 = 2048;
              v29 = v15;
              _os_log_debug_impl(&dword_1C8914000, v17, OS_LOG_TYPE_DEBUG, "sq:%p repost [%{public}@] to buf:%p", buf, 0x20u);

            }
            objc_msgSend(v15, "appendEvent:sender:sequence:additionalContext:", self->_firstEvent, self->_senderInfo, self, self->_firstAdditionalContext);
            -[NSMutableSet addObject:](self->_buffersWithIncompleteSequences, "addObject:", v15);
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v10);
  }

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKHIDEventDeliverySequence *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E81F7CF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (id)firstAdditionalContext
{
  return objc_getProperty(self, a2, 104, 1);
}

- (BKSHIDEventKeyCommand)keyCommand
{
  return (BKSHIDEventKeyCommand *)objc_getProperty(self, a2, 48, 1);
}

- (BKHIDEventDispatcher)dispatcher
{
  return (BKHIDEventDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (BKHIDBufferedEventProcessor)processor
{
  return (BKHIDBufferedEventProcessor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstAdditionalContext, 0);
  objc_storeStrong((id *)&self->_repostedToBuffers, 0);
  objc_storeStrong((id *)&self->_resolutionsWithIncompleteSequences, 0);
  objc_storeStrong((id *)&self->_currentResolutions, 0);
  objc_storeStrong((id *)&self->_buffersWithIncompleteSequences, 0);
  objc_storeStrong((id *)&self->_currentBuffers, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
  objc_storeStrong(&self->_additionalContext, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
}

id __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id result;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke_2;
  v8[3] = &unk_1E81F74D8;
  v2 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "appendCustomFormatWithName:block:", CFSTR("sq"), v8);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count");
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "bs_compactMap:", &__block_literal_global_1444);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("buffers"));

  }
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count");
  if (result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), 0);
  if (!v3)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("(no destinations)"), 0);
  return result;
}

uint64_t __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 32));
}

uint64_t __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dispatchTarget");
}

void __64__BKHIDEventDeliverySequence_repostFirstEventToBufferedTargets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v6);
  }

}

@end
