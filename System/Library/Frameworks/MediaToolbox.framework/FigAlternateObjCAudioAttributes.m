@implementation FigAlternateObjCAudioAttributes

- (FigAlternateObjCAudioAttributes)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  FigAlternateObjCAudioAttributes *v4;
  OpaqueFigAlternate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigAlternateObjCAudioAttributes;
  v4 = -[FigAlternateObjCAudioAttributes init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigAlternate *)CFRetain(a3);
    else
      v5 = 0;
    v4->_alternate = v5;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (NSArray)formatIDs
{
  NSArray *AudioFormatIDs;
  NSArray *v4;

  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_formatIDs)
  {
    AudioFormatIDs = (NSArray *)FigAlternateGetAudioFormatIDs((uint64_t)self->_alternate);
    self->_formatIDs = AudioFormatIDs;
    if (!AudioFormatIDs)
    {
      AudioFormatIDs = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
      self->_formatIDs = AudioFormatIDs;
    }
    v4 = AudioFormatIDs;
  }
  MEMORY[0x19402EF04](self->_mutex);
  return self->_formatIDs;
}

- (id)channelCountForMediaOption:(id)a3
{
  const void *v4;

  v4 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MediaSelectionOptionsPersistentID"));
  if (v4)
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, 0));
  else
    return &unk_1E30287F0;
}

- (id)isBinauralMediaOption:(id)a3
{
  const void *v4;
  uint64_t v5;
  unsigned int v7;

  v4 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MediaSelectionOptionsPersistentID"));
  if (!v4)
    return (id)MEMORY[0x1E0C9AAA0];
  v7 = 0;
  if (FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, &v7) == 2)
    v5 = (v7 >> 1) & 1;
  else
    v5 = 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
}

- (id)isImmersiveMediaOption:(id)a3
{
  const void *v4;
  uint64_t v5;
  unsigned int v7;

  v4 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MediaSelectionOptionsPersistentID"));
  if (!v4)
    return (id)MEMORY[0x1E0C9AAA0];
  v7 = 0;
  if (FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, &v7) == 2)
    v5 = (v7 >> 3) & 1;
  else
    v5 = 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
}

- (id)isDownmixMediaOption:(id)a3
{
  const void *v4;
  unsigned int v6;

  v4 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MediaSelectionOptionsPersistentID"));
  if (!v4)
    return (id)MEMORY[0x1E0C9AAA0];
  v6 = 0;
  FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, &v6);
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v6 >> 2) & 1);
}

- (id)sampleRateForMediaOption:(id)a3
{
  const void *v4;

  v4 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MediaSelectionOptionsPersistentID"));
  if (v4)
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", FigAlternateGetAudioSampleRate((uint64_t)self->_alternate, v4));
  else
    return &unk_1E3028820;
}

- (void)dealloc
{
  OpaqueFigAlternate *alternate;
  objc_super v4;

  alternate = self->_alternate;
  if (alternate)
    CFRelease(alternate);

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjCAudioAttributes;
  -[FigAlternateObjCAudioAttributes dealloc](&v4, sel_dealloc);
}

@end
