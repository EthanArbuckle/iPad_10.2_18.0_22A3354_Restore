@implementation IMRepositionStickerProcessingPipelineComponent

- (IMRepositionStickerProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMRepositionStickerProcessingPipelineComponent *v6;
  IMRepositionStickerProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMRepositionStickerProcessingPipelineComponent;
  v6 = -[IMRepositionStickerProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
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
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = IMOSLoggingEnabled(v6);
  if (v5)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138412290;
        v44 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "<IMRepositionStickerProcessingPipelineComponent> Started processing reposition sticker command for message GUID: %@", (uint8_t *)&v43, 0xCu);

      }
    }
    objc_msgSend(v4, "stickerAttachmentInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "stickerOffset");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D39328]);

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "stickerOffset");
    objc_msgSend(v14, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D39330]);

    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "stickerScale");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D392D8]);

    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "stickerRotation");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D392D0]);

    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "parentPreviewWidth");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D392C8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "stickerPositionVersion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D39318]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "positionIntent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D392C0]);

    -[IMRepositionStickerProcessingPipelineComponent pipelineResources](self, "pipelineResources");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "messageStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stickerEditedMessageGuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "messageWithGUID:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v28, "fileTransferGUIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[IMRepositionStickerProcessingPipelineComponent pipelineResources](self, "pipelineResources");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "messageStore");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "fileTransferGUIDs");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v34, "storeRepositionedStickerWithMetadata:fileTransferGUID:repositioningFromLocalChange:", v11, v36, 0);

      }
      else if (IMOSLoggingEnabled(v32))
      {
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Ignoring reposition sticker chat command, no file transfer found locally", (uint8_t *)&v43, 2u);
        }

      }
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);

    }
    else
    {
      if (IMOSLoggingEnabled(v29))
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "Ignoring reposition sticker chat command, no valid message for GUID", (uint8_t *)&v43, 2u);
        }

      }
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
    }

  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        LOWORD(v43) = 0;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Ignoring reposition sticker chat command, no message guid received", (uint8_t *)&v43, 2u);
      }

    }
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }

  return v39;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (BlastDoorStickerAttachmentInfo)stickerAttachmentInfo
{
  return self->_stickerAttachmentInfo;
}

- (void)setStickerAttachmentInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)stickerEditedMessageGuid
{
  return self->_stickerEditedMessageGuid;
}

- (void)setStickerEditedMessageGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerEditedMessageGuid, 0);
  objc_storeStrong((id *)&self->_stickerAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end
