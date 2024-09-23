@implementation AVCaptureDeferredPhotoSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureSettings, CFSTR("FigCaptureStillImageSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_serializedProcessingSettings, CFSTR("SerializedProcessingSettings"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoSettings;
  -[AVCaptureDeferredPhotoSettings dealloc](&v3, sel_dealloc);
}

- (AVCaptureDeferredPhotoSettings)initWithCoder:(id)a3
{
  void *v5;
  AVCaptureDeferredPhotoSettings *result;
  AVCaptureDeferredPhotoSettings *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  result = (AVCaptureDeferredPhotoSettings *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2)), CFSTR("FigCaptureStillImageSettings"));
  if (result)
  {
    v7 = result;
    result = (AVCaptureDeferredPhotoSettings *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SerializedProcessingSettings"));
    if (result)
      return (AVCaptureDeferredPhotoSettings *)-[AVCaptureDeferredPhotoSettings _initWithCaptureSettings:serializedProcessingSettings:](self, "_initWithCaptureSettings:serializedProcessingSettings:", v7, result);
  }
  return result;
}

- (id)_initWithCaptureSettings:(id)a3 serializedProcessingSettings:(id)a4
{
  AVCaptureDeferredPhotoSettings *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDeferredPhotoSettings;
  v6 = -[AVCaptureDeferredPhotoSettings init](&v8, sel_init);
  if (v6)
  {
    v6->_captureSettings = (FigCaptureStillImageSettings *)a3;
    v6->_serializedProcessingSettings = (NSData *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (NSData)serializedProcessingSettings
{
  return self->_serializedProcessingSettings;
}

- (FigCaptureStillImageSettings)captureSettings
{
  return self->_captureSettings;
}

@end
