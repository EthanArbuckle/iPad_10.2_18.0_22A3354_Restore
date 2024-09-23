@implementation CKGroupActionChatItem

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
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  int64_t v18;
  int v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  __CFString *v52;
  id v53;
  id v54;

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
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKGroupActionChatItem sender](self, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = &stru_1E276D870;
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  if (-[CKGroupActionChatItem failed](self, "failed"))
    v16 = v8;
  else
    v16 = v4;
  v54 = v16;
  if (-[CKGroupActionChatItem failed](self, "failed"))
    v17 = v10;
  else
    v17 = v6;
  v53 = v17;
  v18 = -[CKGroupActionChatItem actionType](self, "actionType");
  v52 = v15;
  if (v18 == 2)
  {
    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v21 = CFSTR("GROUP_DELETE_PHOTO_STATUS");
LABEL_26:
      objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_1E276D870, CFSTR("ChatKit"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CKAttributedFormatString(v54, v53, v25, v31, v32, v33, v34, v35, (uint64_t)v15);
      goto LABEL_27;
    }
    v24 = CFSTR("GROUP_YOU_DELETE_PHOTO_STATUS");
LABEL_23:
    v23 = v20;
    goto LABEL_24;
  }
  if (v18 == 1)
  {
    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v21 = CFSTR("GROUP_UPDATE_PHOTO_STATUS");
      goto LABEL_26;
    }
    v24 = CFSTR("GROUP_YOU_UPDATE_PHOTO_STATUS");
    goto LABEL_23;
  }
  if (v18)
  {
    v22 = 0;
    goto LABEL_28;
  }
  if (v11)
  {
    v19 = objc_msgSend(v11, "isBusiness");
    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v21 = CFSTR("BIA_LEAVE_CONVERSATION");
    else
      v21 = CFSTR("GROUP_LEAVE_STATUS");
    goto LABEL_26;
  }
  CKFrameworkBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;
  v24 = CFSTR("GROUP_YOU_LEAVE_STATUS");
LABEL_24:
  objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1E276D870, CFSTR("ChatKit"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttributedFormatString(v54, v53, v25, v26, v27, v28, v29, v30, 0);
LABEL_27:
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  if (-[CKGroupActionChatItem failed](self, "failed"))
  {
    v36 = (void *)MEMORY[0x1E0CEA650];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "transcriptLightFont");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "configurationWithFont:", v38);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v51);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "imageWithTintColor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v42, "setImage:", v41);
    objc_msgSend(MEMORY[0x1E0CB3778], "attributedStringWithAttachment:attributes:", v42, v8);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = v11;
    v45 = v8;
    v46 = v10;
    v47 = v6;
    v48 = v4;
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v43, "appendAttributedString:", v49);

    v4 = v48;
    v6 = v47;
    v10 = v46;
    v8 = v45;
    v11 = v44;
    objc_msgSend(v43, "appendAttributedString:", v22);

  }
  else
  {
    v43 = v22;
  }

  return v43;
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

- (IMHandle)sender
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMHandle *)v3;
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

- (NSString)errorText
{
  void *v2;
  void *v3;

  if (-[CKGroupActionChatItem actionType](self, "actionType"))
  {
    CKFrameworkBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_PHOTO_CHANGE_ERROR_ALERT_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSArray)fileTransferGUIDs
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileTransferGUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

@end
