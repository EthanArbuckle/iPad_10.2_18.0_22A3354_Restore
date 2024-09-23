@implementation JFXStillCompositionItem

- (JFXStillCompositionItem)initWithClip:(id)a3 timeScale:(int)a4
{
  JFXStillCompositionItem *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXStillCompositionItem;
  v4 = -[JFXMovieCompositionItem initWithClip:timeScale:](&v7, sel_initWithClip_timeScale_, a3, *(_QWORD *)&a4);
  if (v4)
  {
    +[JFXCompositionItem silenceAsset](JFXCompositionItem, "silenceAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXMovieCompositionItem setAsset:](v4, "setAsset:", v5);

  }
  return v4;
}

- (BOOL)hasVideoContent
{
  return 0;
}

- (BOOL)needSilenceAtEnd
{
  return 1;
}

- (id)videoTrackSegmentsWithDestinationRange:(id *)a3
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v8[3];

  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = *(_OWORD *)&a3->var0.var3;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->var1.var1;
  -[JFXCompositionItem emptyTrackSegmentWithDestinationRange:](self, "emptyTrackSegmentWithDestinationRange:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  CMTimeRange v17;
  CMTime v18;
  CMTimeRange duration;
  CMTime lhs;
  CMTime rhs;
  CMTime time2[2];
  CMTimeRange v23;
  CMTime start;
  CMTimeRange time1;
  CMTime time;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (!-[JFXCompositionItem isFinalClip](self, "isFinalClip"))
  {
    v7 = (void *)MEMORY[0x24BDBCE30];
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.epoch = a3->var3;
    -[JFXCompositionItem emptyTrackSegmentWithDestinationTime:](self, "emptyTrackSegmentWithDestinationTime:", &time1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v12 = (void *)v9;
    goto LABEL_15;
  }
  -[JFXCompositionItem sourceTimeRange](self, "sourceTimeRange");
  v29 = v28;
  memset(&v27, 0, sizeof(v27));
  -[JFXMovieCompositionItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&time, 0, sizeof(time));
  CMTimeConvertScale(&v27, &time, -[JFXCompositionItem timeScale](self, "timeScale"), kCMTimeRoundingMethod_RoundHalfAwayFromZero);

  time1.start = v27;
  time2[0] = v29;
  if ((CMTimeCompare(&time1.start, time2) & 0x80000000) == 0)
  {
    memset(&time1, 0, sizeof(time1));
    CMTimeMake(&start, 0, -[JFXCompositionItem timeScale](self, "timeScale"));
    time2[0] = v29;
    CMTimeRangeMake(&time1, &start, time2);
    v10 = *MEMORY[0x24BDB1C90];
    time2[0] = (CMTime)*a3;
    duration.start = time1.duration;
    CMTimeRangeMake(&v23, time2, &duration.start);
    *(CMTimeRange *)&time2[0].value = time1;
    -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:](self, "segmentWithCharacteristic:sourceRange:destinationRange:", v10, time2, &v23);
    v11 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v11;
    if (v11)
    {
      v30[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_opt_new();
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&time1, 0, sizeof(time1));
  memset(time2, 0, sizeof(time2));
  CMTimeMake(&rhs, 2, -[JFXCompositionItem timeScale](self, "timeScale"));
  duration.start = v27;
  CMTimeAdd(&time2[1], &duration.start, &rhs);
  duration.start = v29;
  lhs = time2[1];
  CMTimeSubtract(&time1.duration, &duration.start, &lhs);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
  time1.start.epoch = a3->var3;
  CMTimeMake(&duration.start, 0, -[JFXCompositionItem timeScale](self, "timeScale"));
  time2[0] = duration.start;
  v13 = objc_alloc(MEMORY[0x24BDB2528]);
  duration = time1;
  v14 = (void *)objc_msgSend(v13, "initWithTimeRange:", &duration);
  if (v14)
    objc_msgSend(v12, "addObject:", v14);
  lhs = (CMTime)*a3;
  v18 = time1.duration;
  CMTimeAdd(&duration.start, &lhs, &v18);
  *(_OWORD *)&a3->var0 = *(_OWORD *)&duration.start.value;
  a3->var3 = duration.start.epoch;
  v15 = *MEMORY[0x24BDB1C90];
  *(_OWORD *)&duration.start.value = *(_OWORD *)&a3->var0;
  duration.start.epoch = a3->var3;
  lhs = time2[1];
  CMTimeRangeMake(&v17, &duration.start, &lhs);
  *(_OWORD *)&duration.start.value = *(_OWORD *)&time2[0].value;
  *(_OWORD *)&duration.start.epoch = *(_OWORD *)&time2[0].epoch;
  *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&time2[1].timescale;
  -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:](self, "segmentWithCharacteristic:sourceRange:destinationRange:", v15, &duration, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v12, "addObject:", v8);
LABEL_15:

  return v12;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[JFXStillCompositionItem audioTrackSegmentsWithDestinationTime:](self, "audioTrackSegmentsWithDestinationTime:", &v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3
{
  __int128 v4;
  CMTimeRange v6;
  CMTime v7;

  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v6.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v6.start.epoch = v4;
  *(_OWORD *)&v6.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v7, &v6);
  -[JFXStillCompositionItem audioTrackSegmentsWithDestinationTime:](self, "audioTrackSegmentsWithDestinationTime:", &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
