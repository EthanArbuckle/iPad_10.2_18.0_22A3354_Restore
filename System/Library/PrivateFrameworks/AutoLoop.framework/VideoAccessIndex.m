@implementation VideoAccessIndex

- (id)initFromFile:(id)a3 pixelFormat:(unsigned int)a4 frameTimes:(const void *)a5
{
  uint64_t v6;
  id v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  objc_super v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VideoAccessIndex;
  v9 = -[VideoAccessIndex init](&v19, sel_init);
  if (v9)
  {
    v10 = -[VideoReaderRand initFromFile:frameTimes:]([VideoReaderRand alloc], "initFromFile:frameTimes:", v8, a5);
    v11 = (void *)*((_QWORD *)v9 + 7);
    *((_QWORD *)v9 + 7) = v10;

    v12 = (void *)*((_QWORD *)v9 + 7);
    if (!v12)
    {
      v17 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v12, "setPixelFormatOptions:", v6);
    if (v9 + 8 != a5)
      sub_1D4C6454C(v9 + 8, *(char **)a5, *((_QWORD *)a5 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3));
    *((_DWORD *)v9 + 8) = -1431655765 * ((*((_QWORD *)v9 + 2) - *((_QWORD *)v9 + 1)) >> 3);
    objc_msgSend(*((id *)v9 + 7), "videoTrack");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v9 + 5);
    *((_QWORD *)v9 + 5) = v13;

    objc_msgSend(*((id *)v9 + 7), "asset");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v9 + 6);
    *((_QWORD *)v9 + 6) = v15;

  }
  v17 = v9;
LABEL_8:

  return v17;
}

- (int)getFrameAtIndex:(unsigned int)a3 pixBuf:(__CVBuffer *)a4
{
  int v4;
  char *v6;
  VideoReaderRand *readerRand;
  uint64_t v8;
  __CVBuffer *ImageBuffer;
  __int128 v11;
  uint64_t v12;
  CMSampleBufferRef sbuf;
  int v14;

  if (self->numFrames < a3)
    return 4;
  v6 = (char *)self->mFrameTimes.__begin_ + 24 * a3;
  v14 = 0;
  sbuf = 0;
  readerRand = self->readerRand;
  v8 = *((_QWORD *)v6 + 2);
  v11 = *(_OWORD *)v6;
  v12 = v8;
  v4 = -[VideoReaderRand getFrameAtTime:frame:rawFrameIndex:](readerRand, "getFrameAtTime:frame:rawFrameIndex:", &v11, &sbuf, &v14);
  if (!v4)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    *a4 = ImageBuffer;
    CFRetain(ImageBuffer);
    CFRelease(sbuf);
  }
  return v4;
}

- (AVAssetTrack)videoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 40, 1);
}

- (AVAsset)asset
{
  return (AVAsset *)objc_getProperty(self, a2, 48, 1);
}

- (VideoReaderRand)readerRand
{
  return (VideoReaderRand *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReaderRand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->readerRand, 0);
  objc_storeStrong((id *)&self->asset, 0);
  objc_storeStrong((id *)&self->videoTrack, 0);
  begin = self->mFrameTimes.__begin_;
  if (begin)
  {
    self->mFrameTimes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
