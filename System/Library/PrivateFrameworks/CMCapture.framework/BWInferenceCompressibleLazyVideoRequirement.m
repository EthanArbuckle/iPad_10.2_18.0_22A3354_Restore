@implementation BWInferenceCompressibleLazyVideoRequirement

- (BWInferenceCompressibleLazyVideoRequirement)initWithLazyVideoRequirement:(id)a3
{
  BWInferenceCompressibleLazyVideoRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceCompressibleLazyVideoRequirement;
  v4 = -[BWInferenceLazyVideoRequirement initWithLazyVideoRequirement:](&v6, sel_initWithLazyVideoRequirement_);
  if (v4)
    v4->_underlyingLazyVideoRequirement = (BWInferenceLazyVideoRequirement *)a3;
  return v4;
}

- (int)prepareForInputInferenceVideoFormat:(id)a3
{
  int v5;
  unsigned int v6;
  BWInferenceVideoFormatRequirements *v7;
  id v8;
  BWInferenceVideoFormatRequirements *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[BWInferenceLazyVideoRequirement prepareForInputInferenceVideoFormat:](self->_underlyingLazyVideoRequirement, "prepareForInputInferenceVideoFormat:");
  if (!-[BWInferenceVideoRequirement videoFormat](self->_underlyingLazyVideoRequirement, "videoFormat"))
    return -31711;
  v6 = -[BWInferenceVideoFormat pixelFormat](-[BWInferenceVideoRequirement videoFormat](self->_underlyingLazyVideoRequirement, "videoFormat"), "pixelFormat");
  if (v6 == objc_msgSend(a3, "uncompressedEquivalent"))
  {
    v7 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", -[BWInferenceVideoRequirement videoFormat](self->_underlyingLazyVideoRequirement, "videoFormat"));
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
    v10 = v7;
    v8 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1));
    if (v8)
    {
      self->super.super._videoFormat = (BWInferenceVideoFormat *)v8;
      return v5;
    }
    return -31711;
  }
  return v5;
}

- (BWInferenceCompressibleLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 count:(unint64_t)a5 videoFormatProvider:(id)a6
{
  -[BWInferenceCompressibleLazyVideoRequirement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceCompressibleLazyVideoRequirement;
  -[BWInferenceLazyVideoRequirement dealloc](&v3, sel_dealloc);
}

@end
