@implementation CKAcknowledgmentVoteCountCollectionReusableView

+ (id)reuseIdentifier
{
  return CFSTR("CKAcknowledgmentVoteCountCollectionReusableView_reuseIdentifier");
}

+ (id)supplementaryViewKind
{
  return CFSTR("CKAcknowledgmentVoteCountCollectionReusableView_supplementaryViewKind");
}

- (CKAcknowledgmentVoteCountCollectionReusableView)initWithFrame:(CGRect)a3
{
  CKAcknowledgmentVoteCountCollectionReusableView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKAcknowledgmentVoteCountCollectionReusableView;
  v3 = -[CKAcknowledgmentVoteCountCollectionReusableView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKAcknowledgmentVoteCountCollectionReusableView setCountLabel:](v3, "setCountLabel:", v5);

    -[CKAcknowledgmentVoteCountCollectionReusableView countLabel](v3, "countLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 2);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAcknowledgmentVoteCountCollectionReusableView countLabel](v3, "countLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageAcknowledgmentVoteCountFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAcknowledgmentVoteCountCollectionReusableView countLabel](v3, "countLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[CKAcknowledgmentVoteCountCollectionReusableView countLabel](v3, "countLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAcknowledgmentVoteCountCollectionReusableView addSubview:](v3, "addSubview:", v12);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKAcknowledgmentVoteCountCollectionReusableView;
  -[CKAcknowledgmentVoteCountCollectionReusableView layoutSubviews](&v12, sel_layoutSubviews);
  -[CKAcknowledgmentVoteCountCollectionReusableView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAcknowledgmentVoteCountCollectionReusableView countLabel](self, "countLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)configureWithAcknowledgmentTally:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAcknowledgmentVoteCountCollectionReusableView countLabel](self, "countLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[CKAcknowledgmentVoteCountCollectionReusableView layoutIfNeeded](self, "layoutIfNeeded");
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countLabel, 0);
}

@end
