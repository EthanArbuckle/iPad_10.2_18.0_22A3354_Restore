@implementation AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange

uint64_t __AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __int128 v6;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  __int128 v9;
  uint64_t result;
  CMTimeRange v11;
  CMTime time1;
  CMTimeRange v13;
  CMTimeRange v14;
  CMTimeRange v15;
  CMTimeRange time2;
  CMTimeRange v17;
  CMTime start;
  CMTime rhs;
  CMTime v20;
  CMTimeRange range;
  CMTime v22;
  CMTimeRange v23;
  __int128 v24;
  __int128 v25;
  CMTimeScale timescale;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  memset(&v23, 0, sizeof(v23));
  if (a2)
    objc_msgSend(a2, "timeRange");
  memset(&v22, 0, sizeof(v22));
  range = v23;
  CMTimeRangeGetEnd(&v22, &range);
  v6 = *(_OWORD *)(a1 + 48);
  v24 = *(_OWORD *)(a1 + 32);
  v25 = v6;
  flags = *(_DWORD *)(a1 + 68);
  timescale = *(_DWORD *)(a1 + 64);
  epoch = *(_QWORD *)(a1 + 72);
  memset(&v20, 0, sizeof(v20));
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&range.start.epoch = v9;
  range.duration.timescale = *(_DWORD *)(a1 + 64);
  range.duration.flags = flags;
  range.duration.epoch = epoch;
  CMTimeRangeGetEnd(&v20, &range);
  range.start = v22;
  *(_OWORD *)&time2.start.value = v24;
  time2.start.epoch = v25;
  if (CMTimeCompare(&range.start, &time2.start) >= 1)
  {
    memset(&range, 0, 24);
    time2.start = v22;
    *(_OWORD *)&rhs.value = v24;
    rhs.epoch = v25;
    CMTimeSubtract(&range.start, &time2.start, &rhs);
    *(_OWORD *)&time2.start.value = *(_OWORD *)&range.start.value;
    time2.start.epoch = range.start.epoch;
    *(_OWORD *)&rhs.value = AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_slopTime;
    rhs.epoch = 0;
    if (CMTimeCompare(&time2.start, &rhs) <= 0)
    {
      v24 = *(_OWORD *)&v22.value;
      *(_QWORD *)&v25 = v22.epoch;
      rhs.value = *((_QWORD *)&v25 + 1);
      rhs.timescale = timescale;
      rhs.flags = flags;
      rhs.epoch = epoch;
      start = range.start;
      CMTimeSubtract(&time2.start, &rhs, &start);
      *((_QWORD *)&v25 + 1) = time2.start.value;
      flags = time2.start.flags;
      timescale = time2.start.timescale;
      epoch = time2.start.epoch;
    }
  }
  range.start = v20;
  *(_OWORD *)&time2.start.value = *(_OWORD *)&v23.start.value;
  time2.start.epoch = v23.start.epoch;
  if (CMTimeCompare(&range.start, &time2.start) >= 1)
  {
    memset(&time2, 0, 24);
    range.start = v20;
    rhs = v23.start;
    CMTimeSubtract(&time2.start, &range.start, &rhs);
    *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
    range.start.epoch = time2.start.epoch;
    *(_OWORD *)&rhs.value = AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_slopTime;
    rhs.epoch = 0;
    if (CMTimeCompare(&range.start, &rhs) <= 0)
    {
      rhs.value = *((_QWORD *)&v25 + 1);
      rhs.timescale = timescale;
      rhs.flags = flags;
      rhs.epoch = epoch;
      start = time2.start;
      CMTimeSubtract(&range.start, &rhs, &start);
      flags = range.start.flags;
      timescale = range.start.timescale;
      *((_QWORD *)&v25 + 1) = range.start.value;
      epoch = range.start.epoch;
      *(_OWORD *)&range.start.value = v24;
      *(_OWORD *)&range.start.epoch = v25;
      range.duration.timescale = timescale;
      range.duration.flags = flags;
      range.duration.epoch = epoch;
      CMTimeRangeGetEnd(&rhs, &range);
      v20 = rhs;
    }
  }
  range = v23;
  *(_OWORD *)&time2.start.value = v24;
  *(_OWORD *)&time2.start.epoch = v25;
  time2.duration.timescale = timescale;
  time2.duration.flags = flags;
  time2.duration.epoch = epoch;
  CMTimeRangeGetIntersection(&v17, &range, &time2);
  if ((v17.start.flags & 1) != 0)
  {
    range = v23;
    *(_OWORD *)&time2.start.value = v24;
    *(_OWORD *)&time2.start.epoch = v25;
    time2.duration.timescale = timescale;
    time2.duration.flags = flags;
    time2.duration.epoch = epoch;
    CMTimeRangeGetIntersection(&v15, &range, &time2);
    if ((v15.duration.flags & 1) != 0)
    {
      range = v23;
      *(_OWORD *)&time2.start.value = v24;
      *(_OWORD *)&time2.start.epoch = v25;
      time2.duration.timescale = timescale;
      time2.duration.flags = flags;
      time2.duration.epoch = epoch;
      CMTimeRangeGetIntersection(&v14, &range, &time2);
      if (!v14.duration.epoch)
      {
        range = v23;
        *(_OWORD *)&time2.start.value = v24;
        *(_OWORD *)&time2.start.epoch = v25;
        time2.duration.timescale = timescale;
        time2.duration.flags = flags;
        time2.duration.epoch = epoch;
        CMTimeRangeGetIntersection(&v13, &range, &time2);
        if ((v13.duration.value & 0x8000000000000000) == 0)
        {
          range = v23;
          *(_OWORD *)&time2.start.value = v24;
          *(_OWORD *)&time2.start.epoch = v25;
          time2.duration.timescale = timescale;
          time2.duration.flags = flags;
          time2.duration.epoch = epoch;
          CMTimeRangeGetIntersection(&v11, &range, &time2);
          time1 = v11.duration;
          *(_OWORD *)&range.start.value = *MEMORY[0x1E0CA2E68];
          range.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          if (!CMTimeCompare(&time1, &range.start))
          {
            range.start = v20;
            *(_OWORD *)&time2.start.value = *(_OWORD *)&v23.start.value;
            time2.start.epoch = v23.start.epoch;
            if (CMTimeCompare(&range.start, &time2.start) <= 0)
            {
              result = 0;
              *a4 = 1;
              return result;
            }
            return 0;
          }
        }
      }
    }
  }
  if ((~flags & 5) == 0)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&v23.start.value;
    range.start.epoch = v23.start.epoch;
    *(_OWORD *)&time2.start.value = v24;
    time2.start.epoch = v25;
    if (CMTimeCompare(&range.start, &time2.start) > 0)
      return 0;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&v23.start.value;
  range.start.epoch = v23.start.epoch;
  *(_OWORD *)&time2.start.value = v24;
  time2.start.epoch = v25;
  result = CMTimeCompare(&range.start, &time2.start);
  if ((_DWORD)result)
  {
    if ((~v23.duration.flags & 5) == 0)
    {
      *(_OWORD *)&range.start.value = v24;
      range.start.epoch = v25;
      *(_OWORD *)&time2.start.value = *(_OWORD *)&v23.start.value;
      time2.start.epoch = v23.start.epoch;
      if (CMTimeCompare(&range.start, &time2.start) > 0)
        return 0;
    }
    return 1;
  }
  return result;
}

@end
