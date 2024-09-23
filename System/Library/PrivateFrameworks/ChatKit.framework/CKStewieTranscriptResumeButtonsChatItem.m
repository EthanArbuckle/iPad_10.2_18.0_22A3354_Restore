@implementation CKStewieTranscriptResumeButtonsChatItem

- (Class)cellClass
{
  -[CKStewieTranscriptResumeButtonsChatItem isEmergency](self, "isEmergency");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  -[objc_class heightForChatItem:fittingSize:](-[CKStewieTranscriptResumeButtonsChatItem cellClass](self, "cellClass"), "heightForChatItem:fittingSize:", self, width, height);
  v18 = v17;
  v19 = width;
  result.height = v18;
  result.width = v19;
  return result;
}

- (id)chatIdentifier
{
  void *v2;
  void *v3;

  -[CKStewieTranscriptResumeButtonsChatItem imStewieResumeItem](self, "imStewieResumeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEmergency
{
  void *v2;
  char v3;

  -[CKStewieTranscriptResumeButtonsChatItem chatIdentifier](self, "chatIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = IMIsStringStewieEmergency();

  return v3;
}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[CKStewieTranscriptResumeButtonsChatItem isEmergency](self, "isEmergency");
  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = CFSTR("CALL_EMERGENCY_SERVICES_IF_YOU_NEED_HELP");
    v10 = CFSTR("ChatKit-SYDROB_FEATURES");
  }
  else
  {
    v9 = CFSTR("SATELLITE_CONNECTION_ENDED");
    v10 = CFSTR("ChatKit-Avocet");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E276D870, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithString:attributes:", v11, v4);

  return v12;
}

- (BOOL)shouldShowStewieTextButton
{
  BOOL v2;
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  v2 = -[CKStewieTranscriptResumeButtonsChatItem isEmergency](self, "isEmergency");
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = objc_msgSend(v3, "shouldShowTextEmergencyServicesButton");
  else
    v5 = objc_msgSend(v3, "shouldShowTextRoadsideProviderButton");
  v6 = v5;

  return v6;
}

@end
