@implementation FigCaptureStillImageProcessingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUltraHighResSensorRawDimensions:(id)a3
{
  self->_ultraHighResSensorRawDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setUiZoomFactor:(float)a3
{
  self->_uiZoomFactor = a3;
}

- (void)setSensorRawPixelFormat:(unsigned int)a3
{
  self->_sensorRawPixelFormat = a3;
}

- (void)setSensorRawDimensions:(id)a3
{
  self->_sensorRawDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setModuleCalibrationByPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageProcessingSettings;
  -[FigCaptureStillImageProcessingSettings dealloc](&v3, sel_dealloc);
}

- (FigCaptureStillImageProcessingSettings)initWithCoder:(id)a3
{
  FigCaptureStillImageProcessingSettings *v4;
  float v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FigCaptureStillImageProcessingSettings;
  v4 = -[FigCaptureStillImageProcessingSettings init](&v23, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("uiZoomFactor"));
    v4->_uiZoomFactor = v5;
    v6 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("sensorRawPixelFormat"));
    if (v6)
    {
      v4->_sensorRawPixelFormat = v6;
      v7 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sensorRawDimensionWidth"));
      v8 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sensorRawDimensionHeight"));
      v4->_sensorRawDimensions.width = v7;
      v4->_sensorRawDimensions.height = v8;
      v9 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("ultraHighResSensorRawDimensionWidth"));
      v10 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("ultraHighResSensorRawDimensionHeight"));
      v4->_ultraHighResSensorRawDimensions.width = v9;
      v4->_ultraHighResSensorRawDimensions.height = v10;
    }
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v4->_cameraInfoByPortType = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, objc_opt_class(), 0), CFSTR("cameraInfoByPortType")), "copy");
    if (objc_msgSend(a3, "error")
      || (v18 = (void *)MEMORY[0x1E0C99E60],
          v19 = objc_opt_class(),
          v20 = objc_opt_class(),
          v21 = objc_opt_class(),
          v4->_moduleCalibrationByPortType = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0), CFSTR("moduleCalibrationByPortType")), "copy"), objc_msgSend(a3, "error")))
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;
  uint64_t sensorRawPixelFormat;

  *(float *)&v3 = self->_uiZoomFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("uiZoomFactor"), v3);
  sensorRawPixelFormat = self->_sensorRawPixelFormat;
  if ((_DWORD)sensorRawPixelFormat)
  {
    objc_msgSend(a3, "encodeInt:forKey:", sensorRawPixelFormat, CFSTR("sensorRawPixelFormat"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_sensorRawDimensions.width, CFSTR("sensorRawDimensionWidth"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_sensorRawDimensions.height, CFSTR("sensorRawDimensionHeight"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_ultraHighResSensorRawDimensions.width, CFSTR("ultraHighResSensorRawDimensionWidth"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_ultraHighResSensorRawDimensions.height, CFSTR("ultraHighResSensorRawDimensionHeight"));
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_cameraInfoByPortType, CFSTR("cameraInfoByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_moduleCalibrationByPortType, CFSTR("moduleCalibrationByPortType"));
}

- ($2825F4736939C4A6D3AD43837233062D)ultraHighResSensorRawDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_ultraHighResSensorRawDimensions;
}

- (float)uiZoomFactor
{
  return self->_uiZoomFactor;
}

- (unsigned)sensorRawPixelFormat
{
  return self->_sensorRawPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorRawDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_sensorRawDimensions;
}

- (NSDictionary)moduleCalibrationByPortType
{
  return self->_moduleCalibrationByPortType;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

@end
