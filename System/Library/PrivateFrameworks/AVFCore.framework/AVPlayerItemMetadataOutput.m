@implementation AVPlayerItemMetadataOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVPlayerItemMetadataOutput)init
{
  return -[AVPlayerItemMetadataOutput initWithIdentifiers:](self, "initWithIdentifiers:", 0);
}

- (AVPlayerItemMetadataOutput)initWithIdentifiers:(NSArray *)identifiers
{
  AVPlayerItemMetadataOutput *v5;
  AVPlayerItemMetadataOutputInternal *v6;
  NSObject *v7;
  AVPlayerItemMetadataOutput *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItemMetadataOutput;
  v5 = -[AVPlayerItemOutput init](&v16, sel_init);
  if (identifiers && !-[NSArray count](identifiers, "count"))
  {
    v9 = v5;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"[identifiers count] > 0"), 0);
    objc_exception_throw(v15);
  }
  if (v5)
  {
    v6 = objc_alloc_init(AVPlayerItemMetadataOutputInternal);
    v5->_metadataOutputInternal = v6;
    if (v6)
    {
      CFRetain(v6);
      v5->_metadataOutputInternal->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemmetadataoutput.ivars");
      v5->_metadataOutputInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
      v5->_metadataOutputInternal->metadataIdentifiers = (NSArray *)-[NSArray copy](identifiers, "copy");
      v5->_metadataOutputInternal->accumulatedMetadataGroups = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v5->_metadataOutputInternal->accumulationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritemmetadataoutput.accumulationqueue", v7);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)_collectUncollectables
{
  AVPlayerItemMetadataOutputInternal *metadataOutputInternal;

  metadataOutputInternal = self->_metadataOutputInternal;
  if (metadataOutputInternal->ivarAccessQueue)
  {
    dispatch_release((dispatch_object_t)metadataOutputInternal->ivarAccessQueue);
    metadataOutputInternal = self->_metadataOutputInternal;
  }
  if (metadataOutputInternal->accumulatedMetadataGroups)
  {
    CFRelease(metadataOutputInternal->accumulatedMetadataGroups);
    metadataOutputInternal = self->_metadataOutputInternal;
  }
  if (metadataOutputInternal->accumulationQueue)
  {
    dispatch_release((dispatch_object_t)metadataOutputInternal->accumulationQueue);
    metadataOutputInternal = self->_metadataOutputInternal;
  }
  CFRelease(metadataOutputInternal);
}

- (void)dealloc
{
  AVPlayerItemMetadataOutputInternal *metadataOutputInternal;
  objc_super v4;

  metadataOutputInternal = self->_metadataOutputInternal;
  if (metadataOutputInternal)
  {

    -[AVPlayerItemMetadataOutput _collectUncollectables](self, "_collectUncollectables");
    metadataOutputInternal = self->_metadataOutputInternal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemMetadataOutput;
  -[AVPlayerItemOutput dealloc](&v4, sel_dealloc);
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
  ivarAccessQueue = self->_metadataOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItemMetadataOutput__attachToPlayerItem___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v13;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v9 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

id __50__AVPlayerItemMetadataOutput__attachToPlayerItem___block_invoke(id result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 16)
                                                                            + 40) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))
  {
    v1 = result;
    result = (id)objc_msgSend(*((id *)result + 5), "_weakReference");
    *(_QWORD *)(*(_QWORD *)(v1[4] + 16) + 40) = result;
  }
  return result;
}

- (void)_detachFromPlayerItem
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_metadataOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVPlayerItemMetadataOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __51__AVPlayerItemMetadataOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 40) = 0;
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
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_metadataOutputInternal->delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return -[AVWeakReferencingDelegateStorage delegate](self->_metadataOutputInternal->delegateStorage, "delegate");
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)-[AVWeakReferencingDelegateStorage delegateQueue](self->_metadataOutputInternal->delegateStorage, "delegateQueue");
}

- (NSTimeInterval)advanceIntervalForDelegateInvocation
{
  NSObject *ivarAccessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_metadataOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItemMetadataOutput_advanceIntervalForDelegateInvocation__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __66__AVPlayerItemMetadataOutput_advanceIntervalForDelegateInvocation__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAdvanceIntervalForDelegateInvocation:(NSTimeInterval)advanceIntervalForDelegateInvocation
{
  AVPlayerItemMetadataOutputInternal *metadataOutputInternal;
  NSObject *ivarAccessQueue;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  metadataOutputInternal = self->_metadataOutputInternal;
  v11 = 0;
  ivarAccessQueue = metadataOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__AVPlayerItemMetadataOutput_setAdvanceIntervalForDelegateInvocation___block_invoke;
  v5[3] = &unk_1E3032B20;
  *(NSTimeInterval *)&v5[7] = advanceIntervalForDelegateInvocation;
  v5[4] = self;
  v5[5] = &v12;
  v5[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  if (*((_BYTE *)v13 + 24))
    objc_msgSend((id)objc_msgSend((id)v7[5], "referencedObject"), "_evaluateMetadataOutputs");

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
}

double __70__AVPlayerItemMetadataOutput_setAdvanceIntervalForDelegateInvocation___block_invoke(uint64_t a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) != *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
                                                                                                 + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 16)
                                                                                  + 40));
  result = *(double *)(a1 + 56);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48) = result;
  return result;
}

- (void)_signalFlush
{
  NSObject *accumulationQueue;
  _QWORD block[5];

  accumulationQueue = self->_metadataOutputInternal->accumulationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(accumulationQueue, block);
}

void __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(v1 + 16) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_2;
  block[3] = &unk_1E302FA10;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(v1 + 16) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_3;
  v4[3] = &unk_1E3032B48;
  v4[4] = v1;
  return objc_msgSend(v2, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_3(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "outputSequenceWasFlushed:", *(_QWORD *)(v3 + 32));
  }
  return result;
}

- (NSDictionary)_figMetadataOutputsDictionaryOptions
{
  NSDictionary *v3;
  uint64_t v4;
  NSArray *metadataIdentifiers;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[AVPlayerItemMetadataOutput advanceIntervalForDelegateInvocation](self, "advanceIntervalForDelegateInvocation");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v4, *MEMORY[0x1E0CC4CC0]);
  metadataIdentifiers = self->_metadataOutputInternal->metadataIdentifiers;
  if (metadataIdentifiers)
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", metadataIdentifiers, *MEMORY[0x1E0CC4CC8]);
  return v3;
}

- (void)_pushTimedMetadataGroups:(id)a3 fromPlayerItemTrack:(id)a4
{
  NSObject *accumulationQueue;
  _QWORD block[7];

  if (objc_msgSend(a3, "count"))
  {
    accumulationQueue = self->_metadataOutputInternal->accumulationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke;
    block[3] = &unk_1E302FD88;
    block[4] = a3;
    block[5] = self;
    block[6] = a4;
    dispatch_async(accumulationQueue, block);
  }
}

void __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  const __CFDictionary *MutableCopy;
  void *Value;
  void *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];

  v2 = a1[4];
  v3 = (const void *)a1[6];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(*(_QWORD *)(a1[5] + 16) + 56));
  if (!v3)
    v3 = (const void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  Value = (void *)CFDictionaryGetValue(MutableCopy, v3);
  if (Value)
  {
    v6 = (void *)objc_msgSend(Value, "mutableCopy");
    objc_msgSend(v6, "addObjectsFromArray:", v2);
    CFDictionarySetValue(MutableCopy, v3, v6);

  }
  else
  {
    CFDictionarySetValue(MutableCopy, v3, (const void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v2));
  }
  v7 = *(_QWORD *)(a1[5] + 16);
  v8 = *(const void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = MutableCopy;
  if (MutableCopy)
    CFRetain(MutableCopy);
  if (v8)
    CFRelease(v8);
  if (MutableCopy)
    CFRelease(MutableCopy);
  v9 = a1[5];
  v10 = *(NSObject **)(*(_QWORD *)(v9 + 16) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_2;
  block[3] = &unk_1E302FA10;
  block[4] = v9;
  dispatch_async(v10, block);
}

void __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFAllocator *v3;
  CFDictionaryRef Copy;
  uint64_t v5;
  void *v6;
  const void *v7;
  _QWORD v8[7];

  if (CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56)) >= 1)
  {
    v2 = dispatch_semaphore_create(0);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(v5 + 16) + 16);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_3;
    v8[3] = &unk_1E3032B70;
    v8[5] = v2;
    v8[6] = Copy;
    v8[4] = v5;
    objc_msgSend(v6, "invokeDelegateCallbackWithBlock:", v8);
    v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56);
    if (v7)
      CFRelease(v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56) = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v2);
  }
}

intptr_t __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_3(intptr_t result, void *a2)
{
  intptr_t v3;
  int64_t Count;
  const void **v5;
  const void **v6;
  const void **v7;
  const void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2)
  {
    v3 = result;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 48));
      v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
      v6 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v3 + 48), v5, v6);
      if (Count >= 1)
      {
        v7 = v5;
        v8 = v6;
        do
        {
          v10 = (uint64_t)*v7++;
          v9 = v10;
          v12 = (uint64_t)*v8++;
          v11 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = 0;
          else
            v13 = v9;
          objc_msgSend(a2, "metadataOutput:didOutputTimedMetadataGroups:fromPlayerItemTrack:", *(_QWORD *)(v3 + 32), v11, v13);
          --Count;
        }
        while (Count);
      }
      free(v5);
      free(v6);
    }
    CFRelease(*(CFTypeRef *)(v3 + 48));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 40));
  }
  return result;
}

- (BOOL)isDefunct
{
  return 0;
}

@end
