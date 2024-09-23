@implementation MLStackNDBrick

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
  char **v19[3];
  void *__p;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24[3];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(v24, objc_msgSend(v10, "unsignedIntegerValue"));

  v11 = objc_msgSend(v6, "count");
  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v12, v24);

  }
  else
  {
    std::vector<std::vector<unsigned long>>::vector(&v22, v11);
    for (i = 0; objc_msgSend(v6, "count") > (unint64_t)i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      std::vector<unsigned long>::vector(&__p, objc_msgSend(v14, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&__p);

      v16 = (char *)(v22 + 24 * i);
      if (v16 != (char *)&__p)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v16, (char *)__p, (uint64_t)v21, (v21 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        v21 = __p;
        operator delete(__p);
      }
    }
    v17 = -[NSNumber integerValue](self->_axis, "integerValue");
    memset(v19, 0, sizeof(v19));
    std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(v19, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
    BrickLayers::StackNDShapeComputation(v17, v19, (char **)v24);
    __p = v19;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    __p = &v22;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)v24, v9);
  objc_msgSend(v8, "addObject:", v9);
  if (v24[0])
  {
    v24[1] = v24[0];
    operator delete(v24[0]);
  }

  return v8;
}

- (MLStackNDBrick)initWithParameters:(id)a3
{
  id v4;
  MLStackNDBrick *v5;
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
  v23.super_class = (Class)MLStackNDBrick;
  v5 = -[MLStackNDBrick init](&v23, sel_init);
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void *exception;
  void *v36;
  void *v37;
  uint64_t v38;
  char *__p;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _BYTE *v50;
  void **v51;
  void **v52;
  uint64_t v53;
  void ***v54;

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
      std::vector<unsigned long>::vector(&v51, objc_msgSend(v13, "unsignedIntegerValue"));

      if (self->_shapeInfoNeeded)
      {
        -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        EspressoBrickUtils::NSShape_to_VecShape(v14, &v51);
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&v51);

      }
      if ((void ***)(v47 + v9) != &v51)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v47 + v9), (char *)v51, (uint64_t)v52, v52 - v51);
      if (v51)
      {
        v52 = v51;
        operator delete(v51);
      }
      v9 += 24;
    }
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v16, "rawPointer");

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
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v36 = v7;
  v37 = v6;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v51, (uint64_t)v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3));
  BrickLayers::StackNDShapeComputation(v18, (char ***)&v51, (char **)&v45);
  v54 = &v51;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
  v40 = v41;
  v19 = (uint64_t *)v41[1];
  v20 = ((uint64_t)v19 - *v41) >> 3;
  v21 = (uint64_t *)v45;
  if (v20 + 1 != ((char *)v46 - (_BYTE *)v45) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "StackND layer: Invalid rank of output tensor.");
    goto LABEL_37;
  }
  v22 = ((v20 + 1) & (v18 >> 63)) + v18;
  if (v22 < 0 || v22 > v20)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "StackND layer: Invalid value of the argument 'axis'.");
LABEL_37:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v23 = 1;
  while (v21 != v46)
  {
    v24 = *v21++;
    v23 *= v24;
  }
  v25 = (uint64_t *)(*v41 + 8 * (int)v22);
  v26 = 1;
  while (v25 != v19)
  {
    v27 = *v25++;
    v26 *= v27;
  }
  __p = (char *)v44[0];
  if (v23)
  {
    v28 = 0;
    v29 = 0;
    v30 = v42;
    if ((unint64_t)((v42 - (uint64_t)v41) / 24) <= 1)
      v31 = 1;
    else
      v31 = (v42 - (uint64_t)v41) / 24;
    do
    {
      if ((_QWORD *)v30 != v40)
      {
        v32 = __p;
        v33 = v38 + 4 * v28;
        v34 = v31;
        do
        {
          cblas_scopy_NEWLAPACK();
          v28 += v26;
          v32 += 8;
          v33 += 4 * v26;
          --v34;
        }
        while (v34);
      }
      v29 += v26;
    }
    while (v28 < v23);
  }
  v51 = (void **)&v41;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v51);
  if (__p)
    operator delete(__p);
  if (v45)
  {
    v46 = (uint64_t *)v45;
    operator delete(v45);
  }
  v51 = (void **)&v47;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v51);
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
