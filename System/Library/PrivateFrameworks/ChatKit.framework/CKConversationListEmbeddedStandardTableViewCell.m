@implementation CKConversationListEmbeddedStandardTableViewCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CKConversationListEmbeddedStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKConversationListEmbeddedStandardTableViewCell *v4;
  CKConversationListEmbeddedStandardTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedStandardTableViewCell;
  v4 = -[CKConversationListStandardCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKConversationListStandardCell avatarView](v4, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAsynchronousRendering:", 1);

    -[CKConversationListStandardCell avatarView](v5, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsContactOnTap:", 0);

    -[CKConversationListStandardCell avatarView](v5, "avatarView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBypassActionValidation:", 1);

  }
  return v5;
}

- (CGRect)containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerBounds.origin.x;
  y = self->_containerBounds.origin.y;
  width = self->_containerBounds.size.width;
  height = self->_containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListEmbeddedStandardTableViewCell;
  -[CKConversationListStandardCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  id v6;
  int v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKConversationListEmbeddedStandardTableViewCell;
  -[CKConversationListEmbeddedStandardTableViewCell hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = CKIsRunningInMacCatalyst();
  if (!v7)
  {
    -[CKConversationListStandardCell avatarView](self, "avatarView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v4)
    {
      v4 = v6;
      v9 = v4;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[CKConversationListCell closeButton](self, "closeButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
    v9 = v6;
  else
    v9 = 0;

  if (!v7)
    goto LABEL_9;
LABEL_10:

  return v9;
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

@end
