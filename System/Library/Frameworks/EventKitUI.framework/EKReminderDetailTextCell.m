@implementation EKReminderDetailTextCell

- (EKReminderDetailTextCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 showExtraSpaceAtBottom:(BOOL)a6 allowDataDetector:(BOOL)a7 title:(id)a8 textFromEventAndReminderBlock:(id)a9
{
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id, id);
  EKReminderDetailTextCell *v19;
  EKReminderDetailTextCell *v20;
  void *v21;
  objc_super v23;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = (void (**)(id, id, id))a9;
  v23.receiver = self;
  v23.super_class = (Class)EKReminderDetailTextCell;
  v19 = -[EKEventDetailCell initWithEvent:editable:](&v23, sel_initWithEvent_editable_, v15, v12);
  v20 = v19;
  if (v19)
  {
    -[EKReminderDetailTextCell commonSetupCellWithTitle:showExtraSpaceAtBottom:](v19, "commonSetupCellWithTitle:showExtraSpaceAtBottom:", v17, v11);
    -[UITextView setDataDetectorTypes:](v20->_textView, "setDataDetectorTypes:", v10 << 63 >> 63);
    v18[2](v18, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setText:](v20->_textView, "setText:", v21);

  }
  return v20;
}

- (EKReminderDetailTextCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 showExtraSpaceAtBottom:(BOOL)a6 title:(id)a7 attributedText:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  EKReminderDetailTextCell *v15;
  EKReminderDetailTextCell *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a6;
  v10 = a5;
  v13 = a7;
  v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)EKReminderDetailTextCell;
  v15 = -[EKEventDetailCell initWithEvent:editable:](&v20, sel_initWithEvent_editable_, a3, v10);
  v16 = v15;
  if (v15)
  {
    -[EKReminderDetailTextCell commonSetupCellWithTitle:showExtraSpaceAtBottom:](v15, "commonSetupCellWithTitle:showExtraSpaceAtBottom:", v13, v9);
    -[UITextView setAttributedText:](v16->_textView, "setAttributedText:", v14);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v16->_textView, "setTextColor:", v17);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v16->_textView, "setFont:", v18);

  }
  return v16;
}

- (void)commonSetupCellWithTitle:(id)a3 showExtraSpaceAtBottom:(BOOL)a4
{
  id v5;
  UILabel *v6;
  UILabel *title;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  UITextView *textView;
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
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  _QWORD v56[9];

  v55 = a4;
  v56[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[EKReminderDetailTextCell setSeparatorStyle:](self, "setSeparatorStyle:", 0);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  title = self->_title;
  self->_title = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4A98], 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_title, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_title, "setTextColor:", v9);

  -[UILabel setText:](self->_title, "setText:", v5);
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_title);

  v11 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
  textView = self->_textView;
  self->_textView = v11;

  -[UITextView textLayoutManager](self->_textView, "textLayoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLimitsLayoutForSuspiciousContents:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v14);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView textContainer](self->_textView, "textContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaximumNumberOfLines:", 7);

  -[UITextView textContainer](self->_textView, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLineBreakMode:", 4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v17);

  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 4.0, 0.0, 0.0, 0.0);
  -[UITextView textContainer](self->_textView, "textContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineFragmentPadding:", 0.0);

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_textView, "setFont:", v19);

  -[EKReminderDetailTextCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_textView);

  v41 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_title, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "layoutMarginsGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 6.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v50;
  -[UILabel trailingAnchor](self->_title, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layoutMarginsGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, -6.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v45;
  -[UITextView leadingAnchor](self->_textView, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v40, 6.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v39;
  -[UITextView trailingAnchor](self->_textView, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v35, -6.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v34;
  -[UILabel topAnchor](self->_title, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v21, 15.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v22;
  -[UITextView topAnchor](self->_textView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_title, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v25;
  -[UITextView bottomAnchor](self->_textView, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderDetailTextCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -15.0;
  if (!v55)
    v29 = 0.0;
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activateConstraints:", v31);

}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKReminderDetailTextCell;
  -[EKReminderDetailTextCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
