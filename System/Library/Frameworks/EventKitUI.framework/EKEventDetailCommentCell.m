@implementation EKEventDetailCommentCell

- (EKEventDetailCommentCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  EKEventDetailCommentCell *v4;
  EKEventDetailCommentCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKEventDetailCommentCell;
  v4 = -[EKEventDetailCell initWithEvent:editable:style:](&v11, sel_initWithEvent_editable_style_, a3, a4, 1000);
  v5 = v4;
  if (v4)
  {
    -[EKEventDetailCommentCell editableTextField](v4, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReturnKeyType:", 9);

    -[EKEventDetailCommentCell editableTextField](v5, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClearButtonMode:", 1);

    -[EKEventDetailCommentCell editableTextField](v5, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 0);

    -[EKEventDetailCommentCell editableTextField](v5, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CalDisableFocusRingForView();

    -[EKEventDetailCommentCell setTextFieldOffset:](v5, "setTextFieldOffset:", 0.0);
    -[EKEventDetailCommentCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[EKEventDetailCommentCell setNeedsLayout](v5, "setNeedsLayout");
  }
  return v5;
}

- (BOOL)update
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = -[EKEventDetailCell isEditable](self, "isEditable");
  if (v3)
  {
    v3 = -[EKEvent allowsResponseCommentModifications](self->super._event, "allowsResponseCommentModifications");
    if (v3)
    {
      v4 = *MEMORY[0x1E0DC4A88];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailCommentCell editableTextField](self, "editableTextField");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v5);

      v7 = (void *)MEMORY[0x1E0D0CD90];
      -[EKEvent responseComment](self->super._event, "responseComment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithAutoCommentRemoved:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailCommentCell editableTextField](self, "editableTextField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

      v11 = objc_alloc(MEMORY[0x1E0CB3778]);
      EventKitUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Comment to Organizer"), &stru_1E601DFA8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithString:", v13);

      v15 = *MEMORY[0x1E0DC1138];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v14, "length"));

      v17 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAttribute:value:range:", v17, v18, 0, objc_msgSend(v14, "length"));

      -[EKEventDetailCommentCell editableTextField](self, "editableTextField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAttributedPlaceholder:", v14);

      -[EKEventDetailCommentCell setNeedsLayout](self, "setNeedsLayout");
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

@end
