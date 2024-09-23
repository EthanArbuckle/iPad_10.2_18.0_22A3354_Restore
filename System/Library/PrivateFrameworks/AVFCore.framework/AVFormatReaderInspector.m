@implementation AVFormatReaderInspector

- (AVFormatReaderInspector)initWithFormatReader:(OpaqueFigFormatReader *)a3
{
  AVFormatReaderInspector *v4;
  AVFormatReaderInspector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVFormatReaderInspector;
  v4 = -[AVFormatReaderInspector init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      -[AVFormatReaderInspector _setFormatReader:](v4, "_setFormatReader:", a3);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AVFormatReaderInspector _setFormatReader:](self, "_setFormatReader:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVFormatReaderInspector;
  -[AVFormatReaderInspector dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigFormatReader *v5;
  OpaqueFigFormatReader *v6;
  OpaqueFigFormatReader *v7;
  BOOL v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  v6 = (OpaqueFigFormatReader *)objc_msgSend(a3, "_copyFormatReader");
  v7 = v6;
  v8 = v5 == v6;
  if (v5 != v6 && v5 && v6)
  {
    v8 = CFEqual(v5, v6) != 0;
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  CFRelease(v5);
LABEL_9:
  if (v7)
    CFRelease(v7);
  return v8;
}

- (unint64_t)hash
{
  OpaqueFigFormatReader *v3;
  OpaqueFigFormatReader *v4;
  CFHashCode v5;
  objc_super v7;

  v3 = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  if (v3)
  {
    v4 = v3;
    v5 = CFHash(v3);
    CFRelease(v4);
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVFormatReaderInspector;
    return -[AVFormatReaderInspector hash](&v7, sel_hash);
  }
}

- (void)_setFormatReader:(OpaqueFigFormatReader *)a3
{
  OpaqueFigFormatReader *formatReader;

  if (a3)
    CFRetain(a3);
  formatReader = self->_formatReader;
  if (formatReader)
    CFRelease(formatReader);
  self->_formatReader = a3;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  OpaqueFigFormatReader *result;

  result = self->_formatReader;
  if (result)
    return (OpaqueFigFormatReader *)CFRetain(result);
  return result;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  void *result;
  void *v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, __CFString *, _QWORD, void **);
  void *v8;

  v8 = 0;
  result = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  if (result)
  {
    v5 = result;
    FigBaseObject = FigFormatReaderGetFigBaseObject();
    v7 = *(void (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v7)
      v7(FigBaseObject, a3, *MEMORY[0x1E0C9AE00], &v8);
    CFRelease(v5);
    return v8;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD *v6;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[AVFormatReaderInspector providesPreciseDurationAndTiming](self, "providesPreciseDurationAndTiming");
  if ((_DWORD)result)
  {
    if (self)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CC42B8];
      return -[AVFigObjectInspector _timeForProperty:](self, "_timeForProperty:", *v6);
    }
  }
  else if (self)
  {
    v6 = (_QWORD *)MEMORY[0x1E0CC42C0];
    return -[AVFigObjectInspector _timeForProperty:](self, "_timeForProperty:", *v6);
  }
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (float)preferredRate
{
  double v2;
  float result;

  LODWORD(v2) = 1.0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC4300], v2);
  return result;
}

- (float)preferredVolume
{
  double v2;
  float result;

  LODWORD(v2) = 1.0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC4310], v2);
  return result;
}

- (float)preferredSoundCheckVolumeNormalization
{
  double v2;
  float result;

  LODWORD(v2) = 0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC4340], v2);
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransformForProperty:](self, "_affineTransformForProperty:", *MEMORY[0x1E0CC42F0]);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)AVFormatReaderInspector;
  -[AVAssetInspector naturalSize](&v4, sel_naturalSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)naturalTimeScale
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC4320]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC4318]) != 0;
}

- (int64_t)trackCount
{
  int64_t result;
  const void *v3;
  void (*v4)(const void *, int64_t *);
  int64_t v5;

  v5 = 0;
  result = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  if (result)
  {
    v3 = (const void *)result;
    v4 = *(void (**)(const void *, int64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v4)
      v4(v3, &v5);
    CFRelease(v3);
    return v5;
  }
  return result;
}

- (id)alternateTrackGroups
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC42A0]);
}

- (id)trackReferences
{
  return -[AVFigObjectInspector _dictionaryForProperty:](self, "_dictionaryForProperty:", *MEMORY[0x1E0CC4338]);
}

- (id)lyrics
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC42C8]);
}

- (id)commonMetadata
{
  void *v3;
  OpaqueFigFormatReader *v4;
  OpaqueFigFormatReader *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CFTypeRef cf;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  cf = 0;
  v4 = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  if (v4)
  {
    v5 = v4;
    if (!FigMetadataCopyMovieCommonMetadata())
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = (void *)cf;
      v7 = objc_msgSend((id)cf, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v6);
            v11 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
            if (v11)
              objc_msgSend(v3, "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v8);
      }
    }
    CFRelease(v5);
    if (cf)
      CFRelease(cf);
  }
  return v3;
}

- (id)availableMetadataFormats
{
  OpaqueFigFormatReader *v2;
  uint64_t FigBaseObject;
  unsigned int (*v4)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  CFArrayRef theArray;

  v2 = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  cf = 0;
  theArray = 0;
  if (!v2)
    goto LABEL_16;
  FigBaseObject = FigFormatReaderGetFigBaseObject();
  v4 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (!v4)
    goto LABEL_19;
  v5 = *MEMORY[0x1E0C9AE00];
  if (v4(FigBaseObject, *MEMORY[0x1E0CC42D8], *MEMORY[0x1E0C9AE00], &theArray))
    goto LABEL_19;
  if (!theArray)
  {
    v9 = 0;
    goto LABEL_22;
  }
  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v7 = Count;
    v8 = 0;
    v9 = 0;
    v10 = *MEMORY[0x1E0CC4800];
    do
    {
      CFArrayGetValueAtIndex(theArray, v8);
      v11 = FigMetadataReaderGetFigBaseObject();
      v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48);
      if (v12 && !v12(v11, v10, v5, &cf))
      {
        if (!v9)
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
        objc_msgSend(v9, "addObject:", cf, cf);
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
LABEL_16:
    v9 = 0;
  }
  if (objc_msgSend(v9, "count", cf))
    goto LABEL_20;

LABEL_19:
  v9 = 0;
LABEL_20:
  if (theArray)
    CFRelease(theArray);
LABEL_22:
  if (cf)
    CFRelease(cf);
  if (v2)
    CFRelease(v2);
  if (v9)
    return v9;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)metadataForFormat:(id)a3
{
  OpaqueFigFormatReader *v4;
  OpaqueFigFormatReader *v5;
  void *v6;
  uint64_t FigBaseObject;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  uint64_t v13;
  const void *ValueAtIndex;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  CFArrayRef theArray;

  v4 = -[AVFormatReaderInspector _copyFormatReader](self, "_copyFormatReader");
  v5 = v4;
  v6 = 0;
  cf = 0;
  theArray = 0;
  if (a3 && v4)
  {
    FigBaseObject = FigFormatReaderGetFigBaseObject();
    v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (!v8)
      goto LABEL_14;
    v9 = *MEMORY[0x1E0C9AE00];
    if (v8(FigBaseObject, *MEMORY[0x1E0CC42D8], *MEMORY[0x1E0C9AE00], &theArray))
      goto LABEL_14;
    if (!theArray)
    {
      v6 = 0;
      goto LABEL_17;
    }
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_14:
      v6 = 0;
    }
    else
    {
      v11 = Count;
      v12 = 0;
      v13 = *MEMORY[0x1E0CC4800];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v12);
        v15 = FigMetadataReaderGetFigBaseObject();
        v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
        if (v16)
        {
          if (!v16(v15, v13, v9, &cf) && objc_msgSend(a3, "isEqualToString:", cf))
            break;
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (v11 == ++v12)
          goto LABEL_14;
      }
      v6 = (void *)-[AVMetadataEnumerator allObjects](+[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:](AVMetadataEnumerator, "metadataEnumeratorWithMetadataReader:", ValueAtIndex), "allObjects");
    }
  }
  if (theArray)
    CFRelease(theArray);
LABEL_17:
  if (cf)
    CFRelease(cf);
  if (v5)
    CFRelease(v5);
  if (!v6)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v6;
}

- (BOOL)_hasQTSaveRestriction
{
  id v3;
  NSArray *v4;
  int v6;

  if (!self->didCheckForSaveRestriction)
  {
    if (objc_msgSend(-[AVFormatReaderInspector availableMetadataFormats](self, "availableMetadataFormats"), "containsObject:", CFSTR("com.apple.quicktime.udta")))
    {
      v3 = -[AVFormatReaderInspector metadataForFormat:](self, "metadataForFormat:", CFSTR("com.apple.quicktime.udta"));
      v4 = +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1853055350), CFSTR("udta"));
      if (-[NSArray count](v4, "count"))
      {
        v6 = 0;
        objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "dataValue"), "getBytes:length:", &v6, 4);
        if ((v6 & 0x1000000) != 0)
          self->hasSaveRestriction = 1;
      }
    }
    self->didCheckForSaveRestriction = 1;
  }
  return self->hasSaveRestriction;
}

- (BOOL)isExportable
{
  return !-[AVFormatReaderInspector _hasQTSaveRestriction](self, "_hasQTSaveRestriction");
}

- (BOOL)isReadable
{
  return !-[AVFormatReaderInspector _hasQTSaveRestriction](self, "_hasQTSaveRestriction");
}

- (BOOL)isComposable
{
  return !-[AVFormatReaderInspector _hasQTSaveRestriction](self, "_hasQTSaveRestriction");
}

- (BOOL)canContainFragments
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC42B0]) != 0;
}

- (BOOL)containsFragments
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC42A8]) != 0;
}

- (int64_t)firstFragmentSequenceNumber
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC39C0]);
}

- (int64_t)fragmentCount
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC39D8]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  if (self)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:](self, "_timeForProperty:", *MEMORY[0x1E0CC42E0]);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

@end
