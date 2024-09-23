@implementation FigScreenCaptureConfiguration

- (FigScreenCaptureConfiguration)init
{
  FigScreenCaptureConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigScreenCaptureConfiguration;
  v2 = -[FigScreenCaptureConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_fvdOptions = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    CFDictionarySetValue(v2->_fvdOptions, CFSTR("usage"), CFSTR("Uncompressed"));
    v2->_preset = 0;
    CFDictionarySetValue(v2->_fvdOptions, CFSTR("ScreenRecording"), (const void *)*MEMORY[0x1E0C9AE50]);
    FigCFDictionarySetInt32();
    CFDictionarySetValue(v2->_fvdOptions, CFSTR("DisplayLabel"), CFSTR("ScreenCapture"));
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *fvdOptions;
  objc_super v4;

  fvdOptions = self->_fvdOptions;
  if (fvdOptions)
  {
    CFRelease(fvdOptions);
    self->_fvdOptions = 0;
  }
  FigSimpleMutexDestroy();
  self->_lock = 0;
  v4.receiver = self;
  v4.super_class = (Class)FigScreenCaptureConfiguration;
  -[FigScreenCaptureConfiguration dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, options = %@>"), NSStringFromClass(v4), self, -[__CFDictionary description](self->_fvdOptions, "description"));
}

- (__CFDictionary)getFVDOptions
{
  return self->_fvdOptions;
}

- (OpaqueFigSimpleMutex)getLock
{
  return self->_lock;
}

- (void)setSize:(CGSize)a3
{
  CFDictionaryRef DictionaryRepresentation;
  void *v5;
  id v6;
  id value;

  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(a3);
  MEMORY[0x19402EEEC](self->_lock);
  v5 = (void *)CFDictionaryGetValue(self->_fvdOptions, CFSTR("deviceInfo"));
  if (v5)
  {
    value = v5;
    v6 = v5;
  }
  else
  {
    value = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(value, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("displaySizeInPixels"));
  CFDictionarySetValue(self->_fvdOptions, CFSTR("deviceInfo"), value);
  MEMORY[0x19402EF04](self->_lock);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);

}

- (CGSize)size
{
  double v3;
  double v4;
  __int128 v5;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetValue();
  FigCFDictionaryGetCGSizeIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  v4 = *((double *)&v5 + 1);
  v3 = *(double *)&v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setMinFrameInterval:(id *)a3
{
  CMTime v4;

  v4 = *(CMTime *)a3;
  CMTimeGetSeconds(&v4);
  MEMORY[0x19402EEEC](self->_lock);
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  MEMORY[0x19402EF04](self->_lock);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameInterval
{
  MEMORY[0x19402EEEC](self->_lock, a3);
  FigCFDictionaryGetInt32IfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 60);
}

- (void)setPixelFormat:(unsigned int)a3
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionarySetInt();
  JUMPOUT(0x19402EF04);
}

- (unsigned)pixelFormat
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetInt32IfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

- (void)setPreset:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFString *v7;

  v3 = a3;
  v5 = convertPresetEnumToUsageModeString(a3);
  if (v3 - 7 <= 3)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v5 = 0;
  }
  if (v5)
    v7 = v5;
  else
    v7 = CFSTR("Uncompressed");
  if (!v5)
    v3 = 0;
  MEMORY[0x19402EEEC](self->_lock);
  CFDictionarySetValue(self->_fvdOptions, CFSTR("usage"), v7);
  self->_preset = v3;
  MEMORY[0x19402EF04](self->_lock);
}

- (unint64_t)preset
{
  unint64_t preset;

  MEMORY[0x19402EEEC](self->_lock, a2);
  preset = self->_preset;
  MEMORY[0x19402EF04](self->_lock);
  return preset;
}

- (void)setNumOfIdleFrames:(int64_t)a3
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionarySetInt();
  JUMPOUT(0x19402EF04);
}

- (int64_t)numOfIdleFrames
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetIntIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

- (void)setImagePoolSize:(int64_t)a3
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionarySetInt();
  JUMPOUT(0x19402EF04);
}

- (int64_t)imagePoolSize
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetIntIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

- (void)setClientName:(id)a3
{
  __CFDictionary *fvdOptions;

  MEMORY[0x19402EEEC](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (a3)
    CFDictionarySetValue(fvdOptions, CFSTR("clientName"), a3);
  else
    CFDictionaryRemoveValue(fvdOptions, CFSTR("clientName"));
  JUMPOUT(0x19402EF04);
}

- (NSString)clientName
{
  NSString *Value;

  MEMORY[0x19402EEEC](self->_lock, a2);
  Value = (NSString *)FigCFDictionaryGetValue();
  MEMORY[0x19402EF04](self->_lock);
  return Value;
}

- (void)setContentIDs:(id)a3
{
  __CFDictionary *fvdOptions;

  MEMORY[0x19402EEEC](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (a3)
    CFDictionarySetValue(fvdOptions, CFSTR("ContentIDs"), a3);
  else
    CFDictionaryRemoveValue(fvdOptions, CFSTR("ContentIDs"));
  FigCFDictionarySetInt32();
  JUMPOUT(0x19402EF04);
}

- (id)contentIDs
{
  void *Value;

  MEMORY[0x19402EEEC](self->_lock, a2);
  Value = (void *)FigCFDictionaryGetValue();
  MEMORY[0x19402EF04](self->_lock);
  return Value;
}

- (void)setIncludePrivateContent:(BOOL)a3
{
  _BOOL4 v3;
  __CFDictionary *fvdOptions;

  v3 = a3;
  MEMORY[0x19402EEEC](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (v3)
    CFDictionarySetValue(fvdOptions, CFSTR("IncludePrivateContent"), (const void *)*MEMORY[0x1E0C9AE50]);
  else
    CFDictionaryRemoveValue(fvdOptions, CFSTR("IncludePrivateContent"));
  JUMPOUT(0x19402EF04);
}

- (BOOL)includePrivateContent
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetBooleanIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

- (void)setDisplayID:(int64_t)a3
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionarySetInt32();
  JUMPOUT(0x19402EF04);
}

- (int64_t)displayID
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetIntIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 1;
}

@end
