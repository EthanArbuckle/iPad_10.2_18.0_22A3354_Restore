@implementation SUUIScrollingSegmentedControllerItemContext

- (SUUIScrollingSegmentedControllerItemContext)init
{
  return -[SUUIScrollingSegmentedControllerItemContext initWithViewController:](self, "initWithViewController:", 0);
}

- (SUUIScrollingSegmentedControllerItemContext)initWithViewController:(id)a3
{
  id v5;
  SUUIScrollingSegmentedControllerItemContext *v6;
  SUUIScrollingSegmentedControllerItemContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIScrollingSegmentedControllerItemContext;
  v6 = -[SUUIScrollingSegmentedControllerItemContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_viewController, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)applyNewContentInset:(UIEdgeInsets)a3
{
  if (self->_desiredContentInsetsAdjustment.left != a3.left
    || self->_desiredContentInsetsAdjustment.top != a3.top
    || self->_desiredContentInsetsAdjustment.right != a3.right
    || self->_desiredContentInsetsAdjustment.bottom != a3.bottom)
  {
    self->_desiredContentInsetsAdjustment = a3;
    -[SUUIScrollingSegmentedControllerItemContext updateAppliedContentInsetsAdjustment](self, "updateAppliedContentInsetsAdjustment");
  }
}

- (void)updateAppliedContentInsetsAdjustment
{
  uint64_t v3;
  UIScrollView *insetAdjustedContentScrollView;
  UIScrollView *v5;
  _OWORD *v6;
  __int128 v7;
  id WeakRetained;
  UIScrollView *obj;

  -[UIViewController contentScrollView](self->_viewController, "contentScrollView");
  v3 = objc_claimAutoreleasedReturnValue();
  insetAdjustedContentScrollView = self->_insetAdjustedContentScrollView;
  v5 = (UIScrollView *)v3;
  obj = (UIScrollView *)v3;
  if (insetAdjustedContentScrollView != (UIScrollView *)v3)
  {
    v6 = (_OWORD *)MEMORY[0x24BEBE158];
    if (insetAdjustedContentScrollView)
      -[SUUIScrollingSegmentedControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", insetAdjustedContentScrollView, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24), self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    v7 = v6[1];
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.top = *v6;
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.bottom = v7;
    objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, obj);
    v5 = self->_insetAdjustedContentScrollView;
  }
  if (v5)
  {
    -[SUUIScrollingSegmentedControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", self->_desiredContentInsetsAdjustment.top, self->_desiredContentInsetsAdjustment.left, self->_desiredContentInsetsAdjustment.bottom, self->_desiredContentInsetsAdjustment.right, self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.top = *(_OWORD *)&self->_desiredContentInsetsAdjustment.top;
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.bottom = *(_OWORD *)&self->_desiredContentInsetsAdjustment.bottom;
  }
  if (insetAdjustedContentScrollView != obj)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "contentScrollViewDidChangeForScrollingSegmentedControllerItemContext:", self);

  }
}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 withOldContentInset:(UIEdgeInsets)a4 toContentScrollView:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
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

  if (a4.left != a3.left || a4.top != a3.top || a4.right != a3.right || a4.bottom != a3.bottom)
  {
    right = a4.right;
    bottom = a4.bottom;
    left = a4.left;
    top = a4.top;
    v12 = a3.right;
    v13 = a3.bottom;
    v14 = a3.left;
    v15 = a3.top;
    v36 = a5;
    objc_msgSend(v36, "contentInset");
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v29 = v19;
    objc_msgSend(v36, "scrollIndicatorInsets");
    v30 = v20;
    v31 = v21;
    v32 = v22;
    v33 = v23;
    objc_msgSend(v36, "contentOffset");
    v34 = v25;
    v35 = v24;
    objc_msgSend(v36, "setContentInset:", v15 + v26 - top, v14 + v27 - left, v13 + v28 - bottom, v12 + v29 - right);
    objc_msgSend(v36, "setScrollIndicatorInsets:", v15 + v30 - top, v14 + v31 - left, v13 + v32 - bottom, v12 + v33 - right);
    objc_msgSend(v36, "setContentOffset:", v35, top + v34 - v15);

  }
}

- (SUUIScrollingSegmentedControllerItemContextDelegate)delegate
{
  return (SUUIScrollingSegmentedControllerItemContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, 0);
}

@end
