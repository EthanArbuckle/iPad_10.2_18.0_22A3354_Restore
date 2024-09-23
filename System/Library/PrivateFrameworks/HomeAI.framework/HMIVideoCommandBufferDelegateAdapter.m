@implementation HMIVideoCommandBufferDelegateAdapter

- (void)buffer:(id)a3 willHandleSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoCommandBufferDelegateAdapter bufferWillHandleSampleBuffer](self, "bufferWillHandleSampleBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoCommandBufferDelegateAdapter bufferWillHandleSampleBuffer](self, "bufferWillHandleSampleBuffer");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (void)bufferWillFlush:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[HMIVideoCommandBufferDelegateAdapter bufferWillFlush](self, "bufferWillFlush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMIVideoCommandBufferDelegateAdapter bufferWillFlush](self, "bufferWillFlush");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)bufferWillHandleSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setBufferWillHandleSampleBuffer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)bufferWillFlush
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBufferWillFlush:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bufferWillFlush, 0);
  objc_storeStrong(&self->_bufferWillHandleSampleBuffer, 0);
}

@end
