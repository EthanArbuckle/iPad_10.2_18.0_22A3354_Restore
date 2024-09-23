@implementation SHMediaTimeline

- (void)dealloc
{
  objc_super v3;

  -[SHMediaTimeline stopGenerating](self, "stopGenerating");
  v3.receiver = self;
  v3.super_class = (Class)SHMediaTimeline;
  -[SHMediaTimeline dealloc](&v3, sel_dealloc);
}

- (SHMediaTimeline)initWithMatch:(id)a3
{
  id v4;
  SHMediaTimeline *v5;
  uint64_t v6;
  NSArray *mediaItems;
  SHSignature *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SHSignature *querySignature;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SHMediaTimeline;
  v5 = -[SHMediaTimeline init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mediaItems");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaItems = v5->_mediaItems;
    v5->_mediaItems = (NSArray *)v6;

    v8 = [SHSignature alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "querySignature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "querySignature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "time");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SHSignature initWithID:dataRepresentation:startTime:error:](v8, "initWithID:dataRepresentation:startTime:error:", v9, v11, v13, 0);
    querySignature = v5->_querySignature;
    v5->_querySignature = (SHSignature *)v14;

  }
  return v5;
}

- (BOOL)finished
{
  void *v2;
  BOOL v3;

  -[SHMediaTimeline timeToNextMediaItemScopeChange](self, "timeToNextMediaItemScopeChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)startTimerForNextEvent
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[SHMediaTimeline cancelTimerSource](self, "cancelTimerSource");
  -[SHMediaTimeline timeToNextMediaItemScopeChange](self, "timeToNextMediaItemScopeChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v4);
    -[SHMediaTimeline setTimerDispatchSource:](self, "setTimerDispatchSource:", v5);

    objc_msgSend(v3, "doubleValue");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    objc_initWeak(&location, self);
    -[SHMediaTimeline timerDispatchSource](self, "timerDispatchSource");
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __41__SHMediaTimeline_startTimerForNextEvent__block_invoke;
    v14 = &unk_24D9B7B88;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v8, &v11);

    -[SHMediaTimeline timerDispatchSource](self, "timerDispatchSource", v11, v12, v13, v14);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v9, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

    -[SHMediaTimeline timerDispatchSource](self, "timerDispatchSource");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __41__SHMediaTimeline_startTimerForNextEvent__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "inScopeMediaItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mediaTimeline:hasUpdatedInScopeMediaItems:", WeakRetained, v2);

  objc_msgSend(WeakRetained, "startTimerForNextEvent");
}

- (void)cancelTimerSource
{
  void *v3;
  NSObject *v4;

  -[SHMediaTimeline timerDispatchSource](self, "timerDispatchSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SHMediaTimeline timerDispatchSource](self, "timerDispatchSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
}

- (NSNumber)timeToNextMediaItemScopeChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SHMediaTimeline mediaItems](self, "mediaItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_opt_class(), "countdownForMatchedMediaItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        if (v8 > 0.0)
        {
          v9 = v8;
          if (!v5 || (objc_msgSend(v5, "doubleValue"), v9 < v10))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
            v11 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v11;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSArray)inScopeMediaItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[SHMediaTimeline mediaItems](self, "mediaItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SHMediaTimeline mediaItems](self, "mediaItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "predictedCurrentMatchOffset");
        if (objc_msgSend(v11, "describesOffset:"))
        {
          objc_msgSend(v11, "frequencySkew");
          if (objc_msgSend(v11, "describesFrequencySkew:", v12))
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count"))
  {
    v13 = (void *)objc_opt_class();
    -[SHMediaTimeline mediaItems](self, "mediaItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "blankMediaItemWhenNothingIsInScope:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  v16 = (void *)objc_msgSend(v5, "copy");
  -[SHMediaTimeline sortMediaItems:](self, "sortMediaItems:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (id)sortMediaItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SHMediaTimeline_sortMediaItems___block_invoke;
  v4[3] = &unk_24D9B7BB0;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __34__SHMediaTimeline_sortMediaItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "timeRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

  }
  else
  {
    objc_msgSend(v6, "timeRanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      v14 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v5, "timeRanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "earliestInscopeRangeForMatchedMediaItem:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "earliestInscopeRangeForMatchedMediaItem:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

  }
  else
  {
    v14 = 1;
  }
LABEL_8:

  return v14;
}

- (id)earliestInscopeRangeForMatchedMediaItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "timeRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "lowerBound");
        if (v11 < v8)
        {
          objc_msgSend(v3, "predictedCurrentMatchOffset");
          if (objc_msgSend(v10, "contains:"))
          {
            objc_msgSend(v10, "lowerBound");
            v8 = v12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.79769313e308;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)blankMediaItemWhenNothingIsInScope:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SHMatchedMediaItem *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("sh_matchOffset");
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "matchOffset");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("sh_speedSkew");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "speedSkew");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v15[2] = CFSTR("sh_frequencySkew");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "frequencySkew");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  v15[3] = CFSTR("sh_score");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "matchScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  v15[4] = CFSTR("sh_audioStartDate");
  objc_msgSend(v3, "audioStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SHMatchedMediaItem initWithMatchedMediaItemDictionary:]([SHMatchedMediaItem alloc], "initWithMatchedMediaItemDictionary:", v12);
  return v13;
}

+ (double)countdownForMatchedMediaItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "predictedCurrentMatchOffset");
  v6 = v5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "timeRanges", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(a1, "nextEventForRange:atMatchOffset:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v6);
        if (v13 > 0.0)
        {
          v14 = v13;
          if (!v10 || (objc_msgSend(v10, "doubleValue"), v14 < v15))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
            v16 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v16;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);

    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v18 = v17;
      goto LABEL_19;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "timeRanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v4, "timeRanges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "upperBound");
    v18 = v22 - v6;

  }
  else
  {
    v18 = 0.0;
  }

LABEL_19:
  return v18;
}

+ (double)nextEventForRange:(id)a3 atMatchOffset:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  v5 = a3;
  objc_msgSend(v5, "lowerBound");
  v7 = v6 - a4;
  objc_msgSend(v5, "upperBound");
  v9 = v8;

  result = v9 - a4;
  if (v7 >= 0.0)
    return v7;
  return result;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (SHMediaTimelineDelegate)delegate
{
  return (SHMediaTimelineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSignature)querySignature
{
  return self->_querySignature;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (OS_dispatch_source)timerDispatchSource
{
  return self->_timerDispatchSource;
}

- (void)setTimerDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerDispatchSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDispatchSource, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_querySignature, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
