@implementation CKBlockContactChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.width, a3.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smallTranscriptSpace");
  v31 = v8;
  objc_msgSend(v7, "transcriptBoldTextAlignmentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = width - (v11 + v15);
  -[CKBlockContactChatItem loadTranscriptText](self, "loadTranscriptText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "boundingRectWithSize:options:context:", 1, 0, v17, 1.79769313e308);
  v20 = v19;

  +[CKTranscriptBlockContactCell blockContactButton](CKTranscriptBlockContactCell, "blockContactButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlockContactChatItem transcriptButtonText](self, "transcriptButtonText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedTitle:forState:", v22, 0);

  objc_msgSend(v21, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeThatFits:", v17, 1.79769313e308);
  v25 = v24;

  objc_msgSend(v7, "transcriptButtonContentEdgeInsets");
  if (a4)
  {
    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  v28 = fmax(v31 - (v14 + v10), 0.0) + v20 + v25 + v26 + v27;

  v29 = width;
  v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (id)loadTranscriptText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  IMSharedUtilitiesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GET_HELP_STATUS"), &stru_1E276D870, CFSTR("CommSafetyLocalizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEmphasizedFontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, v5);
  return v6;
}

- (NSAttributedString)transcriptButtonText
{
  void *v3;
  void *v4;
  NSAttributedString *transcriptButtonText;
  void *v6;
  void *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;
  NSAttributedString *v10;

  IMSharedUtilitiesFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GET_HELP_BUTTON_TITLE"), &stru_1E276D870, CFSTR("CommSafetyLocalizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  transcriptButtonText = self->_transcriptButtonText;
  if (!transcriptButtonText)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerTranscriptButtonTextAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v7);
    v9 = self->_transcriptButtonText;
    self->_transcriptButtonText = v8;

    transcriptButtonText = self->_transcriptButtonText;
  }
  v10 = transcriptButtonText;

  return v10;
}

- (void)setTranscriptButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptButtonText, 0);
}

- (unint64_t)layoutType
{
  return 21;
}

@end
