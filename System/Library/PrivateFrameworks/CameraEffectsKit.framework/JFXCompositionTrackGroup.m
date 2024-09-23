@implementation JFXCompositionTrackGroup

- (JFXCompositionTrackGroup)initWithLabel:(id)a3 timeScale:(int)a4
{
  id v6;
  JFXCompositionTrackGroup *v7;
  JFXCompositionTrackGroup *v8;
  NSMutableArray *v9;
  NSMutableArray *videoSegments;
  NSMutableArray *v11;
  NSMutableArray *audioSegments;
  uint64_t v13;
  __int128 v14;
  int64_t v15;
  CMTime v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JFXCompositionTrackGroup;
  v7 = -[JFXCompositionTrackGroup init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    -[JFXCompositionTrackGroup setLabel:](v7, "setLabel:", v6);
    CMTimeMake(&v17, 0, a4);
    v8->_cursor = ($95D729B680665BEAEFA1D6FCA8238556)v17;
    CMTimeMake(&v17, 0, a4);
    v8->_cursorForMovieAudio = ($95D729B680665BEAEFA1D6FCA8238556)v17;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    videoSegments = v8->_videoSegments;
    v8->_videoSegments = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    audioSegments = v8->_audioSegments;
    v8->_audioSegments = v11;

    v13 = MEMORY[0x24BDC0D88];
    v14 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)&v8->_fadeOutStart.value = *MEMORY[0x24BDC0D88];
    v15 = *(_QWORD *)(v13 + 16);
    v8->_fadeOutStart.epoch = v15;
    *(_OWORD *)&v8->_fadeOutDuration.value = v14;
    v8->_fadeOutDuration.epoch = v15;
    v8->_timeScale = a4;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[JFXCompositionTrackGroup setAudioFormatDescription:](self, "setAudioFormatDescription:", 0);
  -[JFXCompositionTrackGroup removeExtraAudioTrackGroups](self, "removeExtraAudioTrackGroups");
  -[JFXCompositionTrackGroup setComposition:](self, "setComposition:", 0);
  v3.receiver = self;
  v3.super_class = (Class)JFXCompositionTrackGroup;
  -[JFXCompositionTrackGroup dealloc](&v3, sel_dealloc);
}

- (BOOL)containsVideoSegments
{
  NSMutableArray *videoSegments;

  if (self->_videoTrack)
  {
    videoSegments = self->_videoSegments;
    if (videoSegments)
      LOBYTE(videoSegments) = -[NSMutableArray count](videoSegments, "count") != 0;
  }
  else
  {
    LOBYTE(videoSegments) = 0;
  }
  return (char)videoSegments;
}

- (BOOL)containsAudioSegments
{
  NSMutableArray *audioSegments;

  if (self->_audioTrack)
  {
    audioSegments = self->_audioSegments;
    if (audioSegments)
      LOBYTE(audioSegments) = -[NSMutableArray count](audioSegments, "count") != 0;
  }
  else
  {
    LOBYTE(audioSegments) = 0;
  }
  return (char)audioSegments;
}

- (BOOL)containsSegments
{
  return -[JFXCompositionTrackGroup containsVideoSegments](self, "containsVideoSegments")
      || -[JFXCompositionTrackGroup containsAudioSegments](self, "containsAudioSegments");
}

- (void)setAudioTrack:(id)a3
{
  AVMutableAudioMixInputParameters *v5;
  AVMutableAudioMixInputParameters *audioParameters;
  NSDictionary *fmTrackInfoDict;
  AVMutableCompositionTrack *v8;

  v8 = (AVMutableCompositionTrack *)a3;
  if (self->_audioTrack != v8)
  {
    objc_storeStrong((id *)&self->_audioTrack, a3);
    objc_msgSend(MEMORY[0x24BDB25A8], "audioMixInputParametersWithTrack:", v8);
    v5 = (AVMutableAudioMixInputParameters *)objc_claimAutoreleasedReturnValue();
    audioParameters = self->_audioParameters;
    self->_audioParameters = v5;

    fmTrackInfoDict = self->_fmTrackInfoDict;
    self->_fmTrackInfoDict = 0;

    -[JFXCompositionTrackGroup removeExtraAudioTrackGroups](self, "removeExtraAudioTrackGroups");
    -[JFXCompositionTrackGroup setSeenSpeedClip:](self, "setSeenSpeedClip:", 0);
    -[JFXCompositionTrackGroup setSeenMoreThanOneASBD:](self, "setSeenMoreThanOneASBD:", 0);
    -[JFXCompositionTrackGroup setAudioFormatDescription:](self, "setAudioFormatDescription:", 0);
  }
  -[JFXCompositionTrackGroup resetVolumeState](self, "resetVolumeState");

}

- (int)usableVideoTrackID
{
  AVMutableCompositionTrack *videoTrack;

  videoTrack = self->_videoTrack;
  if (videoTrack)
    return -[AVMutableCompositionTrack trackID](videoTrack, "trackID");
  else
    return -1;
}

- (int)actualVideoTrackID
{
  return -[AVMutableCompositionTrack trackID](self->_videoTrack, "trackID");
}

+ (id)visualDescriptionForSegments:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char flags;
  CMTimeValue value;
  CMTimeValue v12;
  uint64_t v13;
  uint64_t v14;
  CMTimeValue v15;
  void *v16;
  void *v17;
  void *v18;
  CMTimeValue v20;
  id obj;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTimeRange time;
  CMTime v27;
  CMTime v28;
  CMTimeRange v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        memset(v29, 0, sizeof(v29));
        if (v9)
        {
          objc_msgSend(v9, "timeMapping");
          flags = v29[0].start.flags;
        }
        else
        {
          flags = 0;
        }
        *(_OWORD *)&time.start.value = *(_OWORD *)&v29[1].start.value;
        time.start.epoch = v29[1].start.epoch;
        CMTimeConvertScale(&v28, &time.start, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        value = v28.value;
        time = v29[1];
        CMTimeRangeGetEnd(&v27, &time);
        CMTimeConvertScale(&v25, &v27, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        objc_msgSend(v4, "appendFormat:", CFSTR("\n[%lld\t%lld]"), value, v25.value);
        if ((flags & 1) != 0)
        {
          *(_OWORD *)&time.start.value = *(_OWORD *)&v29[0].start.value;
          time.start.epoch = v29[0].start.epoch;
          CMTimeConvertScale(&v24, &time.start, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          v12 = v24.value;
          time = v29[0];
          CMTimeRangeGetEnd(&v23, &time);
          CMTimeConvertScale(&v22, &v23, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          v13 = v6;
          v14 = v7;
          v15 = v22.value;
          objc_msgSend(v9, "sourceURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v15;
          v7 = v14;
          v6 = v13;
          objc_msgSend(v4, "appendFormat:", CFSTR("\t source -> [%lld\t%lld] (%@)"), v12, v20, v18);

        }
        else
        {
          objc_msgSend(v4, "appendFormat:", CFSTR(" (empty)"));
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *label;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), self->_label);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)-[AVMutableCompositionTrack trackID](self->_videoTrack, "trackID") > 0
    || (int)-[AVMutableCompositionTrack trackID](self->_audioTrack, "trackID") >= 1)
  {
    if ((int)-[AVMutableCompositionTrack trackID](self->_videoTrack, "trackID") >= 1)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = -[AVMutableCompositionTrack trackID](self->_videoTrack, "trackID");
      label = self->_label;
      +[JFXCompositionTrackGroup visualDescriptionForSegments:](JFXCompositionTrackGroup, "visualDescriptionForSegments:", self->_videoSegments);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("ID%d %@-Video: %@\n"), v5, label, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v3, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
    if ((int)-[AVMutableCompositionTrack trackID](self->_audioTrack, "trackID") >= 1)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = -[AVMutableCompositionTrack trackID](self->_audioTrack, "trackID");
      v12 = self->_label;
      +[JFXCompositionTrackGroup visualDescriptionForSegments:](JFXCompositionTrackGroup, "visualDescriptionForSegments:", self->_audioSegments);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("ID%d %@-Audio: %@\n"), v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v3, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v15;
    }
  }
  return v3;
}

- (void)addExtraAudioTrackGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[JFXCompositionTrackGroup extraAudioTrackGroups](self, "extraAudioTrackGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionTrackGroup setExtraAudioTrackGroups:](self, "setExtraAudioTrackGroups:", v6);

  }
  -[JFXCompositionTrackGroup extraAudioTrackGroups](self, "extraAudioTrackGroups");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeExtraAudioTrackGroups
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[JFXCompositionTrackGroup extraAudioTrackGroups](self, "extraAudioTrackGroups", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[JFXCompositionTrackGroup composition](self, "composition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "audioTrack");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeTrack:", v10);

        objc_msgSend(v8, "audioTrack");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSegments:", 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[JFXCompositionTrackGroup setExtraAudioTrackGroups:](self, "setExtraAudioTrackGroups:", 0);
}

- (BOOL)asbd:(opaqueCMFormatDescription *)a3 isEqualTo:(opaqueCMFormatDescription *)a4
{
  return CMAudioFormatDescriptionEqual(a3, a4, 0xDu, 0) != 0;
}

- (void)applyCompositionItem:(id)a3
{
  -[JFXCompositionTrackGroup applyCompositionItem:skipAudio:](self, "applyCompositionItem:skipAudio:", a3, 0);
}

- (void)applyCompositionItem:(id)a3 skipAudio:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_cursor;
  char v8;
  AVMutableCompositionTrack *videoTrack;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CMTimeEpoch v21;
  uint64_t j;
  void *v23;
  __int128 v24;
  id v25;
  void *v26;
  $95D729B680665BEAEFA1D6FCA8238556 *v27;
  id v28;
  id obj;
  __int128 v30;
  _QWORD v31[4];
  CMTime v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  CMTime v38;
  CMTime v39;
  CMTimeRange lhs;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTimeRange v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CMTime time2;
  CMTime v54;
  CMTime v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _OWORD v60[2];
  CMTime rhs;
  CMTimeRange start;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CMTime duration;
  CMTimeRange v68;
  CMTime v69;
  CMTime cursor;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_cursor = &self->_cursor;
  cursor = (CMTime)self->_cursor;
  memset(&v69, 0, sizeof(v69));
  CMTimeMake(&v69, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  if (self->_videoTrack)
  {
    self->_videoTrackInUse = 1;
  }
  else
  {
    v8 = objc_msgSend(v6, "hasVideoContent");
    videoTrack = self->_videoTrack;
    self->_videoTrackInUse = v8;
    if (!videoTrack)
      goto LABEL_18;
  }
  *(_OWORD *)&self->_cursorAtLastVideoInsertion.value = *(_OWORD *)&p_cursor->value;
  self->_cursorAtLastVideoInsertion.epoch = self->_cursor.epoch;
  memset(&v68, 0, sizeof(v68));
  if (v6)
    objc_msgSend(v6, "destinationDuration");
  else
    memset(&duration, 0, sizeof(duration));
  *(_OWORD *)&start.start.value = *(_OWORD *)&self->_cursorAtLastVideoInsertion.value;
  start.start.epoch = self->_cursorAtLastVideoInsertion.epoch;
  CMTimeRangeMake(&v68, &start.start, &duration);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  start = v68;
  objc_msgSend(v6, "videoTrackSegmentsWithDestinationRange:", &start);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v64 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        -[NSMutableArray addObject:](self->_videoSegments, "addObject:", v15);
        if (v15)
        {
          objc_msgSend(v15, "timeMapping");
        }
        else
        {
          memset(v60, 0, sizeof(v60));
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
        }
        rhs = *(CMTime *)((char *)v60 + 8);
        lhs.start = v69;
        CMTimeAdd(&start.start, &lhs.start, &rhs);
        v69 = start.start;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v12);
  }

LABEL_18:
  v16 = objc_msgSend(v6, "isFinalClip");
  if (v16)
    v16 = objc_msgSend(v6, "needSilenceAtEnd");
  if (self->_audioTrack && !v4 | v16)
  {
    if (self->_videoTrack)
      cursor = (CMTime)self->_cursorForMovieAudio;
    memset(&v55, 0, sizeof(v55));
    CMTimeMake(&v55, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
    v54 = cursor;
    -[JFXCompositionTrackGroup lastRampToZeroEnd](self, "lastRampToZeroEnd");
    v68.start = cursor;
    if (CMTimeCompare(&v68.start, &time2) < 0)
      -[JFXCompositionTrackGroup lastRampToZeroEnd](self, "lastRampToZeroEnd");
    v27 = &self->_cursor;
    v28 = v6;
    if ((objc_msgSend(v6, "needAudioLoop") & 1) != 0)
    {
      *(_OWORD *)&v68.start.value = *(_OWORD *)&p_cursor->value;
      v68.start.epoch = self->_cursor.epoch;
      objc_msgSend(v6, "audioTrackSegmentsLoopedWithDestinationTime:", &v68);
    }
    else
    {
      *(_OWORD *)&v68.start.value = *(_OWORD *)&p_cursor->value;
      v68.start.epoch = self->_cursor.epoch;
      start.start = v54;
      objc_msgSend(v6, "audioTrackSegmentsWithDestinationTime:paddedFromTime:", &v68, &start);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v17;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      v30 = *MEMORY[0x24BDC0D88];
      v21 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          v24 = 0uLL;
          memset(&v68, 0, sizeof(v68));
          if (v23)
          {
            objc_msgSend(v23, "timeMapping");
            v24 = 0uLL;
          }
          else
          {
            v47 = 0uLL;
            memset(&v48, 0, sizeof(v48));
            v45 = 0uLL;
            v46 = 0uLL;
          }
          v68 = v48;
          *(_OWORD *)&start.start.epoch = v24;
          *(_OWORD *)&start.duration.timescale = v24;
          *(_OWORD *)&start.start.value = v24;
          lhs.start = cursor;
          v43 = v55;
          CMTimeAdd(&v44, &lhs.start, &v43);
          lhs.start = cursor;
          v43 = v55;
          CMTimeAdd(&v41, &lhs.start, &v43);
          *(_OWORD *)&lhs.start.value = *(_OWORD *)&v68.start.value;
          lhs.start.epoch = v68.start.epoch;
          CMTimeSubtract(&v42, &lhs.start, &v41);
          CMTimeRangeMake(&start, &v44, &v42);
          lhs.start = start.duration;
          *(_OWORD *)&v43.value = v30;
          v43.epoch = v21;
          if (CMTimeCompare(&lhs.start, &v43) >= 1)
          {
            v25 = objc_alloc(MEMORY[0x24BDB2528]);
            lhs = start;
            v26 = (void *)objc_msgSend(v25, "initWithTimeRange:", &lhs);
            -[NSMutableArray addObject:](self->_audioSegments, "addObject:", v26);
            v43 = v55;
            v39 = start.duration;
            CMTimeAdd(&lhs.start, &v43, &v39);
            v55 = lhs.start;

          }
          lhs.start = cursor;
          v43 = v55;
          CMTimeAdd(&v68.start, &lhs.start, &v43);
          -[NSMutableArray addObject:](self->_audioSegments, "addObject:", v23);
          if (self->_videoTrack)
          {
            if (v23)
              goto LABEL_41;
          }
          else
          {
            if (v23)
            {
              objc_msgSend(v23, "timeMapping");
            }
            else
            {
              memset(v37, 0, sizeof(v37));
              v35 = 0u;
              v36 = 0u;
              v33 = 0u;
              v34 = 0u;
            }
            v38 = *(CMTime *)((char *)v37 + 8);
            v43 = v69;
            CMTimeAdd(&lhs.start, &v43, &v38);
            v69 = lhs.start;
            if (v23)
            {
LABEL_41:
              objc_msgSend(v23, "timeMapping", v27, v28);
              goto LABEL_47;
            }
          }
          memset(v31, 0, sizeof(v31));
LABEL_47:
          v32 = *(CMTime *)&v31[1];
          v43 = v55;
          CMTimeAdd(&lhs.start, &v43, &v32);
          v55 = lhs.start;
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
      }
      while (v19);
    }

    *(_OWORD *)&start.start.value = *(_OWORD *)&self->_cursorForMovieAudio.value;
    start.start.epoch = self->_cursorForMovieAudio.epoch;
    lhs.start = v55;
    CMTimeAdd(&v68.start, &start.start, &lhs.start);
    *(_OWORD *)&self->_cursorForMovieAudio.value = *(_OWORD *)&v68.start.value;
    self->_cursorForMovieAudio.epoch = v68.start.epoch;

    p_cursor = v27;
    v6 = v28;
  }
  *(_OWORD *)&start.start.value = *(_OWORD *)&p_cursor->value;
  start.start.epoch = p_cursor->epoch;
  lhs.start = v69;
  CMTimeAdd(&v68.start, &start.start, &lhs.start);
  *(_OWORD *)&p_cursor->value = *(_OWORD *)&v68.start.value;
  p_cursor->epoch = v68.start.epoch;

}

- (void)applyPaddingToTime:(id *)a3
{
  CMTime *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  $95D729B680665BEAEFA1D6FCA8238556 *p_cursorForMovieAudio;
  CMTime v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  CMTime v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  CMTime v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  CMTimeRange lhs;
  CMTime time2;
  CMTime rhs;
  CMTime duration;
  CMTime start;
  CMTimeRange v34;
  CMTime v35;

  memset(&v35, 0, sizeof(v35));
  CMTimeMake(&v35, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  memset(&v34, 0, sizeof(v34));
  -[JFXCompositionTrackGroup cursor](self, "cursor");
  -[JFXCompositionTrackGroup cursor](self, "cursor");
  lhs.start = (CMTime)*a3;
  CMTimeSubtract(&duration, &lhs.start, &rhs);
  CMTimeRangeMake(&v34, &start, &duration);
  v5 = (CMTime *)MEMORY[0x24BDC0D88];
  if (self->_videoTrack)
  {
    lhs.start = v34.duration;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    if (CMTimeCompare(&lhs.start, &time2) >= 1)
    {
      v6 = objc_alloc(MEMORY[0x24BDB2528]);
      lhs = v34;
      v7 = (void *)objc_msgSend(v6, "initWithTimeRange:", &lhs);
      -[NSMutableArray addObject:](self->_videoSegments, "addObject:", v7);
      if (v7)
      {
        objc_msgSend(v7, "timeMapping");
      }
      else
      {
        memset(v28, 0, sizeof(v28));
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
      }
      v35 = *(CMTime *)((char *)v28 + 8);

    }
    if (self->_videoTrack)
    {
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0;
      lhs.start.epoch = a3->var3;
      time2 = (CMTime)self->_cursorForMovieAudio;
      CMTimeSubtract(&v23, &lhs.start, &time2);
      time2 = (CMTime)self->_cursorForMovieAudio;
      CMTimeRangeMake(&lhs, &time2, &v23);
      v34 = lhs;
    }
  }
  if (self->_audioTrack)
  {
    lhs.start = v34.duration;
    time2 = *v5;
    if (CMTimeCompare(&lhs.start, &time2) >= 1)
    {
      v8 = objc_alloc(MEMORY[0x24BDB2528]);
      lhs = v34;
      v9 = (void *)objc_msgSend(v8, "initWithTimeRange:", &lhs);
      -[NSMutableArray addObject:](self->_audioSegments, "addObject:", v9);
      if (!self->_videoTrack)
      {
        if (v9)
        {
          objc_msgSend(v9, "timeMapping");
        }
        else
        {
          memset(v22, 0, sizeof(v22));
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
        }
        v35 = *(CMTime *)((char *)v22 + 8);
      }
      p_cursorForMovieAudio = &self->_cursorForMovieAudio;
      if (v9)
      {
        objc_msgSend(v9, "timeMapping");
      }
      else
      {
        memset(v16, 0, sizeof(v16));
        v14 = 0u;
        v15 = 0u;
        v12 = 0u;
        v13 = 0u;
      }
      v17 = *(CMTime *)((char *)v16 + 8);
      *(_OWORD *)&time2.value = *(_OWORD *)&p_cursorForMovieAudio->value;
      time2.epoch = self->_cursorForMovieAudio.epoch;
      CMTimeAdd(&lhs.start, &time2, &v17);
      *(_OWORD *)&p_cursorForMovieAudio->value = *(_OWORD *)&lhs.start.value;
      self->_cursorForMovieAudio.epoch = lhs.start.epoch;

    }
  }
  time2 = (CMTime)self->_cursor;
  v11 = v35;
  CMTimeAdd(&lhs.start, &time2, &v11);
  *(_OWORD *)&self->_cursor.value = *(_OWORD *)&lhs.start.value;
  self->_cursor.epoch = lhs.start.epoch;
}

- (void)applyCompositionItem:(id)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a4;
  -[JFXCompositionTrackGroup applyCompositionItem:atTime:skipAudio:](self, "applyCompositionItem:atTime:skipAudio:", a3, &v4, 0);
}

- (void)applyCompositionItem:(id)a3 atTime:(id *)a4 skipAudio:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  CMTime time2;

  v5 = a5;
  v8 = a3;
  -[JFXCompositionTrackGroup cursor](self, "cursor");
  v9 = *a4;
  if ((CMTimeCompare((CMTime *)&v9, &time2) & 0x80000000) == 0)
  {
    v9 = *a4;
    -[JFXCompositionTrackGroup applyPaddingToTime:](self, "applyPaddingToTime:", &v9);
  }
  -[JFXCompositionTrackGroup applyCompositionItem:skipAudio:](self, "applyCompositionItem:skipAudio:", v8, v5);

}

- (void)applyCompositionItemAsLoopedAudio:(id)a3 forTimeRange:(id *)a4
{
  id v6;
  AVMutableCompositionTrack *videoTrack;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CMTime v15;
  CMTime lhs;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  CMTime rhs;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[32];
  __int128 v28;
  CMTime v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  memset(&v29, 0, sizeof(v29));
  CMTimeMake(&v29, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  videoTrack = self->_videoTrack;
  self->_videoTrack = 0;

  if (self->_audioTrack)
  {
    v8 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)v27 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v27[16] = v8;
    v28 = *(_OWORD *)&a4->var1.var1;
    objc_msgSend(v6, "audioTrackSegmentsLoopedForDestinationTimeRange:", v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[NSMutableArray addObject:](self->_audioSegments, "addObject:", v14);
          if (!self->_videoTrack)
          {
            if (v14)
            {
              objc_msgSend(v14, "timeMapping");
            }
            else
            {
              memset(v21, 0, sizeof(v21));
              v19 = 0u;
              v20 = 0u;
              v17 = 0u;
              v18 = 0u;
            }
            rhs = *(CMTime *)((char *)v21 + 8);
            lhs = v29;
            CMTimeAdd((CMTime *)v27, &lhs, &rhs);
            v29 = *(CMTime *)v27;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v11);
    }

  }
  lhs = (CMTime)self->_cursor;
  v15 = v29;
  CMTimeAdd((CMTime *)v27, &lhs, &v15);
  *(_OWORD *)&self->_cursor.value = *(_OWORD *)v27;
  self->_cursor.epoch = *(_QWORD *)&v27[16];

}

- (BOOL)validate
{
  AVMutableCompositionTrack *videoTrack;
  NSMutableArray *videoSegments;
  BOOL v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  AVMutableCompositionTrack *audioTrack;
  NSMutableArray *audioSegments;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v15;
  id v16;

  videoTrack = self->_videoTrack;
  if (!videoTrack)
  {
    v6 = 0;
    goto LABEL_7;
  }
  videoSegments = self->_videoSegments;
  v16 = 0;
  v5 = -[AVMutableCompositionTrack validateTrackSegments:error:](videoTrack, "validateTrackSegments:error:", videoSegments, &v16);
  v6 = v16;
  if (v5)
  {
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  JFXLog_playback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[JFXCompositionTrackGroup validate].cold.2();

  v8 = 0;
LABEL_8:
  audioTrack = self->_audioTrack;
  if (audioTrack)
  {
    audioSegments = self->_audioSegments;
    v15 = v6;
    v11 = -[AVMutableCompositionTrack validateTrackSegments:error:](audioTrack, "validateTrackSegments:error:", audioSegments, &v15);
    v12 = v15;

    if (!v11)
    {
      JFXLog_playback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[JFXCompositionTrackGroup validate].cold.1();

      v8 = 0;
    }
  }
  else
  {
    v12 = v6;
  }

  return v8;
}

- (id)applyToTrack:(id)a3 withSegments:(id)a4 assets:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  JFXCompositionTrackGroup *v44;
  NSObject *v45;
  uint64_t *v46;
  CMTimeRange *p_start;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v40 = a5;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__13;
  v59 = __Block_byref_object_dispose__13;
  v60 = 0;
  v39 = v7;
  v36 = v8;
  if (v7)
  {
    if (v8)
    {
      memset(&v54, 0, sizeof(v54));
      CMTimeMakeWithSeconds(&duration, 86400.0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
      *(_OWORD *)&start.start.value = *MEMORY[0x24BDC0D88];
      start.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      CMTimeRangeMake(&v54, &start.start, &duration);
      start = v54;
      objc_msgSend(v7, "removeTimeRange:", &start);
      objc_msgSend(v7, "setSegments:", 0);
      start.start.value = 0;
      *(_QWORD *)&start.start.timescale = &start;
      start.start.epoch = 0x2020000000;
      LOBYTE(start.duration.value) = 0;
      v9 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, *MEMORY[0x24BDB21C0]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = dispatch_group_create();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v49 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isEmpty", v36) & 1) == 0)
            {
              objc_msgSend(v16, "sourceURL");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
                goto LABEL_13;
              v19 = (void *)MEMORY[0x24BDB26C8];
              objc_msgSend(v16, "sourceURL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "URLAssetWithURL:options:", v20, v37);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              JFXLog_playback();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v16, "sourceURL");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[JFXCompositionTrackGroup applyToTrack:withSegments:assets:].cold.1(v22, buf, &v62, v21);
              }

              if (v18)
              {
LABEL_13:
                dispatch_group_enter(v11);
                v41[0] = MEMORY[0x24BDAC760];
                v41[1] = 3221225472;
                v41[2] = __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke;
                v41[3] = &unk_24EE59E88;
                v23 = v7;
                v42 = v23;
                v43 = v16;
                v46 = &v55;
                p_start = &start;
                v44 = self;
                v45 = v11;
                objc_msgSend(v18, "findCompatibleTrackForCompositionTrack:completionHandler:", v23, v41);

              }
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
        }
        while (v13);
      }

      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      if (!*(_BYTE *)(*(_QWORD *)&start.start.timescale + 24))
        goto LABEL_19;
      -[AVMutableAudioMixInputParameters audioTimePitchAlgorithm](self->_audioParameters, "audioTimePitchAlgorithm");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionTrackGroup preferredAudioTimePitchAlgorithm](self, "preferredAudioTimePitchAlgorithm");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if ((v26 & 1) != 0)
      {
        if (!*(_BYTE *)(*(_QWORD *)&start.start.timescale + 24))
        {
LABEL_19:
          -[AVMutableAudioMixInputParameters audioTimePitchAlgorithm](self->_audioParameters, "audioTimePitchAlgorithm", v36);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
            -[AVMutableAudioMixInputParameters setAudioTimePitchAlgorithm:](self->_audioParameters, "setAudioTimePitchAlgorithm:", 0);
        }
      }
      else
      {
        -[JFXCompositionTrackGroup preferredAudioTimePitchAlgorithm](self, "preferredAudioTimePitchAlgorithm");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMutableAudioMixInputParameters setAudioTimePitchAlgorithm:](self->_audioParameters, "setAudioTimePitchAlgorithm:", v34);

      }
      v33 = (id)v56[5];

      _Block_object_dispose(&start, 8);
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -1, 0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v56[5];
    v56[5] = v31;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -1, 0, v8);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v56[5];
    v56[5] = v29;

  }
  v33 = (id)v56[5];
LABEL_26:
  _Block_object_dispose(&v55, 8);

  return v33;
}

void __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CMTime v18;
  CMTimeRange v19[3];
  __int128 v20;
  _OWORD v21[5];
  CMTime duration;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime start;
  CMTimeRange v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  CMTime time2;
  __int128 v37;
  _OWORD v38[5];
  CMTime time1;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "timeMapping");
      v9 = *(void **)(a1 + 40);
      v55 = v49;
      v56 = v50;
      v57 = v51;
      if (v9)
      {
        objc_msgSend(v9, "timeMapping");
        goto LABEL_10;
      }
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
LABEL_10:
    v47 = v44;
    v48 = v45;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v8, "insertTimeRange:ofTrack:atTime:error:", &v55, v5, &v47, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v12, "timeMapping");
      v13 = *(void **)(a1 + 40);
      time1 = *(CMTime *)((char *)v38 + 8);
      if (v13)
      {
        objc_msgSend(v13, "timeMapping");
        goto LABEL_15;
      }
    }
    else
    {
      v37 = 0u;
      memset(v38, 0, sizeof(v38));
      *(_OWORD *)&time1.value = *(_OWORD *)((char *)v38 + 8);
      time1.epoch = 0;
    }
    memset(v35, 0, sizeof(v35));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
LABEL_15:
    time2 = *(CMTime *)((char *)v35 + 8);
    if (!CMTimeCompare(&time1, &time2))
      goto LABEL_26;
    memset(&v30, 0, sizeof(v30));
    v14 = *(void **)(a1 + 40);
    if (v14)
    {
      objc_msgSend(v14, "timeMapping");
      v15 = *(void **)(a1 + 40);
      *(_OWORD *)&start.value = v26;
      start.epoch = v27;
      if (v15)
      {
        objc_msgSend(v15, "timeMapping");
LABEL_21:
        duration = *(CMTime *)((char *)v21 + 8);
        CMTimeRangeMake(&v30, &start, &duration);
        v16 = *(void **)(a1 + 40);
        if (v16)
          objc_msgSend(v16, "timeMapping");
        else
          memset(&v19[1], 0, 96);
        v17 = *(void **)(a1 + 32);
        v19[0] = v30;
        v18 = v19[2].duration;
        objc_msgSend(v17, "scaleTimeRange:toDuration:", v19, &v18);
        if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        goto LABEL_26;
      }
    }
    else
    {
      v27 = 0uLL;
      v28 = 0uLL;
      v25 = 0uLL;
      v26 = 0uLL;
      v23 = 0uLL;
      v24 = 0uLL;
      memset(&start, 0, sizeof(start));
    }
    v20 = 0u;
    memset(v21, 0, sizeof(v21));
    goto LABEL_21;
  }
  JFXLog_playback();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke_cold_1(a1);

LABEL_26:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

- (void)apply:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[JFXCompositionTrackGroup applyToTrack:withSegments:assets:](self, "applyToTrack:withSegments:assets:", self->_videoTrack, self->_videoSegments, v4);
  v6 = -[JFXCompositionTrackGroup applyToTrack:withSegments:assets:](self, "applyToTrack:withSegments:assets:", self->_audioTrack, self->_audioSegments, v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[JFXCompositionTrackGroup extraAudioTrackGroups](self, "extraAudioTrackGroups", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "apply:", v4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)applyAudioMixParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[JFXCompositionTrackGroup audioParameters](self, "audioParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[JFXCompositionTrackGroup audioParameters](self, "audioParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[JFXCompositionTrackGroup extraAudioTrackGroups](self, "extraAudioTrackGroups", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          -[JFXCompositionTrackGroup audioParameters](self, "audioParameters");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(v12, "audioTrack");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTrackID:", objc_msgSend(v15, "trackID"));

          objc_msgSend(v12, "setAudioParameters:", v14);
          objc_msgSend(v4, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
}

- (void)markDirty
{
  AVMutableAudioMixInputParameters *v3;
  AVMutableAudioMixInputParameters *audioParameters;
  NSDictionary *fmTrackInfoDict;
  CMTime v6;

  objc_msgSend(MEMORY[0x24BDB25A8], "audioMixInputParametersWithTrack:", self->_audioTrack);
  v3 = (AVMutableAudioMixInputParameters *)objc_claimAutoreleasedReturnValue();
  audioParameters = self->_audioParameters;
  self->_audioParameters = v3;

  -[NSMutableArray removeAllObjects](self->_audioSegments, "removeAllObjects");
  fmTrackInfoDict = self->_fmTrackInfoDict;
  self->_fmTrackInfoDict = 0;

  -[NSMutableArray removeAllObjects](self->_videoSegments, "removeAllObjects");
  self->_videoTrackInUse = 0;
  CMTimeMake(&v6, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  self->_cursor = ($95D729B680665BEAEFA1D6FCA8238556)v6;
  CMTimeMake(&v6, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  self->_cursorForMovieAudio = ($95D729B680665BEAEFA1D6FCA8238556)v6;
  -[JFXCompositionTrackGroup resetVolumeState](self, "resetVolumeState");
  self->_cursorAtLastVideoInsertion = self->_cursor;
  -[JFXCompositionTrackGroup setAudioFormatDescription:](self, "setAudioFormatDescription:", 0);
  -[JFXCompositionTrackGroup setSeenSpeedClip:](self, "setSeenSpeedClip:", 0);
  -[JFXCompositionTrackGroup setSeenMoreThanOneASBD:](self, "setSeenMoreThanOneASBD:", 0);
  -[JFXCompositionTrackGroup removeExtraAudioTrackGroups](self, "removeExtraAudioTrackGroups");
}

- (void)resetVolumeState
{
  double v3;
  double v4;
  __int128 v5;
  uint64_t v6;
  CMTime v7;
  CMTime v8;
  CMTime v9;
  CMTime v10;

  CMTimeMake(&v10, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  v9 = v10;
  -[JFXCompositionTrackGroup setTimeOfLastVolumeChange:](self, "setTimeOfLastVolumeChange:", &v9);
  LODWORD(v3) = 0;
  -[JFXCompositionTrackGroup setVolumeAtLastVolumeChange:](self, "setVolumeAtLastVolumeChange:", v3);
  LODWORD(v4) = -1.0;
  -[JFXCompositionTrackGroup setVolumeChangePending:](self, "setVolumeChangePending:", v4);
  CMTimeMake(&v8, 0, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  v7 = v8;
  -[JFXCompositionTrackGroup setTimeOfLastRequest:](self, "setTimeOfLastRequest:", &v7);
  v5 = *MEMORY[0x24BDC0D88];
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  -[JFXCompositionTrackGroup setLastRampToZeroEnd:](self, "setLastRampToZeroEnd:", &v5);
}

- (float)linearFadeOutValueForTime:(id *)a3
{
  double Seconds;
  double v6;
  double v7;
  float result;
  double v9;
  CMTime v10;
  CMTime v11;
  CMTime time;

  -[JFXCompositionTrackGroup fadeOutStart](self, "fadeOutStart");
  Seconds = CMTimeGetSeconds(&time);
  -[JFXCompositionTrackGroup fadeOutDuration](self, "fadeOutDuration");
  v6 = CMTimeGetSeconds(&v11);
  v10 = *(CMTime *)a3;
  v7 = CMTimeGetSeconds(&v10);
  result = 0.0;
  if (v6 > 0.0)
  {
    v9 = v7 - Seconds;
    result = 1.0;
    if (v9 >= 0.0)
    {
      result = 0.0;
      if (v9 <= v6)
        return v9 / v6;
    }
  }
  return result;
}

- (float)setFadedVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  BOOL v9;
  _BOOL4 v10;
  _BOOL4 v11;
  __int128 v12;
  double v13;
  double v14;
  AVMutableAudioMixInputParameters *v15;
  __int128 v16;
  double v17;
  NSObject *v18;
  NSString *v19;
  Float64 v20;
  __int128 v21;
  Float64 v22;
  const char *v23;
  double v24;
  char v25;
  __int128 v26;
  float v27;
  AVMutableAudioMixInputParameters *v28;
  __int128 v29;
  double v30;
  NSString *v31;
  Float64 v32;
  __int128 v33;
  Float64 v34;
  AVMutableAudioMixInputParameters *v35;
  __int128 v36;
  AVMutableAudioMixInputParameters *audioParameters;
  __int128 v39;
  NSString *label;
  Float64 Seconds;
  __int128 v42;
  Float64 v43;
  double v44;
  float v45;
  AVMutableAudioMixInputParameters *v46;
  __int128 v47;
  NSString *v48;
  Float64 v49;
  __int128 v50;
  Float64 v51;
  NSString *v52;
  Float64 v53;
  __int128 v54;
  Float64 v55;
  uint64_t value;
  __int128 v57;
  AVMutableAudioMixInputParameters *v58;
  double v59;
  double v60;
  NSObject *v61;
  float v62;
  float v63;
  float v64;
  AVMutableAudioMixInputParameters *v65;
  NSObject *v66;
  AVMutableAudioMixInputParameters *v67;
  double v68;
  double v69;
  NSObject *v70;
  NSString *v71;
  Float64 v72;
  Float64 v73;
  NSString *v74;
  Float64 v75;
  Float64 v76;
  NSString *v77;
  Float64 v78;
  Float64 v79;
  CMTime v80;
  CMTimeRange v81;
  CMTime v82;
  CMTime v83;
  CMTime v84;
  CMTimeRange v85;
  CMTime var0;
  CMTime rhs;
  CMTime lhs;
  CMTime v89;
  __int128 v90;
  CMTime v91;
  CMTime v92;
  CMTime v93;
  CMTime v94;
  CMTime v95;
  CMTime time;
  CMTimeRange otherRange;
  CMTimeRange time2;
  CMTime v99;
  CMTime duration;
  CMTime start;
  CMTimeRange v102;
  _BYTE time1[32];
  _BYTE v104[20];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  memset(&v102, 0, sizeof(v102));
  -[JFXCompositionTrackGroup fadeOutStart](self, "fadeOutStart");
  -[JFXCompositionTrackGroup fadeOutDuration](self, "fadeOutDuration");
  CMTimeRangeMake(&v102, &start, &duration);
  if ((v102.start.flags & 1) != 0
    && (v102.duration.flags & 1) != 0
    && !v102.duration.epoch
    && (v102.duration.value & 0x8000000000000000) == 0)
  {
    *(CMTime *)time1 = v102.duration;
    *(_OWORD *)&time2.start.value = *MEMORY[0x24BDC0D88];
    time2.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    if (!CMTimeCompare((CMTime *)time1, &time2.start))
    {
      audioParameters = self->_audioParameters;
      v39 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v39;
      *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
      *(float *)&v39 = a4;
      -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](audioParameters, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v104[4], LODWORD(a3))), *(double *)&v39);
      JFXLog_DebugComposition();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        label = self->_label;
        *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
        *(_QWORD *)&time1[16] = a5->var0.var3;
        Seconds = CMTimeGetSeconds((CMTime *)time1);
        v42 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
        *(_OWORD *)&time1[16] = v42;
        *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
        CMTimeRangeGetEnd(&v99, (CMTimeRange *)time1);
        v43 = CMTimeGetSeconds(&v99);
        *(_DWORD *)time1 = 138413314;
        *(_QWORD *)&time1[4] = label;
        *(_WORD *)&time1[12] = 2048;
        *(Float64 *)&time1[14] = Seconds;
        *(_WORD *)&time1[22] = 2048;
        *(double *)&time1[24] = a3;
        *(_WORD *)v104 = 2048;
        *(Float64 *)&v104[2] = v43;
        *(_WORD *)&v104[10] = 2048;
        *(double *)&v104[12] = a4;
        v23 = "  beforeFadeZone - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
        goto LABEL_38;
      }
      goto LABEL_30;
    }
  }
  memset(&time2.start.epoch, 0, 32);
  v9 = a4 <= 0.0 && a3 <= 0.0;
  v10 = a4 > 0.0 && a3 <= 0.0;
  v11 = a4 <= 0.0 && a3 > 0.0;
  v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time1[16] = v12;
  *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
  otherRange = v102;
  *(_OWORD *)&time2.start.value = 0uLL;
  CMTimeRangeGetIntersection(&time2, (CMTimeRange *)time1, &otherRange);
  *(CMTime *)time1 = time2.duration;
  v13 = CMTimeGetSeconds((CMTime *)time1);
  *(_OWORD *)time1 = *(_OWORD *)&v102.start.value;
  *(_OWORD *)&time1[16] = *(_OWORD *)&v102.start.epoch;
  *(_OWORD *)v104 = *(_OWORD *)&v102.duration.timescale;
  CMTimeRangeGetEnd(&time, (CMTimeRange *)time1);
  v14 = CMTimeGetSeconds(&time);
  *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
  *(_QWORD *)&time1[16] = a5->var0.var3;
  if (CMTimeGetSeconds((CMTime *)time1) > v14)
  {
    v15 = self->_audioParameters;
    v16 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v16;
    *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
    HIDWORD(v17) = *(_DWORD *)&v104[4];
    LODWORD(v17) = 0;
    LODWORD(v16) = 0;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v15, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, v17, *(double *)&v16);
    JFXLog_DebugComposition();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = self->_label;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_QWORD *)&time1[16] = a5->var0.var3;
      v20 = CMTimeGetSeconds((CMTime *)time1);
      v21 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v21;
      *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v95, (CMTimeRange *)time1);
      v22 = CMTimeGetSeconds(&v95);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v19;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v20;
      *(_WORD *)&time1[22] = 2048;
      *(_QWORD *)&time1[24] = 0;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v22;
      *(_WORD *)&v104[10] = 2048;
      *(_QWORD *)&v104[12] = 0;
      v23 = "  afterFadeZone - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
LABEL_38:
      _os_log_debug_impl(&dword_2269A9000, v18, OS_LOG_TYPE_DEBUG, v23, time1, 0x34u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  v24 = a3;
  if ((time2.start.flags & 1) == 0
    || (time2.duration.flags & 1) == 0
    || time2.duration.epoch
    || (time2.duration.value < 0 ? (v25 = 1) : (v25 = v9), (v25 & 1) != 0 || v13 <= 0.0))
  {
    v35 = self->_audioParameters;
    v36 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v36;
    *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
    *(float *)&v36 = a4;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v35, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v104[4], LODWORD(a3))), *(double *)&v36);
    JFXLog_DebugComposition();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v52 = self->_label;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_QWORD *)&time1[16] = a5->var0.var3;
      v53 = CMTimeGetSeconds((CMTime *)time1);
      v54 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v54;
      *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v80, (CMTimeRange *)time1);
      v55 = CMTimeGetSeconds(&v80);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v52;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v53;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = v24;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v55;
      *(_WORD *)&v104[10] = 2048;
      *(double *)&v104[12] = a4;
      v23 = "  outOfFadeZone or zeroRamp - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if (v10)
  {
    v26 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v26;
    *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v94, (CMTimeRange *)time1);
    -[JFXCompositionTrackGroup linearFadeOutValueForTime:](self, "linearFadeOutValueForTime:", &v94);
    a4 = v27 * a4;
    v28 = self->_audioParameters;
    v29 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v29;
    *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
    HIDWORD(v30) = *(_DWORD *)&v104[4];
    LODWORD(v30) = 0;
    *(float *)&v29 = a4;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v28, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, v30, *(double *)&v29);
    JFXLog_DebugComposition();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v31 = self->_label;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_QWORD *)&time1[16] = a5->var0.var3;
      v32 = CMTimeGetSeconds((CMTime *)time1);
      v33 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v33;
      *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v93, (CMTimeRange *)time1);
      v34 = CMTimeGetSeconds(&v93);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v31;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v32;
      *(_WORD *)&time1[22] = 2048;
      *(_QWORD *)&time1[24] = 0;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v34;
      *(_WORD *)&v104[10] = 2048;
      *(double *)&v104[12] = a4;
      v23 = "  rampIsFadeIn - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
      goto LABEL_38;
    }
LABEL_30:

    return a4;
  }
  if (v11)
  {
    -[JFXCompositionTrackGroup volumeAtLastVolumeChange](self, "volumeAtLastVolumeChange");
    v45 = *(float *)&v44;
    v46 = self->_audioParameters;
    v47 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v47;
    *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
    HIDWORD(v44) = *(_DWORD *)&v104[4];
    a4 = 0.0;
    LODWORD(v47) = 0;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v46, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, v44, *(double *)&v47);
    JFXLog_DebugComposition();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v48 = self->_label;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_QWORD *)&time1[16] = a5->var0.var3;
      v49 = CMTimeGetSeconds((CMTime *)time1);
      v50 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v50;
      *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v92, (CMTimeRange *)time1);
      v51 = CMTimeGetSeconds(&v92);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v48;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v49;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = v45;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v51;
      *(_WORD *)&v104[10] = 2048;
      *(_QWORD *)&v104[12] = 0;
      v23 = "  rampIsFadeOut - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  memset(&v91, 0, sizeof(v91));
  *(_OWORD *)time1 = *(_OWORD *)&time2.start.value;
  *(_QWORD *)&time1[16] = time2.start.epoch;
  *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
  otherRange.start.epoch = a5->var0.var3;
  CMTimeSubtract(&v91, (CMTime *)time1, &otherRange.start);
  value = time2.duration.value;
  v90 = *(_OWORD *)&time2.duration.timescale;
  memset(&v89, 0, sizeof(v89));
  v57 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time1[16] = v57;
  *(_OWORD *)v104 = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&lhs, (CMTimeRange *)time1);
  *(_OWORD *)time1 = *(_OWORD *)&time2.start.value;
  *(_OWORD *)&time1[16] = *(_OWORD *)&time2.start.epoch;
  *(_OWORD *)v104 = *(_OWORD *)&time2.duration.timescale;
  CMTimeRangeGetEnd(&rhs, (CMTimeRange *)time1);
  CMTimeSubtract(&v89, &lhs, &rhs);
  var0 = (CMTime)a5->var0;
  if (v91.value >= 1)
  {
    v58 = self->_audioParameters;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_QWORD *)&time1[16] = a5->var0.var3;
    otherRange.start = v91;
    CMTimeRangeMake(&v85, (CMTime *)time1, &otherRange.start);
    *(float *)&v59 = a3;
    *(float *)&v60 = a3;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v58, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v85, v59, v60);
    JFXLog_DebugComposition();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      v71 = self->_label;
      *(CMTime *)time1 = var0;
      v72 = CMTimeGetSeconds((CMTime *)time1);
      *(CMTime *)time1 = v91;
      v73 = CMTimeGetSeconds((CMTime *)time1);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v71;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v72;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = a3;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v73;
      *(_WORD *)&v104[10] = 2048;
      *(double *)&v104[12] = a3;
      _os_log_debug_impl(&dword_2269A9000, v61, OS_LOG_TYPE_DEBUG, "  durationBefore - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

    *(CMTime *)time1 = var0;
    otherRange.start = v91;
    CMTimeAdd(&var0, (CMTime *)time1, &otherRange.start);
  }
  if (value >= 1)
  {
    memset(&otherRange, 0, sizeof(otherRange));
    *(CMTime *)time1 = var0;
    v84.value = value;
    *(_OWORD *)&v84.timescale = v90;
    CMTimeRangeMake(&otherRange, (CMTime *)time1, &v84);
    *(_OWORD *)time1 = *(_OWORD *)&otherRange.start.value;
    *(_QWORD *)&time1[16] = otherRange.start.epoch;
    -[JFXCompositionTrackGroup linearFadeOutValueForTime:](self, "linearFadeOutValueForTime:", time1);
    v63 = v62 * a3;
    *(_OWORD *)time1 = *(_OWORD *)&otherRange.start.value;
    *(_OWORD *)&time1[16] = *(_OWORD *)&otherRange.start.epoch;
    *(_OWORD *)v104 = *(_OWORD *)&otherRange.duration.timescale;
    CMTimeRangeGetEnd(&v83, (CMTimeRange *)time1);
    -[JFXCompositionTrackGroup linearFadeOutValueForTime:](self, "linearFadeOutValueForTime:", &v83);
    a4 = v64 * a4;
    v65 = self->_audioParameters;
    *(_OWORD *)time1 = *(_OWORD *)&otherRange.start.value;
    *(_OWORD *)&time1[16] = *(_OWORD *)&otherRange.start.epoch;
    *(_OWORD *)v104 = *(_OWORD *)&otherRange.duration.timescale;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v65, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, COERCE_DOUBLE(__PAIR64__(otherRange.duration.flags, LODWORD(v63))), COERCE_DOUBLE(__PAIR64__(HIDWORD(otherRange.start.epoch), LODWORD(a4))));
    JFXLog_DebugComposition();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      v74 = self->_label;
      *(CMTime *)time1 = var0;
      v75 = CMTimeGetSeconds((CMTime *)time1);
      *(_QWORD *)time1 = value;
      *(_OWORD *)&time1[8] = v90;
      v76 = CMTimeGetSeconds((CMTime *)time1);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v74;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v75;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = v63;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v76;
      *(_WORD *)&v104[10] = 2048;
      *(double *)&v104[12] = a4;
      _os_log_debug_impl(&dword_2269A9000, v66, OS_LOG_TYPE_DEBUG, "  durationDuring - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

    v84 = var0;
    v82.value = value;
    *(_OWORD *)&v82.timescale = v90;
    CMTimeAdd((CMTime *)time1, &v84, &v82);
    var0 = *(CMTime *)time1;
  }
  if (v89.value >= 1)
  {
    v67 = self->_audioParameters;
    *(CMTime *)time1 = var0;
    otherRange.start = v89;
    CMTimeRangeMake(&v81, (CMTime *)time1, &otherRange.start);
    a4 = 0.0;
    LODWORD(v68) = 0;
    LODWORD(v69) = 0;
    -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](v67, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v81, v68, v69);
    JFXLog_DebugComposition();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      v77 = self->_label;
      *(CMTime *)time1 = var0;
      v78 = CMTimeGetSeconds((CMTime *)time1);
      *(CMTime *)time1 = v89;
      v79 = CMTimeGetSeconds((CMTime *)time1);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v77;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v78;
      *(_WORD *)&time1[22] = 2048;
      *(_QWORD *)&time1[24] = 0;
      *(_WORD *)v104 = 2048;
      *(Float64 *)&v104[2] = v79;
      *(_WORD *)&v104[10] = 2048;
      *(_QWORD *)&v104[12] = 0;
      _os_log_debug_impl(&dword_2269A9000, v70, OS_LOG_TYPE_DEBUG, "  durationAfter - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

  }
  return a4;
}

- (void)commitVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSString *label;
  Float64 v15;
  __int128 v16;
  Float64 v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  float v29;
  float v30;
  __int128 v31;
  __int128 v32;
  double v33;
  double v34;
  __int128 v35;
  Float64 Seconds;
  Float64 v37;
  NSString *v38;
  Float64 v39;
  __int128 v40;
  Float64 v41;
  NSString *v42;
  Float64 v43;
  __int128 v44;
  Float64 v45;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  CMTime v49;
  CMTime v50;
  CMTimeRange range;
  CMTime v52;
  CMTimeRange v53;
  CMTime v54;
  CMTime v55;
  CMTime time;
  CMTime end;
  CMTime start;
  CMTime v59;
  CMTime time2;
  CMTime v61;
  _BYTE time1[32];
  _BYTE v63[20];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  memset(&v61, 0, sizeof(v61));
  CMTimeMake(&v61, 1, -[JFXCompositionTrackGroup timeScale](self, "timeScale"));
  -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
  *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
  *(_QWORD *)&time1[16] = a5->var0.var3;
  if (CMTimeCompare((CMTime *)time1, &time2) >= 1)
  {
    JFXLog_DebugComposition();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_QWORD *)&time1[16] = a5->var0.var3;
      Seconds = CMTimeGetSeconds((CMTime *)time1);
      -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
      v37 = CMTimeGetSeconds(&v59);
      *(_DWORD *)time1 = 134218240;
      *(Float64 *)&time1[4] = Seconds;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v37;
      _os_log_debug_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEBUG, "commitVolumeRampFromStartVolume startTime %f < timeOfLastVolumeChange %f -- Adjusting", time1, 0x16u);
    }

    -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
    v10 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v10;
    *(_OWORD *)v63 = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&end, (CMTimeRange *)time1);
    CMTimeRangeFromTimeToTime((CMTimeRange *)time1, &start, &end);
    v11 = *(_OWORD *)&time1[16];
    *(_OWORD *)&a5->var0.var0 = *(_OWORD *)time1;
    *(_OWORD *)&a5->var0.var3 = v11;
    *(_OWORD *)&a5->var1.var1 = *(_OWORD *)v63;
  }
  JFXLog_DebugComposition();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (a3 == a4)
  {
    if (v13)
    {
      label = self->_label;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_QWORD *)&time1[16] = a5->var0.var3;
      v15 = CMTimeGetSeconds((CMTime *)time1);
      v16 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v16;
      *(_OWORD *)v63 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&time, (CMTimeRange *)time1);
      v17 = CMTimeGetSeconds(&time);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = label;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v15;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = a3;
      *(_WORD *)v63 = 2048;
      *(Float64 *)&v63[2] = v17;
      *(_WORD *)&v63[10] = 2048;
      *(double *)&v63[12] = a4;
      v18 = "VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
LABEL_21:
      _os_log_debug_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEBUG, v18, time1, 0x34u);
    }
  }
  else if (v13)
  {
    v38 = self->_label;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_QWORD *)&time1[16] = a5->var0.var3;
    v39 = CMTimeGetSeconds((CMTime *)time1);
    v40 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v40;
    *(_OWORD *)v63 = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v55, (CMTimeRange *)time1);
    v41 = CMTimeGetSeconds(&v55);
    *(_DWORD *)time1 = 138413314;
    *(_QWORD *)&time1[4] = v38;
    *(_WORD *)&time1[12] = 2048;
    *(Float64 *)&time1[14] = v39;
    *(_WORD *)&time1[22] = 2048;
    *(double *)&time1[24] = a3;
    *(_WORD *)v63 = 2048;
    *(Float64 *)&v63[2] = v41;
    *(_WORD *)&v63[10] = 2048;
    *(double *)&v63[12] = a4;
    v18 = "VOLUME FADE  :%@  time %f volume %f  -  time %f volume %f";
    goto LABEL_21;
  }

  *(_OWORD *)time1 = *(_OWORD *)&a5->var1.var0;
  *(_QWORD *)&time1[16] = a5->var1.var3;
  v53.start = v61;
  if (CMTimeCompare((CMTime *)time1, &v53.start) < 0 && !-[JFXCompositionTrackGroup isFlexMusic](self, "isFlexMusic"))
  {
    JFXLog_DebugComposition();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v42 = self->_label;
      *(_OWORD *)&v53.start.value = *(_OWORD *)&a5->var0.var0;
      v53.start.epoch = a5->var0.var3;
      v43 = CMTimeGetSeconds(&v53.start);
      v44 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)&v53.start.value = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&v53.start.epoch = v44;
      *(_OWORD *)&v53.duration.timescale = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v54, &v53);
      v45 = CMTimeGetSeconds(&v54);
      *(_DWORD *)time1 = 138413314;
      *(_QWORD *)&time1[4] = v42;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v43;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = a3;
      *(_WORD *)v63 = 2048;
      *(Float64 *)&v63[2] = v45;
      *(_WORD *)&v63[10] = 2048;
      *(double *)&v63[12] = a4;
      _os_log_debug_impl(&dword_2269A9000, v19, OS_LOG_TYPE_DEBUG, "setVolumeRamp:%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

    JFXLog_DebugComposition();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

    a5->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v61;
  }
  v28 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)time1 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time1[16] = v28;
  *(_OWORD *)v63 = *(_OWORD *)&a5->var1.var1;
  *(float *)&v28 = a4;
  -[JFXCompositionTrackGroup setFadedVolumeRampFromStartVolume:toEndVolume:timeRange:](self, "setFadedVolumeRampFromStartVolume:toEndVolume:timeRange:", time1, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v63[4], LODWORD(a3))), *(double *)&v28);
  v30 = v29;
  v31 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v31;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&v52, &range);
  v50 = v52;
  -[JFXCompositionTrackGroup setTimeOfLastVolumeChange:](self, "setTimeOfLastVolumeChange:", &v50);
  v32 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v32;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&v49, &range);
  v48 = v49;
  -[JFXCompositionTrackGroup setTimeOfLastRequest:](self, "setTimeOfLastRequest:", &v48);
  *(float *)&v33 = v30;
  -[JFXCompositionTrackGroup setVolumeAtLastVolumeChange:](self, "setVolumeAtLastVolumeChange:", v33);
  if (a3 > 0.0 && v30 <= 0.0)
  {
    v35 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v35;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v47, &range);
    v46 = v47;
    -[JFXCompositionTrackGroup setLastRampToZeroEnd:](self, "setLastRampToZeroEnd:", &v46);
  }
  LODWORD(v34) = -1.0;
  -[JFXCompositionTrackGroup setVolumeChangePending:](self, "setVolumeChangePending:", v34);
}

- (BOOL)commitPendingVolumeToTime:(id *)a3
{
  int32_t v5;
  double v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  double v10;
  NSObject *v11;
  CMTimeRange v13;
  CMTime start;
  CMTimeRange time1;
  CMTime time2;

  -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
  time1.start = (CMTime)*a3;
  v5 = CMTimeCompare(&time1.start, &time2);
  if (v5 <= 0)
  {
    JFXLog_DebugComposition();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[JFXCompositionTrackGroup commitPendingVolumeToTime:].cold.1((CMTime *)a3);

  }
  else
  {
    -[JFXCompositionTrackGroup volumeChangePending](self, "volumeChangePending");
    if (*(float *)&v6 == -1.0)
    {
      LODWORD(v6) = 0;
      -[JFXCompositionTrackGroup setVolumeChangePending:](self, "setVolumeChangePending:", v6);
    }
    memset(&time1, 0, sizeof(time1));
    -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
    *(_OWORD *)&v13.start.value = *(_OWORD *)&a3->var0;
    v13.start.epoch = a3->var3;
    CMTimeRangeFromTimeToTime(&time1, &start, &v13.start);
    -[JFXCompositionTrackGroup volumeChangePending](self, "volumeChangePending");
    v8 = v7;
    -[JFXCompositionTrackGroup volumeChangePending](self, "volumeChangePending");
    LODWORD(v10) = v9;
    v13 = time1;
    -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:](self, "commitVolumeRampFromStartVolume:toEndVolume:timeRange:", &v13, COERCE_DOUBLE(__PAIR64__(time1.duration.flags, v8)), v10);
  }
  return v5 > 0;
}

- (BOOL)shouldCommitVolume:(float)a3
{
  float v5;
  float v7;

  -[JFXCompositionTrackGroup volumeChangePending](self, "volumeChangePending");
  if (v5 == -1.0)
    return 0;
  -[JFXCompositionTrackGroup volumeChangePending](self, "volumeChangePending");
  return v7 != a3;
}

- (BOOL)requestVolume:(float)a3 atTime:(id *)a4
{
  double v7;
  NSObject *v8;
  double v9;
  Float64 Seconds;
  Float64 v12;
  __int128 v13;
  int64_t var3;
  CMTime time;
  CMTime time2;
  CMTime v17;
  CMTime time1;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = *(CMTime *)a4;
  -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
  time1 = v17;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    JFXLog_DebugComposition();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      time1 = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time1);
      -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
      v12 = CMTimeGetSeconds(&time);
      LODWORD(time1.value) = 134218240;
      *(Float64 *)((char *)&time1.value + 4) = Seconds;
      LOWORD(time1.flags) = 2048;
      *(Float64 *)((char *)&time1.flags + 2) = v12;
      _os_log_debug_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEBUG, "setVolume startTime %f < timeOfLastVolumeChange %f -- Adjusting", (uint8_t *)&time1, 0x16u);
    }

  }
  *(float *)&v7 = a3;
  if (-[JFXCompositionTrackGroup shouldCommitVolume:](self, "shouldCommitVolume:", v7))
  {
    time1 = v17;
    -[JFXCompositionTrackGroup commitPendingVolumeToTime:](self, "commitPendingVolumeToTime:", &time1);
  }
  *(float *)&v9 = a3;
  -[JFXCompositionTrackGroup setVolumeChangePending:](self, "setVolumeChangePending:", v9);
  v13 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  -[JFXCompositionTrackGroup setTimeOfLastRequest:](self, "setTimeOfLastRequest:", &v13);
  return 1;
}

- (BOOL)requestVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 fillEmptySegment:(BOOL)a6
{
  _BOOL4 v6;
  __int128 v11;
  int32_t v12;
  NSObject *v13;
  float v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  Float64 Seconds;
  Float64 v27;
  Float64 v28;
  Float64 v29;
  CMTimeRange v30;
  CMTime rhs;
  CMTime duration;
  CMTime v33;
  CMTime v34;
  CMTime end;
  CMTime start;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange v43;
  CMTimeRange range;
  uint64_t v45;

  v6 = a6;
  v45 = *MEMORY[0x24BDAC8D0];
  v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v43.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&v43.start.epoch = v11;
  *(_OWORD *)&v43.duration.timescale = *(_OWORD *)&a5->var1.var1;
  if (a3 == a4)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    range.start.epoch = a5->var0.var3;
    -[JFXCompositionTrackGroup requestVolume:atTime:](self, "requestVolume:atTime:", &range, COERCE_DOUBLE(__PAIR64__(HIDWORD(range.start.value), LODWORD(a4))));
  }
  range = v43;
  CMTimeRangeGetEnd(&time1, &range);
  -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
  v12 = CMTimeCompare(&time1, &time2);
  if (v12 < 0)
  {
    JFXLog_DebugComposition();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      range = v43;
      CMTimeRangeGetEnd(&time, &range);
      Seconds = CMTimeGetSeconds(&time);
      -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
      v27 = CMTimeGetSeconds(&v39);
      LODWORD(range.start.value) = 134218240;
      *(Float64 *)((char *)&range.start.value + 4) = Seconds;
      LOWORD(range.start.flags) = 2048;
      *(Float64 *)((char *)&range.start.flags + 2) = v27;
      _os_log_debug_impl(&dword_2269A9000, v24, OS_LOG_TYPE_DEBUG, "setVolumeRamp endTime %f < timeOfLastVolumeChange %f -- ABORTING", (uint8_t *)&range, 0x16u);
    }

  }
  else
  {
    -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
    *(_OWORD *)&range.start.value = *(_OWORD *)&v43.start.value;
    range.start.epoch = v43.start.epoch;
    if (CMTimeCompare(&range.start, &v38) < 0)
    {
      JFXLog_DebugComposition();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
        range.start.epoch = a5->var0.var3;
        v28 = CMTimeGetSeconds(&range.start);
        -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
        v29 = CMTimeGetSeconds(&v37);
        LODWORD(range.start.value) = 134218240;
        *(Float64 *)((char *)&range.start.value + 4) = v28;
        LOWORD(range.start.flags) = 2048;
        *(Float64 *)((char *)&range.start.flags + 2) = v29;
        _os_log_debug_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEBUG, "setVolumeRamp startTime %f < timeOfLastVolumeChange %f -- Adjusting", (uint8_t *)&range, 0x16u);
      }

      -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
      range = v43;
      CMTimeRangeGetEnd(&end, &range);
      CMTimeRangeFromTimeToTime(&v43, &start, &end);
    }
    -[JFXCompositionTrackGroup volumeChangePending](self, "volumeChangePending");
    if (v14 == -1.0)
    {
      -[JFXCompositionTrackGroup volumeAtLastVolumeChange](self, "volumeAtLastVolumeChange");
      -[JFXCompositionTrackGroup setVolumeChangePending:](self, "setVolumeChangePending:");
    }
    if (v6)
    {
      -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
      *(_OWORD *)&range.start.value = *(_OWORD *)&v43.start.value;
      range.start.epoch = v43.start.epoch;
      if (CMTimeCompare(&range.start, &v34) >= 1)
      {
        memset(&range, 0, sizeof(range));
        -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
        -[JFXCompositionTrackGroup timeOfLastVolumeChange](self, "timeOfLastVolumeChange");
        *(_OWORD *)&v30.start.value = *(_OWORD *)&v43.start.value;
        v30.start.epoch = v43.start.epoch;
        CMTimeSubtract(&duration, &v30.start, &rhs);
        CMTimeRangeMake(&range, &v33, &duration);
        *(float *)&v15 = self->_volumeAtLastVolumeChange;
        v30 = range;
        -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:](self, "commitVolumeRampFromStartVolume:toEndVolume:timeRange:", &v30, v15, COERCE_DOUBLE(__PAIR64__(range.duration.flags, LODWORD(v15))));
        if (self->_volumeAtLastVolumeChange != 0.0)
        {
          JFXLog_DebugComposition();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[JFXCompositionTrackGroup requestVolumeRampFromStartVolume:toEndVolume:timeRange:fillEmptySegment:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

        }
      }
    }
    *(_OWORD *)&range.start.value = *(_OWORD *)&v43.start.value;
    range.start.epoch = v43.start.epoch;
    -[JFXCompositionTrackGroup commitPendingVolumeToTime:](self, "commitPendingVolumeToTime:", &range);
    range = v43;
    -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:](self, "commitVolumeRampFromStartVolume:toEndVolume:timeRange:", &range, COERCE_DOUBLE(__PAIR64__(v43.duration.flags, LODWORD(a3))), COERCE_DOUBLE(__PAIR64__(HIDWORD(v43.start.epoch), LODWORD(a4))));
  }
  return v12 >= 0;
}

- (BOOL)requestVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return -[JFXCompositionTrackGroup requestVolumeRampFromStartVolume:toEndVolume:timeRange:fillEmptySegment:](self, "requestVolumeRampFromStartVolume:toEndVolume:timeRange:fillEmptySegment:", v7, 0);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AVMutableCompositionTrack)videoTrack
{
  return self->_videoTrack;
}

- (void)setVideoTrack:(id)a3
{
  objc_storeStrong((id *)&self->_videoTrack, a3);
}

- (AVMutableCompositionTrack)audioTrack
{
  return self->_audioTrack;
}

- (NSMutableArray)audioSegments
{
  return self->_audioSegments;
}

- (void)setAudioSegments:(id)a3
{
  objc_storeStrong((id *)&self->_audioSegments, a3);
}

- (AVMutableAudioMixInputParameters)audioParameters
{
  return self->_audioParameters;
}

- (void)setAudioParameters:(id)a3
{
  objc_storeStrong((id *)&self->_audioParameters, a3);
}

- (NSString)preferredAudioTimePitchAlgorithm
{
  return self->_preferredAudioTimePitchAlgorithm;
}

- (void)setPreferredAudioTimePitchAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAudioTimePitchAlgorithm, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursor
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursorAtLastVideoInsertion
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfLastVolumeChange
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setTimeOfLastVolumeChange:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timeOfLastVolumeChange.epoch = a3->var3;
  *(_OWORD *)&self->_timeOfLastVolumeChange.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfLastRequest
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void)setTimeOfLastRequest:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timeOfLastRequest.epoch = a3->var3;
  *(_OWORD *)&self->_timeOfLastRequest.value = v3;
}

- (float)volumeAtLastVolumeChange
{
  return self->_volumeAtLastVolumeChange;
}

- (void)setVolumeAtLastVolumeChange:(float)a3
{
  self->_volumeAtLastVolumeChange = a3;
}

- (float)volumeChangePending
{
  return self->_volumeChangePending;
}

- (void)setVolumeChangePending:(float)a3
{
  self->_volumeChangePending = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutStart
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setFadeOutStart:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_fadeOutStart.epoch = a3->var3;
  *(_OWORD *)&self->_fadeOutStart.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- (void)setFadeOutDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_fadeOutDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fadeOutDuration.value = v3;
}

- (AVMutableComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (void)setIsExporting:(BOOL)a3
{
  self->_isExporting = a3;
}

- (NSString)timePitchAlgorithm
{
  return self->_timePitchAlgorithm;
}

- (void)setTimePitchAlgorithm:(id)a3
{
  self->_timePitchAlgorithm = (NSString *)a3;
}

- (NSMutableArray)extraAudioTrackGroups
{
  return self->_extraAudioTrackGroups;
}

- (void)setExtraAudioTrackGroups:(id)a3
{
  objc_storeStrong((id *)&self->_extraAudioTrackGroups, a3);
}

- (opaqueCMFormatDescription)audioFormatDescription
{
  return self->_audioFormatDescription;
}

- (void)setAudioFormatDescription:(opaqueCMFormatDescription *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (BOOL)seenSpeedClip
{
  return self->_seenSpeedClip;
}

- (void)setSeenSpeedClip:(BOOL)a3
{
  self->_seenSpeedClip = a3;
}

- (BOOL)seenMoreThanOneASBD
{
  return self->_seenMoreThanOneASBD;
}

- (void)setSeenMoreThanOneASBD:(BOOL)a3
{
  self->_seenMoreThanOneASBD = a3;
}

- (NSDictionary)fmTrackInfoDict
{
  return self->_fmTrackInfoDict;
}

- (void)setFmTrackInfoDict:(id)a3
{
  objc_storeStrong((id *)&self->_fmTrackInfoDict, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastRampToZeroEnd
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (void)setLastRampToZeroEnd:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastRampToZeroEnd.epoch = a3->var3;
  *(_OWORD *)&self->_lastRampToZeroEnd.value = v3;
}

- (BOOL)isFlexMusic
{
  return self->_isFlexMusic;
}

- (void)setIsFlexMusic:(BOOL)a3
{
  self->_isFlexMusic = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursorForMovieAudio
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (BOOL)videoTrackInUse
{
  return self->_videoTrackInUse;
}

- (void)setVideoTrackInUse:(BOOL)a3
{
  self->_videoTrackInUse = a3;
}

- (NSMutableArray)videoSegments
{
  return self->_videoSegments;
}

- (void)setVideoSegments:(id)a3
{
  objc_storeStrong((id *)&self->_videoSegments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSegments, 0);
  objc_storeStrong((id *)&self->_fmTrackInfoDict, 0);
  objc_storeStrong((id *)&self->_extraAudioTrackGroups, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_preferredAudioTimePitchAlgorithm, 0);
  objc_storeStrong((id *)&self->_audioParameters, 0);
  objc_storeStrong((id *)&self->_audioSegments, 0);
  objc_storeStrong((id *)&self->_audioTrack, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)validate
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_6(&dword_2269A9000, v0, v1, "Video-%@ failed to validate:\n%@");
}

- (void)applyToTrack:(_QWORD *)a3 withSegments:(os_log_t)log assets:.cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "apply_to_track: WARNING asset %@ not found in assetsUsed", buf, 0xCu);

}

void __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 40), "sourceURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "Unable to insert %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)commitVolumeRampFromStartVolume:(void *)a1 toEndVolume:(uint8_t *)buf timeRange:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "An error occurred building an Audio Mix: %@", buf, 0xCu);

}

- (void)commitVolumeRampFromStartVolume:(uint64_t)a3 toEndVolume:(uint64_t)a4 timeRange:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, " --- too small of a fade ", a5, a6, a7, a8, 0);
}

- (void)commitPendingVolumeToTime:(CMTime *)a1 .cold.1(CMTime *a1)
{
  Float64 Seconds;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMTime v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = *a1;
  Seconds = CMTimeGetSeconds(&v8);
  v8.timescale = HIDWORD(Seconds);
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "commitPendingVolumeToTime: %f in Past", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_3();
}

- (void)requestVolumeRampFromStartVolume:(uint64_t)a3 toEndVolume:(uint64_t)a4 timeRange:(uint64_t)a5 fillEmptySegment:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "Empty segment with volume not 0, fix me...", a5, a6, a7, a8, 0);
}

@end
