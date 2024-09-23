@implementation HKQuantityDistributionBucketSizeForQuantityType

void __HKQuantityDistributionBucketSizeForQuantityType_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB5D20];
  v3[0] = *MEMORY[0x1E0CB5CF0];
  v3[1] = v0;
  v4[0] = &unk_1E9CED458;
  v4[1] = &unk_1E9CED468;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)HKQuantityDistributionBucketSizeForQuantityType_quantityTypeBucketSizes;
  HKQuantityDistributionBucketSizeForQuantityType_quantityTypeBucketSizes = v1;

}

@end
