@implementation VCPCNNFullConnectionBlockScalar

- (int)forward
{
  unint64_t v3;
  NSMutableArray **p_inputSize;
  int v5;
  id WeakRetained;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  float *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  float *weight;
  float *bias;
  int neuronType;
  float v19;
  uint64_t i;
  float v21;
  float v22;

  v3 = 0;
  p_inputSize = &self->super.super._inputSize;
  v5 = 1;
  while (1)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_inputSize);
    v7 = objc_msgSend(WeakRetained, "count");

    if (v7 <= v3)
      break;
    v8 = objc_loadWeakRetained((id *)p_inputSize);
    objc_msgSend(v8, "objectAtIndexedSubscript:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 *= objc_msgSend(v9, "intValue");

    ++v3;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v12 = -[VCPCNNData data](self->super.super._output, "data");
  v13 = objc_loadWeakRetained((id *)&self->super.super._input);
  v14 = objc_msgSend(v13, "data");

  if (v11 >= 1)
  {
    v15 = 0;
    weight = self->super._weight;
    bias = self->super._bias;
    neuronType = self->super._neuronType;
    do
    {
      v12[v15] = 0.0;
      v19 = 0.0;
      if (v5 >= 1)
      {
        for (i = 0; i != v5; ++i)
        {
          v19 = v19 + (float)(*(float *)(v14 + i * 4) * weight[i]);
          v12[v15] = v19;
        }
      }
      v21 = bias[v15] + v19;
      v22 = fmaxf(v21, 0.0);
      if (neuronType == 1)
        v21 = v22;
      v12[v15++] = v21;
      weight += v5;
    }
    while (v15 != v11);
  }
  return 0;
}

- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6
{
  return -[VCPCNNFullConnectionBlock readWeightsBias:weights:bias:inputDim:outputDim:quantFactor:](self, "readWeightsBias:weights:bias:inputDim:outputDim:quantFactor:", a3, self->super._weight, self->super._bias, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

@end
