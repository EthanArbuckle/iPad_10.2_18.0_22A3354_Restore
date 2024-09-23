@implementation BWStillImageCaptureStreamSettings

- (void)setSensorIDString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)sensorIDString
{
  return self->_sensorIDString;
}

- (NSString)portType
{
  return self->_portType;
}

- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 timeMachineFrameCount:(int)a6 bracketSettings:(id)a7 validBracketedCaptureSequenceNumbers:(id)a8
{
  BWStillImageCaptureStreamSettings *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BWStillImageCaptureStreamSettings;
  v14 = -[BWStillImageCaptureStreamSettings init](&v16, sel_init);
  if (v14)
  {
    v14->_portType = (NSString *)a3;
    v14->_captureType = a4;
    v14->_captureFlags = a5;
    v14->_timeMachineFrameCount = a6;
    v14->_bracketSettings = (BWBracketSettings *)a7;
    v14->_validBracketedCaptureSequenceNumbers = (NSArray *)a8;
    v14->_referenceFrameIndex = -1;
  }
  return v14;
}

- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 referenceFrameIndex:(int)a6 timeMachineBracketedCaptureParams:(id)a7 preBracketFrameCaptureParams:(id)a8 unifiedBracketedCaptureParams:(id)a9 frameInfos:(id)a10
{
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BWStillImageCaptureStreamSettings *v21;
  BWStillImageCaptureStreamSettings *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v13 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    LODWORD(v18) = 0;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(a7);
        v18 = -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v25 + 1) + 8 * i))+ v18;
      }
      v17 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }
  v21 = -[BWStillImageCaptureStreamSettings initWithPortType:captureType:captureFlags:timeMachineFrameCount:bracketSettings:validBracketedCaptureSequenceNumbers:](self, "initWithPortType:captureType:captureFlags:timeMachineFrameCount:bracketSettings:validBracketedCaptureSequenceNumbers:", a3, v13, a5, v18, 0, 0);
  v22 = v21;
  if (v21)
  {
    v21->_referenceFrameIndex = a6;
    v21->_timeMachineBracketedCaptureParams = (NSArray *)a7;
    v22->_preBracketFrameCaptureParams = (NSDictionary *)a8;
    v22->_unifiedBracketedCaptureParams = (NSArray *)a9;
    v22->_captureFrameInfos = (NSArray *)a10;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureStreamSettings;
  -[BWStillImageCaptureStreamSettings dealloc](&v3, sel_dealloc);
}

- (BWStillImageCaptureStreamSettings)initWithCoder:(id)a3
{
  BWStillImageCaptureStreamSettings *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CMTime v16;
  _QWORD v17[2];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v4 = -[BWStillImageCaptureStreamSettings init](self, "init");
  if (v4)
  {
    v4->_portType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portType"));
    v4->_sensorIDString = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sensorIDString"));
    v4->_captureType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("captureType"));
    v4->_captureFlags = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("captureFlags"));
    v4->_timeMachineFrameCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("timeMachineFrameCount"));
    v4->_bracketSettings = (BWBracketSettings *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bracketSettings"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_validBracketedCaptureSequenceNumbers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("validBracketedCaptureSequenceNumbers"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0), CFSTR("preferredTimeMachinePTS"));
    CMTimeMakeFromDictionary(&v16, v10);
    v4->_preferredTimeMachinePTS = ($95D729B680665BEAEFA1D6FCA8238556)v16;
    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v12 = objc_msgSend(v11, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4));
    v13 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v14 = objc_msgSend(v13, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2));
    v4->_referenceFrameIndex = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("referenceFrameIndex"));
    v4->_timeMachineBracketedCaptureParams = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("timeMachineBracketedCaptureParams"));
    v4->_preBracketFrameCaptureParams = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("preBracketFrameCaptureParams"));
    v4->_unifiedBracketedCaptureParams = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("unifiedBracketedCaptureParams"));
    v4->_captureFrameInfos = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v14, CFSTR("captureFrameInfos"));
    v4->_lensStabilizationEnabledForClientBracket = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("lensStabilizationEnabledForClientBracket"));
    v4->_adaptiveBracketingSphereOffsets = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("adaptiveBracketingSphereOffsets"));
    v4->_adaptivePreBracketFrameCaptureParams = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("adaptivePreBracketFrameCaptureParams"));
    v4->_adaptiveUnifiedBracketedCaptureParams = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("adaptiveUnifiedBracketedCaptureParams"));
    v4->_adaptiveCaptureFrameInfos = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v14, CFSTR("adaptiveCaptureFrameInfos"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  $95D729B680665BEAEFA1D6FCA8238556 preferredTimeMachinePTS;

  objc_msgSend(a3, "encodeObject:forKey:", self->_portType, CFSTR("portType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sensorIDString, CFSTR("sensorIDString"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_captureType, CFSTR("captureType"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_captureFlags, CFSTR("captureFlags"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_timeMachineFrameCount, CFSTR("timeMachineFrameCount"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bracketSettings, CFSTR("bracketSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_validBracketedCaptureSequenceNumbers, CFSTR("validBracketedCaptureSequenceNumbers"));
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  preferredTimeMachinePTS = self->_preferredTimeMachinePTS;
  v6 = CMTimeCopyAsDictionary((CMTime *)&preferredTimeMachinePTS, v5);
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("preferredTimeMachinePTS"));

  objc_msgSend(a3, "encodeInt32:forKey:", self->_referenceFrameIndex, CFSTR("referenceFrameIndex"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_timeMachineBracketedCaptureParams, CFSTR("timeMachineBracketedCaptureParams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_preBracketFrameCaptureParams, CFSTR("preBracketFrameCaptureParams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_unifiedBracketedCaptureParams, CFSTR("unifiedBracketedCaptureParams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureFrameInfos, CFSTR("captureFrameInfos"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_lensStabilizationEnabledForClientBracket, CFSTR("lensStabilizationEnabledForClientBracket"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_adaptiveBracketingSphereOffsets, CFSTR("adaptiveBracketingSphereOffsets"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_adaptivePreBracketFrameCaptureParams, CFSTR("adaptivePreBracketFrameCaptureParams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_adaptiveUnifiedBracketedCaptureParams, CFSTR("adaptiveUnifiedBracketedCaptureParams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_adaptiveCaptureFrameInfos, CFSTR("adaptiveCaptureFrameInfos"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *portType;
  int v8;
  NSString *sensorIDString;
  int captureType;
  unint64_t captureFlags;
  BWBracketSettings *bracketSettings;
  NSArray *validBracketedCaptureSequenceNumbers;
  int timeMachineFrameCount;
  int referenceFrameIndex;
  NSArray *timeMachineBracketedCaptureParams;
  NSDictionary *preBracketFrameCaptureParams;
  NSArray *unifiedBracketedCaptureParams;
  NSArray *captureFrameInfos;
  int lensStabilizationEnabledForClientBracket;
  $95D729B680665BEAEFA1D6FCA8238556 preferredTimeMachinePTS;
  CMTime time2;
  uint64_t v24;
  uint64_t v25;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  v24 = v3;
  v25 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  portType = self->_portType;
  if (portType != (NSString *)objc_msgSend(a3, "portType"))
  {
    v8 = -[NSString isEqualToString:](self->_portType, "isEqualToString:", objc_msgSend(a3, "portType"));
    if (!v8)
      return v8;
  }
  sensorIDString = self->_sensorIDString;
  if (sensorIDString != (NSString *)objc_msgSend(a3, "sensorIDString"))
  {
    v8 = -[NSString isEqualToString:](self->_sensorIDString, "isEqualToString:", objc_msgSend(a3, "sensorIDString"));
    if (!v8)
      return v8;
  }
  captureType = self->_captureType;
  if (captureType != objc_msgSend(a3, "captureType"))
    goto LABEL_29;
  captureFlags = self->_captureFlags;
  if (captureFlags != objc_msgSend(a3, "captureFlags"))
    goto LABEL_29;
  bracketSettings = self->_bracketSettings;
  if (bracketSettings != (BWBracketSettings *)objc_msgSend(a3, "bracketSettings"))
  {
    v8 = -[BWBracketSettings isEqual:](self->_bracketSettings, "isEqual:", objc_msgSend(a3, "bracketSettings"));
    if (!v8)
      return v8;
  }
  validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
  if (validBracketedCaptureSequenceNumbers != (NSArray *)objc_msgSend(a3, "validBracketedCaptureSequenceNumbers"))
  {
    v8 = -[NSArray isEqual:](self->_validBracketedCaptureSequenceNumbers, "isEqual:", objc_msgSend(a3, "validBracketedCaptureSequenceNumbers"));
    if (!v8)
      return v8;
  }
  if (a3)
    objc_msgSend(a3, "preferredTimeMachinePTS");
  else
    memset(&time2, 0, sizeof(time2));
  preferredTimeMachinePTS = self->_preferredTimeMachinePTS;
  if (CMTimeCompare((CMTime *)&preferredTimeMachinePTS, &time2)
    || (timeMachineFrameCount = self->_timeMachineFrameCount,
        timeMachineFrameCount != objc_msgSend(a3, "timeMachineFrameCount"))
    || (referenceFrameIndex = self->_referenceFrameIndex,
        referenceFrameIndex != objc_msgSend(a3, "referenceFrameIndex")))
  {
LABEL_29:
    LOBYTE(v8) = 0;
    return v8;
  }
  timeMachineBracketedCaptureParams = self->_timeMachineBracketedCaptureParams;
  if (timeMachineBracketedCaptureParams == (NSArray *)objc_msgSend(a3, "timeMachineBracketedCaptureParams")
    || (v8 = -[NSArray isEqual:](self->_timeMachineBracketedCaptureParams, "isEqual:", objc_msgSend(a3, "timeMachineBracketedCaptureParams"))) != 0)
  {
    preBracketFrameCaptureParams = self->_preBracketFrameCaptureParams;
    if (preBracketFrameCaptureParams == (NSDictionary *)objc_msgSend(a3, "preBracketFrameCaptureParams")
      || (v8 = -[NSDictionary isEqual:](self->_preBracketFrameCaptureParams, "isEqual:", objc_msgSend(a3, "preBracketFrameCaptureParams"))) != 0)
    {
      unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
      if (unifiedBracketedCaptureParams == (NSArray *)objc_msgSend(a3, "unifiedBracketedCaptureParams")
        || (v8 = -[NSArray isEqual:](self->_unifiedBracketedCaptureParams, "isEqual:", objc_msgSend(a3, "unifiedBracketedCaptureParams"))) != 0)
      {
        captureFrameInfos = self->_captureFrameInfos;
        if (captureFrameInfos == *((NSArray **)a3 + 14)
          || (v8 = -[NSArray isEqual:](captureFrameInfos, "isEqual:")) != 0)
        {
          lensStabilizationEnabledForClientBracket = self->_lensStabilizationEnabledForClientBracket;
          LOBYTE(v8) = lensStabilizationEnabledForClientBracket == objc_msgSend(a3, "lensStabilizationEnabledForClientBracket");
        }
      }
    }
  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_portType, "hash") ^ self->_captureType ^ self->_captureFlags;
}

- (BOOL)hasValidFrames
{
  NSArray *validBracketedCaptureSequenceNumbers;

  if (self->_captureFrameInfos)
    return -[BWStillImageCaptureStreamSettings expectedFrameCount](self, "expectedFrameCount") > 0;
  validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
  return !validBracketedCaptureSequenceNumbers || -[NSArray count](validBracketedCaptureSequenceNumbers, "count") != 0;
}

- (int)expectedFrameCount
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  int timeMachineFrameCount;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint8x8_t v10;
  __int32 v11;
  uint8x8_t v12;
  BWBracketSettings *bracketSettings;
  _BOOL4 v14;
  NSArray *unifiedBracketedCaptureParams;
  int v17;
  NSArray *validBracketedCaptureSequenceNumbers;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_captureFrameInfos, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v4)
      return 0;
    v5 = v4;
    timeMachineFrameCount = 0;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(captureFrameInfos);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v9, "mainFlags") & 0x5000000000000000));
        v10.i16[0] = vaddlv_u8(v10);
        v11 = v10.i32[0];
        v12 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v9, "sifrFlags") & 0x5000000000000000));
        v12.i16[0] = vaddlv_u8(v12);
        timeMachineFrameCount += v11 + v12.i32[0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          timeMachineFrameCount += objc_msgSend(v9, "isNoLongErrorRecoveryFrame");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
    return timeMachineFrameCount;
  }
  timeMachineFrameCount = self->_timeMachineFrameCount;
  bracketSettings = self->_bracketSettings;
  if (bracketSettings)
  {
    v14 = -[BWBracketSettings providePreBracketedEV0](bracketSettings, "providePreBracketedEV0");
    timeMachineFrameCount += v14 + -[BWBracketSettings bracketFrameCount](self->_bracketSettings, "bracketFrameCount");
    return timeMachineFrameCount;
  }
  unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
  if (unifiedBracketedCaptureParams)
  {
    if (self->_preBracketFrameCaptureParams)
    {
      v17 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_preBracketFrameCaptureParams, "objectForKeyedSubscript:", *MEMORY[0x1E0D07B88]), "BOOLValue");
      validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
      if (validBracketedCaptureSequenceNumbers)
      {
        if ((v17 & 1) == 0)
        {
          v19 = -[NSArray containsObject:](validBracketedCaptureSequenceNumbers, "containsObject:", &unk_1E49F8118);
          goto LABEL_28;
        }
LABEL_27:
        v19 = 0;
LABEL_28:
        timeMachineFrameCount += v19;
        if (-[NSArray count](self->_unifiedBracketedCaptureParams, "count"))
        {
          v20 = 0;
          LODWORD(v21) = 0;
          v22 = *MEMORY[0x1E0D07C20];
          do
          {
            if (objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_unifiedBracketedCaptureParams, "objectAtIndexedSubscript:", v20), "objectForKeyedSubscript:", v22), "intValue") == 1)v21 = v21;
            else
              v21 = (v21 + 1);
            timeMachineFrameCount += -[NSArray containsObject:](self->_validBracketedCaptureSequenceNumbers, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21));
            ++v20;
          }
          while (-[NSArray count](self->_unifiedBracketedCaptureParams, "count") > v20);
        }
        return timeMachineFrameCount;
      }
      v23 = v17 ^ 1;
      unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
    }
    else
    {
      if (self->_validBracketedCaptureSequenceNumbers)
        goto LABEL_27;
      v23 = 0;
    }
    timeMachineFrameCount += v23 + -[NSArray count](unifiedBracketedCaptureParams, "count");
    return timeMachineFrameCount;
  }
  if (!timeMachineFrameCount)
  {
    timeMachineFrameCount = 1;
    if ((self->_captureFlags & 0x10000) != 0)
    {
      if (self->_captureType == 2)
        return 2;
      else
        return 1;
    }
  }
  return timeMachineFrameCount;
}

- (uint64_t)_expectedFrameCaptureCountForFrameParams:(uint64_t)a1
{
  uint64_t result;
  uint64_t v5;
  int8x8_t v6;
  uint8x8_t v7;

  result = 0;
  if (a1 && a2)
  {
    if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BWAdaptiveBracketingNoPreBracketFrameParams")))
    {
      return 0;
    }
    else
    {
      v5 = *MEMORY[0x1E0D063C8];
      if (objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D063C8]))
      {
        v6.i32[0] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v5), "intValue");
        v7 = (uint8x8_t)vcnt_s8(v6);
        v7.i16[0] = vaddlv_u8(v7);
        return v7.u32[0];
      }
      else
      {
        return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07B88]), "BOOLValue") ^ 1;
      }
    }
  }
  return result;
}

- (int)expectedFrameCaptureCount
{
  unsigned int v3;
  BWBracketSettings *bracketSettings;
  _BOOL4 v5;
  int v6;
  unint64_t captureFlags;
  BOOL v8;
  uint64_t v9;
  NSArray *unifiedBracketedCaptureParams;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[BWStillImageCaptureStreamSettings expectedTimeMachineFrameCaptureCount](self, "expectedTimeMachineFrameCaptureCount");
  bracketSettings = self->_bracketSettings;
  if (bracketSettings)
  {
    v5 = -[BWBracketSettings providePreBracketedEV0](bracketSettings, "providePreBracketedEV0");
    v6 = v3 + v5 + -[BWBracketSettings bracketFrameCount](self->_bracketSettings, "bracketFrameCount");
  }
  else if (self->_unifiedBracketedCaptureParams)
  {
    v6 = -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, self->_preBracketFrameCaptureParams)+ v3;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](unifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(unifiedBracketedCaptureParams);
          v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](unifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }
  }
  else if (v3 <= 1)
  {
    v6 = 1;
  }
  else
  {
    v6 = v3;
  }
  captureFlags = self->_captureFlags;
  v8 = (captureFlags & 4) == 0 && self->_captureType == 2;
  v9 = (captureFlags >> 16) & 1;
  if (!v8)
    LODWORD(v9) = 0;
  return v6 + v9;
}

- (int)expectedUltraHighResFrameCaptureCount
{
  NSArray *unifiedBracketedCaptureParams;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](unifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    v8 = *MEMORY[0x1E0D07BE8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(unifiedBracketedCaptureParams);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "objectForKeyedSubscript:", v8))
          ++v6;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](unifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if ((self->_captureFlags & 0x100000000) != 0)
    v6 += -[NSArray count](self->_timeMachineBracketedCaptureParams, "count");
  return v6;
}

- ($08FEEAFA44411076A5953C2803702ABC)expectedFrameCaptureCounts
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t i;
  void *v8;
  uint8x8_t v9;
  __int32 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8x8_t v14;
  __int32 v15;
  uint8x8_t v16;
  uint8x8_t v17;
  int v18;
  unint64_t v19;
  NSArray *obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  $08FEEAFA44411076A5953C2803702ABC result;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_captureFrameInfos, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = self->_captureFrameInfos;
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      v21 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v23 != v21)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v9 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v8, "mainFlags") & 0x3000000000000000));
          v9.i16[0] = vaddlv_u8(v9);
          v10 = v9.i32[0];
          v11 = objc_msgSend(v8, "sifrFlags");
          v12 = objc_msgSend(v8, "mainFlags");
          v13 = objc_msgSend(v8, "sifrFlags");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 += objc_msgSend(v8, "isNoLongErrorRecoveryFrame");
          v14 = (uint8x8_t)vcnt_s8((int8x8_t)(v12 & 0xC000000000000000));
          v14.i16[0] = vaddlv_u8(v14);
          v15 = v14.i32[0];
          v16 = (uint8x8_t)vcnt_s8((int8x8_t)(v13 & 0xC000000000000000));
          v16.i16[0] = vaddlv_u8(v16);
          v5 += v15 + v16.i32[0];
          if (self->_captureType == 1)
            v5 += (LODWORD(self->_captureFlags) >> 11) & 1;
          v17 = (uint8x8_t)vcnt_s8((int8x8_t)(v11 & 0x3000000000000000));
          v17.i16[0] = vaddlv_u8(v17);
          v6 += v17.i32[0] + v10;
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
  }
  else
  {
    v6 = -[BWStillImageCaptureStreamSettings expectedFrameCaptureCount](self, "expectedFrameCaptureCount");
    v5 = 0;
  }
  v18 = -[BWStillImageCaptureStreamSettings expectedUltraHighResFrameCaptureCount](self, "expectedUltraHighResFrameCaptureCount");
  v19 = v6 | ((unint64_t)(v5 - v18) << 32);
  result.var0 = v19;
  result.var1 = HIDWORD(v19);
  result.var2 = v18;
  return result;
}

- (BOOL)expectPreBracketFrame
{
  return -[BWBracketSettings providePreBracketedEV0](self->_bracketSettings, "providePreBracketedEV0")
      || (int)-[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, self->_preBracketFrameCaptureParams) > 0;
}

- (int)expectedTimeMachineFrameCaptureCount
{
  NSArray *timeMachineBracketedCaptureParams;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  timeMachineBracketedCaptureParams = self->_timeMachineBracketedCaptureParams;
  if (!timeMachineBracketedCaptureParams)
    return self->_timeMachineFrameCount;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](timeMachineBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(timeMachineBracketedCaptureParams);
      v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v10 + 1) + 8 * i));
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](timeMachineBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
}

- (id)captureFrameInfos
{
  return self->_captureFrameInfos;
}

- (int)referenceFrameIndex
{
  return self->_referenceFrameIndex;
}

- (int)timeMachineReferenceFrameIndex
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_timeMachineBracketedCaptureParams, "count"))
  {
    if (-[NSArray count](self->_captureFrameInfos, "count"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      captureFrameInfos = self->_captureFrameInfos;
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v11;
        while (2)
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v11 != v6)
              objc_enumerationMutation(captureFrameInfos);
            v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "mainFlags") & 0x10) != 0)
              return objc_msgSend(v8, "timeMachineIndex");
            ++v7;
          }
          while (v5 != v7);
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v5)
            continue;
          break;
        }
      }
    }
  }
  return -1;
}

- (id)captureFrameInfoForFrame:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  NSArray *captureFrameInfos;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v5 = *MEMORY[0x1E0D06F00];
  if (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F00]))
  {
    v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v5), "intValue");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(captureFrameInfos);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v6 == objc_msgSend(v12, "timeMachineIndex"))
          return v12;
        if (v9 == ++v11)
        {
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v9)
            goto LABEL_4;
          return 0;
        }
      }
    }
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue") & 1) != 0)
    v13 = 0;
  else
    v13 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_captureFrameInfos;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v15)
    return 0;
  v16 = v15;
  v17 = *(_QWORD *)v21;
LABEL_17:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v17)
      objc_enumerationMutation(v14);
    v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v13 == objc_msgSend(v12, "bracketedCaptureSequenceNumber"))
      return v12;
    if (v16 == ++v18)
    {
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v12 = 0;
      if (v16)
        goto LABEL_17;
      return v12;
    }
  }
}

- (BOOL)isFrameCapturedForProcessing:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  __CVBuffer *ImageBuffer;
  OSType PixelFormatType;
  void *v12;
  int v13;
  int IsVersatileRaw;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v5 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D80]), "BOOLValue");
  v7 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F00]);
  v8 = -[BWStillImageCaptureStreamSettings captureFrameInfoForFrame:](self, "captureFrameInfoForFrame:", a3);
  if (v8)
  {
    v9 = v8;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
    v12 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D05A40]);
    IsVersatileRaw = FigCapturePixelFormatIsVersatileRaw(PixelFormatType);
    if (IsVersatileRaw)
      v15 = 0x8000000000000000;
    else
      v15 = 0x2000000000000000;
    if ((IsVersatileRaw & 1) == 0 && v13)
    {
      if (BWPixelFormatIsFixedPoint(PixelFormatType))
        v15 = 0x8000000000000000;
      else
        v15 = 0x2000000000000000;
    }
    if (v6)
      v16 = objc_msgSend(v9, "sifrFlags");
    else
      v16 = objc_msgSend(v9, "mainFlags");
    return (v16 & v15) == 0;
  }
  else if (v7 || !self->_validBracketedCaptureSequenceNumbers)
  {
    return 1;
  }
  else
  {
    if ((objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue") & 1) != 0)
      v18 = 0;
    else
      v18 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
    return -[NSArray containsObject:](self->_validBracketedCaptureSequenceNumbers, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18));
  }
}

- (BOOL)sensorRawCapturedForFinalImageProcessing
{
  unint64_t captureFlags;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _BOOL4 v9;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  captureFlags = self->_captureFlags;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[BWStillImageCaptureStreamSettings captureFrameInfos](self, "captureFrameInfos", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "mainFlags") & 0x8000000000000000) == 0
          || (objc_msgSend(v8, "mainFlags") & 0x2000000000000000) == 0)
        {
          v9 = (objc_msgSend(v8, "mainFlags") & 0x1000000000000000) == 0;
          return v9 & (captureFlags >> 2);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
  return v9 & (captureFlags >> 2);
}

- (int)expectedEVZeroFrameCount
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint8x8_t v10;
  NSArray *timeMachineBracketedCaptureParams;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  int v26;
  int v27;
  float v28;
  NSArray *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_captureFrameInfos, "count"))
  {
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    captureFrameInfos = self->_captureFrameInfos;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v41 != v7)
            objc_enumerationMutation(captureFrameInfos);
          v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((objc_msgSend(v9, "mainFlags") & 2) != 0)
          {
            v10 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v9, "mainFlags") & 0x5000000000000000));
            v10.i16[0] = vaddlv_u8(v10);
            v6 += v10.i32[0];
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v5);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v38 = 0uLL;
    v39 = 0uLL;
    v36 = 0uLL;
    v37 = 0uLL;
    timeMachineBracketedCaptureParams = self->_timeMachineBracketedCaptureParams;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](timeMachineBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    v13 = (uint64_t *)MEMORY[0x1E0D07C20];
    if (v12)
    {
      v14 = v12;
      v6 = 0;
      v15 = *(_QWORD *)v37;
      v16 = *MEMORY[0x1E0D07C20];
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(timeMachineBracketedCaptureParams);
          if (!objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "objectForKeyedSubscript:", v16), "intValue"))++v6;
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](timeMachineBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v14);
    }
    else
    {
      v6 = 0;
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = self->_unifiedBracketedCaptureParams;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      v21 = *v13;
      v22 = *MEMORY[0x1E0D07E60];
      v23 = *MEMORY[0x1E0D07BD0];
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
          v26 = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", v21), "intValue");
          v27 = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", v22), "intValue");
          objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", v23), "floatValue");
          if (v28 == 0.0 && (v26 | v27) == 0)
            ++v6;
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v19);
    }
  }
  return v6;
}

- (int)expectedLongFrameCount
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint8x8_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_captureFrameInfos, "count"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  captureFrameInfos = self->_captureFrameInfos;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(captureFrameInfos);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      if ((objc_msgSend(v9, "mainFlags") & 8) != 0)
      {
        v10 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v9, "mainFlags") & 0x5000000000000000));
        v10.i16[0] = vaddlv_u8(v10);
        v6 += v10.i32[0];
      }
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
  return v6;
}

- (int)expectedReferenceFrameCandidateCount
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint8x8_t v10;
  uint8x8_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_captureFrameInfos, "count"))
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  captureFrameInfos = self->_captureFrameInfos;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(captureFrameInfos);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if ((objc_msgSend(v9, "mainFlags") & 0x100) != 0)
      {
        v10 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v9, "mainFlags") & 0x5000000000000000));
        v10.i16[0] = vaddlv_u8(v10);
        v6 += v10.i32[0];
      }
      if ((objc_msgSend(v9, "sifrFlags") & 0x100) != 0)
      {
        v11 = (uint8x8_t)vcnt_s8((int8x8_t)(objc_msgSend(v9, "sifrFlags") & 0x5000000000000000));
        v11.i16[0] = vaddlv_u8(v11);
        v6 += v11.i32[0];
      }
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v5);
  return v6;
}

- (BOOL)isYUVCapture
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_captureFrameInfos, "count"))
  {
LABEL_12:
    LOBYTE(v4) = 1;
    return v4;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  captureFrameInfos = self->_captureFrameInfos;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(captureFrameInfos);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "mainFlags") & 0x3000000000000000) != 0
        || (objc_msgSend(v8, "sifrFlags") & 0x3000000000000000) != 0)
      {
        goto LABEL_12;
      }
      if (v5 == ++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v4) = 0;
        if (v5)
          goto LABEL_4;
        return v4;
      }
    }
  }
  return v4;
}

- (BOOL)isSensorRawCapture
{
  NSArray *captureFrameInfos;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_captureFrameInfos, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(captureFrameInfos);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v8, "mainFlags") >> 62
            || (unint64_t)objc_msgSend(v8, "sifrFlags") >> 62)
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v4) = 0;
        if (v5)
          continue;
        break;
      }
    }
  }
  else
  {
    LODWORD(v4) = (LOBYTE(self->_captureFlags) >> 2) & 1;
  }
  return v4;
}

- (int)qsubResolutionFlavor
{
  unint64_t captureFlags;
  int v3;

  captureFlags = self->_captureFlags;
  if ((captureFlags & 0x100000000) != 0)
    v3 = 2;
  else
    v3 = 1;
  if ((captureFlags & 0x10) != 0)
    return v3;
  else
    return 0;
}

- (id)timeMachineBracketedCaptureParams
{
  return self->_timeMachineBracketedCaptureParams;
}

- (id)preBracketFrameCaptureParams
{
  return self->_preBracketFrameCaptureParams;
}

- (id)unifiedBracketedCaptureParams
{
  return self->_unifiedBracketedCaptureParams;
}

- (void)setLensStabilizationEnabledForClientBracket:(BOOL)a3
{
  self->_lensStabilizationEnabledForClientBracket = a3;
}

- (BOOL)lensStabilizationEnabledForClientBracket
{
  return self->_lensStabilizationEnabledForClientBracket;
}

- (void)disableAWBReflow
{
  self->_captureFlags &= ~0x8000000000uLL;
}

- (void)cannotProcessDeepFusionEnhancedResolution
{
  unint64_t captureFlags;
  NSArray *unifiedBracketedCaptureParams;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *captureFrameInfos;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  captureFlags = self->_captureFlags;
  if ((captureFlags & 0x200000000) != 0)
  {
    self->_captureFlags = captureFlags & 0xFFFFFFFDFFFFFFFFLL;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](unifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v25;
      v9 = *MEMORY[0x1E0D07C20];
      v10 = *MEMORY[0x1E0D07BE8];
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(unifiedBracketedCaptureParams);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v9), "intValue") != 1)
          ++v7;
        if (objc_msgSend(v12, "objectForKeyedSubscript:", v10))
          break;
        if (v6 == ++v11)
        {
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](unifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v7 = 0;
    }
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(captureFrameInfos);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || v7 != objc_msgSend(v19, "bracketedCaptureSequenceNumber"))
          {
            objc_msgSend(v13, "addObject:", v19);
          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](captureFrameInfos, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

    self->_captureFrameInfos = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v13);
  }
}

- (void)cannotProcessDepthPhotos
{
  self->_captureFlags &= ~0x800uLL;
}

- (BOOL)isUnifiedBracketingErrorRecoveryFrame:(opaqueCMSampleBuffer *)a3 isReferenceFrame:(BOOL)a4
{
  void *v6;
  NSUInteger v7;
  BWAdaptiveBracketingParameters **p_adaptiveBracketingParameters;
  void *v9;
  char v10;
  unint64_t captureFlags;

  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if ((self->_captureFlags & 4) != 0)
  {
    p_adaptiveBracketingParameters = &self->_adaptiveBracketingParameters;
    if (!self->_adaptiveBracketingParameters)
      goto LABEL_8;
  }
  else
  {
    v7 = -[NSDictionary count](self->_preBracketFrameCaptureParams, "count");
    p_adaptiveBracketingParameters = &self->_adaptiveBracketingParameters;
    if (!self->_adaptiveBracketingParameters)
    {
      if (!v7)
        goto LABEL_8;
      return objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
    }
  }
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  v9 = (void *)-[NSMutableArray firstObject](self->_adaptivePreBracketFrameCaptureParams, "firstObject");
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07B88]), "BOOLValue");
  os_unfair_lock_unlock(&self->_adaptiveBracketingLock);
  if ((v10 & 1) != 0)
  {
    if (*p_adaptiveBracketingParameters)
      return a4;
LABEL_8:
    captureFlags = self->_captureFlags;
    if ((captureFlags & 0x100) == 0 && (captureFlags & 0x2800000) != 0)
      return objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F28]), "intValue") == 0;
    return a4;
  }
  return objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
}

- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 adaptiveBracketingParameters:(id)a6 sphereOffsets:(id)a7
{
  BWStillImageCaptureStreamSettings *v9;
  BWStillImageCaptureStreamSettings *v10;

  v9 = -[BWStillImageCaptureStreamSettings initWithPortType:captureType:captureFlags:referenceFrameIndex:timeMachineBracketedCaptureParams:preBracketFrameCaptureParams:unifiedBracketedCaptureParams:frameInfos:](self, "initWithPortType:captureType:captureFlags:referenceFrameIndex:timeMachineBracketedCaptureParams:preBracketFrameCaptureParams:unifiedBracketedCaptureParams:frameInfos:", a3, *(_QWORD *)&a4, a5, 0xFFFFFFFFLL, 0, 0, 0, 0);
  v10 = v9;
  if (v9)
  {
    v9->_adaptiveBracketingLock._os_unfair_lock_opaque = 0;
    v9->_adaptiveBracketingParameters = (BWAdaptiveBracketingParameters *)a6;
    v10->_adaptiveBracketingSphereOffsets = (NSArray *)a7;
  }
  return v10;
}

- (id)adaptiveBracketingParameters
{
  return self->_adaptiveBracketingParameters;
}

- (id)adaptivePreBracketFrameCaptureParams
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  void *v4;

  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  v4 = (void *)-[NSMutableArray copy](self->_adaptivePreBracketFrameCaptureParams, "copy");
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v4;
}

- (id)adaptiveUnifiedBracketedCaptureParams
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  void *v4;

  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  v4 = (void *)-[NSMutableArray copy](self->_adaptiveUnifiedBracketedCaptureParams, "copy");
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v4;
}

- (int)adaptiveBracketingGroupCaptureCount
{
  BWStillImageCaptureStreamSettings *v2;
  os_unfair_lock_s *p_adaptiveBracketingLock;

  v2 = self;
  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  LODWORD(v2) = -[NSMutableArray count](v2->_adaptiveUnifiedBracketedCaptureParams, "count");
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return (int)v2;
}

- (int)currentExpectedAdaptiveBracketedFrameCaptureCount
{
  NSMutableArray *adaptivePreBracketFrameCaptureParams;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *adaptiveUnifiedBracketedCaptureParams;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  os_unfair_lock_t lock;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  lock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  adaptivePreBracketFrameCaptureParams = self->_adaptivePreBracketFrameCaptureParams;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adaptivePreBracketFrameCaptureParams, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(adaptivePreBracketFrameCaptureParams);
        v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adaptivePreBracketFrameCaptureParams, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  adaptiveUnifiedBracketedCaptureParams = self->_adaptiveUnifiedBracketedCaptureParams;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adaptiveUnifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(adaptiveUnifiedBracketedCaptureParams);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v21 + 1) + 8 * k));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
          }
          while (v16);
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adaptiveUnifiedBracketedCaptureParams, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v11);
  }
  os_unfair_lock_unlock(lock);
  return v6;
}

- (int)expectedAdaptiveBracketedFrameCaptureCountUsingGroup:(int)a3
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 < 1)
    return 0;
  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  v6 = 0;
  v7 = 0;
  v8 = a3;
  do
  {
    v7 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_adaptivePreBracketFrameCaptureParams, "objectAtIndexedSubscript:", v6));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_adaptiveUnifiedBracketedCaptureParams, "objectAtIndexedSubscript:", v6, 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v7 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    ++v6;
  }
  while (v6 != v8);
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v7;
}

- (id)adaptiveBracketingSphereOffsetsForNextGroupWithFrameCount:(int)a3
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  unint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  if (-[NSMutableArray count](self->_adaptiveUnifiedBracketedCaptureParams, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_adaptiveUnifiedBracketedCaptureParams, "objectAtIndexedSubscript:", v6, 0);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v7 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
      ++v6;
    }
    while (-[NSMutableArray count](self->_adaptiveUnifiedBracketedCaptureParams, "count") > v6);
  }
  else
  {
    v7 = 0;
  }
  v13 = -[NSArray subarrayWithRange:](self->_adaptiveBracketingSphereOffsets, "subarrayWithRange:", v7, a3);
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v13;
}

- (BOOL)reachedEndOfAdaptiveBracketing
{
  BWStillImageCaptureStreamSettings *v2;
  os_unfair_lock_s *p_adaptiveBracketingLock;

  v2 = self;
  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  LOBYTE(v2) = v2->_reachedEndOfAdaptiveBracketing;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return (char)v2;
}

- (void)setReachedEndOfAdaptiveBracketing:(BOOL)a3
{
  os_unfair_lock_s *p_adaptiveBracketingLock;

  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  self->_reachedEndOfAdaptiveBracketing = a3;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adaptiveBracketingLastFramePTS
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(&self->_reachedEndOfAdaptiveBracketing + 4);
  retstr->var3 = *(_QWORD *)&self->_adaptiveBracketingLastFramePTS.flags;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return result;
}

- (void)setAdaptiveBracketingLastFramePTS:(id *)a3
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  __int128 v6;

  p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  v6 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_adaptiveBracketingLastFramePTS.flags = a3->var3;
  *(_OWORD *)(&self->_reachedEndOfAdaptiveBracketing + 4) = v6;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
}

- (void)addAdaptiveUnifiedBracketedCaptureParams:(id)a3 preBracketFrameCaptureParams:(id)a4 bracketedCaptureFrameInfos:(id)a5
{
  os_unfair_lock_s *p_adaptiveBracketingLock;
  NSMutableArray *adaptiveUnifiedBracketedCaptureParams;
  NSMutableArray *adaptivePreBracketFrameCaptureParams;
  id v12;
  NSMutableArray *adaptiveCaptureFrameInfos;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_adaptiveBracketingLock = &self->_adaptiveBracketingLock;
    os_unfair_lock_lock(&self->_adaptiveBracketingLock);
    adaptiveUnifiedBracketedCaptureParams = self->_adaptiveUnifiedBracketedCaptureParams;
    if (!adaptiveUnifiedBracketedCaptureParams)
    {
      adaptiveUnifiedBracketedCaptureParams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_adaptiveUnifiedBracketedCaptureParams = adaptiveUnifiedBracketedCaptureParams;
    }
    -[NSMutableArray addObject:](adaptiveUnifiedBracketedCaptureParams, "addObject:", a3);

    self->_unifiedBracketedCaptureParams = (NSArray *)a3;
    adaptivePreBracketFrameCaptureParams = self->_adaptivePreBracketFrameCaptureParams;
    if (!adaptivePreBracketFrameCaptureParams)
    {
      adaptivePreBracketFrameCaptureParams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_adaptivePreBracketFrameCaptureParams = adaptivePreBracketFrameCaptureParams;
    }
    v12 = a4;
    if (!a4)
    {
      v14 = CFSTR("BWAdaptiveBracketingNoPreBracketFrameParams");
      v15[0] = &stru_1E4928818;
      v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    }
    -[NSMutableArray addObject:](adaptivePreBracketFrameCaptureParams, "addObject:", v12);

    self->_preBracketFrameCaptureParams = (NSDictionary *)a4;
    if (a5)
    {
      adaptiveCaptureFrameInfos = self->_adaptiveCaptureFrameInfos;
      if (!adaptiveCaptureFrameInfos)
      {
        adaptiveCaptureFrameInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        self->_adaptiveCaptureFrameInfos = adaptiveCaptureFrameInfos;
      }
      -[NSMutableArray addObject:](adaptiveCaptureFrameInfos, "addObject:", a5);

      self->_captureFrameInfos = (NSArray *)a5;
    }
    os_unfair_lock_unlock(p_adaptiveBracketingLock);
  }
}

- (int)captureType
{
  return self->_captureType;
}

- (unint64_t)captureFlags
{
  return self->_captureFlags;
}

- (int)timeMachineFrameCount
{
  return self->_timeMachineFrameCount;
}

- (BWBracketSettings)bracketSettings
{
  return self->_bracketSettings;
}

- (NSArray)validBracketedCaptureSequenceNumbers
{
  return self->_validBracketedCaptureSequenceNumbers;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredTimeMachinePTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setPreferredTimeMachinePTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_preferredTimeMachinePTS.epoch = a3->var3;
  *(_OWORD *)&self->_preferredTimeMachinePTS.value = v3;
}

@end
