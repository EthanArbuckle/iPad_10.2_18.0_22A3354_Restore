@implementation UIView(BannerKitAdditions)

- (double)bn_convertRectToSceneReferenceSpace:()BannerKitAdditions
{
  void *v10;
  double v11;
  double v12;

  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convertRect:toView:", 0, a2, a3, a4, a5);
  objc_msgSend(v10, "_convertRectToSceneReferenceSpace:");
  v12 = v11;

  return v12;
}

- (double)bn_convertRectFromSceneReferenceSpace:()BannerKitAdditions
{
  void *v10;
  double v11;
  double v12;

  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_convertRectFromSceneReferenceSpace:", a2, a3, a4, a5);
  objc_msgSend(a1, "convertRect:fromView:", 0);
  v12 = v11;

  return v12;
}

@end
