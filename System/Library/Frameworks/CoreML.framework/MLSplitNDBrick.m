@implementation MLSplitNDBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  int64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  NSArray *v29;
  NSArray *splitSizes;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  NSArray *v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  id v42;
  void *exception;
  unint64_t v45;
  void *v46;
  void *v47;
  id v48;
  unint64_t v49;
  void *v50[3];
  void *__p;
  _BYTE *v52;
  uint64_t v53[3];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[NSNumber integerValue](self->_axis, "integerValue");
  v10 = -[NSArray count](self->_outputRanks, "count");
  v49 = -[NSNumber unsignedIntegerValue](self->_numSplits, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  v13 = (char *)((v12 & (v9 >> 63)) + v9);
  v47 = v6;
  v48 = v8;
  if ((uint64_t)v13 < 0 || (uint64_t)v13 >= v12)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "SplitND layer: Invalid value of the argument 'axis'.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v46 = v7;
  std::vector<std::vector<unsigned long>>::vector(v53, v10);
  if (v10)
  {
    v14 = 0;
    for (i = 0; i != v10; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      std::vector<unsigned long>::vector(&__p, objc_msgSend(v16, "unsignedIntegerValue"));

      if ((void **)(v53[0] + v14) != &__p)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v53[0] + v14), (char *)__p, (uint64_t)v52, (v52 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        v52 = __p;
        operator delete(__p);
      }
      v14 += 24;
    }
  }
  if (!self->_shapeInfoNeeded)
  {
    v17 = v48;
    std::vector<unsigned long>::vector(&__p, v12);
    std::vector<unsigned long>::vector(v50, v49);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v21, (uint64_t)&__p);

    v22 = *((_QWORD *)__p + (_QWORD)v13);
    if (!-[NSArray count](self->_splitSizes, "count"))
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      if (v49)
      {
        v24 = 0;
        v25 = v22 / v49;
        v26 = v22 % v49;
        v45 = v25 + 1;
        do
        {
          if (v24 >= v26)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v25);
            v27 = objc_claimAutoreleasedReturnValue();
            v6 = (id)v27;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v45);
            v27 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v27;
          }
          objc_msgSend(v23, "setObject:atIndexedSubscript:", v27, v24, v45, v46);
          if (v24 >= v26)
            v28 = v6;
          else
            v28 = v21;

          ++v24;
        }
        while (v49 != v24);
      }
      v29 = (NSArray *)objc_msgSend(v23, "copy");
      splitSizes = self->_splitSizes;
      self->_splitSizes = v29;

      v17 = v48;
    }
    EspressoBrickUtils::NSShape_to_VecShape(self->_splitSizes, v50);
    BrickLayers::SplitNDShapeComputation(v13, (uint64_t *)v50, (uint64_t)&__p, v53);
    if (v50[0])
    {
      v50[1] = v50[0];
      operator delete(v50[0]);
    }
    if (__p)
    {
      v52 = __p;
      operator delete(__p);
    }
    goto LABEL_41;
  }
  v17 = v48;
  -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  if (-[NSArray count](self->_splitSizes, "count"))
  {
    if (!v10)
      goto LABEL_44;
    goto LABEL_39;
  }
  v31 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (v49)
  {
    v32 = 0;
    v33 = v20 % v49;
    do
    {
      if (v32 >= v33)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v20 / v49);
        v34 = objc_claimAutoreleasedReturnValue();
        v13 = (char *)v34;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v20 / v49 + 1);
        v34 = objc_claimAutoreleasedReturnValue();
        v6 = (id)v34;
      }
      objc_msgSend(v31, "setObject:atIndexedSubscript:", v34, v32);
      if (v32 >= v33)
        v35 = v13;
      else
        v35 = (char *)v6;

      ++v32;
    }
    while (v49 != v32);
  }
  v36 = (NSArray *)objc_msgSend(v31, "copy");
  v37 = self->_splitSizes;
  self->_splitSizes = v36;

  v17 = v48;
  if (v10)
  {
LABEL_39:
    v38 = 0;
    for (j = 0; j != v10; ++j)
    {
      -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", j);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      EspressoBrickUtils::NSShape_to_VecShape(v40, (_QWORD *)(v53[0] + v38));

      v38 += 24;
    }
LABEL_41:
    if (v10)
    {
      v41 = 0;
      do
      {
        v42 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
        EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)(v53[0] + v41), v42);
        objc_msgSend(v17, "addObject:", v42);

        v41 += 24;
        --v10;
      }
      while (v10);
    }
  }
LABEL_44:
  __p = v53;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v17;
}

- (MLSplitNDBrick)initWithParameters:(id)a3
{
  id v4;
  MLSplitNDBrick *v5;
  uint64_t v6;
  NSNumber *numSplits;
  uint64_t v8;
  NSArray *splitSizes;
  uint64_t v10;
  NSNumber *axis;
  uint64_t v12;
  NSArray *inputRanks;
  uint64_t v14;
  NSArray *outputRanks;
  uint64_t v16;
  NSArray *inputShapes;
  uint64_t v18;
  NSArray *outputShapes;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  unsigned int i;
  void *v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MLSplitNDBrick;
  v5 = -[MLSplitNDBrick init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSplits"));
    v6 = objc_claimAutoreleasedReturnValue();
    numSplits = v5->_numSplits;
    v5->_numSplits = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("splitSizes"));
    v8 = objc_claimAutoreleasedReturnValue();
    splitSizes = v5->_splitSizes;
    v5->_splitSizes = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("axis"));
    v10 = objc_claimAutoreleasedReturnValue();
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputRanks"));
    v12 = objc_claimAutoreleasedReturnValue();
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputRanks"));
    v14 = objc_claimAutoreleasedReturnValue();
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputShapes"));
    v16 = objc_claimAutoreleasedReturnValue();
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputShapes"));
    v18 = objc_claimAutoreleasedReturnValue();
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v18;

    v20 = 0;
    v5->_shapeInfoNeeded = 0;
    while (-[NSArray count](v5->_inputRanks, "count") > v20)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_inputRanks, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      if (v22 >= 6)
        v5->_shapeInfoNeeded = 1;
      ++v20;
    }
    for (i = 0; -[NSArray count](v5->_outputRanks, "count") > i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_outputRanks, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "integerValue");

      if (v25 >= 6)
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  _BYTE *v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *exception;
  id v45;
  void *v46;
  void *v47;
  void *__dst;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  char *v56;
  void *v57[3];
  uint64_t v58;
  void *__p[3];
  void **v60;
  void **v61;

  v6 = a3;
  v7 = a4;
  v8 = -[NSArray count](self->_outputRanks, "count");
  std::vector<unsigned long>::vector(v57, -[NSNumber unsignedIntegerValue](self->_numSplits, "unsignedIntegerValue"));
  EspressoBrickUtils::NSShape_to_VecShape(self->_splitSizes, v57);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v55, objc_msgSend(v10, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v11, &v55);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v55);

  }
  v52 = 0;
  v53 = 0;
  v54 = 0;
  v45 = v6;
  if (v8)
  {
    std::vector<float *>::__vallocate[abi:ne180100](&v52, v8);
    v13 = (char *)v53;
    bzero(v53, 8 * v8);
    v14 = &v13[8 * v8];
    v53 = v14;
  }
  else
  {
    v14 = 0;
  }
  std::vector<std::vector<unsigned long>>::vector(&v50, v8);
  if (v8)
  {
    v15 = 0;
    v16 = 0;
    v17 = v52;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v16, v45);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v17[8 * v16] = objc_msgSend(v18, "rawPointer");

      -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      std::vector<unsigned long>::vector(&v60, objc_msgSend(v19, "unsignedIntegerValue"));

      if ((void ***)(v50 + v15) != &v60)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v50 + v15), (char *)v60, (uint64_t)v61, v61 - v60);
      if (v60)
      {
        v61 = v60;
        operator delete(v60);
      }
      ++v16;
      v15 += 24;
    }
    while (v8 != v16);
  }
  v20 = -[NSNumber integerValue](self->_axis, "integerValue", v45);
  v47 = 0;
  __dst = 0;
  v49 = 0;
  v21 = v52;
  v22 = v14 - v52;
  if (v14 != v52)
  {
    std::vector<float *>::__vallocate[abi:ne180100](&v47, v22 >> 3);
    memmove(__dst, v21, v22);
  }
  BrickLayers::SplitNDShapeComputation((char *)v20, (uint64_t *)v57, (uint64_t)&v55, &v50);
  v24 = v50;
  v23 = v51;
  v25 = 0xAAAAAAAAAAAAAAABLL * ((v51 - v50) >> 3);
  v27 = v55;
  v26 = v56;
  __p[0] = 0;
  std::vector<unsigned long>::vector(&v60, v25, __p);
  v58 = 0;
  std::vector<unsigned long>::vector(__p, v25, &v58);
  v28 = ((v20 >> 63) & ((v26 - v27) >> 3)) + v20;
  if (v28 < 0 || v28 >= (v26 - v27) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Invalid value of the argument 'axis'.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v29 = v56;
  v30 = 1;
  if (v55 != v56)
  {
    v31 = (char *)v55;
    do
    {
      v32 = *(_QWORD *)v31;
      v31 += 8;
      v30 *= v32;
    }
    while (v31 != v56);
  }
  if (v23 != v24)
  {
    v33 = 0;
    v34 = (char *)v55 + 8 * (int)v28 + 8;
    v35 = v57[0];
    v36 = __p[0];
    if (v25 <= 1)
      v37 = 1;
    else
      v37 = v25;
    do
    {
      v38 = v35[v33];
      if (v34 != v29)
      {
        v39 = v34;
        do
        {
          v40 = *(_QWORD *)v39;
          v39 += 8;
          v38 *= v40;
        }
        while (v39 != v29);
      }
      v36[v33++] = v38;
    }
    while (v33 != v37);
  }
  if (v30)
  {
    v41 = 0;
    if (v25 <= 1)
      v25 = 1;
    do
    {
      if (v23 != v24)
      {
        for (i = 0; i != v25; ++i)
        {
          cblas_scopy_NEWLAPACK();
          v43 = *((_QWORD *)__p[0] + i);
          v41 += v43;
          v60[i] = (char *)v60[i] + v43;
        }
      }
    }
    while (v41 < v30);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  if (v47)
    operator delete(v47);
  v60 = (void **)&v50;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v60);
  if (v21)
    operator delete(v21);
  if (v55)
  {
    v56 = (char *)v55;
    operator delete(v55);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
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

- (NSNumber)numSplits
{
  return self->_numSplits;
}

- (NSArray)splitSizes
{
  return self->_splitSizes;
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
  objc_storeStrong((id *)&self->_splitSizes, 0);
  objc_storeStrong((id *)&self->_numSplits, 0);
  objc_storeStrong((id *)&self->_axis, 0);
}

@end
