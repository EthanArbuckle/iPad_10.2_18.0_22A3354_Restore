@implementation SFUnifiedTabBarLayoutConfiguration

- (SFUnifiedTabBarLayoutConfiguration)initWithScrollView:(id)a3
{
  id v5;
  SFUnifiedTabBarLayoutConfiguration *v6;
  SFUnifiedTabBarLayoutConfiguration *v7;
  CGSize v8;
  SFUnifiedTabBarLayoutConfiguration *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedTabBarLayoutConfiguration;
  v6 = -[SFUnifiedTabBarLayoutConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v7->_visibleRectOverride.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v7->_visibleRectOverride.size = v8;
    v9 = v7;
  }

  return v7;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (SFUnifiedTabBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (void)setBarMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_barMetrics, a3);
}

- (CGPoint)midpointForCenteredContent
{
  double x;
  double y;
  CGPoint result;

  x = self->_midpointForCenteredContent.x;
  y = self->_midpointForCenteredContent.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMidpointForCenteredContent:(CGPoint)a3
{
  self->_midpointForCenteredContent = a3;
}

- (BOOL)isStandalone
{
  return self->_standalone;
}

- (void)setStandalone:(BOOL)a3
{
  self->_standalone = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)shouldSlideInNewTrailingTab
{
  return self->_shouldSlideInNewTrailingTab;
}

- (void)setShouldSlideInNewTrailingTab:(BOOL)a3
{
  self->_shouldSlideInNewTrailingTab = a3;
}

- (CGRect)visibleRectOverride
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRectOverride.origin.x;
  y = self->_visibleRectOverride.origin.y;
  width = self->_visibleRectOverride.size.width;
  height = self->_visibleRectOverride.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRectOverride:(CGRect)a3
{
  self->_visibleRectOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
