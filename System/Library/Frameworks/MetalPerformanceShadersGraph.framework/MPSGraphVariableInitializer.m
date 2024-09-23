@implementation MPSGraphVariableInitializer

- (MPSGraphVariableInitializer)init
{
  MPSGraphVariableInitializer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPSGraphVariableInitializer;
  result = -[MPSGraphVariableInitializer init](&v3, sel_init);
  result->_constant = 0.0;
  result->_minimum = -INFINITY;
  result->_maximum = INFINITY;
  return result;
}

+ (id)initializerWithConstant:(double)a3
{
  MPSGraphVariableInitializer *v4;

  v4 = objc_alloc_init(MPSGraphVariableInitializer);
  v4->_initializerType = 0;
  v4->_constant = a3;
  return v4;
}

+ (id)initializerWithZeros
{
  MPSGraphVariableInitializer *v2;

  v2 = objc_alloc_init(MPSGraphVariableInitializer);
  v2->_initializerType = 0;
  v2->_constant = 0.0;
  return v2;
}

+ (id)initializerWithOnes
{
  MPSGraphVariableInitializer *v2;

  v2 = objc_alloc_init(MPSGraphVariableInitializer);
  v2->_initializerType = 0;
  v2->_constant = 1.0;
  return v2;
}

+ (id)initializerWithRandomUniformWithMinimum:(double)a3 maximum:(double)a4
{
  MPSGraphVariableInitializer *v6;

  if (a4 <= a3 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v6 = objc_alloc_init(MPSGraphVariableInitializer);
  v6->_initializerType = 1;
  v6->_minimum = a3;
  v6->_maximum = a4;
  return v6;
}

+ (id)initializerWithFile:(id)a3
{
  id v4;
  MPSGraphVariableInitializer *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPSGraphVariableInitializer);
  v5->_initializerType = 2;
  objc_storeStrong((id *)&v5->_file, a3);
  if (!v4)
    __assert_rtn("+[MPSGraphVariableInitializer initializerWithFile:]", "MPSGraphHighLevelOps.mm", 71, "file");

  return v5;
}

- (id)initializedDataWithNumberOfValues:(unint64_t)a3 dataType:(unsigned int)a4
{
  size_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int initializerType;
  float *v12;
  int v13;
  double minimum;
  float v15;
  float v16;
  void *v17;
  id v18;
  NSString *file;
  uint64_t __pattern4;

  if (a4 != 268435488 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v6 = 4 * a3;
  v7 = malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  v8 = v7;
  *(float *)&v9 = self->_constant;
  __pattern4 = v9;
  initializerType = self->_initializerType;
  if (initializerType)
  {
    if (initializerType == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", self->_file);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17 && MTLReportFailureTypeEnabled())
      {
        file = self->_file;
        MTLReportFailure();
      }
      v18 = objc_retainAutorelease(v17);
      memcpy(v8, (const void *)objc_msgSend(v18, "bytes"), v6);

    }
    else if (initializerType == 1 && a3 != 0)
    {
      v12 = (float *)v7;
      do
      {
        v13 = rand_r((unsigned int *)&__pattern4 + 1);
        minimum = self->_minimum;
        v15 = (self->_maximum - minimum) * (float)((float)v13 * 4.6566e-10);
        ++HIDWORD(__pattern4);
        v16 = v15 - minimum;
        *v12++ = v16;
        --a3;
      }
      while (a3);
    }
  }
  else
  {
    memset_pattern4(v7, &__pattern4, 4 * a3);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1, file, __pattern4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)initializerType
{
  return self->_initializerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
}

@end
