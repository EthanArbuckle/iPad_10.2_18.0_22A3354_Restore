@implementation AVAssetWriterInputNoMorePassesHelper

- (AVAssetWriterInputNoMorePassesHelper)initWithConfigurationState:(id)a3
{
  return -[AVAssetWriterInputNoMorePassesHelper initWithWritingHelper:](self, "initWithWritingHelper:", 0);
}

- (AVAssetWriterInputNoMorePassesHelper)initWithWritingHelper:(id)a3
{
  AVAssetWriterInputNoMorePassesHelper *v5;
  objc_super v7;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 3179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("writingHelper != nil"));
  v7.receiver = self;
  v7.super_class = (Class)AVAssetWriterInputNoMorePassesHelper;
  v5 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v7, sel_initWithConfigurationState_, objc_msgSend(a3, "configurationState"));
  if (v5)
    v5->_writingHelper = (AVAssetWriterInputWritingHelper *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputNoMorePassesHelper;
  -[AVAssetWriterInputHelper dealloc](&v3, sel_dealloc);
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
  return 0;
}

- (BOOL)isReadyForMoreMediaData
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
  v8 = NSStringFromSelector(sel_currentPassDescription);
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("cannot be called when no media data is being requested.  Check the value of %@."), v9, v10, v11, v12, v13, (uint64_t)v8), 0);
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
  v6 = NSStringFromSelector(sel_currentPassDescription);
  v12 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithClassAndSelector(v5, a2, (uint64_t)CFSTR("cannot be called when no media data is being requested.  Check the value of %@."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v5;

  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not allowed when no media data is being requested.  Check the value of %@."), NSStringFromSelector(sel_currentPassDescription)), 0);
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
  v8 = NSStringFromSelector(sel_currentPassDescription);
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("cannot be called when no media data is being requested.  Check the value of %@."), v9, v10, v11, v12, v13, (uint64_t)v8), 0);
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
  v8 = NSStringFromSelector(sel_currentPassDescription);
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("cannot be called when no media data is being requested.  Check the value of %@."), v9, v10, v11, v12, v13, (uint64_t)v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  uint64_t v5;

  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not allowed when no media data is being requested.  Check the value of %@."), NSStringFromSelector(sel_currentPassDescription)), 0);
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  uint64_t v5;

  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not allowed when no media data is being requested.  Check the value of %@."), NSStringFromSelector(sel_currentPassDescription)), 0);
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
  -[AVAssetWriterInputWritingHelper markAsFinishedAndTransitionCurrentHelper:](self->_writingHelper, "markAsFinishedAndTransitionCurrentHelper:", self);
}

- (void)markCurrentPassAsFinished
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  v11 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, (uint64_t)CFSTR("cannot be called after the final pass"), v6, v7, v8, v9, v10, v12), 0);
  objc_exception_throw(v11);
}

@end
