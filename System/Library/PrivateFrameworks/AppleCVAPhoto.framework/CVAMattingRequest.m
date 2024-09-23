@implementation CVAMattingRequest

- (CVAMattingRequest)initWithDisparityPostprocessingRequest:(id)a3 segmentationPixelBuffer:(__CVBuffer *)a4 skinSegmentationPixelBuffer:(__CVBuffer *)a5 destinationAlphaMattePixelBuffer:(__CVBuffer *)a6 error:(id *)a7
{
  id v12;
  size_t Width;
  CVAMattingRequest *v14;

  v12 = a3;
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v12, "sourceColorPixelBuffer"));
  v14 = -[CVAMattingRequest initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:](self, "initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:", v12, a4, a5, a6, a7, 0.0, 0.0, (double)Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v12, "sourceColorPixelBuffer")));

  return v14;
}

- (CVAMattingRequest)initWithDisparityPostprocessingRequest:(id)a3 segmentationPixelBuffer:(__CVBuffer *)a4 skinSegmentationPixelBuffer:(__CVBuffer *)a5 primaryCaptureRect:(CGRect)a6 destinationAlphaMattePixelBuffer:(__CVBuffer *)a7 error:(id *)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  void *v19;
  CVAMattingRequest *v20;
  CVAMattingRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v18 = a3;
  v19 = v18;
  if (a8)
    *a8 = 0;
  if (v18)
  {
    v26.receiver = self;
    v26.super_class = (Class)CVAMattingRequest;
    v20 = -[CVAMattingRequest init](&v26, sel_init);
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_disparityPostprocessingRequest, a3);
      v21->_skinSegmentationPixelBuffer = a5;
      v21->_destinationAlphaMattePixelBuffer = a7;
      v21->_segmentationPixelBuffer = a4;
      v21->_primaryCaptureRect.origin.x = x;
      v21->_primaryCaptureRect.origin.y = y;
      v21->_primaryCaptureRect.size.width = width;
      v21->_primaryCaptureRect.size.height = height;
      CVPixelBufferRetain(a4);
      CVPixelBufferRetain(v21->_skinSegmentationPixelBuffer);
      CVPixelBufferRetain(v21->_destinationAlphaMattePixelBuffer);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("segmentation-only matting is not implemented!"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAMattingRequest initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineRequest.mm", 214, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(1, a8, 0, 4294944394, v24);

    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_destinationAlphaMattePixelBuffer);
  CVPixelBufferRelease(self->_segmentationPixelBuffer);
  CVPixelBufferRelease(self->_skinSegmentationPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAMattingRequest;
  -[CVAMattingRequest dealloc](&v3, sel_dealloc);
}

- (CVADisparityPostprocessingRequest)disparityPostprocessingRequest
{
  return (CVADisparityPostprocessingRequest *)objc_getProperty(self, a2, 8, 1);
}

- (__CVBuffer)segmentationPixelBuffer
{
  return self->_segmentationPixelBuffer;
}

- (__CVBuffer)skinSegmentationPixelBuffer
{
  return self->_skinSegmentationPixelBuffer;
}

- (CGRect)primaryCaptureRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (__CVBuffer)destinationAlphaMattePixelBuffer
{
  return self->_destinationAlphaMattePixelBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityPostprocessingRequest, 0);
}

@end
