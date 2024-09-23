@implementation HMIVideoRetimerDelegateAdapter

- (void)retimer:(id)a3 didRetimeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoRetimerDelegateAdapter retimerDidRetimeSampleBuffer](self, "retimerDidRetimeSampleBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoRetimerDelegateAdapter retimerDidRetimeSampleBuffer](self, "retimerDidRetimeSampleBuffer");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (id)retimerDidRetimeSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setRetimerDidRetimeSampleBuffer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retimerDidRetimeSampleBuffer, 0);
}

@end
