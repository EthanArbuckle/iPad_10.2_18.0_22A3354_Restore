@implementation MLConcatNDBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unsigned int i;
  void *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void *__p;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v26, objc_msgSend(v10, "unsignedIntegerValue"));

  v11 = objc_msgSend(v6, "count");
  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v12, &v26);

  }
  else
  {
    std::vector<std::vector<unsigned long>>::vector(&v24, v11);
    for (i = 0; objc_msgSend(v6, "count") > (unint64_t)i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      std::vector<unsigned long>::vector(&__p, objc_msgSend(v14, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&__p);

      v16 = (char *)(v24 + 24 * i);
      if (v16 != (char *)&__p)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v16, (char *)__p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        v23 = __p;
        operator delete(__p);
      }
    }
    v17 = -[NSNumber integerValue](self->_axis, "integerValue");
    v19 = 0;
    v20 = 0;
    v21 = 0;
    std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v19, v24, v25, 0xAAAAAAAAAAAAAAABLL * ((v25 - v24) >> 3));
    BrickLayers::ConcatNDShapeComputation(v17, v19, v20, (uint64_t)v26, (uint64_t)v27);
    __p = &v19;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    __p = &v24;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)&v26, v9);
  objc_msgSend(v8, "addObject:", v9);
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }

  return v8;
}

- (MLConcatNDBrick)initWithParameters:(id)a3
{
  id v4;
  MLConcatNDBrick *v5;
  uint64_t v6;
  NSNumber *axis;
  uint64_t v8;
  NSArray *inputRanks;
  uint64_t v10;
  NSArray *outputRanks;
  uint64_t v12;
  NSArray *inputShapes;
  uint64_t v14;
  NSArray *outputShapes;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  unsigned int i;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLConcatNDBrick;
  v5 = -[MLConcatNDBrick init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("axis"));
    v6 = objc_claimAutoreleasedReturnValue();
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputRanks"));
    v8 = objc_claimAutoreleasedReturnValue();
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputRanks"));
    v10 = objc_claimAutoreleasedReturnValue();
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputShapes"));
    v12 = objc_claimAutoreleasedReturnValue();
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputShapes"));
    v14 = objc_claimAutoreleasedReturnValue();
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v14;

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
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  int *v33;
  int *v34;
  unsigned int v35;
  int v36;
  unint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *exception;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44[3];
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _BYTE *v50;
  void *__p[3];
  void **v52[3];
  void **v53;
  void **v54;
  uint64_t v55;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  std::vector<float const*>::vector(&v49, v8);
  std::vector<std::vector<unsigned long>>::vector(&v47, v8);
  if (v8)
  {
    v9 = 0;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rawPointer");
      *((_QWORD *)v49 + i) = v12;

      -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      std::vector<unsigned long>::vector(&v53, objc_msgSend(v13, "unsignedIntegerValue"));

      if (self->_shapeInfoNeeded)
      {
        -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        EspressoBrickUtils::NSShape_to_VecShape(v14, &v53);
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&v53);

      }
      if ((void ***)(v47 + v9) != &v53)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v47 + v9), (char *)v53, (uint64_t)v54, v54 - v53);
      if (v53)
      {
        v54 = v53;
        operator delete(v53);
      }
      v9 += 24;
    }
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v45, objc_msgSend(v17, "unsignedIntegerValue"));

  v18 = -[NSNumber integerValue](self->_axis, "integerValue");
  memset(v44, 0, sizeof(v44));
  std::vector<float const*>::__init_with_size[abi:ne180100]<float const**,float const**>(v44, v49, (uint64_t)v50, (v50 - (_BYTE *)v49) >> 3);
  v41 = 0;
  v42 = 0;
  v43 = 0;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v41, v47, v48, 0xAAAAAAAAAAAAAAABLL * ((v48 - v47) >> 3));
  v53 = 0;
  v54 = 0;
  v55 = 0;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v53, (uint64_t)v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3));
  BrickLayers::ConcatNDShapeComputation(v18, (uint64_t *)v53, (uint64_t)v54, (uint64_t)v45, (uint64_t)v46);
  v52[0] = (void **)&v53;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](v52);
  v20 = v41;
  v19 = v42;
  v21 = 0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3);
  std::vector<unsigned long>::vector(v52, v21);
  std::vector<unsigned long>::vector(__p, v21);
  v22 = v41;
  v23 = v41[1] - *v41;
  v24 = v23 >> 3;
  v25 = (uint64_t *)v45;
  if (v23 >> 3 != ((char *)v46 - (_BYTE *)v45) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Mismatch between ranks of input and output tensors.");
    goto LABEL_45;
  }
  v26 = ((v18 >> 63) & (v23 >> 3)) + v18;
  if (v26 < 0 || v26 >= v24)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Invalid value of the argument 'axis'.");
LABEL_45:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v27 = 1;
  while (v25 != v46)
  {
    v28 = *v25++;
    v27 *= v28;
  }
  if ((_QWORD *)v19 != v20)
  {
    v29 = 0;
    v30 = __p[0];
    if (v21 <= 1)
      v31 = 1;
    else
      v31 = v21;
    do
    {
      v32 = &v22[3 * v29];
      v33 = (int *)v32[1];
      v34 = (int *)(*v32 + 8 * (int)v26);
      v35 = 1;
      while (v34 != v33)
      {
        v36 = *v34;
        v34 += 2;
        v35 *= v36;
      }
      v30[v29++] = v35;
    }
    while (v29 != v31);
  }
  if (v27)
  {
    v37 = 0;
    if (v21 <= 1)
      v21 = 1;
    do
    {
      if ((_QWORD *)v19 != v20)
      {
        for (j = 0; j != v21; ++j)
        {
          cblas_scopy_NEWLAPACK();
          v39 = *((_QWORD *)__p[0] + j);
          v37 += v39;
          v52[0][j] = (char *)v52[0][j] + v39;
        }
      }
    }
    while (v37 < v27);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  v53 = (void **)&v41;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v53);
  if (v44[0])
    operator delete(v44[0]);
  if (v45)
  {
    v46 = (uint64_t *)v45;
    operator delete(v45);
  }
  v53 = (void **)&v47;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v53);
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
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
