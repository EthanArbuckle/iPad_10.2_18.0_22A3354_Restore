@implementation AVPlayerItemIntegratedTimelineSnapshot

- (AVPlayerItemIntegratedTimelineSnapshot)initWithSegments:(id)a3 duration:(id *)a4 currentTime:(id *)a5 currentDate:(id)a6 currentSegment:(id)a7
{
  char *v12;
  int64_t var3;
  __int128 v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItemIntegratedTimelineSnapshot;
  v12 = -[AVPlayerItemIntegratedTimelineSnapshot init](&v16, sel_init);
  if (v12)
  {
    *((_QWORD *)v12 + 9) = objc_msgSend(a3, "copy");
    var3 = a4->var3;
    *(_OWORD *)(v12 + 8) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v12 + 3) = var3;
    v14 = *(_OWORD *)&a5->var0;
    *((_QWORD *)v12 + 6) = a5->var3;
    *((_OWORD *)v12 + 2) = v14;
    *((_QWORD *)v12 + 7) = objc_msgSend(a6, "copy");
    *((_QWORD *)v12 + 8) = objc_msgSend(a7, "copy");
  }
  return (AVPlayerItemIntegratedTimelineSnapshot *)v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemIntegratedTimelineSnapshot;
  -[AVPlayerItemIntegratedTimelineSnapshot dealloc](&v3, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (NSDate)currentDate
{
  return (NSDate *)(id)-[NSDate copy](self->_currentDate, "copy");
}

- (AVPlayerItemSegment)currentSegment
{
  return (AVPlayerItemSegment *)(id)-[AVPlayerItemSegment copy](self->_currentSegment, "copy");
}

- (NSArray)segments
{
  return (NSArray *)(id)-[NSArray copy](self->_segments, "copy");
}

- (void)mapTime:(id *)a3 toSegment:(id *)a4 atSegmentOffset:(id *)a5
{
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CMTimeEpoch epoch;
  uint64_t v15;
  CMTime v16[5];
  CMTime rhs;
  CMTime time;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTimeRange v22;
  CMTimeRange range;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = -[AVPlayerItemIntegratedTimelineSnapshot segments](self, "segments");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
      if (v13)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "timeMapping");
      }
      else
      {
        v21 = 0u;
        memset(&v22, 0, sizeof(v22));
        v19 = 0u;
        v20 = 0u;
      }
      range = v22;
      time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time))
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v13 = 0;
  }
  if (a4)
    *a4 = (id)objc_msgSend(v13, "copy");
  if (a5)
  {
    if (v13)
    {
      objc_msgSend(v13, "timeMapping");
      rhs = *(CMTime *)&v16[3].timescale;
      v16[0] = (CMTime)*a3;
      CMTimeSubtract(&time, v16, &rhs);
      *(_OWORD *)&a5->var0 = *(_OWORD *)&time.value;
      epoch = time.epoch;
    }
    else
    {
      v15 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&a5->var0 = *MEMORY[0x1E0CA2E18];
      epoch = *(_QWORD *)(v15 + 16);
    }
    a5->var3 = epoch;
  }
}

@end
