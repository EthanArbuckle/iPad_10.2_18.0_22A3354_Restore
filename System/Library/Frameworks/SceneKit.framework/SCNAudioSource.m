@implementation SCNAudioSource

+ (SCNAudioSource)audioSourceWithAVAudioPCMBuffer:(id)a3
{
  return (SCNAudioSource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAVAudioPCMBuffer:", a3);
}

- (SCNAudioSource)initWithAVAudioPCMBuffer:(id)a3
{
  SCNAudioSource *v4;
  double v5;
  double v6;

  v4 = -[SCNAudioSource init](self, "init");
  if (v4)
  {
    v4->_audioBuffer = (AVAudioPCMBuffer *)a3;
    -[SCNAudioSource setPositional:](v4, "setPositional:", 1);
    LODWORD(v5) = 1.0;
    -[SCNAudioSource setVolume:](v4, "setVolume:", v5);
    LODWORD(v6) = 1.0;
    -[SCNAudioSource setRate:](v4, "setRate:", v6);
  }
  return v4;
}

- (int64_t)renderingAlgorithm
{
  if (-[SCNAudioSource isPositional](self, "isPositional"))
    return 0;
  else
    return 5;
}

- (void)_loadURLWithBundle:(id)a3
{
  NSString *audioName;
  NSString **p_audioName;
  NSString *v7;
  const __CFString *v8;
  NSString *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;

  p_audioName = &self->_audioName;
  audioName = self->_audioName;
  if (audioName)
  {
    v7 = -[NSString pathExtension](audioName, "pathExtension");
    if (v7 && (v8 = (const __CFString *)v7, -[NSString length](v7, "length")))
    {
      v9 = -[NSString stringByDeletingPathExtension](*p_audioName, "stringByDeletingPathExtension");
      v10 = a3;
      v11 = v8;
    }
    else
    {
      v12 = (void *)objc_msgSend(a3, "URLForResource:withExtension:", *p_audioName, CFSTR("caf"));
      if (v12 || (v12 = (void *)objc_msgSend(a3, "URLForResource:withExtension:", *p_audioName, CFSTR("caff"))) != 0)
      {
LABEL_11:
        self->_audioURL = (NSURL *)v12;
        return;
      }
      v9 = *p_audioName;
      v11 = CFSTR("aiff");
      v10 = a3;
    }
    v12 = (void *)objc_msgSend(v10, "URLForResource:withExtension:", v9, v11);
    if (!v12)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SCNAudioSource _loadURLWithBundle:].cold.1((uint64_t *)p_audioName, v13, v14);
      v12 = 0;
    }
    goto LABEL_11;
  }
}

- (SCNAudioSource)initWithFileNamed:(id)a3 inBundle:(id)a4
{
  SCNAudioSource *v6;
  double v7;
  double v8;

  v6 = -[SCNAudioSource init](self, "init");
  if (v6)
  {
    v6->_audioName = (NSString *)a3;
    -[SCNAudioSource setPositional:](v6, "setPositional:", 1);
    LODWORD(v7) = 1.0;
    -[SCNAudioSource setVolume:](v6, "setVolume:", v7);
    LODWORD(v8) = 1.0;
    -[SCNAudioSource setRate:](v6, "setRate:", v8);
    -[SCNAudioSource _loadURLWithBundle:](v6, "_loadURLWithBundle:", a4);
  }
  return v6;
}

- (id)fileName
{
  return self->_audioName;
}

- (SCNAudioSource)initWithFileNamed:(NSString *)name
{
  return -[SCNAudioSource initWithFileNamed:inBundle:](self, "initWithFileNamed:inBundle:", name, objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"));
}

- (SCNAudioSource)initWithURL:(NSURL *)url
{
  SCNAudioSource *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNAudioSource;
  v4 = -[SCNAudioSource init](&v8, sel_init);
  if (v4)
  {
    v4->_audioURL = url;
    -[SCNAudioSource setPositional:](v4, "setPositional:", 1);
    LODWORD(v5) = 1.0;
    -[SCNAudioSource setVolume:](v4, "setVolume:", v5);
    LODWORD(v6) = 1.0;
    -[SCNAudioSource setRate:](v4, "setRate:", v6);
  }
  return v4;
}

+ (SCNAudioSource)audioSourceNamed:(NSString *)fileName
{
  SCNAudioSource *result;
  SCNAudioSource *v5;
  SCNAudioSource *v6;

  if (audioSourceNamed__onceToken != -1)
    dispatch_once(&audioSourceNamed__onceToken, &__block_literal_global_8);
  result = (SCNAudioSource *)objc_msgSend((id)audioSourceNamed__gAudioSources, "objectForKey:", fileName);
  if (!result)
  {
    v5 = -[SCNAudioSource initWithFileNamed:]([SCNAudioSource alloc], "initWithFileNamed:", fileName);
    v6 = v5;
    if (fileName)
    {
      if (v5)
        objc_msgSend((id)audioSourceNamed__gAudioSources, "setObject:forKey:", v5, fileName);
    }
    return v6;
  }
  return result;
}

id __35__SCNAudioSource_audioSourceNamed___block_invoke()
{
  audioSourceNamed__gAudioSources = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  return (id)audioSourceNamed__gAudioSources;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNAudioSource;
  -[SCNAudioSource dealloc](&v3, sel_dealloc);
}

- (void)load
{
  if (!self->_loaded)
    -[SCNAudioSource _load](self, "_load");
}

- (void)_load
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "localizedDescription");
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v4, "Error: Error reading file into buffer: %@", (uint8_t *)&v5);
}

- (void)loadIfNeeded
{
  if (!self->_loaded)
    -[SCNAudioSource load](self, "load");
}

- (id)audioBufferFormat
{
  -[SCNAudioSource loadIfNeeded](self, "loadIfNeeded");
  return (id)-[AVAudioPCMBuffer format](self->_audioBuffer, "format");
}

- (id)audioBuffer
{
  -[SCNAudioSource loadIfNeeded](self, "loadIfNeeded");
  return self->_audioBuffer;
}

- (id)audioFile
{
  -[SCNAudioSource loadIfNeeded](self, "loadIfNeeded");
  return self->_audioFile;
}

- (double)duration
{
  AVAudioFile *audioFile;
  double v5;
  double v6;

  if (-[SCNAudioSource loops](self, "loops"))
    return 1.79769313e308;
  -[SCNAudioSource loadIfNeeded](self, "loadIfNeeded");
  audioFile = self->_audioFile;
  if (!audioFile)
    return 0.0;
  if (self->_audioBuffer)
    v5 = (float)-[AVAudioPCMBuffer frameLength](self->_audioBuffer, "frameLength");
  else
    v5 = (double)-[AVAudioFile length](audioFile, "length");
  -[AVAudioFormat sampleRate](-[AVAudioFile fileFormat](self->_audioFile, "fileFormat"), "sampleRate");
  return v5 / v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNAudioSource *v4;
  SCNAudioSource *v5;
  SCNAudioSource *v6;

  if (self->_audioName)
  {
    v4 = +[SCNAudioSource audioSourceNamed:](SCNAudioSource, "audioSourceNamed:");
  }
  else
  {
    if (self->_audioURL)
    {
      v5 = -[SCNAudioSource initWithURL:]([SCNAudioSource alloc], "initWithURL:", self->_audioURL);
      goto LABEL_6;
    }
    if (!self->_audioBuffer)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v4 = +[SCNAudioSource audioSourceWithAVAudioPCMBuffer:](SCNAudioSource, "audioSourceWithAVAudioPCMBuffer:");
  }
  v5 = v4;
LABEL_6:
  v6 = v5;
LABEL_7:
  -[SCNAudioSource setPositional:](v6, "setPositional:", -[SCNAudioSource isPositional](self, "isPositional"));
  -[SCNAudioSource volume](self, "volume");
  -[SCNAudioSource setVolume:](v6, "setVolume:");
  -[SCNAudioSource rate](self, "rate");
  -[SCNAudioSource setRate:](v6, "setRate:");
  -[SCNAudioSource setLoops:](v6, "setLoops:", -[SCNAudioSource loops](self, "loops"));
  -[SCNAudioSource setShouldStream:](v6, "setShouldStream:", -[SCNAudioSource shouldStream](self, "shouldStream"));
  return v6;
}

- (id)copy
{
  return -[SCNAudioSource copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_customEncodingOfSCNAudioSource:(id)a3
{
  NSString *audioName;
  const __CFString *v6;
  id v7;
  NSObject *v8;

  audioName = self->_audioName;
  if (audioName)
  {
    v6 = CFSTR("name");
    v7 = a3;
LABEL_5:
    objc_msgSend(v7, "encodeObject:forKey:", audioName, v6);
    goto LABEL_6;
  }
  if (self->_audioURL)
  {
    v6 = CFSTR("url");
    v7 = a3;
    audioName = 0;
    goto LABEL_5;
  }
  v8 = scn_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SCNAudioSource _customEncodingOfSCNAudioSource:].cold.1(v8);
LABEL_6:
  -[SCNAudioSource volume](self, "volume");
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("volume"));
  -[SCNAudioSource rate](self, "rate");
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("rate"));
  -[SCNAudioSource reverbBlend](self, "reverbBlend");
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("reverbBlend"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAudioSource isPositional](self, "isPositional"), CFSTR("positional"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAudioSource loops](self, "loops"), CFSTR("loops"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAudioSource shouldStream](self, "shouldStream"), CFSTR("shouldStream"));
}

- (void)_customDecodingOfSCNAudioSource:(id)a3
{
  _QWORD *p_audioName;
  const __CFString *v6;

  p_audioName = &self->_audioName;
  if (self->_audioName)
  {
    v6 = CFSTR("name");
LABEL_5:
    *p_audioName = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
    goto LABEL_6;
  }
  p_audioName = &self->_audioURL;
  if (self->_audioURL)
  {
    v6 = CFSTR("url");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("volume"));
  -[SCNAudioSource setVolume:](self, "setVolume:");
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("rate"));
  -[SCNAudioSource setRate:](self, "setRate:");
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("reverbBlend"));
  -[SCNAudioSource setReverbBlend:](self, "setReverbBlend:");
  -[SCNAudioSource setPositional:](self, "setPositional:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("positional")));
  -[SCNAudioSource setLoops:](self, "setLoops:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("loops")));
  -[SCNAudioSource setShouldStream:](self, "setShouldStream:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("shouldStream")));
  -[SCNAudioSource loadIfNeeded](self, "loadIfNeeded");
}

- (SCNAudioSource)initWithCoder:(id)a3
{
  SCNAudioSource *v4;
  SCNAudioSource *v5;

  v4 = -[SCNAudioSource init](self, "init");
  v5 = v4;
  if (v4)
    -[SCNAudioSource _customDecodingOfSCNAudioSource:](v4, "_customDecodingOfSCNAudioSource:", a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)volume
{
  return self->volume;
}

- (void)setVolume:(float)volume
{
  self->volume = volume;
}

- (BOOL)isPositional
{
  return self->positional;
}

- (void)setPositional:(BOOL)positional
{
  self->positional = positional;
}

- (float)rate
{
  return self->rate;
}

- (void)setRate:(float)rate
{
  self->rate = rate;
}

- (float)reverbBlend
{
  return self->reverbBlend;
}

- (void)setReverbBlend:(float)reverbBlend
{
  self->reverbBlend = reverbBlend;
}

- (BOOL)loops
{
  return self->_loops;
}

- (void)setLoops:(BOOL)loops
{
  self->_loops = loops;
}

- (BOOL)shouldStream
{
  return self->_shouldStream;
}

- (void)setShouldStream:(BOOL)shouldStream
{
  self->_shouldStream = shouldStream;
}

- (void)_loadURLWithBundle:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, a3, "Error: failed to load audio source at %@", (uint8_t *)&v4);
}

- (void)_customEncodingOfSCNAudioSource:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: can't archive audio data directly", v1, 2u);
}

@end
