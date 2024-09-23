@implementation CVAMattingResult_Impl

- (CVAMattingResult_Impl)initWithDisparityPostprocessingResult:(id)a3 alphaMattePixelBuffer:(__CVBuffer *)a4
{
  id v7;
  CVAMattingResult_Impl *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVAMattingResult_Impl;
  v8 = -[CVAMattingResult_Impl init](&v10, sel_init);
  objc_storeStrong((id *)&v8->_disparityPostprocessingResult, a3);
  v8->_alphaMattePixelBuffer = a4;
  CVPixelBufferRetain(a4);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_alphaMattePixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAMattingResult_Impl;
  -[CVAMattingResult_Impl dealloc](&v3, sel_dealloc);
}

- (CVADisparityPostprocessingResult)disparityPostprocessingResult
{
  return (CVADisparityPostprocessingResult *)objc_getProperty(self, a2, 16, 1);
}

- (__CVBuffer)alphaMattePixelBuffer
{
  return self->_alphaMattePixelBuffer;
}

- (float)personSegmentationRatio
{
  return self->_personSegmentationRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityPostprocessingResult, 0);
}

@end
