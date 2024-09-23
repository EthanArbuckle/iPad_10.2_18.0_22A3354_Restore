@implementation CAMSmartStylePreviewGridView

- (CAMSmartStylePreviewGridView)initWithLayout:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CAMSmartStylePreviewGridView *v8;
  CAMSmartStylePreviewGridView *v9;
  unint64_t v10;
  void *i;
  CAMSmartStylePreviewView *v12;
  void *v13;
  CAMSmartStylePreviewGridView *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CAMSmartStylePreviewGridView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[CAMSmartStylePreviewGridView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[CAMSmartStylePreviewGridView setClipsToBounds:](v8, "setClipsToBounds:", 1);
    v9->_layout = a3;
    v9->_expandedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10 = +[CAMSmartStylePreviewGridView gridItemCountForLayout:](CAMSmartStylePreviewGridView, "gridItemCountForLayout:", a3);
    for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10); v10; --v10)
    {
      v12 = -[CAMSmartStylePreviewView initWithFrame:]([CAMSmartStylePreviewView alloc], "initWithFrame:", v4, v5, v6, v7);
      -[CAMSmartStylePreviewView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
      -[CAMSmartStylePreviewGridView addSubview:](v9, "addSubview:", v12);
      objc_msgSend(i, "addObject:", v12);

    }
    objc_storeStrong((id *)&v9->__previewViews, i);
    if (-[CAMSmartStylePreviewGridView _allowsExpandOnTap](v9, "_allowsExpandOnTap"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v9, sel_handleTap_);
      -[CAMSmartStylePreviewGridView addGestureRecognizer:](v9, "addGestureRecognizer:", v13);

    }
    v14 = v9;

  }
  return v9;
}

- (BOOL)_allowsExpandOnTap
{
  return -[CAMSmartStylePreviewGridView layout](self, "layout") - 1 < 2;
}

- (void)setLogIdentifier:(id)a3
{
  NSString *v5;
  NSString *logIdentifier;
  BOOL v7;
  void *v8;
  NSString *v9;
  _QWORD v10[5];

  v5 = (NSString *)a3;
  logIdentifier = self->_logIdentifier;
  if (logIdentifier != v5)
  {
    v9 = v5;
    v7 = -[NSString isEqualToString:](logIdentifier, "isEqualToString:", v5);
    v5 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_logIdentifier, a3);
      -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__CAMSmartStylePreviewGridView_setLogIdentifier___block_invoke;
      v10[3] = &unk_1EA32B100;
      v10[4] = self;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

      v5 = v9;
    }
  }

}

void __49__CAMSmartStylePreviewGridView_setLogIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "logIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/cell=%lu"), v8, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLogIdentifier:", v7);

}

- (unint64_t)gridItemCount
{
  return +[CAMSmartStylePreviewGridView gridItemCountForLayout:](CAMSmartStylePreviewGridView, "gridItemCountForLayout:", -[CAMSmartStylePreviewGridView layout](self, "layout"));
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSmartStylePreviewGridView;
  -[CAMSmartStylePreviewGridView layoutSubviews](&v5, sel_layoutSubviews);
  -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CAMSmartStylePreviewGridView_layoutSubviews__block_invoke;
  v4[3] = &unk_1EA32B100;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __46__CAMSmartStylePreviewGridView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v5 = a2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "_subviewGeometryForIndex:", a3);
  v7[2] = v10;
  v7[3] = v11;
  v7[4] = v12;
  v7[5] = v13;
  v7[0] = v8;
  v7[1] = v9;
  CAMViewSetGeometry(v5, (uint64_t)v7);

}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_subviewGeometryForIndex:(SEL)a3
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
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
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double MidY;
  __int128 v30;
  CGFloat v31;
  double MidX;
  CGFloat rect;
  CGFloat rect_8;
  double rect_16;
  double rect_24;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[CAMSmartStylePreviewGridView _subviewFrameForIndex:](self, "_subviewFrameForIndex:", a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  result = -[CAMSmartStylePreviewGridView expandedItemIndex](self, "expandedItemIndex", CAMViewGeometryForFrame((uint64_t)retstr, v10, v12).n128_f64[0]);
  if (result != ($3B1716E7537CC2F16D6737AAC3CCCADB *)0x7FFFFFFFFFFFFFFFLL)
  {
    -[CAMSmartStylePreviewGridView bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    UIRectGetCenter();
    rect_16 = v19;
    rect_24 = v20;
    result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)-[CAMSmartStylePreviewGridView _subviewFrameForIndex:](self, "_subviewFrameForIndex:", -[CAMSmartStylePreviewGridView expandedItemIndex](self, "expandedItemIndex"));
    if (v23 > 0.0)
    {
      v25 = v24;
      if (v24 > 0.0)
      {
        v26 = v23;
        v27 = v16 / v23;
        rect = v21;
        rect_8 = v18 / v24;
        v28 = v21;
        v38.origin.x = v7;
        v31 = v22;
        v38.origin.y = v9;
        v38.size.width = v11;
        v38.size.height = v13;
        MidX = CGRectGetMidX(v38);
        v39.origin.x = v28;
        v39.origin.y = v31;
        v39.size.width = v26;
        v39.size.height = v25;
        retstr->var1.x = rect_16 + (MidX - CGRectGetMidX(v39)) * v27;
        v40.origin.x = v7;
        v40.origin.y = v9;
        v40.size.width = v11;
        v40.size.height = v13;
        MidY = CGRectGetMidY(v40);
        v41.origin.x = rect;
        v41.origin.y = v31;
        v41.size.width = v26;
        v41.size.height = v25;
        retstr->var1.y = rect_24 + (MidY - CGRectGetMidY(v41)) * rect_8;
        result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformMakeScale(&v37, v27, rect_8);
        v30 = *(_OWORD *)&v37.c;
        *(_OWORD *)&retstr->var2.a = *(_OWORD *)&v37.a;
        *(_OWORD *)&retstr->var2.c = v30;
        *(_OWORD *)&retstr->var2.tx = *(_OWORD *)&v37.tx;
      }
    }
  }
  return result;
}

- (CGRect)_subviewFrameForIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  double v7;
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
  CGRect result;

  v5 = -[CAMSmartStylePreviewGridView layout](self, "layout");
  switch(v5)
  {
    case 2uLL:
      -[CAMSmartStylePreviewGridView _subviewFrame1Big5SmallForIndex:](self, "_subviewFrame1Big5SmallForIndex:", a3);
      break;
    case 1uLL:
      -[CAMSmartStylePreviewGridView _subviewFrame2x2ForIndex:](self, "_subviewFrame2x2ForIndex:", a3);
      break;
    case 0uLL:
      -[CAMSmartStylePreviewGridView bounds](self, "bounds");
      break;
  }
  -[CAMSmartStylePreviewGridView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  UIRectIntegralWithScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_subviewFrame2x2ForIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[CAMSmartStylePreviewGridView bounds](self, "bounds");
  v5 = v4 * 0.5;
  v7 = v6 * 0.5;
  v8 = v5 * (double)(a3 & 1);
  v9 = v7 * (double)(a3 >> 1);
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_subviewFrame1Big5SmallForIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[CAMSmartStylePreviewGridView bounds](self, "bounds");
  v5 = v4 / 3.0;
  v7 = v6 / 3.0;
  v8 = 0.0;
  v9 = 0.0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      v9 = v5 + v5;
      goto LABEL_7;
    case 2uLL:
      v9 = v5 + v5;
      v8 = v7;
      goto LABEL_7;
    case 3uLL:
      goto LABEL_6;
    case 4uLL:
      v9 = v5;
      goto LABEL_6;
    default:
      v9 = v5 + v5;
LABEL_6:
      v8 = v7 + v7;
LABEL_7:
      if (!a3)
      {
        v7 = v7 + v7;
        v5 = v5 + v5;
      }
      result.size.height = v7;
      result.size.width = v5;
      result.origin.y = v8;
      result.origin.x = v9;
      return result;
  }
}

+ (unint64_t)gridItemCountForLayout:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_1DB9A54D8[a3];
}

- (void)setExpandedItemIndex:(unint64_t)a3
{
  -[CAMSmartStylePreviewGridView setExpandedItemIndex:animated:](self, "setExpandedItemIndex:animated:", a3, 0);
}

- (void)setExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v5;
  void *v7;
  unint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (self->_expandedItemIndex != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 < v5)
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (v4)
    {
      -[CAMSmartStylePreviewGridView layoutIfNeeded](self, "layoutIfNeeded");
      self->_expandedItemIndex = v5;
      -[CAMSmartStylePreviewGridView setNeedsLayout](self, "setNeedsLayout");
      -[CAMSmartStylePreviewGridView _setExpansionAnimationCount:](self, "_setExpansionAnimationCount:", -[CAMSmartStylePreviewGridView _expansionAnimationCount](self, "_expansionAnimationCount") + 1);
      v9[4] = self;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke;
      v10[3] = &unk_1EA328868;
      v10[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke_2;
      v9[3] = &unk_1EA328A68;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v9, 0.35);
    }
    else
    {
      self->_expandedItemIndex = v5;
      -[CAMSmartStylePreviewGridView setNeedsLayout](self, "setNeedsLayout");
    }
    -[CAMSmartStylePreviewGridView _updateStyleOnPreviewViews](self, "_updateStyleOnPreviewViews");
  }
}

uint64_t __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

uint64_t __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setExpansionAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCount") - 1);
}

- (void)_setExpansionAnimationCount:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;

  if (self->__expansionAnimationCount != a3)
  {
    v5 = -[CAMSmartStylePreviewGridView isAnimatingGrid](self, "isAnimatingGrid");
    self->__expansionAnimationCount = a3;
    v6 = -[CAMSmartStylePreviewGridView isAnimatingGrid](self, "isAnimatingGrid");
    if (v5 != v6)
    {
      v7 = v6;
      -[CAMSmartStylePreviewGridView delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "smartStylePreviewGridView:didChangeAnimatingGrid:", self, v7);

    }
  }
}

- (BOOL)isAnimatingGrid
{
  return -[CAMSmartStylePreviewGridView _expansionAnimationCount](self, "_expansionAnimationCount") > 0;
}

- (void)updateGridIndex:(unint64_t)a3 withResourceLoadResult:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a4;
  -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v11 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMSmartStylePreviewGridView updateGridIndex:withResourceLoadResult:].cold.1(a3, v11);

  }
  else
  {
    -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setResourceLoadResult:", v6);
  }

}

- (void)setStyle:(id)a3
{
  CEKSmartStyle *v5;
  CEKSmartStyle *style;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  CEKSmartStyle *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (CEKSmartStyle *)a3;
  style = self->_style;
  if (style != v5 && (-[CEKSmartStyle isEqualToSmartStyle:](style, "isEqualToSmartStyle:", v5) & 1) == 0)
  {
    v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStylePreviewGridView logIdentifier](self, "logIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: setting style %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_storeStrong((id *)&self->_style, a3);
    -[CAMSmartStylePreviewGridView _updateStyleOnPreviewViews](self, "_updateStyleOnPreviewViews");
  }

}

- (void)_updateStyleOnPreviewViews
{
  unint64_t v3;
  void *v4;
  _QWORD v5[6];

  v3 = -[CAMSmartStylePreviewGridView expandedItemIndex](self, "expandedItemIndex");
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CAMSmartStylePreviewGridView__updateStyleOnPreviewViews__block_invoke;
  v5[3] = &unk_1EA32B128;
  v5[4] = self;
  v5[5] = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  objc_msgSend(MEMORY[0x1E0D52290], "commit");
}

void __58__CAMSmartStylePreviewGridView__updateStyleOnPreviewViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 == a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "style");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStyle:", v7);

  }
}

- (void)handleTap:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  v4 = a3;
  if (-[CAMSmartStylePreviewGridView _allowsExpandOnTap](self, "_allowsExpandOnTap"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = -[CAMSmartStylePreviewGridView expandedItemIndex](self, "expandedItemIndex");
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    -[CAMSmartStylePreviewGridView _previewViews](self, "_previewViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __42__CAMSmartStylePreviewGridView_handleTap___block_invoke;
    v10 = &unk_1EA32B150;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v7);

    if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CAMSmartStylePreviewGridView handleTap:].cold.1(v6);
    }
    else
    {
LABEL_6:
      -[CAMSmartStylePreviewGridView delegate](self, "delegate", v7, v8, v9, v10);
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject smartStylePreviewGridView:didTapItemAtIndex:](v6, "smartStylePreviewGridView:didTapItemAtIndex:", self, v14[3]);
    }

    _Block_object_dispose(&v13, 8);
  }

}

BOOL __42__CAMSmartStylePreviewGridView_handleTap___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  _BOOL8 result;
  CGPoint v22;
  CGRect v23;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  v22.x = v10;
  v22.y = v12;
  result = CGRectContainsPoint(v23, v22);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (CAMSmartStylePreviewGridViewDelegate)delegate
{
  return (CAMSmartStylePreviewGridViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)layout
{
  return self->_layout;
}

- (unint64_t)expandedItemIndex
{
  return self->_expandedItemIndex;
}

- (CEKSmartStyle)style
{
  return self->_style;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSArray)_previewViews
{
  return self->__previewViews;
}

- (int64_t)_expansionAnimationCount
{
  return self->__expansionAnimationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__previewViews, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateGridIndex:(uint64_t)a1 withResourceLoadResult:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Attempting to set resourceLoadResult on bad grid index: %lu", (uint8_t *)&v2, 0xCu);
}

- (void)handleTap:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Grid item not found for tap", v1, 2u);
}

@end
