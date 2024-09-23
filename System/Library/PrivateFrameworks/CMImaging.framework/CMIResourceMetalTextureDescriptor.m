@implementation CMIResourceMetalTextureDescriptor

- (CMIResourceMetalTextureDescriptor)init
{
  CMIResourceMetalTextureDescriptor *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMIResourceMetalTextureDescriptor;
  result = -[CMIResourceMetalTextureDescriptor init](&v4, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_presentationTimeStamp.value = *MEMORY[0x1E0CA2E18];
    result->_presentationTimeStamp.epoch = *(_QWORD *)(v3 + 16);
    result->_matchingPixelBufferFormat = 0;
  }
  return result;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimeStamp.value = v3;
}

- (unsigned)matchingPixelBufferFormat
{
  return self->_matchingPixelBufferFormat;
}

- (void)setMatchingPixelBufferFormat:(unsigned int)a3
{
  self->_matchingPixelBufferFormat = a3;
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_commandBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
