@implementation FTCinematicTrackingResult

- (FTCinematicTrackingResult)init
{
  FTCinematicTrackingResult *v2;
  FTCinematicTrackingResult *v3;
  __int128 *v4;
  FTCinematicTrackingResult *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FTCinematicTrackingResult;
  v2 = -[FTCinematicTrackingResult init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (__int128 *)MEMORY[0x24BDC0D40];
    v9 = *MEMORY[0x24BDC0D40];
    v10 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    -[FTCinematicTrackingResult setSourceFrameTimestamp:](v2, "setSourceFrameTimestamp:", &v9);
    v7 = *v4;
    v8 = *((_QWORD *)v4 + 2);
    -[FTCinematicTrackingResult setMostRecentTapTime:](v3, "setMostRecentTapTime:", &v7);
    -[FTCinematicTrackingResult setDetectorDidRun:](v3, "setDetectorDidRun:", 0);
    v5 = v3;
  }

  return v3;
}

- (FTCinematicTrackingResult)initWithCoder:(id)a3
{
  id v4;
  FTCinematicTrackingResult *v5;
  FTCinematicTrackingResult *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *metadata;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *tracks;
  FTCinematicTrackingResult *v17;
  __int128 v19;
  int64_t v20;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FTCinematicTrackingResult;
  v5 = -[FTCinematicTrackingResult init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", CFSTR("sourceFrameTimestamp"));
      *(_OWORD *)&v6->_sourceFrameTimestamp.value = v19;
      v6->_sourceFrameTimestamp.epoch = v20;
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", CFSTR("mostRecentTapTime"));
    }
    else
    {
      v5->_sourceFrameTimestamp.value = 0;
      *(_QWORD *)&v5->_sourceFrameTimestamp.timescale = 0;
      v5->_sourceFrameTimestamp.epoch = 0;
      v19 = 0uLL;
      v20 = 0;
    }
    *(_OWORD *)&v6->_mostRecentTapTime.value = v19;
    v6->_mostRecentTapTime.epoch = v20;
    v6->_detectorDidRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectorDidRun"), v19, v20);
    v7 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("metadata"));
    v10 = objc_claimAutoreleasedReturnValue();
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("tracks"));
    v15 = objc_claimAutoreleasedReturnValue();
    tracks = v6->_tracks;
    v6->_tracks = (NSArray *)v15;

    v17 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  $95D729B680665BEAEFA1D6FCA8238556 mostRecentTapTime;
  $95D729B680665BEAEFA1D6FCA8238556 sourceFrameTimestamp;

  v4 = a3;
  sourceFrameTimestamp = self->_sourceFrameTimestamp;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &sourceFrameTimestamp, CFSTR("sourceFrameTimestamp"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tracks, CFSTR("tracks"));
  mostRecentTapTime = self->_mostRecentTapTime;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &mostRecentTapTime, CFSTR("mostRecentTapTime"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_detectorDidRun, CFSTR("detectorDidRun"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceFrameTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setSourceFrameTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_sourceFrameTimestamp.epoch = a3->var3;
  *(_OWORD *)&self->_sourceFrameTimestamp.value = v3;
}

- (NSArray)tracks
{
  return self->_tracks;
}

- (void)setTracks:(id)a3
{
  objc_storeStrong((id *)&self->_tracks, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mostRecentTapTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setMostRecentTapTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_mostRecentTapTime.epoch = a3->var3;
  *(_OWORD *)&self->_mostRecentTapTime.value = v3;
}

- (BOOL)detectorDidRun
{
  return self->_detectorDidRun;
}

- (void)setDetectorDidRun:(BOOL)a3
{
  self->_detectorDidRun = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (FTCinematicTapResponse)tapResponse
{
  return self->_tapResponse;
}

- (void)setTapResponse:(id)a3
{
  objc_storeStrong((id *)&self->_tapResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapResponse, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
}

@end
