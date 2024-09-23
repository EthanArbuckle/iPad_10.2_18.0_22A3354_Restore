@implementation MLTileBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *__p;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18[3];

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(v18, objc_msgSend(v8, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v9, v18);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    std::vector<unsigned long>::vector(&v16, v11);
    std::vector<unsigned long>::vector(&__p, v11);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v16);

    EspressoBrickUtils::NSShape_to_VecShape(self->_reps, &__p);
    BrickLayers::TileShapeComputation((uint64_t *)__p, (uint64_t)v15, (uint64_t *)v16, v17, (_QWORD *)v18[0]);
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    if (v16)
    {
      v17 = v16;
      operator delete(v16);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)v18, v7);
  objc_msgSend(v6, "addObject:", v7);
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }

  return v6;
}

- (MLTileBrick)initWithParameters:(id)a3
{
  id v4;
  MLTileBrick *v5;
  uint64_t v6;
  NSArray *reps;
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
  v23.super_class = (Class)MLTileBrick;
  v5 = -[MLTileBrick init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reps"));
    v6 = objc_claimAutoreleasedReturnValue();
    reps = v5->_reps;
    v5->_reps = (NSArray *)v6;

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
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *__p[3];
  void *v19[3];
  void *v20[3];

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
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  std::vector<unsigned long>::vector(v20, v13);
  EspressoBrickUtils::NSShape_to_VecShape(self->_reps, v20);
  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(v19, objc_msgSend(v14, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(__p, objc_msgSend(v15, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v16, v19);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v17, (uint64_t)v19);

  }
  BrickLayers::Tile((uint64_t)v20, v9, (uint64_t **)v19, v11, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v19[0])
  {
    v19[1] = v19[0];
    operator delete(v19[0]);
  }
  if (v20[0])
  {
    v20[1] = v20[0];
    operator delete(v20[0]);
  }

}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (NSArray)reps
{
  return self->_reps;
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
  objc_storeStrong((id *)&self->_reps, 0);
}

@end
