@implementation AVCompositionTrack

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  _QWORD *v6;
  AVCompositionTrackInternal *v7;
  const void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVCompositionTrack;
  v6 = -[AVAssetTrack _initWithAsset:trackID:trackIndex:](&v10, sel__initWithAsset_trackID_trackIndex_, a3, *(_QWORD *)&a4, a5);
  if (v6)
  {
    v7 = objc_alloc_init(AVCompositionTrackInternal);
    v6[2] = v7;
    if (v7)
    {
      *(_QWORD *)(v6[2] + 8) = objc_msgSend(a3, "_mutableComposition");
      v8 = *(const void **)(v6[2] + 8);
      if (v8)
        CFRetain(v8);
    }
  }
  return v6;
}

- (void)dealloc
{
  AVCompositionTrackInternal *priv;
  OpaqueFigMutableComposition *mutableComposition;
  objc_super v5;

  priv = self->_priv;
  if (priv)
  {
    mutableComposition = priv->mutableComposition;
    if (mutableComposition)
    {
      CFRelease(mutableComposition);
      self->_priv->mutableComposition = 0;
      priv = self->_priv;
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrack;
  -[AVAssetTrack dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p trackID = %d, mediaType = %@, editCount = %d>"), NSStringFromClass(v4), self, -[AVAssetTrack trackID](self, "trackID"), -[AVAssetTrack mediaType](self, "mediaType"), -[NSArray count](-[AVCompositionTrack segments](self, "segments"), "count"));
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return self->_priv->mutableComposition;
}

- (BOOL)isEnabled
{
  OpaqueFigMutableComposition *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  BOOL v10;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v4 = -[AVAssetTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (!v5)
    return 1;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC4848], *MEMORY[0x1E0C9AE00], &cf);
  v7 = cf;
  if (v6)
  {
    v10 = 1;
    if (!cf)
      return v10;
    goto LABEL_8;
  }
  if (!cf)
    return 1;
  v8 = CFGetTypeID(cf);
  TypeID = CFBooleanGetTypeID();
  v7 = cf;
  v10 = 1;
  if (v8 == TypeID && cf)
  {
    v10 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
    v7 = cf;
  }
  if (v7)
LABEL_8:
    CFRelease(v7);
  return v10;
}

- (NSArray)segments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCompositionTrack;
  return -[AVAssetTrack segments](&v3, sel_segments);
}

- (AVCompositionTrackSegment)segmentForTrackTime:(CMTime *)trackTime
{
  CMTime v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrack;
  v4 = *trackTime;
  return (AVCompositionTrackSegment *)-[AVAssetTrack segmentForTrackTime:](&v5, sel_segmentForTrackTime_, &v4);
}

- (NSArray)formatDescriptionReplacements
{
  OpaqueFigMutableComposition *v3;
  uint64_t v4;
  unsigned __int16 (*v5)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFArrayRef *);
  int v6;
  CFArrayRef v7;
  BOOL v8;
  CFIndex Count;
  NSArray *v10;
  CFArrayRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  AVCompositionTrackFormatDescriptionReplacement *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CFArrayRef theArray;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  theArray = 0;
  v3 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v4 = -[AVAssetTrack trackID](self, "trackID");
  v5 = *(unsigned __int16 (**)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (!v5)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v6 = v5(v3, v4, *MEMORY[0x1E0CC4850], *MEMORY[0x1E0C9AE00], &theArray);
  v7 = theArray;
  if (v6)
    v8 = 1;
  else
    v8 = theArray == 0;
  if (v8 || (Count = CFArrayGetCount(theArray), v7 = theArray, !Count))
  {
    if (v7)
      CFRelease(v7);
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[__CFArray count](theArray, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = theArray;
  v12 = -[__CFArray countByEnumeratingWithState:objects:count:](theArray, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = *MEMORY[0x1E0CC4818];
    v16 = *MEMORY[0x1E0CC4810];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "objectForKey:", v15);
        v20 = objc_msgSend(v18, "objectForKey:", v16);
        if (v19)
          v21 = v20 == 0;
        else
          v21 = 1;
        if (!v21)
        {
          v22 = -[AVCompositionTrackFormatDescriptionReplacement initWithOriginalFormatDescription:andReplacementFormatDescription:]([AVCompositionTrackFormatDescriptionReplacement alloc], "initWithOriginalFormatDescription:andReplacementFormatDescription:", v19, v20);
          -[NSArray addObject:](v10, "addObject:", v22);

        }
      }
      v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v13);
  }
  if (theArray)
    CFRelease(theArray);
  return v10;
}

@end
