@implementation BWStillImageCaptureMetadata

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (BWStillImageCaptureMetadata)init
{
  BWStillImageCaptureMetadata *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureMetadata;
  result = -[BWStillImageCaptureMetadata init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_alsLuxLevel = 0x7F7FFFFF7FFFFFFFLL;
  return result;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (int)deviceType
{
  return self->_deviceType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureMetadata)initWithCoder:(id)a3
{
  BWStillImageCaptureMetadata *v4;
  float v5;
  float v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  float v16;
  CMTime v18;

  v4 = -[BWStillImageCaptureMetadata init](self, "init");
  if (v4)
  {
    v4->_snrType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("metadataSNRType"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("metadataSNR"));
    v4->_snr = v5;
    v4->_alsLuxLevel = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("metadataALSLuxLevel"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("metadataALSRearLuxLevel"));
    v4->_alsRearLuxLevel = v6;
    v4->_deviceType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deviceType"));
    v4->_devicePosition = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("devicePosition"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v4->_slaveFocalLengths = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("slaveFocalLengths"));
    v4->_slaveLensFNumbers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("slaveLensFNumbers"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("totalZoomFactor"));
    v4->_totalZoomFactor = v13;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("uiZoomFactor"));
    v4->_uiZoomFactor = v14;
    v15 = objc_opt_class();
    v4->_exifFocalLengthMultiplierByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v15, objc_opt_class(), CFSTR("exifFocalLengthMultiplierByPortType"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exifFocalLengthOverride"));
    v4->_exifFocalLengthOverride = v16;
    v4->_fastCapturePrioritizationEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("fastCapturePrioritizationEnabled"));
    v4->_systemPressureLevel = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("systemPressureLevel"));
    v4->_cameraControlsStatisticsMaster = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("cameraControlsStatisticsMaster"));
    v4->_smartCamVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartCamVersion"));
    CMTimeMakeFromDictionary(&v18, (CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("smartCamTimestamp")));
    *(CMTime *)(&v4->_smartCamVersion + 1) = v18;
    v4->_smartCamInferences = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("smartCamInferences"));
    v4->_isPreviewSmartCamInferences = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isPreviewSmartCamInferences"));
    v4->_semanticStyleSceneType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("semanticStyleSceneType"));
    v4->_zeroShutterLagFailureReason = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("zeroShutterLagFailureReason"));
    v4->_shallowDepthOfFieldEffectSceneStatus = (NSNumber *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shallowDepthOfFieldEffectSceneStatus"));
    v4->_previewWhiteBalanceMetadataByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("previewWhiteBalanceMetadataByPortType"));
    v4->_streamingTime = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("streamingTime"));
    v4->_intelligentDistortionCorrectionEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("intelligentDistortionCorrectionEnabled"));
    v4->_geometricDistortionCorrectionEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("geometricDistortionCorrectionEnabled"));
    v4->_intelligentDistortionCorrectionVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("intelligentDistortionCorrectionVersion"));
    v4->_deepZoomVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepZoomVersion"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  const __CFAllocator *v10;
  CFDictionaryRef v11;
  CMTime v12;

  objc_msgSend(a3, "encodeInt32:forKey:", self->_snrType, CFSTR("metadataSNRType"));
  *(float *)&v5 = self->_snr;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("metadataSNR"), v5);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_alsLuxLevel, CFSTR("metadataALSLuxLevel"));
  *(float *)&v6 = self->_alsRearLuxLevel;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("metadataALSRearLuxLevel"), v6);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_devicePosition, CFSTR("devicePosition"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_slaveFocalLengths, CFSTR("slaveFocalLengths"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_slaveLensFNumbers, CFSTR("slaveLensFNumbers"));
  *(float *)&v7 = self->_totalZoomFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("totalZoomFactor"), v7);
  *(float *)&v8 = self->_uiZoomFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("uiZoomFactor"), v8);
  objc_msgSend(a3, "encodeObject:forKey:", self->_exifFocalLengthMultiplierByPortType, CFSTR("exifFocalLengthMultiplierByPortType"));
  *(float *)&v9 = self->_exifFocalLengthOverride;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exifFocalLengthOverride"), v9);
  objc_msgSend(a3, "encodeBool:forKey:", self->_fastCapturePrioritizationEnabled, CFSTR("fastCapturePrioritizationEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_systemPressureLevel, CFSTR("systemPressureLevel"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_cameraControlsStatisticsMaster, CFSTR("cameraControlsStatisticsMaster"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_smartCamVersion, CFSTR("smartCamVersion"));
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&v12.value = *(_OWORD *)(&self->_smartCamVersion + 1);
  v12.epoch = *(_QWORD *)&self->_smartCamTimestamp.flags;
  v11 = CMTimeCopyAsDictionary(&v12, v10);
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("smartCamTimestamp"));

  objc_msgSend(a3, "encodeObject:forKey:", self->_smartCamInferences, CFSTR("smartCamInferences"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPreviewSmartCamInferences, CFSTR("isPreviewSmartCamInferences"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_semanticStyleSceneType, CFSTR("semanticStyleSceneType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_zeroShutterLagFailureReason, CFSTR("zeroShutterLagFailureReason"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_shallowDepthOfFieldEffectSceneStatus, CFSTR("shallowDepthOfFieldEffectSceneStatus"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_previewWhiteBalanceMetadataByPortType, CFSTR("previewWhiteBalanceMetadataByPortType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_streamingTime, CFSTR("streamingTime"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureMetadata;
  -[BWStillImageCaptureMetadata dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int snrType;
  float snr;
  float v11;
  int alsLuxLevel;
  float alsRearLuxLevel;
  float v14;
  int deviceType;
  int devicePosition;
  NSArray *slaveFocalLengths;
  int v18;
  NSArray *slaveLensFNumbers;
  float totalZoomFactor;
  float v21;
  float uiZoomFactor;
  float v23;
  NSDictionary *exifFocalLengthMultiplierByPortType;
  float exifFocalLengthOverride;
  float v26;
  int fastCapturePrioritizationEnabled;
  int intelligentDistortionCorrectionEnabled;
  int geometricDistortionCorrectionEnabled;
  int intelligentDistortionCorrectionVersion;
  int deepZoomVersion;
  int systemPressureLevel;
  int cameraControlsStatisticsMaster;
  int smartCamVersion;
  NSDictionary *smartCamInferences;
  int isPreviewSmartCamInferences;
  int semanticStyleSceneType;
  int zeroShutterLagFailureReason;
  _BOOL4 v39;
  NSNumber *shallowDepthOfFieldEffectSceneStatus;
  int v41;
  NSDictionary *previewWhiteBalanceMetadataByPortType;
  unsigned int streamingTime;
  CMTime v45;
  CMTime time2;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if (a3 == self)
  {
    LOBYTE(v18) = 1;
    return v18;
  }
  v47 = v6;
  v48 = v5;
  v49 = v3;
  v50 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  snrType = self->_snrType;
  if (snrType != objc_msgSend(a3, "snrType"))
    goto LABEL_31;
  snr = self->_snr;
  objc_msgSend(a3, "snr");
  if (snr != v11)
    goto LABEL_31;
  alsLuxLevel = self->_alsLuxLevel;
  if (alsLuxLevel != objc_msgSend(a3, "alsLuxLevel"))
    goto LABEL_31;
  alsRearLuxLevel = self->_alsRearLuxLevel;
  objc_msgSend(a3, "alsRearLuxLevel");
  if (alsRearLuxLevel != v14)
    goto LABEL_31;
  deviceType = self->_deviceType;
  if (deviceType != objc_msgSend(a3, "deviceType"))
    goto LABEL_31;
  devicePosition = self->_devicePosition;
  if (devicePosition != objc_msgSend(a3, "devicePosition"))
    goto LABEL_31;
  slaveFocalLengths = self->_slaveFocalLengths;
  if (slaveFocalLengths == (NSArray *)objc_msgSend(a3, "slaveFocalLengths")
    || (v18 = -[NSArray isEqual:](self->_slaveFocalLengths, "isEqual:", objc_msgSend(a3, "slaveFocalLengths"))) != 0)
  {
    slaveLensFNumbers = self->_slaveLensFNumbers;
    if (slaveLensFNumbers == (NSArray *)objc_msgSend(a3, "slaveLensFNumbers")
      || (v18 = -[NSArray isEqual:](self->_slaveLensFNumbers, "isEqual:", objc_msgSend(a3, "slaveLensFNumbers"))) != 0)
    {
      totalZoomFactor = self->_totalZoomFactor;
      objc_msgSend(a3, "totalZoomFactor");
      if (totalZoomFactor != v21)
        goto LABEL_31;
      uiZoomFactor = self->_uiZoomFactor;
      objc_msgSend(a3, "uiZoomFactor");
      if (uiZoomFactor != v23)
        goto LABEL_31;
      exifFocalLengthMultiplierByPortType = self->_exifFocalLengthMultiplierByPortType;
      if (exifFocalLengthMultiplierByPortType == (NSDictionary *)objc_msgSend(a3, "exifFocalLengthMultiplierByPortType")|| (v18 = -[NSDictionary isEqualToDictionary:](self->_exifFocalLengthMultiplierByPortType, "isEqualToDictionary:", objc_msgSend(a3, "exifFocalLengthMultiplierByPortType"))) != 0)
      {
        exifFocalLengthOverride = self->_exifFocalLengthOverride;
        objc_msgSend(a3, "exifFocalLengthOverride");
        if (exifFocalLengthOverride != v26)
          goto LABEL_31;
        fastCapturePrioritizationEnabled = self->_fastCapturePrioritizationEnabled;
        if (fastCapturePrioritizationEnabled != objc_msgSend(a3, "fastCapturePrioritizationEnabled"))
          goto LABEL_31;
        intelligentDistortionCorrectionEnabled = self->_intelligentDistortionCorrectionEnabled;
        if (intelligentDistortionCorrectionEnabled != objc_msgSend(a3, "intelligentDistortionCorrectionEnabled"))goto LABEL_31;
        geometricDistortionCorrectionEnabled = self->_geometricDistortionCorrectionEnabled;
        if (geometricDistortionCorrectionEnabled != objc_msgSend(a3, "geometricDistortionCorrectionEnabled"))goto LABEL_31;
        intelligentDistortionCorrectionVersion = self->_intelligentDistortionCorrectionVersion;
        if (intelligentDistortionCorrectionVersion != objc_msgSend(a3, "intelligentDistortionCorrectionVersion"))goto LABEL_31;
        deepZoomVersion = self->_deepZoomVersion;
        if (deepZoomVersion != objc_msgSend(a3, "deepZoomVersion"))
          goto LABEL_31;
        systemPressureLevel = self->_systemPressureLevel;
        if (systemPressureLevel != objc_msgSend(a3, "systemPressureLevel"))
          goto LABEL_31;
        cameraControlsStatisticsMaster = self->_cameraControlsStatisticsMaster;
        if (cameraControlsStatisticsMaster != objc_msgSend(a3, "cameraControlsStatisticsMaster"))
          goto LABEL_31;
        smartCamVersion = self->_smartCamVersion;
        if (smartCamVersion != objc_msgSend(a3, "smartCamVersion"))
          goto LABEL_31;
        if (a3)
          objc_msgSend(a3, "smartCamTimestamp");
        else
          memset(&time2, 0, sizeof(time2));
        v45 = *(CMTime *)(&self->_smartCamVersion + 1);
        if (CMTimeCompare(&v45, &time2))
          goto LABEL_31;
        smartCamInferences = self->_smartCamInferences;
        if (smartCamInferences == (NSDictionary *)objc_msgSend(a3, "smartCamInferences")
          || (v18 = -[NSDictionary isEqualToDictionary:](self->_smartCamInferences, "isEqualToDictionary:", objc_msgSend(a3, "smartCamInferences"))) != 0)
        {
          isPreviewSmartCamInferences = self->_isPreviewSmartCamInferences;
          if (isPreviewSmartCamInferences == objc_msgSend(a3, "isPreviewSmartCamInferences"))
          {
            semanticStyleSceneType = self->_semanticStyleSceneType;
            if (semanticStyleSceneType == objc_msgSend(a3, "semanticStyleSceneType"))
            {
              zeroShutterLagFailureReason = self->_zeroShutterLagFailureReason;
              if (zeroShutterLagFailureReason == objc_msgSend(a3, "zeroShutterLagFailureReason"))
              {
                v39 = self->_shallowDepthOfFieldEffectSceneStatus != 0;
                if (v39 != (objc_msgSend(a3, "shallowDepthOfFieldEffectSceneStatus") == 0))
                {
                  shallowDepthOfFieldEffectSceneStatus = self->_shallowDepthOfFieldEffectSceneStatus;
                  if (!shallowDepthOfFieldEffectSceneStatus
                    || (v41 = -[NSNumber intValue](shallowDepthOfFieldEffectSceneStatus, "intValue"),
                        v41 == objc_msgSend((id)objc_msgSend(a3, "shallowDepthOfFieldEffectSceneStatus"), "intValue")))
                  {
                    previewWhiteBalanceMetadataByPortType = self->_previewWhiteBalanceMetadataByPortType;
                    if (previewWhiteBalanceMetadataByPortType == (NSDictionary *)objc_msgSend(a3, "previewWhiteBalanceMetadataByPortType")|| (v18 = -[NSDictionary isEqualToDictionary:](self->_previewWhiteBalanceMetadataByPortType, "isEqualToDictionary:", objc_msgSend(a3, "previewWhiteBalanceMetadataByPortType"))) != 0)
                    {
                      streamingTime = self->_streamingTime;
                      LOBYTE(v18) = streamingTime == objc_msgSend(a3, "streamingTime");
                    }
                    return v18;
                  }
                }
              }
            }
          }
LABEL_31:
          LOBYTE(v18) = 0;
        }
      }
    }
  }
  return v18;
}

- (unint64_t)hash
{
  return 9;
}

- (NSString)semanticStyleSceneTypeAsSmartCameraSceneType
{
  NSString **v2;

  switch(*((_DWORD *)self + 33))
  {
    case 0:
      v2 = (NSString **)MEMORY[0x1E0D07928];
      goto LABEL_6;
    case 1:
      v2 = (NSString **)MEMORY[0x1E0D07920];
      goto LABEL_6;
    case 2:
      v2 = (NSString **)MEMORY[0x1E0D07940];
      goto LABEL_6;
    case 3:
      v2 = (NSString **)MEMORY[0x1E0D07958];
LABEL_6:
      self = *v2;
      break;
    default:
      return self;
  }
  return self;
}

- (void)calculateSemanticStyleSceneType
{
  NSDictionary *smartCamInferences;
  float v4;
  int v5;
  float v6;
  float v7;
  float v8;

  smartCamInferences = self->_smartCamInferences;
  if (!smartCamInferences)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("smartCamInferences cannot be nil when invoking this method"), 0));
  objc_msgSend(-[NSDictionary valueForKey:](smartCamInferences, "valueForKey:", *MEMORY[0x1E0D07920]), "floatValue");
  if (v4 <= 0.77)
  {
    objc_msgSend(-[NSDictionary valueForKey:](self->_smartCamInferences, "valueForKey:", *MEMORY[0x1E0D07958]), "floatValue");
    if (v6 <= 0.88)
    {
      objc_msgSend(-[NSDictionary valueForKey:](self->_smartCamInferences, "valueForKey:", *MEMORY[0x1E0D07928]), "floatValue");
      if (v7 <= 0.4)
      {
        objc_msgSend(-[NSDictionary valueForKey:](self->_smartCamInferences, "valueForKey:", *MEMORY[0x1E0D07940]), "floatValue");
        if (v8 <= 0.58)
          return;
        v5 = 2;
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = 3;
    }
  }
  else
  {
    v5 = 1;
  }
  self->_semanticStyleSceneType = v5;
}

- (int)snrType
{
  return self->_snrType;
}

- (void)setSnrType:(int)a3
{
  self->_snrType = a3;
}

- (float)snr
{
  return self->_snr;
}

- (void)setSnr:(float)a3
{
  self->_snr = a3;
}

- (int)alsLuxLevel
{
  return self->_alsLuxLevel;
}

- (void)setAlsLuxLevel:(int)a3
{
  self->_alsLuxLevel = a3;
}

- (float)alsRearLuxLevel
{
  return self->_alsRearLuxLevel;
}

- (void)setAlsRearLuxLevel:(float)a3
{
  self->_alsRearLuxLevel = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (NSArray)slaveFocalLengths
{
  return self->_slaveFocalLengths;
}

- (void)setSlaveFocalLengths:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)slaveLensFNumbers
{
  return self->_slaveLensFNumbers;
}

- (void)setSlaveLensFNumbers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (float)totalZoomFactor
{
  return self->_totalZoomFactor;
}

- (void)setTotalZoomFactor:(float)a3
{
  self->_totalZoomFactor = a3;
}

- (float)uiZoomFactor
{
  return self->_uiZoomFactor;
}

- (void)setUiZoomFactor:(float)a3
{
  self->_uiZoomFactor = a3;
}

- (NSDictionary)exifFocalLengthMultiplierByPortType
{
  return self->_exifFocalLengthMultiplierByPortType;
}

- (void)setExifFocalLengthMultiplierByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (float)exifFocalLengthOverride
{
  return self->_exifFocalLengthOverride;
}

- (void)setExifFocalLengthOverride:(float)a3
{
  self->_exifFocalLengthOverride = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (int)systemPressureLevel
{
  return self->_systemPressureLevel;
}

- (void)setSystemPressureLevel:(int)a3
{
  self->_systemPressureLevel = a3;
}

- (int)cameraControlsStatisticsMaster
{
  return self->_cameraControlsStatisticsMaster;
}

- (void)setCameraControlsStatisticsMaster:(int)a3
{
  self->_cameraControlsStatisticsMaster = a3;
}

- (int)smartCamVersion
{
  return self->_smartCamVersion;
}

- (void)setSmartCamVersion:(int)a3
{
  self->_smartCamVersion = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)smartCamTimestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[4].var2;
  return self;
}

- (void)setSmartCamTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_smartCamTimestamp.flags = a3->var3;
  *(_OWORD *)(&self->_smartCamVersion + 1) = v3;
}

- (NSDictionary)smartCamInferences
{
  return self->_smartCamInferences;
}

- (void)setSmartCamInferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (BOOL)isPreviewSmartCamInferences
{
  return self->_isPreviewSmartCamInferences;
}

- (void)setIsPreviewSmartCamInferences:(BOOL)a3
{
  self->_isPreviewSmartCamInferences = a3;
}

- (int)semanticStyleSceneType
{
  return self->_semanticStyleSceneType;
}

- (void)setSemanticStyleSceneType:(int)a3
{
  self->_semanticStyleSceneType = a3;
}

- (int)zeroShutterLagFailureReason
{
  return self->_zeroShutterLagFailureReason;
}

- (void)setZeroShutterLagFailureReason:(int)a3
{
  self->_zeroShutterLagFailureReason = a3;
}

- (NSNumber)shallowDepthOfFieldEffectSceneStatus
{
  return self->_shallowDepthOfFieldEffectSceneStatus;
}

- (void)setShallowDepthOfFieldEffectSceneStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSDictionary)previewWhiteBalanceMetadataByPortType
{
  return self->_previewWhiteBalanceMetadataByPortType;
}

- (void)setPreviewWhiteBalanceMetadataByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

- (BOOL)intelligentDistortionCorrectionEnabled
{
  return self->_intelligentDistortionCorrectionEnabled;
}

- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_intelligentDistortionCorrectionEnabled = a3;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (int)intelligentDistortionCorrectionVersion
{
  return self->_intelligentDistortionCorrectionVersion;
}

- (void)setIntelligentDistortionCorrectionVersion:(int)a3
{
  self->_intelligentDistortionCorrectionVersion = a3;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
}

@end
