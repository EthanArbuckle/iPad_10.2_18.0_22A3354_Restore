@implementation CKResizableBalloonMask

void __CKResizableBalloonMask_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CKResizableBalloonMask_resizableBalloonMasks;
  CKResizableBalloonMask_resizableBalloonMasks = v1;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CKResizableBalloonMask_containsMasksForAccessibilitySizes = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory");

}

void __CKResizableBalloonMask_block_invoke_2(uint64_t a1)
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v5 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonMaskTailSizeForTailShape:", *(char *)(a1 + 57));
  v8 = v5 - v7;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");

  CKRectFillCornersUsingBlendMode(*(_QWORD *)(a1 + 136), kCGBlendModeNormal, v2, v3, v8, v4);
}

@end
