@implementation UIScrollView(SafariServicesExtras)

- (void)_sf_setContentInsetAdjustments:()SafariServicesExtras
{
  double v10;
  double v11;
  double v12;
  double v13;
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
  const void *v26;
  void *v27;
  uint64_t v28;
  id v29;

  objc_getAssociatedObject(a1, (const void *)_sf_setContentInsetAdjustments__lastContentInsetAdjustmentsKey);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UIEdgeInsetsValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a1, "contentInset");
  v19 = v18 + a2 - v11;
  v21 = v20 + a3 - v13;
  v23 = v22 + a4 - v15;
  v25 = v24 + a5 - v17;
  v26 = (const void *)_sf_setContentInsetAdjustments__lastContentInsetAdjustmentsKey;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", a2, a3, a4, a5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v26, v27, (void *)1);

  v28 = objc_msgSend(a1, "_isAutomaticContentOffsetAdjustmentEnabled");
  objc_msgSend(a1, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  objc_msgSend(a1, "setContentInset:", v19, v21, v23, v25);
  objc_msgSend(a1, "_setAutomaticContentOffsetAdjustmentEnabled:", v28);

}

+ (BOOL)_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:()SafariServicesExtras
{
  return a3 <= 3.0 && a1 <= 3.0;
}

- (uint64_t)_sf_setScrollIndicatorInsets:()SafariServicesExtras
{
  objc_msgSend(a1, "setHorizontalScrollIndicatorInsets:", *a3, a3[1], a3[2], a3[3]);
  return objc_msgSend(a1, "setVerticalScrollIndicatorInsets:", a3[4], a3[5], a3[6], a3[7]);
}

+ (double)_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:()SafariServicesExtras
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MinX;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v24;
  CGFloat rect;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v28;
  CGFloat v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v8 = CGRectGetWidth(v30) / 3.0;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v32 = CGRectInset(v31, v8, 0.0);
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 1, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  v9 = v33.origin.x;
  v10 = v33.origin.y;
  v11 = v33.size.width;
  v12 = v33.size.height;
  if (CGRectIsNull(v33))
    goto LABEL_4;
  v28 = v10;
  v29 = v9;
  v34.origin.x = v9;
  v34.origin.y = v10;
  rect_16 = v12;
  rect_24 = v11;
  v34.size.width = v11;
  v34.size.height = v12;
  v13 = CGRectGetMaxY(v34) + -3.0 + -2.0;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MinX = CGRectGetMinX(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, MinX, v13, CGRectGetWidth(v36), 2.0);
  v15 = v37.origin.x;
  v16 = v37.origin.y;
  v17 = v37.size.width;
  v18 = v37.size.height;
  if (CGRectIsNull(v37))
    goto LABEL_4;
  v38.origin.x = v15;
  v38.origin.y = v16;
  v38.size.width = v17;
  v38.size.height = v18;
  v39 = CGRectInset(v38, 3.0, 0.0);
  rect = v39.origin.x;
  v19 = v39.origin.y;
  v20 = v39.size.width;
  v21 = v39.size.height;
  CGRectGetMinX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  CGRectGetMinX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  CGRectGetMaxX(v41);
  v42.origin.x = rect;
  v42.origin.y = v19;
  v42.size.width = v20;
  v42.size.height = v21;
  CGRectGetMaxX(v42);
  v43.origin.x = v29;
  v43.origin.y = v28;
  v43.size.width = rect_24;
  v43.size.height = rect_16;
  CGRectGetMinY(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  CGRectGetMinY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  CGRectGetMaxY(v45);
  v46.origin.x = v29;
  v46.origin.y = v28;
  v46.size.width = rect_24;
  v46.size.height = rect_16;
  CGRectGetMaxY(v46);
  if (_SFInsetIsInvalid())
  {
LABEL_4:
    v22 = *MEMORY[0x1E0DC49E8];
  }
  else
  {
    _SFRoundEdgeInsetsToPixels();
    v22 = v24;
  }

  return v22;
}

+ (double)_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:()SafariServicesExtras
{
  id v3;
  char v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MinX;
  double v19;
  double v20;
  double MinY;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat rect;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = a3;
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");
  objc_msgSend(v3, "bounds");
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  v9 = CGRectGetHeight(v37) / 3.0;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v39 = CGRectInset(v38, 0.0, v9);
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
  v10 = v40.origin.x;
  v11 = v40.origin.y;
  v12 = v40.size.width;
  v13 = v40.size.height;
  if (CGRectIsNull(v40))
    goto LABEL_7;
  v35 = v11;
  v36 = v10;
  v33 = v13;
  v34 = v12;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  if ((v4 & 1) != 0)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v14);
    v19 = 3.0;
  }
  else
  {
    MinX = CGRectGetMaxX(*(CGRect *)&v14) + -3.0;
    v19 = -2.0;
  }
  v20 = MinX + v19;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MinY = CGRectGetMinY(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 1, v20, MinY, 2.0, CGRectGetHeight(v42));
  v22 = v43.origin.x;
  v23 = v43.origin.y;
  v24 = v43.size.width;
  v25 = v43.size.height;
  if (CGRectIsNull(v43))
    goto LABEL_7;
  v44.origin.x = v22;
  v44.origin.y = v23;
  v44.size.width = v24;
  v44.size.height = v25;
  v45 = CGRectInset(v44, 0.0, 3.0);
  v30 = v45.origin.y;
  v31 = v45.origin.x;
  v29 = v45.size.width;
  rect = v45.size.height;
  v45.origin.x = v36;
  v45.origin.y = v35;
  v45.size.width = v34;
  v45.size.height = v33;
  CGRectGetMinX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  CGRectGetMinX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  CGRectGetMaxX(v47);
  v48.origin.x = v36;
  v48.origin.y = v35;
  v48.size.width = v34;
  v48.size.height = v33;
  CGRectGetMaxX(v48);
  v49.origin.x = v31;
  v49.origin.y = v30;
  v49.size.width = v29;
  v49.size.height = rect;
  CGRectGetMinY(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  CGRectGetMinY(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  CGRectGetMaxY(v51);
  v52.origin.x = v31;
  v52.origin.y = v30;
  v52.size.width = v29;
  v52.size.height = rect;
  CGRectGetMaxY(v52);
  if (_SFInsetIsInvalid())
  {
LABEL_7:
    v26 = *MEMORY[0x1E0DC49E8];
  }
  else
  {
    _SFRoundEdgeInsetsToPixels();
    v26 = v28;
  }

  return v26;
}

- (BOOL)_sf_isScrolledToOrPastBottom
{
  double MaxY;
  double v3;
  double v4;
  double v5;
  CGRect v7;

  objc_msgSend(a1, "bounds");
  MaxY = CGRectGetMaxY(v7);
  objc_msgSend(a1, "contentSize");
  v4 = v3;
  objc_msgSend(a1, "contentInset");
  return MaxY >= v4 + v5;
}

- (BOOL)_sf_isScrolledPastTop
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "contentOffset");
  v3 = -v2;
  objc_msgSend(a1, "contentInset");
  return v4 < v3;
}

- (uint64_t)_sf_scrollIndicatorInsets
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(a1, "horizontalScrollIndicatorInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  result = objc_msgSend(a1, "verticalScrollIndicatorInsets");
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v9;
  a2[3] = v11;
  a2[4] = v13;
  a2[5] = v14;
  a2[6] = v15;
  a2[7] = v16;
  return result;
}

+ (BOOL)_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:()SafariServicesExtras
{
  return a4 <= 3.0 && a2 <= 3.0;
}

@end
