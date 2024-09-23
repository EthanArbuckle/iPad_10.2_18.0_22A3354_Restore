@implementation VCStreamInputAudio

- (VCStreamInputAudio)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7
{
  VCStreamInputAudio *result;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCStreamInputAudio;
  result = -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:](&v8, sel_initWithStreamInputID_format_delegate_delegateQueue_remoteQueue_, a3, a4, a5, a6, a7);
  if (result)
  {
    result->super._receiverQueue = 0;
    result->_sampleBufferDelegateCallback = 0;
    LODWORD(result->_sampleBufferDelegateCallbackContext) = 0;
    result->super._sampleBufferHandler = _VCStreamInputAudio_SampleBufferHandler;
  }
  return result;
}

- (void)dealloc
{
  void **p_sampleBufferDelegateCallbackContext;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  p_sampleBufferDelegateCallbackContext = &self->_sampleBufferDelegateCallbackContext;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_sampleBufferDelegateCallbackContext);
  self->super._receiverQueue = 0;
  self->_sampleBufferDelegateCallback = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)p_sampleBufferDelegateCallbackContext);
  v4.receiver = self;
  v4.super_class = (Class)VCStreamInputAudio;
  -[VCStreamInput dealloc](&v4, sel_dealloc);
}

- (void)registerSampleBufferCallback:(void *)a3 context:(void *)a4
{
  void **p_sampleBufferDelegateCallbackContext;

  p_sampleBufferDelegateCallbackContext = &self->_sampleBufferDelegateCallbackContext;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_sampleBufferDelegateCallbackContext);
  self->super._receiverQueue = (opaqueVCRemoteImageQueue *)a3;
  self->_sampleBufferDelegateCallback = a4;
  os_unfair_lock_unlock((os_unfair_lock_t)p_sampleBufferDelegateCallbackContext);
}

@end
