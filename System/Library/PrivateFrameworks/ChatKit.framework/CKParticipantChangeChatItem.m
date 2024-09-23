@implementation CKParticipantChangeChatItem

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  __CFString *v93;
  void *v94;
  void *v95;
  __CFString *v96;
  __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  __CFString *v102;
  id v103;
  id v104;
  uint8_t buf[16];

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
  v8 = objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transcriptGroupModificationErrorEmphasizedFontAttributes");
  v10 = objc_claimAutoreleasedReturnValue();

  -[CKParticipantChangeChatItem sender](self, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKParticipantChangeChatItem handle](self, "handle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_1E276D870;
  v16 = v15;

  objc_msgSend(v12, "name");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = &stru_1E276D870;
  v102 = v19;

  v101 = (void *)v8;
  if (-[CKParticipantChangeChatItem failed](self, "failed"))
    v20 = (void *)v8;
  else
    v20 = v4;
  v104 = v20;
  v100 = (void *)v10;
  if (-[CKParticipantChangeChatItem failed](self, "failed"))
    v21 = (void *)v10;
  else
    v21 = v6;
  v103 = v21;
  v22 = -[CKParticipantChangeChatItem changeType](self, "changeType");
  if (v22 == 1)
  {
    v96 = v16;
    v98 = v4;
    if (-[CKParticipantChangeChatItem unattributed](self, "unattributed"))
    {
      CKFrameworkBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("GROUP_LEAVE_STATUS");
    }
    else
    {
      if (v11)
      {
        CKFrameworkBundle();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v39;
        if (v12)
        {
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("GROUP_REMOVE_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v102;
        }
        else
        {
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("GROUP_REMOVE_YOU_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
        }
        CKAttributedFormatString(v104, v103, v45, v40, v41, v42, v43, v44, (uint64_t)v16);
LABEL_34:
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKParticipantChangeChatItem activeTelephonyConversationUUID](self, "activeTelephonyConversationUUID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "existingConversationForTelephonyConversationUUID:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          v94 = v12;
          v95 = v6;
          v68 = v31;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v69, OS_LOG_TYPE_INFO, "Chat participant was removed while there is an active FaceTime call", buf, 2u);
            }

          }
          v31 = (void *)objc_msgSend(v31, "mutableCopy");
          v70 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("GROUP_MEMBER_ACTIVE_IN_FT_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "stringWithFormat:", CFSTR(" %@"), v72, v93);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          CKAttributedFormatString(v104, v103, v73, v74, v75, v76, v77, v78, (uint64_t)v102);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "appendAttributedString:", v79);

          v16 = v96;
          v4 = v98;
          v12 = v94;
          v6 = v95;
        }
        else
        {
          v16 = v96;
          v4 = v98;
        }
        goto LABEL_41;
      }
      CKFrameworkBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("GROUP_YOU_REMOVE_STATUS");
    }
    objc_msgSend(v32, "localizedStringForKey:value:table:", v34, &stru_1E276D870, CFSTR("ChatKit"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    CKAttributedFormatString(v104, v103, v45, v54, v55, v56, v57, v58, (uint64_t)v102);
    goto LABEL_34;
  }
  if (v22)
  {
    v31 = 0;
    goto LABEL_41;
  }
  if (-[CKParticipantChangeChatItem unattributed](self, "unattributed"))
  {
    CKFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("GROUP_SYSTEM_ADD_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = v4;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v104, v103, v25, v26, v27, v28, v29, v30, (uint64_t)v102);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v24;
LABEL_27:

    goto LABEL_41;
  }
  if (!v11)
  {
    CKFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("GROUP_YOU_ADD_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v46 = v4;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v104, v103, v47, v48, v49, v50, v51, v52, (uint64_t)v102);
    v53 = objc_claimAutoreleasedReturnValue();

    v4 = v46;
    v31 = (void *)v53;
    goto LABEL_27;
  }
  v35 = v4;
  CKFrameworkBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v12)
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("GROUP_ADD_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  else
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("GROUP_ADD_YOU_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttributedFormatString(v104, v103, v38, v59, v60, v61, v62, v63, (uint64_t)v16);
  v64 = objc_claimAutoreleasedReturnValue();

  v4 = v35;
  v31 = (void *)v64;
LABEL_41:
  if (-[CKParticipantChangeChatItem failed](self, "failed"))
  {
    v80 = (void *)MEMORY[0x1E0CEA650];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v99 = v4;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "transcriptLightFont");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "configurationWithFont:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v97 = v16;
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "imageWithTintColor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v87, "setImage:", v86);
    objc_msgSend(MEMORY[0x1E0CB3778], "attributedStringWithAttachment:attributes:", v87, v101);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v6;
    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v88, "appendAttributedString:", v90);

    v6 = v89;
    objc_msgSend(v88, "appendAttributedString:", v31);
    v91 = v88;

    v16 = v97;
    v4 = v99;

  }
  else
  {
    v91 = v31;
  }

  return v91;
}

- (NSString)errorText
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[CKParticipantChangeChatItem changeType](self, "changeType"))
  {
    if (-[CKParticipantChangeChatItem changeType](self, "changeType") != 1)
    {
      v10 = 0;
      return (NSString *)v10;
    }
    v3 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("GROUP_REMOVE_ERROR_STATUS");
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("GROUP_ADD_ERROR_STATUS");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKParticipantChangeChatItem handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (int64_t)changeType
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "changeType");

  return v3;
}

- (IMHandle)handle
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "otherHandle");
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

- (BOOL)unattributed
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unattributed");

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

- (id)activeTelephonyConversationUUID
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTelephonyConversationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
