@implementation BWInferenceVideoFormatRequirements

- (int64_t)videoContentMode
{
  return self->_videoContentMode;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BOOL)includesInvalidContent
{
  return self->_includesInvalidContent;
}

- (BOOL)deviceOriented
{
  return self->_deviceOriented;
}

- (BWInferenceCropDescriptor)cropDescriptor
{
  return self->_cropDescriptor;
}

- (id)histogramRequest
{
  return self->_histogramRequest;
}

- (void)setDeviceOriented:(BOOL)a3
{
  self->_deviceOriented = a3;
}

- (BWInferenceVideoFormatRequirements)initWithFormat:(id)a3
{
  BWInferenceVideoFormatRequirements *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceVideoFormatRequirements;
  v4 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:](&v6, sel_initWithPixelBufferAttributes_, objc_msgSend(a3, "pixelBufferAttributes"));
  if (v4)
  {
    v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
    v4->_deviceOriented = objc_msgSend(a3, "deviceOriented");
    v4->_videoContentMode = objc_msgSend(a3, "videoContentMode");
    v4->_includesInvalidContent = objc_msgSend(a3, "includesInvalidContent");
    v4->_cropDescriptor = (BWInferenceCropDescriptor *)(id)objc_msgSend(a3, "cropDescriptor");
    v4->_histogramRequest = (id)objc_msgSend((id)objc_msgSend(a3, "histogramRequest"), "copy");
    v4->_rotationDegrees = objc_msgSend(a3, "rotationDegrees");
  }
  return v4;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setHistogramRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setCropDescriptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setIncludesInvalidContent:(BOOL)a3
{
  self->_includesInvalidContent = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoFormatRequirements;
  -[BWVideoFormatRequirements dealloc](&v3, sel_dealloc);
}

- (void)setVideoContentMode:(int64_t)a3
{
  self->_videoContentMode = a3;
}

+ (id)defaultEspressoFormatRequirementsWithWidth:(int64_t)a3 height:(int64_t)a4
{
  BWInferenceVideoFormatRequirements *v6;

  v6 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", a3);
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", a4);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", &unk_1E4A01250);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v6, "setSupportedColorSpaceProperties:", &unk_1E4A01268);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v6, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v6, "setDeviceOriented:", 1);
  return v6;
}

@end
