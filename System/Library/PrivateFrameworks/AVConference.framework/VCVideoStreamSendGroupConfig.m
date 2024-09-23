@implementation VCVideoStreamSendGroupConfig

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamSendGroupConfig;
  -[VCMediaStreamSendGroupConfig dealloc](&v3, sel_dealloc);
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (VCSessionUplinkVideoStreamController)uplinkVideoStreamController
{
  return self->_uplinkVideoStreamController;
}

- (void)setUplinkVideoStreamController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

@end
