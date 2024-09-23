@implementation IMStickerTapbackMessagePipelineParameter

- (IMStickerTapbackMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMStickerTapbackMessagePipelineParameter *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IMStickerTapbackMessagePipelineParameter;
  v7 = -[IMAssociatedMessagePipelineParameter initWithBD:idsTrustedData:](&v18, sel_initWithBD_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stickerTapback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", objc_msgSend(v9, "associatedMessageType"));
    objc_msgSend(v9, "associatedMessageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setAssociatedMessageGUID:](v7, "setAssociatedMessageGUID:", v10);

    v11 = objc_msgSend(v9, "associatedMessageRange");
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v11, v12);
    objc_msgSend(v9, "associatedMessageFallbackHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageFallbackHash:](v7, "setAssociatedMessageFallbackHash:", v13);

    v14 = objc_msgSend(v9, "associatedMessageRange");
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v14, v15);
    objc_msgSend(v9, "plainTextBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setPlainTextBody:](v7, "setPlainTextBody:", v16);

  }
  return v7;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3
{
  id v4;
  CFMutableDictionaryRef Mutable;
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
  CFMutableDictionaryRef v24;
  __CFDictionary *v25;
  objc_super v27;

  v4 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v27.receiver = self;
  v27.super_class = (Class)IMStickerTapbackMessagePipelineParameter;
  -[IMTextMessagePipelineParameter messageSummaryInfoDictionaryWithBlastDoorMessage:](&v27, sel_messageSummaryInfoDictionaryWithBlastDoorMessage_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "messageSubType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stickerTapback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageSummaryInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v10, "contentType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38350], v11);

  objc_msgSend(v4, "messageSubType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stickerTapback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageSummaryInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "summary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D383C0], v15);

  objc_msgSend(v4, "messageSubType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stickerTapback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageSummaryInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pluginBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38388], v19);

  objc_msgSend(v4, "messageSubType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stickerTapback");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageSummaryInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pluginDisplayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D38390], v23);

  if (-[__CFDictionary count](Mutable, "count"))
    v24 = Mutable;
  else
    v24 = 0;
  v25 = v24;

  return v25;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMStickerTapbackMessagePipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}"), self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
