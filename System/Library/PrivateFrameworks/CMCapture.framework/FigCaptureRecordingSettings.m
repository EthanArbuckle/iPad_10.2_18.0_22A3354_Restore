@implementation FigCaptureRecordingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureRecordingSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureRecordingSettings;
  return -[FigCaptureRecordingSettings init](&v3, sel_init);
}

- (FigCaptureRecordingSettings)initWithCoder:(id)a3
{
  FigCaptureRecordingSettings *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  CMTime v10;
  CMTime v11;

  v4 = -[FigCaptureRecordingSettings init](self, "init");
  if (v4)
  {
    -[FigCaptureRecordingSettings setSettingsID:](v4, "setSettingsID:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("settingsID")));
    -[FigCaptureRecordingSettings setOutputURL:](v4, "setOutputURL:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputURL")));
    -[FigCaptureRecordingSettings setOutputFileType:](v4, "setOutputFileType:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputFileType")));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), CFSTR("maxDuration"));
    if (v8)
    {
      CMTimeMakeFromDictionary(&v11, v8);
      v10 = v11;
      -[FigCaptureRecordingSettings setMaxDuration:](v4, "setMaxDuration:", &v10);
    }
    -[FigCaptureRecordingSettings setMaxFileSize:](v4, "setMaxFileSize:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("maxFileSize")));
    -[FigCaptureRecordingSettings setMinFreeDiskSpaceLimit:](v4, "setMinFreeDiskSpaceLimit:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("minFreeDiskSpaceLimit")));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CFDictionaryRef v5;
  CMTime time;

  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureRecordingSettings settingsID](self, "settingsID"), CFSTR("settingsID"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureRecordingSettings outputURL](self, "outputURL"), CFSTR("outputURL"));
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureRecordingSettings outputFileType](self, "outputFileType"), CFSTR("outputFileType"));
  if (self)
    -[FigCaptureRecordingSettings maxDuration](self, "maxDuration");
  else
    memset(&time, 0, sizeof(time));
  v5 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("maxDuration"));
  CFRelease(v5);
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureRecordingSettings maxFileSize](self, "maxFileSize"), CFSTR("maxFileSize"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureRecordingSettings minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"), CFSTR("minFreeDiskSpaceLimit"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  $95D729B680665BEAEFA1D6FCA8238556 maxDuration;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSettingsID:", self->_settingsID);
  objc_msgSend(v4, "setOutputURL:", self->_outputURL);
  objc_msgSend(v4, "setOutputFileType:", self->_outputFileType);
  maxDuration = self->_maxDuration;
  objc_msgSend(v4, "setMaxDuration:", &maxDuration);
  objc_msgSend(v4, "setMaxFileSize:", self->_maxFileSize);
  objc_msgSend(v4, "setMinFreeDiskSpaceLimit:", self->_minFreeDiskSpaceLimit);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureRecordingSettings;
  -[FigCaptureRecordingSettings dealloc](&v3, sel_dealloc);
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)outputFileType
{
  return self->_outputFileType;
}

- (void)setOutputFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setMaxDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maxDuration.value = v3;
}

- (int64_t)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(int64_t)a3
{
  self->_maxFileSize = a3;
}

- (int64_t)minFreeDiskSpaceLimit
{
  return self->_minFreeDiskSpaceLimit;
}

- (void)setMinFreeDiskSpaceLimit:(int64_t)a3
{
  self->_minFreeDiskSpaceLimit = a3;
}

@end
