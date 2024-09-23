@implementation CKBlackholeTranscriptCell

- (CKBlackholeTranscriptCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKBlackholeTranscriptCell *v4;
  CKBlackholeTranscriptCell *v5;
  void *v6;
  UILabel *v7;
  UILabel *fromLabel;
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
  UIDateLabel *v24;
  UIDateLabel *dateLabel;
  UIDateLabel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UILabel *v38;
  UILabel *bodyLabel;
  UILabel *v40;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)CKBlackholeTranscriptCell;
  v4 = -[CKBlackholeTranscriptCell initWithStyle:reuseIdentifier:](&v57, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKBlackholeTranscriptCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    fromLabel = v5->_fromLabel;
    v5->_fromLabel = v7;

    -[CKBlackholeTranscriptCell addSubview:](v5, "addSubview:", v5->_fromLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_fromLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextColor:](v5->_fromLabel, "setTextColor:", v6);
    v9 = v5->_fromLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversationListSenderFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v11);

    -[UILabel topAnchor](v5->_fromLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeTranscriptCell layoutMarginsGuide](v5, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UILabel leftAnchor](v5->_fromLabel, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeTranscriptCell layoutMarginsGuide](v5, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UILabel rightAnchor](v5->_fromLabel, "rightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeTranscriptCell layoutMarginsGuide](v5, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    v24 = (UIDateLabel *)objc_alloc_init(MEMORY[0x1E0CEA4E0]);
    dateLabel = v5->_dateLabel;
    v5->_dateLabel = v24;

    -[CKBlackholeTranscriptCell addSubview:](v5, "addSubview:", v5->_dateLabel);
    -[UIDateLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDateLabel setTextColor:](v5->_dateLabel, "setTextColor:", v6);
    v26 = v5->_dateLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "conversationListDateFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel setFont:](v26, "setFont:", v28);

    -[UIDateLabel topAnchor](v5->_dateLabel, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_fromLabel, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UIDateLabel leftAnchor](v5->_dateLabel, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leftAnchor](v5->_fromLabel, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[UIDateLabel rightAnchor](v5->_dateLabel, "rightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel rightAnchor](v5->_fromLabel, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    v38 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    bodyLabel = v5->_bodyLabel;
    v5->_bodyLabel = v38;

    -[CKBlackholeTranscriptCell addSubview:](v5, "addSubview:", v5->_bodyLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextColor:](v5->_bodyLabel, "setTextColor:", v6);
    v40 = v5->_bodyLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "conversationListSummaryFont");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v40, "setFont:", v42);

    -[UILabel setNumberOfLines:](v5->_bodyLabel, "setNumberOfLines:", 0);
    -[UILabel topAnchor](v5->_bodyLabel, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel bottomAnchor](v5->_dateLabel, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 16.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[UILabel leftAnchor](v5->_bodyLabel, "leftAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel leftAnchor](v5->_dateLabel, "leftAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    -[UILabel rightAnchor](v5->_bodyLabel, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel rightAnchor](v5->_dateLabel, "rightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    -[UILabel bottomAnchor](v5->_bodyLabel, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeTranscriptCell layoutMarginsGuide](v5, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBlackholeTranscriptCell;
  -[CKBlackholeTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_fromLabel, "setText:", 0);
  -[UIDateLabel setDate:](self->_dateLabel, "setDate:", 0);
  -[UILabel setText:](self->_bodyLabel, "setText:", 0);
}

- (void)configureForMessageItem:(id)a3 showSender:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UILabel *fromLabel;
  void *v8;
  UIDateLabel *dateLabel;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a4;
  v6 = a3;
  v18 = v6;
  if (v4)
  {
    fromLabel = self->_fromLabel;
    objc_msgSend(v6, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](fromLabel, "setText:", v8);

    v6 = v18;
  }
  dateLabel = self->_dateLabel;
  objc_msgSend(v6, "time", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDateLabel setDate:](dateLabel, "setDate:", v10);

  objc_msgSend(v19, "fileTransferGUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13 = v12;
  if (v11)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__CKBlackholeTranscriptCell_configureForMessageItem_showSender___block_invoke;
    v20[3] = &unk_1E27501B0;
    v21 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);

  }
  objc_msgSend(v19, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFD"), &stru_1E276D870);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_1E276D870);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v13, "appendString:", v17);
    -[UILabel setText:](self->_bodyLabel, "setText:", v13);
  }
  -[CKBlackholeTranscriptCell setNeedsLayout](self, "setNeedsLayout");

}

void __64__CKBlackholeTranscriptCell_configureForMessageItem_showSender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D35820];
  v4 = a2;
  objc_msgSend(v3, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsString:", CFSTR(".pluginPayloadAttachment")) & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  }

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

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_fromLabel, 0);
}

@end
