@implementation IMStickerTapbackMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;

  v4 = a3;
  v25 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v4);
  v24 = objc_alloc(MEMORY[0x1E0D396C8]);
  objc_msgSend(v4, "fromIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_stripFZIDPrefix");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__im_iMessageDateFromTimeStamp:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedMessageGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "associatedMessageType");
  v11 = objc_msgSend(v4, "associatedMessageRange");
  v13 = v12;
  objc_msgSend(v4, "messageSummaryInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifierGUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v24, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v23, v22, v6, 0, v7, v25, 0, v8, v9, v10, v11, v13, v14, v15);

  objc_msgSend(v4, "replicatedFallbackGUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setReplicatedFallbackGUIDs:", v17);
  -[IMTextMessageProcessingPipelineComponent _findMessageItemForAssociatedMessageItem:](self, "_findMessageItemForAssociatedMessageItem:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessageProcessingPipelineComponent _findAssociatedMessagePartTextForMessageItem:associatedMessageItem:](self, "_findAssociatedMessagePartTextForMessageItem:associatedMessageItem:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAssociatedMessagePartText:", v19);

  objc_msgSend(v18, "expressiveSendStyleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAssociatedMessageEffect:", v20);

  return v16;
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
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "<IMStickerTapbackMessageProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

      }
    }
    v17.receiver = self;
    v17.super_class = (Class)IMStickerTapbackMessageProcessingPipelineComponent;
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
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "<IMStickerTapbackMessageProcessingPipelineComponent> Rejecting message with GUID: %@", buf, 0xCu);

      }
    }
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 23, 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v15);

  }
  return v11;
}

@end
