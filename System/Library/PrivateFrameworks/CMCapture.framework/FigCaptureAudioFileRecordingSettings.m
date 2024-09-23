@implementation FigCaptureAudioFileRecordingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureAudioFileRecordingSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  return -[FigCaptureRecordingSettings init](&v3, sel_init);
}

- (FigCaptureAudioFileRecordingSettings)initWithCoder:(id)a3
{
  FigCaptureAudioFileRecordingSettings *v4;
  void *AllowedClassSetForMetadataItems;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  v4 = -[FigCaptureRecordingSettings initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    -[FigCaptureAudioFileRecordingSettings setAudioSettings:](v4, "setAudioSettings:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("audioSettings")));
    -[FigCaptureAudioFileRecordingSettings setCinematicAudioSettings:](v4, "setCinematicAudioSettings:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("cinematicAudioSettings")));
    AllowedClassSetForMetadataItems = (void *)FigCaptureMetadataUtilitiesCreateAllowedClassSetForMetadataItems();
    -[FigCaptureAudioFileRecordingSettings setMetadata:](v4, "setMetadata:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", AllowedClassSetForMetadataItems, CFSTR("metadata")));

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  -[FigCaptureRecordingSettings encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureAudioFileRecordingSettings audioSettings](self, "audioSettings"), CFSTR("audioSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureAudioFileRecordingSettings cinematicAudioSettings](self, "cinematicAudioSettings"), CFSTR("cinematicAudioSettings"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureAudioFileRecordingSettings metadata](self, "metadata"), CFSTR("metadata"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  v4 = -[FigCaptureRecordingSettings copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAudioSettings:", self->_audioSettings);
  objc_msgSend(v4, "setCinematicAudioSettings:", self->_cinematicAudioSettings);
  objc_msgSend(v4, "setMetadata:", self->_metadata);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  -[FigCaptureRecordingSettings dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSDictionary *audioSettings;
  void *v4;
  float v5;
  const __CFString *v6;
  NSDictionary *cinematicAudioSettings;
  void *v8;
  float v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  NSString *v13;
  CMTime time;
  unsigned int v16;

  audioSettings = self->_audioSettings;
  if (audioSettings)
  {
    v16 = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](audioSettings, "objectForKeyedSubscript:", 0x1E4930B38), "intValue"));
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_audioSettings, "objectForKeyedSubscript:", 0x1E4930B58), "floatValue");
    v6 = (const __CFString *)objc_msgSend(v4, "stringWithFormat:", CFSTR(" A:{%.4s %f}"), &v16, v5);
  }
  else
  {
    v6 = 0;
  }
  cinematicAudioSettings = self->_cinematicAudioSettings;
  if (cinematicAudioSettings)
  {
    v16 = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](cinematicAudioSettings, "objectForKeyedSubscript:", 0x1E4930B38), "intValue"));
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (!v6)
      v6 = &stru_1E4928818;
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cinematicAudioSettings, "objectForKeyedSubscript:", 0x1E4930B58), "floatValue");
    v6 = (const __CFString *)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ CA:{%.4s %f}"), v6, &v16, v9);
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  v12 = -[FigCaptureRecordingSettings settingsID](self, "settingsID");
  v13 = -[NSURL lastPathComponent](-[FigCaptureRecordingSettings outputURL](self, "outputURL"), "lastPathComponent");
  -[FigCaptureRecordingSettings maxDuration](self, "maxDuration");
  return (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %p: captureID:%lld URL:%@ maxDur:%f maxSize:%lld diskLim:%lld%@"), v11, self, v12, v13, CMTimeGetSeconds(&time), -[FigCaptureRecordingSettings maxFileSize](self, "maxFileSize"), -[FigCaptureRecordingSettings minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"), v6);
}

- (NSDictionary)audioSettings
{
  return self->_audioSettings;
}

- (void)setAudioSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)cinematicAudioSettings
{
  return self->_cinematicAudioSettings;
}

- (void)setCinematicAudioSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
