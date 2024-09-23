@implementation MLMultiplyBroadcastableBrick

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

- (MLMultiplyBroadcastableBrick)initWithParameters:(id)a3
{
  id v4;
  MLMultiplyBroadcastableBrick *v5;
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
  v21.super_class = (Class)MLMultiplyBroadcastableBrick;
  v5 = -[MLMultiplyBroadcastableBrick init](&v21, sel_init);
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
  const float *v31;
  const float *v32;
  void *v33;
  void *v34;
  int64_t v35;
  int v36;
  const float *v37;
  id v38;
  id v39;
  void *v40;
  _BYTE *v41;
  void *v42;
  _BYTE *v43;
  void *v44;
  _BYTE *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  float *__B[3];
  void *__p;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59[4];

  v6 = a3;
  v38 = v6;
  v39 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const float *)objc_msgSend(v7, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const float *)objc_msgSend(v9, "rawPointer");

  objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (float *)objc_msgSend(v11, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v44, objc_msgSend(v13, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v42, objc_msgSend(v14, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v40, objc_msgSend(v15, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v16, &v44);

    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v17, &v42);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v19, (uint64_t)&v44);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v20, (uint64_t)&v42);

  }
  TensorAlgebraUtils::broadcasted_shape((uint64_t)v44, (uint64_t)v45, (uint64_t)v42, (uint64_t)v43, (uint64_t)v40, (uint64_t)v41);
  v21 = v40;
  v22 = 1;
  if (v40 != v41)
  {
    v23 = (uint64_t *)v40;
    do
    {
      v24 = *v23++;
      v22 *= v24;
    }
    while (v23 != (uint64_t *)v41);
  }
  v25 = v44;
  v26 = v45 - (_BYTE *)v44;
  v27 = v45 - (_BYTE *)v44 == 8 && *(_QWORD *)v44 == 1;
  v28 = v42;
  v29 = v43 - (_BYTE *)v42;
  v30 = v43 - (_BYTE *)v42 == 8 && *(_QWORD *)v42 == 1;
  if (v27 || v30)
  {
    if (v27)
      v31 = v10;
    else
      v31 = v8;
    if (v27)
      v32 = v8;
    else
      v32 = v10;
    v34 = v38;
    v33 = v39;
    vDSP_vsmul(v31, 1, v32, v12, 1, v22);
    goto LABEL_55;
  }
  v35 = v41 - (_BYTE *)v40;
  if (v26 == v41 - (_BYTE *)v40)
  {
    v36 = memcmp(v44, v40, v45 - (_BYTE *)v44);
    if (v29 == v26 && !v36)
    {
      if (!memcmp(v28, v21, v26))
      {
        v34 = v38;
        v33 = v39;
        vDSP_vmul(v8, 1, v10, 1, v12, 1, v22);
        goto LABEL_55;
      }
      goto LABEL_30;
    }
    if (!v36)
      goto LABEL_30;
  }
  if (v29 == v35 && !memcmp(v28, v21, v29))
  {
    v34 = v38;
    v33 = v39;
    std::vector<float>::vector(v59, v22);
    v56 = 0;
    v57 = 0;
    v58 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v56, v40, (uint64_t)v41, (v41 - (_BYTE *)v40) >> 3);
    __p = 0;
    v54 = 0;
    v55 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v44, (uint64_t)v45, (v45 - (_BYTE *)v44) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v56, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)v59[0]);
    if (__p)
    {
      v54 = __p;
      operator delete(__p);
    }
    if (v56)
    {
      v57 = v56;
      operator delete(v56);
    }
    vDSP_vmul((const float *)v59[0], 1, v10, 1, v12, 1, v22);
    goto LABEL_53;
  }
  if (v26 != v35)
    goto LABEL_31;
LABEL_30:
  if (memcmp(v25, v21, v26) || v29 == v35 && !memcmp(v28, v21, v29))
  {
LABEL_31:
    v34 = v38;
    v33 = v39;
    std::vector<float>::vector(v59, v22);
    v56 = 0;
    v57 = 0;
    v58 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v56, v40, (uint64_t)v41, (v41 - (_BYTE *)v40) >> 3);
    __p = 0;
    v54 = 0;
    v55 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v44, (uint64_t)v45, (v45 - (_BYTE *)v44) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v56, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)v59[0]);
    if (__p)
    {
      v54 = __p;
      operator delete(__p);
    }
    if (v56)
    {
      v57 = v56;
      operator delete(v56);
    }
    v37 = (const float *)v59[0];
    std::vector<float>::vector(__B, v22);
    v49 = 0;
    v50 = 0;
    v51 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v49, v40, (uint64_t)v41, (v41 - (_BYTE *)v40) >> 3);
    v46 = 0;
    v47 = 0;
    v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v42, (uint64_t)v43, (v43 - (_BYTE *)v42) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v49, (uint64_t)v10, (uint64_t *)&v46, (uint64_t)__B[0]);
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    if (v49)
    {
      v50 = v49;
      operator delete(v49);
    }
    vDSP_vmul(v37, 1, __B[0], 1, v12, 1, v22);
    if (__B[0])
    {
      __B[1] = __B[0];
      operator delete(__B[0]);
    }
    goto LABEL_53;
  }
  v34 = v38;
  v33 = v39;
  std::vector<float>::vector(v59, v22);
  v56 = 0;
  v57 = 0;
  v58 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v56, v40, (uint64_t)v41, (v41 - (_BYTE *)v40) >> 3);
  __p = 0;
  v54 = 0;
  v55 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v42, (uint64_t)v43, (v43 - (_BYTE *)v42) >> 3);
  BrickLayers::BroadcastTo((uint64_t *)&v56, (uint64_t)v10, (uint64_t *)&__p, (uint64_t)v59[0]);
  if (__p)
  {
    v54 = __p;
    operator delete(__p);
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
  vDSP_vmul(v8, 1, (const float *)v59[0], 1, v12, 1, v22);
LABEL_53:
  if (v59[0])
  {
    v59[1] = v59[0];
    operator delete(v59[0]);
  }
LABEL_55:
  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
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
