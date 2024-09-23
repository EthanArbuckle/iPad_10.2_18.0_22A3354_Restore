@implementation AVAssetWriterInputPassDescriptionResponder

- (AVAssetWriterInputPassDescriptionResponder)init
{
  return -[AVAssetWriterInputPassDescriptionResponder initWithCallbackQueue:block:](self, "initWithCallbackQueue:block:", 0, 0);
}

- (AVAssetWriterInputPassDescriptionResponder)initWithCallbackQueue:(id)a3 block:(id)a4
{
  AVAssetWriterInputPassDescriptionResponder *v8;
  AVAssetWriterInputPassDescriptionResponder *v9;
  NSObject *v10;
  objc_super v12;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 5257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != NULL"));
    if (a4)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 5258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)AVAssetWriterInputPassDescriptionResponder;
  v8 = -[AVAssetWriterInputPassDescriptionResponder init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_callbackQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v9->_callbackBlock = (id)objc_msgSend(a4, "copy");
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_serializationQueue = (OS_dispatch_queue *)dispatch_queue_create("AVAssetWriterInputPassDescriptionResponder serialization queue", v10);
  }
  return v9;
}

- (void)dealloc
{
  NSObject *callbackQueue;
  NSObject *serializationQueue;
  objc_super v5;

  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
    dispatch_release(callbackQueue);
  serializationQueue = self->_serializationQueue;
  if (serializationQueue)
    dispatch_release(serializationQueue);
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterInputPassDescriptionResponder;
  -[AVAssetWriterInputPassDescriptionResponder dealloc](&v5, sel_dealloc);
}

- (void)respondToNewPassDescription:(id)a3
{
  NSObject *serializationQueue;
  _QWORD v4[6];

  serializationQueue = self->_serializationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(serializationQueue, v4);
}

void __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  v4 = v2[5];
  v5 = objc_msgSend(v2, "_hasStoppedResponding");
  if (v3 != v4)
  {
    if ((v5 & 1) != 0)
      return;
    v6 = *(_QWORD *)(a1 + 40);
    goto LABEL_8;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v6 + 32))
    v7 = 1;
  else
    v7 = v5;
  if ((v7 & 1) == 0)
  {
LABEL_8:

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = *(id *)(a1 + 32);
    v8 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v9 + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke_2;
    v11[3] = &unk_1E3031550;
    v11[4] = v9;
    v11[5] = v8;
    dispatch_async(v10, v11);
    if (!*(_QWORD *)(a1 + 32))
      objc_msgSend(*(id *)(a1 + 40), "_releaseAndClearCallbackBlock_invokeOnSerializationQueue");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 1;
  }
}

void __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_hasStoppedResponding") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_releaseAndClearCallbackBlock_invokeOnSerializationQueue
{

  self->_callbackBlock = 0;
}

- (void)stopRespondingToPassDescriptions
{
  NSObject *serializationQueue;
  _QWORD block[5];

  FigAtomicIncrement32();
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVAssetWriterInputPassDescriptionResponder_stopRespondingToPassDescriptions__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

uint64_t __78__AVAssetWriterInputPassDescriptionResponder_stopRespondingToPassDescriptions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAndClearCallbackBlock_invokeOnSerializationQueue");
}

- (BOOL)_hasStoppedResponding
{
  return self->_stoppedResponding > 0;
}

@end
