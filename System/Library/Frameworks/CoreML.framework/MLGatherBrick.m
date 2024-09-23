@implementation MLGatherBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *__p[3];
  void *v16[3];
  void *v17[3];

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(v17, objc_msgSend(v8, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v9, v17);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(v16, objc_msgSend(v10, "unsignedIntegerValue"));

    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(__p, objc_msgSend(v11, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)v16);

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)__p);

    BrickLayers::GatherShapeComputation(-[NSNumber integerValue](self->_axis, "integerValue"), (uint64_t)v16, (uint64_t)__p, (uint64_t)v17);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v16[0])
    {
      v16[1] = v16[0];
      operator delete(v16[0]);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)v17, v7);
  objc_msgSend(v6, "addObject:", v7);
  if (v17[0])
  {
    v17[1] = v17[0];
    operator delete(v17[0]);
  }

  return v6;
}

- (MLGatherBrick)initWithParameters:(id)a3
{
  id v4;
  MLGatherBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
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
  v23.super_class = (Class)MLGatherBrick;
  v5 = -[MLGatherBrick init](&v23, sel_init);
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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputShapes"));
    v10 = objc_claimAutoreleasedReturnValue();
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputShapes"));
    v12 = objc_claimAutoreleasedReturnValue();
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v12;

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
  void *v9;
  const float *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  std::vector<int>::size_type v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  std::vector<int>::pointer v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  void *v44;
  void *exception;
  void *v46;
  uint64_t v47;
  std::vector<int>::pointer begin;
  char v49;
  std::vector<int> v50;
  void *v51;
  _BYTE *v52;
  void *v53;
  char *v54;
  void *v55;
  _BYTE *v56;
  void *__p;
  void *v58;
  uint64_t v59;
  unint64_t *v60;
  unint64_t *v61;
  void *v62;
  uint64_t v63;
  _QWORD *v64;
  _BYTE *v65;
  uint64_t v66;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const float *)objc_msgSend(v9, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v11, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v55, objc_msgSend(v12, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v53, objc_msgSend(v13, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v51, objc_msgSend(v14, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v15, &v55);

    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v16, &v53);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v18, (uint64_t)&v55);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v19, (uint64_t)&v53);

  }
  v20 = (char *)v53;
  v21 = 1;
  while (v20 != v54)
  {
    v22 = *(_QWORD *)v20;
    v20 += 8;
    v21 *= v22;
  }
  std::vector<int>::vector(&v50, v21);
  vDSP_vfixr32(v10, 1, v50.__begin_, 1, v21);
  v23 = -[NSNumber integerValue](self->_axis, "integerValue");
  begin = v50.__begin_;
  BrickLayers::GatherShapeComputation(v23, (uint64_t)&v55, (uint64_t)&v53, (uint64_t)&v51);
  v24 = (v56 - (_BYTE *)v55) >> 3;
  v25 = v24 + ((v54 - (_BYTE *)v53) >> 3) - 1;
  if (v25 != (v52 - (_BYTE *)v51) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Gather layer: Invalid rank of Output.");
    goto LABEL_51;
  }
  v26 = ((v23 >> 63) & ((v56 - (_BYTE *)v55) >> 3)) + v23;
  if (v26 < 0 || v26 >= v24)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Gather layer: Invalid value of the argument 'axis'.");
LABEL_51:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v66 = 0;
  std::vector<unsigned long>::vector(&v64, (v56 - (_BYTE *)v55) >> 3);
  v60 = 0;
  std::vector<unsigned long>::vector(&v62, v24, &v60);
  __p = 0;
  std::vector<unsigned long>::vector(&v60, v25, &__p);
  v27 = (uint64_t *)v51;
  v28 = 1;
  if (v51 != v52)
  {
    do
    {
      v29 = *v27++;
      v28 *= v29;
    }
    while (v27 != (uint64_t *)v52);
  }
  v30 = (char *)v53;
  v31 = 1;
  if (v53 == v54)
    goto LABEL_15;
  do
  {
    v32 = *(_QWORD *)v30;
    v30 += 8;
    v31 *= v32;
  }
  while (v30 != v54);
  if (v31)
  {
LABEL_15:
    v33 = 0;
    v34 = v55;
    v35 = *((_QWORD *)v55 + v26);
    do
    {
      v36 = begin[v33];
      if (v36 >= (int)v35 || v36 + (_DWORD)v35 < 0)
      {
        v44 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1A1AD5E28](v44, "Gather layer: Invalid indices.");
        __cxa_throw(v44, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      ++v33;
    }
    while (v31 != v33);
    v49 = 0;
  }
  else
  {
    v49 = 1;
    v34 = v55;
  }
  v46 = v6;
  TensorAlgebraUtils::computeStrides((uint64_t)v34, (uint64_t)v56, (uint64_t)v64, (uint64_t)v65);
  if (v28)
  {
    v37 = 0;
    v38 = v64[v26];
    do
    {
      TensorAlgebraUtils::unravel_index(v37, (uint64_t)v51, (uint64_t)v52, v60, (uint64_t)v61);
      if (v26 << 32)
        memmove(v62, v60, 8 * (int)v26);
      if ((v49 & 1) == 0)
      {
        v39 = begin;
        v40 = v47 + 4 * v37;
        v41 = v31;
        do
        {
          v43 = *v39++;
          v42 = v43;
          if ((v43 & 0x80000000) != 0)
            v42 = (int)(v42 + *((_QWORD *)v55 + v26));
          *((_QWORD *)v62 + v26) = v42;
          v58 = 0;
          v59 = 0;
          __p = 0;
          std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v64, (uint64_t)v65, (v65 - (_BYTE *)v64) >> 3);
          TensorAlgebraUtils::ravel_multi_index((uint64_t *)v62, v63, (uint64_t)v55, (uint64_t)v56, (uint64_t *)__p, &v66);
          if (__p)
          {
            v58 = __p;
            operator delete(__p);
          }
          cblas_scopy_NEWLAPACK();
          v37 += v38;
          v40 += 4 * v38;
          --v41;
        }
        while (v41);
      }
    }
    while (v37 < v28);
  }
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  if (v62)
  {
    v63 = (uint64_t)v62;
    operator delete(v62);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  if (v50.__begin_)
  {
    v50.__end_ = v50.__begin_;
    operator delete(v50.__begin_);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  if (v53)
  {
    v54 = (char *)v53;
    operator delete(v53);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
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
