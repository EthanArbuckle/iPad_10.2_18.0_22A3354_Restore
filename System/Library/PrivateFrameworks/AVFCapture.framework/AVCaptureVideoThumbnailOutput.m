@implementation AVCaptureVideoThumbnailOutput

- (CGSize)thumbnailSize
{
  AVCaptureVideoThumbnailOutputInternal *internal;
  double width;
  double height;
  CGSize result;

  internal = self->_internal;
  width = internal->thumbnailSize.width;
  height = internal->thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)filters
{
  return (NSArray *)(id)-[NSArray copy](self->_internal->filters, "copy");
}

- (void)setThumbnailContentsDelegate:(id)a3
{
  AVWeakReference *v5;

  if ((id)-[AVWeakReference referencedObject](self->_internal->delegateWeakReference, "referencedObject") != a3)
  {

    if (a3)
      v5 = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
    else
      v5 = 0;
    self->_internal->delegateWeakReference = v5;
  }
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;

  v7 = (void *)objc_msgSend(a3, "mediaType");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]))
  {
    v8 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_super v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, vto_notificationHandler, *MEMORY[0x1E0D045A0], a3, 0);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v5, sel_attachSafelyToFigCaptureSession_, a3);
}

- (AVCaptureVideoThumbnailContentsDelegate)thumbnailContentsDelegate
{
  return (AVCaptureVideoThumbnailContentsDelegate *)-[AVWeakReference referencedObject](self->_internal->delegateWeakReference, "referencedObject");
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)setThumbnailSize:(CGSize)a3
{
  AVCaptureVideoThumbnailOutputInternal *internal;

  internal = self->_internal;
  if (a3.width != internal->thumbnailSize.width || a3.height != internal->thumbnailSize.height)
  {
    internal->thumbnailSize = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (AVCaptureVideoThumbnailOutput)init
{
  AVCaptureVideoThumbnailOutput *v2;
  AVCaptureVideoThumbnailOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureVideoThumbnailOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setFilters:(id)a3
{

  self->_internal->filters = (NSArray *)objc_msgSend(a3, "copy");
  -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoThumbnailOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)setSmartStyles:(id)a3
{

  self->_internal->smartStyles = (NSArray *)objc_msgSend(a3, "copy");
  -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
}

- (NSArray)smartStyles
{
  return (NSArray *)(id)-[NSArray copy](self->_internal->smartStyles, "copy");
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_super v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vto_notificationHandler, *MEMORY[0x1E0D045A0], a3);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v5, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_super v5;

  -[AVCaptureVideoThumbnailOutput _signalInvalidationOfPropagatedContentsIfNecessary](self, "_signalInvalidationOfPropagatedContentsIfNecessary");
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  -[AVCaptureOutput safelyHandleServerConnectionDeathForFigCaptureSession:](&v5, sel_safelyHandleServerConnectionDeathForFigCaptureSession_, a3);
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CF2B90];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

+ (CGRect)contentsRectForFilterAtIndex:(unint64_t)a3 thumbnailSize:(CGSize)a4 filterCount:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v5 = (double)(a5 + 1);
  v6 = 1.0 / v5;
  v7 = (double)a3 / v5;
  v8 = 0.0;
  v9 = 1.0;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (void)_signalInvalidationOfPropagatedContentsIfNecessary
{
  AVCaptureVideoThumbnailOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (internal->didPropagateContents)
  {
    v4 = (void *)-[AVWeakReference referencedObject](internal->delegateWeakReference, "referencedObject");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "videoThumbnailOutputWillEndRenderingThumbnails:", self);
    self->_internal->didPropagateContents = 0;
  }
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D045A0]))
  {
    v6 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04220]);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)-[AVWeakReference referencedObject](self->_internal->delegateWeakReference, "referencedObject");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = objc_msgSend(v7, "intValue");
        objc_msgSend(v8, "videoThumbnailOutput:willBeginRenderingThumbnailsWithContents:", self, objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", v9));
        self->_internal->didPropagateContents = 1;
      }
    }
    else
    {
      -[AVCaptureVideoThumbnailOutput _signalInvalidationOfPropagatedContentsIfNecessary](self, "_signalInvalidationOfPropagatedContentsIfNecessary");
    }
  }
}

@end
