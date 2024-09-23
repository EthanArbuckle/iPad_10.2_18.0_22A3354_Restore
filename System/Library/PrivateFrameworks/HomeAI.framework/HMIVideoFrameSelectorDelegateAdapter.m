@implementation HMIVideoFrameSelectorDelegateAdapter

- (void)frameSelector:(id)a3 didSelectFrame:(opaqueCMSampleBuffer *)a4 reference:(opaqueCMSampleBuffer *)a5
{
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a3;
  -[HMIVideoFrameSelectorDelegateAdapter frameSelectorDidSelectFrame](self, "frameSelectorDidSelectFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMIVideoFrameSelectorDelegateAdapter frameSelectorDidSelectFrame](self, "frameSelectorDidSelectFrame");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *, opaqueCMSampleBuffer *))v9)[2](v9, v10, a4, a5);

  }
}

- (void)frameSelector:(id)a3 didSkipFrame:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoFrameSelectorDelegateAdapter frameSelectorDidSkipFrame](self, "frameSelectorDidSkipFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoFrameSelectorDelegateAdapter frameSelectorDidSkipFrame](self, "frameSelectorDidSkipFrame");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (opaqueCMSampleBuffer)frameSelector:(id)a3 prepareFrame:(opaqueCMSampleBuffer *)a4
{
  id v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  opaqueCMSampleBuffer *v9;

  v6 = a3;
  -[HMIVideoFrameSelectorDelegateAdapter frameSelectorPrepareFrame](self, "frameSelectorPrepareFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoFrameSelectorDelegateAdapter frameSelectorPrepareFrame](self, "frameSelectorPrepareFrame");
    v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = (opaqueCMSampleBuffer *)((uint64_t (**)(_QWORD, id, opaqueCMSampleBuffer *))v8)[2](v8, v6, a4);

  }
  else
  {
    v9 = (opaqueCMSampleBuffer *)CFRetain(a4);
  }

  return v9;
}

- (id)frameSelectorDidSelectFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameSelectorDidSelectFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)frameSelectorDidSkipFrame
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameSelectorDidSkipFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)frameSelectorPrepareFrame
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFrameSelectorPrepareFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameSelectorPrepareFrame, 0);
  objc_storeStrong(&self->_frameSelectorDidSkipFrame, 0);
  objc_storeStrong(&self->_frameSelectorDidSelectFrame, 0);
}

@end
