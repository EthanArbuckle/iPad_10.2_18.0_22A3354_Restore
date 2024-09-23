@implementation CMContinuityCaptureConfiguration

- (CMContinuityCaptureConfiguration)init
{
  CMContinuityCaptureConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureConfiguration;
  result = -[CMContinuityCaptureConfiguration init](&v3, sel_init);
  if (result)
    result->_stateLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  __CVBuffer *backgroundReplacementPixelBuffer;
  objc_super v4;

  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  if (backgroundReplacementPixelBuffer)
  {
    CFRelease(backgroundReplacementPixelBuffer);
    self->_backgroundReplacementPixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureConfiguration;
  -[CMContinuityCaptureConfiguration dealloc](&v4, sel_dealloc);
}

- (void)setCenterStageRectOfInterest:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  NSDictionary *v6;
  NSDictionary *centerStageRectOfInterest;
  CGSize v8;
  NSString *v9;
  NSString *centerStageRectOfInterestStr;
  CGRect rect;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  v6 = (NSDictionary *)objc_msgSend(v5, "copy");
  centerStageRectOfInterest = self->_centerStageRectOfInterest;
  self->_centerStageRectOfInterest = v6;

  v8 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  rect.origin = (CGPoint)*MEMORY[0x24BDBF090];
  rect.size = v8;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v5, &rect);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[x:%.2f,y:%.2f,w:%.2f,h:%.2f]"), *(_QWORD *)&rect.origin.x, *(_QWORD *)&rect.origin.y, *(_QWORD *)&rect.size.width, *(_QWORD *)&rect.size.height);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  centerStageRectOfInterestStr = self->_centerStageRectOfInterestStr;
  self->_centerStageRectOfInterestStr = v9;

  os_unfair_lock_unlock(p_stateLock);
}

- (NSDictionary)centerStageRectOfInterest
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)-[NSDictionary copy](self->_centerStageRectOfInterest, "copy");
  os_unfair_lock_unlock(p_stateLock);
  return (NSDictionary *)v4;
}

- (BOOL)isCenterStageForcefullyEnabled
{
  return -[CMContinuityCaptureConfiguration forcefulCenterStageEnablementType](self, "forcefulCenterStageEnablementType") != 0;
}

- (CMContinuityCaptureConfiguration)initWithCoder:(id)a3
{
  id v4;
  CMContinuityCaptureConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *centerStageRectOfInterest;
  uint64_t v9;
  CMContinuityCaptureStreamFormat *format;
  double v11;
  uint64_t v12;
  NSUUID *sessionID;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *asyncStillCaptureConfigs;
  int v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  CMContinuityCaptureConfiguration *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CMContinuityCaptureConfiguration;
  v5 = -[CMContinuityCaptureConfiguration init](&v25, sel_init);
  if (v5)
  {
    v5->_entity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("entity"));
    v5->_suppressVideoEffects = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressVideoEffects"));
    v5->_portraitEffectEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("portraitEffectEnabled"));
    v5->_centerStageEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("centerStageEnabled"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("centerStageRectOfInterest"));
    v7 = objc_claimAutoreleasedReturnValue();
    centerStageRectOfInterest = v5->_centerStageRectOfInterest;
    v5->_centerStageRectOfInterest = (NSDictionary *)v7;

    v5->_centerStageFramingMode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("centerStageFramingMode"));
    v5->_forcefulCenterStageEnablementType = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("forcefulCenterStageEnablementType"));
    v5->_faceDetectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("faceDetectionEnabled"));
    v5->_humanBodyDetectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("humanBodyDetectionEnabled"));
    v5->_humanFullBodyDetectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("humanFullBodyDetectionEnabled"));
    v5->_studioLightingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("studioLightingEnabled"));
    v5->_reactionEffectsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reactionEffectsEnabled"));
    v5->_backgroundReplacementEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundReplacementEnabled"));
    v5->_maxFrameRate = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("frameRate"));
    v5->_minFrameRate = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("minFrameRate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
    v9 = objc_claimAutoreleasedReturnValue();
    format = v5->_format;
    v5->_format = (CMContinuityCaptureStreamFormat *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("videoZoomFactor"));
    v5->_videoZoomFactor = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v12 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v12;

    v5->_asyncStillCaptureEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("asyncStillCaptureEnabled"));
    v14 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v14, objc_opt_class(), CFSTR("asyncStillCaptureConfigs"));
    v15 = objc_claimAutoreleasedReturnValue();
    asyncStillCaptureConfigs = v5->_asyncStillCaptureConfigs;
    v5->_asyncStillCaptureConfigs = (NSDictionary *)v15;

    v5->_generationID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("generationID"));
    v5->_deskViewCameraMode = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("deskViewCameraMode"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("audioDeviceMode")))
      v17 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("audioDeviceMode"));
    else
      v17 = 1684434036;
    v5->_audioDeviceMode = v17;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("portraitEffectAperture"));
    v5->_portraitEffectAperture = v18;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("studioLightingIntensity"));
    v5->_studioLightingIntensity = v19;
    v5->_reactionEffectGesturesEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reactionEffectGesturesEnabled"));
    v20 = (void *)objc_msgSend(v4, "decodeCVPixelBufferForKey:expectSourceMedia:", CFSTR("backgroundReplacementPixelBuffer"), 1);
    if (v20)
      v20 = (void *)CFRetain(v20);
    v5->_backgroundReplacementPixelBuffer = (__CVBuffer *)v20;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("panningAngleX"));
    v5->_panningAngleX = v21;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("panningAngleY"));
    v5->_panningAngleY = v22;
    v5->_manualFramingDeviceType = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("manualFramingDeviceType"));
    v5->_centerStageFieldOfViewRestrictedToWide = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("centerStageFieldOfViewRestrictedToWide"));
    v5->_stateLock._os_unfair_lock_opaque = 0;
    v23 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  os_unfair_lock_s *p_stateLock;
  __CFString *v4;
  objc_class *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  _BOOL8 backgroundReplacementEnabled;
  double videoZoomFactor;
  CMContinuityCaptureStreamFormat *format;
  int64_t deskViewCameraMode;
  unint64_t generationID;
  double portraitEffectAperture;
  double studioLightingIntensity;
  double panningAngleX;
  double panningAngleY;
  uint64_t minFrameRate;
  uint64_t maxFrameRate;
  uint64_t audioDeviceMode;
  void *v21;
  void *v22;
  _BOOL8 studioLightingEnabled;
  uint64_t v25;
  _BOOL8 asyncStillCaptureEnabled;
  _BOOL8 humanFullBodyDetectionEnabled;
  _BOOL8 humanBodyDetectionEnabled;
  _BOOL8 faceDetectionEnabled;
  int64_t centerStageFramingMode;
  const __CFString *v31;
  int64_t forcefulCenterStageEnablementType;
  _BOOL8 centerStageEnabled;
  _BOOL8 portraitEffectEnabled;
  _BOOL8 suppressVideoEffects;
  int64_t entity;
  void *v37;
  void *v38;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (__CFString *)-[NSString copy](self->_centerStageRectOfInterestStr, "copy");
  os_unfair_lock_unlock(p_stateLock);
  v38 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  entity = self->_entity;
  v37 = (void *)v6;
  suppressVideoEffects = self->_suppressVideoEffects;
  portraitEffectEnabled = self->_portraitEffectEnabled;
  centerStageEnabled = self->_centerStageEnabled;
  if (v4)
    v7 = v4;
  else
    v7 = CFSTR("default");
  v31 = v7;
  forcefulCenterStageEnablementType = self->_forcefulCenterStageEnablementType;
  faceDetectionEnabled = self->_faceDetectionEnabled;
  centerStageFramingMode = self->_centerStageFramingMode;
  humanBodyDetectionEnabled = self->_humanBodyDetectionEnabled;
  humanFullBodyDetectionEnabled = self->_humanFullBodyDetectionEnabled;
  asyncStillCaptureEnabled = self->_asyncStillCaptureEnabled;
  v8 = -[CMContinuityCaptureConfiguration maxPhotoQualityPrioritization](self, "maxPhotoQualityPrioritization");
  studioLightingEnabled = self->_studioLightingEnabled;
  v25 = v8;
  backgroundReplacementEnabled = self->_backgroundReplacementEnabled;
  videoZoomFactor = self->_videoZoomFactor;
  format = self->_format;
  deskViewCameraMode = self->_deskViewCameraMode;
  generationID = self->_generationID;
  portraitEffectAperture = self->_portraitEffectAperture;
  studioLightingIntensity = self->_studioLightingIntensity;
  panningAngleX = self->_panningAngleX;
  panningAngleY = self->_panningAngleY;
  maxFrameRate = self->_maxFrameRate;
  minFrameRate = self->_minFrameRate;
  audioDeviceMode = self->_audioDeviceMode;
  +[CMContinuityCaptureConfiguration stringForManualFramingDeviceType:](CMContinuityCaptureConfiguration, "stringForManualFramingDeviceType:", self->_manualFramingDeviceType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: Entity:%d SVE:%d PE:%d CS:%d FCST:%lu CSRI:%@ CSFM:%ld FD:%d HBD:%d HFBD:%d AsyncStill:%d MQP:%d SL:%d BR:%d FR:%u MnFR:%u VideoZoomFactor:%.2f Format:%@ DVCM:%u ADM:%u GID:%llx PEA:%f SLI:%f PA[x:%f,y:%f] MFD:%@ FoVTW:%d [%p]"), v37, entity, suppressVideoEffects, portraitEffectEnabled, centerStageEnabled, forcefulCenterStageEnablementType, v31, centerStageFramingMode, faceDetectionEnabled, humanBodyDetectionEnabled, humanFullBodyDetectionEnabled, asyncStillCaptureEnabled, v25, studioLightingEnabled, backgroundReplacementEnabled, maxFrameRate,
    minFrameRate,
    *(_QWORD *)&videoZoomFactor,
    format,
    deskViewCameraMode,
    audioDeviceMode,
    generationID,
    *(_QWORD *)&portraitEffectAperture,
    *(_QWORD *)&studioLightingIntensity,
    *(_QWORD *)&panningAngleX,
    *(_QWORD *)&panningAngleY,
    v21,
    self->_centerStageFieldOfViewRestrictedToWide,
    self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 suppressVideoEffects;
  double v5;
  double v6;
  double panningAngleX;
  double panningAngleY;
  id v9;

  suppressVideoEffects = self->_suppressVideoEffects;
  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", suppressVideoEffects, CFSTR("suppressVideoEffects"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_portraitEffectEnabled, CFSTR("portraitEffectEnabled"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_centerStageEnabled, CFSTR("centerStageEnabled"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_centerStageRectOfInterest, CFSTR("centerStageRectOfInterest"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_centerStageFramingMode, CFSTR("centerStageFramingMode"));
  objc_msgSend(v9, "encodeInt32:forKey:", LODWORD(self->_forcefulCenterStageEnablementType), CFSTR("forcefulCenterStageEnablementType"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_faceDetectionEnabled, CFSTR("faceDetectionEnabled"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_humanBodyDetectionEnabled, CFSTR("humanBodyDetectionEnabled"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_humanFullBodyDetectionEnabled, CFSTR("humanFullBodyDetectionEnabled"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_studioLightingEnabled, CFSTR("studioLightingEnabled"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_reactionEffectsEnabled, CFSTR("reactionEffectsEnabled"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_backgroundReplacementEnabled, CFSTR("backgroundReplacementEnabled"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_maxFrameRate, CFSTR("frameRate"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_minFrameRate, CFSTR("minFrameRate"));
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("videoZoomFactor"), self->_videoZoomFactor);
  objc_msgSend(v9, "encodeObject:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_entity, CFSTR("entity"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_asyncStillCaptureEnabled, CFSTR("asyncStillCaptureEnabled"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_asyncStillCaptureConfigs, CFSTR("asyncStillCaptureConfigs"));
  objc_msgSend(v9, "encodeInt32:forKey:", LODWORD(self->_deskViewCameraMode), CFSTR("deskViewCameraMode"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_audioDeviceMode, CFSTR("audioDeviceMode"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_generationID, CFSTR("generationID"));
  *(float *)&v5 = self->_portraitEffectAperture;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("portraitEffectAperture"), v5);
  *(float *)&v6 = self->_studioLightingIntensity;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("studioLightingIntensity"), v6);
  objc_msgSend(v9, "encodeBool:forKey:", self->_reactionEffectGesturesEnabled, CFSTR("reactionEffectGesturesEnabled"));
  objc_msgSend(v9, "encodeCVPixelBuffer:forKey:", self->_backgroundReplacementPixelBuffer, CFSTR("backgroundReplacementPixelBuffer"));
  panningAngleX = self->_panningAngleX;
  *(float *)&panningAngleX = panningAngleX;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("panningAngleX"), panningAngleX);
  panningAngleY = self->_panningAngleY;
  *(float *)&panningAngleY = panningAngleY;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("panningAngleY"), panningAngleY);
  objc_msgSend(v9, "encodeInteger:forKey:", self->_manualFramingDeviceType, CFSTR("manualFramingDeviceType"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_centerStageFieldOfViewRestrictedToWide, CFSTR("centerStageFieldOfViewRestrictedToWide"));

}

- (int)maxPhotoQualityPrioritization
{
  void *v2;
  int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_asyncStillCaptureConfigs, "objectForKeyedSubscript:", CFSTR("MaxPhotoQualityPrioritization"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

+ (id)stringForManualFramingDeviceType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown Manual Framing device type");
  if (a3 == 2)
    v3 = CFSTR("ultra wide");
  if (a3 == 1)
    return CFSTR("back wide");
  else
    return (id)v3;
}

- (int64_t)entity
{
  return self->_entity;
}

- (void)setEntity:(int64_t)a3
{
  self->_entity = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(unint64_t)a3
{
  self->_generationID = a3;
}

- (BOOL)suppressVideoEffects
{
  return self->_suppressVideoEffects;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  self->_suppressVideoEffects = a3;
}

- (BOOL)portraitEffectEnabled
{
  return self->_portraitEffectEnabled;
}

- (void)setPortraitEffectEnabled:(BOOL)a3
{
  self->_portraitEffectEnabled = a3;
}

- (BOOL)centerStageEnabled
{
  return self->_centerStageEnabled;
}

- (void)setCenterStageEnabled:(BOOL)a3
{
  self->_centerStageEnabled = a3;
}

- (int64_t)centerStageFramingMode
{
  return self->_centerStageFramingMode;
}

- (void)setCenterStageFramingMode:(int64_t)a3
{
  self->_centerStageFramingMode = a3;
}

- (int64_t)forcefulCenterStageEnablementType
{
  return self->_forcefulCenterStageEnablementType;
}

- (void)setForcefulCenterStageEnablementType:(int64_t)a3
{
  self->_forcefulCenterStageEnablementType = a3;
}

- (BOOL)faceDetectionEnabled
{
  return self->_faceDetectionEnabled;
}

- (void)setFaceDetectionEnabled:(BOOL)a3
{
  self->_faceDetectionEnabled = a3;
}

- (BOOL)humanBodyDetectionEnabled
{
  return self->_humanBodyDetectionEnabled;
}

- (void)setHumanBodyDetectionEnabled:(BOOL)a3
{
  self->_humanBodyDetectionEnabled = a3;
}

- (BOOL)humanFullBodyDetectionEnabled
{
  return self->_humanFullBodyDetectionEnabled;
}

- (void)setHumanFullBodyDetectionEnabled:(BOOL)a3
{
  self->_humanFullBodyDetectionEnabled = a3;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_studioLightingEnabled = a3;
}

- (float)portraitEffectAperture
{
  return self->_portraitEffectAperture;
}

- (void)setPortraitEffectAperture:(float)a3
{
  self->_portraitEffectAperture = a3;
}

- (float)studioLightingIntensity
{
  return self->_studioLightingIntensity;
}

- (void)setStudioLightingIntensity:(float)a3
{
  self->_studioLightingIntensity = a3;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (BOOL)reactionEffectGesturesEnabled
{
  return self->_reactionEffectGesturesEnabled;
}

- (void)setReactionEffectGesturesEnabled:(BOOL)a3
{
  self->_reactionEffectGesturesEnabled = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_backgroundReplacementEnabled = a3;
}

- (__CVBuffer)backgroundReplacementPixelBuffer
{
  return (__CVBuffer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CMContinuityCaptureStreamFormat)format
{
  return (CMContinuityCaptureStreamFormat *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (unsigned)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(unsigned int)a3
{
  self->_maxFrameRate = a3;
}

- (unsigned)minFrameRate
{
  return self->_minFrameRate;
}

- (void)setMinFrameRate:(unsigned int)a3
{
  self->_minFrameRate = a3;
}

- (double)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (void)setVideoZoomFactor:(double)a3
{
  self->_videoZoomFactor = a3;
}

- (BOOL)asyncStillCaptureEnabled
{
  return self->_asyncStillCaptureEnabled;
}

- (void)setAsyncStillCaptureEnabled:(BOOL)a3
{
  self->_asyncStillCaptureEnabled = a3;
}

- (NSDictionary)asyncStillCaptureConfigs
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAsyncStillCaptureConfigs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (int64_t)deskViewCameraMode
{
  return self->_deskViewCameraMode;
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  self->_deskViewCameraMode = a3;
}

- (unsigned)audioDeviceMode
{
  return self->_audioDeviceMode;
}

- (void)setAudioDeviceMode:(unsigned int)a3
{
  self->_audioDeviceMode = a3;
}

- (double)panningAngleX
{
  return self->_panningAngleX;
}

- (void)setPanningAngleX:(double)a3
{
  self->_panningAngleX = a3;
}

- (double)panningAngleY
{
  return self->_panningAngleY;
}

- (void)setPanningAngleY:(double)a3
{
  self->_panningAngleY = a3;
}

- (BOOL)centerStageFieldOfViewRestrictedToWide
{
  return self->_centerStageFieldOfViewRestrictedToWide;
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  self->_centerStageFieldOfViewRestrictedToWide = a3;
}

- (int64_t)manualFramingDeviceType
{
  return self->_manualFramingDeviceType;
}

- (void)setManualFramingDeviceType:(int64_t)a3
{
  self->_manualFramingDeviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncStillCaptureConfigs, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_centerStageRectOfInterestStr, 0);
  objc_storeStrong((id *)&self->_centerStageRectOfInterest, 0);
}

@end
