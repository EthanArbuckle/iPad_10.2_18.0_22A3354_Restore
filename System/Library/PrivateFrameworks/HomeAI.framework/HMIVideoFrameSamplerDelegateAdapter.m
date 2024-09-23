@implementation HMIVideoFrameSamplerDelegateAdapter

- (void)frameSampler:(id)a3 didSampleFrame:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoFrameSamplerDelegateAdapter frameSamplerDidSampleFrame](self, "frameSamplerDidSampleFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoFrameSamplerDelegateAdapter frameSamplerDidSampleFrame](self, "frameSamplerDidSampleFrame");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (void)frameSampler:(id)a3 didDropFrame:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoFrameSamplerDelegateAdapter frameSamplerDidDropFrame](self, "frameSamplerDidDropFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoFrameSamplerDelegateAdapter frameSamplerDidDropFrame](self, "frameSamplerDidDropFrame");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (id)frameSamplerDidSampleFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameSamplerDidSampleFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)frameSamplerDidDropFrame
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameSamplerDidDropFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameSamplerDidDropFrame, 0);
  objc_storeStrong(&self->_frameSamplerDidSampleFrame, 0);
}

@end
