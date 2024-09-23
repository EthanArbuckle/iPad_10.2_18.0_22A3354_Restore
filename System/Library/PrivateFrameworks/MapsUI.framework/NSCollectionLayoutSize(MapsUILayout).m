@implementation NSCollectionLayoutSize(MapsUILayout)

+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout fractionalHeight:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout fractionalHeightUsingWidth:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout height:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
