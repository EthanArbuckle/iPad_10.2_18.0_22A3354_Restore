@implementation MLSubtractBroadcastableBrick

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

- (MLSubtractBroadcastableBrick)initWithParameters:(id)a3
{
  id v4;
  MLSubtractBroadcastableBrick *v5;
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
  v21.super_class = (Class)MLSubtractBroadcastableBrick;
  v5 = -[MLSubtractBroadcastableBrick init](&v21, sel_init);
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
  void *v7;
  const float *v8;
  void *v9;
  const float *v10;
  void *v11;
  float *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  vDSP_Length v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  size_t v26;
  _BOOL4 v27;
  void *v28;
  size_t v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  int64_t v33;
  int v34;
  uint64_t v35;
  const float *v36;
  id v37;
  id v38;
  void *v39;
  _BYTE *v40;
  void *v41;
  _BYTE *v42;
  void *v43;
  _BYTE *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  float *v51[3];
  void *__p;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *__B[4];

  v6 = a3;
  v37 = v6;
  v38 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const float *)objc_msgSend(v7, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const float *)objc_msgSend(v9, "rawPointer");

  objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (float *)objc_msgSend(v11, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v43, objc_msgSend(v13, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v41, objc_msgSend(v14, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v39, objc_msgSend(v15, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v16, &v43);

    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v17, &v41);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v19, (uint64_t)&v43);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v20, (uint64_t)&v41);

  }
  TensorAlgebraUtils::broadcasted_shape((uint64_t)v43, (uint64_t)v44, (uint64_t)v41, (uint64_t)v42, (uint64_t)v39, (uint64_t)v40);
  v21 = v39;
  v22 = 1;
  if (v39 != v40)
  {
    v23 = (uint64_t *)v39;
    do
    {
      v24 = *v23++;
      v22 *= v24;
    }
    while (v23 != (uint64_t *)v40);
  }
  v25 = v43;
  v26 = v44 - (_BYTE *)v43;
  v27 = v44 - (_BYTE *)v43 == 8 && *(_QWORD *)v43 == 1;
  v28 = v41;
  v29 = v42 - (_BYTE *)v41;
  v30 = v42 - (_BYTE *)v41 == 8 && *(_QWORD *)v41 == 1;
  if (v27 || v30)
  {
    v32 = v37;
    v31 = v38;
    if (v27)
    {
      LODWORD(__B[0]) = -1082130432;
      vDSP_vsmsa(v10, 1, (const float *)__B, v8, v12, 1, v22);
    }
    else
    {
      *(float *)__B = -*v10;
      vDSP_vsadd(v8, 1, (const float *)__B, v12, 1, v22);
    }
    goto LABEL_51;
  }
  v33 = v40 - (_BYTE *)v39;
  if (v26 == v40 - (_BYTE *)v39)
  {
    v34 = memcmp(v43, v39, v44 - (_BYTE *)v43);
    if (v29 == v26 && !v34)
    {
      if (!memcmp(v28, v21, v26))
      {
        v32 = v37;
        v31 = v38;
        vDSP_vsub(v10, 1, v8, 1, v12, 1, v22);
        goto LABEL_51;
      }
      goto LABEL_26;
    }
    if (!v34)
      goto LABEL_26;
  }
  if (v29 == v33 && !memcmp(v28, v21, v29))
  {
    v32 = v37;
    v31 = v38;
    std::vector<float>::vector(__B, v22);
    v55 = 0;
    v56 = 0;
    v57 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v39, (uint64_t)v40, (v40 - (_BYTE *)v39) >> 3);
    __p = 0;
    v53 = 0;
    v54 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v43, (uint64_t)v44, (v44 - (_BYTE *)v43) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v55, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)__B[0]);
    if (__p)
    {
      v53 = __p;
      operator delete(__p);
    }
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
    vDSP_vsub(v10, 1, (const float *)__B[0], 1, v12, 1, v22);
    goto LABEL_49;
  }
  if (v26 != v33)
    goto LABEL_27;
LABEL_26:
  if (memcmp(v25, v21, v26) || v29 == v33 && !memcmp(v28, v21, v29))
  {
LABEL_27:
    v32 = v37;
    v31 = v38;
    std::vector<float>::vector(__B, v22);
    v55 = 0;
    v56 = 0;
    v57 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v39, (uint64_t)v40, (v40 - (_BYTE *)v39) >> 3);
    __p = 0;
    v53 = 0;
    v54 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v43, (uint64_t)v44, (v44 - (_BYTE *)v43) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v55, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)__B[0]);
    v35 = (uint64_t)v10;
    if (__p)
    {
      v53 = __p;
      operator delete(__p);
    }
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
    v36 = (const float *)__B[0];
    std::vector<float>::vector(v51, v22);
    v48 = 0;
    v49 = 0;
    v50 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v48, v39, (uint64_t)v40, (v40 - (_BYTE *)v39) >> 3);
    v45 = 0;
    v46 = 0;
    v47 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v45, v41, (uint64_t)v42, (v42 - (_BYTE *)v41) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v48, v35, (uint64_t *)&v45, (uint64_t)v51[0]);
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    vDSP_vsub(v51[0], 1, v36, 1, v12, 1, v22);
    if (v51[0])
    {
      v51[1] = v51[0];
      operator delete(v51[0]);
    }
    goto LABEL_49;
  }
  v32 = v37;
  v31 = v38;
  std::vector<float>::vector(__B, v22);
  v55 = 0;
  v56 = 0;
  v57 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v39, (uint64_t)v40, (v40 - (_BYTE *)v39) >> 3);
  __p = 0;
  v53 = 0;
  v54 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v41, (uint64_t)v42, (v42 - (_BYTE *)v41) >> 3);
  BrickLayers::BroadcastTo((uint64_t *)&v55, (uint64_t)v10, (uint64_t *)&__p, (uint64_t)__B[0]);
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  vDSP_vsub((const float *)__B[0], 1, v8, 1, v12, 1, v22);
LABEL_49:
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
LABEL_51:
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
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
