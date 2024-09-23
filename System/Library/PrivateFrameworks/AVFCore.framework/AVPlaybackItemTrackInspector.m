@implementation AVPlaybackItemTrackInspector

- (int)trackID
{
  return self->_trackID;
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  int v6;
  _QWORD *v8;
  uint64_t v9;
  const void *v10;
  uint64_t FigBaseObject;
  void (*v12)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  void *v13;
  const __CFNumber *v14;
  BOOL v15;
  CFTypeRef cf;
  objc_super v18;
  int valuePtr;

  v6 = a4;
  valuePtr = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackItemTrackInspector;
  v8 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v18, sel__initWithAsset_trackID_trackIndex_);
  if (v8)
  {
    v9 = objc_msgSend(a3, "_playbackItem");
    if (v9)
    {
      v10 = (const void *)v9;
      if ((a5 & 0x8000000000000000) == 0 && !v6)
      {
        cf = 0;
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v12 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
        if (v12)
        {
          v12(FigBaseObject, *MEMORY[0x1E0CC5388], *MEMORY[0x1E0C9AE00], &cf);
          v13 = (void *)cf;
        }
        else
        {
          v13 = 0;
        }
        if (objc_msgSend(v13, "count", cf) > (unint64_t)a5)
        {
          v14 = (const __CFNumber *)objc_msgSend((id)cf, "objectAtIndex:", a5);
          if (v14)
            CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
        }
        if (cf)
          CFRelease(cf);
      }
      CFRetain(v10);
      v8[4] = v10;
      *((_DWORD *)v8 + 10) = valuePtr;
      v8[6] = (id)objc_msgSend(a3, "_weakReference");
      *((_DWORD *)v8 + 11) = objc_msgSend(v8, "_SInt32ForProperty:", *MEMORY[0x1E0CC5568]);
      v6 = valuePtr;
    }
    if (v8[4])
      v15 = v6 == 0;
    else
      v15 = 1;
    if (v15 || !*((_DWORD *)v8 + 11))
    {

      return 0;
    }
  }
  return v8;
}

- (id)mediaType
{
  int v2;

  v2 = bswap32(self->_mediaType);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), (char)v2, ((__int16)v2 >> 8), (v2 << 8 >> 24), (v2 >> 24));
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  OpaqueFigPlaybackItem *playbackItem;
  uint64_t trackID;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, _QWORD, void **);
  void *v8;

  v8 = 0;
  playbackItem = self->_playbackItem;
  trackID = self->_trackID;
  v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 40);
  if (!v6)
    return 0;
  v6(playbackItem, trackID, a3, *MEMORY[0x1E0C9AE00], &v8);
  return v8;
}

- (BOOL)isEnabled
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC5530]) != 0;
}

- (id)formatDescriptions
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC5550]);
}

- (void)dealloc
{
  OpaqueFigPlaybackItem *playbackItem;
  objc_super v4;

  playbackItem = self->_playbackItem;
  if (playbackItem)
    CFRelease(playbackItem);
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackItemTrackInspector;
  -[AVAssetTrackInspector dealloc](&v4, sel_dealloc);
}

- (id)asset
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject");
}

- (unsigned)_figMediaType
{
  return self->_mediaType;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_playbackItem;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  CMTime v4;
  CMTime start;

  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  v4 = start;
  return ($1CE2C3FC342086196D07C2B4E8C70800 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v4);
}

- (float)estimatedDataRate
{
  float v2;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC5538]);
  return v2 * 8.0;
}

- (float)peakDataRate
{
  return 0.0;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC5518]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC5518]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransformForProperty:](self, "_affineTransformForProperty:", *MEMORY[0x1E0CC5560]);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)samplePresentationTimeForTrackTime:(SEL)a3
{
  *retstr = *a4;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigPlaybackItem *v5;
  OpaqueFigPlaybackItem *v6;
  int v7;
  int v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[AVPlaybackItemTrackInspector _playbackItem](self, "_playbackItem");
    v6 = (OpaqueFigPlaybackItem *)objc_msgSend(a3, "_playbackItem");
    LOBYTE(v7) = 0;
    if (v5)
    {
      if (v6)
      {
        if (v5 == v6 || (v7 = CFEqual(v5, v6)) != 0)
        {
          v8 = -[AVPlaybackItemTrackInspector trackID](self, "trackID");
          LOBYTE(v7) = v8 == objc_msgSend(a3, "trackID");
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  OpaqueFigPlaybackItem *v3;
  objc_super v5;

  v3 = -[AVPlaybackItemTrackInspector _playbackItem](self, "_playbackItem");
  if (v3)
    return CFHash(v3);
  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackItemTrackInspector;
  return -[AVPlaybackItemTrackInspector hash](&v5, sel_hash);
}

@end
