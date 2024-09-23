@implementation AVAsynchronousCIImageFilteringRequest

- (id)initUsingCompositingRequest:(id)a3 sourceFrame:(__CVBuffer *)a4 cancellationTest:(id)a5 defaultCIContextProvider:(id)a6 completionHandler:(id)a7
{
  AVAsynchronousCIImageFilteringRequest *v12;
  AVAsynchronousCIImageFilteringRequestInternal *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAsynchronousCIImageFilteringRequest;
  v12 = -[AVAsynchronousCIImageFilteringRequest init](&v15, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(AVAsynchronousCIImageFilteringRequestInternal);
    v12->_internal = v13;
    CFRetain(v13);
    -[AVAsynchronousCIImageFilteringRequestInternal setCompositingRequest:](v12->_internal, "setCompositingRequest:", a3);
    -[AVAsynchronousCIImageFilteringRequestInternal setCancellationTest:](v12->_internal, "setCancellationTest:", a5);
    -[AVAsynchronousCIImageFilteringRequestInternal setDefaultCIContextProvider:](v12->_internal, "setDefaultCIContextProvider:", a6);
    -[AVAsynchronousCIImageFilteringRequestInternal setCompletionHandler:](v12->_internal, "setCompletionHandler:", a7);
    -[AVAsynchronousCIImageFilteringRequestInternal setSourcePBuf:](v12->_internal, "setSourcePBuf:", a4);
  }
  return v12;
}

- (void)_willDeallocOrFinalize
{
  AVAsynchronousCIImageFilteringRequestInternal *internal;

  internal = self->_internal;
  if (internal)
    CFRelease(internal);
}

- (void)dealloc
{
  objc_super v3;

  -[AVAsynchronousCIImageFilteringRequest _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousCIImageFilteringRequest;
  -[AVAsynchronousCIImageFilteringRequest dealloc](&v3, sel_dealloc);
}

- (CGSize)renderSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVVideoCompositionRenderContext size](-[AVAsynchronousVideoCompositionRequest renderContext](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "renderContext"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CIImage)sourceImage
{
  id v3;
  __CVBuffer *v4;
  uint64_t v5;
  void *v6;
  int RotationAngleAndFlipsFromCGAffineTransform;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  AVVideoCompositionRenderContext *v16;
  AVVideoCompositionRenderContext *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform t1;
  CGAffineTransform t2;
  __int16 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  if (!-[AVAsynchronousCIImageFilteringRequestInternal sourceCIImage](self->_internal, "sourceCIImage"))
  {
    v3 = -[AVAsynchronousVideoCompositionRequest videoCompositionInstruction](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "videoCompositionInstruction");
    if (-[AVAsynchronousCIImageFilteringRequestInternal sourcePBuf](self->_internal, "sourcePBuf"))
    {
      v4 = -[AVAsynchronousCIImageFilteringRequestInternal sourcePBuf](self->_internal, "sourcePBuf");
      v5 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v4);
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithColor:", objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.0, 0.0, 0.0));
    }
    v6 = (void *)v5;
    memset(&v29, 0, sizeof(v29));
    if (v3)
      objc_msgSend(v3, "sourceTrackPreferredTransform");
    v28 = v29;
    if (!CGAffineTransformIsIdentity(&v28))
    {
      v27 = 0;
      v28 = v29;
      RotationAngleAndFlipsFromCGAffineTransform = FigGetRotationAngleAndFlipsFromCGAffineTransform();
      objc_msgSend(v6, "extent");
      v9 = v8;
      v11 = v10;
      CGAffineTransformMakeTranslation(&v28, v8 * -0.5, v10 * -0.5);
      v29 = v28;
      CGAffineTransformMakeRotation(&t2, (double)-RotationAngleAndFlipsFromCGAffineTransform * 3.14159265 / 180.0);
      t1 = v29;
      CGAffineTransformConcat(&v28, &t1, &t2);
      v29 = v28;
      v12 = -1.0;
      if ((_BYTE)v27)
        v13 = -1.0;
      else
        v13 = 1.0;
      if (!HIBYTE(v27))
        v12 = 1.0;
      CGAffineTransformMakeScale(&v24, v13, v12);
      t1 = v29;
      CGAffineTransformConcat(&v28, &t1, &v24);
      v29 = v28;
      if (RotationAngleAndFlipsFromCGAffineTransform == 270 || RotationAngleAndFlipsFromCGAffineTransform == 90)
      {
        v14 = v9;
        v15 = v14;
      }
      else
      {
        v15 = v11;
        v11 = v9;
      }
      CGAffineTransformMakeTranslation(&v23, v11 * 0.5, v15 * 0.5);
      t1 = v29;
      CGAffineTransformConcat(&v28, &t1, &v23);
      v29 = v28;
      v6 = (void *)objc_msgSend(v6, "imageByApplyingTransform:", &v28);
    }
    v16 = -[AVAsynchronousVideoCompositionRequest renderContext](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "renderContext");
    if (v16)
      -[AVVideoCompositionRenderContext renderTransform](v16, "renderTransform");
    else
      memset(&v22, 0, sizeof(v22));
    if (!CGAffineTransformIsIdentity(&v22))
    {
      v17 = -[AVAsynchronousVideoCompositionRequest renderContext](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "renderContext");
      if (v17)
      {
        -[AVVideoCompositionRenderContext renderTransform](v17, "renderTransform");
      }
      else
      {
        v20 = 0u;
        v21 = 0u;
        v19 = 0u;
      }
      v6 = (void *)objc_msgSend(v6, "imageByApplyingTransform:", &v19);
    }
    -[AVAsynchronousCIImageFilteringRequestInternal setSourceCIImage:](self->_internal, "setSourceCIImage:", v6, v19, v20, v21, *(_QWORD *)&v22.a, *(_QWORD *)&v22.b, *(_QWORD *)&v22.c, *(_QWORD *)&v22.d, *(_QWORD *)&v22.tx, *(_QWORD *)&v22.ty);
  }
  return -[AVAsynchronousCIImageFilteringRequestInternal sourceCIImage](self->_internal, "sourceCIImage");
}

- (CMTime)compositionTime
{
  CMTime *result;

  result = -[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest");
  if (result)
    return (CMTime *)-[CMTime compositionTime](result, "compositionTime");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)finishWithImage:(CIImage *)filteredImage context:(CIContext *)context
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CIContext *v9;
  __CVBuffer *v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  CFDictionaryRef v14;
  void *v15;

  if (!filteredImage)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)context, v4, v5, v6, v7, (uint64_t)"filteredImage != nil"), 0);
    objc_exception_throw(v15);
  }
  v9 = context;
  if (((*(uint64_t (**)(void))(-[AVAsynchronousCIImageFilteringRequestInternal cancellationTest](self->_internal, "cancellationTest")+ 16))() & 1) != 0)
  {
    -[AVAsynchronousVideoCompositionRequest finishCancelledRequest](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "finishCancelledRequest");
    (*(void (**)(void))(-[AVAsynchronousCIImageFilteringRequestInternal completionHandler](self->_internal, "completionHandler")+ 16))();
    return;
  }
  if (!v9)
  {
    v13 = -[CIImage pixelBuffer](filteredImage, "pixelBuffer");
    if (v13)
    {
      v12 = v13;
      CFRetain(v13);
      v14 = CVBufferCopyAttachments(v12, kCVAttachmentMode_ShouldPropagate);
      if (v14)
        CFRelease(v14);
LABEL_9:
      -[AVAsynchronousVideoCompositionRequest finishWithComposedVideoFrame:](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "finishWithComposedVideoFrame:", v12);
      (*(void (**)(void))(-[AVAsynchronousCIImageFilteringRequestInternal completionHandler](self->_internal, "completionHandler")+ 16))();
      CFRelease(v12);
      return;
    }
  }
  v11 = -[AVVideoCompositionRenderContext newPixelBuffer](-[AVAsynchronousVideoCompositionRequest renderContext](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "renderContext"), "newPixelBuffer");
  if (v11)
  {
    v12 = v11;
    if (v9
      || (v9 = (CIContext *)(*(uint64_t (**)(void))(-[AVAsynchronousCIImageFilteringRequestInternal defaultCIContextProvider](self->_internal, "defaultCIContextProvider")+ 16))()) != 0)
    {
      -[CIContext render:toCVPixelBuffer:](v9, "render:toCVPixelBuffer:", filteredImage, v12);
    }
    else
    {
      AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11801, 0);
    }
    goto LABEL_9;
  }
  -[AVAsynchronousCIImageFilteringRequest finishWithError:](self, "finishWithError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11801, 0));
}

- (void)finishWithError:(NSError *)error
{
  -[AVAsynchronousVideoCompositionRequest finishWithError:](-[AVAsynchronousCIImageFilteringRequestInternal compositingRequest](self->_internal, "compositingRequest"), "finishWithError:", error);
  (*(void (**)(void))(-[AVAsynchronousCIImageFilteringRequestInternal completionHandler](self->_internal, "completionHandler")+ 16))();
}

@end
