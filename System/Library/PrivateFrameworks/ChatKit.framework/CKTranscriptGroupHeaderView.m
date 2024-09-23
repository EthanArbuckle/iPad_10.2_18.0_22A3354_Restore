@implementation CKTranscriptGroupHeaderView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptGroupHeaderView;
  -[CKTranscriptGroupHeaderView dealloc](&v4, sel_dealloc);
}

- (CKTranscriptGroupHeaderView)initWithFrame:(CGRect)a3 conversation:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKTranscriptGroupHeaderView *v10;
  CKTranscriptGroupHeaderView *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CKTranscriptGroupHeaderView;
  v10 = -[CKTranscriptGroupHeaderView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[CKTranscriptGroupHeaderView setConversation:](v10, "setConversation:", v9);
    -[CKTranscriptGroupHeaderView setAutoresizingMask:](v11, "setAutoresizingMask:", 2);
    -[CKTranscriptGroupHeaderView setAutoresizesSubviews:](v11, "setAutoresizesSubviews:", 0);
    v12 = objc_alloc(MEMORY[0x1E0CEAC68]);
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = (void *)objc_msgSend(v12, "initWithFrame:privateStyle:", 2010, *MEMORY[0x1E0C9D648], v14, v15, v16);
    -[CKTranscriptGroupHeaderView setBackdropView:](v11, "setBackdropView:", v17);
    -[CKTranscriptGroupHeaderView addSubview:](v11, "addSubview:", v17);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D136B8]), "initWithFrame:", v13, v14, v15, v16);
    objc_msgSend(v18, "setBackgroundColor:", 0);
    objc_msgSend(v18, "setAutoresizingMask:", 18);
    CKFrameworkBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E276D870, CFSTR("ChatKit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLabel:", v20);

    objc_msgSend(v18, "addButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 1);

    objc_msgSend(v18, "setSeparatorHidden:", 1);
    objc_msgSend(v18, "setEditable:", 0);
    objc_msgSend(v18, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInactiveTextColor:", v22);

    -[CKTranscriptGroupHeaderView setTextView:](v11, "setTextView:", v18);
    -[CKTranscriptGroupHeaderView addSubview:](v11, "addSubview:", v18);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v14, v15, v16);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "theme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entryFieldDividerColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v26);

    -[CKTranscriptGroupHeaderView setSeparator:](v11, "setSeparator:", v23);
    -[CKTranscriptGroupHeaderView addSubview:](v11, "addSubview:", v23);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", 0);
    -[CKTranscriptGroupHeaderView setActionButton:](v11, "setActionButton:", v27);
    -[CKTranscriptGroupHeaderView addSubview:](v11, "addSubview:", v27);

  }
  return v11;
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKTranscriptGroupHeaderView;
  -[CKTranscriptGroupHeaderView layoutSubviews](&v18, sel_layoutSubviews);
  -[CKTranscriptGroupHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptGroupHeaderView backdropView](self, "backdropView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKTranscriptGroupHeaderView textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[CKTranscriptGroupHeaderView actionButton](self, "actionButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  if (CKPixelWidth_once_16 != -1)
    dispatch_once(&CKPixelWidth_once_16, &__block_literal_global_209);
  v14 = *(double *)&CKPixelWidth_sPixel_16;
  -[CKTranscriptGroupHeaderView bounds](self, "bounds");
  v16 = v15;
  -[CKTranscriptGroupHeaderView separator](self, "separator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v4, v16, v8, v14);

}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CNComposeRecipientTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
