@implementation CAMReviewTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  unint64_t v22;
  __int128 *v23;
  __int128 v24;
  double v25;
  double v26;
  CAMReviewTransitionButton *v27;
  void *v28;
  void *v29;
  void *v30;
  NSBundle *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CAMReviewTransitionButton *v36;
  _QWORD v37[4];
  CAMReviewTransitionButton *v38;
  id v39;
  CAMReviewTransitionAnimator *v40;
  _QWORD v41[4];
  CAMReviewTransitionButton *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD v50[6];
  _OWORD v51[2];
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextToViewKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v7 = objc_msgSend(v4, "isAnimated");
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v6, "addSubview:", v5);
  -[CAMReviewTransitionAnimator _prepareTransitionWithContext:](self, "_prepareTransitionWithContext:", v4);
  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "screen"));
    objc_msgSend(v17, "scale");
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v21 = objc_msgSend(v20, "_windowInterfaceOrientation");

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    -[CAMReviewTransitionAnimator _shutterGeometryForReferenceBounds:orientation:screenScale:](self, "_shutterGeometryForReferenceBounds:orientation:screenScale:", v21, v9, v11, v13, v15, v19);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    -[CAMReviewTransitionAnimator _sendGeometryForReferenceBounds:orientation:screenScale:](self, "_sendGeometryForReferenceBounds:orientation:screenScale:", v21, v9, v11, v13, v15, v19);
    v22 = -[CAMReviewTransitionAnimator transitionDirection](self, "transitionDirection");
    v64 = 0;
    v62 = 0u;
    v63 = 0u;
    -[CAMReviewTransitionAnimator _cameraButtonShutterSpecForLayoutStyle:](self, "_cameraButtonShutterSpecForLayoutStyle:", -[CAMReviewTransitionAnimator _layoutStyle](self, "_layoutStyle"));
    v61 = 0;
    v59 = 0u;
    v60 = 0u;
    -[CAMReviewTransitionAnimator _sendButtonShutterSpecForSendBounds:](self, "_sendButtonShutterSpecForSendBounds:", (unsigned __int128)0, (unsigned __int128)0);
    if (v22)
    {
      v56 = v59;
      v57 = v60;
      v58 = v61;
      v23 = &v62;
    }
    else
    {
      v56 = v62;
      v57 = v63;
      v58 = v64;
      v23 = &v59;
    }
    v24 = v23[1];
    v53 = *v23;
    v54 = v24;
    v55 = *((_QWORD *)v23 + 4);
    if (v22)
      v25 = 1.0;
    else
      v25 = 0.0;
    if (v22)
      v26 = 0.0;
    else
      v26 = 1.0;
    v27 = objc_alloc_init(CAMReviewTransitionButton);
    v51[0] = v56;
    v51[1] = v57;
    v52 = v58;
    -[CAMReviewTransitionButton configureWithShutterButtonSpec:](v27, "configureWithShutterButtonSpec:", v51);
    -[CAMReviewTransitionButton setCenter:](v27, "setCenter:", 0.0, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator _buttonColorForMode:](self, "_buttonColorForMode:", -[CAMReviewTransitionAnimator _captureMode](self, "_captureMode")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton innerCircle](v27, "innerCircle"));
    objc_msgSend(v29, "setBackgroundColor:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton imageView](v27, "imageView"));
    objc_msgSend(v30, "setAlpha:", v25);

    v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("CAMMessagesSendButton"), v32));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton imageView](v27, "imageView"));
    objc_msgSend(v34, "setImage:", v33);

    -[CAMReviewTransitionAnimator _sendImageTransformOrientation:](self, "_sendImageTransformOrientation:", v21);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton imageView](v27, "imageView"));
    v50[0] = v50[3];
    v50[1] = v50[4];
    v50[2] = v50[5];
    objc_msgSend(v35, "setTransform:", v50);

    objc_msgSend(v6, "addSubview:", v27);
    objc_msgSend(v5, "setAlpha:", 0.0);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100009700;
    v41[3] = &unk_100014878;
    v42 = v27;
    v44 = v53;
    v45 = v54;
    v46 = v55;
    v47 = v26;
    v48 = 0;
    v49 = 0;
    v43 = v5;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100009780;
    v37[3] = &unk_1000148A0;
    v38 = v42;
    v39 = v4;
    v40 = self;
    v36 = v42;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v41, v37, 0.5, 0.0, 1.0, 1.0);

  }
}

- (void)_prepareTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator reviewViewController](self, "reviewViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reviewBarsModel"));
  objc_msgSend(v5, "performChanges:", &stru_1000148E0);
  v6 = objc_msgSend(v4, "isAnimated");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator cameraViewController](self, "cameraViewController"));
  v8 = -[CAMReviewTransitionAnimator transitionDirection](self, "transitionDirection");
  if (v8)
    v9 = 4;
  else
    v9 = 2;
  if (v8)
    v10 = 1;
  else
    v10 = 3;
  objc_msgSend(v7, "setMessagesTransitionState:animated:", v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator funCamViewController](self, "funCamViewController"));
  objc_msgSend(v11, "setTransitionState:animated:", v10, v6);

}

- (void)_finishTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator reviewViewController](self, "reviewViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reviewBarsModel"));
  objc_msgSend(v5, "performChanges:", &stru_100014900);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator cameraViewController](self, "cameraViewController"));
  if ((id)-[CAMReviewTransitionAnimator transitionDirection](self, "transitionDirection") == (id)1)
  {
    v7 = objc_msgSend(v9, "isAnimated");
    objc_msgSend(v6, "setMessagesTransitionState:animated:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator funCamViewController](self, "funCamViewController"));
    objc_msgSend(v8, "setTransitionState:animated:", 0, v7);

  }
  else if (!-[CAMReviewTransitionAnimator transitionDirection](self, "transitionDirection"))
  {
    objc_msgSend(v6, "setMessagesTransitionState:animated:", 3, objc_msgSend(v9, "isAnimated"));
  }

}

- (int64_t)_captureMode
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator cameraViewController](self, "cameraViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator cameraViewController](self, "cameraViewController"));
    v5 = objc_msgSend(v4, "captureMode");

    return (int64_t)v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator funCamViewController](self, "funCamViewController"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator funCamViewController](self, "funCamViewController"));
      v9 = objc_msgSend(v8, "mode");

      return v9 == (id)2;
    }
    else
    {
      return 0;
    }
  }
}

- (id)_buttonColorForMode:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 <= 9 && ((1 << a3) & 0x1A6) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.961, 0.2, 0.2, 1.0));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  return v3;
}

- (int64_t)_layoutStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator cameraViewController](self, "cameraViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = CAMLayoutStyleForView();

  return v4;
}

- ($E927905399350D4C972495EAC2D81E51)_shutterGeometryForReferenceBounds:(SEL)a3 orientation:(CGRect)a4 screenScale:(int64_t)a5
{
  +[CMAMessagesExtensionUtilities shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:](CMAMessagesExtensionUtilities, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:", -[CAMReviewTransitionAnimator _layoutStyle](self, "_layoutStyle"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  return ($E927905399350D4C972495EAC2D81E51 *)+[PUReviewScreenUtilities orientedGeometryForFrame:inBounds:orientation:](PUReviewScreenUtilities, "orientedGeometryForFrame:inBounds:orientation:", a5);
}

- ($E927905399350D4C972495EAC2D81E51)_sendGeometryForReferenceBounds:(SEL)a3 orientation:(CGRect)a4 screenScale:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Center;
  double v22;
  void *v23;
  id v24;
  double v26;
  double v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  +[PUReviewScreenUtilities reviewScreenControlBarFrameForReferenceBounds:](PUReviewScreenUtilities, "reviewScreenControlBarFrameForReferenceBounds:");
  v26 = v14;
  v27 = v15;
  v17 = v16;
  v19 = v18;
  Center = UIRectGetCenter(+[CMAMessagesExtensionUtilities shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:](CMAMessagesExtensionUtilities, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:", -[CAMReviewTransitionAnimator _layoutStyle](self, "_layoutStyle"), x, y, width, height, a6));
  v22 = v20;
  if (v19 <= v17)
  {
    +[PUReviewScreenControlBar sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:](PUReviewScreenControlBar, "sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:", v26, v27, v17, v19, Center, v20);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionAnimator delegate](self, "delegate"));
    v24 = objc_msgSend(v23, "availableControlsCountForReviewTransition:", self);

    +[PUReviewScreenControlBar sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:](PUReviewScreenControlBar, "sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:", v24, v26, v27, v17, v19, Center, v22);
  }
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return ($E927905399350D4C972495EAC2D81E51 *)+[PUReviewScreenUtilities orientedGeometryForFrame:inBounds:orientation:](PUReviewScreenUtilities, "orientedGeometryForFrame:inBounds:orientation:", a5);
}

- (CGAffineTransform)_sendImageTransformOrientation:(SEL)a3
{
  __int128 v6;
  void *v7;
  id v8;
  CGAffineTransform *result;
  double v10;

  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != (id)1)
  {
    switch(a4)
    {
      case 1:
        v10 = 0.0;
        break;
      case 3:
        v10 = 1.57079633;
        break;
      case 4:
        v10 = -1.57079633;
        break;
      default:
        v10 = 3.14159265;
        if (a4 != 2)
          v10 = 0.0;
        break;
    }
    return CGAffineTransformMakeRotation(retstr, -v10);
  }
  return result;
}

- (CAMShutterButtonSpec)_cameraButtonShutterSpecForLayoutStyle:(SEL)a3
{
  void *v6;
  unsigned int v7;
  CAMShutterButtonSpec *result;
  __int128 v9;
  _OWORD v10[2];
  double v11;

  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"));
  v7 = objc_msgSend(v6, "isCTMSupported");

  if (v7)
    result = (CAMShutterButtonSpec *)+[CAMDynamicShutterControl shutterButtonSpecForLayoutStyle:](CAMDynamicShutterControl, "shutterButtonSpecForLayoutStyle:", a4);
  else
    result = (CAMShutterButtonSpec *)CAMShutterButtonSpecForLayoutStyle(v10, a4);
  v9 = v10[1];
  *(_OWORD *)&retstr->var0 = v10[0];
  *(_OWORD *)&retstr->var2 = v9;
  retstr->var4 = v11;
  return result;
}

- (CAMShutterButtonSpec)_sendButtonShutterSpecForSendBounds:(SEL)a3
{
  double width;
  CAMShutterButtonSpec *result;

  width = a4.size.width;
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = (CAMShutterButtonSpec *)CAMShutterButtonSpecMake(self, a3, a4.size.width, 5.0, 0.0, 0.0, 2.0);
  if (width > 60.0)
  {
    retstr->var1 = 6.0;
    retstr->var4 = 2.5;
  }
  return result;
}

- (unint64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (void)setTransitionDirection:(unint64_t)a3
{
  self->_transitionDirection = a3;
}

- (CAMReviewTransitionAnimatorDelegate)delegate
{
  return (CAMReviewTransitionAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMCameraViewController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraViewController, a3);
}

- (PUAssetExplorerReviewScreenViewController)reviewViewController
{
  return self->_reviewViewController;
}

- (void)setReviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reviewViewController, a3);
}

- (CFXCameraViewController)funCamViewController
{
  return self->_funCamViewController;
}

- (void)setFunCamViewController:(id)a3
{
  objc_storeStrong((id *)&self->_funCamViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_funCamViewController, 0);
  objc_storeStrong((id *)&self->_reviewViewController, 0);
  objc_storeStrong((id *)&self->_cameraViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
