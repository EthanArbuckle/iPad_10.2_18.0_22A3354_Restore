@implementation IMStickerMessageProcessingPipelineComponent

- (IMStickerMessageProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  void *v6;
  IMStickerMessageProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "messageStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)IMStickerMessageProcessingPipelineComponent;
  v7 = -[IMTextMessageProcessingPipelineComponent initWithMessageStore:](&v9, sel_initWithMessageStore_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_pipelineResources, a3);

  return v7;
}

- (id)createMessageItemWithInput:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  IMStickerMessageProcessingPipelineComponent *v45;
  void *v46;
  unint64_t v47;

  v4 = a3;
  v5 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v4);
  objc_msgSend(v4, "associatedMessageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v5;
  if (v6)
  {
    objc_msgSend(v4, "messageSummaryInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMStickerMessageProcessingPipelineComponent messageSummaryAdditions](self, "messageSummaryAdditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = self;
    if (v8)
    {
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      -[IMStickerMessageProcessingPipelineComponent messageSummaryAdditions](self, "messageSummaryAdditions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addEntriesFromDictionary:", v10);

      v46 = v9;
    }
    else
    {
      v46 = v7;
    }
    v42 = objc_alloc(MEMORY[0x1E0D396C8]);
    objc_msgSend(v4, "fromIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_stripFZIDPrefix");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timestamp");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "__im_iMessageDateFromTimeStamp:", v43);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richBody");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileTransferGUIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "associatedMessageGUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v4, "associatedMessageType");
    v32 = objc_msgSend(v4, "associatedMessageRange");
    v34 = v33;
    objc_msgSend(v4, "threadIdentifierGUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v42, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v41, v26, v27, 0, v28, v47, 0, v29, v30, v31, v32, v34, v46, v35);

    objc_msgSend(v4, "replicatedFallbackGUIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setReplicatedFallbackGUIDs:", v36);

    -[IMTextMessageProcessingPipelineComponent _findMessageItemForAssociatedMessageItem:](v45, "_findMessageItemForAssociatedMessageItem:", v21);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessageProcessingPipelineComponent _findAssociatedMessagePartTextForMessageItem:associatedMessageItem:](v45, "_findAssociatedMessagePartTextForMessageItem:associatedMessageItem:", v21, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAssociatedMessagePartText:", v38);

    v24 = v46;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0D39918]);
    objc_msgSend(v4, "fromIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_stripFZIDPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__im_iMessageDateFromTimeStamp:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileTransferGUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadIdentifierGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v11, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v13, v16, v17, 0, v18, v47, 0, v19, v20);

    objc_msgSend(v4, "messageSummaryInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMessageSummaryInfo:", v22);

    objc_msgSend(v4, "expressiveSendStyleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExpressiveSendStyleID:", v23);

    objc_msgSend(v4, "replicatedFallbackGUIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setReplicatedFallbackGUIDs:", v24);
  }

  if (objc_msgSend(v4, "scheduleType") == 2 && objc_msgSend(v21, "isFromMe"))
  {
    objc_msgSend(v21, "setScheduleType:", objc_msgSend(v4, "scheduleType"));
    objc_msgSend(v21, "setScheduleState:", 2);
    objc_msgSend(v4, "scheduledDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTime:", v39);

  }
  return v21;
}

- (id)runIndividuallyWithInput:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMStickerMessageProcessingPipelineComponent;
  -[IMAssociatedMessageProcessingPipelineComponent runIndividuallyWithInput:](&v4, sel_runIndividuallyWithInput_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (NSDictionary)messageSummaryAdditions
{
  return self->_messageSummaryAdditions;
}

- (void)setMessageSummaryAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_messageSummaryAdditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSummaryAdditions, 0);
  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end
