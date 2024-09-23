@implementation UIView(NUIPrivate)

- (double)calculateLayoutSizeFittingSize:()NUIPrivate
{
  _NUIViewContainerViewInfo *IfNeeded;
  _NUIViewContainerViewInfo *v7;
  double width;
  uint64_t v9;
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
  uint64_t v21;
  int has_internal_diagnostics;
  NSObject *v23;
  NSObject *v24;
  double v25;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if (IfNeeded->_minSize.width == IfNeeded->_maxSize.width
    && (v7 = IfNeeded, -[objc_object canUseFastLayoutSizeCalulation](a1, "canUseFastLayoutSizeCalulation")))
  {
    width = v7->_minSize.width;
    objc_msgSend((id)-[objc_object _fontInfoForBaselineSpacing](a1, "_fontInfoForBaselineSpacing"), "lineHeight");
    -[objc_object _currentScreenScale](a1, "_currentScreenScale");
  }
  else
  {
    if (!-[objc_object _wantsAutolayout](a1, "_wantsAutolayout"))
      goto LABEL_8;
    if (_NUIViewIsSwiftUISPICompatible(UIView *)::onceToken != -1)
      dispatch_once(&_NUIViewIsSwiftUISPICompatible(UIView *)::onceToken, &__block_literal_global_99);
    v9 = -[objc_object methodForSelector:](a1, "methodForSelector:", sel__layoutSizeThatFits_fixedAxes_);
    if (v9 == _NUIViewIsSwiftUISPICompatible(UIView *)::baseLayoutSizeImp)
    {
      if ((objc_msgSend((id)_NUIViewIsSwiftUISPICompatible(UIView *)::checkedSet, "containsObject:", a1) & 1) == 0)
      {
        v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Arranged subview %@ wants autolayout. It must be wrapped in a _UIConstraintBasedLayoutHostingView or override _layoutSizeThatFits:fixedAxes:."), a1);
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v23 = _NUILog();
        v24 = v23;
        if (has_internal_diagnostics)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:].cold.1(v21, v24);
        }
        else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:].cold.2(v21, v24);
        }
        objc_msgSend((id)_NUIViewIsSwiftUISPICompatible(UIView *)::checkedSet, "addObject:", a1);
      }
      -[objc_object systemLayoutSizeFittingSize:](a1, "systemLayoutSizeFittingSize:", a2, a3);
      return v25;
    }
    else
    {
LABEL_8:
      -[objc_object alignmentRectInsets](a1, "alignmentRectInsets");
      v14 = v12 + v13;
      v15 = a2 - (v12 + v13);
      if (v15 >= 0.0)
        v16 = v15;
      else
        v16 = 0.0;
      v17 = a3 - (v10 + v11);
      if (v17 >= 0.0)
        v18 = v17;
      else
        v18 = 0.0;
      -[objc_object _layoutSizeThatFits:fixedAxes:](a1, "_layoutSizeThatFits:fixedAxes:", 0, v16, v18);
      return v19 + v14;
    }
  }
  return width;
}

- (id)debugSizeCacheDict
{
  void *v2;
  _NUIViewContainerViewInfo *IfNeeded;
  double *begin;
  double *i;
  double v6;
  double v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  begin = (double *)IfNeeded->_sizeCache.__begin_;
  for (i = (double *)IfNeeded->_sizeCache.__end_; begin != i; begin += 4)
  {
    v6 = *begin;
    v7 = begin[1];
    v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", begin[2], begin[3]);
    objc_msgSend(v2, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v6, v7));
  }
  return (id)objc_msgSend(v2, "copy");
}

- (uint64_t)debugSizeCache
{
  void *v2;
  objc_class *v3;
  void *v4;
  _NUIViewContainerViewInfo *IfNeeded;
  CGSize *begin;
  CGSize *i;
  CGFloat width;
  CGFloat height;
  NSString *v10;
  CGSize v12;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %p size cache:\n"), NSStringFromClass(v3), a1);
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  begin = (CGSize *)IfNeeded->_sizeCache.__begin_;
  for (i = (CGSize *)IfNeeded->_sizeCache.__end_; begin != i; begin += 2)
  {
    width = begin[1].width;
    height = begin[1].height;
    v10 = NSStringFromCGSize(*begin);
    v12.width = width;
    v12.height = height;
    objc_msgSend(v4, "appendFormat:", CFSTR("\t%@ : %@\n"), v10, NSStringFromCGSize(v12));
  }
  return objc_msgSend(v4, "stringByAppendingString:", CFSTR(">"));
}

- (uint64_t)canUseFastLayoutSizeCalulation
{
  return 0;
}

- (void)calculateLayoutSizeFittingSize:()NUIPrivate .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AA816000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)calculateLayoutSizeFittingSize:()NUIPrivate .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA816000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end
