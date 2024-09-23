@implementation AVCaptureSynchronizedPointCloudData

- (id)_initWithPointCloudDataBuffer:(id)a3 timestamp:(id *)a4 pointCloudDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6
{
  _QWORD *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVCaptureSynchronizedPointCloudData;
  v11 = *a4;
  v9 = -[AVCaptureSynchronizedData _initWithTimestamp:](&v12, sel__initWithTimestamp_, &v11);
  if (v9)
  {
    v9[2] = a3;
    *((_BYTE *)v9 + 24) = a5;
    v9[4] = a6;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSynchronizedPointCloudData;
  -[AVCaptureSynchronizedData dealloc](&v3, sel_dealloc);
}

- (AVPointCloudData)pointCloudData
{
  return self->_pointCloudData;
}

- (BOOL)pointCloudDataWasDropped
{
  return self->_pointCloudDataWasDropped;
}

- (int64_t)droppedReason
{
  return self->_droppedReason;
}

@end
