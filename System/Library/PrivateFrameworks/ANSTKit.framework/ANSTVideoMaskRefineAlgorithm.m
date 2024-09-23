@implementation ANSTVideoMaskRefineAlgorithm

+ (id)supportedSemanticCategories
{
  return (id)MEMORY[0x24BEDD108](a1, sel_supportedSemanticCategoriesOfVersion_, 0x10000);
}

+ (id)supportedSemanticCategoriesOfVersion:(unint64_t)a3
{
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  if (a3 == 0x10000)
  {
    v5[0] = CFSTR("Person");
    v5[1] = CFSTR("Skin");
    v5[2] = CFSTR("Hair");
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v5, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVideoMaskRefineAlgorithm)init
{
  ANSTVideoMaskRefineAlgorithm *result;

  result = (ANSTVideoMaskRefineAlgorithm *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (Class)_concreteClassOfVersion:(unint64_t)a3
{
  if (a3 != 0x10000)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (ANSTVideoMaskRefineAlgorithm)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoMaskRefineAlgorithm;
  return -[ANSTAlgorithm initWithConfiguration:](&v4, sel_initWithConfiguration_, a3);
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 coarseSegementationMasks:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  id result;

  v7 = a4;
  result = (id)objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
  __break(1u);
  return result;
}

@end
