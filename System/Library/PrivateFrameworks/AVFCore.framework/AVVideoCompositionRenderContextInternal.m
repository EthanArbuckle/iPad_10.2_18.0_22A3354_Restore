@implementation AVVideoCompositionRenderContextInternal

- (void)_willDeallocOrFinalize
{
  NSObject *pixelBufferPoolQ;
  __CVPixelBufferPool *pixelBufferPool;
  __CFDictionary *pixelAspectRatioDict;
  __CFDictionary *cleanApertureDict;

  FigSimpleMutexDestroy();
  pixelBufferPoolQ = self->_pixelBufferPoolQ;
  if (pixelBufferPoolQ)
  {
    dispatch_sync(pixelBufferPoolQ, &__block_literal_global_38);
    dispatch_release((dispatch_object_t)self->_pixelBufferPoolQ);
  }
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
    CFRelease(pixelBufferPool);
  pixelAspectRatioDict = self->_pixelAspectRatioDict;
  if (pixelAspectRatioDict)
    CFRelease(pixelAspectRatioDict);
  cleanApertureDict = self->_cleanApertureDict;
  if (cleanApertureDict)
    CFRelease(cleanApertureDict);
}

- (void)dealloc
{
  objc_super v3;

  -[AVVideoCompositionRenderContextInternal _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVVideoCompositionRenderContextInternal;
  -[AVVideoCompositionRenderContextInternal dealloc](&v3, sel_dealloc);
}

@end
