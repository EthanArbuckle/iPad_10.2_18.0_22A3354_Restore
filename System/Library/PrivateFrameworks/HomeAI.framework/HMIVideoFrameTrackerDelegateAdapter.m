@implementation HMIVideoFrameTrackerDelegateAdapter

- (void)frameTracker:(id)a3 didTrackFrame:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 motionDetections:(id)a6 tracks:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v16;

  v16 = a3;
  v12 = a6;
  v13 = a7;
  -[HMIVideoFrameTrackerDelegateAdapter frameTrackerDidTrackFrame](self, "frameTrackerDidTrackFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMIVideoFrameTrackerDelegateAdapter frameTrackerDidTrackFrame](self, "frameTrackerDidTrackFrame");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *, opaqueCMSampleBuffer *, id, id))v15)[2](v15, v16, a4, a5, v12, v13);

  }
}

- (id)frameTrackerDidTrackFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameTrackerDidTrackFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameTrackerDidTrackFrame, 0);
}

@end
