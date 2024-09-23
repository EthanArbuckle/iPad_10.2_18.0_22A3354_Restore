@implementation MLCConcatenationLayer(CoreMLModelSpecification)

+ (id)concatNDLayer:()CoreMLModelSpecification error:
{
  void *v4;
  id v6;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    +[MLNeuralNetworkMLComputeLayer concatNDLayerWithAxis:](MLNeuralNetworkMLComputeLayer, "concatNDLayerWithAxis:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Concatenation along non-channel axis is not supported."));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    *a4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
