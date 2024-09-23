@implementation AVMomentCaptureMovieRecordingSettings

+ (id)movieRecordingSettingsFromMomentCaptureSettings:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initFromMomentCaptureSettings:", a3);
}

+ (id)movieRecordingSettings
{
  return (id)objc_msgSend(a1, "movieRecordingSettingsFromMomentCaptureSettings:", +[AVMomentCaptureSettings settingsWithUserInitiatedCaptureTime:uniqueID:](AVMomentCaptureSettings, "settingsWithUserInitiatedCaptureTime:uniqueID:", mach_absolute_time(), +[AVCaptureMovieFileOutput uniqueID](AVCaptureMovieFileOutput, "uniqueID")));
}

- (id)_initFromMomentCaptureSettings:(id)a3
{
  AVMomentCaptureMovieRecordingSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMomentCaptureMovieRecordingSettings;
  v4 = -[AVMomentCaptureMovieRecordingSettings init](&v6, sel_init);
  if (v4)
  {
    v4->_uniqueID = objc_msgSend(a3, "uniqueID");
    v4->_userInitiatedCaptureTime = objc_msgSend(a3, "userInitiatedCaptureTime");
    v4->_videoCodecType = (NSString *)(id)*MEMORY[0x1E0CF2C88];
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieRecordingSettings;
  -[AVMomentCaptureMovieRecordingSettings dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = -[AVMomentCaptureMovieRecordingSettings _initFromMomentCaptureSettings:]([AVMomentCaptureMovieRecordingSettings alloc], "_initFromMomentCaptureSettings:", +[AVMomentCaptureSettings settingsWithUserInitiatedCaptureTime:](AVMomentCaptureSettings, "settingsWithUserInitiatedCaptureTime:", self->_userInitiatedCaptureTime));
  v4[1] = self->_uniqueID;
  objc_msgSend(v4, "setVideoCodecType:", self->_videoCodecType);
  objc_msgSend(v4, "setMovieFileURL:", self->_movieFileURL);
  objc_msgSend(v4, "setMovieMetadata:", self->_movieMetadata);
  objc_msgSend(v4, "setAutoSpatialOverCaptureEnabled:", self->_autoSpatialOverCaptureEnabled);
  v4[7] = self->_spatialOverCaptureGroupIdentifier;
  objc_msgSend(v4, "setSpatialOverCaptureMovieFileURL:", self->_spatialOverCaptureMovieFileURL);
  objc_msgSend(v4, "setSpatialOverCaptureMovieMetadata:", self->_spatialOverCaptureMovieMetadata);
  return v4;
}

- (id)debugDescription
{
  const __CFString *v3;

  if (self->_autoSpatialOverCaptureEnabled)
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" soc:%@ %@"), -[NSURL lastPathComponent](self->_spatialOverCaptureMovieFileURL, "lastPathComponent"), self->_spatialOverCaptureGroupIdentifier);
  else
    v3 = &stru_1E421DB28;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uid:%lld %@ url:%@%@"), self->_uniqueID, self->_videoCodecType, -[NSURL lastPathComponent](self->_movieFileURL, "lastPathComponent"), v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVMomentCaptureMovieRecordingSettings debugDescription](self, "debugDescription"));
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
  void *v5;

  if (a3)
  {

    self->_videoCodecType = (NSString *)objc_msgSend(a3, "copy");
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (id)spatialOverCaptureGroupIdentifier
{
  id result;

  result = self->_spatialOverCaptureGroupIdentifier;
  if (!result)
  {
    result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    self->_spatialOverCaptureGroupIdentifier = (NSString *)result;
  }
  return result;
}

- (NSArray)movieMetadata
{
  NSArray *v3;
  NSArray *v4;
  id v5;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_movieMetadata, "count") + 1);
  v4 = v3;
  if (self->_movieMetadata)
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  if (self->_autoSpatialOverCaptureEnabled)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
    objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0CF2BE0]);
    objc_msgSend(v5, "setKey:", *MEMORY[0x1E0CF2BF8]);
    objc_msgSend(v5, "setValue:", -[AVMomentCaptureMovieRecordingSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
    -[NSArray addObject:](v4, "addObject:", v5);

  }
  return v4;
}

- (void)setMovieMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = 0;
  v4 = -[AVMomentCaptureMovieRecordingSettings _sanitizedMovieMetadataArrayForMovieMetadataArray:exceptionReason:](self, "_sanitizedMovieMetadataArrayForMovieMetadataArray:exceptionReason:", a3, &v7);
  if (v7)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else
  {
    v6 = v4;

    self->_movieMetadata = (NSArray *)v6;
  }
}

- (NSArray)spatialOverCaptureMovieMetadata
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_spatialOverCaptureMovieMetadata, "count") + 2);
  v4 = v3;
  if (self->_spatialOverCaptureMovieMetadata)
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  v5 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  v6 = *MEMORY[0x1E0CF2BE0];
  objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0CF2BE0]);
  objc_msgSend(v5, "setKey:", *MEMORY[0x1E0CF2BF8]);
  objc_msgSend(v5, "setValue:", -[AVMomentCaptureMovieRecordingSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
  -[NSArray addObject:](v4, "addObject:", v5);

  v7 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  objc_msgSend(v7, "setKeySpace:", v6);
  objc_msgSend(v7, "setKey:", *MEMORY[0x1E0CF2BE8]);
  objc_msgSend(v7, "setDataType:", *MEMORY[0x1E0CA2488]);
  objc_msgSend(v7, "setValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1));
  -[NSArray addObject:](v4, "addObject:", v7);

  return v4;
}

- (void)setSpatialOverCaptureMovieMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = 0;
  v4 = -[AVMomentCaptureMovieRecordingSettings _sanitizedMovieMetadataArrayForMovieMetadataArray:exceptionReason:](self, "_sanitizedMovieMetadataArrayForMovieMetadataArray:exceptionReason:", a3, &v7);
  if (v7)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else
  {
    v6 = v4;

    self->_spatialOverCaptureMovieMetadata = (NSArray *)v6;
  }
}

- (id)_sanitizedMovieMetadataArrayForMovieMetadataArray:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v6)
  {
LABEL_10:
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (!v12)
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
    v13 = v12;
    v14 = *(_QWORD *)v22;
    v15 = *MEMORY[0x1E0CF2BE0];
    v16 = *MEMORY[0x1E0CF2BF8];
    v17 = *MEMORY[0x1E0CF2BE8];
LABEL_12:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(a3);
      v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18);
      if (objc_msgSend((id)objc_msgSend(v19, "keySpace"), "isEqual:", v15)
        && (objc_msgSend((id)objc_msgSend(v19, "key"), "isEqual:", v16) & 1) != 0)
      {
        v9 = CFSTR("AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeySpatialOverCaptureGroupIdentifier must not be specified");
        goto LABEL_23;
      }
      if (objc_msgSend((id)objc_msgSend(v19, "keySpace"), "isEqual:", v15)
        && (objc_msgSend((id)objc_msgSend(v19, "key"), "isEqual:", v17) & 1) != 0)
      {
        break;
      }
      objc_msgSend(v11, "addObject:", (id)objc_msgSend(v19, "copy"));
      if (v13 == ++v18)
      {
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
          goto LABEL_12;
        return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
      }
    }
    v9 = CFSTR("AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeyContainsSpatialOverCaptureContent must not be specified");
    if (a4)
      goto LABEL_24;
    return 0;
  }
  v7 = v6;
  v8 = *(_QWORD *)v26;
  v9 = CFSTR("Array must only contain AVMetadataItems");
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v8)
      objc_enumerationMutation(a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    if (v7 == ++v10)
    {
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v7)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
LABEL_23:
  if (!a4)
    return 0;
LABEL_24:
  result = 0;
  *a4 = v9;
  return result;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (unint64_t)userInitiatedCaptureTime
{
  return self->_userInitiatedCaptureTime;
}

- (void)setUserInitiatedCaptureTime:(unint64_t)a3
{
  self->_userInitiatedCaptureTime = a3;
}

- (NSURL)movieFileURL
{
  return self->_movieFileURL;
}

- (void)setMovieFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_autoSpatialOverCaptureEnabled;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_autoSpatialOverCaptureEnabled = a3;
}

- (NSURL)spatialOverCaptureMovieFileURL
{
  return self->_spatialOverCaptureMovieFileURL;
}

- (void)setSpatialOverCaptureMovieFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

@end
