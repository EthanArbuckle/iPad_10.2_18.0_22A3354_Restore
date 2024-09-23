@implementation ANSTVideoMaskRefineAlgorithmResult

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVideoMaskRefineAlgorithmResult)init
{
  ANSTVideoMaskRefineAlgorithmResult *result;

  result = (ANSTVideoMaskRefineAlgorithmResult *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (id)_init
{
  return (id)((uint64_t (*)(ANSTVideoMaskRefineAlgorithmResult *, char *))MEMORY[0x24BEDD108])(self, sel_init);
}

- (ANSTVideoMaskRefineAlgorithmResult)initWithSkinMask:(__CVBuffer *)a3 hairMask:(__CVBuffer *)a4 personMask:(__CVBuffer *)a5
{
  ANSTVideoMaskRefineAlgorithmResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ANSTVideoMaskRefineAlgorithmResult;
  v8 = -[ANSTResult _init](&v10, sel__init);
  if (v8)
  {
    v8->_skinMask = CVPixelBufferRetain(a3);
    v8->_hairMask = CVPixelBufferRetain(a4);
    v8->_personMask = CVPixelBufferRetain(a5);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_skinMask);
  CVPixelBufferRelease(self->_hairMask);
  CVPixelBufferRelease(self->_personMask);
  v3.receiver = self;
  v3.super_class = (Class)ANSTVideoMaskRefineAlgorithmResult;
  -[ANSTVideoMaskRefineAlgorithmResult dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)refinedMaskForSemanticCategory:(id)a3
{
  __CFString *v4;
  const char *v5;
  __CFString *v6;
  const char *v7;
  int *v8;
  const char *v9;
  __CVBuffer *v10;

  v4 = (__CFString *)a3;
  v6 = v4;
  if (CFSTR("Skin") == v4 || (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("Skin")) & 1) != 0)
  {
    v8 = &OBJC_IVAR___ANSTVideoMaskRefineAlgorithmResult__skinMask;
  }
  else if (CFSTR("Hair") == v6 || (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("Hair")) & 1) != 0)
  {
    v8 = &OBJC_IVAR___ANSTVideoMaskRefineAlgorithmResult__hairMask;
  }
  else
  {
    if (CFSTR("Person") != v6 && !objc_msgSend_isEqualToString_(v6, v9, (uint64_t)CFSTR("Person")))
    {
      v10 = 0;
      goto LABEL_11;
    }
    v8 = &OBJC_IVAR___ANSTVideoMaskRefineAlgorithmResult__personMask;
  }
  v10 = *(Class *)((char *)&self->super.super.isa + *v8);
LABEL_11:

  return v10;
}

@end
