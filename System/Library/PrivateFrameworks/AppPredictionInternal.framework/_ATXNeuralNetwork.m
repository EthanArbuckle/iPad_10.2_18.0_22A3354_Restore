@implementation _ATXNeuralNetwork

- (_ATXNeuralNetwork)initWithData:(id)a3
{
  id v6;
  _ATXNeuralNetwork *v7;
  _ATXNeuralNetwork *v8;
  unsigned int *v9;
  unint64_t v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ATXNeuralNetwork;
  v7 = -[_ATXNeuralNetwork init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v9 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v10 = *v9;
    v8->_dataBytes = (const char *)v9;
    v8->_nlayers = v10;
    if (!(_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("_ATXNeuralNetwork.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_nlayers > 0"));

    }
    v8->_layers = (const $278F8F5807AB85F6E7DDBD32FD86D511 *)(v9 + 1);
  }

  return v8;
}

- (unint64_t)inputSize
{
  return self->_layers->var0;
}

- (unint64_t)outputSize
{
  return self->_layers[self->_nlayers - 1].var1;
}

- (double)predict:(const double *)a3
{
  float *v5;
  uint64_t var0;
  float *v7;
  double v8;
  float v9;
  double result;
  id v11;

  v5 = (float *)malloc_type_malloc(4 * self->_layers->var0, 0x100004052888210uLL);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  var0 = self->_layers->var0;
  if ((_DWORD)var0)
  {
    v7 = v5;
    do
    {
      v8 = *a3++;
      v9 = v8;
      *v7++ = v9;
      --var0;
    }
    while (var0);
  }
  -[_ATXNeuralNetwork _predict:freeInputsAfterUse:](self, "_predict:freeInputsAfterUse:", v5, 1);
  return result;
}

- (double)predict32:(const float *)a3
{
  double result;

  -[_ATXNeuralNetwork _predict:freeInputsAfterUse:](self, "_predict:freeInputsAfterUse:", a3, 0);
  return result;
}

- (float)_runOnInputs:(float *)a3 freeInputsAfterUse:(BOOL)a4
{
  float *v4;
  _BOOL4 v5;
  unint64_t v7;
  const $278F8F5807AB85F6E7DDBD32FD86D511 *layers;
  const $278F8F5807AB85F6E7DDBD32FD86D511 *v9;
  unsigned int var0;
  float *v11;
  float *v12;
  const $278F8F5807AB85F6E7DDBD32FD86D511 *v13;
  int var4;
  uint64_t v15;
  float *v16;
  uint64_t v17;
  float *v18;
  uint64_t var1;
  float *v20;
  id v22;

  v4 = a3;
  if (!self->_nlayers)
    return a3;
  v5 = a4;
  v7 = 0;
  do
  {
    layers = self->_layers;
    v9 = &layers[v7];
    if (v9->var5)
      var0 = layers[v7].var0;
    else
      var0 = 0;
    v11 = (float *)malloc_type_malloc(4 * (var0 + v9->var1), 0x100004052888210uLL);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v22);
    }
    v12 = v11;
    memcpy(v11, &self->_dataBytes[self->_layers[v7].var3], 4 * self->_layers[v7].var1);
    cblas_sgemv_NEWLAPACK();
    v13 = self->_layers;
    var4 = v13[v7].var4;
    if (v13[v7].var4)
    {
      if (var4 == 1)
      {
        var1 = v13[v7].var1;
        v20 = v12;
        if ((_DWORD)var1)
        {
          do
          {
            *v20 = tanhf(*v20);
            ++v20;
            --var1;
          }
          while (var1);
        }
      }
      else if (var4 == 2)
      {
        v15 = v13[v7].var1;
        v16 = v12;
        if ((_DWORD)v15)
        {
          do
          {
            *v16 = fmaxf(*v16, 0.0);
            ++v16;
            --v15;
          }
          while (v15);
        }
      }
    }
    else
    {
      v17 = v13[v7].var1;
      if ((_DWORD)v17)
      {
        v18 = v12;
        do
        {
          *v18 = 1.0 / (float)(expf(-*v18) + 1.0);
          ++v18;
          --v17;
        }
        while (v17);
      }
    }
    if (v13[v7].var5)
      memcpy(&v12[v13[v7].var1], v4, 4 * v13[v7].var0);
    if (v7 || v5)
      free(v4);
    ++v7;
    v4 = v12;
  }
  while (v7 < self->_nlayers);
  return v12;
}

- (double)_predict:(float *)a3 freeInputsAfterUse:(BOOL)a4
{
  _BOOL8 v4;
  const $278F8F5807AB85F6E7DDBD32FD86D511 *layers;
  unint64_t v8;
  unsigned int var1;
  void *v11;
  float *v12;
  float *v13;
  double v14;
  double v15;

  v4 = a4;
  layers = self->_layers;
  v8 = self->_nlayers - 1;
  var1 = layers[v8].var1;
  if (var1 != 1 && (var1 != 2 || !layers[v8].var6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXNeuralNetwork.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_layers[_nlayers-1].outsz == 1 || (_layers[_nlayers-1].outsz == 2 && _layers[_nlayers-1].softmax)"));

  }
  v12 = -[_ATXNeuralNetwork _runOnInputs:freeInputsAfterUse:](self, "_runOnInputs:freeInputsAfterUse:", a3, v4);
  v13 = v12;
  v14 = *v12;
  if (self->_layers[self->_nlayers - 1].var6)
  {
    v15 = exp(*v12);
    v14 = v15 / (v15 + exp(v13[1]));
  }
  free(v13);
  return v14;
}

- (void)forInputs:(const float *)a3 computeOutputLayer:(float *)a4
{
  float *v6;
  const $278F8F5807AB85F6E7DDBD32FD86D511 *v7;
  uint64_t var1;
  double v9;
  uint64_t v10;
  float *v11;
  float v12;
  int v13;

  v6 = -[_ATXNeuralNetwork _runOnInputs:freeInputsAfterUse:](self, "_runOnInputs:freeInputsAfterUse:", a3, 0);
  v7 = &self->_layers[self->_nlayers];
  var1 = (int)v7[-1].var1;
  v13 = v7[-1].var1;
  if (v7[-1].var6)
  {
    vvexpf(a4, v6, &v13);
    v9 = 0.0;
    if (v13 >= 1)
    {
      v10 = v13;
      v11 = a4;
      do
      {
        v12 = *v11++;
        v9 = v9 + v12;
        --v10;
      }
      while (v10);
    }
    cblas_sscal_NEWLAPACK();
  }
  else
  {
    memcpy(a4, v6, 4 * var1);
  }
  free(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
