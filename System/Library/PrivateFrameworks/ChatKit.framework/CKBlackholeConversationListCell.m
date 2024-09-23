@implementation CKBlackholeConversationListCell

- (CKBlackholeConversationListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKBlackholeConversationListCell *v4;
  CKBlackholeConversationListCell *v5;
  UILabel *v6;
  UILabel *fromLabel;
  void *v8;
  UILabel *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIDateLabel *v27;
  UIDateLabel *dateLabel;
  void *v29;
  UIDateLabel *v30;
  void *v31;
  void *v32;
  UIDateLabel *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CKBlackholeConversationListCell;
  v4 = -[CKBlackholeConversationListCell initWithStyle:reuseIdentifier:](&v52, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKBlackholeConversationListCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[CKBlackholeConversationListCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    fromLabel = v5->_fromLabel;
    v5->_fromLabel = v6;

    -[CKBlackholeConversationListCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_fromLabel);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_fromLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = v5->_fromLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversationListSummaryFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v11);

    -[UILabel topAnchor](v5->_fromLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UILabel leftAnchor](v5->_fromLabel, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UILabel rightAnchor](v5->_fromLabel, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    v27 = (UIDateLabel *)objc_alloc_init(MEMORY[0x1E0CEA4E0]);
    dateLabel = v5->_dateLabel;
    v5->_dateLabel = v27;

    -[CKBlackholeConversationListCell contentView](v5, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v5->_dateLabel);

    -[UIDateLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = v5->_dateLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "conversationListDateFont");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel setFont:](v30, "setFont:", v32);

    v33 = v5->_dateLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "theme");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "conversationListSummaryColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel setTextColor:](v33, "setTextColor:", v36);

    -[UIDateLabel topAnchor](v5->_dateLabel, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_fromLabel, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[UIDateLabel leftAnchor](v5->_dateLabel, "leftAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leftAnchor](v5->_fromLabel, "leftAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[UIDateLabel rightAnchor](v5->_dateLabel, "rightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel rightAnchor](v5->_fromLabel, "rightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[UIDateLabel bottomAnchor](v5->_dateLabel, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCell contentView](v5, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBlackholeConversationListCell;
  -[CKBlackholeConversationListCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_fromLabel, "setText:", 0);
  -[UIDateLabel setDate:](self->_dateLabel, "setDate:", 0);
}

- (void)configureForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "rawAddressedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_fromLabel, "setText:", v5);

  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDateLabel setDate:](self->_dateLabel, "setDate:", v6);
  -[CKBlackholeConversationListCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)fromLabel
{
  return self->_fromLabel;
}

- (void)setFromLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fromLabel, a3);
}

- (UIDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_fromLabel, 0);
}

@end
