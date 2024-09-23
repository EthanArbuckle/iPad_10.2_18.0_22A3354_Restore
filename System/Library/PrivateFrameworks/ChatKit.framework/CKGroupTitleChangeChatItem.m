@implementation CKGroupTitleChangeChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  __CFString *v55;
  id v56;
  id v57;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptRegularFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptEmphasizedFontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transcriptGroupModificationErrorRegularFontAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transcriptGroupModificationErrorEmphasizedFontAttributes");
  v10 = objc_claimAutoreleasedReturnValue();

  if (-[CKGroupTitleChangeChatItem failed](self, "failed"))
    v11 = v8;
  else
    v11 = v4;
  v57 = v11;
  v54 = (void *)v10;
  if (-[CKGroupTitleChangeChatItem failed](self, "failed"))
    v12 = (void *)v10;
  else
    v12 = v6;
  v56 = v12;
  -[CKGroupTitleChangeChatItem sender](self, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = &stru_1E276D870;
  v55 = v16;

  -[CKGroupTitleChangeChatItem title](self, "title");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = &stru_1E276D870;
  v20 = v19;

  v21 = -[__CFString length](v20, "length");
  CKFrameworkBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v13)
  {
    if (v21)
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    else
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("GROUP_REMOVE_NAME_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v57, v56, v24, v30, v31, v32, v33, v34, (uint64_t)v55);
  }
  else if (v21)
  {
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("GROUP_YOU_NAME_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v57, v56, v24, v25, v26, v27, v28, v29, (uint64_t)v20);
  }
  else
  {
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("GROUP_YOU_REMOVE_NAME_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v57, v56, v24, v48, v49, v50, v51, v52, 0);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKGroupTitleChangeChatItem failed](self, "failed"))
  {
    v36 = (void *)MEMORY[0x1E0CEA650];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "transcriptLightFont");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "configurationWithFont:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v53 = v6;
    v41 = v4;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "imageWithTintColor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v44, "setImage:", v43);
    objc_msgSend(MEMORY[0x1E0CB3778], "attributedStringWithAttachment:attributes:", v44, v8);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v45, "appendAttributedString:", v46);

    objc_msgSend(v45, "appendAttributedString:", v35);
    v4 = v41;
    v6 = v53;

  }
  else
  {
    v45 = v35;
  }

  return v45;
}

- (BOOL)failed
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "failed");

  return v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)errorText
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_CHANGE_ERROR_ALERT_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
