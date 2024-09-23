@implementation CKUnavailableSatelliteForServiceChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKUnavailableSatelliteForServiceChatItem loadTranscriptText](self, "loadTranscriptText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
  v11 = v10;

  objc_msgSend(v8, "smallTranscriptSpace");
  v13 = v12;
  objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
  if (a4)
  {
    a4->top = v14;
    a4->left = v15;
    a4->bottom = v16;
    a4->right = v17;
  }
  v18 = v11 - v14 + v13 + v11 - v16;

  v19 = 0.0;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v30;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptRegularFontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (v8)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isGroupChat");
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v30 = (void *)v10;
    if ((void *)v10 == v12)
    {
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v15, v4);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      v24 = objc_alloc(MEMORY[0x1E0CB3778]);
      CKFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v11)
        v27 = CFSTR("GROUP_CHATS_SENDING_DISABLED");
      else
        v27 = CFSTR("IMESSAGE_SATELLITE_NOT_AVAILABLE");
      objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v24, "initWithString:attributes:", v28, v6);

    }
    else
    {
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v15, v4);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      v18 = objc_alloc(MEMORY[0x1E0CB3778]);
      CKFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v11)
        v21 = CFSTR("GROUP_CHATS_SENDING_DISABLED");
      else
        v21 = CFSTR("SMS_SATELLITE_NOT_AVAILABLE");
      objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v18, "initWithString:attributes:", v22, v6);

    }
    objc_msgSend(v16, "appendLocalizedFormat:", v17);
    objc_msgSend(v16, "appendLocalizedFormat:", v23);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)newComposeTranscriptTextForiMessage:(BOOL)a3 isGroupChat:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v4 = a4;
  v5 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriptEmphasizedFontAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transcriptRegularFontAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
    v12 = CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE");
  else
    v12 = CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS");
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v13, v7);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v16 = objc_alloc(MEMORY[0x1E0CB3778]);
  CKFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v4)
    v19 = CFSTR("GROUP_CHATS_SENDING_DISABLED");
  else
    v19 = CFSTR("IMESSAGE_SATELLITE_NOT_AVAILABLE");
  objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v16, "initWithString:attributes:", v20, v9);

  objc_msgSend(v14, "appendAttributedString:", v15);
  objc_msgSend(v14, "appendAttributedString:", v21);

  return v14;
}

@end
