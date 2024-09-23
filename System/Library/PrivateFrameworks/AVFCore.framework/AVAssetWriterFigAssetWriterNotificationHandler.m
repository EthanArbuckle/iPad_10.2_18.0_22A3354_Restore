@implementation AVAssetWriterFigAssetWriterNotificationHandler

- (AVAssetWriterFigAssetWriterNotificationHandlerDelegate)delegate
{
  return (AVAssetWriterFigAssetWriterNotificationHandlerDelegate *)-[AVWeakReference referencedObject](-[AVAssetWriterFigAssetWriterNotificationHandler _weakReferenceToDelegate](self, "_weakReferenceToDelegate"), "referencedObject");
}

- (void)setDelegate:(id)a3
{
  AVWeakReference *v4;

  v4 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  -[AVAssetWriterFigAssetWriterNotificationHandler _setWeakReferenceToDelegate:](self, "_setWeakReferenceToDelegate:", v4);

}

- (AVAssetWriterFigAssetWriterNotificationHandler)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3
{
  AVAssetWriterFigAssetWriterNotificationHandler *v4;
  OpaqueFigAssetWriter *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterFigAssetWriterNotificationHandler;
  v4 = -[AVAssetWriterFigAssetWriterNotificationHandler init](&v8, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigAssetWriter *)CFRetain(a3);
    else
      v5 = 0;
    v4->_figAssetWriter = v5;
    v4->_weakReferenceToSelf = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v4);
    v4->_didNotCallDelegate = 1;
    v6 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", v4->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleServerDiedNotification, *MEMORY[0x1E0CC3CD8], v4->_figAssetWriter, 0);
    objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", v4->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleServerDiedNotification, *MEMORY[0x1E0CA4B88], v4->_figAssetWriter, 0);
    objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", v4->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleCompletedNotification, *MEMORY[0x1E0CC3CC0], v4->_figAssetWriter, 0);
    objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", v4->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleFailedNotification, *MEMORY[0x1E0CC3CC8], v4->_figAssetWriter, 0);
    CFRetain(v4->_weakReferenceToSelf);
    v4->_notificationHandlersAreRegistered = 1;
  }
  return v4;
}

- (void)dealloc
{
  OpaqueFigAssetWriter *figAssetWriter;
  objc_super v4;

  -[AVAssetWriterFigAssetWriterNotificationHandler _teardownNotificationHandlers](self, "_teardownNotificationHandlers");
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter)
    CFRelease(figAssetWriter);

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterFigAssetWriterNotificationHandler;
  -[AVAssetWriterFigAssetWriterNotificationHandler dealloc](&v4, sel_dealloc);
}

- (void)_callDelegateIfNotCalledWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v5;

  v5 = a3;
  if (FigAtomicCompareAndSwap32())
    -[AVAssetWriterFigAssetWriterNotificationHandlerDelegate didReceiveFigAssetWriterNotificationWithSuccess:error:](-[AVAssetWriterFigAssetWriterNotificationHandler delegate](self, "delegate"), "didReceiveFigAssetWriterNotificationWithSuccess:error:", v5, a4);
}

- (void)_teardownNotificationHandlers
{
  id v3;

  if (FigAtomicCompareAndSwap32())
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleServerDiedNotification, *MEMORY[0x1E0CC3CD8], self->_figAssetWriter);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleServerDiedNotification, *MEMORY[0x1E0CA4B88], self->_figAssetWriter);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleCompletedNotification, *MEMORY[0x1E0CC3CC0], self->_figAssetWriter);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReferenceToSelf, AVAssetWriterFigAssetWriterHandleFailedNotification, *MEMORY[0x1E0CC3CC8], self->_figAssetWriter);
    CFRelease(self->_weakReferenceToSelf);
  }
}

- (void)_handleServerDiedNotification
{
  -[AVAssetWriterFigAssetWriterNotificationHandler _callDelegateIfNotCalledWithSuccess:error:](self, "_callDelegateIfNotCalledWithSuccess:error:", 0, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0));
  -[AVAssetWriterFigAssetWriterNotificationHandler _teardownNotificationHandlers](self, "_teardownNotificationHandlers");
}

- (void)_handleCompletedWritingNotification
{
  -[AVAssetWriterFigAssetWriterNotificationHandler _callDelegateIfNotCalledWithSuccess:error:](self, "_callDelegateIfNotCalledWithSuccess:error:", 1, 0);
  -[AVAssetWriterFigAssetWriterNotificationHandler _teardownNotificationHandlers](self, "_teardownNotificationHandlers");
}

- (void)_handleFailedNotificationWithError:(id)a3
{
  -[AVAssetWriterFigAssetWriterNotificationHandler _callDelegateIfNotCalledWithSuccess:error:](self, "_callDelegateIfNotCalledWithSuccess:error:", 0, a3);
  -[AVAssetWriterFigAssetWriterNotificationHandler _teardownNotificationHandlers](self, "_teardownNotificationHandlers");
}

- (AVWeakReference)_weakReferenceToDelegate
{
  return (AVWeakReference *)objc_getProperty(self, a2, 32, 1);
}

- (void)_setWeakReferenceToDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
