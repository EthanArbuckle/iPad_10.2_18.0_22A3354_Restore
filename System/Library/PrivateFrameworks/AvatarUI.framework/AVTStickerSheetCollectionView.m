@implementation AVTStickerSheetCollectionView

- (void)safeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTStickerSheetCollectionView;
  -[AVTStickerSheetCollectionView safeAreaInsetsDidChange](&v4, sel_safeAreaInsetsDidChange);
  -[AVTStickerSheetCollectionView collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

@end
