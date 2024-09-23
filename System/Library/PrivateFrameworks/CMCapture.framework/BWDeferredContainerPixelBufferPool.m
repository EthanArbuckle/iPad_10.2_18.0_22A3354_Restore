@implementation BWDeferredContainerPixelBufferPool

+ (void)initialize
{
  objc_opt_class();
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  BWDeferredContainerPixelBufferPool *v6;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWDeferredContainerPixelBufferPool;
  v8 = 0;
  v6 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](&v9, sel_initWithVideoFormat_capacity_name_clientProvidesPool_memoryPool_providesBackPressure_reportSlowBackPressureAllocations_, a3, a4, a5, 0, 0, 0, v8);
  if (v6)
  {
    v6->_videoFormat = (BWVideoFormat *)a3;
    -[BWDeferredCaptureContainerManager addBufferPool:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "addBufferPool:", v6);
  }
  return v6;
}

- (BWDeferredContainerPixelBufferPool)initWithAttributes:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", a3);
  return -[BWDeferredContainerPixelBufferPool initWithVideoFormat:capacity:name:](self, "initWithVideoFormat:capacity:name:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1)), a4, a5);
}

- (__CVBuffer)newPixelBuffer
{
  return -[BWDeferredCaptureContainerManager newPixelBuffer:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "newPixelBuffer:", self);
}

- (void)dealloc
{
  objc_super v3;

  -[BWDeferredCaptureContainerManager removeBufferPool:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "removeBufferPool:", self);

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredContainerPixelBufferPool;
  -[BWPixelBufferPool dealloc](&v3, sel_dealloc);
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6 additionalPixelBufferAttributes:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not allow initialization with additional pixel buffer attributes"), 0, a6, a7, a8));
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not allow initialization with external memory pools"), 0, a6));
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6 memoryPool:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not allow initialization with external memory pools"), 0, a6, a7, a8));
}

- (void)setCVPixelBufferPool:(__CVPixelBufferPool *)a3 attributes:(__CFDictionary *)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not allow the CVPixelBufferPool to be set"), 0));
}

- (void)preallocateWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support preallocation"), 0));
}

- (void)flushWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support flushing"), 0));
}

- (void)prefetchWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support prefetching"), 0));
}

- (int)preallocate
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support preallocation"), 0));
}

- (void)setCapacity:(unint64_t)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support capacity changes"), 0));
}

- (void)flush
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support flushing"), 0));
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  -[BWDeferredCaptureContainerManager flush:toMinimumCapacity:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "flush:toMinimumCapacity:", self, a3);
}

- (void)enumerateSurfacesUsingBlock:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The BWDeferredContainerPixelBufferPool class does not support surface enumeration"), 0));
}

- (__CVPixelBufferPool)cvPixelBufferPool
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The cvPixelBufferPool property is unsupported by the BWDeferredContainerPixelBufferPool class"), 0));
}

- (__CFDictionary)cvPixelBufferPoolAuxAttributes
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The cvPixelBufferPoolAuxAttributes property is unsupported by the BWDeferredContainerPixelBufferPool class"), 0));
}

- (BWVideoFormat)videoFormat
{
  return self->_videoFormat;
}

@end
