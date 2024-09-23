@implementation UIView

- (double)_nui_compactAlignmentInsets
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "alignmentRectInsets");
  v3 = v2;
  objc_msgSend(a1, "effectiveBaselineOffsetFromBottom");
  if (objc_msgSend(a1, "_hasFontInfoForVerticalBaselineSpacing"))
  {
    v4 = objc_msgSend(a1, "_fontInfoForBaselineSpacing");
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(a1, "effectiveFirstBaselineOffsetFromTop");
      if (v6 != 0.0)
      {
        v7 = v6;
        objc_msgSend(v5, "capHeight");
        v9 = v8;
        objc_msgSend(a1, "_currentScreenScale");
        v11 = v10 == 1.0;
        v12 = round(v9 * v10) / v10;
        v13 = round(v9);
        if (v11)
          v12 = v13;
        return v7 - v12;
      }
    }
  }
  return v3;
}

- (objc_object)containerViewInfoCreateIfNeeded:(objc_object *)a1
{
  if (a1)
    return (objc_object *)_NUIContainerViewInfoCreateIfNeeded(a1, a2);
  return a1;
}

- (nui_size_cache)contentLayoutSizeCache
{
  if (result)
    return &_NUIContainerViewInfoCreateIfNeeded((objc_object *)result, 1)->_sizeCache;
  return result;
}

- (double)effectiveMinimumLayoutContentSize
{
  _NUIViewContainerViewInfo *IfNeeded;
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  double result;

  if (!a1)
    return 0.0;
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  -[objc_object effectiveAlignmentRectInsets](a1, "effectiveAlignmentRectInsets");
  v4 = v3;
  v6 = v5;
  width = IfNeeded->_minSize.width;
  height = IfNeeded->_minSize.height;
  if (NUIContainerViewLengthIsDefault(width))
    width = 0.0;
  NUIContainerViewLengthIsDefault(height);
  result = *MEMORY[0x1E0C9D820];
  if (*MEMORY[0x1E0C9D820] <= width - (v4 + v6))
    return width - (v4 + v6);
  return result;
}

- (double)effectiveMaximumLayoutContentSize
{
  _NUIViewContainerViewInfo *IfNeeded;
  double v3;
  double v4;
  double v5;
  double result;

  if (!a1)
    return 0.0;
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  -[objc_object effectiveAlignmentRectInsets](a1, "effectiveAlignmentRectInsets");
  v5 = IfNeeded->_maxSize.width - (v3 + v4);
  result = *MEMORY[0x1E0C9D820];
  if (*MEMORY[0x1E0C9D820] <= v5)
    return v5;
  return result;
}

@end
