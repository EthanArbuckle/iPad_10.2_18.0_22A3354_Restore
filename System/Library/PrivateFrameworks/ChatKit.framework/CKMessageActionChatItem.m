@implementation CKMessageActionChatItem

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v41;
  void *v42;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptRegularFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptEmphasizedFontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageActionChatItem sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageActionChatItem handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SOMEONE"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SOMEONE"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = -[CKMessageActionChatItem actionType](self, "actionType");
  if (v17 != 2)
  {
    if (v17 == 1)
    {
      CKFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("VIDEO_SAVE_ACTION");
    }
    else
    {
      if (v17)
      {
        v25 = 0;
        if (v7)
          goto LABEL_18;
LABEL_21:
        CKFrameworkBundle();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MESSAGE_YOU_SAVE_ACTION_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        CKAttributedFormatString(v4, v6, v28, v29, v30, v31, v32, v33, (uint64_t)v25);
        goto LABEL_24;
      }
      CKFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("AUDIO_SAVE_ACTION");
    }
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E276D870, CFSTR("ChatKit"));
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "balloonBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "dataSourceClassForBundleID:", v19);

    if (v23)
    {
      objc_msgSend(v23, "previewSummaryForPluginBundle:", v19);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v25 = (void *)v24;
      goto LABEL_17;
    }
    CKFrameworkBundle();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("A_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CKFrameworkBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("A_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!_IMWillLog())
      goto LABEL_17;
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();
  }

LABEL_17:
  if (!v7)
    goto LABEL_21;
LABEL_18:
  CKFrameworkBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v8)
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SAVE_ACTION_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  else
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SAVE_YOU_ACTION_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttributedFormatString(v4, v6, v28, v34, v35, v36, v37, v38, (uint64_t)v11);
LABEL_24:
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (int64_t)actionType
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "actionType");

  return v3;
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

- (id)handle
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "otherHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
