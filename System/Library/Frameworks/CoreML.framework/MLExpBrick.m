@implementation MLExpBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  return a3;
}

- (MLExpBrick)initWithParameters:(id)a3
{
  id v4;
  MLExpBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MLExpBrick;
  v5 = -[MLExpBrick init](&v16, sel_init);
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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("withBase2"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_withBase2 = objc_msgSend(v14, "BOOLValue");

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
  float *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  void *__p;
  uint64_t *v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const float *)objc_msgSend(v8, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (float *)objc_msgSend(v10, "rawPointer");

  std::vector<unsigned long>::vector(&__p, 5uLL);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)&__p);

  v14 = (uint64_t *)__p;
  v15 = 1;
  while (v14 != v18)
  {
    v16 = *v14++;
    v15 *= (_DWORD)v16;
  }
  v19 = v15;
  if (self->_withBase2)
    vvexp2f(v11, v9, &v19);
  else
    vvexpf(v11, v9, &v19);
  if (__p)
  {
    v18 = (uint64_t *)__p;
    operator delete(__p);
  }

}

- (BOOL)withBase2
{
  return self->_withBase2;
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
