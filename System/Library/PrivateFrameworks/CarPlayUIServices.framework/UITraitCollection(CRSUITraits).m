@implementation UITraitCollection(CRSUITraits)

+ (id)crsui_traitCollectionWithMapStyle:()CRSUITraits
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_traitCollectionWithValue:forTraitNamed:", v2, CFSTR("CRSUIMapStyleTraitName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)crsui_mapStyle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_valueForTraitNamed:", CFSTR("CRSUIMapStyleTraitName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

@end
