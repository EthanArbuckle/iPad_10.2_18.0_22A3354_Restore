@implementation CKLocationShareActionChatItem

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKLocationShareActionChatItem sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareActionChatItem handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E276D870;
  if (v7)
    v10 = (__CFString *)v7;
  else
    v10 = &stru_1E276D870;
  v11 = v10;

  objc_msgSend(v6, "name");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = &stru_1E276D870;
  v15 = v14;

  v16 = -[CKLocationShareActionChatItem actionType](self, "actionType");
  v17 = -[CKLocationShareActionChatItem direction](self, "direction");
  if (v16 != 1)
  {
    if (v16)
      goto LABEL_23;
    if (v17 != 1)
    {
      if (v17)
        goto LABEL_23;
      v18 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("LOCATION_YOU_START_STATUS");
      goto LABEL_15;
    }
    v23 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v25 = CFSTR("LOCATION_START_YOU_STATUS");
LABEL_18:
    objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_1E276D870, CFSTR("ChatKit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v22, v11);
    goto LABEL_19;
  }
  if (v17 == 1)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v25 = CFSTR("LOCATION_STOP_YOU_STATUS");
    goto LABEL_18;
  }
  if (v17)
    goto LABEL_23;
  v18 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = CFSTR("LOCATION_YOU_STOP_STATUS");
LABEL_15:
  objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1E276D870, CFSTR("ChatKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v22, v15);
LABEL_19:
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceLayoutDirection");

  if (v28 == 1)
    v29 = CFSTR("\u200F");
  else
    v29 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v29, "stringByAppendingString:", v26);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v9, 0);
  objc_msgSend(v30, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
  v31 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "locationShareActionIcon");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setImage:", v33);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "insertAttributedString:atIndex:", v34, 0);

  objc_msgSend(v30, "addAttributes:range:", v4, 0, objc_msgSend(v30, "length"));
  return v30;
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

- (int64_t)direction
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "direction");

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
