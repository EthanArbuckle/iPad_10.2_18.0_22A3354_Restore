@implementation SSSCropOverlayView

- (SSSCropOverlayView)initWithFrame:(CGRect)a3
{
  SSSCropOverlayView *v3;
  void *v4;
  UIView *v5;
  UIView *containerView;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  SSSCropOverlayLineView *v14;
  SSSCropOverlayGrabberView *v15;
  NSArray *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSArray *cornerViews;
  NSArray *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v45.receiver = self;
  v45.super_class = (Class)SSSCropOverlayView;
  v3 = -[SSSCropOverlayView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSCropOverlayView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView layer](v3, "layer"));
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  v3->_cornerGrabberAlpha = 1.0;
  v3->_lineGrabberAlpha = 1.0;
  v3->_lineAlpha = 1.0;
  v5 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = v3->_containerView;
  v3->_containerView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_containerView, "layer"));
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  -[SSSCropOverlayView addSubview:](v3, "addSubview:", v3->_containerView);
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView _orderedRectEdges](v3, "_orderedRectEdges"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v12), "integerValue");
        v14 = -[SSSCropOverlayLineView initWithEdge:]([SSSCropOverlayLineView alloc], "initWithEdge:", v13);
        v15 = -[SSSCropOverlayGrabberView initWithEdge:]([SSSCropOverlayGrabberView alloc], "initWithEdge:", v13);
        objc_msgSend(obj, "addObject:", v14);
        objc_msgSend(v35, "addObject:", v15);
        -[UIView addSubview:](v3->_containerView, "addSubview:", v14);
        -[UIView addSubview:](v3->_containerView, "addSubview:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)&v3->_lineViews, obj);
  objc_storeStrong((id *)&v3->_grabberViews, v35);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView _orderedRectCorners](v3, "_orderedRectCorners"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        v22 = -[SSSCropOverlayCornerView initForCorner:]([SSSCropOverlayCornerView alloc], "initForCorner:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v21), "integerValue"));
        -[NSArray addObject:](v16, "addObject:", v22);
        -[UIView addSubview:](v3->_containerView, "addSubview:", v22);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v19);
  }

  cornerViews = v3->_cornerViews;
  v3->_cornerViews = v16;
  v24 = v16;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_containerView, "layer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSMaterial cropHandle](SSMaterial, "cropHandle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filter"));
  v46 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  objc_msgSend(v25, "setFilters:", v28);

  v29 = v3->_containerView;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSMaterial cropHandle](SSMaterial, "cropHandle"));
  objc_msgSend(v30, "colorAlpha");
  -[UIView setAlpha:](v29, "setAlpha:");

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSMaterial cropHandle](SSMaterial, "cropHandle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "color"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "colorWithAlphaComponent:", 1.0));
  -[SSSCropOverlayView setTintColor:](v3, "setTintColor:", v33);

  return v3;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSCropOverlayView;
  -[SSSCropOverlayView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSCropOverlayView setNeedsLayout](self, "setNeedsLayout");
  -[SSSCropOverlayView layoutIfNeeded](self, "layoutIfNeeded");
}

- (id)_orderedRectCorners
{
  return &off_100095E38;
}

- (id)_orderedRectEdges
{
  return &off_100095E50;
}

+ (double)_outsetAmountForHandles
{
  double result;

  +[SSChromeHelper cropsHandleOutset](SSChromeHelper, "cropsHandleOutset");
  return result;
}

- (CGRect)_frameForViewInCorner:(unint64_t)a3 inSize:(CGSize)a4 cornerSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  +[SSSCropOverlayGrabberView preferredDimension](SSSCropOverlayGrabberView, "preferredDimension");
  v12 = v11;
  *(_QWORD *)&v14 = objc_opt_class(self, v13).n128_u64[0];
  objc_msgSend(v15, "_outsetAmountForHandles", v14);
  v17 = v12 + v16;
  if (a3 == 4 || a3 == 1)
  {
    v18 = -v17;
    v19 = -v17;
  }
  else
  {
    v19 = v8 - width + v17;
    v18 = -v17;
  }
  v20 = v7 - height + v17;
  if (a3 - 1 < 2)
    v20 = v18;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_frameForLineAtEdge:(unint64_t)a3 inSize:(CGSize)a4 dimension:(double)a5
{
  double height;
  double width;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  int IsHorizontal;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a4.height;
  width = a4.width;
  *(_QWORD *)&v9 = objc_opt_class(self, a2).n128_u64[0];
  objc_msgSend(v10, "_outsetAmountForHandles", v9);
  v12 = v11;
  v13 = -a5;
  IsHorizontal = SSRectEdgeIsHorizontal(a3);
  v15 = -a5;
  switch(a3)
  {
    case 1uLL:
      v15 = v13 - v12;
      break;
    case 2uLL:
      v15 = -a5;
      v13 = v13 - v12;
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v15 = height + v12;
      break;
    case 8uLL:
      v15 = -a5;
      v13 = width + v12;
      break;
    default:
      v15 = -a5;
      break;
  }
  v16 = width + a5 * 2.0;
  if (IsHorizontal)
  {
    v17 = a5;
  }
  else
  {
    v16 = a5;
    v17 = height + a5 * 2.0;
  }
  v18 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForGrabberAtEdge:(unint64_t)a3 inSize:(CGSize)a4 dimension:(double)a5
{
  double v6;
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
  double v19;
  CGRect result;

  -[SSSCropOverlayView _frameForLineAtEdge:inSize:dimension:](self, "_frameForLineAtEdge:inSize:dimension:", a4.width, a4.height, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  +[SSSCropOverlayGrabberView preferredOtherDimension](SSSCropOverlayGrabberView, "preferredOtherDimension");
  v15 = v14;
  if (SSRectEdgeIsHorizontal(a3))
    UIRectCenteredXInRect(v7, v9, v15, v13, v7, v9, v11, v13);
  else
    UIRectCenteredYInRect(v7, v9, v11, v15, v7, v9, v11, v13);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)layoutSubviews
{
  UIView *containerView;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double v37;
  double v38;

  containerView = self->_containerView;
  -[SSSCropOverlayView bounds](self, "bounds");
  -[UIView setFrame:](containerView, "setFrame:");
  -[SSSCropOverlayView bounds](self, "bounds");
  v5 = floor(v4);
  -[SSSCropOverlayView bounds](self, "bounds");
  v7 = floor(v6);
  v36 = (id)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView _orderedRectCorners](self, "_orderedRectCorners"));
  if (-[NSArray count](self->_cornerViews, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cornerViews, "objectAtIndex:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v8));
      v11 = objc_msgSend(v10, "integerValue");

      objc_msgSend(v9, "intrinsicContentSize");
      -[SSSCropOverlayView _frameForViewInCorner:inSize:cornerSize:](self, "_frameForViewInCorner:inSize:cornerSize:", v11, v5, v7, v12, v13);
      objc_msgSend(v9, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:");

      ++v8;
    }
    while (v8 < -[NSArray count](self->_cornerViews, "count"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView _orderedRectEdges](self, "_orderedRectEdges"));
  if (-[NSArray count](self->_grabberViews, "count"))
  {
    v15 = 0;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_grabberViews, "objectAtIndex:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_lineViews, "objectAtIndex:", v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v15));
      v19 = objc_msgSend(v18, "integerValue");

      +[SSSCropOverlayGrabberView preferredDimension](SSSCropOverlayGrabberView, "preferredDimension");
      -[SSSCropOverlayView _frameForGrabberAtEdge:inSize:dimension:](self, "_frameForGrabberAtEdge:inSize:dimension:", v19, v5, v7, v20);
      v37 = v22;
      v38 = v21;
      v24 = v23;
      v26 = v25;
      +[SSSCropOverlayLineView preferredDimension](SSSCropOverlayLineView, "preferredDimension");
      -[SSSCropOverlayView _frameForLineAtEdge:inSize:dimension:](self, "_frameForLineAtEdge:inSize:dimension:", v19, v5, v7, v27);
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      objc_msgSend(v16, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", v38, v37, v24, v26);
      objc_msgSend(v17, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", v29, v31, v33, v35);

      ++v15;
    }
    while (v15 < -[NSArray count](self->_grabberViews, "count"));
  }

}

- (SSSCropOverlayGrabPosition)grabPositionForLocation:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  SSSCropOverlayGrabPosition result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y));
  objc_opt_class(SSSCropOverlayCornerView, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v7 = objc_msgSend(v3, "corner");
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  objc_opt_class(SSSCropOverlayGrabberView, v6);
  if ((objc_opt_isKindOfClass(v3, v8) & 1) == 0)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v3, "edge");
  v7 = 0;
LABEL_7:

  v10 = (unint64_t)v9;
  v11 = (unint64_t)v7;
  result.corner = v11;
  result.edge = v10;
  return result;
}

- (id)_viewsToHitTest
{
  return -[NSArray arrayByAddingObjectsFromArray:](self->_cornerViews, "arrayByAddingObjectsFromArray:", self->_grabberViews);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  BOOL v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView _viewsToHitTest](self, "_viewsToHitTest"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
        {

          v14 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)SSSCropOverlayView;
  v14 = -[SSSCropOverlayView pointInside:withEvent:](&v16, "pointInside:withEvent:", v7, x, y);
LABEL_11:

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SSSCropOverlayView *v8;
  SSSCropOverlayView *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  SSSCropOverlayView *v14;
  id v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((UIViewIgnoresTouchEvents(self) & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (SSSCropOverlayView *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView _viewsToHitTest](self, "_viewsToHitTest"));
    v10 = -[SSSCropOverlayView countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(SSSCropOverlayView **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[SSSCropOverlayView convertPoint:fromView:](v14, "convertPoint:fromView:", self, x, y);
        if (-[SSSCropOverlayView pointInside:withEvent:](v14, "pointInside:withEvent:", v7))
          break;
        if (v11 == (id)++v13)
        {
          v11 = -[SSSCropOverlayView countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      v17.receiver = self;
      v17.super_class = (Class)SSSCropOverlayView;
      v15 = -[SSSCropOverlayView hitTest:withEvent:](&v17, "hitTest:withEvent:", v7, x, y);
      v14 = (SSSCropOverlayView *)objc_claimAutoreleasedReturnValue(v15);
      if (v14 == self || (-[SSSCropOverlayView containsView:](self, "containsView:", v14) & 1) != 0)
      {
        v8 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v9 = v14;
    }
    v8 = v14;
    v14 = v9;
    goto LABEL_16;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (void)setCornerGrabberAlpha:(double)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  self->_cornerGrabberAlpha = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_cornerViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setAlpha:", a3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setLineAlpha:(double)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  self->_lineAlpha = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_lineViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setAlpha:", a3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setLineGrabberAlpha:(double)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  self->_lineGrabberAlpha = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_grabberViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setAlpha:", a3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)cornerGrabberAlpha
{
  return self->_cornerGrabberAlpha;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (double)lineGrabberAlpha
{
  return self->_lineGrabberAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_grabberViews, 0);
  objc_storeStrong((id *)&self->_cornerViews, 0);
}

@end
