@implementation UIImage(HKMenstrualCyclesUI)

+ (id)_hkmcui_imageWithAssetName:()HKMenstrualCyclesUI
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "hkmcui_bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)hkmc_fertilityProjectionImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_hkmcui_imageWithAssetName:", CFSTR("Fertility Projection"));
}

+ (id)hkmc_fertilityProjectionReversedImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hkmc_fertilityProjectionImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithHorizontallyFlippedOrientation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_fertilityProjectionImageHighContrast
{
  return objc_msgSend(a1, "_hkmcui_imageWithAssetName:", CFSTR("Fertility Projection - High Contrast"));
}

+ (uint64_t)hkmc_menstruationProjectionHighImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_hkmcui_imageWithAssetName:", CFSTR("Menstruation Projection High"));
}

+ (id)hkmc_menstruationProjectionHighReversedImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hkmc_menstruationProjectionHighImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithHorizontallyFlippedOrientation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_menstruationProjectionHighImageHighContrast
{
  return objc_msgSend(a1, "_hkmcui_imageWithAssetName:", CFSTR("Menstruation Projection High - High Contrast"));
}

+ (uint64_t)hkmc_menstruationProjectionLowImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_hkmcui_imageWithAssetName:", CFSTR("Menstruation Projection Low"));
}

+ (id)hkmc_menstruationProjectionLowReversedImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hkmc_menstruationProjectionLowImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithHorizontallyFlippedOrientation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_menstruationProjectionLowImageHighContrast
{
  return objc_msgSend(a1, "_hkmcui_imageWithAssetName:", CFSTR("Menstruation Projection Low - High Contrast"));
}

+ (uint64_t)hkmc_ovulationDayImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_hkmcui_imageWithAssetName:", CFSTR("Ovulation Day Cycle Timeline"));
}

+ (id)hkmc_ovulationDayReversedImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hkmc_ovulationDayImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithHorizontallyFlippedOrientation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_ovulationDayImageHighContrast
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_hkmcui_imageWithAssetName:", CFSTR("Ovulation Day Cycle Timeline - High Contrast"));
}

+ (uint64_t)hkmc_ovulationEstimateImage
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_hkmcui_imageWithAssetName:", CFSTR("Ovulation Confirmation"));
}

@end
