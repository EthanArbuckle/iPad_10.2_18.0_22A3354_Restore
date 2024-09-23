@implementation CKConversationListEmbeddedNewMessageTableViewCell

- (CKConversationListEmbeddedNewMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKConversationListEmbeddedNewMessageTableViewCell *v4;
  CKConversationListEmbeddedNewMessageTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKConversationListEmbeddedNewMessageTableViewCell;
  v4 = -[CKConversationListNewMessageCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CKConversationListEmbeddedNewMessageTableViewCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedNewMessageTableViewCell;
  -[CKConversationListEmbeddedNewMessageTableViewCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListNewMessageCell closeButton](self, "closeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

@end
