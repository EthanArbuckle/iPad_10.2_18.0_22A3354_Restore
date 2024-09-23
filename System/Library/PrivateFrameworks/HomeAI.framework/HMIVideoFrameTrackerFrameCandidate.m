@implementation HMIVideoFrameTrackerFrameCandidate

- (HMIVideoFrameTrackerFrameCandidate)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 score:(float)a4 motionDetections:(id)a5 tracks:(id)a6
{
  id v11;
  id v12;
  HMIVideoFrameTrackerFrameCandidate *v13;
  objc_super v15;

  v11 = a5;
  v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMIVideoFrameTrackerFrameCandidate;
  v13 = -[HMIVideoFrameTrackerFrameCandidate init](&v15, sel_init);
  if (v13)
  {
    v13->_sbuf = (opaqueCMSampleBuffer *)CFRetain(a3);
    v13->_score = a4;
    objc_storeStrong((id *)&v13->_motionDetections, a5);
    objc_storeStrong((id *)&v13->_tracks, a6);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_sbuf);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoFrameTrackerFrameCandidate;
  -[HMIVideoFrameTrackerFrameCandidate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  HMICMSampleBufferTinyDescription(-[HMIVideoFrameTrackerFrameCandidate sbuf](self, "sbuf"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFrameTrackerFrameCandidate score](self, "score");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (opaqueCMSampleBuffer)sbuf
{
  return self->_sbuf;
}

- (float)score
{
  return self->_score;
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)tracks
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_motionDetections, 0);
}

@end
