@implementation MLCActivationLayer(CoreMLModelSpecification)

+ (id)activationLayer:()CoreMLModelSpecification
{
  int v3;
  void *v4;

  v3 = *(_DWORD *)(a3 + 28);
  switch(v3)
  {
    case 40:
      +[MLNeuralNetworkMLComputeLayer sigmoid](MLNeuralNetworkMLComputeLayer, "sigmoid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      +[MLNeuralNetworkMLComputeLayer leakyRelu](MLNeuralNetworkMLComputeLayer, "leakyRelu");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[MLNeuralNetworkMLComputeLayer relu](MLNeuralNetworkMLComputeLayer, "relu");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (id)clampedReluLayer:()CoreMLModelSpecification error:
{
  LODWORD(a1) = *(_DWORD *)(a5 + 16);
  LODWORD(a2) = *(_DWORD *)(a5 + 20);
  return +[MLNeuralNetworkMLComputeLayer reluNLayerWithAlpha:beta:](MLNeuralNetworkMLComputeLayer, "reluNLayerWithAlpha:beta:", a1, a2);
}

+ (id)relu
{
  return +[MLNeuralNetworkMLComputeLayer relu](MLNeuralNetworkMLComputeLayer, "relu");
}

+ (id)leakyRelu
{
  return +[MLNeuralNetworkMLComputeLayer leakyRelu](MLNeuralNetworkMLComputeLayer, "leakyRelu");
}

+ (id)sigmoid
{
  return +[MLNeuralNetworkMLComputeLayer sigmoid](MLNeuralNetworkMLComputeLayer, "sigmoid");
}

@end
