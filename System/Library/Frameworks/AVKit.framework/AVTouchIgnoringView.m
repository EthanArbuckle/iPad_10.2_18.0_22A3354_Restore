@implementation AVTouchIgnoringView

- (BOOL)isRemoved
{
  return self->_removed;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVTouchIgnoringView _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)_updateLayoutItem
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AVTouchIgnoringView layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTouchIgnoringView isIncluded](self, "isIncluded"))
    v4 = -[AVTouchIgnoringView isRemoved](self, "isRemoved") ^ 1;
  else
    v4 = 0;
  objc_msgSend(v3, "setIncluded:", v4);

  -[AVTouchIgnoringView layoutAttributes](self, "layoutAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsed:", -[AVTouchIgnoringView isCollapsed](self, "isCollapsed"));

}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVTouchIgnoringView isCollapsed](self, "isCollapsed")
      || !-[AVTouchIgnoringView isIncluded](self, "isIncluded")
      || -[AVTouchIgnoringView isRemoved](self, "isRemoved");
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v4;
  AVLayoutItemAttributes *v5;

  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes)
  {
    v4 = objc_alloc_init(AVLayoutItemAttributes);
    v5 = self->_layoutAttributes;
    self->_layoutAttributes = v4;

    layoutAttributes = self->_layoutAttributes;
  }
  return layoutAttributes;
}

- (AVTouchIgnoringView)initWithFrame:(CGRect)a3
{
  AVTouchIgnoringView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTouchIgnoringView;
  result = -[AVTouchIgnoringView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_collapsed = 0;
    result->_included = 1;
    result->_removed = 0;
  }
  return result;
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVTouchIgnoringView _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AVTouchIgnoringView *v5;
  AVTouchIgnoringView *v6;
  AVTouchIgnoringView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTouchIgnoringView;
  -[AVTouchIgnoringView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVTouchIgnoringView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVTouchIgnoringView layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTouchIgnoringView setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVTouchIgnoringView _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  self->_extrinsicContentSize = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end
