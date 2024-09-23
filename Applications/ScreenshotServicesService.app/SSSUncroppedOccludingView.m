@implementation SSSUncroppedOccludingView

- (void)layoutSubviews
{
  double x;
  double width;
  CGFloat height;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxY;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MinY;
  double v31;
  double MaxX;
  double v33;
  CGFloat v34;
  CGFloat v35;
  objc_super v36;
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

  v36.receiver = self;
  v36.super_class = (Class)SSSUncroppedOccludingView;
  -[SSSUncroppedOccludingView layoutSubviews](&v36, "layoutSubviews");
  -[SSSUncroppedOccludingView bounds](self, "bounds");
  x = v37.origin.x;
  width = v37.size.width;
  height = v37.size.height;
  y = v37.origin.y;
  if (!CGRectIsEmpty(v37))
  {
    -[SSSUncroppedOccludingView unoccludedRect](self, "unoccludedRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSUncroppedOccludingView traitCollection](self, "traitCollection"));
    objc_msgSend(v15, "displayScale");
    v17 = SSRoundRectToScale(v8, v10, v12, v14, v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v38.origin.x = v17;
    v38.origin.y = v19;
    v38.size.width = v21;
    v38.size.height = v23;
    MinY = CGRectGetMinY(v38);
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_topView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, y, width, MinY);
    v39.origin.x = v17;
    v39.origin.y = v19;
    v39.size.width = v21;
    v39.size.height = v23;
    v33 = height;
    MaxY = CGRectGetMaxY(v39);
    v40.origin.x = v17;
    v40.origin.y = v19;
    v40.size.width = v21;
    v40.size.height = v23;
    v34 = v33 - CGRectGetMaxY(v40);
    v35 = MaxY;
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_bottomView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, MaxY, width, v34);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = MinY;
    v31 = CGRectGetMaxY(v41);
    v42.origin.x = x;
    v42.origin.y = MaxY;
    v42.size.width = width;
    v42.size.height = v34;
    v25 = CGRectGetMinY(v42);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = MinY;
    v26 = v25 - CGRectGetMaxY(v43);
    v44.origin.x = v17;
    v44.origin.y = v19;
    v44.size.width = v21;
    v44.size.height = v23;
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_leftView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, v31, CGRectGetMinX(v44), v26);
    v45.origin.x = v17;
    v45.origin.y = v19;
    v45.size.width = v21;
    v45.size.height = v23;
    MaxX = CGRectGetMaxX(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = MinY;
    v29 = CGRectGetMaxY(v46);
    v47.origin.x = v17;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    v27 = width - CGRectGetMaxX(v47);
    v48.origin.x = x;
    v48.size.height = v34;
    v48.origin.y = v35;
    v48.size.width = width;
    v28 = CGRectGetMinY(v48);
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = MinY;
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_rightView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", MaxX, v29, v27, v28 - CGRectGetMaxY(v49));
  }
}

- (id)_occludingViews
{
  SSSOccludingCoveringView *bottomView;
  SSSOccludingCoveringView *rightView;
  _QWORD v5[4];

  bottomView = self->_bottomView;
  v5[0] = self->_topView;
  v5[1] = bottomView;
  rightView = self->_rightView;
  v5[2] = self->_leftView;
  v5[3] = rightView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4));
}

- (BOOL)pointCanPassthrough:(CGPoint)a3
{
  return !-[SSSUncroppedOccludingView _pointInsideAnOccludingView:](self, "_pointInsideAnOccludingView:", a3.x, a3.y);
}

- (BOOL)_pointInsideAnOccludingView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  y = a3.y;
  x = a3.x;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSUncroppedOccludingView _occludingViews](self, "_occludingViews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
        if ((objc_msgSend(v11, "pointInside:withEvent:", 0) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setUnoccludedRect:(CGRect)a3
{
  self->_unoccludedRect = a3;
  -[SSSUncroppedOccludingView setNeedsLayout](self, "setNeedsLayout");
}

- (SSSUncroppedOccludingView)initWithFrame:(CGRect)a3
{
  SSSUncroppedOccludingView *v3;
  SSSOccludingCoveringView *v4;
  SSSOccludingCoveringView *topView;
  SSSOccludingCoveringView *v6;
  SSSOccludingCoveringView *bottomView;
  SSSOccludingCoveringView *v8;
  SSSOccludingCoveringView *leftView;
  SSSOccludingCoveringView *v10;
  SSSOccludingCoveringView *rightView;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v22.receiver = self;
  v22.super_class = (Class)SSSUncroppedOccludingView;
  v3 = -[SSSUncroppedOccludingView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSUncroppedOccludingView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  v4 = objc_opt_new(SSSOccludingCoveringView);
  topView = v3->_topView;
  v3->_topView = v4;

  v6 = objc_opt_new(SSSOccludingCoveringView);
  bottomView = v3->_bottomView;
  v3->_bottomView = v6;

  v8 = objc_opt_new(SSSOccludingCoveringView);
  leftView = v3->_leftView;
  v3->_leftView = v8;

  v10 = objc_opt_new(SSSOccludingCoveringView);
  rightView = v3->_rightView;
  v3->_rightView = v10;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSUncroppedOccludingView _occludingViews](v3, "_occludingViews", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[SSSUncroppedOccludingView addSubview:](v3, "addSubview:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v16));
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v14);
  }

  return v3;
}

- (CGRect)unoccludedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unoccludedRect.origin.x;
  y = self->_unoccludedRect.origin.y;
  width = self->_unoccludedRect.size.width;
  height = self->_unoccludedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
}

@end
