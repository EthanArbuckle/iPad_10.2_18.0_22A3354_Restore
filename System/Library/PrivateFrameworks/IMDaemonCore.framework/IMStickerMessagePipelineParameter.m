@implementation IMStickerMessagePipelineParameter

- (IMStickerMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMStickerMessagePipelineParameter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMStickerMessagePipelineParameter;
  v7 = -[IMAssociatedMessagePipelineParameter initWithBD:idsTrustedData:](&v15, sel_initWithBD_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sticker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "associatedMessageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", 1000);
      objc_msgSend(v9, "associatedMessageGUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTextMessagePipelineParameter setAssociatedMessageGUID:](v7, "setAssociatedMessageGUID:", v11);

      v12 = objc_msgSend(v9, "associatedMessageRange");
      -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v12, v13);
    }

  }
  return v7;
}

- (BOOL)supportsStickerAttributesInMessageBody
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMTextMessagePipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMAssociatedMessagePipelineParameter associatedMessageType](self, "associatedMessageType");
  -[IMTextMessagePipelineParameter associatedMessageGUID](self, "associatedMessageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter messageItems](self, "messageItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMStickerMessagePipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}"), self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
