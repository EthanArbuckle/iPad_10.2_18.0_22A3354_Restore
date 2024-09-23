@implementation AVCaptureSynchronizedVisionData

- (id)_initWithVisionDataPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 visionDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6
{
  _QWORD *v9;
  AVCaptureSynchronizedVisionDataInternal *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVCaptureSynchronizedVisionData;
  v12 = *a4;
  v9 = -[AVCaptureSynchronizedData _initWithTimestamp:](&v13, sel__initWithTimestamp_, &v12);
  if (v9)
  {
    v10 = objc_alloc_init(AVCaptureSynchronizedVisionDataInternal);
    v9[2] = v10;
    if (v10)
    {
      *(_QWORD *)(v9[2] + 8) = CVPixelBufferRetain(a3);
      *(_BYTE *)(v9[2] + 16) = a5;
      *(_QWORD *)(v9[2] + 24) = a6;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  AVCaptureSynchronizedVisionDataInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {
    CVPixelBufferRelease(internal->visionDataPixelBuffer);

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureSynchronizedVisionData;
  -[AVCaptureSynchronizedData dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)visionDataPixelBuffer
{
  return self->_internal->visionDataPixelBuffer;
}

- (BOOL)visionDataWasDropped
{
  return self->_internal->visionDataWasDropped;
}

- (int64_t)droppedReason
{
  return self->_internal->droppedReason;
}

@end
