@implementation MLCMatMulLayer(CoreMLModelSpecification)

+ (id)matrixMultiplicationLayerUsingParameters:()CoreMLModelSpecification
{
  return +[MLNeuralNetworkMLComputeLayer matMulLayerWithTransposesX:transposesY:](MLNeuralNetworkMLComputeLayer, "matMulLayerWithTransposesX:transposesY:", *(unsigned __int8 *)(a3 + 48), *(unsigned __int8 *)(a3 + 49));
}

@end
