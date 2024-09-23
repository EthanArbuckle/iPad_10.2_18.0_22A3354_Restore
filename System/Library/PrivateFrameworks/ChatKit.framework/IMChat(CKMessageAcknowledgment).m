@implementation IMChat(CKMessageAcknowledgment)

+ (uint64_t)associatedMessageContentTypeFromCKMediaType:()CKMessageAcknowledgment
{
  if ((a3 - 1) > 8)
    return 0;
  else
    return byte_18E7CBD8C[a3 - 1];
}

+ (id)configureMessageSummaryInfoForChatItem:()CKMessageAcknowledgment
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x1E0D35780];
    objc_msgSend(v4, "mediaObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "associatedMessageContentTypeFromCKMediaType:", objc_msgSend(v6, "mediaType"));

    objc_msgSend(v4, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D375E8];
    IMBalloonExtensionIDWithSuffix();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (v12)
      v13 = v10;
    else
      v13 = 0;

    v25 = 0;
    v26 = 0;
    v18 = 0;
    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "IMChatItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v25 = 0;
      v13 = 0;
      v18 = 0;
      v7 = 0;
LABEL_35:

      v26 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v14, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.messages.URLBalloonProvider")))
    {
      objc_msgSend(v15, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "absoluteString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "previewSummaryForPluginBundle:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 9;
    }
    v13 = v16;
    v27 = objc_alloc(MEMORY[0x1E0CB3710]);
    objc_msgSend(v15, "pluginPayload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v30 = (void *)objc_msgSend(v27, "initForReadingFromData:error:", v29, &v45);
    v44 = v45;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v30, "_enableStrictSecureDecodingMode");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "strict-decoding 017 _enableStrictSecureDecodingMode called", buf, 2u);
        }

      }
    }
    IMExtensionPayloadUnarchivingClasses();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "decodeObjectOfClasses:forKey:", v32, *MEMORY[0x1E0CB2CD0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0D37E20]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v44;
          _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Failed to unarchive the data source pluginPayload. Error: %@", buf, 0xCu);
        }

      }
      v25 = 0;
      if (v18)
        goto LABEL_34;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v13;
        _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "summary text for tapback is nil for type: %@", buf, 0xCu);
      }

    }
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    v13 = 0;
    v26 = 0;
    v18 = 0;
    v7 = 0;
    goto LABEL_42;
  }
  v19 = v3;
  objc_msgSend(v19, "subject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v21, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v21)
  {
    v24 = v21;
  }
  else
  {
    if (!v23)
    {
      v18 = 0;
      goto LABEL_41;
    }
    v24 = v23;
  }
  v18 = v24;
LABEL_41:
  objc_msgSend(v19, "messageItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "messagePartMatchingPartIndex:", objc_msgSend(v19, "index"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "messagePartBody");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v13 = 0;
  v7 = 1;
LABEL_42:
  objc_msgSend(v3, "messageItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "expressiveSendStyleID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0D380A0]))
  {
    CKFrameworkBundle();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SUMMARY_INVISIBLE_INK_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v41 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v41;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithAssociatedMessageSummary:contentType:associatedMessagePartText:pluginBundleID:pluginDisplayName:", v18, v7, v26, v13, v25);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)_relevantLanguageIdentifierForLocalization
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEAAD8], "currentInputMode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "primaryLanguage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:
{
  return objc_msgSend(a1, "sendMessageAcknowledgment:forChatItem:languageIdentifier:", a3, a4, 0);
}

- (void)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:languageIdentifier:
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0D39B40];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "tapbackWithAssociatedMessageType:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLanguageIdentifier:", v9);
  objc_msgSend(a1, "sendTapback:forChatItem:languageIdentifier:", v11, v10, v9);

}

- (uint64_t)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:withGuid:
{
  return objc_msgSend(a1, "sendMessageAcknowledgment:forChatItem:languageIdentifier:", a3, a4, 0);
}

- (uint64_t)sendTapback:()CKMessageAcknowledgment forChatItem:
{
  return objc_msgSend(a1, "sendTapback:forChatItem:languageIdentifier:", a3, a4, 0);
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(a1, "_relevantLanguageIdentifierForLocalization");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setLanguageIdentifier:", v10);
  if (objc_msgSend(v9, "isEditedMessageHistory"))
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[IMChat(CKMessageAcknowledgment) sendTapback:forChatItem:languageIdentifier:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_16;
  }
  objc_msgSend(v9, "IMChatItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v9, "IMChatItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v8;
    v21 = objc_alloc(MEMORY[0x1E0D35940]);
    objc_msgSend(v20, "guid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "originalMessagePartRange");
    v25 = v24;
    objc_msgSend((id)objc_opt_class(), "configureMessageSummaryInfoForChatItem:", v9);
    v26 = v10;
    v27 = v9;
    v28 = a1;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "threadIdentifierForTapback");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v8 = v73;
    v32 = v28;
    v9 = v27;
    v10 = v26;
    v11 = objc_msgSend(v31, "initWithTapback:chat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:", v73, v32, v22, v23, v25, v29, v30);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    IMLogHandleForCategory();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[IMChat(CKMessageAcknowledgment) sendTapback:forChatItem:languageIdentifier:].cold.2(v53, v54, v55, v56, v57, v58, v59, v60);

    v11 = 0;
    goto LABEL_16;
  }
  v33 = v9;
  objc_msgSend(v33, "mediaObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "transfer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "attributionInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "objectForKey:", *MEMORY[0x1E0D37F40]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v36;
  objc_msgSend(v36, "objectForKey:", *MEMORY[0x1E0D37F68]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "unsignedIntValue");

  objc_msgSend(v33, "parentGUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createIMChatItemForTransientAttachmentWithAssetUUID:parentChatItemGUID:", v37, v39);
  IMFauxMessageGUIDForTapbackOfCMMAssetAtIndexInParentMessageGUID();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "IMChatItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v70 = objc_alloc(MEMORY[0x1E0D35940]);
    v72 = v37;
    v42 = objc_msgSend(v41, "originalMessagePartRange");
    v69 = v43;
    objc_msgSend((id)objc_opt_class(), "configureMessageSummaryInfoForChatItem:", v33);
    v44 = v10;
    v45 = v9;
    v46 = a1;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "threadIdentifierForTapback");
    v71 = v39;
    v48 = v33;
    v49 = v40;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v46;
    v9 = v45;
    v10 = v44;
    v52 = v42;
    v37 = v72;
    v11 = objc_msgSend(v70, "initWithTapback:chat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:", v8, v51, v49, v52, v69, v47, v50);

    v40 = v49;
    v33 = v48;
    v39 = v71;

  }
  else
  {
    IMLogHandleForCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[IMChat(CKMessageAcknowledgment) sendTapback:forChatItem:languageIdentifier:].cold.3(v61, v62, v63, v64, v65, v66, v67, v68);

    v11 = 0;
  }

  if (v41)
  {
LABEL_8:
    if (v11)
    {
      -[NSObject send](v11, "send");
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_16:

}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Not sending tapback for edited message history item", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Unable to create tapback sender", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Temp message part is unexpectedly nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
