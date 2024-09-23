@implementation FigCaptureSessionPreviewSinkPipeline

- (NSString)sourceID
{
  return self->_sourceID;
}

- (BOOL)previewSinkEnabled
{
  return self->_previewSinkEnabled;
}

- (void)setPreviewSinkEnabled:(BOOL)a3
{
  self->_previewSinkEnabled = a3;
}

- (void)setPreviewRunning:(BOOL)a3
{
  self->_previewRunning = a3;
}

- (BOOL)previewRunning
{
  return self->_previewRunning;
}

- (void)setSourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (void)setImageQueueUpdatedNotificationSent:(BOOL)a3
{
  self->_imageQueueUpdatedNotificationSent = a3;
}

- (BOOL)imageQueueUpdatedNotificationSent
{
  return self->_imageQueueUpdatedNotificationSent;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionPreviewSinkPipeline;
  -[FigCapturePreviewSinkPipeline dealloc](&v3, sel_dealloc);
}

@end
