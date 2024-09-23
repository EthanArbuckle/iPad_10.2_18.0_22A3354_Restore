@implementation IMScheduledMessageUpdateProcessingPipelineComponent

- (IMScheduledMessageUpdateProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMScheduledMessageUpdateProcessingPipelineComponent *v6;
  IMScheduledMessageUpdateProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMScheduledMessageUpdateProcessingPipelineComponent;
  v6 = -[IMScheduledMessageUpdateProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMScheduledMessageUpdateProcessingPipelineParameter> Started processing", (uint8_t *)&v28, 2u);
    }

  }
  v6 = objc_msgSend(v4, "isFromMe");
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "GUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMScheduledMessageUpdateProcessingPipelineComponent pipelineResources](self, "pipelineResources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageWithGUID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && v10)
    {
      objc_msgSend(v4, "scheduleState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (v12)
      {
        if (IMOSLoggingEnabled(v13))
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v28) = 0;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Not Processing. Did not find update for any property on scheduled message", (uint8_t *)&v28, 2u);
          }

        }
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
      }
      else
      {
        objc_msgSend(v4, "scheduleState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setScheduleState:", (int)objc_msgSend(v14, "intValue"));

        -[IMScheduledMessageUpdateProcessingPipelineComponent pipelineResources](self, "pipelineResources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "messageStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v16, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v10, 1, 0, 0, 0);

        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "scheduleState");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138412546;
            v29 = v7;
            v30 = 2112;
            v31 = v20;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Stored scheduled message %@ with scheduleState %@", (uint8_t *)&v28, 0x16u);

          }
        }
        v21 = objc_alloc_init(MEMORY[0x1E0D35A10]);
        objc_msgSend(v21, "fullfillWithValue:", v4);
      }
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v25);

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "fromIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = v23;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Scheduled Message update is not from me, not processing: %@", (uint8_t *)&v28, 0xCu);

      }
    }
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }

  return v21;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end
