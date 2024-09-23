@implementation SFUnifiedTabBarAnimatedResizingInfo

- (SFUnifiedTabBarAnimatedResizingInfo)initWithItemsToKeepVisible:(id)a3 targetContentOffset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  SFUnifiedTabBarAnimatedResizingInfo *v9;
  SFUnifiedTabBarAnimatedResizingInfo *v10;
  SFUnifiedTabBarAnimatedResizingInfo *v11;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFUnifiedTabBarAnimatedResizingInfo;
  v9 = -[SFUnifiedTabBarAnimatedResizingInfo init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemsToKeepVisible, a3);
    v10->_targetContentOffset.x = x;
    v10->_targetContentOffset.y = y;
    v11 = v10;
  }

  return v10;
}

- (NSSet)itemsToKeepVisible
{
  return self->_itemsToKeepVisible;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToKeepVisible, 0);
}

@end
