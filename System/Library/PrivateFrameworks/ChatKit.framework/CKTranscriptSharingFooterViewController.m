@implementation CKTranscriptSharingFooterViewController

- (CKTranscriptSharingFooterViewController)initWithChatController:(id)a3
{
  id v5;
  CKTranscriptSharingFooterViewController *v6;
  CKTranscriptSharingFooterViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptSharingFooterViewController;
  v6 = -[CKTranscriptSharingFooterViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_chatController, a3);

  return v7;
}

- (void)loadView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  CKTranscriptSharingFooterViewController *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (v4)
  {
    v56.receiver = self;
    v56.super_class = (Class)CKTranscriptSharingFooterViewController;
    -[CKTranscriptSharingFooterViewController loadView](&v56, sel_loadView);
    -[CKCoreChatController conversation](self->_chatController, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emergencyUserHandle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKCoreChatController conversation](self->_chatController, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "displayNameForChat:", v8);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TS_DESCRIPTION_INPUT_DISABLED_DESCRIPTION"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v53);
    v12 = objc_alloc(MEMORY[0x1E0CB3778]);
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TS_DESCRIPTION_INPUT_DISABLED_TITLE"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *MEMORY[0x1E0DC1138];
    v15 = v57;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transcriptFooterNoteTitleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v17;
    v58 = *MEMORY[0x1E0DC1140];
    v18 = v58;
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v57, 2);
    v51 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v12, "initWithString:attributes:", v14, v20);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addAttribute:value:range:", v18, v21, 0, objc_msgSend(v50, "length"));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transcriptFooterNoteBodyFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addAttribute:value:range:", v15, v23, 0, objc_msgSend(v50, "length"));

    v24 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v24, "appendAttributedString:", v52);
    v25 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v25, "appendAttributedString:", v50);
    -[CKChatController view](v51->_chatController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v28 = v27;
    v30 = v29;

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB18]), "initWithFrame:", 0.0, 0.0, v28, v30);
    objc_msgSend(v31, "setScrollEnabled:", 0);
    objc_msgSend(v31, "setEditable:", 0);
    objc_msgSend(v31, "setUserInteractionEnabled:", 1);
    objc_msgSend(v31, "textDragInteraction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEnabled:", 0);

    objc_msgSend(v31, "setAttributedText:", v24);
    objc_msgSend(v31, "setBackgroundColor:", 0);
    objc_msgSend(v31, "setTextContainerInset:", 16.0, 20.0, 0.0, 20.0);
    objc_msgSend(v31, "sizeToFit");
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB18]), "initWithFrame:", 0.0, 0.0, v28, v30);
    objc_msgSend(v33, "setScrollEnabled:", 0);
    objc_msgSend(v33, "setEditable:", 0);
    objc_msgSend(v33, "setUserInteractionEnabled:", 1);
    objc_msgSend(v33, "textDragInteraction");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setEnabled:", 0);

    objc_msgSend(v33, "setAttributedText:", v25);
    objc_msgSend(v33, "setBackgroundColor:", 0);
    objc_msgSend(v31, "frame");
    objc_msgSend(v33, "setTextContainerInset:", v35, 20.0, 0.0, 20.0);
    objc_msgSend(v33, "sizeToFit");
    objc_msgSend(v33, "setSelectable:", 0);
    objc_msgSend(v33, "_setInteractiveTextSelectionDisabled:", 1);
    v36 = objc_alloc(MEMORY[0x1E0CEAB20]);
    v37 = (void *)objc_msgSend(v36, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTranslucent:", objc_msgSend(v38, "shouldUseTranslucentBars"));

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "theme");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBarStyle:", objc_msgSend(v40, "defaultBarStyle"));

    objc_msgSend(v37, "setAutoresizingMask:", 10);
    objc_msgSend(v37, "sizeToFit");
    objc_msgSend(v37, "addSubview:", v31);
    objc_msgSend(v37, "addSubview:", v33);
    objc_msgSend(v37, "frame");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    objc_msgSend(v31, "frame");
    v48 = v47;
    objc_msgSend(v33, "frame");
    objc_msgSend(v37, "setFrame:", v42, v44, v46, v48 + v49);
    -[CKTranscriptSharingFooterViewController setView:](v51, "setView:", v37);

  }
}

- (CKChatController)chatController
{
  return self->_chatController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatController, 0);
}

@end
