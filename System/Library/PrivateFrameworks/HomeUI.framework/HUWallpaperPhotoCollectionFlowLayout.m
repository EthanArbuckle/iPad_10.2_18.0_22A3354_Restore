@implementation HUWallpaperPhotoCollectionFlowLayout

- (HUWallpaperPhotoCollectionFlowLayout)initWithAssetCollectionSubtype:(int64_t)a3
{
  HUWallpaperPhotoCollectionFlowLayout *v4;
  HUWallpaperPhotoCollectionFlowLayout *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperPhotoCollectionFlowLayout;
  v4 = -[UICollectionViewFlowLayout init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_assetCollectionSubtype = a3;
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v4, "setMinimumInteritemSpacing:", 1.0);
  }
  return v5;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUWallpaperPhotoCollectionFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v13, sel_prepareLayout);
  -[HUWallpaperPhotoCollectionFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v7 = (v5 + v6 * -3.0) * 0.25;

  v8 = -[HUWallpaperPhotoCollectionFlowLayout assetCollectionSubtype](self, "assetCollectionSubtype");
  v9 = 1.0;
  v10 = v7;
  if (v8 == 201)
  {
    -[HUWallpaperPhotoCollectionFlowLayout collectionView](self, "collectionView", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v10 = v12 + -16.0;

    v9 = 8.0;
  }
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:", v9);
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", v10, v7);
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

@end
