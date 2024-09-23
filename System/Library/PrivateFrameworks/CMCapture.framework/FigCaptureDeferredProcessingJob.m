@implementation FigCaptureDeferredProcessingJob

- (id)container
{
  return self->_container;
}

- (FigCaptureDeferredProcessingJob)initWithProcessorRequest:(id)a3 delegate:(id)a4 error:(int *)a5
{
  FigCaptureDeferredProcessingJob *v8;
  BWDeferredProcessingContainer *v9;
  int v10;
  objc_super v12;
  int v13;

  v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureDeferredProcessingJob;
  v8 = -[FigCaptureDeferredProcessingJob init](&v12, sel_init);
  if (v8)
  {
    v8->_weakDelegateReference = (FigWeakReference *)+[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", a4);
    v8->_processorRequest = (FigCaptureDeferredPhotoProcessorRequest *)a3;
    v9 = -[BWDeferredProcessingContainerManager createProcessingContainerWithApplicationID:captureRequestIdentifier:openForPeeking:err:](+[BWDeferredProcessingContainerManager sharedInstance](BWDeferredProcessingContainerManager, "sharedInstance"), "createProcessingContainerWithApplicationID:captureRequestIdentifier:openForPeeking:err:", objc_msgSend(a3, "applicationID"), objc_msgSend(a3, "captureRequestIdentifier"), 0, &v13);
    v8->_container = v9;
    if (!v13)
    {
      if (-[BWPhotoManifest descriptorForIdentifier:](-[BWDeferredProcessingContainer photoManifest](v9, "photoManifest"), "descriptorForIdentifier:", objc_msgSend(a3, "photoIdentifier")))
      {
        v8->_masterPortType = -[BWStillImageCaptureSettings masterPortType](-[BWDeferredContainer captureSettings](v8->_container, "captureSettings"), "masterPortType");
      }
      else
      {
        v13 = -16136;
      }
    }
  }
  v10 = v13;
  if (a5)
    *a5 = v13;
  if (v10)
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[BWDeferredProcessingContainerManager releaseProcessingContainer:](+[BWDeferredProcessingContainerManager sharedInstance](BWDeferredProcessingContainerManager, "sharedInstance"), "releaseProcessingContainer:", self->_container);

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDeferredProcessingJob;
  -[FigCaptureDeferredProcessingJob dealloc](&v3, sel_dealloc);
}

- (void)start
{
  self->_startNS = FigGetUpTimeNanoseconds();
}

- (void)completedWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_durationNS = FigGetUpTimeNanoseconds() - self->_startNS;
  objc_msgSend(-[FigWeakReference referencedObject](self->_weakDelegateReference, "referencedObject"), "job:completedWithSampleBuffer:", self, a3);
}

+ (BOOL)isPotentiallyRecoverableError:(int)a3
{
  BOOL result;
  BOOL v4;

  result = 0;
  v4 = (a3 + 16829) > 9 || ((1 << (a3 - 67)) & 0x2EF) == 0;
  if (v4 && ((a3 + 16140) > 0xA || ((1 << (a3 + 12)) & 0x751) == 0))
    return 1;
  return result;
}

- (void)failedWithError:(int)a3
{
  uint64_t v3;
  unsigned int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;

  v3 = *(_QWORD *)&a3;
  if (+[BWDeferredProcessingContainer maxProcessingCount](BWDeferredProcessingContainer, "maxProcessingCount")&& (v5 = -[BWDeferredProcessingContainer processingCount](self->_container, "processingCount"), v5 == +[BWDeferredProcessingContainer maxProcessingCount](BWDeferredProcessingContainer, "maxProcessingCount")))
  {
    if (dword_1ECFE93B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = 4294951156;
  }
  else if (+[FigCaptureDeferredProcessingJob isPotentiallyRecoverableError:](FigCaptureDeferredProcessingJob, "isPotentiallyRecoverableError:", v3))
  {
    if (dword_1ECFE93B0)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = 4294950471;
  }
  self->_durationNS = FigGetUpTimeNanoseconds() - self->_startNS;
  objc_msgSend(-[FigWeakReference referencedObject](self->_weakDelegateReference, "referencedObject"), "job:failedWithError:", self, v3);
}

- (int64_t)durationNS
{
  return self->_durationNS;
}

- (void)setDurationNS:(int64_t)a3
{
  self->_durationNS = a3;
}

- (NSString)masterPortType
{
  return self->_masterPortType;
}

- (BOOL)isInteractiveQoS
{
  return self->_interactiveQoS;
}

- (void)setInteractiveQoS:(BOOL)a3
{
  self->_interactiveQoS = a3;
}

- (int)numberOfPhotosDelivered
{
  return self->_numberOfPhotosDelivered;
}

- (void)setNumberOfPhotosDelivered:(int)a3
{
  self->_numberOfPhotosDelivered = a3;
}

- (FigCaptureDeferredPhotoProcessorRequest)processorRequest
{
  return self->_processorRequest;
}

- (int64_t)startNS
{
  return self->_startNS;
}

- (void)setStartNS:(int64_t)a3
{
  self->_startNS = a3;
}

- (int64_t)prepareGraphNS
{
  return self->_prepareGraphNS;
}

- (void)setPrepareGraphNS:(int64_t)a3
{
  self->_prepareGraphNS = a3;
}

@end
