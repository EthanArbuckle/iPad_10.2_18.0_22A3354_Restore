@implementation CKSendMenuPopoverPresentationControllerAnchorItem

- (CKSendMenuPopoverPresentationControllerAnchorItem)initWithView:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  CKSendMenuPopoverPresentationControllerAnchorItem *v11;
  CKSendMenuPopoverPresentationControllerAnchorItem *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKSendMenuPopoverPresentationControllerAnchorItem;
  v11 = -[CKSendMenuPopoverPresentationControllerAnchorItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_anchorRect.origin.x = x;
    v11->_anchorRect.origin.y = y;
    v11->_anchorRect.size.width = width;
    v11->_anchorRect.size.height = height;
    objc_storeStrong((id *)&v11->_anchorView, a3);
  }

  return v12;
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
  objc_storeStrong((id *)&self->_anchorView, a3);
}

- (CGRect)anchorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_anchorRect.origin.x;
  y = self->_anchorRect.origin.y;
  width = self->_anchorRect.size.width;
  height = self->_anchorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorView, 0);
}

@end
