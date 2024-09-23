@implementation IMTypingIndicatorProcessingPipelineComponent

- (BOOL)canSuppressMessageWithInput:(id)a3
{
  return 0;
}

- (id)createMessageItemWithInput:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
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

  v4 = a3;
  v5 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v4) | 8;
  if (!objc_msgSend(v4, "isFinished"))
    v5 &= ~1uLL;
  v6 = objc_alloc(MEMORY[0x1E0D39918]);
  objc_msgSend(v4, "fromIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_stripFZIDPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__im_iMessageDateFromTimeStamp:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifierGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v6, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v8, v11, 0, 0, 0, v5, 0, v12, v13);

  objc_msgSend(v4, "balloonPluginBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBalloonBundleID:", v15);

  objc_msgSend(v4, "typingIndicatorIconData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTypingIndicatorIcon:", v16);

  objc_msgSend(v4, "replicatedFallbackGUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setReplicatedFallbackGUIDs:", v17);
  return v14;
}

- (id)runIndividuallyWithInput:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMTypingIndicatorProcessingPipelineComponent;
  -[IMTextMessageProcessingPipelineComponent runIndividuallyWithInput:](&v4, sel_runIndividuallyWithInput_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
