@implementation MFMailCompositionValues

- (MFMailCompositionValues)init
{
  MFMailCompositionValues *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailCompositionValues;
  result = -[MFMailCompositionValues init](&v3, sel_init);
  if (result)
  {
    result->_showContentImmediately = 1;
    result->_caretPosition = 0x7FFFFFFFFFFFFFFFLL;
    result->_defaultContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (MFMailCompositionValues)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MFMailCompositionValues *v5;
  MFMailCompositionValues *v6;

  v4 = a3;
  v5 = -[MFMailCompositionValues init](self, "init");
  v6 = v5;
  if (v5)
    -[MFMailCompositionValues _processDictionaryRepresentation:](v5, "_processDictionaryRepresentation:", v4);

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFMailCompositionValues mailtoURL](self, "mailtoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v4, CFSTR("URL"));

  -[MFMailCompositionValues autosaveIdentifier](self, "autosaveIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v5, CFSTR("AutosaveIdentifier"));

  -[MFMailCompositionValues messageBody](self, "messageBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v6, CFSTR("Body"));

  -[MFMailCompositionValues from](self, "from");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v7, CFSTR("From"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues isHTML](self, "isHTML"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v8, CFSTR("BodyIsHTML"));

  -[MFMailCompositionValues subject](self, "subject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v9, CFSTR("Subject"));

  -[MFMailCompositionValues hideMyEmailFrom](self, "hideMyEmailFrom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v10, CFSTR("HideMyEmailFrom"));

  -[MFMailCompositionValues toRecipients](self, "toRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v11, CFSTR("ToRecipients"));

  -[MFMailCompositionValues ccRecipients](self, "ccRecipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v12, CFSTR("CcRecipients"));

  -[MFMailCompositionValues bccRecipients](self, "bccRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v13, CFSTR("BccRecipients"));

  -[MFMailCompositionValues originalContent](self, "originalContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v14, CFSTR("OriginalContent"));

  -[MFMailCompositionValues preferredSendingEmailAddress](self, "preferredSendingEmailAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v15, CFSTR("PreferredSendingEmailAddress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues showKeyboardImmediately](self, "showKeyboardImmediately"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v16, CFSTR("ShowKeyboardImmediately"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues showContentImmediately](self, "showContentImmediately"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v17, CFSTR("ShowContentImmediately"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MFMailCompositionValues sourceAccountManagement](self, "sourceAccountManagement"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v18, CFSTR("SourceAccountManagement"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MFMailCompositionValues caretPosition](self, "caretPosition"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v19, CFSTR("CaretPosition"));

  -[MFMailCompositionValues UTITypes](self, "UTITypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v20, CFSTR("UTITypes"));

  -[MFMailCompositionValues photoIDs](self, "photoIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v21, CFSTR("PhotoIDs"));

  -[MFMailCompositionValues cloudPhotoIDs](self, "cloudPhotoIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v22, CFSTR("CloudPhotoIDs"));

  -[MFMailCompositionValues contentText](self, "contentText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v23, CFSTR("ContentText"));

  -[MFMailCompositionValues contentURLs](self, "contentURLs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v24, CFSTR("ContentURLs"));

  -[MFMailCompositionValues contentVariations](self, "contentVariations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v25, CFSTR("ContentVariations"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MFMailCompositionValues defaultContentVariationIndex](self, "defaultContentVariationIndex"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v26, CFSTR("DefaultContentVariationIndex"));

  -[MFMailCompositionValues shareSheetSessionID](self, "shareSheetSessionID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v27, CFSTR("ShareSheetSessionID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues isUsingDefaultAccount](self, "isUsingDefaultAccount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v28, CFSTR("IsUsingDefaultAccount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues prefersFirstLineSelection](self, "prefersFirstLineSelection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v29, CFSTR("PrefersFirstLineSelection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MFMailCompositionValues composeType](self, "composeType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v30, CFSTR("ComposeType"));

  -[MFMailCompositionValues serializedMessageObjectID](self, "serializedMessageObjectID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v31, CFSTR("SerializedMessageObjectID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues includeAttachments](self, "includeAttachments"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v32, CFSTR("IncludeAttachments"));

  -[MFMailCompositionValues serializedMailboxObjectID](self, "serializedMailboxObjectID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v33, CFSTR("SerializedMailboxObjectID"));

  -[MFMailCompositionValues deferredAttachments](self, "deferredAttachments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v34, CFSTR("DeferredAttachments"));

  -[MFMailCompositionValues sendLaterDate](self, "sendLaterDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v35, CFSTR("SendLaterDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MFMailCompositionValues sendLaterContext](self, "sendLaterContext"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v36, CFSTR("SendLaterContext"));

  -[MFMailCompositionValues sharingSandboxingURLWrapper](self, "sharingSandboxingURLWrapper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v37, CFSTR("SharingSandboxingURLWrapper"));

  -[MFMailCompositionValues ckShare](self, "ckShare");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v38, CFSTR("CKShare"));

  -[MFMailCompositionValues ckContainerSetupInfo](self, "ckContainerSetupInfo");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v39, CFSTR("CKContainerSetupInfo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MFMailCompositionValues ckSharePermissionType](self, "ckSharePermissionType"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v40, CFSTR("CKSharePermissionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailCompositionValues ckShareAllowOthersToInvite](self, "ckShareAllowOthersToInvite"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v41, CFSTR("CKShareAllowOthersToInvite"));

  return v3;
}

- (void)_processDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[5];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setMailtoURL:](self, "setMailtoURL:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutosaveIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setAutosaveIdentifier:](self, "setAutosaveIdentifier:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Subject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSubject:](self, "setSubject:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HideMyEmailFrom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setHideMyEmailFrom:](self, "setHideMyEmailFrom:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("From"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setFrom:](self, "setFrom:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ToRecipients"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setToRecipients:](self, "setToRecipients:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CcRecipients"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCcRecipients:](self, "setCcRecipients:", v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BccRecipients"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setBccRecipients:](self, "setBccRecipients:", v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OriginalContent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setOriginalContent:](self, "setOriginalContent:", v13);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UTITypes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setUTITypes:](self, "setUTITypes:", v14);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhotoIDs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setPhotoIDs:](self, "setPhotoIDs:", v15);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CloudPhotoIDs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCloudPhotoIDs:](self, "setCloudPhotoIDs:", v16);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentText"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setContentText:](self, "setContentText:", v17);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentURLs"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setContentURLs:](self, "setContentURLs:", v18);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentVariations"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setContentVariations:](self, "setContentVariations:", v19);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedMessageObjectID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSerializedMessageObjectID:](self, "setSerializedMessageObjectID:", v20);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedMailboxObjectID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSerializedMailboxObjectID:](self, "setSerializedMailboxObjectID:", v21);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShowKeyboardImmediately"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setShowKeyboardImmediately:](self, "setShowKeyboardImmediately:", objc_msgSend(v22, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShowContentImmediately"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setShowContentImmediately:](self, "setShowContentImmediately:", objc_msgSend(v23, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CaretPosition"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCaretPosition:](self, "setCaretPosition:", objc_msgSend(v24, "unsignedIntegerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DefaultContentVariationIndex"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setDefaultContentVariationIndex:](self, "setDefaultContentVariationIndex:", objc_msgSend(v25, "integerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsUsingDefaultAccount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setIsUsingDefaultAccount:](self, "setIsUsingDefaultAccount:", objc_msgSend(v26, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PrefersFirstLineSelection"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setPrefersFirstLineSelection:](self, "setPrefersFirstLineSelection:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ComposeType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setComposeType:](self, "setComposeType:", objc_msgSend(v28, "integerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IncludeAttachments"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setIncludeAttachments:](self, "setIncludeAttachments:", objc_msgSend(v29, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeferredAttachments"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setDeferredAttachments:](self, "setDeferredAttachments:", v30);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SourceAccountManagement"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSourceAccountManagement:](self, "setSourceAccountManagement:", objc_msgSend(v31, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SendLaterDate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSendLaterDate:](self, "setSendLaterDate:", v32);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SendLaterContext"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSendLaterContext:](self, "setSendLaterContext:", objc_msgSend(v33, "integerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharingSandboxingURLWrapper"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setSharingSandboxingURLWrapper:](self, "setSharingSandboxingURLWrapper:", v34);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKShare"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCkShare:](self, "setCkShare:", v35);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKContainerSetupInfo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCkContainerSetupInfo:](self, "setCkContainerSetupInfo:", v36);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKSharePermissionType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCkSharePermissionType:](self, "setCkSharePermissionType:", objc_msgSend(v37, "integerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKShareAllowOthersToInvite"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues setCkShareAllowOthersToInvite:](self, "setCkShareAllowOthersToInvite:", objc_msgSend(v38, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BodyIsHTML"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "BOOLValue");

  -[MFMailCompositionValues setIsHTML:](self, "setIsHTML:", v40);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Body"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    +[_MFMailCompositionContext processMessageBody:asHTML:](_MFMailCompositionContext, "processMessageBody:asHTML:", v41, -[MFMailCompositionValues isHTML](self, "isHTML"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailCompositionValues setMessageBody:](self, "setMessageBody:", v42);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreferredSendingEmailAddress"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (id)objc_msgSend(MEMORY[0x1E0D4D620], "mailAccounts");
    objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      -[MFMailCompositionValues setPreferredSendingEmailAddress:](self, "setPreferredSendingEmailAddress:", v43);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShareSheetSessionID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __60__MFMailCompositionValues__processDictionaryRepresentation___block_invoke;
    v47[3] = &unk_1E5A66A30;
    v47[4] = self;
    objc_msgSend(MEMORY[0x1E0D96D78], "requestMailRecipientsForSessionID:completionHandler:", v46, v47);
    -[MFMailCompositionValues setShareSheetSessionID:](self, "setShareSheetSessionID:", v46);
  }

}

uint64_t __60__MFMailCompositionValues__processDictionaryRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToRecipients:", a2);
}

- (id)addContentVariationWithName:(id)a3
{
  id v4;
  id v5;
  _MFMailComposeContentVariation *v6;

  v4 = a3;
  -[MFMailCompositionValues contentVariations](self, "contentVariations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MFMailCompositionValues setContentVariations:](self, "setContentVariations:", v5);
  }
  v6 = -[_MFMailComposeContentVariation initWithName:]([_MFMailComposeContentVariation alloc], "initWithName:", v4);
  objc_msgSend(v5, "addObject:", v6);
  if (-[MFMailCompositionValues defaultContentVariationIndex](self, "defaultContentVariationIndex") == 0x7FFFFFFFFFFFFFFFLL)
    -[MFMailCompositionValues setDefaultContentVariationIndex:](self, "setDefaultContentVariationIndex:", 0);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFMailCompositionValues)initWithCoder:(id)a3
{
  id v4;
  MFMailCompositionValues *v5;
  uint64_t v6;
  NSURL *mailtoURL;
  uint64_t v8;
  NSString *autosaveIdentifier;
  uint64_t v10;
  NSString *messageBody;
  uint64_t v12;
  NSString *subject;
  uint64_t v14;
  NSString *hideMyEmailFrom;
  uint64_t v16;
  NSString *from;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *toRecipients;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *ccRecipients;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *bccRecipients;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *originalContent;
  uint64_t v38;
  NSString *preferredSendingEmailAddress;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSArray *UTITypes;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSArray *photoIDs;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSArray *cloudPhotoIDs;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSArray *contentText;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSArray *contentURLs;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSMutableArray *contentVariations;
  uint64_t v70;
  NSString *shareSheetSessionID;
  uint64_t v72;
  NSData *serializedMessageObjectID;
  uint64_t v74;
  NSData *serializedMailboxObjectID;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSMutableArray *deferredAttachments;
  uint64_t v82;
  NSDate *sendLaterDate;
  uint64_t v84;
  FPSandboxingURLWrapper *sharingSandboxingURLWrapper;
  uint64_t v86;
  CKShare *ckShare;
  uint64_t v88;
  CKContainerSetupInfo *ckContainerSetupInfo;
  objc_super v91;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)MFMailCompositionValues;
  v5 = -[MFMailCompositionValues init](&v91, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailtoURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    mailtoURL = v5->_mailtoURL;
    v5->_mailtoURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_autosaveIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    autosaveIdentifier = v5->_autosaveIdentifier;
    v5->_autosaveIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_messageBody"));
    v10 = objc_claimAutoreleasedReturnValue();
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v10;

    v5->_isHTML = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isHTML"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subject"));
    v12 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_hideMyEmailFrom"));
    v14 = objc_claimAutoreleasedReturnValue();
    hideMyEmailFrom = v5->_hideMyEmailFrom;
    v5->_hideMyEmailFrom = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_from"));
    v16 = objc_claimAutoreleasedReturnValue();
    from = v5->_from;
    v5->_from = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("EFPropertyKey_toRecipients"));
    v21 = objc_claimAutoreleasedReturnValue();
    toRecipients = v5->_toRecipients;
    v5->_toRecipients = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("EFPropertyKey_ccRecipients"));
    v26 = objc_claimAutoreleasedReturnValue();
    ccRecipients = v5->_ccRecipients;
    v5->_ccRecipients = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("EFPropertyKey_bccRecipients"));
    v31 = objc_claimAutoreleasedReturnValue();
    bccRecipients = v5->_bccRecipients;
    v5->_bccRecipients = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("EFPropertyKey_originalContent"));
    v36 = objc_claimAutoreleasedReturnValue();
    originalContent = v5->_originalContent;
    v5->_originalContent = (NSArray *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_preferredSendingEmailAddress"));
    v38 = objc_claimAutoreleasedReturnValue();
    preferredSendingEmailAddress = v5->_preferredSendingEmailAddress;
    v5->_preferredSendingEmailAddress = (NSString *)v38;

    v5->_showKeyboardImmediately = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_showKeyboardImmediately"));
    v5->_showContentImmediately = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_showContentImmediately"));
    v5->_sourceAccountManagement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_sourceAccountManagement"));
    v5->_caretPosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_caretPosition"));
    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("EFPropertyKey_UTITypes"));
    v43 = objc_claimAutoreleasedReturnValue();
    UTITypes = v5->_UTITypes;
    v5->_UTITypes = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("EFPropertyKey_photoIDs"));
    v48 = objc_claimAutoreleasedReturnValue();
    photoIDs = v5->_photoIDs;
    v5->_photoIDs = (NSArray *)v48;

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("EFPropertyKey_cloudPhotoIDs"));
    v53 = objc_claimAutoreleasedReturnValue();
    cloudPhotoIDs = v5->_cloudPhotoIDs;
    v5->_cloudPhotoIDs = (NSArray *)v53;

    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("EFPropertyKey_contentText"));
    v58 = objc_claimAutoreleasedReturnValue();
    contentText = v5->_contentText;
    v5->_contentText = (NSArray *)v58;

    v60 = (void *)MEMORY[0x1E0C99E60];
    v61 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("EFPropertyKey_contentURLs"));
    v63 = objc_claimAutoreleasedReturnValue();
    contentURLs = v5->_contentURLs;
    v5->_contentURLs = (NSArray *)v63;

    v65 = (void *)MEMORY[0x1E0C99E60];
    v66 = objc_opt_class();
    objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("EFPropertyKey_contentVariations"));
    v68 = objc_claimAutoreleasedReturnValue();
    contentVariations = v5->_contentVariations;
    v5->_contentVariations = (NSMutableArray *)v68;

    v5->_defaultContentVariationIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_defaultContentVariationIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_shareSheetSessionID"));
    v70 = objc_claimAutoreleasedReturnValue();
    shareSheetSessionID = v5->_shareSheetSessionID;
    v5->_shareSheetSessionID = (NSString *)v70;

    v5->_isUsingDefaultAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isUsingDefaultAccount"));
    v5->_prefersFirstLineSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_prefersFirstLineSelection"));
    v5->_composeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_composeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_serializedMessageObjectID"));
    v72 = objc_claimAutoreleasedReturnValue();
    serializedMessageObjectID = v5->_serializedMessageObjectID;
    v5->_serializedMessageObjectID = (NSData *)v72;

    v5->_includeAttachments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_includeAttachments"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_serializedMailboxObjectID"));
    v74 = objc_claimAutoreleasedReturnValue();
    serializedMailboxObjectID = v5->_serializedMailboxObjectID;
    v5->_serializedMailboxObjectID = (NSData *)v74;

    v76 = (void *)MEMORY[0x1E0C99E60];
    v77 = objc_opt_class();
    v78 = objc_opt_class();
    objc_msgSend(v76, "setWithObjects:", v77, v78, objc_opt_class(), 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v79, CFSTR("EFPropertyKey_deferredAttachments"));
    v80 = objc_claimAutoreleasedReturnValue();
    deferredAttachments = v5->_deferredAttachments;
    v5->_deferredAttachments = (NSMutableArray *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sendLaterDate"));
    v82 = objc_claimAutoreleasedReturnValue();
    sendLaterDate = v5->_sendLaterDate;
    v5->_sendLaterDate = (NSDate *)v82;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sharingSandboxingURLWrapper"));
    v84 = objc_claimAutoreleasedReturnValue();
    sharingSandboxingURLWrapper = v5->_sharingSandboxingURLWrapper;
    v5->_sharingSandboxingURLWrapper = (FPSandboxingURLWrapper *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_ckShare"));
    v86 = objc_claimAutoreleasedReturnValue();
    ckShare = v5->_ckShare;
    v5->_ckShare = (CKShare *)v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_ckContainerSetupInfo"));
    v88 = objc_claimAutoreleasedReturnValue();
    ckContainerSetupInfo = v5->_ckContainerSetupInfo;
    v5->_ckContainerSetupInfo = (CKContainerSetupInfo *)v88;

    v5->_ckSharePermissionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_ckSharePermissionType"));
    v5->_ckShareAllowOthersToInvite = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_ckShareAllowOthersToInvite"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  -[MFMailCompositionValues mailtoURL](self, "mailtoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_mailtoURL"));

  -[MFMailCompositionValues autosaveIdentifier](self, "autosaveIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_autosaveIdentifier"));

  -[MFMailCompositionValues messageBody](self, "messageBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_messageBody"));

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues isHTML](self, "isHTML"), CFSTR("EFPropertyKey_isHTML"));
  -[MFMailCompositionValues subject](self, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_subject"));

  -[MFMailCompositionValues hideMyEmailFrom](self, "hideMyEmailFrom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_hideMyEmailFrom"));

  -[MFMailCompositionValues from](self, "from");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_from"));

  -[MFMailCompositionValues toRecipients](self, "toRecipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_toRecipients"));

  -[MFMailCompositionValues ccRecipients](self, "ccRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_ccRecipients"));

  -[MFMailCompositionValues bccRecipients](self, "bccRecipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v12, CFSTR("EFPropertyKey_bccRecipients"));

  -[MFMailCompositionValues originalContent](self, "originalContent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v13, CFSTR("EFPropertyKey_originalContent"));

  -[MFMailCompositionValues preferredSendingEmailAddress](self, "preferredSendingEmailAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v14, CFSTR("EFPropertyKey_preferredSendingEmailAddress"));

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues showKeyboardImmediately](self, "showKeyboardImmediately"), CFSTR("EFPropertyKey_showKeyboardImmediately"));
  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues showContentImmediately](self, "showContentImmediately"), CFSTR("EFPropertyKey_showContentImmediately"));
  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues sourceAccountManagement](self, "sourceAccountManagement"), CFSTR("EFPropertyKey_sourceAccountManagement"));
  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues caretPosition](self, "caretPosition"), CFSTR("EFPropertyKey_caretPosition"));
  -[MFMailCompositionValues UTITypes](self, "UTITypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v15, CFSTR("EFPropertyKey_UTITypes"));

  -[MFMailCompositionValues photoIDs](self, "photoIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v16, CFSTR("EFPropertyKey_photoIDs"));

  -[MFMailCompositionValues cloudPhotoIDs](self, "cloudPhotoIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v17, CFSTR("EFPropertyKey_cloudPhotoIDs"));

  -[MFMailCompositionValues contentText](self, "contentText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v18, CFSTR("EFPropertyKey_contentText"));

  -[MFMailCompositionValues contentURLs](self, "contentURLs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v19, CFSTR("EFPropertyKey_contentURLs"));

  -[MFMailCompositionValues contentVariations](self, "contentVariations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v20, CFSTR("EFPropertyKey_contentVariations"));

  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues defaultContentVariationIndex](self, "defaultContentVariationIndex"), CFSTR("EFPropertyKey_defaultContentVariationIndex"));
  -[MFMailCompositionValues shareSheetSessionID](self, "shareSheetSessionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v21, CFSTR("EFPropertyKey_shareSheetSessionID"));

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues isUsingDefaultAccount](self, "isUsingDefaultAccount"), CFSTR("EFPropertyKey_isUsingDefaultAccount"));
  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues prefersFirstLineSelection](self, "prefersFirstLineSelection"), CFSTR("EFPropertyKey_prefersFirstLineSelection"));
  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues composeType](self, "composeType"), CFSTR("EFPropertyKey_composeType"));
  -[MFMailCompositionValues serializedMessageObjectID](self, "serializedMessageObjectID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v22, CFSTR("EFPropertyKey_serializedMessageObjectID"));

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues includeAttachments](self, "includeAttachments"), CFSTR("EFPropertyKey_includeAttachments"));
  -[MFMailCompositionValues serializedMailboxObjectID](self, "serializedMailboxObjectID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v23, CFSTR("EFPropertyKey_serializedMailboxObjectID"));

  -[MFMailCompositionValues deferredAttachments](self, "deferredAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v24, CFSTR("EFPropertyKey_deferredAttachments"));

  -[MFMailCompositionValues sendLaterDate](self, "sendLaterDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v25, CFSTR("EFPropertyKey_sendLaterDate"));

  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues sendLaterContext](self, "sendLaterContext"), CFSTR("EFPropertyKey_sendLaterContext"));
  -[MFMailCompositionValues sharingSandboxingURLWrapper](self, "sharingSandboxingURLWrapper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v26, CFSTR("EFPropertyKey_sharingSandboxingURLWrapper"));

  -[MFMailCompositionValues ckShare](self, "ckShare");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v27, CFSTR("EFPropertyKey_ckShare"));

  -[MFMailCompositionValues ckContainerSetupInfo](self, "ckContainerSetupInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v28, CFSTR("EFPropertyKey_ckContainerSetupInfo"));

  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues ckSharePermissionType](self, "ckSharePermissionType"), CFSTR("EFPropertyKey_ckSharePermissionType"));
  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues ckShareAllowOthersToInvite](self, "ckShareAllowOthersToInvite"), CFSTR("EFPropertyKey_ckShareAllowOthersToInvite"));

}

- (NSURL)mailtoURL
{
  return self->_mailtoURL;
}

- (void)setMailtoURL:(id)a3
{
  objc_storeStrong((id *)&self->_mailtoURL, a3);
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (void)setAutosaveIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isHTML
{
  return self->_isHTML;
}

- (void)setIsHTML:(BOOL)a3
{
  self->_isHTML = a3;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)hideMyEmailFrom
{
  return self->_hideMyEmailFrom;
}

- (void)setHideMyEmailFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)preferredSendingEmailAddress
{
  return self->_preferredSendingEmailAddress;
}

- (void)setPreferredSendingEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)showKeyboardImmediately
{
  return self->_showKeyboardImmediately;
}

- (void)setShowKeyboardImmediately:(BOOL)a3
{
  self->_showKeyboardImmediately = a3;
}

- (BOOL)showContentImmediately
{
  return self->_showContentImmediately;
}

- (void)setShowContentImmediately:(BOOL)a3
{
  self->_showContentImmediately = a3;
}

- (int)sourceAccountManagement
{
  return self->_sourceAccountManagement;
}

- (void)setSourceAccountManagement:(int)a3
{
  self->_sourceAccountManagement = a3;
}

- (unint64_t)caretPosition
{
  return self->_caretPosition;
}

- (void)setCaretPosition:(unint64_t)a3
{
  self->_caretPosition = a3;
}

- (NSArray)UTITypes
{
  return self->_UTITypes;
}

- (void)setUTITypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)photoIDs
{
  return self->_photoIDs;
}

- (void)setPhotoIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)cloudPhotoIDs
{
  return self->_cloudPhotoIDs;
}

- (void)setCloudPhotoIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)contentURLs
{
  return self->_contentURLs;
}

- (void)setContentURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSMutableArray)contentVariations
{
  return self->_contentVariations;
}

- (void)setContentVariations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)defaultContentVariationIndex
{
  return self->_defaultContentVariationIndex;
}

- (void)setDefaultContentVariationIndex:(int64_t)a3
{
  self->_defaultContentVariationIndex = a3;
}

- (NSString)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (void)setShareSheetSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isUsingDefaultAccount
{
  return self->_isUsingDefaultAccount;
}

- (void)setIsUsingDefaultAccount:(BOOL)a3
{
  self->_isUsingDefaultAccount = a3;
}

- (BOOL)prefersFirstLineSelection
{
  return self->_prefersFirstLineSelection;
}

- (void)setPrefersFirstLineSelection:(BOOL)a3
{
  self->_prefersFirstLineSelection = a3;
}

- (int64_t)composeType
{
  return self->_composeType;
}

- (void)setComposeType:(int64_t)a3
{
  self->_composeType = a3;
}

- (NSData)serializedMessageObjectID
{
  return self->_serializedMessageObjectID;
}

- (void)setSerializedMessageObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)includeAttachments
{
  return self->_includeAttachments;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  self->_includeAttachments = a3;
}

- (NSArray)originalContent
{
  return self->_originalContent;
}

- (void)setOriginalContent:(id)a3
{
  objc_storeStrong((id *)&self->_originalContent, a3);
}

- (NSData)serializedMailboxObjectID
{
  return self->_serializedMailboxObjectID;
}

- (void)setSerializedMailboxObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSMutableArray)deferredAttachments
{
  return self->_deferredAttachments;
}

- (void)setDeferredAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_deferredAttachments, a3);
}

- (NSDate)sendLaterDate
{
  return self->_sendLaterDate;
}

- (void)setSendLaterDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unint64_t)sendLaterContext
{
  return self->_sendLaterContext;
}

- (void)setSendLaterContext:(unint64_t)a3
{
  self->_sendLaterContext = a3;
}

- (FPSandboxingURLWrapper)sharingSandboxingURLWrapper
{
  return self->_sharingSandboxingURLWrapper;
}

- (void)setSharingSandboxingURLWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSandboxingURLWrapper, a3);
}

- (CKShare)ckShare
{
  return self->_ckShare;
}

- (void)setCkShare:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (CKContainerSetupInfo)ckContainerSetupInfo
{
  return self->_ckContainerSetupInfo;
}

- (void)setCkContainerSetupInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (int64_t)ckSharePermissionType
{
  return self->_ckSharePermissionType;
}

- (void)setCkSharePermissionType:(int64_t)a3
{
  self->_ckSharePermissionType = a3;
}

- (BOOL)ckShareAllowOthersToInvite
{
  return self->_ckShareAllowOthersToInvite;
}

- (void)setCkShareAllowOthersToInvite:(BOOL)a3
{
  self->_ckShareAllowOthersToInvite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckContainerSetupInfo, 0);
  objc_storeStrong((id *)&self->_ckShare, 0);
  objc_storeStrong((id *)&self->_sharingSandboxingURLWrapper, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_deferredAttachments, 0);
  objc_storeStrong((id *)&self->_serializedMailboxObjectID, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_serializedMessageObjectID, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_storeStrong((id *)&self->_contentVariations, 0);
  objc_storeStrong((id *)&self->_contentURLs, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_cloudPhotoIDs, 0);
  objc_storeStrong((id *)&self->_photoIDs, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
  objc_storeStrong((id *)&self->_preferredSendingEmailAddress, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_hideMyEmailFrom, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_mailtoURL, 0);
}

@end
