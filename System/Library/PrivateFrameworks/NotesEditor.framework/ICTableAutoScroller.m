@implementation ICTableAutoScroller

- (ICTableAutoScroller)initWithTableAttachmentViewController:(id)a3 scrollDirectionMode:(unint64_t)a4
{
  id v6;
  ICTableAutoScroller *v7;
  ICTableAutoScroller *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICTableAutoScroller;
  v7 = -[ICTableAutoScroller init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_tableAttachmentViewController, v6);
    v8->_scrollDirectionMode = a4;
    objc_msgSend(v6, "noteScrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_verticalScrollView, v9);

    objc_msgSend(v6, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_horizontalScrollView, v10);

  }
  return v8;
}

- (void)setTargetFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double MaxX;
  unint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  double v30;
  double MaxY;
  double MinX;
  double v33;
  double MinY;
  id v35;
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

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICTableAutoScroller targetFrame](self, "targetFrame");
  v45.origin.x = v8;
  v45.origin.y = v9;
  v45.size.width = v10;
  v45.size.height = v11;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  if (!CGRectEqualToRect(v36, v45))
  {
    self->_targetFrame.origin.x = x;
    self->_targetFrame.origin.y = y;
    self->_targetFrame.size.width = width;
    self->_targetFrame.size.height = height;
    -[ICTableAutoScroller tableAttachmentViewController](self, "tableAttachmentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewport");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v37.origin.x = v14;
    v37.origin.y = v16;
    v37.size.width = v18;
    v37.size.height = v20;
    MinY = CGRectGetMinY(v37);
    -[ICTableAutoScroller topThresholdDistance](self, "topThresholdDistance");
    v33 = v21;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    MaxY = CGRectGetMaxY(v38);
    -[ICTableAutoScroller bottomThresholdDistance](self, "bottomThresholdDistance");
    v30 = v22;
    v39.origin.x = v14;
    v39.origin.y = v16;
    v39.size.width = v18;
    v39.size.height = v20;
    MinX = CGRectGetMinX(v39);
    v40.origin.x = v14;
    v40.origin.y = v16;
    v40.size.width = v18;
    v40.size.height = v20;
    MaxX = CGRectGetMaxX(v40);
    v24 = -[ICTableAutoScroller scrollDirectionMode](self, "scrollDirectionMode");
    if (v24 == 1)
    {
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      if (MinX <= CGRectGetMinX(v43))
      {
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        if (MaxX >= CGRectGetMaxX(v44))
          goto LABEL_13;
      }
    }
    else
    {
      if (v24)
        goto LABEL_13;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      if (MinY + v33 <= CGRectGetMinY(v41))
      {
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        if (MaxY - v30 >= CGRectGetMaxY(v42))
        {
LABEL_13:
          -[ICTableAutoScroller autoscrollTimer](self, "autoscrollTimer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            -[ICTableAutoScroller stopAutoscrollTimer](self, "stopAutoscrollTimer");
          return;
        }
      }
    }
    -[ICTableAutoScroller autoscrollTimer](self, "autoscrollTimer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[ICTableAutoScroller delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_respondsToSelector();

      if ((v27 & 1) != 0)
      {
        -[ICTableAutoScroller delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "tableAutoScrollerWillStartScrolling:", self);

      }
      -[ICTableAutoScroller setIsScrolling:](self, "setIsScrolling:", 1);
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateAutoscrollTimer_, 0, 1, 0.02);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      -[ICTableAutoScroller setAutoscrollTimer:](self, "setAutoscrollTimer:", v35);

    }
  }
}

- (void)updateAutoscrollTimer:(id)a3
{
  unint64_t v4;
  double v5;
  float v6;

  v4 = -[ICTableAutoScroller scrollDirectionMode](self, "scrollDirectionMode", a3);
  -[ICTableAutoScroller scrollFactorForScrollDirectionMode:](self, "scrollFactorForScrollDirectionMode:", v4);
  v6 = v5;
  if (v6 == 0.0)
    -[ICTableAutoScroller stopAutoscrollTimer](self, "stopAutoscrollTimer");
  else
    -[ICTableAutoScroller autoScrollWithScrollFactor:scrollDirectionMode:](self, "autoScrollWithScrollFactor:scrollDirectionMode:", v4, v6);
}

- (double)scrollFactorForScrollDirectionMode:(unint64_t)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double Height;
  CGFloat v31;
  double MaxX;
  double v33;
  float v34;
  double MinY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double Width;
  double MinX;
  double v45;
  float v46;
  CGFloat rect;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[ICTableAutoScroller tableAttachmentViewController](self, "tableAttachmentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewport");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[ICTableAutoScroller targetFrame](self, "targetFrame");
  v18 = v15;
  v19 = v17;
  v20 = 0.0;
  if (a3 != 1)
  {
    if (a3)
      return v20;
    v49 = v16;
    v51 = v14;
    MaxY = CGRectGetMaxY(*(CGRect *)&v14);
    v53.origin.x = v7;
    v53.origin.y = v9;
    v53.size.width = v11;
    v53.size.height = v13;
    rect = v19;
    v22 = CGRectGetMaxY(v53);
    -[ICTableAutoScroller bottomThresholdDistance](self, "bottomThresholdDistance");
    if (MaxY > v22 - v23)
    {
      v54.origin.x = v7;
      v54.origin.y = v9;
      v54.size.width = v11;
      v54.size.height = v13;
      v24 = CGRectGetMaxY(v54);
      -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "contentSize");
      v27 = v26;

      if (v24 < v27)
      {
        v55.size.width = v49;
        v55.origin.x = v51;
        v55.origin.y = v18;
        v55.size.height = rect;
        v28 = CGRectGetMaxY(v55);
        v56.origin.x = v7;
        v56.origin.y = v9;
        v56.size.width = v11;
        v56.size.height = v13;
        v29 = v28 - CGRectGetMaxY(v56);
        v20 = 2.0;
        if (v29 > 0.0)
        {
          v57.size.width = v49;
          v57.origin.x = v51;
          v57.origin.y = v18;
          v57.size.height = rect;
          Height = CGRectGetHeight(v57);
LABEL_10:
          v34 = v29 / (Height * 0.5) * 8.0 * (v29 / (Height * 0.5)) + 2.0;
          return floorf(v34);
        }
        return v20;
      }
    }
    v62.size.width = v49;
    v62.origin.x = v51;
    v62.origin.y = v18;
    v62.size.height = rect;
    MinY = CGRectGetMinY(v62);
    v63.origin.x = v7;
    v63.origin.y = v9;
    v63.size.width = v11;
    v63.size.height = v13;
    v37 = CGRectGetMinY(v63);
    -[ICTableAutoScroller topThresholdDistance](self, "topThresholdDistance");
    if (MinY >= v37 + v38)
      return v20;
    v64.origin.x = v7;
    v64.origin.y = v9;
    v64.size.width = v11;
    v64.size.height = v13;
    v39 = CGRectGetMinY(v64);
    -[ICTableAutoScroller topThresholdDistance](self, "topThresholdDistance");
    if (v39 <= -v40)
      return v20;
    v65.size.width = v49;
    v65.origin.x = v51;
    v65.origin.y = v18;
    v65.size.height = rect;
    v41 = CGRectGetMinY(v65);
    v66.origin.x = v7;
    v66.origin.y = v9;
    v66.size.width = v11;
    v66.size.height = v13;
    v42 = v41 - CGRectGetMinY(v66);
    v20 = -2.0;
    if (v42 >= 0.0)
      return v20;
    v67.size.width = v49;
    v67.origin.x = v51;
    v67.origin.y = v18;
    v67.size.height = rect;
    Width = CGRectGetHeight(v67);
LABEL_18:
    v46 = v42 / (Width * 0.5) * 8.0 * (v42 / (Width * 0.5)) + 2.0;
    return (float)-floorf(v46);
  }
  v50 = v15;
  v52 = v14;
  v31 = v16;
  MaxX = CGRectGetMaxX(*(CGRect *)&v14);
  v58.origin.x = v7;
  v58.origin.y = v9;
  v58.size.width = v11;
  v58.size.height = v13;
  if (MaxX <= CGRectGetMaxX(v58))
  {
    v68.origin.y = v50;
    v68.origin.x = v52;
    v68.size.width = v31;
    v68.size.height = v19;
    MinX = CGRectGetMinX(v68);
    v69.origin.x = v7;
    v69.origin.y = v9;
    v69.size.width = v11;
    v69.size.height = v13;
    if (MinX >= CGRectGetMinX(v69))
      return v20;
    v70.origin.y = v50;
    v70.origin.x = v52;
    v70.size.width = v31;
    v70.size.height = v19;
    v45 = CGRectGetMinX(v70);
    v71.origin.x = v7;
    v71.origin.y = v9;
    v71.size.width = v11;
    v71.size.height = v13;
    v42 = v45 - CGRectGetMinX(v71);
    v20 = -2.0;
    if (v42 >= 0.0)
      return v20;
    v72.origin.y = v50;
    v72.origin.x = v52;
    v72.size.width = v31;
    v72.size.height = v19;
    Width = CGRectGetWidth(v72);
    goto LABEL_18;
  }
  v59.origin.y = v50;
  v59.origin.x = v52;
  v59.size.width = v31;
  v59.size.height = v19;
  v33 = CGRectGetMaxX(v59);
  v60.origin.x = v7;
  v60.origin.y = v9;
  v60.size.width = v11;
  v60.size.height = v13;
  v29 = v33 - CGRectGetMaxX(v60);
  v20 = 2.0;
  if (v29 > 0.0)
  {
    v61.origin.y = v50;
    v61.origin.x = v52;
    v61.size.width = v31;
    v61.size.height = v19;
    Height = CGRectGetWidth(v61);
    goto LABEL_10;
  }
  return v20;
}

- (void)autoScrollWithScrollFactor:(double)a3 scrollDirectionMode:(unint64_t)a4
{
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  char v40;
  id v41;

  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (a4 == 1)
  {
    -[ICTableAutoScroller horizontalScrollView](self, "horizontalScrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentOffset");
    v29 = v28;
    v13 = v30;

    v31 = v29 + a3;
    -[ICTableAutoScroller horizontalScrollView](self, "horizontalScrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentSize");
    v34 = v33;
    -[ICTableAutoScroller horizontalScrollView](self, "horizontalScrollView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v37 = v36;

    v10 = 0.0;
    if (v31 >= 0.0)
    {
      v10 = v31;
      if (v31 > v34 - v37)
        v10 = v34 - v37;
    }
    -[ICTableAutoScroller horizontalScrollView](self, "horizontalScrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a3;
    goto LABEL_16;
  }
  v7 = *MEMORY[0x1E0C9D538];
  if (a4)
    goto LABEL_17;
  -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  v12 = v11;

  v13 = v12 + a3;
  -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInset");
  v16 = -v15;

  -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v19 = v18;
  -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v19 - v21;
  -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentInset");
  v25 = v22 + v24;

  if (v25 <= v16)
    v26 = v16;
  else
    v26 = v25;
  if (v13 < v16)
  {
    v13 = v16;
LABEL_14:
    a3 = v6;
    goto LABEL_15;
  }
  if (v13 > v26)
  {
    v13 = v26;
    goto LABEL_14;
  }
LABEL_15:
  -[ICTableAutoScroller verticalScrollView](self, "verticalScrollView", v26);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3;
LABEL_16:
  objc_msgSend(v38, "setContentOffset:", v10, v13);

LABEL_17:
  -[ICTableAutoScroller delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_respondsToSelector();

  if ((v40 & 1) != 0)
  {
    -[ICTableAutoScroller delegate](self, "delegate");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "tableAutoScroller:scrollOffsetDelta:", self, v7, v6);

  }
}

- (void)stopAutoscrollTimer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ICTableAutoScroller delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ICTableAutoScroller delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableAutoScrollerWillStopScrolling:", self);

  }
  -[ICTableAutoScroller autoscrollTimer](self, "autoscrollTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[ICTableAutoScroller setAutoscrollTimer:](self, "setAutoscrollTimer:", 0);
  -[ICTableAutoScroller setIsScrolling:](self, "setIsScrolling:", 0);
}

- (UIScrollView)targetScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_targetScrollView);
}

- (ICTableAutoScrollerDelegate)delegate
{
  return (ICTableAutoScrollerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)scrollDirectionMode
{
  return self->_scrollDirectionMode;
}

- (void)setScrollDirectionMode:(unint64_t)a3
{
  self->_scrollDirectionMode = a3;
}

- (double)topThresholdDistance
{
  return self->_topThresholdDistance;
}

- (void)setTopThresholdDistance:(double)a3
{
  self->_topThresholdDistance = a3;
}

- (double)bottomThresholdDistance
{
  return self->_bottomThresholdDistance;
}

- (void)setBottomThresholdDistance:(double)a3
{
  self->_bottomThresholdDistance = a3;
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  return (ICTableAttachmentViewController *)objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);
}

- (void)setTableAttachmentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAttachmentViewController, a3);
}

- (UIScrollView)verticalScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_verticalScrollView);
}

- (void)setVerticalScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_verticalScrollView, a3);
}

- (ICTableScrollView)horizontalScrollView
{
  return (ICTableScrollView *)objc_loadWeakRetained((id *)&self->_horizontalScrollView);
}

- (void)setHorizontalScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_horizontalScrollView, a3);
}

- (NSTimer)autoscrollTimer
{
  return self->_autoscrollTimer;
}

- (void)setAutoscrollTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoscrollTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_destroyWeak((id *)&self->_horizontalScrollView);
  objc_destroyWeak((id *)&self->_verticalScrollView);
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetScrollView);
}

@end
