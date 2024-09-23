@implementation FigCaptureMovieFileRecordingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureMovieFileRecordingSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  return -[FigCaptureRecordingSettings init](&v3, sel_init);
}

- (FigCaptureMovieFileRecordingSettings)initWithCoder:(id)a3
{
  FigCaptureMovieFileRecordingSettings *v4;
  void *AllowedClassSetForMetadataItems;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CMTime v11;
  CMTime v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  v4 = -[FigCaptureRecordingSettings initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    AllowedClassSetForMetadataItems = (void *)FigCaptureMetadataUtilitiesCreateAllowedClassSetForMetadataItems();
    -[FigCaptureMovieFileRecordingSettings setVideoSettings:](v4, "setVideoSettings:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("videoSettings")));
    -[FigCaptureMovieFileRecordingSettings setVideoMirrored:](v4, "setVideoMirrored:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("videoMirrored")));
    -[FigCaptureMovieFileRecordingSettings setVideoOrientation:](v4, "setVideoOrientation:", objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("videoOrientation")));
    -[FigCaptureMovieFileRecordingSettings setRecordVideoOrientationAndMirroringChanges:](v4, "setRecordVideoOrientationAndMirroringChanges:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("recordVideoOrientationAndMirroringChanges")));
    -[FigCaptureMovieFileRecordingSettings setAudioSettings:](v4, "setAudioSettings:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("audioSettings")));
    -[FigCaptureMovieFileRecordingSettings setCinematicAudioSettings:](v4, "setCinematicAudioSettings:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("cinematicAudioSettings")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), CFSTR("movieFragmentInterval"));
    if (v9)
    {
      CMTimeMakeFromDictionary(&v12, v9);
      v11 = v12;
      -[FigCaptureMovieFileRecordingSettings setMovieFragmentInterval:](v4, "setMovieFragmentInterval:", &v11);
    }
    -[FigCaptureMovieFileRecordingSettings setMovieLevelMetadata:](v4, "setMovieLevelMetadata:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", AllowedClassSetForMetadataItems, CFSTR("movieLevelMetadata")));
    -[FigCaptureMovieFileRecordingSettings setSendPreviewIOSurface:](v4, "setSendPreviewIOSurface:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("sendPreviewIOSurface")));
    -[FigCaptureMovieFileRecordingSettings setIrisRecording:](v4, "setIrisRecording:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("irisRecording")));
    -[FigCaptureMovieFileRecordingSettings setDebugMetadataSidecarFileEnabled:](v4, "setDebugMetadataSidecarFileEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("debugMetadataSidecarFilesAreSupported")));
    -[FigCaptureMovieFileRecordingSettings setMetadataIdentifiersEnabled:](v4, "setMetadataIdentifiersEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("metadataIdentifiersEnabled")));
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bravoCameraSelectionConfigurationForRecording")), "getBytes:length:", &v4->_metadataIdentifiersEnabled + 1, 20);
    -[FigCaptureMovieFileRecordingSettings setIrisMovieRecording:](v4, "setIrisMovieRecording:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("irisMovieRecording")));
    -[FigCaptureMovieFileRecordingSettings setSpatialOverCaptureMovieURL:](v4, "setSpatialOverCaptureMovieURL:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spatialOverCaptureMovieURL")));
    -[FigCaptureMovieFileRecordingSettings setSpatialOverCaptureMovieLevelMetadata:](v4, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", AllowedClassSetForMetadataItems, CFSTR("spatialOverCaptureMovieLevelMetadata")));
    -[FigCaptureMovieFileRecordingSettings setMovieStartTimeOverride:](v4, "setMovieStartTimeOverride:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("movieStartTimeOverride")));
    -[FigCaptureMovieFileRecordingSettings setUsesVirtualCaptureCard:](v4, "setUsesVirtualCaptureCard:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usesVirtualCaptureCard")));
    -[FigCaptureMovieFileRecordingSettings setSmartStyle:](v4, "setSmartStyle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartStyle")));

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CFDictionaryRef v5;
  CMTime time;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  -[FigCaptureRecordingSettings encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings videoSettings](self, "videoSettings"), CFSTR("videoSettings"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings videoMirrored](self, "videoMirrored"), CFSTR("videoMirrored"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[FigCaptureMovieFileRecordingSettings videoOrientation](self, "videoOrientation"), CFSTR("videoOrientation"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings recordVideoOrientationAndMirroringChanges](self, "recordVideoOrientationAndMirroringChanges"), CFSTR("recordVideoOrientationAndMirroringChanges"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings audioSettings](self, "audioSettings"), CFSTR("audioSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings cinematicAudioSettings](self, "cinematicAudioSettings"), CFSTR("cinematicAudioSettings"));
  if (self)
    -[FigCaptureMovieFileRecordingSettings movieFragmentInterval](self, "movieFragmentInterval");
  else
    memset(&time, 0, sizeof(time));
  v5 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("movieFragmentInterval"));
  CFRelease(v5);
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings movieLevelMetadata](self, "movieLevelMetadata"), CFSTR("movieLevelMetadata"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings sendPreviewIOSurface](self, "sendPreviewIOSurface"), CFSTR("sendPreviewIOSurface"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings isIrisRecording](self, "isIrisRecording"), CFSTR("irisRecording"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings debugMetadataSidecarFileEnabled](self, "debugMetadataSidecarFileEnabled"), CFSTR("debugMetadataSidecarFilesAreSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings metadataIdentifiersEnabled](self, "metadataIdentifiersEnabled"), CFSTR("metadataIdentifiersEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_metadataIdentifiersEnabled + 1, 20), CFSTR("bravoCameraSelectionConfigurationForRecording"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings isIrisMovieRecording](self, "isIrisMovieRecording"), CFSTR("irisMovieRecording"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings spatialOverCaptureMovieURL](self, "spatialOverCaptureMovieURL"), CFSTR("spatialOverCaptureMovieURL"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings spatialOverCaptureMovieLevelMetadata](self, "spatialOverCaptureMovieLevelMetadata"), CFSTR("spatialOverCaptureMovieLevelMetadata"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureMovieFileRecordingSettings movieStartTimeOverride](self, "movieStartTimeOverride"), CFSTR("movieStartTimeOverride"));
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings usesVirtualCaptureCard](self, "usesVirtualCaptureCard"), CFSTR("usesVirtualCaptureCard"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings smartStyle](self, "smartStyle"), CFSTR("smartStyle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  __int128 v6;
  int selectionBehavior_high;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  v4 = -[FigCaptureRecordingSettings copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setVideoSettings:", self->_videoSettings);
  objc_msgSend(v4, "setVideoMirrored:", self->_videoMirrored);
  objc_msgSend(v4, "setVideoOrientation:", self->_videoOrientation);
  objc_msgSend(v4, "setRecordVideoOrientationAndMirroringChanges:", self->_recordVideoOrientationAndMirroringChanges);
  objc_msgSend(v4, "setAudioSettings:", self->_audioSettings);
  objc_msgSend(v4, "setCinematicAudioSettings:", self->_cinematicAudioSettings);
  v8 = *(_OWORD *)(&self->_recordVideoOrientationAndMirroringChanges + 4);
  v9 = *(_QWORD *)&self->_movieFragmentInterval.flags;
  objc_msgSend(v4, "setMovieFragmentInterval:", &v8);
  objc_msgSend(v4, "setMovieLevelMetadata:", self->_movieLevelMetadata);
  objc_msgSend(v4, "setSendPreviewIOSurface:", self->_sendPreviewIOSurface);
  objc_msgSend(v4, "setIrisRecording:", self->_irisRecording);
  objc_msgSend(v4, "setDebugMetadataSidecarFileEnabled:", self->_debugMetadataSidecarFileEnabled);
  objc_msgSend(v4, "setMetadataIdentifiersEnabled:", self->_metadataIdentifiersEnabled);
  v6 = *(_OWORD *)(&self->_metadataIdentifiersEnabled + 1);
  selectionBehavior_high = HIDWORD(self->_bravoCameraSelectionConfigurationForRecording.selectionBehavior);
  objc_msgSend(v4, "setBravoCameraSelectionConfigurationForRecording:", &v6);
  objc_msgSend(v4, "setIrisMovieRecording:", LOBYTE(self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions));
  objc_msgSend(v4, "setSpatialOverCaptureMovieURL:", *(_QWORD *)&self->_irisMovieRecording);
  objc_msgSend(v4, "setSpatialOverCaptureMovieLevelMetadata:", self->_spatialOverCaptureMovieURL);
  objc_msgSend(v4, "setMovieStartTimeOverride:", self->_spatialOverCaptureMovieLevelMetadata);
  objc_msgSend(v4, "setPersonSegmentationRenderingEnabled:", LOBYTE(self->_movieStartTimeOverride));
  objc_msgSend(v4, "setPersonSegmentationForegroundColorCube:", *(_QWORD *)&self->_personSegmentationRenderingEnabled);
  objc_msgSend(v4, "setPersonSegmentationBackgroundColorCube:", self->_personSegmentationForegroundColorCube);
  objc_msgSend(v4, "setVideoSTFEnabled:", LOBYTE(self->_personSegmentationBackgroundColorCube));
  objc_msgSend(v4, "setUsesVirtualCaptureCard:", BYTE1(self->_personSegmentationBackgroundColorCube));
  objc_msgSend(v4, "setSmartStyle:", *(_QWORD *)&self->_smartStyleReversibilitySupported);
  objc_msgSend(v4, "setSmartStyleReversibilitySupported:", LOBYTE(self->smartStyle));
  objc_msgSend(v4, "setSmartStyleRenderingBypassed:", BYTE1(self->smartStyle));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  -[FigCaptureRecordingSettings dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSDictionary *videoSettings;
  NSDictionary *audioSettings;
  void *v5;
  float v6;
  const __CFString *v7;
  NSDictionary *cinematicAudioSettings;
  void *v9;
  float v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  NSString *v18;
  Float64 Seconds;
  int64_t v20;
  const __CFString *v21;
  int64_t v22;
  Float64 v23;
  const char *v24;
  const __CFString *v26;
  const __CFString *v27;
  CMTime v28;
  CMTime time;

  videoSettings = self->_videoSettings;
  if (videoSettings)
    v27 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" V:{%@ %dx%d O:%d M:%d trackOM:%d Prev:%d}"), -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", CFSTR("AVVideoCodecKey")), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_videoSettings, "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), "intValue"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_videoSettings, "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), "intValue"),
                                self->_videoOrientation,
                                self->_videoMirrored,
                                self->_recordVideoOrientationAndMirroringChanges,
                                self->_sendPreviewIOSurface);
  else
    v27 = &stru_1E4928818;
  audioSettings = self->_audioSettings;
  if (audioSettings)
  {
    LODWORD(v28.value) = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](audioSettings, "objectForKeyedSubscript:", 0x1E4930B38), "intValue"));
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_audioSettings, "objectForKeyedSubscript:", 0x1E4930B58), "floatValue");
    v7 = (const __CFString *)objc_msgSend(v5, "stringWithFormat:", CFSTR(" A:{%.4s %f}"), &v28, v6);
  }
  else
  {
    v7 = 0;
  }
  cinematicAudioSettings = self->_cinematicAudioSettings;
  if (cinematicAudioSettings)
  {
    LODWORD(v28.value) = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](cinematicAudioSettings, "objectForKeyedSubscript:", 0x1E4930B38), "intValue"));
    v9 = (void *)MEMORY[0x1E0CB3940];
    if (!v7)
      v7 = &stru_1E4928818;
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cinematicAudioSettings, "objectForKeyedSubscript:", 0x1E4930B58), "floatValue");
    v7 = (const __CFString *)objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ CA:{%.4s %f}"), v7, &v28, v10);
  }
  v11 = *(void **)&self->_irisMovieRecording;
  if (v11)
    v26 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" overCaptureURL: %@"), objc_msgSend(v11, "lastPathComponent"));
  else
    v26 = &stru_1E4928818;
  if (LOBYTE(self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions))
    v12 = CFSTR(" isIrisMovie");
  else
    v12 = &stru_1E4928818;
  if (LOBYTE(self->smartStyle))
    v13 = CFSTR(" supportsReversibility");
  else
    v13 = &stru_1E4928818;
  v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ smartStyle: %@%@"), v12, *(_QWORD *)&self->_smartStyleReversibilitySupported, v13);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  v17 = -[FigCaptureRecordingSettings settingsID](self, "settingsID");
  v18 = -[NSURL lastPathComponent](-[FigCaptureRecordingSettings outputURL](self, "outputURL"), "lastPathComponent");
  -[FigCaptureRecordingSettings maxDuration](self, "maxDuration");
  Seconds = CMTimeGetSeconds(&time);
  v20 = -[FigCaptureRecordingSettings maxFileSize](self, "maxFileSize");
  v21 = &stru_1E4928818;
  v22 = -[FigCaptureRecordingSettings minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit");
  v28 = *(CMTime *)(&self->_recordVideoOrientationAndMirroringChanges + 4);
  v23 = CMTimeGetSeconds(&v28);
  if (self->_irisRecording)
    v21 = CFSTR(" isIris");
  if (-[FigCaptureMovieFileRecordingSettings usesVirtualCaptureCard](self, "usesVirtualCaptureCard"))
    v24 = "YES";
  else
    v24 = "NO";
  return (id)objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %p: captureID:%lld URL:%@ maxDur:%f maxSize:%lld diskLim:%lld frag:%f%@%@%@%@%@ usesVCC:%s"), v16, self, v17, v18, *(_QWORD *)&Seconds, v20, v22, *(_QWORD *)&v23, v27, v7, v21, v14, v26, v24);
}

- (void)setVideoSettings:(id)a3
{
  if ((-[NSDictionary isEqual:](self->_videoSettings, "isEqual:") & 1) == 0)
  {

    self->_videoSettings = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (NSDictionary)videoSettings
{
  return self->_videoSettings;
}

- (NSDictionary)audioSettings
{
  return self->_audioSettings;
}

- (void)setAudioSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)cinematicAudioSettings
{
  return self->_cinematicAudioSettings;
}

- (void)setCinematicAudioSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)videoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (int)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int)a3
{
  self->_videoOrientation = a3;
}

- (BOOL)recordVideoOrientationAndMirroringChanges
{
  return self->_recordVideoOrientationAndMirroringChanges;
}

- (void)setRecordVideoOrientationAndMirroringChanges:(BOOL)a3
{
  self->_recordVideoOrientationAndMirroringChanges = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2;
  retstr->var3 = *(int64_t *)((char *)&self[5].var0 + 4);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)(&self->_recordVideoOrientationAndMirroringChanges + 4) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieFragmentInterval.flags = var3;
}

- (NSArray)movieLevelMetadata
{
  return self->_movieLevelMetadata;
}

- (void)setMovieLevelMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)sendPreviewIOSurface
{
  return self->_sendPreviewIOSurface;
}

- (void)setSendPreviewIOSurface:(BOOL)a3
{
  self->_sendPreviewIOSurface = a3;
}

- (BOOL)isIrisRecording
{
  return self->_irisRecording;
}

- (void)setIrisRecording:(BOOL)a3
{
  self->_irisRecording = a3;
}

- (BOOL)debugMetadataSidecarFileEnabled
{
  return self->_debugMetadataSidecarFileEnabled;
}

- (void)setDebugMetadataSidecarFileEnabled:(BOOL)a3
{
  self->_debugMetadataSidecarFileEnabled = a3;
}

- (BOOL)metadataIdentifiersEnabled
{
  return self->_metadataIdentifiersEnabled;
}

- (void)setMetadataIdentifiersEnabled:(BOOL)a3
{
  self->_metadataIdentifiersEnabled = a3;
}

- ($57AEF30BA5BDD2E68F6742A1266F0E8C)bravoCameraSelectionConfigurationForRecording
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(&self[6].var0 + 4);
  LODWORD(retstr->var2) = HIDWORD(self[6].var2);
  return self;
}

- (void)setBravoCameraSelectionConfigurationForRecording:(id *)a3
{
  int var2;

  var2 = a3->var2;
  *(_OWORD *)(&self->_metadataIdentifiersEnabled + 1) = *(_OWORD *)&a3->var0;
  HIDWORD(self->_bravoCameraSelectionConfigurationForRecording.selectionBehavior) = var2;
}

- (BOOL)isIrisMovieRecording
{
  return self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions;
}

- (void)setIrisMovieRecording:(BOOL)a3
{
  LOBYTE(self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions) = a3;
}

- (NSURL)spatialOverCaptureMovieURL
{
  return *(NSURL **)&self->_irisMovieRecording;
}

- (void)setSpatialOverCaptureMovieURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)spatialOverCaptureMovieLevelMetadata
{
  return (NSArray *)self->_spatialOverCaptureMovieURL;
}

- (void)setSpatialOverCaptureMovieLevelMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)movieStartTimeOverride
{
  return (unint64_t)self->_spatialOverCaptureMovieLevelMetadata;
}

- (void)setMovieStartTimeOverride:(unint64_t)a3
{
  self->_spatialOverCaptureMovieLevelMetadata = (NSArray *)a3;
}

- (BOOL)personSegmentationRenderingEnabled
{
  return self->_movieStartTimeOverride;
}

- (void)setPersonSegmentationRenderingEnabled:(BOOL)a3
{
  LOBYTE(self->_movieStartTimeOverride) = a3;
}

- (NSData)personSegmentationForegroundColorCube
{
  return *(NSData **)&self->_personSegmentationRenderingEnabled;
}

- (void)setPersonSegmentationForegroundColorCube:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSData)personSegmentationBackgroundColorCube
{
  return self->_personSegmentationForegroundColorCube;
}

- (void)setPersonSegmentationBackgroundColorCube:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (BOOL)videoSTFEnabled
{
  return (BOOL)self->_personSegmentationBackgroundColorCube;
}

- (void)setVideoSTFEnabled:(BOOL)a3
{
  LOBYTE(self->_personSegmentationBackgroundColorCube) = a3;
}

- (BOOL)usesVirtualCaptureCard
{
  return BYTE1(self->_personSegmentationBackgroundColorCube);
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  BYTE1(self->_personSegmentationBackgroundColorCube) = a3;
}

- (FigCaptureSmartStyle)smartStyle
{
  return *(FigCaptureSmartStyle **)&self->_smartStyleReversibilitySupported;
}

- (void)setSmartStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)smartStyleReversibilitySupported
{
  return (BOOL)self->smartStyle;
}

- (void)setSmartStyleReversibilitySupported:(BOOL)a3
{
  LOBYTE(self->smartStyle) = a3;
}

- (BOOL)smartStyleRenderingBypassed
{
  return BYTE1(self->smartStyle);
}

- (void)setSmartStyleRenderingBypassed:(BOOL)a3
{
  BYTE1(self->smartStyle) = a3;
}

@end
