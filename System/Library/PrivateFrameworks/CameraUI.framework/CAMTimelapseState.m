@implementation CAMTimelapseState

- (BOOL)mergeSecondaryState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "stopReasons");
  objc_msgSend(v4, "stopTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[CAMTimelapseState addStopReasons:stopTime:](self, "addStopReasons:stopTime:", v5, v6);
  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMTimelapseState)init
{
  CAMTimelapseState *v2;
  uint64_t v3;
  NSString *timelapseUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMTimelapseState;
  v2 = -[CAMTimelapseState init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v3 = objc_claimAutoreleasedReturnValue();
    timelapseUUID = v2->_timelapseUUID;
    v2->_timelapseUUID = (NSString *)v3;

    if (!-[CAMTimelapseState _commonCAMTimelapseStateInitWithCoder:](v2, "_commonCAMTimelapseStateInitWithCoder:", 0))
    {

      return 0;
    }
  }
  return v2;
}

- (CAMTimelapseState)initWithCoder:(id)a3
{
  id v4;
  CAMTimelapseState *v5;
  CAMTimelapseState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMTimelapseState;
  v5 = -[CAMTimelapseState init](&v8, sel_init);
  v6 = v5;
  if (v5
    && !-[CAMTimelapseState _commonCAMTimelapseStateInitWithCoder:](v5, "_commonCAMTimelapseStateInitWithCoder:", v4))
  {

    v6 = 0;
  }

  return v6;
}

- (BOOL)_commonCAMTimelapseStateInitWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *timelapseUUID;
  NSUInteger v7;
  int64_t v8;
  int v9;
  int v10;
  NSDate *v11;
  NSDate *startTime;
  CLLocation *v13;
  CLLocation *startLocation;
  NSDate *v15;
  NSDate *lastFrameResponseTime;
  NSDate *v17;
  NSDate *stopTime;
  int64_t v19;
  double v20;
  void *v21;
  double v22;
  unint64_t v23;
  int64_t v24;
  float v25;
  CGFloat v26;
  CGFloat v27;
  NSURL *v28;
  NSURL *localPrivateMetadataFileURL;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("timelapseUUID")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timelapseUUID"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    timelapseUUID = self->_timelapseUUID;
    self->_timelapseUUID = v5;

  }
  v7 = -[NSString length](self->_timelapseUUID, "length");
  if (v7)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("captureDevice")))
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("captureDevice"));
    else
      v8 = 0;
    self->_captureDevice = v8;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("captureOrientation")))
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("captureOrientation"));
    else
      v9 = 1;
    self->_captureOrientation = v9;
    v10 = objc_msgSend(v4, "containsValueForKey:", CFSTR("captureMirrored"));
    if (v10)
      LOBYTE(v10) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("captureMirrored"));
    self->_captureMirrored = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startLocation"));
    v13 = (CLLocation *)objc_claimAutoreleasedReturnValue();
    startLocation = self->_startLocation;
    self->_startLocation = v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFrameResponseTime"));
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastFrameResponseTime = self->_lastFrameResponseTime;
    self->_lastFrameResponseTime = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stopTime"));
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    stopTime = self->_stopTime;
    self->_stopTime = v17;

    self->_preferHEVC = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("timelapsePreferHEVC"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("stopReasons")))
      v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stopReasons"));
    else
      v19 = 0;
    self->_stopReasons = v19;
    self->_allFramesWritten = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allFramesWritten"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("captureTimeInterval")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("captureTimeInterval"));
      self->_captureTimeInterval = v20;
    }
    else
    {
      +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "initialCaptureTimeInterval");
      self->_captureTimeInterval = v22;

    }
    v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frameIndexStride"));
    if (v23 <= 1)
      v24 = 1;
    else
      v24 = v23;
    self->_frameIndexStride = v24;
    self->_nextFrameIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nextFrameIndex"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("focusLensPosition")))
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("focusLensPosition"));
    else
      +[CUCaptureController focusLensPositionCurrentSentinel](CUCaptureController, "focusLensPositionCurrentSentinel");
    self->_focusLensPosition = v25;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("nominalIntermediateFrameSize")))
    {
      objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("nominalIntermediateFrameSize"));
      self->_nominalIntermediateFrameSize.width = v26;
      self->_nominalIntermediateFrameSize.height = v27;
    }
    else
    {
      self->_nominalIntermediateFrameSize = (CGSize)*MEMORY[0x1E0C9D820];
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localPrivateMetadataFileURL"));
    v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
    localPrivateMetadataFileURL = self->_localPrivateMetadataFileURL;
    self->_localPrivateMetadataFileURL = v28;

  }
  return v7 != 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *timelapseUUID;
  double v5;
  id v6;

  timelapseUUID = self->_timelapseUUID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", timelapseUUID, CFSTR("timelapseUUID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_captureDevice, CFSTR("captureDevice"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_captureOrientation, CFSTR("captureOrientation"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_captureMirrored, CFSTR("captureMirrored"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startTime, CFSTR("startTime"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startLocation, CFSTR("startLocation"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastFrameResponseTime, CFSTR("lastFrameResponseTime"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_stopTime, CFSTR("stopTime"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_stopReasons, CFSTR("stopReasons"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_allFramesWritten, CFSTR("allFramesWritten"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("captureTimeInterval"), self->_captureTimeInterval);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_frameIndexStride, CFSTR("frameIndexStride"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_nextFrameIndex, CFSTR("nextFrameIndex"));
  *(float *)&v5 = self->_focusLensPosition;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("focusLensPosition"), v5);
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("nominalIntermediateFrameSize"), self->_nominalIntermediateFrameSize.width, self->_nominalIntermediateFrameSize.height);
  objc_msgSend(v6, "encodeBool:forKey:", self->_preferHEVC, CFSTR("timelapsePreferHEVC"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localPrivateMetadataFileURL, CFSTR("localPrivateMetadataFileURL"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CAMTimelapseState;
  -[CAMTimelapseState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: timelapseUUID=%@"), v4, self->_timelapseUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Timelapse state:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ttimelapseUUID = %@\n"), self->_timelapseUUID);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcaptureDevice = %ld\n"), self->_captureDevice);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcaptureOrientation = %d\n"), self->_captureOrientation);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcaptureMirrored = %d\n"), self->_captureMirrored);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tstartTime = %@\n"), self->_startTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tstartLocation = %@\n"), self->_startLocation);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tlastFrameResponseTime = %@\n"), self->_lastFrameResponseTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tstopTime = %@\n"), self->_stopTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tstopReasons = %ld\n"), self->_stopReasons);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tallFramesWritten = %d\n"), self->_allFramesWritten);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcaptureTimeInterval = %f\n"), *(_QWORD *)&self->_captureTimeInterval);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tframeIndexStride = %ld\n"), self->_frameIndexStride);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tnextFrameIndex = %ld\n"), self->_nextFrameIndex);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tfocusLensPosition = %f\n"), self->_focusLensPosition);
  NSStringFromCGSize(self->_nominalIntermediateFrameSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tnominalIntermediateFrameSize = %@\n"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preferHEVC);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tpreferHEVC = %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("\tlocalPrivateMetadataFileURL = %@\n"), self->_localPrivateMetadataFileURL);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CAMTimelapseState isEqualToState:](self, "isEqualToState:", v4);

  return v5;
}

- (BOOL)isEqualToState:(id)a3
{
  CAMTimelapseState *v4;
  CAMTimelapseState *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (CAMTimelapseState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 1;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
      v6 = objc_msgSend(v7, "isEqualToData:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)incrementFrameIndex
{
  int64_t frameIndexStride;
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  frameIndexStride = self->_frameIndexStride;
  v4 = self->_nextFrameIndex + frameIndexStride;
  self->_nextFrameIndex = v4;
  v5 = v4 / frameIndexStride;
  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxOutputFrames");

  if (v5 >= v7)
  {
    self->_frameIndexStride *= 2;
    self->_captureTimeInterval = self->_captureTimeInterval + self->_captureTimeInterval;
  }
  return v5 >= v7;
}

- (id)filePathForNextFrameIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CAMTimelapseDiskUtilities fileNameForImageFrameIndex:](CAMTimelapseDiskUtilities, "fileNameForImageFrameIndex:", -[CAMTimelapseState nextFrameIndex](self, "nextFrameIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseState timelapseUUID](self, "timelapseUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)addStopReasons:(int64_t)a3 stopTime:(id)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = -[CAMTimelapseState stopReasons](self, "stopReasons");
  v8 = (v7 | a3) == v7;
  v9 = (v7 | a3) != v7;
  if (!v8)
    -[CAMTimelapseState setStopReasons:](self, "setStopReasons:");
  -[CAMTimelapseState stopTime](self, "stopTime");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v6 && !v10)
  {
    -[CAMTimelapseState setStopTime:](self, "setStopTime:", v6);
    v9 = 1;
  }

  return v9;
}

- (int64_t)stopReasons
{
  return self->_stopReasons;
}

+ (double)maxTimeToWaitForWrittenFrameAfterStop
{
  return 2.0;
}

- (BOOL)canContinueCapture
{
  CAMTimelapseState *v2;
  uint64_t v3;

  v2 = self;
  -[CAMTimelapseState stopTime](self, "stopTime");
  v3 = objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (v3 | -[CAMTimelapseState stopReasons](v2, "stopReasons")) == 0;

  return (char)v2;
}

- (BOOL)isReadyForWritingMovie
{
  BOOL v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  if (-[CAMTimelapseState canContinueCapture](self, "canContinueCapture"))
    return 0;
  if (-[CAMTimelapseState allFramesWritten](self, "allFramesWritten"))
    return 1;
  -[CAMTimelapseState stopTime](self, "stopTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = -v5;
  objc_msgSend((id)objc_opt_class(), "maxTimeToWaitForWrittenFrameAfterStop");
  v3 = v7 <= v6;

  return v3;
}

- (void)forceCompleted
{
  NSObject *v3;
  void *v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMTimelapseState timelapseUUID](self, "timelapseUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = -[CAMTimelapseState stopReasons](self, "stopReasons");
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Forcing completion of timelapse %{public}@ with stopReasons %ld", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "maxTimeToWaitForWrittenFrameAfterStop");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseState setStopTime:](self, "setStopTime:", v6);
  -[CAMTimelapseState setAllFramesWritten:](self, "setAllFramesWritten:", 1);

}

- (BOOL)writeToFile:(id)a3 createDirectoryIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  id v17;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "fileExistsAtPath:", v7))
      {
        v17 = 0;
        v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v17);
        v10 = v17;
        v11 = v10;
        if (!v9)
        {
          v14 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[CAMTimelapseState writeToFile:createDirectoryIfNeeded:].cold.3();
          v13 = 0;
          goto LABEL_18;
        }

      }
    }
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v8)
    {
      v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseState writeToFile:createDirectoryIfNeeded:].cold.2();

    }
    v13 = 1;
    if ((objc_msgSend(v11, "writeToFile:atomically:", v6, 1) & 1) != 0)
      goto LABEL_19;
    v14 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseState writeToFile:createDirectoryIfNeeded:].cold.1();
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

+ (id)stateWithContentsOfFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v6)
      {
        v7 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          +[CAMTimelapseState stateWithContentsOfFile:].cold.1();

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)connectionMode
{
  return self->_captureTimeInterval >= 8.0;
}

- (NSString)timelapseUUID
{
  return self->_timelapseUUID;
}

- (void)setTimelapseUUID:(id)a3
{
  objc_storeStrong((id *)&self->_timelapseUUID, a3);
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned __int16)a3
{
  self->_sessionIdentifier = a3;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(int64_t)a3
{
  self->_captureDevice = a3;
}

- (int)captureOrientation
{
  return self->_captureOrientation;
}

- (void)setCaptureOrientation:(int)a3
{
  self->_captureOrientation = a3;
}

- (BOOL)isCaptureMirrored
{
  return self->_captureMirrored;
}

- (void)setCaptureMirrored:(BOOL)a3
{
  self->_captureMirrored = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (CLLocation)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(id)a3
{
  objc_storeStrong((id *)&self->_startLocation, a3);
}

- (NSDate)lastFrameResponseTime
{
  return self->_lastFrameResponseTime;
}

- (void)setLastFrameResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastFrameResponseTime, a3);
}

- (NSDate)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(id)a3
{
  objc_storeStrong((id *)&self->_stopTime, a3);
}

- (void)setStopReasons:(int64_t)a3
{
  self->_stopReasons = a3;
}

- (BOOL)allFramesWritten
{
  return self->_allFramesWritten;
}

- (void)setAllFramesWritten:(BOOL)a3
{
  self->_allFramesWritten = a3;
}

- (double)captureTimeInterval
{
  return self->_captureTimeInterval;
}

- (int64_t)frameIndexStride
{
  return self->_frameIndexStride;
}

- (int64_t)nextFrameIndex
{
  return self->_nextFrameIndex;
}

- (float)focusLensPosition
{
  return self->_focusLensPosition;
}

- (void)setFocusLensPosition:(float)a3
{
  self->_focusLensPosition = a3;
}

- (CGSize)nominalIntermediateFrameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nominalIntermediateFrameSize.width;
  height = self->_nominalIntermediateFrameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNominalIntermediateFrameSize:(CGSize)a3
{
  self->_nominalIntermediateFrameSize = a3;
}

- (BOOL)preferHEVC
{
  return self->_preferHEVC;
}

- (void)setPreferHEVC:(BOOL)a3
{
  self->_preferHEVC = a3;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

- (void)setLocalPrivateMetadataFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_stopTime, 0);
  objc_storeStrong((id *)&self->_lastFrameResponseTime, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_timelapseUUID, 0);
}

- (void)writeToFile:createDirectoryIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Error: failed to save timelapse state to file %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeToFile:createDirectoryIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Error: failed to archive timelapse state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeToFile:createDirectoryIfNeeded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Error: failed to create directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)stateWithContentsOfFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Error: failed to unarchive timelapse state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
