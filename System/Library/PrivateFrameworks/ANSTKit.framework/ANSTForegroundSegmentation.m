@implementation ANSTForegroundSegmentation

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTForegroundSegmentation)init
{
  ANSTForegroundSegmentation *result;

  result = (ANSTForegroundSegmentation *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (Class)_concreteClassOfVersion:(unint64_t)a3
{
  if (a3 != 0x20000 && a3 != 0x10000)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (ANSTForegroundSegmentation)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTForegroundSegmentation;
  return -[ANSTAlgorithm initWithConfiguration:](&v4, sel_initWithConfiguration_, a3);
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, a4);
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

- (unint64_t)outputBufferWidth
{
  return self->_outputBufferWidth;
}

- (unint64_t)outputBufferHeight
{
  return self->_outputBufferHeight;
}

- (unsigned)outputBufferPixelFormat
{
  return self->_outputBufferPixelFormat;
}

@end
