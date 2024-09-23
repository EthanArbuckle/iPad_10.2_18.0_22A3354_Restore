@implementation CVAPortraitResult_Impl

- (CVAPortraitResult_Impl)initWithMattingResult:(id)a3 portraitPixelBuffer:(__CVBuffer *)a4 portraitStability:(float)a5
{
  id v9;
  CVAPortraitResult_Impl *v10;
  objc_super v12;

  v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CVAPortraitResult_Impl;
  v10 = -[CVAPortraitResult_Impl init](&v12, sel_init);
  objc_storeStrong((id *)&v10->_mattingResult, a3);
  v10->_portraitPixelBuffer = a4;
  CVPixelBufferRetain(a4);
  v10->_portraitStability = a5;
  v10->_relightingStability = 1.0;

  return v10;
}

- (CVAPortraitResult_Impl)initWithMattingResult:(id)a3 portraitPixelBuffer:(__CVBuffer *)a4 portraitStability:(float)a5 relightingStability:(float)a6
{
  id v11;
  CVAPortraitResult_Impl *v12;
  objc_super v14;

  v11 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CVAPortraitResult_Impl;
  v12 = -[CVAPortraitResult_Impl init](&v14, sel_init);
  objc_storeStrong((id *)&v12->_mattingResult, a3);
  v12->_portraitPixelBuffer = a4;
  CVPixelBufferRetain(a4);
  v12->_portraitStability = a5;
  v12->_relightingStability = a6;

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_portraitPixelBuffer);
  self->_portraitPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitResult_Impl;
  -[CVAPortraitResult_Impl dealloc](&v3, sel_dealloc);
}

- (CVAMattingResult)mattingResult
{
  return (CVAMattingResult *)objc_getProperty(self, a2, 16, 1);
}

- (__CVBuffer)portraitPixelBuffer
{
  return self->_portraitPixelBuffer;
}

- (float)portraitStability
{
  return self->_portraitStability;
}

- (float)relightingStability
{
  return self->_relightingStability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mattingResult, 0);
}

@end
