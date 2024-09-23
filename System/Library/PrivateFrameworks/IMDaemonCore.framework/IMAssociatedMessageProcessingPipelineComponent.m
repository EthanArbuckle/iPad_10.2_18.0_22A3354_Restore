@implementation IMAssociatedMessageProcessingPipelineComponent

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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  unint64_t v28;
  void *v30;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "plainTextBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  objc_msgSend(v8, "__im_attributedStringByAssigningMessagePartNumbers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v5);
  v27 = objc_alloc(MEMORY[0x1E0D396C8]);
  objc_msgSend(v5, "fromDisplayID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__im_iMessageDateFromTimeStamp:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedMessageGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "associatedMessageType");
  v15 = objc_msgSend(v5, "associatedMessageRange");
  v17 = v16;
  objc_msgSend(v5, "messageSummaryInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadIdentifierGUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v27, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v26, v11, v30, 0, 0, v28, 0, v12, v13, v14, v15, v17, v18, v19);

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
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "GUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMAssociatedMessageProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)IMAssociatedMessageProcessingPipelineComponent;
  -[IMTextMessageProcessingPipelineComponent runIndividuallyWithInput:](&v9, sel_runIndividuallyWithInput_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
