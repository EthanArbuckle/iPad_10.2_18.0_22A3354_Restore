@implementation MOVStreamSampleBufferAndMetadata

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_sampleBuffer = a3;
}

- (AVTimedMetadataGroup)metadata
{
  return (AVTimedMetadataGroup *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
