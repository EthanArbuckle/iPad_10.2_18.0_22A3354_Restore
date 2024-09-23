@implementation VNLKTOpticalFlow

- (VNLKTOpticalFlow)initWithWidth:(int)a3 height:(int)a4 numScales:(int)a5
{
  VNLKTOpticalFlow *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNLKTOpticalFlow;
  result = -[VNLKTOpticalFlow init](&v9, sel_init);
  if (result)
  {
    result->_isValid = 0;
    result->_width = a3;
    result->_height = a4;
    result->_levelCount = a5;
    result->_numScales = a5;
  }
  return result;
}

- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Not implemented in abstract class"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Not implemented in abstract class"), a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Not implemented in abstract class"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)_validateInputImage:(__CVBuffer *)a3 error:(id *)a4
{
  size_t Width;
  size_t Height;
  BOOL result;
  const __CFString *v10;
  id v11;

  if (CVPixelBufferGetPixelFormatType(a3) == 1111970369)
  {
    Width = CVPixelBufferGetWidth(a3);
    if (Width == -[VNLKTOpticalFlow width](self, "width"))
    {
      Height = CVPixelBufferGetHeight(a3);
      if (Height == -[VNLKTOpticalFlow height](self, "height"))
        return 1;
    }
    if (a4)
    {
      v10 = CFSTR("Input image has invalid width/height");
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    v10 = CFSTR("Input image has invalid pixel format");
LABEL_9:
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v11;
    return result;
  }
  return 0;
}

- (BOOL)_validateOutputImage:(__CVBuffer *)a3 error:(id *)a4
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  BOOL result;
  const __CFString *v11;
  id v12;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 843264102 || PixelFormatType == 843264104)
  {
    Width = CVPixelBufferGetWidth(a3);
    if (Width == -[VNLKTOpticalFlow width](self, "width"))
    {
      Height = CVPixelBufferGetHeight(a3);
      if (Height == -[VNLKTOpticalFlow height](self, "height"))
        return 1;
    }
    if (a4)
    {
      v11 = CFSTR("Output image has invalid width/height");
LABEL_10:
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v12;
      return result;
    }
  }
  else if (a4)
  {
    v11 = CFSTR("Output image has invalid pixel format");
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)levelCount
{
  return self->_levelCount;
}

- (int)numScales
{
  return self->_numScales;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (int)numWarpings
{
  return self->_numWarpings;
}

- (void)setNumWarpings:(int)a3
{
  self->_numWarpings = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

@end
