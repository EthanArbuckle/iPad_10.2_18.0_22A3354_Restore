@implementation CRSUIWallpaperTraits

- (CRSUIWallpaperTraits)initWithSupportsDynamicAppearance:(BOOL)a3 supportsDashboardPlatterMaterials:(BOOL)a4 iconLabelsRequireBackground:(BOOL)a5 hideRoundedCorners:(BOOL)a6 black:(BOOL)a7
{
  CRSUIWallpaperTraits *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRSUIWallpaperTraits;
  result = -[CRSUIWallpaperTraits init](&v13, sel_init);
  if (result)
  {
    result->_supportsDynamicAppearance = a3;
    result->_supportsDashboardPlatterMaterials = a4;
    result->_iconLabelsRequireBackground = a5;
    result->_hideRoundedCorners = a6;
    result->_black = a7;
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits supportsDynamicAppearance](self, "supportsDynamicAppearance"), CFSTR("supportsDynamicAppearance"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits supportsDashboardPlatterMaterials](self, "supportsDashboardPlatterMaterials"), CFSTR("supportsDashboardPlatterMaterials"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits iconLabelsRequireBackground](self, "iconLabelsRequireBackground"), CFSTR("iconLabelsRequireBackground"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits hideRoundedCorners](self, "hideRoundedCorners"), CFSTR("hideRoundedCorners"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits isBlack](self, "isBlack"), CFSTR("black"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits supportsDynamicAppearance](self, "supportsDynamicAppearance"), CFSTR("supportsDynamicAppearance"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits supportsDashboardPlatterMaterials](self, "supportsDashboardPlatterMaterials"), CFSTR("supportsDashboardPlatterMaterials"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits iconLabelsRequireBackground](self, "iconLabelsRequireBackground"), CFSTR("iconLabelsRequireBackground"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits hideRoundedCorners](self, "hideRoundedCorners"), CFSTR("hideRoundedCorners"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits isBlack](self, "isBlack"), CFSTR("black"));

}

- (CRSUIWallpaperTraits)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDynamicAppearance"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDashboardPlatterMaterials"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iconLabelsRequireBackground"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideRoundedCorners"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("black"));

  return -[CRSUIWallpaperTraits initWithSupportsDynamicAppearance:supportsDashboardPlatterMaterials:iconLabelsRequireBackground:hideRoundedCorners:black:](self, "initWithSupportsDynamicAppearance:supportsDashboardPlatterMaterials:iconLabelsRequireBackground:hideRoundedCorners:black:", v5, v6, v7, v8, v9);
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (BOOL)supportsDashboardPlatterMaterials
{
  return self->_supportsDashboardPlatterMaterials;
}

- (BOOL)iconLabelsRequireBackground
{
  return self->_iconLabelsRequireBackground;
}

- (BOOL)hideRoundedCorners
{
  return self->_hideRoundedCorners;
}

- (BOOL)isBlack
{
  return self->_black;
}

@end
