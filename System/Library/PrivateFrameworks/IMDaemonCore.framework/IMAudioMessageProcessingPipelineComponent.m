@implementation IMAudioMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  id v4;
  id v5;
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
  unint64_t v18;

  v4 = a3;
  v18 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v4) | 0x1200000;
  v5 = objc_alloc(MEMORY[0x1E0D39918]);
  objc_msgSend(v4, "fromIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_stripFZIDPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__im_iMessageDateFromTimeStamp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileTransferGUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifierGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v5, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v7, v10, v11, 0, v12, v18, 0, v13, v14);

  objc_msgSend(v4, "replicatedFallbackGUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setReplicatedFallbackGUIDs:", v16);
  return v15;
}

- (id)runIndividuallyWithInput:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMAudioMessageProcessingPipelineComponent;
  -[IMTextMessageProcessingPipelineComponent runIndividuallyWithInput:](&v4, sel_runIndividuallyWithInput_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
