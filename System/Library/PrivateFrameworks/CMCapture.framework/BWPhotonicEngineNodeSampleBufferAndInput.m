@implementation BWPhotonicEngineNodeSampleBufferAndInput

- (BWPhotonicEngineNodeSampleBufferAndInput)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 nodeInput:(id)a4
{
  BWPhotonicEngineNodeSampleBufferAndInput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInput;
  v6 = -[BWPhotonicEngineNodeSampleBufferAndInput init](&v8, sel_init);
  if (v6)
  {
    if (a3 && (v6->_sampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3), a4))
    {
      v6->_nodeInput = (BWNodeInput *)a4;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *sampleBuffer;
  objc_super v4;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
    CFRelease(sampleBuffer);

  v4.receiver = self;
  v4.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInput;
  -[BWPhotonicEngineNodeSampleBufferAndInput dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (BWNodeInput)nodeInput
{
  return self->_nodeInput;
}

@end
