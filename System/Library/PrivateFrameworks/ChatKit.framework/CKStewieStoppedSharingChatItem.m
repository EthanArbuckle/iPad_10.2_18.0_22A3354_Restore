@implementation CKStewieStoppedSharingChatItem

- (unint64_t)layoutType
{
  return 20;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  if (a4 < 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a5, "objectAtIndex:", a4 - 1, a7.width, a7.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediumTranscriptSpace");
  v11 = v10;

  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v8, v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)loadTranscriptText
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKStewieStoppedSharingChatItem _transcriptText](self, "_transcriptText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &stru_1E276D870;
  if (v2)
    v4 = (__CFString *)v2;
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriptEmphasizedFontAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v7);
  return v8;
}

- (id)_transcriptText
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
  void *v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (v4)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayNameForChat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TS_STOPPED_SHARING_NOTICE"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_1E276D870;
  }
  return v13;
}

@end
