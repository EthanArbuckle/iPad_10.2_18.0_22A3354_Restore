@implementation JFXCompositionItem

+ (id)compositionItemWithClip:(id)a3 timeScale:(int)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "mediaType");
  if ((v6 == 1 || v6 == 2) && (v7 = (objc_class *)objc_opt_class()) != 0)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithClip:timeScale:", v5, v4);
  else
    v8 = 0;

  return v8;
}

+ (void)mediaserverdCrashed
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", a1, CFSTR("mediaserverdCrashed"), 0);

  v4 = (void *)sEmptyAsset;
  sEmptyAsset = 0;

}

+ (id)silenceAsset
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)sEmptyAsset;
  if (!sEmptyAsset)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("silence"), CFSTR("mov"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", v6, 0);
        v9 = (void *)sEmptyAsset;
        sEmptyAsset = v8;

      }
    }
    if (sEmptyAsset)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", a1, sel_mediaserverdCrashed, CFSTR("mediaserverdCrashed"), 0);

    }
    v3 = (void *)sEmptyAsset;
  }
  return v3;
}

- (JFXCompositionItem)initWithClip:(id)a3 timeScale:(int)a4
{
  id v6;
  JFXCompositionItem *v7;
  JFXCompositionItem *v8;
  __int128 v9;
  CMTime v11;
  CMTime start;
  CMTimeRange v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JFXCompositionItem;
  v7 = -[JFXCompositionItem init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[JFXCompositionItem setClip:](v7, "setClip:", v6);
    v8->_timeScale = a4;
    CMTimeMake(&start, 0, a4);
    CMTimeMake(&v11, 0, a4);
    CMTimeRangeMake(&v13, &start, &v11);
    v9 = *(_OWORD *)&v13.start.epoch;
    *(_OWORD *)&v8->_sourceTimeRange.start.value = *(_OWORD *)&v13.start.value;
    *(_OWORD *)&v8->_sourceTimeRange.start.epoch = v9;
    *(_OWORD *)&v8->_sourceTimeRange.duration.timescale = *(_OWORD *)&v13.duration.timescale;
    CMTimeMake(&v13.start, (int)objc_msgSend(v6, "duration"), a4);
    *(_OWORD *)&v8->_destinationDuration.value = *(_OWORD *)&v13.start.value;
    v8->_destinationDuration.epoch = v13.start.epoch;
    *(_WORD *)&v8->_isFreezeFrame = 0;
    v8->_speed = 1.0;
    CMTimeMake(&v13.start, 0, a4);
    *(_OWORD *)&v8->_audioStartOffset.value = *(_OWORD *)&v13.start.value;
    v8->_audioStartOffset.epoch = v13.start.epoch;
    CMTimeMake(&v13.start, 0, a4);
    *(_OWORD *)&v8->_audioEndOffset.value = *(_OWORD *)&v13.start.value;
    v8->_audioEndOffset.epoch = v13.start.epoch;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[JFXCompositionItem setClip:](self, "setClip:", 0);
  v3.receiver = self;
  v3.super_class = (Class)JFXCompositionItem;
  -[JFXCompositionItem dealloc](&v3, sel_dealloc);
}

- (BOOL)hasVideoContent
{
  return 0;
}

- (BOOL)needSilenceAtEnd
{
  return 0;
}

- (BOOL)needAudioLoop
{
  return 0;
}

- (id)emptyTrackSegmentWithDestinationRange:(id *)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB2528]), "initWithTimeRange:", v5);
}

- (id)emptyTrackSegmentWithDestinationTime:(id *)a3
{
  _OWORD v4[3];
  __int128 v5;
  _BYTE v6[32];

  v5 = *(_OWORD *)&a3->var0;
  *(_QWORD *)v6 = a3->var3;
  *($95D729B680665BEAEFA1D6FCA8238556 *)&v6[8] = self->_sourceTimeRange.duration;
  v4[0] = v5;
  v4[1] = *(_OWORD *)v6;
  v4[2] = *(_OWORD *)&v6[16];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB2528]), "initWithTimeRange:", v4);
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

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[JFXCompositionItem audioTrackSegmentsWithDestinationTime:](self, "audioTrackSegmentsWithDestinationTime:", &v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v7 = *a3;
  -[JFXCompositionItem emptyTrackSegmentWithDestinationTime:](self, "emptyTrackSegmentWithDestinationTime:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)audioTrackSegmentsLoopedWithDestinationTime:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v7 = *a3;
  -[JFXCompositionItem emptyTrackSegmentWithDestinationTime:](self, "emptyTrackSegmentWithDestinationTime:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  CMTimeRange v9;
  CMTime v10;

  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v9.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v9.start.epoch = v5;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v10, &v9);
  -[JFXCompositionItem emptyTrackSegmentWithDestinationTime:](self, "emptyTrackSegmentWithDestinationTime:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d  %d]"), self->_sourceTimeRange.start.value, self->_sourceTimeRange.duration.value + self->_sourceTimeRange.start.value);
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p> %@ : {\n\tsourceTimeRange start:\t%d\n\tsourceTimeRange end:\t%d\n}"), self, v5, self->_sourceTimeRange.start.value, self->_sourceTimeRange.duration.value + self->_sourceTimeRange.start.value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isFinalClip
{
  return self->_isFinalClip;
}

- (void)setIsFinalClip:(BOOL)a3
{
  self->_isFinalClip = a3;
}

- ($70930193D4F448A53BB9343C0237EB5F)sourceTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setSourceTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_sourceTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_sourceTimeRange.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)destinationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setDestinationDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_destinationDuration.epoch = a3->var3;
  *(_OWORD *)&self->_destinationDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioStartOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setAudioStartOffset:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_audioStartOffset.epoch = a3->var3;
  *(_OWORD *)&self->_audioStartOffset.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioEndOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setAudioEndOffset:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_audioEndOffset.epoch = a3->var3;
  *(_OWORD *)&self->_audioEndOffset.value = v3;
}

- (BOOL)isFreezeFrame
{
  return self->_isFreezeFrame;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
}

- (BOOL)isWaitingForResource
{
  return self->_isWaitingForResource;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (JFXPlayableElement)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
}

@end
