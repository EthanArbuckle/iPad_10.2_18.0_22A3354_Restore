@implementation CAMZoomSliderUtilities

+ (void)layoutZoomSlider:(id)a3 forLayoutStyle:(int64_t)a4 bottomBar:(id)a5 previewView:(id)a6 viewfinderView:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  id v59;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v15, "superview");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "backgroundStyle") == 1;
  objc_msgSend(v14, "layoutIfNeeded");
  objc_msgSend(v14, "shutterButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v17, "alignmentRectForFrame:");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v17, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "convertRect:toView:", v59, v19, v21, v23, v25);
  v57 = v28;
  v58 = v27;
  v55 = v30;
  v56 = v29;

  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "convertRect:toView:", v59);
  v53 = v32;
  v54 = v31;
  v51 = v34;
  v52 = v33;

  objc_msgSend(v13, "bounds");
  objc_msgSend(v13, "convertRect:toView:", v59);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  objc_msgSend(v12, "bounds");
  objc_msgSend(v12, "convertRect:toView:", v59);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;

  objc_msgSend(a1, "layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:", v15, a4, v16, v54, v53, v52, v51, v58, v57, v56, v55, v36, v38, v40, v42, v44,
    v46,
    v48,
    v50);

}

+ (void)layoutZoomSlider:(CGFloat)a3 forLayoutStyle:(CGFloat)a4 bottomBarAlignmentRect:(CGFloat)a5 bottomBarTransparent:(CGFloat)a6 shutterButtonAlignmentRect:(CGFloat)a7 previewViewAlignmentRect:(CGFloat)a8 viewfinderViewAlignmentRect:(uint64_t)a9
{
  id v34;
  _BOOL4 v35;
  _BOOL4 IsEmpty;
  BOOL v37;
  void *v38;
  double v39;
  __int128 v40;
  double MinX;
  double v42;
  double v43;
  double v44;
  double v45;
  double Width;
  double v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  double MaxY;
  CGFloat v53;
  CGFloat v54;
  CGFloat rect;
  double v56;
  _OWORD v57[3];
  CGAffineTransform v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v34 = a11;
  v35 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a12);
  v62.origin.x = a1;
  v62.origin.y = a2;
  v62.size.width = a3;
  v62.size.height = a4;
  IsEmpty = CGRectIsEmpty(v62);
  v63.origin.x = a5;
  v63.origin.y = a6;
  v63.size.width = a7;
  v63.size.height = a8;
  v37 = CGRectIsEmpty(v63);
  objc_msgSend(v34, "minimumTrackImageForState:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "size");
  v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v59 = *MEMORY[0x1E0C9BAA8];
  v60 = v40;
  v61 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (v35)
  {
    CGAffineTransformMakeRotation(&v58, -1.57079633);
    UIIntegralTransform();
    v64.origin.x = a18;
    v64.origin.y = a19;
    v64.size.width = a20;
    v64.size.height = a21;
    MinX = CGRectGetMinX(v64);
    v65.origin.x = a18;
    v65.origin.y = a19;
    v65.size.width = a20;
    v65.size.height = a21;
    CGRectGetHeight(v65);
    UIRoundToViewScale();
    v43 = v42;
    v44 = 25.0;
    v45 = 0.0;
    Width = 64.0;
    v47 = 320.0;
    v48 = 0.0;
  }
  else
  {
    rect = a4;
    v56 = v39;
    v54 = a8;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scale");
    v45 = 1.0 / v50 * 2.0 + 35.0;

    if (((IsEmpty | a13) & 1) != 0)
    {
      v51 = a18;
      if (v37)
      {
        v66.size.width = a16;
        v66.size.height = a17;
        v66.origin.x = a14;
        v66.origin.y = a15;
        MaxY = CGRectGetMaxY(v66);
        v44 = 20.0;
        v45 = 10.0;
      }
      else
      {
        v68.origin.x = a5;
        v68.size.height = v54;
        v68.origin.y = a6;
        v68.size.width = a7;
        MaxY = CGRectGetMinY(v68);
        v44 = 20.0;
      }
      v48 = 30.0;
    }
    else
    {
      v67.origin.x = a1;
      v67.origin.y = a2;
      v67.size.width = a3;
      v67.size.height = rect;
      MaxY = CGRectGetMinY(v67) + 10.0;
      v45 = v45 + 10.0;
      v44 = 20.0;
      v48 = 30.0;
      v51 = a18;
    }
    v69.origin.x = v51;
    v69.origin.y = a19;
    v69.size.width = a20;
    v69.size.height = a21;
    v53 = CGRectGetMinX(v69);
    v70.origin.x = v51;
    MinX = v53;
    v70.origin.y = a19;
    v70.size.width = a20;
    v70.size.height = a21;
    Width = CGRectGetWidth(v70);
    v47 = v45 + v56 + v48;
    v43 = MaxY - v47;
  }
  objc_msgSend(v34, "setAlignmentRectInsets:", v48, v44, v45, v44);
  v57[0] = v59;
  v57[1] = v60;
  v57[2] = v61;
  objc_msgSend(v34, "setTransform:", v57);
  objc_msgSend(v34, "setFrame:", MinX, v43, Width, v47);

}

@end
