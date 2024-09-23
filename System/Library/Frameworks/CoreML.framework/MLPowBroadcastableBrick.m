@implementation MLPowBroadcastableBrick

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
  void *__p;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v19, objc_msgSend(v8, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v9, &v19);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(&v17, objc_msgSend(v10, "unsignedIntegerValue"));

    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(&__p, objc_msgSend(v11, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v17);

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)&__p);

    TensorAlgebraUtils::broadcasted_shape((uint64_t)v17, (uint64_t)v18, (uint64_t)__p, (uint64_t)v16, (uint64_t)v19, (uint64_t)v20);
    if (__p)
    {
      v16 = __p;
      operator delete(__p);
    }
    if (v17)
    {
      v18 = v17;
      operator delete(v17);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)&v19, v7);
  objc_msgSend(v6, "addObject:", v7);
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }

  return v6;
}

- (MLPowBroadcastableBrick)initWithParameters:(id)a3
{
  id v4;
  MLPowBroadcastableBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  unsigned int i;
  void *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLPowBroadcastableBrick;
  v5 = -[MLPowBroadcastableBrick init](&v21, sel_init);
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

    v14 = 0;
    v5->_shapeInfoNeeded = 0;
    while (-[NSArray count](v5->_inputRanks, "count") > v14)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_inputRanks, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (v16 >= 6)
        v5->_shapeInfoNeeded = 1;
      ++v14;
    }
    for (i = 0; -[NSArray count](v5->_outputRanks, "count") > i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_outputRanks, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      if (v19 >= 6)
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
  const float *v11;
  void *v12;
  float *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  size_t v27;
  size_t v28;
  const float *v29;
  void *v30;
  _BYTE *v31;
  void *v32;
  _BYTE *v33;
  void *v34;
  _BYTE *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  float *v42[3];
  void *__p;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49[3];
  int v50[3];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const float *)objc_msgSend(v8, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const float *)objc_msgSend(v10, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (float *)objc_msgSend(v12, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v34, objc_msgSend(v14, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v32, objc_msgSend(v15, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v30, objc_msgSend(v16, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v17, &v34);

    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v18, &v32);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v20, (uint64_t)&v34);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v21, (uint64_t)&v32);

  }
  TensorAlgebraUtils::broadcasted_shape((uint64_t)v34, (uint64_t)v35, (uint64_t)v32, (uint64_t)v33, (uint64_t)v30, (uint64_t)v31);
  v22 = v30;
  v23 = 1;
  if (v30 != v31)
  {
    v24 = (uint64_t *)v30;
    do
    {
      v25 = *v24++;
      v23 *= v25;
    }
    while (v24 != (uint64_t *)v31);
  }
  v50[0] = v23;
  v26 = v34;
  v27 = v35 - (_BYTE *)v34;
  v28 = v31 - (_BYTE *)v30;
  if (v35 - (_BYTE *)v34 != v31 - (_BYTE *)v30)
    goto LABEL_14;
  if (!memcmp(v34, v30, v35 - (_BYTE *)v34) && v33 - (_BYTE *)v32 == v27 && !memcmp(v32, v22, v27))
  {
    vvpowf(v13, v11, v9, v50);
    goto LABEL_40;
  }
  if (memcmp(v26, v22, v27))
  {
LABEL_14:
    if (v33 - (_BYTE *)v32 == v28 && !memcmp(v32, v22, v28))
    {
      std::vector<float>::vector(v49, v23);
      v46 = 0;
      v47 = 0;
      v48 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 3);
      __p = 0;
      v44 = 0;
      v45 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v34, (uint64_t)v35, (v35 - (_BYTE *)v34) >> 3);
      BrickLayers::BroadcastTo((uint64_t *)&v46, (uint64_t)v9, (uint64_t *)&__p, (uint64_t)v49[0]);
      if (__p)
      {
        v44 = __p;
        operator delete(__p);
      }
      if (v46)
      {
        v47 = v46;
        operator delete(v46);
      }
      vvpowf(v13, v11, (const float *)v49[0], v50);
      goto LABEL_38;
    }
    if (v27 != v28)
      goto LABEL_16;
  }
  if (!memcmp(v26, v22, v27) && (v33 - (_BYTE *)v32 != v28 || memcmp(v32, v22, v28)))
  {
    std::vector<float>::vector(v49, v23);
    v46 = 0;
    v47 = 0;
    v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 3);
    __p = 0;
    v44 = 0;
    v45 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v32, (uint64_t)v33, (v33 - (_BYTE *)v32) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v46, (uint64_t)v11, (uint64_t *)&__p, (uint64_t)v49[0]);
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    vvpowf(v13, (const float *)v49[0], v9, v50);
  }
  else
  {
LABEL_16:
    std::vector<float>::vector(v49, v23);
    v46 = 0;
    v47 = 0;
    v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 3);
    __p = 0;
    v44 = 0;
    v45 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v34, (uint64_t)v35, (v35 - (_BYTE *)v34) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v46, (uint64_t)v9, (uint64_t *)&__p, (uint64_t)v49[0]);
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    v29 = (const float *)v49[0];
    std::vector<float>::vector(v42, v23);
    v39 = 0;
    v40 = 0;
    v41 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v39, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 3);
    v36 = 0;
    v37 = 0;
    v38 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v36, v32, (uint64_t)v33, (v33 - (_BYTE *)v32) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v39, (uint64_t)v11, (uint64_t *)&v36, (uint64_t)v42[0]);
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    if (v39)
    {
      v40 = v39;
      operator delete(v39);
    }
    vvpowf(v13, v42[0], v29, v50);
    if (v42[0])
    {
      v42[1] = v42[0];
      operator delete(v42[0]);
    }
  }
LABEL_38:
  if (v49[0])
  {
    v49[1] = v49[0];
    operator delete(v49[0]);
  }
LABEL_40:
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  if (v32)
  {
    v33 = v32;
    operator delete(v32);
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }

}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
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
}

@end
