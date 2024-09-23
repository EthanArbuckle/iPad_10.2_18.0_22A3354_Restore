@implementation FigAudioCaptureConnectionConfiguration

- (id)copyXPCEncoding
{
  id v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAudioCaptureConnectionConfiguration;
  v3 = -[FigCaptureConnectionConfiguration copyXPCEncoding](&v6, sel_copyXPCEncoding);
  xpc_dictionary_set_int64(v3, "audioCaptureMode", -[FigAudioCaptureConnectionConfiguration audioCaptureMode](self, "audioCaptureMode"));
  xpc_dictionary_set_int64(v3, "windNoiseRemovalEnabled", -[FigAudioCaptureConnectionConfiguration windNoiseRemovalEnabled](self, "windNoiseRemovalEnabled"));
  xpc_dictionary_set_int64(v3, "builtInMicrophonePosition", -[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition"));
  -[FigAudioCaptureConnectionConfiguration builtInMicrophoneRequiredSampleRate](self, "builtInMicrophoneRequiredSampleRate");
  xpc_dictionary_set_double(v3, "builtInMicrophoneRequiredSampleRate", v4);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FigAudioCaptureConnectionConfiguration;
  v5 = -[FigCaptureConnectionConfiguration isEqual:](&v13, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = -[FigAudioCaptureConnectionConfiguration audioCaptureMode](self, "audioCaptureMode"),
          v6 == objc_msgSend(a3, "audioCaptureMode"))
      && (v7 = -[FigAudioCaptureConnectionConfiguration windNoiseRemovalEnabled](self, "windNoiseRemovalEnabled"),
          v7 == objc_msgSend(a3, "windNoiseRemovalEnabled"))
      && (v8 = -[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition"),
          v8 == objc_msgSend(a3, "builtInMicrophonePosition")))
    {
      -[FigAudioCaptureConnectionConfiguration builtInMicrophoneRequiredSampleRate](self, "builtInMicrophoneRequiredSampleRate");
      v10 = v9;
      objc_msgSend(a3, "builtInMicrophoneRequiredSampleRate");
      LOBYTE(v5) = v10 == v11;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  double v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = -[FigAudioCaptureConnectionConfiguration audioCaptureMode](self, "audioCaptureMode");
  if (v3 > 6)
    v4 = &stru_1E4928818;
  else
    v4 = *(&off_1E4923C08 + v3);
  if (-[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition"))
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (POSITION:%@)"), +[FigCaptureSourceConfiguration stringForSourcePosition:](FigCaptureSourceConfiguration, "stringForSourcePosition:", -[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition")));
  else
    v5 = &stru_1E4928818;
  -[FigAudioCaptureConnectionConfiguration builtInMicrophoneRequiredSampleRate](self, "builtInMicrophoneRequiredSampleRate");
  if (v6 <= 0.0)
  {
    v9 = &stru_1E4928818;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[FigAudioCaptureConnectionConfiguration builtInMicrophoneRequiredSampleRate](self, "builtInMicrophoneRequiredSampleRate");
    v9 = (const __CFString *)objc_msgSend(v7, "stringWithFormat:", CFSTR(", SampleRate:%.2fHz"), v8);
  }
  if (-[FigAudioCaptureConnectionConfiguration windNoiseRemovalEnabled](self, "windNoiseRemovalEnabled"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AC %p: <%@>%@ -> <%@>, E:%d%@, ACM:%@, WNR:%@"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v5, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), v9, v4, v10);
}

- (int)builtInMicrophonePosition
{
  return *(_DWORD *)&self->_windNoiseRemovalEnabled;
}

- (double)builtInMicrophoneRequiredSampleRate
{
  return *(double *)&self->_builtInMicrophonePosition;
}

- (int)audioCaptureMode
{
  return *((_DWORD *)&self->super._enabled + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAudioCaptureConnectionConfiguration;
  v4 = -[FigCaptureConnectionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAudioCaptureMode:", -[FigAudioCaptureConnectionConfiguration audioCaptureMode](self, "audioCaptureMode"));
  objc_msgSend(v4, "setWindNoiseRemovalEnabled:", -[FigAudioCaptureConnectionConfiguration windNoiseRemovalEnabled](self, "windNoiseRemovalEnabled"));
  objc_msgSend(v4, "setBuiltInMicrophonePosition:", -[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition"));
  -[FigAudioCaptureConnectionConfiguration builtInMicrophoneRequiredSampleRate](self, "builtInMicrophoneRequiredSampleRate");
  objc_msgSend(v4, "setBuiltInMicrophoneRequiredSampleRate:");
  return v4;
}

- (void)setBuiltInMicrophonePosition:(int)a3
{
  *(_DWORD *)&self->_windNoiseRemovalEnabled = a3;
}

- (void)setAudioCaptureMode:(int)a3
{
  *((_DWORD *)&self->super._enabled + 1) = a3;
}

- (void)setBuiltInMicrophoneRequiredSampleRate:(double)a3
{
  *(double *)&self->_builtInMicrophonePosition = a3;
}

- (FigAudioCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigAudioCaptureConnectionConfiguration *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigAudioCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
    if (v4)
    {
      *((_DWORD *)&v4->super._enabled + 1) = xpc_dictionary_get_int64(a3, "audioCaptureMode");
      LOBYTE(v4->_audioCaptureMode) = xpc_dictionary_get_int64(a3, "windNoiseRemovalEnabled") != 0;
      *(_DWORD *)&v4->_windNoiseRemovalEnabled = xpc_dictionary_get_int64(a3, "builtInMicrophonePosition");
      *(double *)&v4->_builtInMicrophonePosition = xpc_dictionary_get_double(a3, "builtInMicrophoneRequiredSampleRate");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)windNoiseRemovalEnabled
{
  return self->_audioCaptureMode;
}

- (void)setWindNoiseRemovalEnabled:(BOOL)a3
{
  LOBYTE(self->_audioCaptureMode) = a3;
}

@end
