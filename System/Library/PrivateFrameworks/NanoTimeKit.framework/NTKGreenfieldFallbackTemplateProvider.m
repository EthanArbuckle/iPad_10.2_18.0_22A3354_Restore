@implementation NTKGreenfieldFallbackTemplateProvider

+ (id)templateForClientIdentifier:(id)a3 displayName:(id)a4 family:(int64_t)a5 device:(id)a6 sdkVersion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  objc_msgSend(a1, "_tombstoneImageForFamily:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKNoContentTemplateProvider templateForDisplayName:image:family:device:sdkVersion:](NTKNoContentTemplateProvider, "templateForDisplayName:image:family:device:sdkVersion:", v13, v14, a5, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_tombstoneImageForFamily:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 <= 0xC && ((0x1595u >> a3) & 1) != 0)
  {
    NTKImageNamed(off_1E6BCED90[a3]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
