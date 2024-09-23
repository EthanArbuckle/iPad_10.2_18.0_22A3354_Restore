@implementation ANSTForegroundSegmentationResult

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTForegroundSegmentationResult)init
{
  ANSTForegroundSegmentationResult *result;

  result = (ANSTForegroundSegmentationResult *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (id)_init
{
  return (id)((uint64_t (*)(ANSTForegroundSegmentationResult *, char *))MEMORY[0x24BEDD108])(self, sel_init);
}

- (ANSTForegroundSegmentationResult)initWithMask:(__CVBuffer *)a3
{
  ANSTForegroundSegmentationResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANSTForegroundSegmentationResult;
  v4 = -[ANSTResult _init](&v6, sel__init);
  if (v4)
    v4->_semanticMap = CVBufferRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_semanticMap);
  v3.receiver = self;
  v3.super_class = (Class)ANSTForegroundSegmentationResult;
  -[ANSTForegroundSegmentationResult dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)semanticMap
{
  return self->_semanticMap;
}

@end
