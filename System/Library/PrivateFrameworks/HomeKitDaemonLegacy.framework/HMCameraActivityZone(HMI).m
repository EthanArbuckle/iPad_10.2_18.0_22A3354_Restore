@implementation HMCameraActivityZone(HMI)

- (id)createHMIActivityZoneWithIsInclusion:()HMI
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "points");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_175506);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31A50]), "initWithPoints:isInclusion:", v5, a3);
  return v6;
}

@end
