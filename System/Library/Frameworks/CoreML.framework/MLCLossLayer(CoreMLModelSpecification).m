@implementation MLCLossLayer(CoreMLModelSpecification)

+ (id)categoricalCrossEntropyWithLossLayerParams:()CoreMLModelSpecification numberOfClasses:
{
  return +[MLNeuralNetworkMLComputeLayer categoricalCrossEntropyLossWithNumberOfClasses:](MLNeuralNetworkMLComputeLayer, "categoricalCrossEntropyLossWithNumberOfClasses:", a4);
}

+ (id)meanSquaredErrorWithLossLayerParams:()CoreMLModelSpecification
{
  return +[MLNeuralNetworkMLComputeLayer meanSquaredErrorLoss](MLNeuralNetworkMLComputeLayer, "meanSquaredErrorLoss");
}

@end
