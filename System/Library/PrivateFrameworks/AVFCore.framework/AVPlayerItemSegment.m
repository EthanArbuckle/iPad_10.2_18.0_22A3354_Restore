@implementation AVPlayerItemSegment

- (id)_initWithFigSegment:(OpaqueFigPlaybackItemSegment *)a3
{
  AVPlayerItemSegment *v4;
  OpaqueFigPlaybackItemSegment *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemSegment;
  v4 = -[AVPlayerItemSegment init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigPlaybackItemSegment *)CFRetain(a3);
    else
      v5 = 0;
    v4->_figSegment = v5;
  }
  return v4;
}

- (void)dealloc
{
  OpaqueFigPlaybackItemSegment *figSegment;
  objc_super v4;

  figSegment = self->_figSegment;
  if (figSegment)
    CFRelease(figSegment);
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemSegment;
  -[AVPlayerItemSegment dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  return (id)(id)CFCopyDescription(self->_figSegment);
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_figSegment);
}

- (int64_t)segmentType
{
  return FigPlaybackItemSegmentGetType();
}

- ($4C6D1E162277694FB76656457146213A)timeMapping
{
  return ($4C6D1E162277694FB76656457146213A *)FigPlaybackItemSegmentGetTimeMapping();
}

- (NSArray)loadedTimeRanges
{
  NSArray *v2;
  void *LoadedTimeRanges;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  CMTimeRange v10;
  CMTimeRange v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  LoadedTimeRanges = (void *)FigPlaybackItemSegmentGetLoadedTimeRanges();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(LoadedTimeRanges, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(LoadedTimeRanges);
        v8 = *(const __CFDictionary **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        memset(&v11, 0, sizeof(v11));
        CMTimeRangeMakeFromDictionary(&v11, v8);
        v10 = v11;
        -[NSArray addObject:](v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v10));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(LoadedTimeRanges, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v2;
}

- (NSDate)startDate
{
  return (NSDate *)(id)objc_msgSend((id)FigPlaybackItemSegmentGetStartDate(), "copy");
}

- (AVPlayerInterstitialEvent)interstitialEvent
{
  return (AVPlayerInterstitialEvent *)(id)FigPlaybackItemSegmentGetInterstitialEvent();
}

- (OpaqueFigPlaybackItemSegment)_figSegment
{
  return self->_figSegment;
}

@end
