@implementation CKServiceChatItem

- (unint64_t)layoutType
{
  return 2;
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
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E276D870);
  -[CKServiceChatItem _serviceName](self, "_serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptEmphasizedFontAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    -[CKServiceChatItem _subtextImage](self, "_subtextImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!objc_msgSend(v3, "length"))
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v7);
        objc_msgSend(v3, "appendAttributedString:", v9);

      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldShowServiceEncryptionIcon");

      if (!v11)
        goto LABEL_10;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v3, "appendAttributedString:", v12);

      -[CKServiceChatItem _subtextWithImage:](self, "_subtextWithImage:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendAttributedString:", v13);
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v4, v7);

      -[CKServiceChatItem _appendServiceInfoIfNeeded](self, "_appendServiceInfoIfNeeded");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendAttributedString:", v13);
      v3 = v15;
    }

LABEL_10:
    v14 = v3;

    goto LABEL_11;
  }
  v14 = v3;
LABEL_11:

  return v14;
}

- (id)_serviceName
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStewieEmergency");

  if (v6)
  {
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("STEWIE_EMERGENCY_STATUS_SERVICE");
    v10 = CFSTR("ChatKit-SYDROB_FEATURES");
  }
  else
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isStewieRoadside");

    if (v13)
    {
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("STEWIE_ROADSIDE_STATUS_SERVICE");
      v10 = CFSTR("ChatKit-Avocet");
    }
    else
    {
      if (!objc_msgSend(v3, "isStewieSharingChat"))
      {
        objc_msgSend(v3, "service");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "__ck_displayName");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("TS_DESCRIPTION_SERVICE_NAME");
      v10 = CFSTR("TranscriptSharing-SYDROB_FEATURES");
    }
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E276D870, v10);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v15 = (void *)v14;

  return v15;
}

- (id)_subtextImage
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowServiceEncryptionIcon");

  if (!v4)
    goto LABEL_7;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCapability:", *MEMORY[0x1E0D38E20]);

  if (!v7)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "__ck_isSMS");

    if (v12)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unencryptedServiceIcon");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v13 = 0;
    return v13;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encryptedServiceIcon");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (void *)v9;

  return v13;
}

- (id)_subtextWithImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStewie");

  if (!v7)
  {
    v9 = (void *)objc_opt_new();
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "__ck_isiMessage");

    if (v12)
    {
      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("IMESSAGE_MESSAGE_CHATITEM_SUBTEXT"), &stru_1E276D870, CFSTR("ChatKit"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "transcriptiMessageEmphasizedFontAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "__ck_isSMS");

      if (!v19)
      {
        v14 = &stru_1E276D870;
        goto LABEL_9;
      }
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TEXT_MESSAGE_CHATITEM_SUBTEXT"), &stru_1E276D870, CFSTR("ChatKit"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "transcriptSMSEmphasizedFontAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v16;
    v22 = objc_msgSend(v16, "mutableCopy");

    v9 = (void *)v22;
LABEL_9:
    v23 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v23, "initWithString:", v24);

    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertAttributedString:atIndex:", v26, 0);

    objc_msgSend(v8, "addAttributes:range:", v9, 0, objc_msgSend(v8, "length"));
    goto LABEL_10;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E276D870);
LABEL_10:

  return v8;
}

- (id)_appendServiceInfoIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E276D870);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCarrierPigeonEnabled");

  if (v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transcriptRegularFontAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatItem IMChatItem](self, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "__ck_isSatelliteSMS");

    if (v10)
    {
      -[CKServiceChatItem _smsFallbackStringForChatItem:](self, "_smsFallbackStringForChatItem:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v11, v7);

      v3 = (void *)v12;
    }

  }
  if (objc_msgSend(v3, "length"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v3, "insertAttributedString:atIndex:", v13, 0);
    -[CKServiceChatItem setHasInformativeText:](self, "setHasInformativeText:", 1);

  }
  return v3;
}

- (id)_smsFallbackStringForChatItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_displayNameWithAbbreviation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "isLiteServiceCapable");
  v7 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    v10 = CFSTR("SMS_FALLBACK_STATUS_MESSAGE");
  else
    v10 = CFSTR("SMS_FALLBACK_STATUS_MESSAGE_NO_REPLY");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

  if (v14 == 1)
    v15 = CFSTR("\u200F");
  else
    v15 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)hasInformativeText
{
  return self->_hasInformativeText;
}

- (void)setHasInformativeText:(BOOL)a3
{
  self->_hasInformativeText = a3;
}

@end
