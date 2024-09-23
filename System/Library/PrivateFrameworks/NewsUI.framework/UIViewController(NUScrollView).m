@implementation UIViewController(NUScrollView)

- (uint64_t)nu_adjustInsetsForScrollView:()NUScrollView
{
  return objc_msgSend(a1, "nu_adjustInsetsForScrollView:withEdgeInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
}

- (uint64_t)nu_adjustInsetsForScrollView:()NUScrollView withEdgeInsets:
{
  return objc_msgSend(a1, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", a3, 0);
}

- (void)nu_adjustInsetsForScrollView:()NUScrollView transparentNavigationBar:withEdgeInsets:
{
  CGFloat v14;
  CGFloat v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double Height;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL IsEmpty;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  double v53;
  double MaxY;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat rect;
  id v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v70 = a7;
  objc_msgSend(v70, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  v14 = *MEMORY[0x24BDBF090];
  v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  rect = *(double *)(MEMORY[0x24BDBF090] + 16);
  objc_msgSend(a1, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "toolbar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isToolbarHidden");

    if ((v20 & 1) == 0)
    {
      objc_msgSend(a1, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "toolbar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v14 = v23;
      v15 = v24;
      rect = v25;

      objc_msgSend(a1, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      Height = CGRectGetHeight(v71);
      objc_msgSend(a1, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "safeAreaLayoutGuide");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layoutFrame");
      v16 = Height - CGRectGetMaxY(v72);

    }
  }
  objc_msgSend(a1, "tabBarController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tabBar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = a4;
  v68 = a5;
  if ((objc_msgSend(v31, "isHidden") & 1) != 0)
    goto LABEL_7;
  objc_msgSend(a1, "tabBarController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tabBar");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  IsEmpty = CGRectIsEmpty(v73);

  if (!IsEmpty)
  {
    objc_msgSend(a1, "tabBarController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "tabBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v14 = v37;
    v15 = v38;
    rect = v39;

    objc_msgSend(a1, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v40 = CGRectGetHeight(v74);
    objc_msgSend(a1, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "safeAreaLayoutGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutFrame");
    v16 = v40 - CGRectGetMaxY(v75);

LABEL_7:
  }
  objc_msgSend(a1, "navigationController", *(_QWORD *)&a2, *(_QWORD *)&a3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "navigationBar");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v43, "frameUsingCenterAndBounds");
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  objc_msgSend(a1, "navigationController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = objc_msgSend(v52, "isNavigationBarHidden");

  v53 = 0.0;
  if ((v43 & 1) == 0 && (a8 & 1) == 0)
  {
    v76.origin.x = v45;
    v76.origin.y = v47;
    v76.size.width = v49;
    v76.size.height = v51;
    MaxY = CGRectGetMaxY(v76);
    if (MaxY >= 0.0)
      v55 = MaxY;
    else
      v55 = 0.0;
    if (v55 == 0.0)
    {
      objc_msgSend(a1, "view");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "safeAreaInsets");
      v58 = v57;

      if (v58 > 0.0)
      {
        objc_msgSend(a1, "view");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "safeAreaInsets");
        v55 = v60;

      }
    }
    objc_msgSend(a1, "additionalSafeAreaInsets");
    v53 = v55 + v61;
  }
  v62 = v65 + v53;
  v77.origin.x = v14;
  v77.origin.y = v15;
  v77.size.width = rect;
  v77.size.height = v16;
  objc_msgSend(v70, "setContentInset:", v62, v66 + 0.0, v67 + CGRectGetHeight(v77), v68 + 0.0);
  objc_msgSend(v70, "contentOffset");
  if (v63 <= 0.0 && (a8 & 1) == 0)
  {
    objc_msgSend(v70, "contentInset");
    objc_msgSend(v70, "setContentOffset:", 0.0, -v64);
  }
  objc_msgSend(v70, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);

}

@end
