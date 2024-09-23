@implementation CMAMessagesExtensionUtilities

+ (CGRect)shutterButtonAlignmentRectForReferenceBounds:(CGRect)a3 layoutStyle:(int64_t)a4 screenScale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  unsigned int v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"));
  v12 = objc_msgSend(v11, "isCTMSupported");

  if (v12)
  {
    +[CAMDynamicShutterControl shutterButtonSpecForLayoutStyle:](CAMDynamicShutterControl, "shutterButtonSpecForLayoutStyle:", a4);
    v13 = objc_msgSend(objc_alloc((Class)CAMFullscreenViewfinderLayout), "initWithReferenceBounds:shutterIntrinsicSize:", 0.0, 0.0, fmin(width, height), fmax(width, height), v39, v39);
    objc_msgSend(v13, "alignmentRectForShutterControl");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    +[PUReviewScreenUtilities cameraBottomBarFrameForReferenceBounds:](PUReviewScreenUtilities, "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithDisplayScale:](UITraitCollection, "traitCollectionWithDisplayScale:", a5));
    +[CAMBottomBar shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:](CAMBottomBar, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", a4, v30, v23, v25, v27, v29, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v15 = v31;
    v17 = v32;
    v19 = v33;
    v21 = v34;

  }
  v35 = v15;
  v36 = v17;
  v37 = v19;
  v38 = v21;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

@end
