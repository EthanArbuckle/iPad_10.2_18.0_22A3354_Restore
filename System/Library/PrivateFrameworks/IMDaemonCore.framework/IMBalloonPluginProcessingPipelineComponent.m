@implementation IMBalloonPluginProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  objc_msgSend(v4, "associatedMessageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v28 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v4);
    v27 = objc_alloc(MEMORY[0x1E0D396C8]);
    objc_msgSend(v4, "fromDisplayID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timestamp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__im_iMessageDateFromTimeStamp:", v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileTransferGUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "associatedMessageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "associatedMessageType");
    v12 = objc_msgSend(v4, "associatedMessageRange");
    v14 = v13;
    objc_msgSend(v4, "messageSummaryInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadIdentifierGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v27, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v26, v25, v7, 0, v8, v28, 0, v9, v10, v11, v12, v14, v15, v16);

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)IMBalloonPluginProcessingPipelineComponent;
    -[IMTextMessageProcessingPipelineComponent createMessageItemWithInput:](&v30, sel_createMessageItemWithInput_, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "balloonPluginBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "containsString:", *MEMORY[0x1E0D37620]))
  {

LABEL_7:
    objc_msgSend(v17, "setFileTransferGUIDs:", 0);
    goto LABEL_8;
  }
  objc_msgSend(v4, "balloonPluginBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsString:", *MEMORY[0x1E0D37628]);

  if (v20)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v4, "balloonPluginBundleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBalloonBundleID:", v21);

  objc_msgSend(v4, "balloonPluginPayload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPayloadData:", v22);

  objc_msgSend(v4, "replicatedFallbackGUIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setReplicatedFallbackGUIDs:", v23);

  return v17;
}

- (id)runIndividuallyWithInput:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMBalloonPluginProcessingPipelineComponent;
  -[IMTextMessageProcessingPipelineComponent runIndividuallyWithInput:](&v4, sel_runIndividuallyWithInput_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
