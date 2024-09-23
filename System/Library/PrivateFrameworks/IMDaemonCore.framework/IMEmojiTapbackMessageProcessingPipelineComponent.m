@implementation IMEmojiTapbackMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  void *v28;
  unint64_t v29;
  void *v30;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "plainTextBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  objc_msgSend(v8, "__im_attributedStringByAssigningMessagePartNumbers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v5);
  objc_msgSend(v5, "associatedMessageGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc(MEMORY[0x1E0D396C8]);
  objc_msgSend(v5, "fromDisplayID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "timestamp");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__im_iMessageDateFromTimeStamp:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "associatedMessageType");
  v14 = objc_msgSend(v5, "associatedMessageRange");
  v16 = v15;
  objc_msgSend(v5, "associatedMessageEmoji");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageSummaryInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadIdentifierGUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v27, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:", v26, v11, v30, 0, 0, v29, 0, v12, v9, v13, v14, v16, v17, v18, v19);

  objc_msgSend(v5, "replicatedFallbackGUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setReplicatedFallbackGUIDs:", v21);
  -[IMTextMessageProcessingPipelineComponent _findMessageItemForAssociatedMessageItem:](self, "_findMessageItemForAssociatedMessageItem:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessageProcessingPipelineComponent _findAssociatedMessagePartTextForMessageItem:associatedMessageItem:](self, "_findAssociatedMessagePartTextForMessageItem:associatedMessageItem:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAssociatedMessagePartText:", v23);

  objc_msgSend(v22, "expressiveSendStyleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAssociatedMessageEffect:", v24);

  return v20;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmojiTapbacksEnabled");

  v8 = IMOSLoggingEnabled(v7);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "<IMEmojiTapbackMessageProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

      }
    }
    v17.receiver = self;
    v17.super_class = (Class)IMEmojiTapbackMessageProcessingPipelineComponent;
    -[IMTextMessageProcessingPipelineComponent runIndividuallyWithInput:](&v17, sel_runIndividuallyWithInput_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "<IMEmojiTapbackMessageProcessingPipelineComponent> Rejecting message with GUID: %@", buf, 0xCu);

      }
    }
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 23, 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v15);

  }
  return v11;
}

@end
