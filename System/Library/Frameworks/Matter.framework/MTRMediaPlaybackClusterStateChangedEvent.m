@implementation MTRMediaPlaybackClusterStateChangedEvent

- (MTRMediaPlaybackClusterStateChangedEvent)init
{
  MTRMediaPlaybackClusterStateChangedEvent *v2;
  MTRMediaPlaybackClusterStateChangedEvent *v3;
  NSNumber *currentState;
  NSNumber *startTime;
  NSNumber *duration;
  uint64_t v7;
  MTRMediaPlaybackClusterPlaybackPositionStruct *sampledPosition;
  NSNumber *playbackSpeed;
  NSNumber *seekRangeEnd;
  NSNumber *seekRangeStart;
  NSData *data;
  NSNumber *audioAdvanceUnmuted;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTRMediaPlaybackClusterStateChangedEvent;
  v2 = -[MTRMediaPlaybackClusterStateChangedEvent init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    currentState = v2->_currentState;
    v2->_currentState = (NSNumber *)&unk_250591B18;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_250591B18;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_250591B18;

    v7 = objc_opt_new();
    sampledPosition = v3->_sampledPosition;
    v3->_sampledPosition = (MTRMediaPlaybackClusterPlaybackPositionStruct *)v7;

    playbackSpeed = v3->_playbackSpeed;
    v3->_playbackSpeed = (NSNumber *)&unk_250591B18;

    seekRangeEnd = v3->_seekRangeEnd;
    v3->_seekRangeEnd = (NSNumber *)&unk_250591B18;

    seekRangeStart = v3->_seekRangeStart;
    v3->_seekRangeStart = (NSNumber *)&unk_250591B18;

    data = v3->_data;
    v3->_data = 0;

    audioAdvanceUnmuted = v3->_audioAdvanceUnmuted;
    v3->_audioAdvanceUnmuted = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMediaPlaybackClusterStateChangedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v4 = objc_alloc_init(MTRMediaPlaybackClusterStateChangedEvent);
  objc_msgSend_currentState(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentState_(v4, v8, (uint64_t)v7);

  objc_msgSend_startTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v12, (uint64_t)v11);

  objc_msgSend_duration(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v16, (uint64_t)v15);

  objc_msgSend_sampledPosition(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSampledPosition_(v4, v20, (uint64_t)v19);

  objc_msgSend_playbackSpeed(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPlaybackSpeed_(v4, v24, (uint64_t)v23);

  objc_msgSend_seekRangeEnd(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSeekRangeEnd_(v4, v28, (uint64_t)v27);

  objc_msgSend_seekRangeStart(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSeekRangeStart_(v4, v32, (uint64_t)v31);

  objc_msgSend_data(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v36, (uint64_t)v35);

  objc_msgSend_audioAdvanceUnmuted(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAudioAdvanceUnmuted_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  NSNumber *currentState;
  NSNumber *startTime;
  NSNumber *duration;
  MTRMediaPlaybackClusterPlaybackPositionStruct *sampledPosition;
  NSNumber *playbackSpeed;
  NSNumber *seekRangeEnd;
  NSNumber *seekRangeStart;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  currentState = self->_currentState;
  startTime = self->_startTime;
  duration = self->_duration;
  sampledPosition = self->_sampledPosition;
  playbackSpeed = self->_playbackSpeed;
  seekRangeEnd = self->_seekRangeEnd;
  seekRangeStart = self->_seekRangeStart;
  objc_msgSend_base64EncodedStringWithOptions_(self->_data, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v17, v14, (uint64_t)CFSTR("<%@: currentState:%@; startTime:%@; duration:%@; sampledPosition:%@; playbackSpeed:%@; seekRangeEnd:%@; seekRangeStart:%@; data:%@; audioAdvanceUnmuted:%@; >"),
    v4,
    currentState,
    startTime,
    duration,
    sampledPosition,
    playbackSpeed,
    seekRangeEnd,
    seekRangeStart,
    v13,
    self->_audioAdvanceUnmuted);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MTRMediaPlaybackClusterPlaybackPositionStruct)sampledPosition
{
  return self->_sampledPosition;
}

- (void)setSampledPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)seekRangeEnd
{
  return self->_seekRangeEnd;
}

- (void)setSeekRangeEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)seekRangeStart
{
  return self->_seekRangeStart;
}

- (void)setSeekRangeStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)audioAdvanceUnmuted
{
  return self->_audioAdvanceUnmuted;
}

- (void)setAudioAdvanceUnmuted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAdvanceUnmuted, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_seekRangeStart, 0);
  objc_storeStrong((id *)&self->_seekRangeEnd, 0);
  objc_storeStrong((id *)&self->_playbackSpeed, 0);
  objc_storeStrong((id *)&self->_sampledPosition, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
