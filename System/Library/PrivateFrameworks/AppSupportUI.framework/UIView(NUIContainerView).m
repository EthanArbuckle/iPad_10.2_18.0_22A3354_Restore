@implementation UIView(NUIContainerView)

- (uint64_t)setUntransformedFrame:()NUIContainerView
{
  void *v10;
  void *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double MinX;
  double v18;
  double MinY;
  CATransform3D v20[2];
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v10 = (void *)objc_msgSend(a1, "layer");
  v11 = v10;
  memset(&v20[1], 0, sizeof(CATransform3D));
  if (v10)
    objc_msgSend(v10, "transform");
  v20[0] = v20[1];
  if (CATransform3DIsIdentity(v20))
    return objc_msgSend(a1, "setFrame:", a2, a3, a4, a5);
  objc_msgSend(v11, "anchorPoint");
  v14 = v13;
  v16 = v15;
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  v18 = MinX + CGRectGetWidth(v22) * v14;
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  MinY = CGRectGetMinY(v23);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  objc_msgSend(a1, "setCenter:", v18, MinY + CGRectGetHeight(v24) * v16);
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "setBounds:");
}

- (uint64_t)invalidatingIntrinsicContentSizeAlsoInvalidatesSuperview
{
  return (*(_BYTE *)&_NUIContainerViewInfoCreateIfNeeded(a1, 0)->_flags >> 2) & 1;
}

- (uint64_t)setLayoutSize:()NUIContainerView withContentPriority:
{
  LODWORD(a6) = LODWORD(a5);
  return objc_msgSend(a1, "setLayoutSize:withHorizontalContentPriority:verticalContentPriority:", a3, a4, a5, a6);
}

- (CGFloat)effectiveLayoutSizeFittingSize:()NUIContainerView
{
  _NUIViewContainerViewInfo *IfNeeded;
  char flags;
  nui_size_cache *p_sizeCache;
  char v9;
  char v10;
  double width;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  char v24;
  CGSize v26;
  CGSize v27;
  CGSize v28;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  flags = (char)IfNeeded->_flags;
  p_sizeCache = &IfNeeded->_sizeCache;
  v26 = (CGSize)*MEMORY[0x1E0C9D820];
  v9 = flags;
  if ((flags & 1) == 0)
  {
    v10 = -[objc_object isLayoutSizeDependentOnPerpendicularAxis](a1, "isLayoutSizeDependentOnPerpendicularAxis");
    v27.width = a2;
    v27.height = a3;
    if ((nui_size_cache::find_size(p_sizeCache, v27, v10, &v26) & 1) != 0)
      return v26.width;
    v9 = (char)IfNeeded->_flags;
  }
  width = IfNeeded->_maxSize.width;
  height = IfNeeded->_maxSize.height;
  v14 = IfNeeded->_minSize.width;
  v13 = IfNeeded->_minSize.height;
  v15 = 1.79769313e308;
  if (a2 == 0.0)
    v16 = 1.79769313e308;
  else
    v16 = a2;
  if (width >= v16)
    v17 = v16;
  else
    v17 = IfNeeded->_maxSize.width;
  if (a3 != 0.0)
    v15 = a3;
  if (height >= v15)
    v18 = v15;
  else
    v18 = IfNeeded->_maxSize.height;
  *(_BYTE *)&IfNeeded->_flags = v9 | 2;
  if (v14 != width || v13 != height)
  {
    -[objc_object calculateLayoutSizeFittingSize:](a1, "calculateLayoutSizeFittingSize:", v17, v18);
    if (v20 > v14)
      v14 = v20;
    if (v21 > v13)
      v13 = v21;
  }
  if (v17 >= v14)
    v22 = v14;
  else
    v22 = v17;
  if (v18 >= v13)
    v23 = v13;
  else
    v23 = v18;
  v26.width = v22;
  v26.height = v23;
  v24 = (char)IfNeeded->_flags;
  if ((flags & 1) == 0 && (*(_BYTE *)&IfNeeded->_flags & 2) != 0)
  {
    v28.width = a2;
    v28.height = a3;
    nui_size_cache::insert_size(p_sizeCache, v28, *(CGSize *)&v22);
    v24 = (char)IfNeeded->_flags;
  }
  *(_BYTE *)&IfNeeded->_flags = v24 & 0xFD;
  return v26.width;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  _NUIViewContainerViewInfo *IfNeeded;
  double baseLineFromTop;
  uint64_t v4;
  objc_object *v5;
  double result;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  baseLineFromTop = IfNeeded->_baselines.baseLineFromTop;
  if (NUIContainerViewLengthIsDefault(baseLineFromTop))
  {
    v4 = -[objc_object _nui_baselineViewType](a1, "_nui_baselineViewType");
    if (v4 == 1)
    {
      v5 = (objc_object *)-[objc_object viewForFirstBaselineLayout](a1, "viewForFirstBaselineLayout");
      if (v5 && v5 != a1)
      {
        -[objc_object effectiveFirstBaselineOffsetFromTop](v5, "effectiveFirstBaselineOffsetFromTop");
        return result;
      }
      -[objc_object _currentScreenScale](a1, "_currentScreenScale");
      v9 = v14;
    }
    else
    {
      v7 = v4;
      -[objc_object _currentScreenScale](a1, "_currentScreenScale");
      v9 = v8;
      if (!v7)
      {
        -[objc_object effectiveLayoutSizeFittingSize:](a1, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        -[objc_object _baselineOffsetsAtSize:](a1, "_baselineOffsetsAtSize:");
        v11 = v10;
        -[objc_object alignmentRectInsets](a1, "alignmentRectInsets");
        v13 = v11 + v12;
LABEL_12:
        v18 = round(v9 * v13) / v9;
        v19 = round(v13);
        if (v9 == 1.0)
          baseLineFromTop = v19;
        else
          baseLineFromTop = v18;
        IfNeeded->_baselines.baseLineFromTop = baseLineFromTop;
        return baseLineFromTop;
      }
    }
    v13 = 0.0;
    if (-[objc_object _hasFontInfoForVerticalBaselineSpacing](a1, "_hasFontInfoForVerticalBaselineSpacing"))
    {
      v15 = (void *)-[objc_object _fontInfoForBaselineSpacing](a1, "_fontInfoForBaselineSpacing");
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v15, "ascender");
        v13 = v17;
        objc_msgSend(v16, "descender");
      }
    }
    goto LABEL_12;
  }
  return baseLineFromTop;
}

- (double)effectiveBaselineOffsetFromBottom
{
  _NUIViewContainerViewInfo *IfNeeded;
  double baseLineFromBottom;
  uint64_t v4;
  objc_object *v5;
  double result;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  baseLineFromBottom = IfNeeded->_baselines.baseLineFromBottom;
  if (NUIContainerViewLengthIsDefault(baseLineFromBottom))
  {
    v4 = -[objc_object _nui_baselineViewType](a1, "_nui_baselineViewType");
    if (v4 == 1)
    {
      v5 = (objc_object *)-[objc_object viewForLastBaselineLayout](a1, "viewForLastBaselineLayout");
      if (v5 && v5 != a1)
      {
        -[objc_object effectiveBaselineOffsetFromBottom](v5, "effectiveBaselineOffsetFromBottom");
        return result;
      }
      -[objc_object _currentScreenScale](a1, "_currentScreenScale");
      v9 = v18;
    }
    else
    {
      v7 = v4;
      -[objc_object _currentScreenScale](a1, "_currentScreenScale");
      v9 = v8;
      if (!v7)
      {
        -[objc_object effectiveLayoutSizeFittingSize:](a1, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        -[objc_object _baselineOffsetsAtSize:](a1, "_baselineOffsetsAtSize:");
        v11 = v10;
        v13 = v12;
        -[objc_object alignmentRectInsets](a1, "alignmentRectInsets");
        v15 = v11 + v14;
        v17 = v13 + v16;
LABEL_13:
        v23 = ceil(v9 * (v17 - (round(v9 * v15) / v9 - v15))) / v9;
        v24 = ceil(v17 - (round(v15) - v15));
        if (v9 == 1.0)
          baseLineFromBottom = v24;
        else
          baseLineFromBottom = v23;
        IfNeeded->_baselines.baseLineFromBottom = baseLineFromBottom;
        return baseLineFromBottom;
      }
    }
    v15 = 0.0;
    if (-[objc_object _hasFontInfoForVerticalBaselineSpacing](a1, "_hasFontInfoForVerticalBaselineSpacing")&& (v19 = (void *)-[objc_object _fontInfoForBaselineSpacing](a1, "_fontInfoForBaselineSpacing")) != 0)
    {
      v20 = v19;
      objc_msgSend(v19, "ascender");
      v15 = v21;
      objc_msgSend(v20, "descender");
      v17 = -v22;
    }
    else
    {
      v17 = 0.0;
    }
    goto LABEL_13;
  }
  return baseLineFromBottom;
}

- (_NUIViewContainerViewInfo)setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:()NUIContainerView
{
  _NUIViewContainerViewInfo *result;
  char v5;

  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  if (a3)
    v5 = 4;
  else
    v5 = 0;
  *(_BYTE *)&result->_flags = *(_BYTE *)&result->_flags & 0xFB | v5;
  return result;
}

- (CGFloat)minimumLayoutSize
{
  return _NUIContainerViewInfoCreateIfNeeded(a1, 0)->_minSize.width;
}

- (uint64_t)setLayoutSize:()NUIContainerView withHorizontalContentPriority:verticalContentPriority:
{
  uint64_t result;
  double v9;
  uint64_t v10;
  char v11;
  char v12;
  float v13;
  double v14;
  uint64_t v15;

  objc_msgSend(a1, "setMinimumLayoutSize:", __PAIR64__(LODWORD(a5), LODWORD(a4)), *MEMORY[0x1E0C80C00]);
  result = objc_msgSend(a1, "setMaximumLayoutSize:", a2, a3);
  v10 = 0;
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = *((float *)&v15 + v10);
    if (v13 > -1.0)
    {
      LODWORD(v9) = *((_DWORD *)&v15 + v10);
      objc_msgSend(a1, "setContentHuggingPriority:forAxis:", v10, v9);
      *(float *)&v14 = v13;
      result = objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:", v10, v14);
    }
    v11 = 0;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  return result;
}

- (_NUIViewContainerViewInfo)setMinimumLayoutSize:()NUIContainerView
{
  double v4;
  _NUIViewContainerViewInfo *result;

  v4 = a2;
  if (NUIContainerViewLengthIsDefault(a2))
    v4 = 0.0;
  if (NUIContainerViewLengthIsDefault(a3))
    a3 = 0.0;
  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  if (result->_minSize.width != v4 || result->_minSize.height != a3)
  {
    result->_minSize.width = v4;
    result->_minSize.height = a3;
    return (_NUIViewContainerViewInfo *)-[objc_object invalidateIntrinsicContentSize](a1, "invalidateIntrinsicContentSize");
  }
  return result;
}

- (_NUIViewContainerViewInfo)setMaximumLayoutSize:()NUIContainerView
{
  double v4;
  _NUIViewContainerViewInfo *result;

  v4 = a2;
  if (NUIContainerViewLengthIsDefault(a2))
    v4 = 10000.0;
  if (NUIContainerViewLengthIsDefault(a3))
    a3 = 10000.0;
  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  if (result->_maxSize.width != v4 || result->_maxSize.height != a3)
  {
    result->_maxSize.width = v4;
    result->_maxSize.height = a3;
    return (_NUIViewContainerViewInfo *)-[objc_object invalidateIntrinsicContentSize](a1, "invalidateIntrinsicContentSize");
  }
  return result;
}

- (_NUIViewContainerViewInfo)setCustomFirstBaselineOffsetFromTop:()NUIContainerView
{
  _NUIViewContainerViewInfo *result;
  char flags;

  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  flags = (char)result->_flags;
  if (result->_baselines.baseLineFromTop != a2 || (flags & 0x10) == 0)
  {
    result->_baselines.baseLineFromTop = a2;
    *(_BYTE *)&result->_flags = flags | 0x10;
    return (_NUIViewContainerViewInfo *)-[objc_object invalidateIntrinsicContentSize](a1, "invalidateIntrinsicContentSize");
  }
  return result;
}

- (CGFloat)customAlignmentRectInsets
{
  return _NUIContainerViewInfoCreateIfNeeded(a1, 0)->_alignmentInsets.top;
}

- (_NUIViewContainerViewInfo)setCustomAlignmentRectInsets:()NUIContainerView
{
  _NUIViewContainerViewInfo *result;
  double top;

  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  top = result->_alignmentInsets.top;
  if (result->_alignmentInsets.left != a3
    || top != a2
    || result->_alignmentInsets.right != a5
    || result->_alignmentInsets.bottom != a4)
  {
    result->_alignmentInsets.top = a2;
    result->_alignmentInsets.left = a3;
    result->_alignmentInsets.bottom = a4;
    result->_alignmentInsets.right = a5;
    *(_BYTE *)&result->_flags &= ~8u;
    return (_NUIViewContainerViewInfo *)-[objc_object invalidateIntrinsicContentSize](a1, "invalidateIntrinsicContentSize", top);
  }
  return result;
}

- (_NUIViewContainerViewInfo)setNeverCacheEffectiveLayoutSize:()NUIContainerView
{
  _NUIViewContainerViewInfo *result;

  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  *(_BYTE *)&result->_flags = *(_BYTE *)&result->_flags & 0xFE | a3;
  return result;
}

- (uint64_t)neverCacheEffectiveLayoutSize
{
  return *(_BYTE *)&_NUIContainerViewInfoCreateIfNeeded(a1, 0)->_flags & 1;
}

- (CGFloat)maximumLayoutSize
{
  return _NUIContainerViewInfoCreateIfNeeded(a1, 0)->_maxSize.width;
}

- (_NUIViewContainerViewInfo)setCustomBaselineOffsetFromBottom:()NUIContainerView
{
  _NUIViewContainerViewInfo *result;
  char flags;

  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  flags = (char)result->_flags;
  if (result->_baselines.baseLineFromBottom != a2 || (flags & 0x10) == 0)
  {
    result->_baselines.baseLineFromBottom = a2;
    *(_BYTE *)&result->_flags = flags | 0x20;
    return (_NUIViewContainerViewInfo *)-[objc_object invalidateIntrinsicContentSize](a1, "invalidateIntrinsicContentSize");
  }
  return result;
}

- (double)customBaselineOffsetFromBottom
{
  _NUIViewContainerViewInfo *IfNeeded;
  uint64_t *p_baseLineFromBottom;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if ((*(_BYTE *)&IfNeeded->_flags & 0x20) != 0)
    p_baseLineFromBottom = (uint64_t *)&IfNeeded->_baselines.baseLineFromBottom;
  else
    p_baseLineFromBottom = &NUIContainerViewLengthUseDefault;
  return *(double *)p_baseLineFromBottom;
}

- (double)customFirstBaselineOffsetFromTop
{
  _NUIViewContainerViewInfo *IfNeeded;
  uint64_t *p_baselines;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if ((*(_BYTE *)&IfNeeded->_flags & 0x10) != 0)
    p_baselines = (uint64_t *)&IfNeeded->_baselines;
  else
    p_baselines = &NUIContainerViewLengthUseDefault;
  return *(double *)p_baselines;
}

@end
