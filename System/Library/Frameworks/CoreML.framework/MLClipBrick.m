@implementation MLClipBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  return v5;
}

- (MLClipBrick)initWithParameters:(id)a3
{
  id v4;
  MLClipBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLClipBrick;
  v5 = -[MLClipBrick init](&v15, sel_init);
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

  }
  return v5;
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const float *v8;
  void *v9;
  const float *v10;
  void *v11;
  const float *v12;
  void *v13;
  float *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  vDSP_Length v18;
  uint64_t v19;
  void *__p;
  uint64_t *v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const float *)objc_msgSend(v7, "rawPointer");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const float *)objc_msgSend(v9, "rawPointer");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const float *)objc_msgSend(v11, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (float *)objc_msgSend(v13, "rawPointer");

  std::vector<unsigned long>::vector(&__p, 5uLL);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  EspressoBrickUtils::EspressoShape_to_NDShape(v16, (uint64_t)&__p);

  v17 = (uint64_t *)__p;
  v18 = 1;
  while (v17 != v21)
  {
    v19 = *v17++;
    v18 *= v19;
  }
  vDSP_vclip(v8, 1, v10, v12, v14, 1, v18);
  if (__p)
  {
    v21 = (uint64_t *)__p;
    operator delete(__p);
  }

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
