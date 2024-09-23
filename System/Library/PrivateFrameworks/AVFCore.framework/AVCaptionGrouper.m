@implementation AVCaptionGrouper

- (AVCaptionGrouper)init
{
  AVCaptionGrouper *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptionGrouper;
  v2 = -[AVCaptionGrouper init](&v5, sel_init);
  if (v2)
  {
    v2->_captionCollector = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v2->_captionGroupStartTime.value = *MEMORY[0x1E0CA2E18];
    v2->_captionGroupStartTime.epoch = *(_QWORD *)(v3 + 16);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptionGrouper;
  -[AVCaptionGrouper dealloc](&v3, sel_dealloc);
}

- (void)addCaption:(AVCaption *)input
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_captionGroupStartTime;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if ((self->_captionGroupStartTime.flags & 1) == 0)
  {
    p_captionGroupStartTime = &self->_captionGroupStartTime;
    if (input)
    {
      -[AVCaption timeRange](input, "timeRange");
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
      v6 = 0u;
    }
    *(_OWORD *)&p_captionGroupStartTime->value = v6;
    self->_captionGroupStartTime.epoch = v7;
  }
  -[NSMutableArray addObject:](self->_captionCollector, "addObject:", input, v6, v7, v8);
}

- (NSArray)flushAddedCaptionsIntoGroupsUpToTime:(CMTime *)upToTime
{
  void *v5;
  void *v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_captionGroupStartTime;
  uint64_t v8;
  NSMutableArray *captionCollector;
  char flags;
  NSMutableArray *v11;
  AVCaptionGroup *v12;
  AVCaptionGroup *v13;
  NSMutableArray *v14;
  CMTime *p_duration;
  NSArray *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  CMTimeRange v20;
  CMTime v21;
  CMTime v22;
  CMTime time2;
  _QWORD v24[6];
  CMTimeRange end;
  CMTime start;
  void *v27;
  CMTime v28;
  CMTimeRange v29;

  v17 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_captionCollector, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_captionCollector, "count"));
  p_captionGroupStartTime = &self->_captionGroupStartTime;
  p_duration = &v29.duration;
  v8 = MEMORY[0x1E0C809B0];
  while (1)
  {
    objc_msgSend(v5, "removeAllObjects", p_duration);
    objc_msgSend(v6, "removeAllObjects");
    memset(&v29, 0, sizeof(v29));
    *(_OWORD *)&start.value = *(_OWORD *)&p_captionGroupStartTime->value;
    start.epoch = self->_captionGroupStartTime.epoch;
    *(_OWORD *)&end.start.value = *(_OWORD *)&upToTime->value;
    end.start.epoch = upToTime->epoch;
    CMTimeRangeFromTimeToTime(&v29, &start, &end.start);
    start.value = 0;
    *(_QWORD *)&start.timescale = &start;
    start.epoch = 0x3810000000;
    v27 = &unk_1935931BF;
    memset(&v28, 0, sizeof(v28));
    end = v29;
    CMTimeRangeGetEnd(&v28, &end);
    captionCollector = self->_captionCollector;
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke;
    v24[3] = &unk_1E3034810;
    v24[4] = self;
    v24[5] = &start;
    -[NSMutableArray enumerateObjectsUsingBlock:](captionCollector, "enumerateObjectsUsingBlock:", v24);
    *(_OWORD *)&time2.value = *(_OWORD *)&p_captionGroupStartTime->value;
    time2.epoch = self->_captionGroupStartTime.epoch;
    v22 = *(CMTime *)(*(_QWORD *)&start.timescale + 32);
    CMTimeRangeFromTimeToTime(&end, &time2, &v22);
    v29 = end;
    flags = end.start.flags;
    if ((end.start.flags & 1) != 0
      && (v29.duration.flags & 1) != 0
      && !v29.duration.epoch
      && (v29.duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&end.start.value = *(_OWORD *)&p_duration->value;
      end.start.epoch = p_duration->epoch;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (!CMTimeCompare(&end.start, &time2))
        break;
      flags = v29.start.flags;
    }
    if ((flags & 0x1D) != 1)
      break;
    end = v29;
    CMTimeRangeGetEnd(&v21, &end);
    if ((v21.flags & 0x1D) != 1)
      break;
    v11 = self->_captionCollector;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_2;
    v19[3] = &unk_1E3034838;
    v20 = v29;
    v19[4] = v5;
    -[NSMutableArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v19);
    v12 = [AVCaptionGroup alloc];
    end = v29;
    v13 = -[AVCaptionGroup initWithCaptions:timeRange:](v12, "initWithCaptions:timeRange:", v5, &end);
    -[NSArray addObject:](v17, "addObject:", v13);

    end = v29;
    CMTimeRangeGetEnd(&time2, &end);
    *(_OWORD *)&p_captionGroupStartTime->value = *(_OWORD *)&time2.value;
    self->_captionGroupStartTime.epoch = time2.epoch;
    v14 = self->_captionCollector;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_3;
    v18[3] = &unk_1E3034860;
    v18[4] = self;
    v18[5] = v6;
    -[NSMutableArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v18);
    -[NSMutableArray removeObjectsInArray:](self->_captionCollector, "removeObjectsInArray:", v6);
    _Block_object_dispose(&start, 8);
    if (!-[NSMutableArray count](self->_captionCollector, "count"))
      goto LABEL_13;
  }
  _Block_object_dispose(&start, 8);
LABEL_13:

  return v17;
}

__n128 __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 *v7;
  CMTime *v8;
  uint64_t v9;
  __n128 result;
  uint64_t v11;
  __n128 *v12;
  _BYTE v13[24];
  _BYTE v14[24];
  CMTime time2;
  CMTime time1;
  CMTimeRange range;
  CMTime v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;

  if (a2)
  {
    objc_msgSend(a2, "timeRange");
    *(_OWORD *)&v22.value = v19;
    v22.epoch = v20;
    memset(&v18, 0, sizeof(v18));
    objc_msgSend(a2, "timeRange");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    memset(&v22, 0, sizeof(v22));
    memset(&v18, 0, sizeof(v18));
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v18, &range);
  v4 = *(_QWORD *)(a1 + 32);
  time1 = v22;
  time2 = *(CMTime *)(v4 + 16);
  if (CMTimeCompare(&time1, &time2) < 1)
  {
    v9 = *(_QWORD *)(a1 + 32);
    time1 = v18;
    time2 = *(CMTime *)(v9 + 16);
    if (CMTimeCompare(&time1, &time2) < 1)
      return result;
    v11 = *(_QWORD *)(a1 + 40);
    v5 = a1 + 40;
    time1 = *(CMTime *)(*(_QWORD *)(v11 + 8) + 32);
    time2 = v18;
    v7 = (__n128 *)v13;
    v8 = (CMTime *)v13;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = a1 + 40;
    time1 = *(CMTime *)(*(_QWORD *)(v6 + 8) + 32);
    time2 = v22;
    v7 = (__n128 *)v14;
    v8 = (CMTime *)v14;
  }
  CMTimeMinimum(v8, &time1, &time2);
  v12 = *(__n128 **)(*(_QWORD *)v5 + 8);
  result = *v7;
  v12[2] = *v7;
  v12[3].n128_u64[0] = v7[1].n128_u64[0];
  return result;
}

uint64_t __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_2(uint64_t a1, void *a2)
{
  _OWORD *v4;
  __int128 v5;
  uint64_t result;
  CMTime v7;
  CMTimeRange range;
  CMTimeRange otherRange;
  CMTimeRange v10;

  memset(&v10, 0, sizeof(v10));
  v4 = (_OWORD *)(a1 + 40);
  if (a2)
    objc_msgSend(a2, "timeRange");
  else
    memset(&otherRange, 0, sizeof(otherRange));
  v5 = v4[1];
  *(_OWORD *)&range.start.value = *v4;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = v4[2];
  CMTimeRangeGetIntersection(&v10, &range, &otherRange);
  if ((v10.start.flags & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if ((v10.duration.flags & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (v10.duration.epoch)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (v10.duration.value < 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  range.start = v10.duration;
  v7 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  result = CMTimeCompare(&range.start, &v7);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

uint64_t __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  CMTime v6;
  CMTime time1;
  CMTimeRange range;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  if (a2)
    objc_msgSend(a2, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  CMTimeRangeGetEnd(&v9, &range);
  v4 = *(_QWORD *)(a1 + 32);
  time1 = v9;
  v6 = *(CMTime *)(v4 + 16);
  result = CMTimeCompare(&time1, &v6);
  if ((int)result <= 0)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  return result;
}

@end
