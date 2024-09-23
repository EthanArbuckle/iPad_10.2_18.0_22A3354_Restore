@implementation MLCTransposeLayer(CoreMLModelSpecification)

+ (id)transposeLayer:()CoreMLModelSpecification error:
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = *(unsigned int *)(a3 + 16);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if ((int)v4 >= 1)
  {
    v6 = 0;
    v7 = 8 * v4;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + v6 + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      v6 += 8;
    }
    while (v7 != v6);
  }
  +[MLNeuralNetworkMLComputeLayer transposeLayerWithAxes:](MLNeuralNetworkMLComputeLayer, "transposeLayerWithAxes:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
