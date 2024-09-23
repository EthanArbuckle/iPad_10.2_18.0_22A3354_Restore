@implementation CKConversationListNewMessageCollectionViewCell

+ (id)reuseIdentifier
{
  return +[CKConversationListNewMessageCell identifier](CKConversationListNewMessageCell, "identifier");
}

+ (Class)embeddedTableViewCellClass
{
  return (Class)objc_opt_class();
}

- (CKConversationListNewMessageCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKConversationListNewMessageCollectionViewCell *v3;
  CKConversationListNewMessageCollectionViewCell *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKConversationListNewMessageCollectionViewCell;
  v3 = -[CKConversationListEmbeddedCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKConversationListNewMessageCollectionViewCell embeddedNewMessageTableViewCell](v3, "embeddedNewMessageTableViewCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showsHoverToDeleteButtonForNewCompose");

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel_didHoverOverCell_);
      -[CKConversationListNewMessageCollectionViewCell addGestureRecognizer:](v4, "addGestureRecognizer:", v8);

    }
  }
  return v4;
}

- (void)didHoverOverCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListNewMessageCollectionViewCell embeddedNewMessageTableViewCell](self, "embeddedNewMessageTableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didHoverOverCell:", v4);

}

- (void)updateFontSize
{
  id v2;

  -[CKConversationListNewMessageCollectionViewCell embeddedNewMessageTableViewCell](self, "embeddedNewMessageTableViewCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFontSize");

}

- (void)updateContentsForConversation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateContentsForConversation:", v6);

  }
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKConversationListNewMessageCollectionViewCell delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthForDeterminingAvatarVisibility");
  v4 = v3;

  return v4;
}

- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CKConversationListNewMessageCollectionViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedDeleteButtonForConversation:inCell:", v5, self);

}

- (CKConversationListCollectionViewCellDelegate)delegate
{
  return (CKConversationListCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
