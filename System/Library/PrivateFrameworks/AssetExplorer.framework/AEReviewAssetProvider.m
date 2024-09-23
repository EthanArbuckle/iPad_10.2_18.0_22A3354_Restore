@implementation AEReviewAssetProvider

- (id)reviewAssetProviderRequestForDisplayAsset:(id)a3
{
  id v3;
  id v4;
  AEPhotosAssetPackageGenerator *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[AEPhotosAssetPackageGenerator initWithAsset:]([AEPhotosAssetPackageGenerator alloc], "initWithAsset:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
