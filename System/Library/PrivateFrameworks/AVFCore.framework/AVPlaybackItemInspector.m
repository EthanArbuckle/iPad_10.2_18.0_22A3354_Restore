@implementation AVPlaybackItemInspector

- (AVPlaybackItemInspector)initWithPlaybackItem:(OpaqueFigPlaybackItem *)a3 trackIDs:(id)a4
{
  AVPlaybackItemInspector *v6;
  AVPlaybackItemInspector *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackItemInspector;
  v6 = -[AVPlaybackItemInspector init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      -[AVPlaybackItemInspector _setPlaybackItem:](v6, "_setPlaybackItem:", a3);
      v7->_trackIDs = (NSArray *)a4;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)trackIDs
{
  return self->_trackIDs;
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlaybackItemInspector _setPlaybackItem:](self, "_setPlaybackItem:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackItemInspector;
  -[AVPlaybackItemInspector dealloc](&v3, sel_dealloc);
}

- (void)_setPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  OpaqueFigPlaybackItem *playbackItem;

  if (a3)
    CFRetain(a3);
  playbackItem = self->_playbackItem;
  if (playbackItem)
    CFRelease(playbackItem);
  self->_playbackItem = a3;
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigPlaybackItem *v5;
  uint64_t v6;
  const void *v7;
  BOOL result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVPlaybackItemInspector _playbackItem](self, "_playbackItem");
  v6 = objc_msgSend(a3, "_playbackItem");
  if (v5 == (OpaqueFigPlaybackItem *)v6)
    return 1;
  v7 = (const void *)v6;
  result = 0;
  if (v5)
  {
    if (v7)
      return CFEqual(v5, v7) != 0;
  }
  return result;
}

- (unint64_t)hash
{
  OpaqueFigPlaybackItem *v3;
  objc_super v5;

  v3 = -[AVPlaybackItemInspector _playbackItem](self, "_playbackItem");
  if (v3)
    return CFHash(v3);
  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackItemInspector;
  return -[AVPlaybackItemInspector hash](&v5, sel_hash);
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_playbackItem;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  void *result;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, __CFString *, _QWORD, void **);
  void *v7;

  v7 = 0;
  result = -[AVPlaybackItemInspector _playbackItem](self, "_playbackItem");
  if (result)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(FigBaseObject, a3, *MEMORY[0x1E0C9AE00], &v7);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v5;
  uint64_t (*v6)($3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  result = -[AVPlaybackItemInspector _playbackItem](self, "_playbackItem");
  if (result)
  {
    v5 = result;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)($3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(result->var3 + 16);
    if (v6)
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v6(v5, retstr);
  }
  return result;
}

- (CGSize)naturalSize
{
  OpaqueFigPlaybackItem *v2;
  double v3;
  OpaqueFigPlaybackItem *v4;
  void (*v5)(OpaqueFigPlaybackItem *, char *, uint64_t *, double);
  double v6;
  double v7;
  uint64_t v8;
  CGSize result;

  v2 = -[AVPlaybackItemInspector _playbackItem](self, "_playbackItem");
  v8 = 0;
  v3 = 0.0;
  if (v2)
  {
    v4 = v2;
    v5 = *(void (**)(OpaqueFigPlaybackItem *, char *, uint64_t *, double))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 8);
    v6 = 0.0;
    if (v5)
    {
      v5(v4, (char *)&v8 + 4, &v8, 0.0);
      v6 = *((float *)&v8 + 1);
      v3 = *(float *)&v8;
    }
  }
  else
  {
    v6 = 0.0;
  }
  v7 = v3;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return 0;
}

- (int64_t)trackCount
{
  NSArray *trackIDs;

  if (self->_trackIDs)
    trackIDs = self->_trackIDs;
  else
    trackIDs = -[AVFigObjectInspector _arrayForProperty:](self, "_arrayForProperty:", *MEMORY[0x1E0CC5388]);
  return -[NSArray count](trackIDs, "count");
}

- (id)lyrics
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC51D0]);
}

- (id)commonMetadata
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)availableMetadataFormats
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (id)compatibleTrackForCompositionTrack:(id)a3
{
  return 0;
}

@end
