@implementation VKMapView(MapKitAdditions)

- (uint64_t)_mapkit_configureFromDefaults
{
  return objc_msgSend(a1, "setLocalizeLabels:", GEOConfigGetBOOL());
}

- (void)_mapkit_configureLabelSizesForContentSizeCategory:()MapKitAdditions
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "setLabelScaleFactor:", labelScaleFactorForContentSizeCategory(v4));
  v6 = v4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB400]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB3F8]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB3E0]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB3D8]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB3D0]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB3C8]) & 1) != 0)
  {
    v5 = 5;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB3C0]))
  {
    v5 = 5;
  }
  else
  {
    v5 = 4;
  }

  objc_msgSend(a1, "setShieldSize:", v5);
}

@end
