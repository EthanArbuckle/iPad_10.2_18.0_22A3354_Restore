@implementation BWBracketSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bracketSettingsForBracketingMode:(int)a3
{
  BWBracketSettings *v4;
  objc_super v6;

  v4 = [BWBracketSettings alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)BWBracketSettings;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
      v4->_bracketingMode = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBracketSettings;
  -[BWBracketSettings dealloc](&v3, sel_dealloc);
}

- (BWBracketSettings)initWithCoder:(id)a3
{
  BWBracketSettings *v4;

  v4 = -[BWBracketSettings init](self, "init");
  if (v4)
  {
    v4->_bracketingMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bracketingMode"));
    v4->_providePreBracketedEV0 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("providePreBracketedEV0"));
    v4->_lensStabilizationEnabledForClientBracket = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("lensStabilizationEnabledForClientBracket"));
    v4->_exposureValues = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", -[BWBracketSettings classesForExposureValues]((uint64_t)v4), CFSTR("exposureValues"));
    v4->_manualExposureBracketedCaptureParams = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", -[BWBracketSettings classesForManualExposureBracketedCaptureParams]((uint64_t)v4), CFSTR("manualExposureBracketedCaptureParams"));
    v4->_oisBracketedCaptureParams = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", -[BWBracketSettings classesForManualExposureBracketedCaptureParams]((uint64_t)v4), CFSTR("oisBracketedCaptureParams"));
  }
  return v4;
}

- (uint64_t)classesForExposureValues
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    v2 = objc_opt_class();
    return objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  }
  return result;
}

- (uint64_t)classesForManualExposureBracketedCaptureParams
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    v2 = objc_opt_class();
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    return objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bracketingMode, CFSTR("bracketingMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_providePreBracketedEV0, CFSTR("providePreBracketedEV0"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_lensStabilizationEnabledForClientBracket, CFSTR("lensStabilizationEnabledForClientBracket"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_exposureValues, CFSTR("exposureValues"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_manualExposureBracketedCaptureParams, CFSTR("manualExposureBracketedCaptureParams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_oisBracketedCaptureParams, CFSTR("oisBracketedCaptureParams"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int bracketingMode;
  int providePreBracketedEV0;
  int lensStabilizationEnabledForClientBracket;
  NSArray *exposureValues;
  int v15;
  NSArray *manualExposureBracketedCaptureParams;
  NSDictionary *oisBracketedCaptureParams;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v19 = v5;
    v20 = v4;
    v21 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (bracketingMode = self->_bracketingMode, bracketingMode == objc_msgSend(a3, "bracketingMode"))
      && (providePreBracketedEV0 = self->_providePreBracketedEV0,
          providePreBracketedEV0 == objc_msgSend(a3, "providePreBracketedEV0"))
      && (lensStabilizationEnabledForClientBracket = self->_lensStabilizationEnabledForClientBracket,
          lensStabilizationEnabledForClientBracket == objc_msgSend(a3, "lensStabilizationEnabledForClientBracket")))
    {
      exposureValues = self->_exposureValues;
      if (exposureValues == (NSArray *)objc_msgSend(a3, "exposureValues")
        || (v15 = -[NSArray isEqual:](self->_exposureValues, "isEqual:", objc_msgSend(a3, "exposureValues"))) != 0)
      {
        manualExposureBracketedCaptureParams = self->_manualExposureBracketedCaptureParams;
        if (manualExposureBracketedCaptureParams == (NSArray *)objc_msgSend(a3, "manualExposureBracketedCaptureParams", v6, v19, v20, v21, v7, v8)|| (v15 = -[NSArray isEqual:](self->_manualExposureBracketedCaptureParams, "isEqual:", objc_msgSend(a3, "manualExposureBracketedCaptureParams"))) != 0)
        {
          oisBracketedCaptureParams = self->_oisBracketedCaptureParams;
          if (oisBracketedCaptureParams == (NSDictionary *)objc_msgSend(a3, "oisBracketedCaptureParams")
            || (v15 = -[NSDictionary isEqual:](self->_oisBracketedCaptureParams, "isEqual:", objc_msgSend(a3, "oisBracketedCaptureParams"))) != 0)
          {
            LOBYTE(v15) = 1;
          }
        }
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  return self->_bracketingMode;
}

- (int)bracketFrameCount
{
  int v3;
  int v4;

  v3 = -[NSArray count](self->_exposureValues, "count");
  v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_oisBracketedCaptureParams, "objectForKeyedSubscript:", *MEMORY[0x1E0D07020]), "count");
  return v4 + v3 + -[NSArray count](self->_manualExposureBracketedCaptureParams, "count");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *exposureValues;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>: pre-bracket: %d, frame count: %d, bracketingMode: %@"), v5, self, self->_providePreBracketedEV0, -[BWBracketSettings bracketFrameCount](self, "bracketFrameCount"), BWPhotoEncoderStringFromEncodingScheme(self->_bracketingMode));
  exposureValues = self->_exposureValues;
  if (exposureValues)
  {
    v7 = CFSTR(", exposureValues: %@");
LABEL_7:
    objc_msgSend(v3, "appendFormat:", v7, objc_msgSend(exposureValues, "description"));
    return v3;
  }
  exposureValues = self->_oisBracketedCaptureParams;
  if (exposureValues)
  {
    v7 = CFSTR(", oisBracketedCaptureParams: %@");
    goto LABEL_7;
  }
  exposureValues = self->_manualExposureBracketedCaptureParams;
  if (exposureValues)
  {
    v7 = CFSTR(", manualExposureBracketedCaptureParams: %@");
    goto LABEL_7;
  }
  return v3;
}

- (int)bracketingMode
{
  return self->_bracketingMode;
}

- (BOOL)providePreBracketedEV0
{
  return self->_providePreBracketedEV0;
}

- (void)setProvidePreBracketedEV0:(BOOL)a3
{
  self->_providePreBracketedEV0 = a3;
}

- (BOOL)lensStabilizationEnabledForClientBracket
{
  return self->_lensStabilizationEnabledForClientBracket;
}

- (void)setLensStabilizationEnabledForClientBracket:(BOOL)a3
{
  self->_lensStabilizationEnabledForClientBracket = a3;
}

- (NSArray)exposureValues
{
  return self->_exposureValues;
}

- (void)setExposureValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)manualExposureBracketedCaptureParams
{
  return self->_manualExposureBracketedCaptureParams;
}

- (void)setManualExposureBracketedCaptureParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)oisBracketedCaptureParams
{
  return self->_oisBracketedCaptureParams;
}

- (void)setOisBracketedCaptureParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
