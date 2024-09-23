@implementation CKVisionReplyListTranscriptCell

- (CKVisionReplyListTranscriptCell)initWithFrame:(CGRect)a3
{
  CKVisionReplyListTranscriptCell *v3;
  _TtC7ChatKit33QuickReplyButtonListConfiguration *v4;
  _TtC7ChatKit33QuickReplyButtonListConfiguration *configuration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKVisionReplyListTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(_TtC7ChatKit33QuickReplyButtonListConfiguration);
  configuration = v3->_configuration;
  v3->_configuration = v4;

  return v3;
}

- (void)setReplies:(id)a3
{
  NSArray **p_replies;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  UIView *listView;
  NSArray *v14;
  void *v15;
  UIView *v16;
  UIView *v17;
  void *v18;
  id v19;

  p_replies = &self->_replies;
  v19 = a3;
  if (!objc_msgSend(v19, "isEqual:", *p_replies)
    || ((-[UIView bounds](self->_listView, "bounds"),
         v7 = v6,
         v9 = v8,
         -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect"),
         v7 == v11)
      ? (v12 = v9 == v10)
      : (v12 = 0),
        !v12))
  {
    objc_storeStrong((id *)&self->_replies, a3);
    -[UIView removeFromSuperview](self->_listView, "removeFromSuperview");
    listView = self->_listView;
    self->_listView = 0;

    v14 = *p_replies;
    if (v14)
    {
      -[CKVisionReplyListTranscriptCell configuration](self, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[QuickReplyButtonListHelper makeListView:delegate:configurationObject:](_TtC7ChatKit26QuickReplyButtonListHelper, "makeListView:delegate:configurationObject:", v14, self, v15);
      v16 = (UIView *)objc_claimAutoreleasedReturnValue();
      v17 = self->_listView;
      self->_listView = v16;

      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", self->_listView);

      -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
      -[UIView setFrame:](self->_listView, "setFrame:");
    }
  }

}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKVisionReplyListTranscriptCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v12, sel_layoutSubviewsForAlignmentContents);
  if (CKIsRunningInMessagesNotificationExtension())
  {
    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v5 + 0.0, v7 + 0.0, v9 + -8.0, v11);
  }
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  -[UIView setFrame:](self->_listView, "setFrame:");
}

- (void)replyListButtonDidSelectReply:(id)a3 sourceView:(id)a4
{
  CKVisionReplyListTranscriptCellDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "replyListCell:didSelectReply:sourceView:", self, v8, v7);

}

- (NSArray)replies
{
  return self->_replies;
}

- (CKVisionReplyListTranscriptCellDelegate)delegate
{
  return (CKVisionReplyListTranscriptCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC7ChatKit33QuickReplyButtonListConfiguration)configuration
{
  return self->_configuration;
}

- (UIView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replies, 0);
}

@end
