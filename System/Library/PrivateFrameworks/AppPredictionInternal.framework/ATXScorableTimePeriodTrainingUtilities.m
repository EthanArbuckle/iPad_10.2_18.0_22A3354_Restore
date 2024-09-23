@implementation ATXScorableTimePeriodTrainingUtilities

+ (id)allTrainableATXModes
{
  void *v2;
  void *v3;

  allModes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_203);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __62__ATXScorableTimePeriodTrainingUtilities_allTrainableATXModes__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CF9088];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return (id)objc_msgSend(v4, "initWithATXMode:", v5);
}

@end
