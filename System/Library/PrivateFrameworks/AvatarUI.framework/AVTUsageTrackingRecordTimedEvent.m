@implementation AVTUsageTrackingRecordTimedEvent

- (AVTUsageTrackingRecordTimedEvent)initWithStartTime:(id)a3 record:(id)a4
{
  id v7;
  id v8;
  AVTUsageTrackingRecordTimedEvent *v9;
  AVTUsageTrackingRecordTimedEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTUsageTrackingRecordTimedEvent;
  v9 = -[AVTUsageTrackingRecordTimedEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentStartTime, a3);
    objc_storeStrong((id *)&v10->_record, a4);
  }

  return v10;
}

- (void)pauseAtTime:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if (!-[AVTUsageTrackingRecordTimedEvent paused](self, "paused"))
  {
    -[AVTUsageTrackingRecordTimedEvent setPaused:](self, "setPaused:", 1);
    -[AVTUsageTrackingRecordTimedEvent currentStartTime](self, "currentStartTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v4);
    v6 = v5;

    -[AVTUsageTrackingRecordTimedEvent totalTime](self, "totalTime");
    -[AVTUsageTrackingRecordTimedEvent setTotalTime:](self, "setTotalTime:", v6 + v7);
  }

}

- (void)resumeAtTime:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AVTUsageTrackingRecordTimedEvent paused](self, "paused"))
  {
    -[AVTUsageTrackingRecordTimedEvent setPaused:](self, "setPaused:", 0);
    -[AVTUsageTrackingRecordTimedEvent setCurrentStartTime:](self, "setCurrentStartTime:", v4);
  }

}

- (double)totalElapsedTimeAtTime:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (!-[AVTUsageTrackingRecordTimedEvent paused](self, "paused"))
    -[AVTUsageTrackingRecordTimedEvent pauseAtTime:](self, "pauseAtTime:", v4);
  -[AVTUsageTrackingRecordTimedEvent totalTime](self, "totalTime");
  v6 = v5;

  return v6;
}

- (AVTAvatarRecord)record
{
  return self->_record;
}

- (NSDate)currentStartTime
{
  return self->_currentStartTime;
}

- (void)setCurrentStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentStartTime, a3);
}

- (double)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(double)a3
{
  self->_totalTime = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStartTime, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
