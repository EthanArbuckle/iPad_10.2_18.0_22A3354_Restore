@implementation NTKCFaceDetailCustomPhotosFlowLayout

- (NTKCFaceDetailCustomPhotosFlowLayout)init
{
  NTKCFaceDetailCustomPhotosFlowLayout *v2;
  NTKCFaceDetailCustomPhotosFlowLayout *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  CGFloat v8;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailCustomPhotosFlowLayout;
  v2 = -[UICollectionViewFlowLayout init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKCFaceDetailCustomPhotosFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v2, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
    if (NTKCScreenStyle() == -1)
    {
      v6 = 2.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scale");
      v6 = 2.0 / v5;

    }
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", v6);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", v6);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = (CGRectGetWidth(v11) + v6 * -3.0) * 0.25;

    -[UICollectionViewFlowLayout setItemSize:](v3, "setItemSize:", v8, v8);
    -[UICollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", v6, 0.0, v6, 0.0);
  }
  return v3;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKCFaceDetailCustomPhotosFlowLayout;
  -[NTKCFaceDetailCustomPhotosFlowLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v8, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v7, 1.2, 1.2);
  v6 = v7;
  objc_msgSend(v4, "setTransform:", &v6);
  return v4;
}

@end
