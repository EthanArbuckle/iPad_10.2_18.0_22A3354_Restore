@implementation FigDisplayConfiguration

- (FigDisplayConfiguration)init
{
  FigDisplayConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigDisplayConfiguration;
  v2 = -[FigDisplayConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_fvdOptions = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    CFDictionarySetValue(v2->_fvdOptions, CFSTR("usage"), CFSTR("Uncompressed"));
    v2->_preset = 0;
    CFDictionarySetValue(v2->_fvdOptions, CFSTR("DisplayLabel"), CFSTR("FigScreenCaptureController Display"));
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
  v4.super_class = (Class)FigDisplayConfiguration;
  -[FigDisplayConfiguration dealloc](&v4, sel_dealloc);
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

- (void)setMaxDisplaySize:(CGSize)a3
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

- (CGSize)maxDisplaySize
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

- (void)setRefreshRate:(unsigned int)a3
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  JUMPOUT(0x19402EF04);
}

- (unsigned)refreshRate
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetInt32IfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 60;
}

- (void)setPreset:(unint64_t)a3
{
  __CFString *v5;
  unint64_t v6;
  void *Value;
  id v8;
  id v9;
  void *v10;
  const __CFString **v11;
  const __CFString **v12;
  const void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = convertPresetEnumToUsageModeString(a3);
  if (v5)
    v6 = a3;
  else
    v6 = 0;
  MEMORY[0x19402EEEC](self->_lock);
  if (v6 - 7 <= 3)
  {
    Value = (void *)CFDictionaryGetValue(self->_fvdOptions, CFSTR("deviceInfo"));
    if (Value)
    {
      v8 = Value;
      v9 = Value;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    if (v6 - 9 > 1)
    {
      v15 = CFSTR("HDRMode");
      v16 = CFSTR("HDR10");
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v16;
      v12 = &v15;
    }
    else
    {
      v17 = CFSTR("HDRMode");
      v18[0] = CFSTR("DoVi");
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = (const __CFString **)v18;
      v12 = &v17;
    }
    v13 = (const void *)objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("HDRInfo"));
    CFDictionarySetValue(self->_fvdOptions, CFSTR("HDRInfo"), v13);
    CFDictionarySetValue(self->_fvdOptions, CFSTR("deviceInfo"), v8);

  }
  if (v5)
    v14 = v5;
  else
    v14 = CFSTR("Uncompressed");
  CFDictionarySetValue(self->_fvdOptions, CFSTR("usage"), v14);
  self->_preset = v6;
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

- (void)setClientPID:(int64_t)a3
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  if (a3 < 1)
  {
    CFDictionaryRemoveValue(self->_fvdOptions, CFSTR("clientPID"));
    CFDictionaryRemoveValue(self->_fvdOptions, CFSTR("MirroringMode"));
  }
  else
  {
    FigCFDictionarySetInt();
    FigCFDictionarySetInt();
  }
  JUMPOUT(0x19402EF04);
}

- (int64_t)clientPID
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetIntIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

- (void)setDisplayMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 3 && a3 != 2)
  {
    MEMORY[0x19402EEEC](self->_lock, a2);
    FigCFDictionarySetInt();
    JUMPOUT(0x19402EF04);
  }
}

- (int64_t)displayMode
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetIntIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

- (void)setDisplayLabel:(id)a3
{
  __CFDictionary *fvdOptions;

  MEMORY[0x19402EEEC](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (a3)
    CFDictionarySetValue(fvdOptions, CFSTR("DisplayLabel"), a3);
  else
    CFDictionaryRemoveValue(fvdOptions, CFSTR("DisplayLabel"));
  JUMPOUT(0x19402EF04);
}

- (NSString)displayLabel
{
  NSString *Value;

  MEMORY[0x19402EEEC](self->_lock, a2);
  Value = (NSString *)FigCFDictionaryGetValue();
  MEMORY[0x19402EF04](self->_lock);
  return Value;
}

- (void)setCanvasSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  MEMORY[0x19402EEEC](self->_lock, a2);
  if (width > 0.0 && height > 0.0)
  {
    FigCFDictionarySetInt();
    FigCFDictionarySetInt();
  }
  JUMPOUT(0x19402EF04);
}

- (CGSize)canvasSize
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetInt32IfPresent();
  MEMORY[0x19402EF04](self->_lock);
  v3 = (double)0;
  v4 = (double)0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPreferredUIScaleFactor:(int64_t)a3
{
  void *v5;
  id v6;
  id value;

  MEMORY[0x19402EEEC](self->_lock, a2);
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
  objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("preferredUIScale"));
  CFDictionarySetValue(self->_fvdOptions, CFSTR("deviceInfo"), value);
  MEMORY[0x19402EF04](self->_lock);

}

- (int64_t)preferredUIScaleFactor
{
  MEMORY[0x19402EEEC](self->_lock, a2);
  FigCFDictionaryGetValue();
  FigCFDictionaryGetIntIfPresent();
  MEMORY[0x19402EF04](self->_lock);
  return 0;
}

@end
