@implementation AVPlayerItemMetadataCollector

- (AVPlayerItemMetadataCollector)init
{
  return -[AVPlayerItemMetadataCollector initWithIdentifiers:classifyingLabels:](self, "initWithIdentifiers:classifyingLabels:", 0, 0);
}

- (AVPlayerItemMetadataCollector)initWithIdentifiers:(NSArray *)identifiers classifyingLabels:(NSArray *)classifyingLabels
{
  AVPlayerItemMetadataCollector *v6;
  AVPlayerItemMetadataCollectorInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVPlayerItemMetadataCollector;
  v6 = -[AVPlayerItemMediaDataCollector init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVPlayerItemMetadataCollectorInternal);
    v6->_metadataCollectorInternal = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_metadataCollectorInternal->identifiers = (NSArray *)-[NSArray copy](identifiers, "copy");
      v6->_metadataCollectorInternal->classifyingLabels = (NSArray *)-[NSArray copy](classifyingLabels, "copy");
      v6->_metadataCollectorInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
      v6->_metadataCollectorInternal->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemmetadatacollector.ivars");
      v6->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", 0.0);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVPlayerItemMetadataCollectorInternal *metadataCollectorInternal;
  dispatch_object_t *v4;
  objc_super v5;

  metadataCollectorInternal = self->_metadataCollectorInternal;
  if (metadataCollectorInternal)
  {

    v4 = (dispatch_object_t *)self->_metadataCollectorInternal;
    if (v4[2])
    {
      dispatch_release(v4[2]);
      v4 = (dispatch_object_t *)self->_metadataCollectorInternal;
    }
    CFRelease(v4);
    metadataCollectorInternal = self->_metadataCollectorInternal;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemMetadataCollector;
  -[AVPlayerItemMediaDataCollector dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  if (delegate)
  {
    if (!delegateQueue)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = "newDelegateQueue != NULL";
      goto LABEL_7;
    }
  }
  else if (delegateQueue)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "newDelegateQueue == NULL";
LABEL_7:
    v11 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)delegateQueue, v4, v5, v6, v7, (uint64_t)v10), 0);
    objc_exception_throw(v11);
  }
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_metadataCollectorInternal->delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return -[AVWeakReferencingDelegateStorage delegate](self->_metadataCollectorInternal->delegateStorage, "delegate");
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)-[AVWeakReferencingDelegateStorage delegateQueue](self->_metadataCollectorInternal->delegateStorage, "delegateQueue");
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  BOOL v9;
  void *v11;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0);
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v13;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v9 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

id __94__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke(id result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 16)
                                                                            + 48) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))
  {
    v1 = result;
    result = (id)objc_msgSend(*((id *)result + 5), "_weakReference");
    *(_QWORD *)(*(_QWORD *)(v1[4] + 16) + 48) = result;
  }
  return result;
}

- (void)_detatchFromPlayerItem
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __96__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48) = 0;
}

- (BOOL)_isAttachedToPlayerItem
{
  NSObject *ivarAccessQueue;
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
  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___isAttachedToPlayerItem__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __97__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___isAttachedToPlayerItem__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                         + 16)
                                                                             + 48) != 0;
  return result;
}

- (id)_getFilteredMetadataGroups:(id)a3 fromIdentifiers:(id)a4 andClassifyingLabels:(id)a5 modifiedIndexesOut:(id *)a6 newIndexesOut:(id *)a7
{
  void *v11;
  NSDate *v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  AVPlayerItemMetadataCollector *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v42;
  id v43;
  void *v44;
  NSDate *v45;
  id obj;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v47 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = self->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = a3;
  v49 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v55;
    v42 = a4;
    v43 = a5;
    v45 = v12;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v55 != v48)
          objc_enumerationMutation(obj);
        v14 = -[AVDateRangeMetadataGroup _initWithTaggedRangeMetadataDictionary:items:]([AVDateRangeMetadataGroup alloc], "_initWithTaggedRangeMetadataDictionary:items:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), 0);
        v15 = v14;
        if (!a5
          || objc_msgSend(v14, "classifyingLabel")
          && objc_msgSend(a5, "containsObject:", objc_msgSend(v15, "classifyingLabel")))
        {
          v16 = (void *)objc_msgSend(v15, "modificationTimestamp");
          if (a4)
          {
            v17 = self;
            v18 = +[AVMetadataItem metadataItemsFromArray:filteredByIdentifiers:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifiers:", objc_msgSend(v15, "items"), a4);
            v19 = (void *)objc_msgSend(v15, "mutableCopy");
            objc_msgSend(v19, "setItems:", v18);

            v15 = (void *)objc_msgSend(v19, "copy");
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            if (v20)
            {
              v21 = v20;
              v22 = v11;
              v23 = *(_QWORD *)v51;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v51 != v23)
                    objc_enumerationMutation(v18);
                  v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
                  objc_msgSend((id)objc_msgSend(v25, "discoveryTimestamp"), "timeIntervalSinceReferenceDate");
                  v27 = v26;
                  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
                  if (v27 > v28)
                    v16 = (void *)objc_msgSend(v25, "discoveryTimestamp");
                }
                v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
              }
              while (v21);
              v11 = v22;
              a4 = v42;
              a5 = v43;
            }
            self = v17;
            v12 = v45;
          }
          objc_msgSend(v11, "addObject:", v15);
          objc_msgSend((id)objc_msgSend(v15, "discoveryTimestamp"), "timeIntervalSinceReferenceDate");
          v30 = v29;
          -[NSDate timeIntervalSinceReferenceDate](v12, "timeIntervalSinceReferenceDate");
          v31 = v47;
          if (v30 > v32
            || (objc_msgSend(v16, "timeIntervalSinceReferenceDate"),
                v34 = v33,
                -[NSDate timeIntervalSinceReferenceDate](v12, "timeIntervalSinceReferenceDate"),
                v31 = v44,
                v34 > v35))
          {
            objc_msgSend(v31, "addIndex:", objc_msgSend(v11, "indexOfObject:", v15));
          }
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v37 = v36;
          -[NSDate timeIntervalSinceReferenceDate](self->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp, "timeIntervalSinceReferenceDate");
          if (v37 > v38)
          {

            self->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp = (NSDate *)v16;
          }
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v49);
  }
  *a6 = (id)objc_msgSend(v44, "copy");
  *a7 = (id)objc_msgSend(v47, "copy");

  return v11;
}

- (void)_updateTaggedRangeMetadataArray:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v4);
}

uint64_t __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  _QWORD v6[8];
  id v7;
  id v8;

  v7 = 0;
  v8 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_getFilteredMetadataGroups:fromIdentifiers:andClassifyingLabels:modifiedIndexesOut:newIndexesOut:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32), &v8, &v7);
  if (objc_msgSend(v8, "count") || (result = objc_msgSend(v7, "count")) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(*(_QWORD *)(v4 + 16) + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke_2;
    v6[3] = &unk_1E3032578;
    v6[4] = v4;
    v6[5] = v2;
    v6[6] = v7;
    v6[7] = v8;
    return objc_msgSend(v5, "invokeDelegateCallbackWithBlock:", v6);
  }
  return result;
}

uint64_t __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isAttachedToPlayerItem");
  if ((_DWORD)result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "metadataCollector:didCollectDateRangeMetadataGroups:indexesOfNewGroups:indexesOfModifiedGroups:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return result;
}

@end
