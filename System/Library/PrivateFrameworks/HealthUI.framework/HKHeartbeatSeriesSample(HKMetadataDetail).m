@implementation HKHeartbeatSeriesSample(HKMetadataDetail)

- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  id v8;
  id v9;
  id v10;
  HKDataMetadataBeatToBeatSection *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKDataMetadataBeatToBeatSection initWithSample:healthStore:displayTypeController:unitController:]([HKDataMetadataBeatToBeatSection alloc], "initWithSample:healthStore:displayTypeController:unitController:", a1, v10, v9, v8);

  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
