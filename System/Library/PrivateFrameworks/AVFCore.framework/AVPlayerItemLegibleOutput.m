@implementation AVPlayerItemLegibleOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVPlayerItemLegibleOutput)init
{
  return -[AVPlayerItemLegibleOutput initWithMediaSubtypesForNativeRepresentation:](self, "initWithMediaSubtypesForNativeRepresentation:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
}

- (AVPlayerItemLegibleOutput)initWithMediaSubtypesForNativeRepresentation:(NSArray *)subtypes
{
  AVPlayerItemLegibleOutputRealDependencyFactory *v5;

  v5 = objc_alloc_init(AVPlayerItemLegibleOutputRealDependencyFactory);
  if (!subtypes)
    subtypes = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return -[AVPlayerItemLegibleOutput initWithDependencyFactory:mediaSubtypesForNativeRepresentation:](self, "initWithDependencyFactory:mediaSubtypesForNativeRepresentation:", v5, subtypes);
}

- (AVPlayerItemLegibleOutput)initWithDependencyFactory:(id)a3 mediaSubtypesForNativeRepresentation:(id)a4
{
  objc_class *v5;
  AVPlayerItemLegibleOutputInternal *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  objc_class *v26;
  uint64_t v27;
  objc_class *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  AVPlayerItemLegibleOutput *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v5 = (objc_class *)self;
  v42 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v34 = self;
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = "subtypes != nil";
LABEL_19:
    v27 = AVMethodExceptionReasonWithObjectAndSelector(v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v18, v19, v20, v21, v22, (uint64_t)v25);
LABEL_21:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v27, 0));
  }
  v40.receiver = self;
  v40.super_class = (Class)AVPlayerItemLegibleOutput;
  v5 = -[AVPlayerItemOutput init](&v40, sel_init);
  if (v5)
  {
    v8 = objc_alloc_init(AVPlayerItemLegibleOutputInternal);
    *((_QWORD *)v5 + 2) = v8;
    if (v8)
    {
      CFRetain(v8);
      *(_QWORD *)(*((_QWORD *)v5 + 2) + 24) = objc_alloc_init(AVWeakReferencingDelegateStorage);
      *(_QWORD *)(*((_QWORD *)v5 + 2) + 8) = a3;
      *(_QWORD *)(*((_QWORD *)v5 + 2) + 16) = objc_msgSend(a4, "copy");
      *(_QWORD *)(*((_QWORD *)v5 + 2) + 32) = av_readwrite_dispatch_queue_create("com.apple.avplayeritemlegibleoutput.ivars");
      *(_QWORD *)(*((_QWORD *)v5 + 2) + 64) = objc_msgSend(CFSTR("AVPlayerItemLegibleOutputTextStylingResolutionDefault"), "copy");
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v9 = *(void **)(*((_QWORD *)v5 + 2) + 16);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v17 = v5;
              v23 = (void *)MEMORY[0x1E0C99DA0];
              v24 = *MEMORY[0x1E0C99778];
              v25 = "[mediaSubtypeObject isKindOfClass:[NSNumber class]]";
              goto LABEL_19;
            }
            v15 = objc_msgSend(v14, "unsignedLongLongValue");
            if (HIDWORD(v15))
            {
              v26 = v5;
              v23 = (void *)MEMORY[0x1E0C99DA0];
              v24 = *MEMORY[0x1E0C99778];
              v25 = "integerValueAppearsToBeAFourCC";
              goto LABEL_19;
            }
            if (v15 == 1664495672)
            {
              v28 = v5;
              v23 = (void *)MEMORY[0x1E0C99DA0];
              v24 = *MEMORY[0x1E0C99778];
              v27 = AVMethodExceptionReasonWithObjectAndSelector(v5, a2, (uint64_t)CFSTR("Native representation is not available for media subtype 'c608'"), v29, v30, v31, v32, v33, v35);
              goto LABEL_21;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v11);
      }
    }
    else
    {

      return 0;
    }
  }
  return (AVPlayerItemLegibleOutput *)v5;
}

- (void)_collectUncollectables
{
  dispatch_object_t *legibleOutputInternal;

  legibleOutputInternal = (dispatch_object_t *)self->_legibleOutputInternal;
  if (legibleOutputInternal[4])
  {
    dispatch_release(legibleOutputInternal[4]);
    legibleOutputInternal = (dispatch_object_t *)self->_legibleOutputInternal;
  }
  CFRelease(legibleOutputInternal);
}

- (void)dealloc
{
  AVPlayerItemLegibleOutputInternal *legibleOutputInternal;
  objc_super v4;

  legibleOutputInternal = self->_legibleOutputInternal;
  if (legibleOutputInternal)
  {

    -[AVPlayerItemLegibleOutput _collectUncollectables](self, "_collectUncollectables");
    legibleOutputInternal = self->_legibleOutputInternal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemLegibleOutput;
  -[AVPlayerItemOutput dealloc](&v4, sel_dealloc);
}

- (void)_pushAttributedStrings:(id)a3 andSampleBuffers:(id)a4 atItemTime:(id *)a5
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v6[7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  delegateStorage = self->_legibleOutputInternal->delegateStorage;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__AVPlayerItemLegibleOutput__pushAttributedStrings_andSampleBuffers_atItemTime___block_invoke;
  v6[3] = &unk_1E3035488;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v7 = *a5;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v6);
}

uint64_t __80__AVPlayerItemLegibleOutput__pushAttributedStrings_andSampleBuffers_atItemTime___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v4 = *(_QWORD *)(v3 + 32);
      v5 = *(_QWORD *)(v3 + 40);
      v6 = *(_QWORD *)(v3 + 48);
      v7 = *(_OWORD *)(v3 + 56);
      v8 = *(_QWORD *)(v3 + 72);
      return objc_msgSend(a2, "legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:", v4, v5, v6, &v7);
    }
  }
  return result;
}

- (void)_signalFlush
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v3[5];

  delegateStorage = self->_legibleOutputInternal->delegateStorage;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AVPlayerItemLegibleOutput__signalFlush__block_invoke;
  v3[3] = &unk_1E3032B48;
  v3[4] = self;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
}

uint64_t __41__AVPlayerItemLegibleOutput__signalFlush__block_invoke(uint64_t result, void *a2)
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

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *ivarAccessQueue;
  BOOL v11;
  void *v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0);
    objc_exception_throw(v13);
  }
  v9 = -[AVPlayerItemLegibleOutputDependencyFactory playerItemOutputHostForPlayerItem:](self->_legibleOutputInternal->dependencyFactory, "playerItemOutputHostForPlayerItem:");
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItemLegibleOutput__attachToPlayerItem___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = v9;
  block[6] = &v15;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v11 = *((_BYTE *)v16 + 24) == 0;
  _Block_object_dispose(&v15, 8);
  return v11;
}

id __49__AVPlayerItemLegibleOutput__attachToPlayerItem___block_invoke(id result)
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

  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItemLegibleOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __50__AVPlayerItemLegibleOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 40) = 0;
}

- (id)_figLegibleOutputsDictionaryOptions
{
  void *v3;
  double v4;
  uint64_t v5;
  NSArray *nativeRepresentationSubtypes;
  _BOOL4 v7;
  _QWORD *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[AVPlayerItemLegibleOutput advanceIntervalForDelegateInvocation](self, "advanceIntervalForDelegateInvocation");
  if (v4 != 0.0)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0CC4C88]);
  }
  nativeRepresentationSubtypes = self->_legibleOutputInternal->nativeRepresentationSubtypes;
  if (nativeRepresentationSubtypes)
    objc_msgSend(v3, "setObject:forKey:", nativeRepresentationSubtypes, *MEMORY[0x1E0CC4C90]);
  v7 = -[NSString isEqualToString:](-[AVPlayerItemLegibleOutput textStylingResolution](self, "textStylingResolution"), "isEqualToString:", CFSTR("AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly"));
  v8 = (_QWORD *)MEMORY[0x1E0CC4CA8];
  if (!v7)
    v8 = (_QWORD *)MEMORY[0x1E0CC4CA0];
  objc_msgSend(v3, "setObject:forKey:", *v8, *MEMORY[0x1E0CC4C98]);
  return v3;
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
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_legibleOutputInternal->delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return -[AVWeakReferencingDelegateStorage delegate](self->_legibleOutputInternal->delegateStorage, "delegate");
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)-[AVWeakReferencingDelegateStorage delegateQueue](self->_legibleOutputInternal->delegateStorage, "delegateQueue");
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
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVPlayerItemLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __65__AVPlayerItemLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAdvanceIntervalForDelegateInvocation:(NSTimeInterval)advanceIntervalForDelegateInvocation
{
  AVPlayerItemLegibleOutputInternal *legibleOutputInternal;
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
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  legibleOutputInternal = self->_legibleOutputInternal;
  v11 = 0;
  ivarAccessQueue = legibleOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayerItemLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke;
  v5[3] = &unk_1E3032B20;
  *(NSTimeInterval *)&v5[7] = advanceIntervalForDelegateInvocation;
  v5[4] = self;
  v5[5] = &v12;
  v5[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  if (*((_BYTE *)v13 + 24))
    objc_msgSend((id)objc_msgSend((id)v7[5], "referencedObject"), "_evaluateLegibleOutputs");

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
}

double __69__AVPlayerItemLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke(uint64_t a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) != *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
                                                                                                 + 56);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 16)
                                                                                  + 40));
  result = *(double *)(a1 + 56);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56) = result;
  return result;
}

- (AVPlayerItemLegibleOutputTextStylingResolution)textStylingResolution
{
  NSObject *ivarAccessQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItemLegibleOutput_textStylingResolution__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVPlayerItemLegibleOutput_textStylingResolution__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTextStylingResolution:(AVPlayerItemLegibleOutputTextStylingResolution)textStylingResolution
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVPlayerItemLegibleOutputInternal *legibleOutputInternal;
  NSObject *ivarAccessQueue;
  void *v13;
  _QWORD block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVPlayerItemLegibleOutputTextStylingResolutionDefault"), CFSTR("AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly"), 0), "containsObject:", textStylingResolution) & 1) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Invalid text styling resolution %@"), v6, v7, v8, v9, v10, (uint64_t)textStylingResolution), 0);
    objc_exception_throw(v13);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__40;
  v19 = __Block_byref_object_dispose__40;
  legibleOutputInternal = self->_legibleOutputInternal;
  v20 = 0;
  ivarAccessQueue = legibleOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVPlayerItemLegibleOutput_setTextStylingResolution___block_invoke;
  block[3] = &unk_1E30347C8;
  block[4] = textStylingResolution;
  block[5] = self;
  block[6] = &v21;
  block[7] = &v15;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v22 + 24))
    objc_msgSend((id)objc_msgSend((id)v16[5], "referencedObject"), "_evaluateLegibleOutputs");

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

id __54__AVPlayerItemLegibleOutput_setTextStylingResolution___block_invoke(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 32) != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)
                                                                                                 + 64);
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {

    result = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 64) = result;
  }
  return result;
}

- (BOOL)suppressesPlayerRendering
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
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItemLegibleOutput_suppressesPlayerRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayerItemLegibleOutput_suppressesPlayerRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16)
                                                                            + 48);
  return result;
}

- (void)setSuppressesPlayerRendering:(BOOL)a3
{
  AVPlayerItemLegibleOutputInternal *legibleOutputInternal;
  NSObject *ivarAccessQueue;
  _QWORD v6[7];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  legibleOutputInternal = self->_legibleOutputInternal;
  v13 = 0;
  ivarAccessQueue = legibleOutputInternal->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AVPlayerItemLegibleOutput_setSuppressesPlayerRendering___block_invoke;
  v6[3] = &unk_1E3033948;
  v6[4] = self;
  v6[5] = &v14;
  v7 = a3;
  v6[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
  if (*((_BYTE *)v15 + 24))
    objc_msgSend((id)objc_msgSend((id)v9[5], "referencedObject"), "_renderingSuppressionDidChangeForOutput:", self);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

id __58__AVPlayerItemLegibleOutput_setSuppressesPlayerRendering___block_invoke(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 16)
                                                                                  + 48) != *(unsigned __int8 *)(a1 + 56);
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48) = *(_BYTE *)(a1 + 56);
  return result;
}

- (BOOL)isDefunct
{
  return 0;
}

@end
