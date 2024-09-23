@implementation _CKAcknowledgmentVoteCountView

- (_CKAcknowledgmentVoteCountView)initWithFrame:(CGRect)a3
{
  _CKAcknowledgmentVoteCountView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_CKAcknowledgmentVoteCountView;
  v3 = -[_CKAcknowledgmentVoteCountView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_CKAcknowledgmentVoteCountView setVoteCountLabel:](v3, "setVoteCountLabel:", v5);

    -[_CKAcknowledgmentVoteCountView voteCountLabel](v3, "voteCountLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 2);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageAcknowledgmentVotingTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgmentVoteCountView voteCountLabel](v3, "voteCountLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageAcknowledgmentVoteCountFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgmentVoteCountView voteCountLabel](v3, "voteCountLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v12);

    -[_CKAcknowledgmentVoteCountView voteCountLabel](v3, "voteCountLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgmentVoteCountView addSubview:](v3, "addSubview:", v14);

    v15 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[_CKAcknowledgmentVoteCountView setAckIconImageView:](v3, "setAckIconImageView:", v15);

    -[_CKAcknowledgmentVoteCountView ackIconImageView](v3, "ackIconImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentMode:", 4);

    -[_CKAcknowledgmentVoteCountView ackIconImageView](v3, "ackIconImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgmentVoteCountView addSubview:](v3, "addSubview:", v17);

  }
  return v3;
}

- (void)configureWithAcknowledgmentTally:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (void *)MEMORY[0x1E0CEA638];
  v5 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "largeMessageAcknowledgmentPollingImageNameForAcknowledgmentType:", objc_msgSend(v5, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ckTemplateImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgmentVoteCountView ackIconImageView](self, "ackIconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageAcknowledgment:acknowledgmentImageColor:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgmentVoteCountView ackIconImageView](self, "ackIconImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v12);

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "contacts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", CFSTR("%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgmentVoteCountView voteCountLabel](self, "voteCountLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  -[_CKAcknowledgmentVoteCountView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)_CKAcknowledgmentVoteCountView;
  -[_CKAcknowledgmentVoteCountView sizeThatFits:](&v13, sel_sizeThatFits_);
  v7 = v6;
  -[_CKAcknowledgmentVoteCountView voteCountLabel](self, "voteCountLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;

  v11 = v10 + 30.0;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Width;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v38.receiver = self;
  v38.super_class = (Class)_CKAcknowledgmentVoteCountView;
  -[_CKAcknowledgmentVoteCountView layoutSubviews](&v38, sel_layoutSubviews);
  -[_CKAcknowledgmentVoteCountView sizeToFit](self, "sizeToFit");
  -[_CKAcknowledgmentVoteCountView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_CKAcknowledgmentVoteCountView ackIconImageView](self, "ackIconImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  v39.origin.x = v4;
  v36 = v4;
  v37 = v6;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  Width = CGRectGetWidth(v39);
  v40.size.width = 30.0;
  v40.size.height = 30.0;
  v40.origin.x = v13;
  v40.origin.y = v15;
  v17 = Width - CGRectGetWidth(v40) + -5.0;
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  v18 = CGRectGetHeight(v41) * 0.5;
  v42.size.width = 30.0;
  v42.size.height = 30.0;
  v42.origin.x = v17;
  v42.origin.y = v15;
  v19 = v18 - CGRectGetHeight(v42) * 0.5;
  -[_CKAcknowledgmentVoteCountView ackIconImageView](self, "ackIconImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, v19, 30.0, 30.0);

  -[_CKAcknowledgmentVoteCountView voteCountLabel](self, "voteCountLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeToFit");

  -[_CKAcknowledgmentVoteCountView voteCountLabel](self, "voteCountLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v43.size.width = 30.0;
  v43.size.height = 30.0;
  v43.origin.x = v17;
  v43.origin.y = v19;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v24;
  v44.origin.y = v26;
  v44.size.width = v28;
  v44.size.height = v30;
  v32 = MinX - CGRectGetWidth(v44);
  v45.origin.x = v36;
  v45.origin.y = v37;
  v45.size.width = v8;
  v45.size.height = v10;
  v33 = CGRectGetHeight(v45) * 0.5;
  v46.origin.x = v32;
  v46.origin.y = v26;
  v46.size.width = v28;
  v46.size.height = v30;
  v34 = v33 - CGRectGetHeight(v46) * 0.5;
  -[_CKAcknowledgmentVoteCountView voteCountLabel](self, "voteCountLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v32, v34, v28, v30);

}

- (UILabel)voteCountLabel
{
  return self->_voteCountLabel;
}

- (void)setVoteCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_voteCountLabel, a3);
}

- (UIImageView)ackIconImageView
{
  return self->_ackIconImageView;
}

- (void)setAckIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_ackIconImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackIconImageView, 0);
  objc_storeStrong((id *)&self->_voteCountLabel, 0);
}

@end
