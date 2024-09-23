@implementation BWInferenceVideoFormat

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int deviceOriented;
  int64_t videoContentMode;
  int includesInvalidContent;
  int v9;
  int rotationDegrees;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    v5 = -[BWVideoFormat isEqual:](self->_underlyingVideoFormat, "isEqual:", objc_msgSend(a3, "underlyingVideoFormat"));
    if (!v5)
      return v5;
    deviceOriented = self->_deviceOriented;
    if (deviceOriented != objc_msgSend(a3, "deviceOriented")
      || (videoContentMode = self->_videoContentMode, videoContentMode != objc_msgSend(a3, "videoContentMode"))
      || (includesInvalidContent = self->_includesInvalidContent,
          includesInvalidContent != objc_msgSend(a3, "includesInvalidContent"))
      || (v9 = -[BWInferenceCropDescriptor identifier](self->_cropDescriptor, "identifier"),
          v9 != objc_msgSend((id)objc_msgSend(a3, "cropDescriptor"), "identifier")))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    rotationDegrees = self->_rotationDegrees;
    LOBYTE(v5) = rotationDegrees == objc_msgSend(a3, "rotationDegrees");
  }
  return v5;
}

+ (id)formatByResolvingRequirements:(id)a3
{
  id result;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:");
  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend(a3, "firstObject");
    v7 = objc_msgSend(v6, "deviceOriented");
    v8 = objc_msgSend(v6, "videoContentMode");
    v9 = objc_msgSend(v6, "includesInvalidContent");
    v21 = (void *)objc_msgSend(v6, "cropDescriptor");
    v10 = objc_msgSend(v6, "histogramRequest");
    v11 = objc_msgSend(v6, "rotationDegrees");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      v19 = v10;
      v20 = v5;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(a3);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((_DWORD)v7 == objc_msgSend(v16, "deviceOriented")
            && objc_msgSend(v16, "videoContentMode") == v8
            && (_DWORD)v9 == objc_msgSend(v16, "includesInvalidContent"))
          {
            v17 = objc_msgSend((id)objc_msgSend(v16, "cropDescriptor"), "identifier");
            if (v17 == objc_msgSend(v21, "identifier")
              && objc_msgSend(v16, "rotationDegrees") == v11)
            {
              continue;
            }
          }
          return 0;
        }
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v10 = v19;
        v5 = v20;
        if (v13)
          continue;
        break;
      }
    }
    LODWORD(v18) = v11;
    return -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", v5, v7, v8, v9, v21, v10, v18);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BWVideoFormatRequirements *v4;
  id v5;
  BWInferenceVideoFormat *v6;
  uint64_t v8;
  BWVideoFormatRequirements *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", -[BWVideoFormat pixelBufferAttributes](self->_underlyingVideoFormat, "pixelBufferAttributes"));
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BWInferenceVideoFormat colorSpaceProperties](self, "colorSpaceProperties"));
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
  v9 = v4;
  v5 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1));

  v6 = [BWInferenceVideoFormat alloc];
  LODWORD(v8) = self->_rotationDegrees;
  return -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:](v6, "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", v5, self->_deviceOriented, self->_videoContentMode, self->_includesInvalidContent, self->_cropDescriptor, self->_histogramRequest, v8);
}

- (BWInferenceVideoFormat)initWithUnderlyingFormat:(id)a3 isDeviceOriented:(BOOL)a4 videoContentMode:(int64_t)a5 includesInvalidContent:(BOOL)a6 cropDescriptor:(id)a7 histogramRequest:(id)a8 rotationDegrees:(int)a9
{
  BWInferenceVideoFormat *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWInferenceVideoFormat;
  v15 = -[BWInferenceVideoFormat init](&v17, sel_init);
  if (v15)
  {
    v15->_underlyingVideoFormat = (BWVideoFormat *)a3;
    v15->_deviceOriented = a4;
    v15->_videoContentMode = a5;
    v15->_includesInvalidContent = a6;
    v15->_cropDescriptor = (BWInferenceCropDescriptor *)a7;
    v15->_histogramRequest = (id)objc_msgSend(a8, "copy");
    v15->_rotationDegrees = a9;
  }
  return v15;
}

- (unint64_t)hash
{
  unsigned __int16 v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = -[BWInferenceVideoFormat pixelFormat](self, "pixelFormat");
  v4 = v3 | ((unsigned __int16)-[BWInferenceVideoFormat width](self, "width") << 16);
  v5 = v4 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)-[BWInferenceVideoFormat height](self, "height") << 32);
  v6 = (-[BWInferenceVideoFormat colorSpaceProperties](self, "colorSpaceProperties") & 4uLL) >> 2;
  if (-[BWInferenceVideoFormat deviceOriented](self, "deviceOriented"))
    v7 = 0;
  else
    v7 = 0x8000000000000;
  if (-[BWInferenceVideoFormat includesInvalidContent](self, "includesInvalidContent"))
    v8 = 0x10000000000000;
  else
    v8 = 0;
  v9 = (v5 | v7) & 0xFFFBFFFFFFFFFFFFLL | ((v6 & 1) << 50) | v8 | ((unint64_t)(((char)-[BWInferenceVideoFormat rotationDegrees](self, "rotationDegrees")/ 90) & 3) << 53);
  v10 = v9 & 0xFF7FFFFFFFFFFFFFLL | ((-[BWInferenceVideoFormat videoContentMode](self, "videoContentMode") & 1) << 55);
  v11 = v10 | ((-[BWInferenceCropDescriptor identifier](-[BWInferenceVideoFormat cropDescriptor](self, "cropDescriptor"), "identifier") & 0xF) << 56);
  return v11 | (-[BWVideoFormat bytesPerRowAlignment](-[BWInferenceVideoFormat underlyingVideoFormat](self, "underlyingVideoFormat"), "bytesPerRowAlignment") << 60);
}

- (int)colorSpaceProperties
{
  return -[BWVideoFormat colorSpaceProperties](self->_underlyingVideoFormat, "colorSpaceProperties");
}

- (unint64_t)width
{
  return -[BWVideoFormat width](self->_underlyingVideoFormat, "width");
}

- (unint64_t)height
{
  return -[BWVideoFormat height](self->_underlyingVideoFormat, "height");
}

- (BWInferenceCropDescriptor)cropDescriptor
{
  return self->_cropDescriptor;
}

- (unsigned)pixelFormat
{
  return -[BWVideoFormat pixelFormat](self->_underlyingVideoFormat, "pixelFormat");
}

- (BOOL)includesInvalidContent
{
  return self->_includesInvalidContent;
}

- (BOOL)deviceOriented
{
  return self->_deviceOriented;
}

- (BWVideoFormat)underlyingVideoFormat
{
  return self->_underlyingVideoFormat;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (int64_t)videoContentMode
{
  return self->_videoContentMode;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoFormat;
  -[BWInferenceVideoFormat dealloc](&v3, sel_dealloc);
}

- (NSDictionary)pixelBufferAttributes
{
  return -[BWVideoFormat pixelBufferAttributes](self->_underlyingVideoFormat, "pixelBufferAttributes");
}

- (unint64_t)extendedWidth
{
  return -[BWVideoFormat extendedWidth](self->_underlyingVideoFormat, "extendedWidth");
}

- (unint64_t)extendedHeight
{
  return -[BWVideoFormat extendedHeight](self->_underlyingVideoFormat, "extendedHeight");
}

- (id)histogramRequest
{
  return self->_histogramRequest;
}

- (unsigned)uncompressedEquivalent
{
  return FigCaptureUncompressedPixelFormatForPixelFormat(-[BWInferenceVideoFormat pixelFormat](self, "pixelFormat"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> deviceOriented:%d videoContentMode:%ld includesInvalidContent:%ld cropDesciptor:%@ underlyingVideoFormat:%@ rotationDegrees:%d"), objc_opt_class(), self, self->_deviceOriented, self->_videoContentMode, self->_includesInvalidContent, self->_cropDescriptor, self->_underlyingVideoFormat, self->_rotationDegrees);
}

- (opaqueCMFormatDescription)formatDescription
{
  return -[BWVideoFormat formatDescription](self->_underlyingVideoFormat, "formatDescription");
}

- (BOOL)representsCompressedEquivalent
{
  int v3;

  v3 = FigCaptureUncompressedPixelFormatForPixelFormat(-[BWInferenceVideoFormat pixelFormat](self, "pixelFormat"));
  return -[BWInferenceVideoFormat pixelFormat](self, "pixelFormat") != v3;
}

@end
