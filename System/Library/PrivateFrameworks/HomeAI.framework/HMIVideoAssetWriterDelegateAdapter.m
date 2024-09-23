@implementation HMIVideoAssetWriterDelegateAdapter

- (void)assetWriter:(id)a3 didOutputInitializationSegment:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAssetWriterDelegateAdapter assetWriterDidOutputInitializationSegment](self, "assetWriterDidOutputInitializationSegment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAssetWriterDelegateAdapter assetWriterDidOutputInitializationSegment](self, "assetWriterDidOutputInitializationSegment");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)assetWriter:(id)a3 didOutputSeparableSegment:(id)a4 segmentReport:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[HMIVideoAssetWriterDelegateAdapter assetWriterDidOutputSeparableSegment](self, "assetWriterDidOutputSeparableSegment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMIVideoAssetWriterDelegateAdapter assetWriterDidOutputSeparableSegment](self, "assetWriterDidOutputSeparableSegment");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v11)[2](v11, v12, v8, v9);

  }
}

- (void)assetWriter:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAssetWriterDelegateAdapter assetWriterDidFailWithError](self, "assetWriterDidFailWithError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAssetWriterDelegateAdapter assetWriterDidFailWithError](self, "assetWriterDidFailWithError");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (id)assetWriterDidOutputInitializationSegment
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAssetWriterDidOutputInitializationSegment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)assetWriterDidOutputSeparableSegment
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetWriterDidOutputSeparableSegment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)assetWriterDidFailWithError
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetWriterDidFailWithError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assetWriterDidFailWithError, 0);
  objc_storeStrong(&self->_assetWriterDidOutputSeparableSegment, 0);
  objc_storeStrong(&self->_assetWriterDidOutputInitializationSegment, 0);
}

@end
