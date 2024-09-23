@implementation MLSlidingWindowsBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *__p;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v18, objc_msgSend(v8, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v9, &v18);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(&__p, objc_msgSend(v10, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v11, (uint64_t)&__p);

    v12 = -[NSNumber integerValue](self->_axis, "integerValue");
    v13 = -[NSNumber integerValue](self->_size, "integerValue");
    v14 = -[NSNumber integerValue](self->_step, "integerValue");
    BrickLayers::SlidingWindowsShapeComputation(v12, v13, v14, (uint64_t)__p, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19);
    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)&v18, v7);
  objc_msgSend(v6, "addObject:", v7);
  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }

  return v6;
}

- (MLSlidingWindowsBrick)initWithParameters:(id)a3
{
  id v4;
  MLSlidingWindowsBrick *v5;
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
  uint64_t v16;
  NSNumber *size;
  uint64_t v18;
  NSNumber *step;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  unsigned int i;
  void *v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MLSlidingWindowsBrick;
  v5 = -[MLSlidingWindowsBrick init](&v27, sel_init);
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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
    v16 = objc_claimAutoreleasedReturnValue();
    size = v5->_size;
    v5->_size = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("step"));
    v18 = objc_claimAutoreleasedReturnValue();
    step = v5->_step;
    v5->_step = (NSNumber *)v18;

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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t *v45;
  void *v46;
  void *v47;
  void *__p;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t *v53;
  uint64_t *v54;
  _QWORD *v55;
  _BYTE *v56;
  uint64_t v57;

  v35 = a3;
  v36 = a4;
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v6, "rawPointer");

  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v7, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v46, objc_msgSend(v8, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v44, objc_msgSend(v9, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v10, &v46);
  }
  else
  {
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v11, (uint64_t)&v46);

  }
  v12 = -[NSNumber integerValue](self->_axis, "integerValue");
  v13 = -[NSNumber integerValue](self->_size, "integerValue");
  v14 = -[NSNumber integerValue](self->_step, "integerValue");
  BrickLayers::SlidingWindowsShapeComputation(v12, v13, v14, (uint64_t)v46, (uint64_t)v47, (uint64_t)v44, (uint64_t)v45);
  v42 = v46;
  v43 = v47;
  v15 = ((_BYTE *)v47 - (_BYTE *)v46) >> 3;
  v16 = ((v12 >> 63) & v15) + v12;
  v17 = *((_QWORD *)v46 + v16);
  v57 = 0;
  std::vector<unsigned long>::vector(&v55, v15);
  std::vector<unsigned long>::vector(&v53, v15);
  std::vector<unsigned long>::vector(&v51, v15 + 1);
  v18 = (uint64_t *)v44;
  v19 = 1;
  while (v18 != v45)
  {
    v20 = *v18++;
    v19 *= v20;
  }
  TensorAlgebraUtils::computeStrides((uint64_t)v46, (uint64_t)v47, (uint64_t)v55, (uint64_t)v56);
  if (v19)
  {
    v21 = 0;
    v22 = (v17 - v13) / v14;
    v23 = v55[v16];
    v24 = v23 * v14;
    v25 = v23 * v13;
    if (v15 <= 1)
      v26 = 1;
    else
      v26 = v15;
    v41 = v22;
    v37 = ((v12 >> 63) & v15) + v12;
    v38 = v22 + 1;
    do
    {
      TensorAlgebraUtils::unravel_index(v21, (uint64_t)v44, (uint64_t)v45, (unint64_t *)v51, (uint64_t)v52);
      if (v43 != v42)
      {
        v27 = 0;
        v28 = v51;
        v29 = v53;
        do
        {
          if (v27 >= v16)
            v30 = 0;
          else
            v30 = v28[v27];
          v29[v27++] = v30;
        }
        while (v26 != v27);
      }
      __p = 0;
      v49 = 0;
      v50 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v55, (uint64_t)v56, (v56 - (_BYTE *)v55) >> 3);
      TensorAlgebraUtils::ravel_multi_index(v53, (uint64_t)v54, (uint64_t)v46, (uint64_t)v47, (uint64_t *)__p, &v57);
      if (__p)
      {
        v49 = __p;
        operator delete(__p);
      }
      if (v41 != -1)
      {
        v31 = v57;
        v32 = v40 + 4 * v57;
        v33 = v38;
        v34 = v39 + 4 * v21;
        do
        {
          cblas_scopy_NEWLAPACK();
          v31 += v24;
          v21 += v25;
          v32 += 4 * v24;
          v34 += 4 * v25;
          --v33;
        }
        while (v33);
        v57 = v31;
        v16 = v37;
      }
    }
    while (v21 < v19);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  if (v44)
  {
    v45 = (uint64_t *)v44;
    operator delete(v44);
  }
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
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

- (NSNumber)step
{
  return self->_step;
}

- (NSNumber)size
{
  return self->_size;
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
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_axis, 0);
}

@end
