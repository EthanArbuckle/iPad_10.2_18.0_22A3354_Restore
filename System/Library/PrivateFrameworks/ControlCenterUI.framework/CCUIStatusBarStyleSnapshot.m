@implementation CCUIStatusBarStyleSnapshot

- (CCUIStatusBarStyleSnapshot)initWithHidden:(BOOL)a3 hiddenPartIdentifier:(id)a4 leadingStyleRequest:(id)a5 trailingStyleRequest:(id)a6 overlayData:(id)a7 actionsByPartIdentifier:(id)a8 statusBarInsets:(UIEdgeInsets)a9 avoidanceFrame:(CGRect)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  CCUIStatusBarStyleSnapshot *v30;
  CCUIStatusBarStyleSnapshot *v31;
  uint64_t v32;
  UIStatusBarStyleRequest *leadingStyleRequest;
  uint64_t v34;
  UIStatusBarStyleRequest *trailingStyleRequest;
  uint64_t v36;
  _UIStatusBarData *overlayData;
  uint64_t v38;
  NSDictionary *actionsByPartIdentifier;
  objc_super v41;

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  right = a9.right;
  bottom = a9.bottom;
  left = a9.left;
  top = a9.top;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  v41.receiver = self;
  v41.super_class = (Class)CCUIStatusBarStyleSnapshot;
  v30 = -[CCUIStatusBarStyleSnapshot init](&v41, sel_init);
  v31 = v30;
  if (v30)
  {
    v30->_hidden = a3;
    objc_storeStrong((id *)&v30->_hiddenPartIdentifier, a4);
    v32 = objc_msgSend(v26, "copy");
    leadingStyleRequest = v31->_leadingStyleRequest;
    v31->_leadingStyleRequest = (UIStatusBarStyleRequest *)v32;

    v34 = objc_msgSend(v27, "copy");
    trailingStyleRequest = v31->_trailingStyleRequest;
    v31->_trailingStyleRequest = (UIStatusBarStyleRequest *)v34;

    v36 = objc_msgSend(v28, "copy");
    overlayData = v31->_overlayData;
    v31->_overlayData = (_UIStatusBarData *)v36;

    v38 = objc_msgSend(v29, "copy");
    actionsByPartIdentifier = v31->_actionsByPartIdentifier;
    v31->_actionsByPartIdentifier = (NSDictionary *)v38;

    v31->_statusBarInsets.top = top;
    v31->_statusBarInsets.left = left;
    v31->_statusBarInsets.bottom = bottom;
    v31->_statusBarInsets.right = right;
    v31->_avoidanceFrame.origin.x = x;
    v31->_avoidanceFrame.origin.y = y;
    v31->_avoidanceFrame.size.width = width;
    v31->_avoidanceFrame.size.height = height;
  }

  return v31;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)hiddenPartIdentifier
{
  return self->_hiddenPartIdentifier;
}

- (CGRect)avoidanceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avoidanceFrame.origin.x;
  y = self->_avoidanceFrame.origin.y;
  width = self->_avoidanceFrame.size.width;
  height = self->_avoidanceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)statusBarInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_statusBarInsets.top;
  left = self->_statusBarInsets.left;
  bottom = self->_statusBarInsets.bottom;
  right = self->_statusBarInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIStatusBarStyleRequest)leadingStyleRequest
{
  return self->_leadingStyleRequest;
}

- (UIStatusBarStyleRequest)trailingStyleRequest
{
  return self->_trailingStyleRequest;
}

- (_UIStatusBarData)overlayData
{
  return self->_overlayData;
}

- (NSDictionary)actionsByPartIdentifier
{
  return self->_actionsByPartIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByPartIdentifier, 0);
  objc_storeStrong((id *)&self->_overlayData, 0);
  objc_storeStrong((id *)&self->_trailingStyleRequest, 0);
  objc_storeStrong((id *)&self->_leadingStyleRequest, 0);
  objc_storeStrong((id *)&self->_hiddenPartIdentifier, 0);
}

@end
