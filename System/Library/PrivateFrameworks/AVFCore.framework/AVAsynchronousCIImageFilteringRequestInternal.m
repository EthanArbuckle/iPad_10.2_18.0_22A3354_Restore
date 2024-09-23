@implementation AVAsynchronousCIImageFilteringRequestInternal

- (void)_willDeallocOrFinalize
{
  CVPixelBufferRelease(self->_sourcePBuf);
}

- (void)dealloc
{
  objc_super v3;

  -[AVAsynchronousCIImageFilteringRequestInternal _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousCIImageFilteringRequestInternal;
  -[AVAsynchronousCIImageFilteringRequestInternal dealloc](&v3, sel_dealloc);
}

- (AVAsynchronousVideoCompositionRequest)compositingRequest
{
  return self->_compositingRequest;
}

- (void)setCompositingRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (id)cancellationTest
{
  return self->_cancellationTest;
}

- (void)setCancellationTest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)defaultCIContextProvider
{
  return self->_defaultCIContextProvider;
}

- (void)setDefaultCIContextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CIImage)sourceCIImage
{
  return self->_sourceCIImage;
}

- (void)setSourceCIImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (__CVBuffer)sourcePBuf
{
  return self->_sourcePBuf;
}

- (void)setSourcePBuf:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
