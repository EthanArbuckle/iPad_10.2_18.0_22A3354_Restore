@implementation ANSTISPAlgorithm

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTISPAlgorithm)init
{
  ANSTISPAlgorithm *result;

  result = (ANSTISPAlgorithm *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
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

- (ANSTISPAlgorithm)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTISPAlgorithm;
  return -[ANSTAlgorithm initWithConfiguration:](&v4, sel_initWithConfiguration_, a3);
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_resultForPixelBuffer_orientation_error_, a3);
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 orientation:(int64_t)a4 error:(id *)a5
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, a4, a5);
  __break(1u);
  return result;
}

- (unint64_t)networkInputBufferWidth
{
  return self->_networkInputBufferWidth;
}

- (unint64_t)networkInputBufferHeight
{
  return self->_networkInputBufferHeight;
}

- (unsigned)networkInputBufferPixelFormat
{
  return self->_networkInputBufferPixelFormat;
}

@end
