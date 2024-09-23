@implementation BWStillImageSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageSettings)initWithRequestedSettings:(id)a3 captureSettings:(id)a4 processingSettings:(id)a5
{
  BWStillImageSettings *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWStillImageSettings;
  v8 = -[BWStillImageSettings init](&v10, sel_init);
  if (v8)
  {
    v8->_requestedSettings = (FigCaptureStillImageSettings *)a3;
    v8->_captureSettings = (BWStillImageCaptureSettings *)a4;
    v8->_processingSettings = (BWStillImageProcessingSettings *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSettings;
  -[BWStillImageSettings dealloc](&v3, sel_dealloc);
}

- (BWStillImageSettings)initWithCoder:(id)a3
{
  BWStillImageSettings *v4;

  v4 = -[BWStillImageSettings init](self, "init");
  if (v4)
  {
    v4->_requestedSettings = (FigCaptureStillImageSettings *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedSettings"));
    v4->_captureSettings = (BWStillImageCaptureSettings *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureSettings"));
    v4->_processingSettings = (BWStillImageProcessingSettings *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processingSettings"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestedSettings, CFSTR("requestedSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureSettings, CFSTR("captureSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_processingSettings, CFSTR("processingSettings"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FigCaptureStillImageSettings *v11;
  _BOOL4 v12;
  BWStillImageCaptureSettings *v13;
  BWStillImageProcessingSettings *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v16 = v5;
    v17 = v4;
    v18 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[BWStillImageSettings requestedSettings](self, "requestedSettings");
      if (v11 == (FigCaptureStillImageSettings *)objc_msgSend(a3, "requestedSettings")
        || (v12 = -[FigCaptureStillImageSettings isEqual:](-[BWStillImageSettings requestedSettings](self, "requestedSettings"), "isEqual:", objc_msgSend(a3, "requestedSettings"))))
      {
        v13 = -[BWStillImageSettings captureSettings](self, "captureSettings", v6, v16, v17, v18, v7, v8);
        if (v13 == (BWStillImageCaptureSettings *)objc_msgSend(a3, "captureSettings")
          || (v12 = -[BWStillImageCaptureSettings isEqual:](-[BWStillImageSettings captureSettings](self, "captureSettings"), "isEqual:", objc_msgSend(a3, "captureSettings"))))
        {
          v14 = -[BWStillImageSettings processingSettings](self, "processingSettings");
          if (v14 == (BWStillImageProcessingSettings *)objc_msgSend(a3, "processingSettings")
            || (v12 = -[BWStillImageProcessingSettings isEqual:](-[BWStillImageSettings processingSettings](self, "processingSettings"), "isEqual:", objc_msgSend(a3, "processingSettings"))))
          {
            LOBYTE(v12) = 1;
          }
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[FigCaptureStillImageSettings hash](self->_requestedSettings, "hash");
  v4 = -[BWStillImageCaptureSettings hash](self->_captureSettings, "hash") ^ v3;
  return v4 ^ -[BWStillImageProcessingSettings hash](self->_processingSettings, "hash");
}

- (int64_t)settingsID
{
  return -[FigCaptureStillImageSettings settingsID](self->_requestedSettings, "settingsID");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: requestedSettings: %@\ncaptureSettings: %@\nprocessingSettings: %@"), objc_opt_class(), self, -[BWStillImageSettings requestedSettings](self, "requestedSettings"), -[BWStillImageSettings captureSettings](self, "captureSettings"), -[BWStillImageSettings processingSettings](self, "processingSettings"));
}

- (FigCaptureStillImageSettings)requestedSettings
{
  return self->_requestedSettings;
}

- (BWStillImageCaptureSettings)captureSettings
{
  return self->_captureSettings;
}

- (BWStillImageProcessingSettings)processingSettings
{
  return self->_processingSettings;
}

@end
