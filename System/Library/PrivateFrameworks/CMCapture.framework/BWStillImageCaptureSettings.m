@implementation BWStillImageCaptureSettings

- (unint64_t)captureFlags
{
  return self->_captureFlags;
}

- (id)metadata
{
  id result;

  result = self->_metadata;
  if (!result)
  {
    result = objc_alloc_init(BWStillImageCaptureMetadata);
    self->_metadata = (BWStillImageCaptureMetadata *)result;
  }
  return result;
}

- (void)setMetadata:(id)a3
{

  self->_metadata = (BWStillImageCaptureMetadata *)a3;
}

- (void)setMasterPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)masterPortType
{
  return self->_masterPortType;
}

- (BOOL)downgradedDeepFusionEnhancedResolutionCapture
{
  return self->_downgradedDeepFusionEnhancedResolutionCapture;
}

- (int)captureType
{
  return self->_captureType;
}

- (id)captureStreamSettingsForPortType:(id)a3
{
  NSArray *captureStreamSettings;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(captureStreamSettings);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "portType"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureSettings)initWithSettingsID:(int64_t)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 sceneFlags:(unint64_t)a6 frameStatisticsByPortType:(id)a7 deliverOriginalImage:(BOOL)a8 deliverSushiRaw:(BOOL)a9 captureStreamSettings:(id)a10
{
  BWStillImageCaptureSettings *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BWStillImageCaptureSettings;
  v16 = -[BWStillImageCaptureSettings init](&v18, sel_init);
  if (v16)
  {
    if (!objc_msgSend(a10, "count"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("captureStreamSettings must have at least 1 element"), 0));
    v16->_settingsID = a3;
    v16->_captureType = a4;
    v16->_captureFlags = a5;
    v16->_sceneFlags = a6;
    v16->_frameStatisticsByPortType = (BWFrameStatisticsByPortType *)a7;
    v16->_deliverOriginalImage = a8;
    v16->_deliverSushiRaw = a9;
    v16->_captureStreamSettings = (NSArray *)a10;
    v16->_cmioMaxPhotoDimensions.width = 0;
    v16->_cmioMaxPhotoDimensions.height = 0;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureSettings;
  -[BWStillImageCaptureSettings dealloc](&v3, sel_dealloc);
}

- (BWStillImageCaptureSettings)initWithCoder:(id)a3
{
  BWStillImageCaptureSettings *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  float v9;
  CMTime v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = -[BWStillImageCaptureSettings init](self, "init");
  if (v4)
  {
    v4->_settingsID = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("settingsID"));
    v4->_captureType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("captureType"));
    v4->_captureFlags = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("captureFlags"));
    v4->_sceneFlags = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("sceneFlags"));
    v4->_deliverOriginalImage = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deliverOriginalImage"));
    v4->_deliverSushiRaw = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deliverSushiRaw"));
    v4->_deliverDeferredPhotoProxyImage = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deferredPhotoProxyImageKey"));
    v4->_downgradedDeepFusionEnhancedResolutionCapture = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wasDeepFusionEnhancedResolutionCapture"));
    v4->_learnedNRStereoPhotoFrameFlag = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("learnedNRStereoPhotoFrameFlag"));
    v4->_masterPortType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("masterPortType"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v6 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2)), CFSTR("captureStreamSettings"));
    v4->_captureStreamSettings = v6;
    if (!-[NSArray count](v6, "count"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("captureStreamSettings must have at least 1 element"), 0));
    if (!v4->_masterPortType)
      v4->_masterPortType = (NSString *)(id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v4->_captureStreamSettings, "objectAtIndexedSubscript:", 0), "portType");
    v4->_timeMachineReferenceFrameBracketedCaptureSequenceNumber = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("timeMachineReferenceFrameBracketedCaptureSequenceNumber"));
    v7 = objc_opt_class();
    v8 = (const __CFDictionary *)objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v7, objc_opt_class(), CFSTR("lastTimeMachinePTS"));
    CMTimeMakeFromDictionary(&v11, v8);
    *(CMTime *)(&v4->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1) = v11;
    v4->_frameStatisticsByPortType = (BWFrameStatisticsByPortType *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameStatisticsByPortType"));
    v4->_metadata = (BWStillImageCaptureMetadata *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureMetadata"));
    v4->_streamSelectorDebugInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("streamSelectorDebugInfo"));
    v4->_applicationID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationID"));
    v4->_stillImageRequestTime = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("stillImageRequestTime"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("scaleFactor"));
    v4->_scaleFactor = v9;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  double v7;
  CMTime v8;

  objc_msgSend(a3, "encodeInt64:forKey:", self->_settingsID, CFSTR("settingsID"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_captureType, CFSTR("captureType"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_captureFlags, CFSTR("captureFlags"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_sceneFlags, CFSTR("sceneFlags"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deliverOriginalImage, CFSTR("deliverOriginalImage"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deliverSushiRaw, CFSTR("deliverSushiRaw"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deliverDeferredPhotoProxyImage, CFSTR("deferredPhotoProxyImageKey"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_downgradedDeepFusionEnhancedResolutionCapture, CFSTR("wasDeepFusionEnhancedResolutionCapture"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_learnedNRStereoPhotoFrameFlag, CFSTR("learnedNRStereoPhotoFrameFlag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_masterPortType, CFSTR("masterPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureStreamSettings, CFSTR("captureStreamSettings"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber, CFSTR("timeMachineReferenceFrameBracketedCaptureSequenceNumber"));
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&v8.value = *(_OWORD *)(&self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1);
  v8.epoch = *(_QWORD *)&self->_lastTimeMachinePTS.flags;
  v6 = CMTimeCopyAsDictionary(&v8, v5);
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("lastTimeMachinePTS"));

  objc_msgSend(a3, "encodeObject:forKey:", self->_frameStatisticsByPortType, CFSTR("frameStatisticsByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_metadata, CFSTR("captureMetadata"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_streamSelectorDebugInfo, CFSTR("streamSelectorDebugInfo"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_applicationID, CFSTR("applicationID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_stillImageRequestTime, CFSTR("stillImageRequestTime"));
  *(float *)&v7 = self->_scaleFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("scaleFactor"), v7);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t settingsID;
  int captureType;
  unint64_t captureFlags;
  unint64_t sceneFlags;
  int deliverOriginalImage;
  int deliverSushiRaw;
  int deliverDeferredPhotoProxyImage;
  int downgradedDeepFusionEnhancedResolutionCapture;
  unint64_t learnedNRStereoPhotoFrameFlag;
  int v18;
  BWStillImageCaptureMetadata *metadata;
  NSDictionary *streamSelectorDebugInfo;
  NSArray *captureStreamSettings;
  int timeMachineReferenceFrameBracketedCaptureSequenceNumber;
  NSString *applicationID;
  int64_t stillImageRequestTime;
  float scaleFactor;
  float v26;
  CMTime v28;
  CMTime time2;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a3 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    v30 = v6;
    v31 = v5;
    v32 = v3;
    v33 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    settingsID = self->_settingsID;
    if (settingsID != objc_msgSend(a3, "settingsID"))
      goto LABEL_25;
    captureType = self->_captureType;
    if (captureType != objc_msgSend(a3, "captureType"))
      goto LABEL_25;
    captureFlags = self->_captureFlags;
    if (captureFlags != objc_msgSend(a3, "captureFlags"))
      goto LABEL_25;
    sceneFlags = self->_sceneFlags;
    if (sceneFlags != objc_msgSend(a3, "sceneFlags"))
      goto LABEL_25;
    deliverOriginalImage = self->_deliverOriginalImage;
    if (deliverOriginalImage != objc_msgSend(a3, "deliverOriginalImage"))
      goto LABEL_25;
    deliverSushiRaw = self->_deliverSushiRaw;
    if (deliverSushiRaw != objc_msgSend(a3, "deliverSushiRaw"))
      goto LABEL_25;
    deliverDeferredPhotoProxyImage = self->_deliverDeferredPhotoProxyImage;
    if (deliverDeferredPhotoProxyImage != objc_msgSend(a3, "deliverDeferredPhotoProxyImage"))
      goto LABEL_25;
    downgradedDeepFusionEnhancedResolutionCapture = self->_downgradedDeepFusionEnhancedResolutionCapture;
    if (downgradedDeepFusionEnhancedResolutionCapture != objc_msgSend(a3, "downgradedDeepFusionEnhancedResolutionCapture"))goto LABEL_25;
    learnedNRStereoPhotoFrameFlag = self->_learnedNRStereoPhotoFrameFlag;
    if (learnedNRStereoPhotoFrameFlag != objc_msgSend(a3, "learnedNRStereoPhotoFrameFlag"))
      goto LABEL_25;
    v18 = -[BWFrameStatisticsByPortType isEqual:](self->_frameStatisticsByPortType, "isEqual:", objc_msgSend(a3, "frameStatisticsByPortType"));
    if (v18)
    {
      metadata = self->_metadata;
      if (metadata == (BWStillImageCaptureMetadata *)objc_msgSend(a3, "metadata")
        || (v18 = -[BWStillImageCaptureMetadata isEqual:](self->_metadata, "isEqual:", objc_msgSend(a3, "metadata"))) != 0)
      {
        streamSelectorDebugInfo = self->_streamSelectorDebugInfo;
        if (streamSelectorDebugInfo == (NSDictionary *)objc_msgSend(a3, "streamSelectorDebugInfo")
          || (v18 = -[NSDictionary isEqualToDictionary:](self->_streamSelectorDebugInfo, "isEqualToDictionary:", objc_msgSend(a3, "streamSelectorDebugInfo"))) != 0)
        {
          captureStreamSettings = self->_captureStreamSettings;
          if (captureStreamSettings == (NSArray *)objc_msgSend(a3, "captureStreamSettings")
            || (v18 = -[NSArray isEqual:](self->_captureStreamSettings, "isEqual:", objc_msgSend(a3, "captureStreamSettings"))) != 0)
          {
            timeMachineReferenceFrameBracketedCaptureSequenceNumber = self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber;
            if (timeMachineReferenceFrameBracketedCaptureSequenceNumber != objc_msgSend(a3, "timeMachineReferenceFrameBracketedCaptureSequenceNumber"))goto LABEL_25;
            if (a3)
              objc_msgSend(a3, "lastTimeMachinePTS");
            else
              memset(&time2, 0, sizeof(time2));
            v28 = *(CMTime *)(&self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1);
            if (CMTimeCompare(&v28, &time2))
              goto LABEL_25;
            applicationID = self->_applicationID;
            if (applicationID == (NSString *)objc_msgSend(a3, "applicationID")
              || (v18 = -[NSString isEqualToString:](self->_applicationID, "isEqualToString:", objc_msgSend(a3, "applicationID"))) != 0)
            {
              stillImageRequestTime = self->_stillImageRequestTime;
              if (stillImageRequestTime == objc_msgSend(a3, "stillImageRequestTime"))
              {
                scaleFactor = self->_scaleFactor;
                objc_msgSend(a3, "scaleFactor");
                LOBYTE(v18) = scaleFactor == v26;
                return v18;
              }
LABEL_25:
              LOBYTE(v18) = 0;
            }
          }
        }
      }
    }
  }
  return v18;
}

- (unint64_t)hash
{
  return self->_settingsID ^ self->_captureType ^ self->_captureFlags;
}

- (BOOL)produceDeferredPhotoProxyImage
{
  return self->_deliverDeferredPhotoProxyImage;
}

- (void)disableAWBReflow
{
  NSArray *captureStreamSettings;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_captureFlags &= ~0x8000000000uLL;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(captureStreamSettings);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "disableAWBReflow");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)cannotProcessDeepFusionEnhancedResolution
{
  unint64_t captureFlags;
  NSArray *captureStreamSettings;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  captureFlags = self->_captureFlags;
  if ((captureFlags & 0x200000000) != 0)
  {
    self->_downgradedDeepFusionEnhancedResolutionCapture = 1;
    self->_captureFlags = captureFlags & 0xFFFFFFFDFFFFFFFFLL;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    captureStreamSettings = self->_captureStreamSettings;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(captureStreamSettings);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "cannotProcessDeepFusionEnhancedResolution");
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
}

- (void)cannotProcessDepthPhotos
{
  unint64_t captureFlags;
  id v4;

  captureFlags = self->_captureFlags;
  if ((captureFlags & 0x800) != 0)
  {
    self->_captureFlags = captureFlags & 0xFFFFFFFFFFFFF7FFLL;
    v4 = -[BWStillImageCaptureSettings captureStreamSettingsForPortType:](self, "captureStreamSettingsForPortType:", -[BWStillImageCaptureSettings masterPortType](self, "masterPortType"));
    objc_msgSend(v4, "cannotProcessDepthPhotos");

    self->_captureStreamSettings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
  }
}

- (NSArray)secondaryPortTypes
{
  id v3;
  NSArray *captureStreamSettings;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(captureStreamSettings);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v9, "portType"), "isEqualToString:", self->_masterPortType) & 1) == 0)
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "portType"));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (NSArray)portTypes
{
  id v3;
  NSArray *captureStreamSettings;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(captureStreamSettings);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "portType"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  unint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = objc_opt_class();
  v5 = BWPhotoEncoderStringFromEncodingScheme(self->_captureType);
  v6 = BWStillImageCaptureFrameFlagsToShortString(self->_captureFlags);
  v7 = BWStillImageCaptureFrameFlagsToShortString(self->_sceneFlags);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>: type:%@, capture flags: \"%@\", scene flags: \"%@\", deliverOriginalImage:%d deliverSushiRaw:%d deliverDeferredPhotoProxyImage:%d downgradedDeepFusionEnhancedResolutionCapture:%d _learnedNRStereoPhotoFrame:%@"), v4, self, v5, v6, v7, self->_deliverOriginalImage, self->_deliverSushiRaw, self->_deliverDeferredPhotoProxyImage, self->_downgradedDeepFusionEnhancedResolutionCapture, BWStillImageCaptureFrameFlagsToShortString(self->_learnedNRStereoPhotoFrameFlag));
  if (-[NSArray count](self->_captureStreamSettings, "count") <= 1)
    v8 = "";
  else
    v8 = " 0";
  objc_msgSend(v3, "appendFormat:", CFSTR(",\nstream%s still image options: \n\t%@"), v8, -[NSArray objectAtIndexedSubscript:](self->_captureStreamSettings, "objectAtIndexedSubscript:", 0));
  if (-[NSArray count](self->_captureStreamSettings, "count") >= 2)
  {
    v9 = 1;
    v10 = 1;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("\nstream %u still image options: \n\t%@"), v10, -[NSArray objectAtIndexedSubscript:](self->_captureStreamSettings, "objectAtIndexedSubscript:", v9));
      v9 = (v10 + 1);
      v10 = v9;
    }
    while (-[NSArray count](self->_captureStreamSettings, "count") > v9);
  }
  return v3;
}

- (int)bracketedCaptureSequenceNumberForOISLongExposure
{
  NSArray *captureStreamSettings;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = *MEMORY[0x1E0D07020];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(captureStreamSettings);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v8, "bracketSettings"), "bracketingMode") == 3)
        {
          v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "bracketSettings"), "oisBracketedCaptureParams"), "objectForKeyedSubscript:", v6);
          if (objc_msgSend(v9, "count"))
          {
            v10 = 0;
            while (objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "intValue") != 1)
            {
              if (objc_msgSend(v9, "count") <= (unint64_t)++v10)
                goto LABEL_11;
            }
            LODWORD(v3) = v10 + 1;
            return v3;
          }
        }
LABEL_11:
        ;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureStreamSettings, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      LODWORD(v3) = 0;
      if (v4)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)expectReferenceFrameBracketedCaptureSequenceNumber
{
  unsigned int v3;
  NSUInteger v4;
  _BOOL4 v5;

  v3 = self->_captureType & 0xFFFFFFFE;
  v4 = -[NSArray count](self->_captureStreamSettings, "count");
  v5 = (BYTE1(self->_captureFlags) >> 5) & 1;
  if (v4 > 1)
    LOBYTE(v5) = 1;
  return v3 == 4 && v5;
}

- (id)frameStatisticsByPortType
{
  return self->_frameStatisticsByPortType;
}

- (void)setStreamSelectorDebugInfo:(id)a3
{

  self->_streamSelectorDebugInfo = (NSDictionary *)a3;
}

- (id)streamSelectorDebugInfo
{
  return self->_streamSelectorDebugInfo;
}

- (void)setCmioCompressedFormat:(id)a3
{
  NSString *cmioCompressedFormat;

  cmioCompressedFormat = self->_cmioCompressedFormat;
  if (cmioCompressedFormat != a3)
  {

    self->_cmioCompressedFormat = (NSString *)a3;
  }
}

- (id)cmioCompressedFormat
{
  return self->_cmioCompressedFormat;
}

- (void)setCmioHighResolutionPhotoEnabled:(BOOL)a3
{
  self->_cmioHighResolutionPhotoEnabled = a3;
}

- (BOOL)cmioHighResolutionPhotoEnabled
{
  return self->_cmioHighResolutionPhotoEnabled;
}

- (void)setCmioFlashMode:(int)a3
{
  self->_cmioFlashMode = a3;
}

- (int)cmioFlashMode
{
  return self->_cmioFlashMode;
}

- (void)setCmioQualityPrioritization:(int)a3
{
  self->_cmioQualityPrioritization = a3;
}

- (int)cmioQualityPrioritization
{
  return self->_cmioQualityPrioritization;
}

- (void)setCmioMaxPhotoDimensions:(id)a3
{
  self->_cmioMaxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)cmioMaxPhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_cmioMaxPhotoDimensions;
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (unint64_t)sceneFlags
{
  return self->_sceneFlags;
}

- (void)setSceneFlags:(unint64_t)a3
{
  self->_sceneFlags = a3;
}

- (BOOL)deliverOriginalImage
{
  return self->_deliverOriginalImage;
}

- (BOOL)deliverSushiRaw
{
  return self->_deliverSushiRaw;
}

- (BOOL)deliverDeferredPhotoProxyImage
{
  return self->_deliverDeferredPhotoProxyImage;
}

- (void)setDeliverDeferredPhotoProxyImage:(BOOL)a3
{
  self->_deliverDeferredPhotoProxyImage = a3;
}

- (unint64_t)learnedNRStereoPhotoFrameFlag
{
  return self->_learnedNRStereoPhotoFrameFlag;
}

- (void)setLearnedNRStereoPhotoFrameFlag:(unint64_t)a3
{
  self->_learnedNRStereoPhotoFrameFlag = a3;
}

- (NSArray)captureStreamSettings
{
  return self->_captureStreamSettings;
}

- (int)timeMachineReferenceFrameBracketedCaptureSequenceNumber
{
  return self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber;
}

- (void)setTimeMachineReferenceFrameBracketedCaptureSequenceNumber:(int)a3
{
  self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimeMachinePTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[4].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[4].var3 + 4);
  return self;
}

- (void)setLastTimeMachinePTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_lastTimeMachinePTS.flags = a3->var3;
  *(_OWORD *)(&self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1) = v3;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)stillImageRequestTime
{
  return self->_stillImageRequestTime;
}

- (void)setStillImageRequestTime:(int64_t)a3
{
  self->_stillImageRequestTime = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (void)setProduceDeferredPhotoProxyImage:(BOOL)a3
{
  self->_produceDeferredPhotoProxyImage = a3;
}

@end
