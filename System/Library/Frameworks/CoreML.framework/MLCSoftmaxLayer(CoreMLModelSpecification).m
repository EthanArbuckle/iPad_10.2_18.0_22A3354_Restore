@implementation MLCSoftmaxLayer(CoreMLModelSpecification)

+ (id)softmax
{
  return +[MLNeuralNetworkMLComputeLayer softmax](MLNeuralNetworkMLComputeLayer, "softmax");
}

@end
