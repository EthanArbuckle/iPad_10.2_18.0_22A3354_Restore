@implementation CKConversationListCollectionViewToolbar

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)CKConversationListCollectionViewToolbar;
  -[CKConversationListCollectionViewToolbar sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (-[CKConversationListCollectionViewToolbar shouldExpandHeight](self, "shouldExpandHeight"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expandedToolbarHeightForMiiC");
    v7 = v9;

  }
  v10 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)expandHeight
{
  -[CKConversationListCollectionViewToolbar setShouldExpandHeight:](self, "setShouldExpandHeight:", 1);
  -[CKConversationListCollectionViewToolbar sizeToFit](self, "sizeToFit");
}

- (void)contractHeight
{
  -[CKConversationListCollectionViewToolbar setShouldExpandHeight:](self, "setShouldExpandHeight:", 0);
  -[CKConversationListCollectionViewToolbar sizeToFit](self, "sizeToFit");
}

- (BOOL)shouldExpandHeight
{
  return self->_shouldExpandHeight;
}

- (void)setShouldExpandHeight:(BOOL)a3
{
  self->_shouldExpandHeight = a3;
}

@end
