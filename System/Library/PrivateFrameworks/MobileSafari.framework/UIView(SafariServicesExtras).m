@implementation UIView(SafariServicesExtras)

+ (void)safari_performWithoutRetargetingAnimations:()SafariServicesExtras
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__UIView_SafariServicesExtras__safari_performWithoutRetargetingAnimations___block_invoke;
  v6[3] = &unk_1E21E3068;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "performWithoutAnimation:", v6);

}

- (void)_sf_addInteractionUnlessNil:()SafariServicesExtras
{
  if (a3)
    return (void *)objc_msgSend(a1, "addInteraction:");
  return a1;
}

- (double)_sf_safeAreaBounds
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  objc_msgSend(a1, "safeAreaInsets");
  return v3 + v4;
}

- (uint64_t)_sf_usesLeftToRightLayout
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_sf_usesLeftToRightLayoutOnView:", a1);
}

+ (BOOL)_sf_usesLeftToRightLayoutOnView:()SafariServicesExtras
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a3, "semanticContentAttribute")) == 0;
}

- (uint64_t)sf_applyContentSizeCategoryLimitsForToolbarButton
{
  objc_msgSend(a1, "setMinimumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  return objc_msgSend(a1, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F8]);
}

- (BOOL)_sf_isFullScreenWidth
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  double Width;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a1, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = a1;
  v6 = v5;

  v7 = 0;
  if (v2 && v6)
  {
    objc_msgSend(v2, "bounds");
    Width = CGRectGetWidth(v10);
    objc_msgSend(v6, "bounds");
    v7 = Width == CGRectGetWidth(v11);
  }

  return v7;
}

- (void)_sf_setOrderedSubviews:()SafariServicesExtras count:
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[4];

  objc_msgSend(a1, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v9 = 0;
    do
    {
      if (a3[v9])
        objc_msgSend(v8, "addIndex:", v9);
      ++v9;
    }
    while (a4 != v9);
  }
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v7, "count"))
    goto LABEL_8;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__UIView_SafariServicesExtras___sf_setOrderedSubviews_count___block_invoke;
  v13[3] = &unk_1E21E3008;
  v17 = a3;
  v14 = v7;
  v15 = v22;
  v16 = &v18;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v13);
  v11 = *((unsigned __int8 *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
  if (!v11)
  {
LABEL_8:
    if (a4)
    {
      v12 = 0;
      do
      {
        if (*a3)
          objc_msgSend(a1, "insertSubview:atIndex:", *a3, v12++);
        ++a3;
        --a4;
      }
      while (a4);
    }
  }

}

- (uint64_t)_sf_setMatchesIntrinsicContentSize
{
  double v3;
  double v4;
  double v5;

  LODWORD(a2) = 1148846080;
  objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:", 0, a2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, "setContentHuggingPriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  LODWORD(v5) = 1148846080;
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:", 1, v5);
}

- (id)_sf_firstAncestorViewOfClass:()SafariServicesExtras
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "superview");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

+ (void)_sf_cancelLinkAnimationsOnSourceWindow:()SafariServicesExtras destinationWindow:
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_getAssociatedObject(v6, &linkAnimationContainerLayerAssociatedObjectKey);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, &linkAnimationContainerLayerAssociatedObjectKey, 0, (void *)1);

  objc_msgSend(v8, "removeFromSuperlayer");
  objc_getAssociatedObject(v5, &linkAnimationDestinationLayerAssociatedObjectKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, &linkAnimationDestinationLayerAssociatedObjectKey, 0, (void *)1);

  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("SafariLinkAnimation"));
}

- (BOOL)_sf_hasLandscapeAspectRatio
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v5;
  CGRect v7;
  CGRect v8;

  objc_msgSend(a1, "frame");
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  v5 = CGRectGetWidth(v7);
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return v5 > CGRectGetHeight(v8);
}

- (BOOL)_sf_isFullScreenHeight
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  double Height;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a1, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = a1;
  v6 = v5;

  v7 = 0;
  if (v2 && v6)
  {
    objc_msgSend(v2, "bounds");
    Height = CGRectGetHeight(v10);
    objc_msgSend(v6, "bounds");
    v7 = Height == CGRectGetHeight(v11);
  }

  return v7;
}

- (double)_sf_safeAreaInsetsFlippedForLayoutDirectionality
{
  double v2;
  double v3;

  objc_msgSend(a1, "safeAreaInsets");
  v3 = v2;
  objc_msgSend(a1, "_sf_usesLeftToRightLayout");
  return v3;
}

- (double)_sf_bottomUnsafeAreaFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat rect;
  double rect_8;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  rect = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "safeAreaInsets");
  v11 = v3 + v10;
  v13 = v5 + v12;
  v15 = v7 - (v10 + v14);
  v17 = v9 - (v12 + v16);
  v21.origin.x = v3 + v10;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  rect_8 = CGRectGetMinX(v21);
  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  CGRectGetMaxY(v22);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  CGRectGetWidth(v23);
  v24.origin.x = rect;
  v24.origin.y = v5;
  v24.size.width = v7;
  v24.size.height = v9;
  CGRectGetHeight(v24);
  v25.origin.x = v11;
  v25.origin.y = v13;
  v25.size.width = v15;
  v25.size.height = v17;
  CGRectGetMaxY(v25);
  return rect_8;
}

- (double)_sf_bottomUnsafeAreaFrameForToolbar
{
  double v1;
  double v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGRect v10;

  objc_msgSend(a1, "_sf_bottomUnsafeAreaFrame");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  if ((_SFDeviceHasHomeButton() & 1) == 0 && _SFDeviceIsPad())
  {
    v10.origin.x = v2;
    v10.origin.y = v4;
    v10.size.width = v6;
    v10.size.height = v8;
    CGRectGetHeight(v10);
  }
  return v2;
}

- (id)sf_privacyPreservingDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGAffineTransform transform;
  CGAffineTransform v10;
  CGPoint v11;
  CGRect v12;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = objc_opt_class();
  objc_msgSend(a1, "bounds");
  NSStringFromCGRect(v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "center");
  NSStringFromCGPoint(v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p; bounds = %@; center = %@"), v3, a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v10, 0, sizeof(v10));
  objc_msgSend(a1, "transform");
  transform = v10;
  if (!CGAffineTransformIsIdentity(&transform))
  {
    transform = v10;
    NSStringFromCGAffineTransform(&transform);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; transform = %@"), v7);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)_sf_viewAncestrySummaryWithMinDepth:()SafariServicesExtras paddingLevel:
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  void *v24;
  uint64_t v25;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "_sf_depth");
  v9 = a1;
  if (v9)
  {
    v10 = v9;
    if (v8 >= a3)
      v11 = a3;
    else
      v11 = v8;
    v12 = ~v8 + v11;
    do
    {
      objc_msgSend(v10, "sf_privacyPreservingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertObject:atIndex:", v13, 0);

      if (__CFADD__(v12++, 1))
        break;
      objc_msgSend(v10, "superview");
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
    }
    while (v15);

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__UIView_SafariServicesExtras___sf_viewAncestrySummaryWithMinDepth_paddingLevel___block_invoke;
  v22[3] = &unk_1E21E2FE0;
  v25 = a4;
  v17 = v16;
  v23 = v17;
  v24 = v7;
  v18 = v7;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);
  v19 = v24;
  v20 = v17;

  return v20;
}

- (uint64_t)sf_viewAncestrySummary
{
  return objc_msgSend(a1, "_sf_viewAncestrySummaryWithMinDepth:paddingLevel:", 0, 0);
}

- (uint64_t)_sf_depth
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (!v1)
    return 0;
  v2 = v1;
  v3 = 0;
  do
  {
    ++v3;
    objc_msgSend(v2, "superview");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  while (v4);
  return v3;
}

- (id)sf_commonAncestrySummaryWithView:()SafariServicesExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = v4;
  if (!v4 || v4 == a1)
  {
    objc_msgSend(a1, "sf_viewAncestrySummary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(a1, "_sf_depth");
    v7 = objc_msgSend(v5, "_sf_depth");
    if (v6 <= v7)
      v8 = v7;
    else
      v8 = v6;
    if (v6 <= v7)
      v9 = a1;
    else
      v9 = v5;
    if (v6 <= v7)
      v10 = v5;
    else
      v10 = a1;
    if (v6 >= v7)
      v11 = v7;
    else
      v11 = v6;
    v12 = v9;
    v13 = v10;
    v14 = v13;
    if (v8 > v11)
    {
      do
      {
        v15 = v14;
        --v8;
        objc_msgSend(v14, "superview");
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (v8 > v11);
      v8 = v11;
    }
    if (v12)
      v16 = v14 == 0;
    else
      v16 = 1;
    v17 = v16;
    if (v16 || v12 == v14)
    {
      v18 = v12;
    }
    else
    {
      v18 = v12;
      do
      {
        v19 = v18;
        v20 = v14;
        --v8;
        objc_msgSend(v18, "superview");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "superview");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v18)
          v21 = v14 == 0;
        else
          v21 = 1;
        v17 = v21;
      }
      while (!v21 && v18 != v14);
    }
    v23 = (void *)MEMORY[0x1E0CB3940];
    if ((v17 & 1) != 0)
    {
      objc_msgSend(a1, "sf_viewAncestrySummary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sf_viewAncestrySummary");
    }
    else
    {
      objc_msgSend(v12, "_sf_viewAncestrySummaryWithMinDepth:paddingLevel:", v8, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_sf_viewAncestrySummaryWithMinDepth:paddingLevel:", v8 + 1, 1);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@\n%@"), v24, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (double)_sf_convertY:()SafariServicesExtras toCoordinateSpace:
{
  double v2;

  objc_msgSend(a1, "convertPoint:toCoordinateSpace:", 0.0, a2);
  return v2;
}

- (uint64_t)_sf_snapshotImageFromIOSurface
{
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "safari_snapshotImageFromIOSurfaceInRect:");
}

- (id)safari_snapshotImageFromIOSurfaceInRect:()SafariServicesExtras
{
  void *v1;
  const void *v2;
  void *v3;
  double v4;
  uint64_t v5;

  objc_msgSend(a1, "_imageFromRect:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "ioSurface"))
  {
    v2 = (const void *)UICreateCGImageFromIOSurface();
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v1, "scale");
    objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v2, objc_msgSend(v1, "imageOrientation"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    CFRelease(v2);
    v1 = (void *)v5;
  }
  return v1;
}

- (void)_sf_addEdgeMatchedSubview:()SafariServicesExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "addSubview:", v4);
  v15 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

+ (void)_sf_animateLinkImage:()SafariServicesExtras withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:
{
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  uint64_t v37;
  id v38;

  v26 = a14;
  v27 = a13;
  v28 = a12;
  v38 = a11;
  v29 = a9;
  objc_msgSend(v29, "size");
  v31 = v30;
  v33 = v32;
  v34 = floor(a2 - v30 * 0.5);
  v35 = floor(a3 - v32 * 0.5);
  v36 = objc_retainAutorelease(v29);
  v37 = objc_msgSend(v36, "CGImage");

  objc_msgSend(a1, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v37, a10, v38, v28, v27, v26, v34, v35, v31, v33, a4, a5, a6, a7);
}

+ (void)_sf_animateLinkImage:()SafariServicesExtras withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:
{
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double MidX;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat MinY;
  CGPath *Mutable;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  SFBlockBasedCAAnimationDelegate *v89;
  id v90;
  id v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat y;
  double v96;
  id aBlock;
  void *v100;
  void *v102;
  void *v103;
  void *v105;
  void *v107;
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  void *v112;
  _OWORD v113[16];
  CATransform3D v114;
  CATransform3D v115;
  CATransform3D v116;
  CATransform3D v117;
  _QWORD v118[4];
  const __CFString *v119;
  _QWORD v120[4];
  CAFrameRateRange v121;
  CAFrameRateRange v122;
  CAFrameRateRange v123;
  CAFrameRateRange v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;

  v120[1] = *MEMORY[0x1E0C80C00];
  v108 = a14;
  aBlock = a16;
  v25 = a15;
  v26 = a13;
  objc_msgSend(v26, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = a1;
  objc_msgSend(a1, "_sf_cancelLinkAnimationsOnSourceWindow:destinationWindow:", v27, v28);
  objc_msgSend(v27, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  v119 = CFSTR("sublayers");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, &v119, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActions:", v32);

  objc_msgSend(v29, "addSublayer:", v30);
  v33 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v26, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "convertRect:toLayer:", v30, a2, a3, a4, a5);
  objc_msgSend(v33, "setFrame:");

  objc_msgSend(v33, "setContents:", a11);
  objc_msgSend(v30, "addSublayer:", v33);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v25;
  v37 = _Block_copy(v25);

  objc_msgSend(v35, "setValue:forKey:", v37, CFSTR("afterImageDisappearsKey"));
  objc_msgSend(v35, "setValue:forKey:", v33, CFSTR("layer"));
  objc_msgSend(v35, "setDuration:");
  UIAnimationDragCoefficient();
  *(float *)&v39 = 1.0 / v38;
  objc_msgSend(v35, "setSpeed:", v39);
  v121 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v35, "setPreferredFrameRateRange:", *(double *)&v121.minimum, *(double *)&v121.maximum, *(double *)&v121.preferred);
  objc_msgSend(v35, "setHighFrameRateReason:", 1638403);
  objc_msgSend(v108, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  objc_msgSend(v29, "convertRect:toLayer:", v30);
  v96 = v41;
  objc_msgSend(v107, "bounds");
  objc_msgSend(v27, "convertRect:fromWindow:", v28);
  v105 = v29;
  objc_msgSend(v29, "convertRect:toLayer:", v30);
  v93 = v43;
  v94 = v42;
  v45 = v44;
  v47 = v46;
  objc_msgSend(v33, "position");
  v49 = v48;
  y = v50;
  v125.origin.x = a6;
  v125.origin.y = a7;
  v125.size.width = a8;
  v125.size.height = a9;
  MidX = CGRectGetMidX(v125);
  v126.origin.x = a6;
  v126.origin.y = a7;
  v126.size.width = a8;
  v126.size.height = a9;
  v100 = v28;
  v102 = v27;
  objc_msgSend(v27, "convertPoint:fromWindow:", v28, MidX, CGRectGetMidY(v126));
  objc_msgSend(v40, "convertPoint:toLayer:", v30);
  v53 = v52;
  v55 = v54;
  v56 = (v49 + v52) * 0.5;
  if (a12 == 1)
    v57 = v56;
  else
    v57 = v53;
  v127.origin.y = v93;
  v127.origin.x = v94;
  v127.size.width = v45;
  v127.size.height = v47;
  MinY = CGRectGetMinY(v127);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v49, y);
  CGPathAddQuadCurveToPoint(Mutable, 0, v57, MinY, v53, v55);
  CGPathAddLineToPoint(Mutable, 0, v53, v55 + 8.0);
  CGPathAddLineToPoint(Mutable, 0, v53, v55 + -2.66666667);
  CGPathAddLineToPoint(Mutable, 0, v53, v55);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setKeyTimes:", &unk_1E2245CC0);
  linkImageAnimationTimingFunctions();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTimingFunctions:", v61);

  objc_msgSend(v60, "setPath:", Mutable);
  objc_msgSend(v60, "setDuration:", 0.9);
  v122 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v60, "setPreferredFrameRateRange:", *(double *)&v122.minimum, *(double *)&v122.maximum, *(double *)&v122.preferred);
  objc_msgSend(v60, "setHighFrameRateReason:", 1638403);
  CGPathRelease(Mutable);
  v118[0] = v60;
  if (v33)
    objc_msgSend(v33, "transform");
  else
    memset(&v114, 0, sizeof(v114));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v114;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v117, "{CATransform3D=dddddddddddddddd}");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFromValue:", v63);

  v64 = (void *)MEMORY[0x1E0CB3B18];
  v115 = v114;
  CATransform3DRotate(&v116, &v115, (v53 - v49) / v96 * 0.167 * 3.14159265, 0.0, 0.0, 1.0);
  objc_msgSend(v64, "valueWithBytes:objCType:", &v116, "{CATransform3D=dddddddddddddddd}");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setToValue:", v65);

  objc_msgSend(v62, "setDuration:", 0.9);
  objc_msgSend(v62, "setAdditive:", 1);
  v123 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v62, "setPreferredFrameRateRange:", *(double *)&v123.minimum, *(double *)&v123.maximum, *(double *)&v123.preferred);
  objc_msgSend(v62, "setHighFrameRateReason:", 1638403);
  v118[1] = v62;
  objc_msgSend(v33, "bounds");
  v67 = v66;
  v69 = v68;
  objc_msgSend(v108, "bounds");
  v71 = v70;
  v73 = v72;
  if (v33)
    objc_msgSend(v33, "transform");
  else
    memset(&v113[8], 0, 128);
  v74 = v71 / v67;
  if (v71 / v67 <= v73 / v69)
    v75 = v73 / v69;
  else
    v75 = v71 / v67;
  if (v71 / v67 >= v73 / v69)
    v74 = v73 / v69;
  v76 = v74 * 1.5;
  if (v75 < v76)
    v76 = v75;
  v77 = fmin(v76, 0.75);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = *(CATransform3D *)&v113[8];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v117, "{CATransform3D=dddddddddddddddd}");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFromValue:", v79);

  v80 = (void *)MEMORY[0x1E0CB3B18];
  v115 = *(CATransform3D *)&v113[8];
  CATransform3DScale(&v116, &v115, v77, v77, 1.0);
  objc_msgSend(v80, "valueWithBytes:objCType:", &v116, "{CATransform3D=dddddddddddddddd}");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setToValue:", v81);

  objc_msgSend(v78, "setDuration:", 0.6462);
  v82 = *MEMORY[0x1E0CD3040];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setTimingFunction:", v83);

  objc_msgSend(v78, "setAdditive:", 1);
  v124 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v78, "setPreferredFrameRateRange:", *(double *)&v124.minimum, *(double *)&v124.maximum, *(double *)&v124.preferred);
  objc_msgSend(v78, "setHighFrameRateReason:", 1638403);
  v118[2] = v78;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFromValue:", &unk_1E22454D0);
  objc_msgSend(v84, "setToValue:", &unk_1E2245968);
  objc_msgSend(v84, "setDuration:", 0.1422);
  objc_msgSend(v84, "setBeginTime:", 0.504);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v82);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setTimingFunction:", v85);

  objc_msgSend(v84, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  v118[3] = v84;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAnimations:", v86);

  if (v40)
    objc_msgSend(v40, "transform");
  else
    memset(v113, 0, 128);
  getLinkAnimation(a12, v113, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = _Block_copy(aBlock);

  objc_msgSend(v87, "setValue:forKey:", v88, CFSTR("afterDestinationLayerBounces"));
  objc_msgSend(v87, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isDestinationLayerAnimation"));
  v89 = objc_alloc_init(SFBlockBasedCAAnimationDelegate);
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __157__UIView_SafariServicesExtras___sf_animateLinkImage_withAnimation_fromRect_inView_toRect_inView_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke;
  v109[3] = &unk_1E21E3030;
  v110 = v102;
  v111 = v100;
  v112 = v103;
  v90 = v100;
  v91 = v102;
  -[SFBlockBasedCAAnimationDelegate setAnimationDidStopBlock:](v89, "setAnimationDidStopBlock:", v109);
  objc_msgSend(v35, "setDelegate:", v89);
  -[SFBlockBasedCAAnimationDelegate associateLifetimeWithAnimation:](v89, "associateLifetimeWithAnimation:", v35);
  objc_msgSend(v87, "setDelegate:", v89);
  -[SFBlockBasedCAAnimationDelegate associateLifetimeWithAnimation:](v89, "associateLifetimeWithAnimation:", v87);
  objc_msgSend(v33, "addAnimation:forKey:", v35, 0);
  LODWORD(v92) = 0;
  objc_msgSend(v33, "setOpacity:", v92);
  objc_msgSend(v40, "addAnimation:forKey:", v87, CFSTR("SafariLinkAnimation"));

}

+ (void)_sf_performLinkAnimation:()SafariServicesExtras onView:
{
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[8];

  objc_msgSend(a4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationForKey:", CFSTR("SafariLinkAnimation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (v5)
      objc_msgSend(v5, "transform");
    else
      memset(v8, 0, sizeof(v8));
    getLinkAnimation(a3, v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAnimation:forKey:", v7, CFSTR("SafariLinkAnimation"));

  }
}

@end
