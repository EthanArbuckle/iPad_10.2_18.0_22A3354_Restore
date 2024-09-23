@implementation AVMobileControlsStyleSheet

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (AVMobileControlsStyleSheet)initWithTraitCollection:(id)a3
{
  id v5;
  AVMobileControlsStyleSheet *v6;
  AVMobileControlsStyleSheet *v7;
  uint64_t v8;
  double v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileControlsStyleSheet;
  v6 = -[AVMobileControlsStyleSheet init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_traitCollection, a3);
    if (objc_msgSend(v5, "userInterfaceIdiom"))
    {
      v8 = objc_msgSend(v5, "userInterfaceIdiom");
      v9 = 25.0;
      if (v8 != 1)
        goto LABEL_7;
    }
    else
    {
      v9 = 44.0;
    }
    v7->_statusBarHeight = v9;
  }
LABEL_7:

  return v7;
}

- (UIEdgeInsets)landscapeFullscreenInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)portraitFullscreenInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)standardPaddingFullScreen
{
  return 0.0;
}

- (double)standardPaddingInline
{
  return 0.0;
}

- (UIEdgeInsets)playbackControlsViewLayoutMarginsForView:(id)a3 keyboardHeight:(double)a4 isFullScreen:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Width;
  double Height;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  unint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  int v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  UIEdgeInsets result;
  CGRect v115;

  v5 = a5;
  v8 = a3;
  -[AVMobileControlsStyleSheet traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileControlsStyleSheet standardPaddingFullScreen](self, "standardPaddingFullScreen");
  v11 = v10;
  v12 = objc_msgSend(v9, "userInterfaceIdiom");
  objc_msgSend(v8, "safeAreaInsets");
  v14 = v13;
  v100 = v15;
  v101 = v16;
  v99 = v17;
  objc_msgSend(v8, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v102 = v14;
  if (v18)
  {
    v97 = a4;
    v98 = v11;
    objc_msgSend(v8, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "statusBarManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "statusBarFrame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    Width = v28;

    v103.origin.x = v23;
    v103.origin.y = v25;
    v103.size.width = v27;
    v103.size.height = Width;
    Height = CGRectGetHeight(v103);
    v104.origin.x = v23;
    v104.origin.y = v25;
    v104.size.width = v27;
    v104.size.height = Width;
    if (Height > CGRectGetWidth(v104))
    {
      v105.origin.x = v23;
      v105.origin.y = v25;
      v105.size.width = v27;
      v105.size.height = Width;
      v31 = CGRectGetHeight(v105);
      v106.origin.x = v23;
      v106.origin.y = v25;
      v106.size.width = v27;
      v106.size.height = Width;
      Width = CGRectGetWidth(v106);
      v27 = v31;
    }
    objc_msgSend(v8, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertRect:fromView:", v32, v23, v25, v27, Width);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    objc_msgSend(v8, "bounds");
    v115.origin.x = v41;
    v115.origin.y = v42;
    v115.size.width = v43;
    v115.size.height = v44;
    v107.origin.x = v34;
    v107.origin.y = v36;
    v107.size.width = v38;
    v107.size.height = v40;
    v108 = CGRectIntersection(v107, v115);
    x = v108.origin.x;
    y = v108.origin.y;
    v47 = v108.size.width;
    v48 = v108.size.height;

    v109.origin.x = x;
    v109.origin.y = y;
    v109.size.width = v47;
    v109.size.height = v48;
    v49 = CGRectGetHeight(v109);
    if (v49 < 0.0)
      v49 = 0.0;
    v96 = v49;
    objc_msgSend(v8, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v18, "convertRect:fromView:", v8);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    v110.origin.x = v51;
    v110.origin.y = v53;
    v110.size.width = v55;
    v110.size.height = v57;
    v14 = v102;
    v58 = v102 + CGRectGetMinY(v110);
    v111.origin.x = v23;
    v111.origin.y = v25;
    v111.size.width = v27;
    v111.size.height = Width;
    v11 = v98;
    LODWORD(v18) = v58 > v98 * 0.5 + CGRectGetMaxY(v111);
    a4 = v97;
    if (!v5)
      goto LABEL_24;
  }
  else
  {
    v96 = 0.0;
    if (!v5)
    {
LABEL_24:
      objc_msgSend(v8, "window");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "screen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVMobileControlsStyleSheet embeddedInlineInsets](self, "embeddedInlineInsets");
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "orientation");

      objc_msgSend(v79, "_peripheryInsets");
      UIEdgeInsetsAdd();
      v82 = v81;
      v68 = v83;
      v85 = v84;
      v70 = v86;
      v87 = objc_msgSend(v8, "avkit_isDescendantOfNonPagingScrollView");
      v88 = -0.0;
      v89 = v101;
      if (v87)
        v89 = -0.0;
      v69 = v85 + v89;
      if (!v87)
        v88 = v102;
      v66 = v82 + v88;

      goto LABEL_54;
    }
  }
  if (v12 == 5)
    goto LABEL_24;
  v59 = v11 + a4;
  if (a4 >= 100.0)
    v59 = 0.0;
  if (v101 >= v59)
    v60 = v101;
  else
    v60 = v59;
  objc_msgSend(v9, "displayCornerRadius");
  if (v61 <= 0.0)
  {
    v90 = v11 * 0.5 + v96;
    if (v90 < v11)
      v90 = v11;
    if ((_DWORD)v18)
      v66 = v11 * 0.5 + v14;
    else
      v66 = v90;
    v69 = v11 + v60;
    v70 = v11;
    v68 = v11;
  }
  else
  {
    v62 = (id *)MEMORY[0x1E0DC4730];
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "_isClassic") && objc_msgSend(*v62, "_classicMode") != 5)
    {
      objc_msgSend(v8, "bounds");
      v91 = CGRectGetWidth(v112);
      objc_msgSend(v8, "bounds");
      if (v91 <= CGRectGetHeight(v113))
        v70 = v11;
      else
        v70 = v11 * 1.5;
      v69 = v70;
      v68 = v70;
      v66 = v70;
    }
    else
    {
      objc_msgSend(v8, "avkit_overrideLayoutMarginsForCounterRotation");
      v66 = v63;
      v68 = v67;
      v69 = v64;
      v70 = v65;
      if (v67 == 2.22507386e-308 && v63 == 2.22507386e-308 && v65 == 2.22507386e-308 && v64 == 2.22507386e-308)
      {
        objc_msgSend(v8, "window");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "windowScene");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "interfaceOrientation") - 3;

        if (v73 > 1)
          -[AVMobileControlsStyleSheet portraitFullscreenInsets](self, "portraitFullscreenInsets");
        else
          -[AVMobileControlsStyleSheet landscapeFullscreenInsets](self, "landscapeFullscreenInsets");
        if (v14 >= self->_statusBarHeight)
          v74 = v11 + v14;
        if (v74 >= v14)
          v66 = v74;
        else
          v66 = v14;
        if (v75 >= v100)
          v68 = v75;
        else
          v68 = v100;
        if (v77 >= v99)
          v70 = v77;
        else
          v70 = v99;
        if (v76 >= v60)
          v69 = v76;
        else
          v69 = v60;
      }
    }
  }
LABEL_54:

  v92 = v66;
  v93 = v68;
  v94 = v69;
  v95 = v70;
  result.right = v95;
  result.bottom = v94;
  result.left = v93;
  result.top = v92;
  return result;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (UIEdgeInsets)embeddedInlineInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_embeddedInlineInsets.top;
  left = self->_embeddedInlineInsets.left;
  bottom = self->_embeddedInlineInsets.bottom;
  right = self->_embeddedInlineInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
