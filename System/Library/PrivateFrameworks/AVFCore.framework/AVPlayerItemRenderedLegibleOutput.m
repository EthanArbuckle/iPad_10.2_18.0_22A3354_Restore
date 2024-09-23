@implementation AVPlayerItemRenderedLegibleOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVPlayerItemRenderedLegibleOutput)initWithVideoDisplaySize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;

  if (a3.width == 0.0 || a3.height == 0.0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("AVPlayerItemRenderedLegibleOutput shall be initialized with a valid videoDisplaySize having non-zero height and width"), v3, v4, v5, v6, v7, v10), 0);
    objc_exception_throw(v9);
  }
  return -[AVPlayerItemRenderedLegibleOutput initWithDependencyFactory:videoDisplaySize:](self, "initWithDependencyFactory:videoDisplaySize:", objc_alloc_init(AVPlayerItemRenderedLegibleOutputRealDependencyFactory), a3.width, a3.height);
}

- (AVPlayerItemRenderedLegibleOutput)initWithDependencyFactory:(id)a3 videoDisplaySize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  AVPlayerItemRenderedLegibleOutput *v7;
  objc_super v9;

  height = a4.height;
  width = a4.width;
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerItemRenderedLegibleOutput;
  v7 = -[AVPlayerItemOutput init](&v9, sel_init);
  if (v7)
  {
    v7->_delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
    v7->_dependencyFactory = (AVPlayerItemRenderedLegibleOutputDependencyFactory *)a3;
    v7->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemrenderedlegibleoutput.ivars");
    v7->_videoDisplaySize.width = width;
    v7->_videoDisplaySize.height = height;
    v7->_suppressesPlayerRendering = 0;
  }
  return v7;
}

- (void)_collectUncollectables
{
  NSObject *ivarAccessQueue;

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayerItemRenderedLegibleOutput _collectUncollectables](self, "_collectUncollectables");
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemRenderedLegibleOutput;
  -[AVPlayerItemOutput dealloc](&v3, sel_dealloc);
}

- (void)_pushRenderedCaptionImages:(id)a3 atItemTime:(id *)a4
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v5[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  delegateStorage = self->_delegateStorage;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__AVPlayerItemRenderedLegibleOutput__pushRenderedCaptionImages_atItemTime___block_invoke;
  v5[3] = &unk_1E3033920;
  v5[4] = self;
  v5[5] = a3;
  v6 = *a4;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v5);
}

uint64_t __75__AVPlayerItemRenderedLegibleOutput__pushRenderedCaptionImages_atItemTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 64);
    return objc_msgSend(a2, "renderedLegibleOutput:didOutputRenderedCaptionImages:forItemTime:", v5, v6, &v7);
  }
  return result;
}

- (void)_signalFlush
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v3[5];

  delegateStorage = self->_delegateStorage;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AVPlayerItemRenderedLegibleOutput__signalFlush__block_invoke;
  v3[3] = &unk_1E3032B48;
  v3[4] = self;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
}

uint64_t __49__AVPlayerItemRenderedLegibleOutput__signalFlush__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "outputSequenceWasFlushed:", *(_QWORD *)(a1 + 32));
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
  v9 = -[AVPlayerItemRenderedLegibleOutputDependencyFactory playerItemOutputHostForPlayerItem:](self->_dependencyFactory, "playerItemOutputHostForPlayerItem:");
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItemRenderedLegibleOutput__attachToPlayerItem___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = v9;
  block[6] = &v15;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v11 = *((_BYTE *)v16 + 24) == 0;
  _Block_object_dispose(&v15, 8);
  return v11;
}

id __57__AVPlayerItemRenderedLegibleOutput__attachToPlayerItem___block_invoke(id result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24) = *(_QWORD *)(*((_QWORD *)result + 4) + 40) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))
  {
    v1 = result;
    result = (id)objc_msgSend(*((id *)result + 5), "_weakReference");
    *(_QWORD *)(v1[4] + 40) = result;
  }
  return result;
}

- (void)_detachFromPlayerItem
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVPlayerItemRenderedLegibleOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __58__AVPlayerItemRenderedLegibleOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

- (id)_figRenderedLegibleOutputsDictionaryOptions
{
  void *v3;
  double v4;
  double v5;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v7;
  CGSize v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[AVPlayerItemRenderedLegibleOutput advanceIntervalForDelegateInvocation](self, "advanceIntervalForDelegateInvocation");
  v5 = v4;
  -[AVPlayerItemRenderedLegibleOutput videoDisplaySize](self, "videoDisplaySize");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v9);
  if (v5 != 0.0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0CC5430]);
  }
  objc_msgSend(v3, "setObject:forKey:", DictionaryRepresentation, *MEMORY[0x1E0CC5438]);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if ((unint64_t)a3 | (unint64_t)a4 && (!a3 || !a4))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"(newDelegate == nil && newDelegateQueue == NULL) || (newDelegate != nil && newDelegateQueue != NULL)"), 0);
    objc_exception_throw(v8);
  }
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_delegateStorage, "setDelegate:queue:");
}

- (AVPlayerItemRenderedLegibleOutputPushDelegate)delegate
{
  return (AVPlayerItemRenderedLegibleOutputPushDelegate *)-[AVWeakReferencingDelegateStorage delegate](self->_delegateStorage, "delegate");
}

- (OS_dispatch_queue)delegateQueue
{
  return -[AVWeakReferencingDelegateStorage delegateQueue](self->_delegateStorage, "delegateQueue");
}

- (double)advanceIntervalForDelegateInvocation
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
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__AVPlayerItemRenderedLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __73__AVPlayerItemRenderedLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 56);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAdvanceIntervalForDelegateInvocation:(double)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[8];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__AVPlayerItemRenderedLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke;
  v4[3] = &unk_1E3032B20;
  *(double *)&v4[7] = a3;
  v4[4] = self;
  v4[5] = &v11;
  v4[6] = &v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
  if (*((_BYTE *)v12 + 24))
    objc_msgSend((id)objc_msgSend((id)v6[5], "referencedObject"), "_evaluateRenderedLegibleOutputs");

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v11, 8);
}

double __77__AVPlayerItemRenderedLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke(uint64_t a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) != *(double *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 56);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  result = *(double *)(a1 + 56);
  *(double *)(*(_QWORD *)(a1 + 32) + 56) = result;
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
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItemRenderedLegibleOutput_suppressesPlayerRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__AVPlayerItemRenderedLegibleOutput_suppressesPlayerRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)setSuppressesPlayerRendering:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[7];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItemRenderedLegibleOutput_setSuppressesPlayerRendering___block_invoke;
  v5[3] = &unk_1E3033948;
  v5[4] = self;
  v5[5] = &v13;
  v6 = a3;
  v5[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  if (*((_BYTE *)v14 + 24))
    objc_msgSend((id)objc_msgSend((id)v8[5], "referencedObject"), "_renderingSuppressionDidChangeForOutput:", self);

  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
}

id __66__AVPlayerItemRenderedLegibleOutput_setSuppressesPlayerRendering___block_invoke(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48) != *(unsigned __int8 *)(a1 + 56);
  result = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = *(_BYTE *)(a1 + 56);
  return result;
}

- (BOOL)isDefunct
{
  return 0;
}

- (CGSize)videoDisplaySize
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AVPlayerItemRenderedLegibleOutput_videoDisplaySize__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

__n128 __53__AVPlayerItemRenderedLegibleOutput_videoDisplaySize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 64);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setVideoDisplaySize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  void *v9;
  uint64_t v10;
  _QWORD block[7];
  CGSize v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  if (a3.width == 0.0 || a3.height == 0.0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("videoDisplaySize for AVPlayerItemRenderedLegibleOutput shall have non-zero height and width"), v3, v4, v5, v6, v7, v10), 0);
    objc_exception_throw(v9);
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__20;
  v17 = __Block_byref_object_dispose__20;
  ivarAccessQueue = self->_ivarAccessQueue;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItemRenderedLegibleOutput_setVideoDisplaySize___block_invoke;
  block[3] = &unk_1E3033970;
  block[4] = self;
  block[5] = &v19;
  v12 = a3;
  block[6] = &v13;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v20 + 24))
    objc_msgSend((id)objc_msgSend((id)v14[5], "referencedObject"), "_evaluateRenderedLegibleOutputs");

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

__n128 __57__AVPlayerItemRenderedLegibleOutput_setVideoDisplaySize___block_invoke(uint64_t a1)
{
  BOOL v2;
  __n128 result;

  v2 = *(double *)(*(_QWORD *)(a1 + 32) + 64) != *(double *)(a1 + 56);
  if (*(double *)(*(_QWORD *)(a1 + 32) + 72) != *(double *)(a1 + 64))
    v2 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  result = *(__n128 *)(a1 + 56);
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 64) = result;
  return result;
}

@end
