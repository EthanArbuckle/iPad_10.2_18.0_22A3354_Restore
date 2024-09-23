@implementation MLCPoolingLayer(CoreMLModelSpecification)

+ (id)poolingLayer:()CoreMLModelSpecification error:
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  void *v19;
  id v20;

  if (*(int *)(a3 + 16) < 1)
  {
    v11 = 3;
    v10 = 3;
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 24);
    v11 = *(_QWORD *)(v9 + 8);
    v10 = *(_QWORD *)(v9 + 16);
  }
  if (*(int *)(a3 + 40) < 1)
  {
    v13 = 1;
    v14 = 1;
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 48);
    v13 = *(_QWORD *)(v12 + 8);
    v14 = *(_QWORD *)(v12 + 16);
  }
  v15 = *(_DWORD *)(a3 + 60);
  if (v15 == 1)
    v16 = 2;
  else
    v16 = 1;
  if (v15 == 2)
    v17 = 3;
  else
    v17 = v16;
  v18 = *(_DWORD *)(a3 + 84);
  if (!v18 || v18 == 32)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Convolution padding type not set or not supported"), v11, v13, v14, a7, v17);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    *a4 = v20;
  }
  else
  {
    +[MLNeuralNetworkMLComputeLayer poolingLayerWithKernelWidth:kernelHeight:strideInX:strideInY:paddingPolicy:poolingType:](MLNeuralNetworkMLComputeLayer, "poolingLayerWithKernelWidth:kernelHeight:strideInX:strideInY:paddingPolicy:poolingType:", v10, v11, v13, v14, v18 != 31, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v19;
}

@end
