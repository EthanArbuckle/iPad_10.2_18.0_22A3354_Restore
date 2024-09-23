@implementation MLSoftmaxNDBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  return a3;
}

- (MLSoftmaxNDBrick)initWithParameters:(id)a3
{
  id v4;
  MLSoftmaxNDBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *outputShapes;
  uint64_t v12;
  NSArray *inputShapes;
  uint64_t v14;
  NSNumber *axis;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  unsigned int i;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLSoftmaxNDBrick;
  v5 = -[MLSoftmaxNDBrick init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputRanks"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputRanks"));
    v8 = objc_claimAutoreleasedReturnValue();
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputShapes"));
    v10 = objc_claimAutoreleasedReturnValue();
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputShapes"));
    v12 = objc_claimAutoreleasedReturnValue();
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("axis"));
    v14 = objc_claimAutoreleasedReturnValue();
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v14;

    v16 = 0;
    v5->_shapeInfoNeeded = 0;
    while (-[NSArray count](v5->_inputRanks, "count") > v16)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_inputRanks, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      if (v18 >= 6)
        v5->_shapeInfoNeeded = 1;
      ++v16;
    }
    for (i = 0; -[NSArray count](v5->_outputRanks, "count") > i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_outputRanks, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 >= 6)
        v5->_shapeInfoNeeded = 1;
    }
  }

  return v5;
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const float *v9;
  void *v10;
  float *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *exception;
  void *v29;
  uint64_t *v30;
  void *v31;
  _BYTE *v32;
  float __C;
  float __A;
  int v35;
  float *v36[3];
  float *v37[3];
  void *__p[3];
  _QWORD *v39;
  uint64_t v40;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const float *)objc_msgSend(v8, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (float *)objc_msgSend(v10, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v31, objc_msgSend(v12, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v29, objc_msgSend(v13, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v14, &v31);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&v31);

  }
  v16 = -[NSNumber integerValue](self->_axis, "integerValue");
  v17 = (v32 - (_BYTE *)v31) >> 3;
  if (v17 != ((char *)v30 - (_BYTE *)v29) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Mismatch between ranks of input and output tensors.");
    goto LABEL_33;
  }
  v18 = ((v16 >> 63) & ((v32 - (_BYTE *)v31) >> 3)) + v16;
  if (v18 < 0 || v18 >= v17)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Invalid value of the argument 'axis'.");
LABEL_33:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)&v29, (char *)v31, (uint64_t)v32, (v32 - (_BYTE *)v31) >> 3);
  std::vector<unsigned long>::vector(&v39, v17);
  std::vector<unsigned long>::vector(__p, v17);
  v19 = (uint64_t *)v29;
  v20 = 1;
  while (v19 != v30)
  {
    v21 = *v19++;
    v20 *= v21;
  }
  std::vector<float>::vector(v37, v20);
  std::vector<float>::vector(v36, v20);
  TensorAlgebraUtils::computeStrides((uint64_t)v31, (uint64_t)v32, (uint64_t)v39, v40);
  __A = 0.0;
  v35 = v20;
  __C = 0.0;
  vDSP_maxv(v9, 1, &__C, v20);
  __C = -__C;
  vDSP_vsadd(v9, 1, &__C, v36[0], 1, v20);
  vvexpf(v37[0], v36[0], &v35);
  if (v20)
  {
    v22 = 0;
    v23 = v39;
    do
    {
      v24 = v23[v18];
      if (v24)
      {
        v25 = 0;
        v26 = v22;
        do
        {
          vDSP_sve(&v37[0][v26], v24, &__A, *((_QWORD *)v31 + v18));
          vDSP_vfill(&__A, &v36[0][v26], v39[v18], *((_QWORD *)v31 + v18));
          ++v25;
          v23 = v39;
          v24 = v39[v18];
          ++v26;
        }
        while (v25 < v24);
      }
      v27 = v20;
      if (v18 > 0)
        v27 = v23[v18 - 1];
      v22 += v27;
    }
    while (v22 < v20);
  }
  vvdivf(v11, v37[0], v36[0], &v35);
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v39)
  {
    v40 = (uint64_t)v39;
    operator delete(v39);
  }
  if (v29)
  {
    v30 = (uint64_t *)v29;
    operator delete(v29);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }

}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (NSNumber)axis
{
  return self->_axis;
}

- (NSArray)inputRanks
{
  return self->_inputRanks;
}

- (NSArray)outputRanks
{
  return self->_outputRanks;
}

- (NSArray)inputShapes
{
  return self->_inputShapes;
}

- (NSArray)outputShapes
{
  return self->_outputShapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);
  objc_storeStrong((id *)&self->_axis, 0);
}

@end
