@implementation MLRangeBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t size;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count") == 3)
    size = 1;
  else
    size = self->_size;
  objc_msgSend(v7, "setWidth:", size);
  objc_msgSend(v7, "setHeight:", 1);
  objc_msgSend(v7, "setChannels:", 1);
  objc_msgSend(v7, "setBatch:", 1);
  objc_msgSend(v7, "setSequence:", 1);
  objc_msgSend(v7, "setRank:", 1);
  objc_msgSend(v6, "addObject:", v7);

  return v6;
}

- (MLRangeBrick)initWithParameters:(id)a3
{
  id v4;
  MLRangeBrick *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  float startValueParameter;
  float v14;
  float v15;
  float v16;
  int v17;
  void *exception;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MLRangeBrick;
  v5 = -[MLRangeBrick init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "floatValue");
    else
      v8 = 0.0;
    v5->_startValueParameter = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "floatValue");
    else
      v10 = 1.0;
    v5->_endValueParameter = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stepSizeValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v11, "floatValue");
    else
      v12 = 1.0;
    v5->_stepSizeValueParameter = v12;
    if (fabsf(v12) < 0.00001)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A1AD5E28](exception, "Step size in the range layer cannot be 0");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    startValueParameter = v5->_startValueParameter;
    v14 = (float)((float)(v5->_endValueParameter - startValueParameter) / v12) + 1.0;
    if (v14 <= 0.0)
      v14 = 1.0;
    v15 = floorf(v14);
    if (vabds_f32(v15, v14) >= 0.001)
      v16 = v15;
    else
      v16 = v15 + -1.0;
    v17 = (int)v16;
    if ((int)v16 <= 1)
      v17 = 1;
    v5->_size = v17;
    v5->_start = startValueParameter;
    v5->_stepSize = v12;

  }
  return v5;
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (BOOL)hasDynamicOutputShape:(unint64_t)a3
{
  return a3 == 3;
}

- (id)computeDynamicOutputShape:(id)a3
{
  id v4;
  void *v5;
  float *v6;
  void *v7;
  float *v8;
  void *v9;
  float *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  int v15;
  void *v16;
  void *v17;
  void *exception;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float *)objc_msgSend(v5, "rawPointer");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (float *)objc_msgSend(v7, "rawPointer");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (float *)objc_msgSend(v9, "rawPointer");

  if (fabsf(*v10) < 0.00001)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Step size in the range layer cannot be 0");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v11 = *v6;
  v12 = (float)((float)(*v8 - *v6) / *v10) + 1.0;
  if (v12 <= 0.0)
    v12 = 1.0;
  v13 = floorf(v12);
  if (vabds_f32(v13, v12) >= 0.001)
    v14 = v13;
  else
    v14 = v13 + -1.0;
  v15 = (int)v14;
  if ((int)v14 <= 1)
    v15 = 1;
  self->_size = v15;
  self->_start = v11;
  self->_stepSize = *v10;
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setWidth:", self->_size);
  objc_msgSend(v17, "setHeight:", 1);
  objc_msgSend(v17, "setChannels:", 1);
  objc_msgSend(v17, "setBatch:", 1);
  objc_msgSend(v17, "setSequence:", 1);
  objc_msgSend(v17, "setRank:", 1);
  objc_msgSend(v16, "addObject:", v17);

  return v16;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  void *v5;
  float *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float *)objc_msgSend(v5, "rawPointer");

  vDSP_vramp(&self->_start, &self->_stepSize, v6, 1, self->_size);
}

- (int)size
{
  return self->_size;
}

- (float)start
{
  return self->_start;
}

- (float)stepSize
{
  return self->_stepSize;
}

- (float)startValueParameter
{
  return self->_startValueParameter;
}

- (float)endValueParameter
{
  return self->_endValueParameter;
}

- (float)stepSizeValueParameter
{
  return self->_stepSizeValueParameter;
}

@end
