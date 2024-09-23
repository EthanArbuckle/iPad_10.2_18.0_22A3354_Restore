@implementation AVCoreImageFilterCustomVideoCompositor

+ (void)initialize
{
  objc_opt_class();
}

- (AVCoreImageFilterCustomVideoCompositor)init
{
  AVCoreImageFilterCustomVideoCompositor *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCoreImageFilterCustomVideoCompositor;
  v2 = -[AVCoreImageFilterCustomVideoCompositor init](&v5, sel_init);
  if (v2)
  {
    v2->_filteringRequestsInFlight = (OS_dispatch_group *)dispatch_group_create();
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_defaultCIContextThreadSafety = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVStorylineCustomVideoCompositor._renderContextQ", v3);
  }
  return v2;
}

- (void)_willDeallocOrFinalize
{
  NSObject *filteringRequestsInFlight;
  NSObject *defaultCIContextThreadSafety;

  filteringRequestsInFlight = self->_filteringRequestsInFlight;
  if (filteringRequestsInFlight)
    dispatch_release(filteringRequestsInFlight);
  defaultCIContextThreadSafety = self->_defaultCIContextThreadSafety;
  if (defaultCIContextThreadSafety)
    dispatch_release(defaultCIContextThreadSafety);
}

- (void)dealloc
{
  objc_super v3;

  -[AVCoreImageFilterCustomVideoCompositor _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVCoreImageFilterCustomVideoCompositor;
  -[AVCoreImageFilterCustomVideoCompositor dealloc](&v3, sel_dealloc);
}

- (NSDictionary)sourcePixelBufferAttributes
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA9028];
  v4[0] = *MEMORY[0x1E0CA9040];
  v4[1] = v2;
  v5[0] = &unk_1E3093C28;
  v5[1] = MEMORY[0x1E0C9AAB0];
  v4[2] = *MEMORY[0x1E0CA8FF0];
  v5[2] = MEMORY[0x1E0C9AA70];
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA9028];
  v4[0] = *MEMORY[0x1E0CA9040];
  v4[1] = v2;
  v5[0] = &unk_1E3093C40;
  v5[1] = MEMORY[0x1E0C9AAB0];
  v4[2] = *MEMORY[0x1E0CA8FF0];
  v5[2] = MEMORY[0x1E0C9AA70];
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (void)renderContextChanged:(id)a3
{
  NSObject *defaultCIContextThreadSafety;
  _QWORD block[5];

  defaultCIContextThreadSafety = self->_defaultCIContextThreadSafety;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVCoreImageFilterCustomVideoCompositor_renderContextChanged___block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(defaultCIContextThreadSafety, block);
}

void __63__AVCoreImageFilterCustomVideoCompositor_renderContextChanged___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
}

- (OS_dispatch_group)filteringRequestsInFlight
{
  return self->_filteringRequestsInFlight;
}

- (id)defaultCIContext
{
  NSObject *defaultCIContextThreadSafety;
  id v3;
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
  v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  v11 = 0;
  defaultCIContextThreadSafety = self->_defaultCIContextThreadSafety;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVCoreImageFilterCustomVideoCompositor_defaultCIContext__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(defaultCIContextThreadSafety, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __58__AVCoreImageFilterCustomVideoCompositor_defaultCIContext__block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E0C9DD90]);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)startVideoCompositionRequest:(id)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  AVAsynchronousCIImageFilteringRequest *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  if (-[AVCoreImageFilterCustomVideoCompositor shouldCancelAllRequests](self, "shouldCancelAllRequests"))
  {
    objc_msgSend(a3, "finishCancelledRequest");
  }
  else
  {
    v6 = (void *)objc_msgSend(a3, "videoCompositionInstruction");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Expecting video composition to contain only AVCoreImageFilterVideoCompositionInstruction"), v7, v8, v9, v10, v11, v18), 0);
      objc_exception_throw(v17);
    }
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "sourceTrackIDs"), "firstObject");
    if (v12)
      v13 = objc_msgSend(a3, "sourceFrameByTrackID:", objc_msgSend(v12, "intValue"));
    else
      v13 = 0;
    dispatch_group_enter((dispatch_group_t)self->_filteringRequestsInFlight);
    v14 = [AVAsynchronousCIImageFilteringRequest alloc];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke;
    v21[3] = &unk_1E3035540;
    v21[4] = self;
    v19[4] = self;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_2;
    v20[3] = &unk_1E3035568;
    v20[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_3;
    v19[3] = &unk_1E302FA10;
    v15 = -[AVAsynchronousCIImageFilteringRequest initUsingCompositingRequest:sourceFrame:cancellationTest:defaultCIContextProvider:completionHandler:](v14, "initUsingCompositingRequest:sourceFrame:cancellationTest:defaultCIContextProvider:completionHandler:", a3, v13, v21, v20, v19);
    v16 = objc_msgSend(v6, "handler");
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v15);
  }
}

uint64_t __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldCancelAllRequests");
}

uint64_t __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "defaultCIContext");
}

void __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave((dispatch_group_t)objc_msgSend(*(id *)(a1 + 32), "filteringRequestsInFlight"));
}

- (void)cancelAllPendingVideoCompositionRequests
{
  -[AVCoreImageFilterCustomVideoCompositor setShouldCancelAllRequests:](self, "setShouldCancelAllRequests:", 1);
  dispatch_group_wait((dispatch_group_t)self->_filteringRequestsInFlight, 0xFFFFFFFFFFFFFFFFLL);
  -[AVCoreImageFilterCustomVideoCompositor setShouldCancelAllRequests:](self, "setShouldCancelAllRequests:", 0);
}

- (BOOL)supportsWideColorSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

- (BOOL)shouldCancelAllRequests
{
  return self->_shouldCancelAllRequests;
}

- (void)setShouldCancelAllRequests:(BOOL)a3
{
  self->_shouldCancelAllRequests = a3;
}

@end
