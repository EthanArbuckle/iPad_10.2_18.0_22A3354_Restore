@implementation CKGroupAcknowledgmentVotingAccessoryView

- (CKGroupAcknowledgmentVotingAccessoryView)initWithFrame:(CGRect)a3 chatItem:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKGroupAcknowledgmentVotingViewController *v10;
  void *v11;
  CKGroupAcknowledgmentVotingViewController *v12;
  void *v13;
  CKGroupAcknowledgmentVotingAccessoryView *v14;
  void *v15;
  void *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v9 = a4;
  v10 = [CKGroupAcknowledgmentVotingViewController alloc];
  objc_msgSend(v9, "aggregateAcknowledgmentChatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CKGroupAcknowledgmentVotingViewController initWithMessagePartChatItem:](v10, "initWithMessagePartChatItem:", v11);
  -[CKGroupAcknowledgmentVotingViewController view](v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, width, height);

  v23.receiver = self;
  v23.super_class = (Class)CKGroupAcknowledgmentVotingAccessoryView;
  v18 = xmmword_18E7CB750;
  v19 = 1;
  v14 = -[_UIContextMenuAccessoryView initWithFrame:configuration:](&v23, sel_initWithFrame_configuration_, &v18, x, y, width, height);
  if (v14)
  {
    -[CKGroupAcknowledgmentVotingViewController view](v12, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKGroupAcknowledgmentVotingAccessoryView addSubview:](v14, "addSubview:", v15);

    -[CKGroupAcknowledgmentVotingAccessoryView setVotingViewController:](v14, "setVotingViewController:", v12);
    -[CKGroupAcknowledgmentVotingAccessoryView votingViewController](v14, "votingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewWillAppear:", 0);

  }
  return v14;
}

- (CKGroupAcknowledgmentVotingViewController)votingViewController
{
  return self->_votingViewController;
}

- (void)setVotingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_votingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_votingViewController, 0);
}

@end
