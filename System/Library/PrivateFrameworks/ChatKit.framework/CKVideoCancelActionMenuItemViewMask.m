@implementation CKVideoCancelActionMenuItemViewMask

void __CKVideoCancelActionMenuItemViewMask_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  CGSize v4;

  v4.width = 36.0;
  v4.height = 36.0;
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "set");

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", 0.0, 0.0, 36.0, 36.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fill");

  UIGraphicsGetImageFromCurrentImageContext();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CKVideoCancelActionMenuItemViewMask_sMask;
  CKVideoCancelActionMenuItemViewMask_sMask = v2;

  UIGraphicsEndImageContext();
}

@end
