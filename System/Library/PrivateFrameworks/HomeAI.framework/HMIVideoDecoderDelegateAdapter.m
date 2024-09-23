@implementation HMIVideoDecoderDelegateAdapter

- (void)decoder:(id)a3 didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[HMIVideoDecoderDelegateAdapter decoderDidDecodeSampleBuffer](self, "decoderDidDecodeSampleBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoDecoderDelegateAdapter decoderDidDecodeSampleBuffer](self, "decoderDidDecodeSampleBuffer");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);

  }
}

- (void)decoder:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoDecoderDelegateAdapter decoderDidFailWithError](self, "decoderDidFailWithError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoDecoderDelegateAdapter decoderDidFailWithError](self, "decoderDidFailWithError");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (id)decoderDidDecodeSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setDecoderDidDecodeSampleBuffer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)decoderDidFailWithError
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDecoderDidFailWithError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decoderDidFailWithError, 0);
  objc_storeStrong(&self->_decoderDidDecodeSampleBuffer, 0);
}

@end
