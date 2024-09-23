@implementation VCCaptionsReceiver

- (VCCaptionsReceiver)initWithDelegate:(id)a3
{
  VCCaptionsReceiver *v4;
  VCCaptionsReceiver *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCCaptionsReceiver;
  v4 = -[VCCaptionsReceiver init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak(&v4->_delegate, a3);
    VCCaptionsDecoder_Create(&v5->_captionsDecoder);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VCCaptionsDecoder_Destroy((uint64_t *)&self->_captionsDecoder);
  -[VCCaptionsReceiver setCurrentTranscription:](self, "setCurrentTranscription:", 0);
  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsReceiver;
  -[VCCaptionsReceiver dealloc](&v3, sel_dealloc);
}

- (VCCaptionsReceiverDelegate)delegate
{
  return (VCCaptionsReceiverDelegate *)objc_loadWeak(&self->_delegate);
}

- (VCCaptionsTranscription)currentTranscription
{
  return self->_currentTranscription;
}

- (void)setCurrentTranscription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
