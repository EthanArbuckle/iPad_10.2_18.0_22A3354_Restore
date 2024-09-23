@implementation TabOverviewTargetedPreviewContainer

- (TabOverviewTargetedPreviewContainer)initWithFrame:(CGRect)a3
{
  TabOverviewTargetedPreviewContainer *v3;
  TabOverviewTargetedPreviewContainer *v4;
  double v5;
  double v6;
  void *v7;
  TabOverviewTargetedPreviewContainer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TabOverviewTargetedPreviewContainer;
  v3 = -[TabOverviewTargetedPreviewContainer initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[TabOverviewTargetedPreviewContainer layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnchorPoint:", v5, v6);

    v8 = v4;
  }

  return v4;
}

- (void)_didRemoveSubview:(id)a3
{
  void *v4;
  id didRemoveLastSubviewBlock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TabOverviewTargetedPreviewContainer;
  -[TabOverviewTargetedPreviewContainer _didRemoveSubview:](&v6, sel__didRemoveSubview_, a3);
  -[TabOverviewTargetedPreviewContainer subviews](self, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    didRemoveLastSubviewBlock = self->_didRemoveLastSubviewBlock;

    if (didRemoveLastSubviewBlock)
      (*((void (**)(void))self->_didRemoveLastSubviewBlock + 2))();
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (TabOverviewItem)tabOverviewItem
{
  return (TabOverviewItem *)objc_loadWeakRetained((id *)&self->_tabOverviewItem);
}

- (void)setTabOverviewItem:(id)a3
{
  objc_storeWeak((id *)&self->_tabOverviewItem, a3);
}

- (double)initialItemWidth
{
  return self->_initialItemWidth;
}

- (void)setInitialItemWidth:(double)a3
{
  self->_initialItemWidth = a3;
}

- (id)didRemoveLastSubviewBlock
{
  return self->_didRemoveLastSubviewBlock;
}

- (void)setDidRemoveLastSubviewBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didRemoveLastSubviewBlock, 0);
  objc_destroyWeak((id *)&self->_tabOverviewItem);
}

@end
