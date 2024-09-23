@implementation VideoAccessIndexNorm

- (id)initFromFile:(id)a3 pixelFormat:(unsigned int)a4 normalizer:(void *)a5
{
  objc_super v6;

  self->mNormalizer = a5;
  v6.receiver = self;
  v6.super_class = (Class)VideoAccessIndexNorm;
  return -[VideoAccessIndex initFromFile:pixelFormat:frameTimes:](&v6, sel_initFromFile_pixelFormat_frameTimes_, a3, *(_QWORD *)&a4, (char *)a5 + 8);
}

- (int)getFrameAtIndex:(unsigned int)a3 pixBuf:(__CVBuffer *)a4
{
  uint64_t v6;
  objc_super v8;

  v6 = (*(uint64_t (**)(void *, _QWORD))(*(_QWORD *)self->mNormalizer + 16))(self->mNormalizer, *(_QWORD *)&a3);
  v8.receiver = self;
  v8.super_class = (Class)VideoAccessIndexNorm;
  return -[VideoAccessIndex getFrameAtIndex:pixBuf:](&v8, sel_getFrameAtIndex_pixBuf_, v6, a4);
}

@end
