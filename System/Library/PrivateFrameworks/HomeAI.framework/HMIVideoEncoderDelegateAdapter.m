@implementation HMIVideoEncoderDelegateAdapter

- (void)encoder:(id)a3 didEncodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoEncoderDelegateAdapter encoderDidEncodeSampleBuffer](self, "encoderDidEncodeSampleBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoEncoderDelegateAdapter encoderDidEncodeSampleBuffer](self, "encoderDidEncodeSampleBuffer");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (void)encoder:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoEncoderDelegateAdapter encoderDidFailWithError](self, "encoderDidFailWithError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoEncoderDelegateAdapter encoderDidFailWithError](self, "encoderDidFailWithError");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (id)encoderDidEncodeSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setEncoderDidEncodeSampleBuffer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)encoderDidFailWithError
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEncoderDidFailWithError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_encoderDidFailWithError, 0);
  objc_storeStrong(&self->_encoderDidEncodeSampleBuffer, 0);
}

@end
