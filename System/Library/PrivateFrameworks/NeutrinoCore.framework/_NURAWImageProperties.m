@implementation _NURAWImageProperties

- (id)inputNeutralXYFromRGB:(const double *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[_NURAWImageProperties rawConvert](self, "rawConvert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[1], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("inputNeutral"));

  objc_msgSend(v5, "valueForKey:", CFSTR("inputNeutralXY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NURAWImageProperties decoderVersion](self, "decoderVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NURAWImageProperties temperature](self, "temperature");
  v7 = v6;
  -[_NURAWImageProperties tint](self, "tint");
  v9 = v8;
  -[_NURAWImageProperties noiseReductionProperties](self, "noiseReductionProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> kCIInputDecoderVersionKey=%@ temp=%f tint=%f noiseReduction=%@"), v4, self, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)decoderVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDecoderVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)availableDecoderVersions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAvailableDecoderVersions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

- (double)tint
{
  return self->_tint;
}

- (void)setTint:(double)a3
{
  self->_tint = a3;
}

- (CIFilter)rawConvert
{
  return (CIFilter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRawConvert:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NURAWNoiseReductionProperties)noiseReductionProperties
{
  return (NURAWNoiseReductionProperties *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNoiseReductionProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_NURAWCameraSpaceProperties)rawCameraSpaceProperties
{
  return (_NURAWCameraSpaceProperties *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRawCameraSpaceProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (_NURAWToneCurveProperties)rawToneCurveProperties
{
  return (_NURAWToneCurveProperties *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawToneCurveProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isAppleProRaw
{
  return self->_isAppleProRaw;
}

- (void)setIsAppleProRaw:(BOOL)a3
{
  self->_isAppleProRaw = a3;
}

- (BOOL)isSensorRawCapture
{
  return self->_isSensorRawCapture;
}

- (void)setIsSensorRawCapture:(BOOL)a3
{
  self->_isSensorRawCapture = a3;
}

- (BOOL)isUnifiedBracketingHDRCapture
{
  return self->_isUnifiedBracketingHDRCapture;
}

- (void)setIsUnifiedBracketingHDRCapture:(BOOL)a3
{
  self->_isUnifiedBracketingHDRCapture = a3;
}

- (BOOL)isDeepFusion
{
  return self->_isDeepFusion;
}

- (void)setIsDeepFusion:(BOOL)a3
{
  self->_isDeepFusion = a3;
}

- (BOOL)hasLensCorrection
{
  return self->_hasLensCorrection;
}

- (void)setHasLensCorrection:(BOOL)a3
{
  self->_hasLensCorrection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawToneCurveProperties, 0);
  objc_storeStrong((id *)&self->_rawCameraSpaceProperties, 0);
  objc_storeStrong((id *)&self->_noiseReductionProperties, 0);
  objc_storeStrong((id *)&self->_rawConvert, 0);
  objc_storeStrong((id *)&self->_availableDecoderVersions, 0);
  objc_storeStrong((id *)&self->_decoderVersion, 0);
}

@end
