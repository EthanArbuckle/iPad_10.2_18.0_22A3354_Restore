@implementation FigCaptureIrisPreparedSettings

- (BOOL)isEqual:(id)a3
{
  NSArray *bravoConstituentImageDeliveryDeviceTypes;
  int v6;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(a3, "settingsID") == self->_settingsID
      && objc_msgSend(a3, "processedOutputFormat") == self->_processedOutputFormat
      && objc_msgSend(a3, "rawOutputFormat") == self->_rawOutputFormat
      && objc_msgSend(a3, "outputWidth") == self->_outputWidth
      && objc_msgSend(a3, "outputHeight") == self->_outputHeight
      && objc_msgSend(a3, "bracketedImageCount") == self->_bracketedImageCount
      && objc_msgSend(a3, "qualityPrioritization") == self->_qualityPrioritization
      && objc_msgSend(a3, "HDRMode") == self->_HDRMode
      && objc_msgSend(a3, "digitalFlashMode") == self->_digitalFlashMode)
    {
      bravoConstituentImageDeliveryDeviceTypes = self->_bravoConstituentImageDeliveryDeviceTypes;
      if (bravoConstituentImageDeliveryDeviceTypes == (NSArray *)objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes")|| (v6 = -[NSArray isEqual:](self->_bravoConstituentImageDeliveryDeviceTypes, "isEqual:", objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes"))) != 0)
      {
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unsigned)processedOutputFormat
{
  return self->_processedOutputFormat;
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (int)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (int)HDRMode
{
  return self->_HDRMode;
}

- (NSArray)bravoConstituentImageDeliveryDeviceTypes
{
  return self->_bravoConstituentImageDeliveryDeviceTypes;
}

- (unsigned)bracketedImageCount
{
  return self->_bracketedImageCount;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (unsigned)outputWidth
{
  return self->_outputWidth;
}

- (unsigned)outputHeight
{
  return self->_outputHeight;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "settingsID", self->_settingsID);
  xpc_dictionary_set_int64(v3, "processedOutputFormat", self->_processedOutputFormat);
  xpc_dictionary_set_int64(v3, "rawOutputFormat", self->_rawOutputFormat);
  xpc_dictionary_set_int64(v3, "outputWidth", self->_outputWidth);
  xpc_dictionary_set_int64(v3, "outputHeight", self->_outputHeight);
  xpc_dictionary_set_int64(v3, "bracketedImageCount", self->_bracketedImageCount);
  xpc_dictionary_set_int64(v3, "qualityPrioritization", self->_qualityPrioritization);
  xpc_dictionary_set_int64(v3, "HDRMode", self->_HDRMode);
  xpc_dictionary_set_int64(v3, "DigitalFlashMode", self->_digitalFlashMode);
  if (-[NSArray count](self->_bravoConstituentImageDeliveryDeviceTypes, "count"))
    FigXPCMessageSetCFArray();
  return v3;
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSettingsID:", self->_settingsID);
  objc_msgSend(v4, "setProcessedOutputFormat:", self->_processedOutputFormat);
  objc_msgSend(v4, "setRawOutputFormat:", self->_rawOutputFormat);
  objc_msgSend(v4, "setOutputWidth:", self->_outputWidth);
  objc_msgSend(v4, "setOutputHeight:", self->_outputHeight);
  objc_msgSend(v4, "setBracketedImageCount:", self->_bracketedImageCount);
  objc_msgSend(v4, "setQualityPrioritization:", self->_qualityPrioritization);
  objc_msgSend(v4, "setHDRMode:", self->_HDRMode);
  objc_msgSend(v4, "setDigitalFlashMode:", self->_digitalFlashMode);
  objc_msgSend(v4, "setBravoConstituentImageDeliveryDeviceTypes:", self->_bravoConstituentImageDeliveryDeviceTypes);
  return v4;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (void)setOutputWidth:(unsigned int)a3
{
  self->_outputWidth = a3;
}

- (void)setOutputHeight:(unsigned int)a3
{
  self->_outputHeight = a3;
}

- (void)setProcessedOutputFormat:(unsigned int)a3
{
  self->_processedOutputFormat = a3;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

- (void)setHDRMode:(int)a3
{
  self->_HDRMode = a3;
}

- (FigCaptureIrisPreparedSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisPreparedSettings;
  return -[FigCaptureIrisPreparedSettings init](&v3, sel_init);
}

- (void)setDigitalFlashMode:(int)a3
{
  self->_digitalFlashMode = a3;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_rawOutputFormat = a3;
}

- (void)setBravoConstituentImageDeliveryDeviceTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBracketedImageCount:(unsigned int)a3
{
  self->_bracketedImageCount = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisPreparedSettings;
  -[FigCaptureIrisPreparedSettings dealloc](&v3, sel_dealloc);
}

- (FigCaptureIrisPreparedSettings)initWithXPCEncoding:(id)a3
{
  FigCaptureIrisPreparedSettings *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigCaptureIrisPreparedSettings;
    v4 = -[FigCaptureIrisPreparedSettings init](&v6, sel_init);
    if (v4)
    {
      v4->_settingsID = xpc_dictionary_get_int64(a3, "settingsID");
      v4->_processedOutputFormat = xpc_dictionary_get_int64(a3, "processedOutputFormat");
      v4->_rawOutputFormat = xpc_dictionary_get_int64(a3, "rawOutputFormat");
      v4->_outputWidth = xpc_dictionary_get_int64(a3, "outputWidth");
      v4->_outputHeight = xpc_dictionary_get_int64(a3, "outputHeight");
      v4->_bracketedImageCount = xpc_dictionary_get_int64(a3, "bracketedImageCount");
      v4->_qualityPrioritization = xpc_dictionary_get_int64(a3, "qualityPrioritization");
      v4->_HDRMode = xpc_dictionary_get_int64(a3, "HDRMode");
      v4->_digitalFlashMode = xpc_dictionary_get_int64(a3, "DigitalFlashMode");
      FigXPCMessageCopyCFArray();
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureIrisPreparedSettings)initWithCoder:(id)a3
{
  FigCaptureIrisPreparedSettings *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = -[FigCaptureIrisPreparedSettings init](self, "init");
  if (v4)
  {
    v4->_settingsID = objc_msgSend(a3, "decodeInt64ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "settingsID"));
    v4->_processedOutputFormat = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "processedOutputFormat"));
    v4->_rawOutputFormat = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "rawOutputFormat"));
    v4->_outputWidth = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "outputWidth"));
    v4->_outputHeight = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "outputHeight"));
    v4->_bracketedImageCount = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bracketedImageCount"));
    v4->_qualityPrioritization = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "qualityPrioritization"));
    v4->_HDRMode = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HDRMode"));
    v4->_digitalFlashMode = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DigitalFlashMode"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    v6 = objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2));
    v4->_bravoConstituentImageDeliveryDeviceTypes = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bravoConstituentImageDeliveryDeviceTypes"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_settingsID, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "settingsID"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_processedOutputFormat, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "processedOutputFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawOutputFormat, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "rawOutputFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputWidth, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "outputWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputHeight, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "outputHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bracketedImageCount, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bracketedImageCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_qualityPrioritization, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "qualityPrioritization"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_HDRMode, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HDRMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_digitalFlashMode, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DigitalFlashMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bravoConstituentImageDeliveryDeviceTypes, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bravoConstituentImageDeliveryDeviceTypes"));
}

- (NSString)description
{
  unsigned int v3;
  uint64_t v4;
  const __CFString *v5;
  unsigned int v7;
  unsigned int v8;

  v3 = bswap32(self->_processedOutputFormat);
  v7 = bswap32(self->_rawOutputFormat);
  v8 = v3;
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" DIGITALFLASH:%d"), self->_digitalFlashMode);
  if (-[NSArray count](self->_bravoConstituentImageDeliveryDeviceTypes, "count"))
    v5 = (const __CFString *)_shortStringForFigCaptureSourceDeviceTypes(self->_bravoConstituentImageDeliveryDeviceTypes);
  else
    v5 = &stru_1E4928818;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %p: captureID:%lld '%.4s' %dx%d RAW:'%.4s' HDR:%d QUAL:%d%@ BRCK:%d%@"), objc_opt_class(), self, self->_settingsID, &v8, self->_outputWidth, self->_outputHeight, &v7, self->_HDRMode, self->_qualityPrioritization, v4, self->_bracketedImageCount, v5);
}

- (id)figCaptureStillImageSettingsRepresentation
{
  FigCaptureStillImageSettings *v3;

  v3 = -[FigCaptureStillImageSettings initWithSettingsID:]([FigCaptureStillImageSettings alloc], "initWithSettingsID:", self->_settingsID);
  -[FigCaptureStillImageSettings setSettingsProvider:](v3, "setSettingsProvider:", 1);
  -[FigCaptureStillImageSettings setOutputFormat:](v3, "setOutputFormat:", self->_processedOutputFormat);
  -[FigCaptureStillImageSettings setOutputWidth:](v3, "setOutputWidth:", self->_outputWidth);
  -[FigCaptureStillImageSettings setOutputHeight:](v3, "setOutputHeight:", self->_outputHeight);
  -[FigCaptureStillImageSettings setRawOutputFormat:](v3, "setRawOutputFormat:", self->_rawOutputFormat);
  -[FigCaptureStillImageSettings setBracketType:imageCount:](v3, "setBracketType:imageCount:", 2, self->_bracketedImageCount);
  -[FigCaptureStillImageSettings setQualityPrioritization:](v3, "setQualityPrioritization:", self->_qualityPrioritization);
  -[FigCaptureStillImageSettings setHDRMode:](v3, "setHDRMode:", self->_HDRMode);
  -[FigCaptureStillImageSettings setDigitalFlashMode:](v3, "setDigitalFlashMode:", self->_digitalFlashMode);
  -[FigCaptureStillImageSettings setBravoConstituentImageDeliveryDeviceTypes:](v3, "setBravoConstituentImageDeliveryDeviceTypes:", self->_bravoConstituentImageDeliveryDeviceTypes);
  return v3;
}

@end
