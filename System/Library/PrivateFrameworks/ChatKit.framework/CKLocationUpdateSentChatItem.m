@implementation CKLocationUpdateSentChatItem

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKLocationUpdateSentChatItem imLocationUpdateSentChatItem](self, "imLocationUpdateSentChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMIsStringStewieRoadside())
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ROADSIDE_LOCATION_UPDATE_SENT"), &stru_1E276D870, CFSTR("ChatKit-Avocet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "roadsideProviderNameForChatIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_LOCATION_UPDATE_SENT"), &stru_1E276D870, CFSTR("ChatKit-SYDROB_FEATURES"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, 0);
  objc_msgSend(v13, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
  v14 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationShareActionIcon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v16);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertAttributedString:atIndex:", v17, 0);

  objc_msgSend(v13, "addAttributes:range:", v4, 0, objc_msgSend(v13, "length"));
  return v13;
}

@end
