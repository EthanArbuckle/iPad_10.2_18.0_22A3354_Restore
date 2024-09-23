@implementation MLBroadcastToBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *__p[3];

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(__p, objc_msgSend(v7, "unsignedIntegerValue"));

  EspressoBrickUtils::NSShape_to_VecShape(self->_targetShape, __p);
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)__p, v6);
  objc_msgSend(v5, "addObject:", v6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v5;
}

- (MLBroadcastToBrick)initWithParameters:(id)a3
{
  id v4;
  MLBroadcastToBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
  uint64_t v14;
  NSArray *targetShape;
  unsigned int i;
  void *v17;
  uint64_t v18;
  unsigned int j;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLBroadcastToBrick;
  v5 = -[MLBroadcastToBrick init](&v23, sel_init);
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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetShape"));
    v14 = objc_claimAutoreleasedReturnValue();
    targetShape = v5->_targetShape;
    v5->_targetShape = (NSArray *)v14;

    v5->_shapeInfoNeeded = 0;
    if (-[NSArray count](v5->_targetShape, "count") > 5)
      v5->_shapeInfoNeeded = 1;
    for (i = 0; -[NSArray count](v5->_inputRanks, "count") > i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_inputRanks, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      if (v18 >= 6)
        v5->_shapeInfoNeeded = 1;
    }
    for (j = 0; -[NSArray count](v5->_outputRanks, "count") > j; ++j)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_outputRanks, "objectAtIndexedSubscript:", j);
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *__p;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  _BYTE *v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v23, objc_msgSend(v12, "unsignedIntegerValue"));

  std::vector<unsigned long>::vector(&v21, -[NSArray count](self->_targetShape, "count"));
  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v13, &v23);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v14, (uint64_t)&v23);

  }
  EspressoBrickUtils::NSShape_to_VecShape(self->_targetShape, &v21);
  v18 = 0;
  v19 = 0;
  v20 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v18, v21, (uint64_t)v22, (v22 - (_BYTE *)v21) >> 3);
  __p = 0;
  v16 = 0;
  v17 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v23, (uint64_t)v24, (v24 - (_BYTE *)v23) >> 3);
  BrickLayers::BroadcastTo((uint64_t *)&v18, v9, (uint64_t *)&__p, v11);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }

}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (NSArray)targetShape
{
  return self->_targetShape;
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
  objc_storeStrong((id *)&self->_targetShape, 0);
}

@end
