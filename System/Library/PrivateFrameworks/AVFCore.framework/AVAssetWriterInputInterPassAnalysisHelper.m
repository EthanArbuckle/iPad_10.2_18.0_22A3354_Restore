@implementation AVAssetWriterInputInterPassAnalysisHelper

- (AVAssetWriterInputInterPassAnalysisHelper)initWithConfigurationState:(id)a3
{
  return -[AVAssetWriterInputInterPassAnalysisHelper initWithWritingHelper:](self, "initWithWritingHelper:", 0);
}

- (AVAssetWriterInputInterPassAnalysisHelper)initWithWritingHelper:(id)a3
{
  AVAssetWriterInputInterPassAnalysisHelper *v5;
  AVAssetWriterInputWritingHelper *v6;
  objc_super v8;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 3028, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("writingHelper != nil"));
  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterInputInterPassAnalysisHelper;
  v5 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v8, sel_initWithConfigurationState_, objc_msgSend(a3, "configurationState"));
  if (v5)
  {
    v6 = (AVAssetWriterInputWritingHelper *)a3;
    v5->_writingHelper = v6;
    v5->_initialPassDescription = -[AVAssetWriterInputWritingHelper currentPassDescription](v6, "currentPassDescription");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputInterPassAnalysisHelper;
  -[AVAssetWriterInputHelper dealloc](&v3, sel_dealloc);
}

- (void)startPassAnalysis
{
  AVFigAssetWriterTrack *v3;
  _QWORD v4[5];

  v3 = -[AVAssetWriterInputWritingHelper _assetWriterTrack](self->_writingHelper, "_assetWriterTrack");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AVAssetWriterInputInterPassAnalysisHelper_startPassAnalysis__block_invoke;
  v4[3] = &unk_1E3032638;
  v4[4] = self;
  -[AVFigAssetWriterTrack endPassWithCompletionHandler:](v3, "endPassWithCompletionHandler:", v4);
}

uint64_t __62__AVAssetWriterInputInterPassAnalysisHelper_startPassAnalysis__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v7;
  AVAssetWriterInputNoMorePassesHelper *v8;

  v5 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v5, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", a4);
  v7 = (void *)objc_msgSend((id)objc_msgSend(v5, "weakReferenceToAssetWriterInput"), "referencedObject");
  if (a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setCurrentPassDescription:", a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "beginPassIfAppropriate");
    v8 = *(AVAssetWriterInputNoMorePassesHelper **)(*(_QWORD *)(a1 + 32) + 24);
  }
  else
  {
    v8 = -[AVAssetWriterInputNoMorePassesHelper initWithWritingHelper:]([AVAssetWriterInputNoMorePassesHelper alloc], "initWithWritingHelper:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }
  return objc_msgSend(v7, "_setHelper:", v8);
}

- (int64_t)status
{
  return -[AVAssetWriterInputWritingHelper status](self->_writingHelper, "status");
}

- (BOOL)canPerformMultiplePasses
{
  return -[AVAssetWriterInputWritingHelper canPerformMultiplePasses](self->_writingHelper, "canPerformMultiplePasses");
}

- (id)currentPassDescription
{
  return self->_initialPassDescription;
}

- (BOOL)isReadyForMoreMediaData
{
  return 0;
}

- (BOOL)shouldRespondToInitialPassDescription
{
  return 0;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector(v7, a2, (uint64_t)CFSTR("cannot be called between the invocation of %@ and the beginning of the next pass"), v9, v10, v11, v12, v13, (uint64_t)v8), 0);
  objc_exception_throw(v14);
}

- (void)stopRequestingMediaData
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v12 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, (uint64_t)CFSTR("cannot be called between the invocation of %@ and the beginning of the next pass"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v5;

  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not allowed between the invocation of %@ and the beginning of the next pass"), NSStringFromSelector(sel_markCurrentPassAsFinished)), 0);
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector(v7, a2, (uint64_t)CFSTR("cannot be called between the invocation of %@ and the beginning of the next pass"), v9, v10, v11, v12, v13, (uint64_t)v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector(v7, a2, (uint64_t)CFSTR("cannot be called between the invocation of %@ and the beginning of the next pass"), v9, v10, v11, v12, v13, (uint64_t)v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  uint64_t v5;

  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not allowed between the invocation of %@ and the beginning of the next pass"), NSStringFromSelector(sel_markCurrentPassAsFinished)), 0);
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  uint64_t v5;

  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not allowed between the invocation of %@ and the beginning of the next pass"), NSStringFromSelector(sel_markCurrentPassAsFinished)), 0);
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return -[AVAssetWriterInputWritingHelper pixelBufferPool](self->_writingHelper, "pixelBufferPool");
}

- (void)markAsFinished
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v12 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, (uint64_t)CFSTR("cannot be called between the invocation of %@ and the beginning of the next pass"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (void)markCurrentPassAsFinished
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v12 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, (uint64_t)CFSTR("Cannot call %@ more than once for the same pass"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

@end
