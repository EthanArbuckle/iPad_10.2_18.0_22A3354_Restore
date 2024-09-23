@implementation MSPDFAttachmentController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MSPDFAttachmentController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __32__MSPDFAttachmentController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (void)updateToInlinePDFAttachmentIfNeeded:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "uttype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x24BDF84E0]);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "data");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (objc_msgSend(MEMORY[0x24BDBCF50], "em_lockdownModeEnabled"))
      {
        +[MSPDFAttachmentController log](MSPDFAttachmentController, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "contentID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v10;
          _os_log_impl(&dword_21C672000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Lockdown Mode detected, disabling PDF parsing", (uint8_t *)&v24, 0xCu);

        }
      }
      else
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDE30E8]), "initWithData:", v8);
        if (!v9)
        {
          +[MSPDFAttachmentController log](MSPDFAttachmentController, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "contentID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSPDFAttachmentController updateToInlinePDFAttachmentIfNeeded:].cold.2(v14, (uint64_t)v30, v13);
          }

        }
        v15 = -[NSObject pageCount](v9, "pageCount");
        v16 = -[NSObject isLocked](v9, "isLocked");
        +[MSPDFAttachmentController log](MSPDFAttachmentController, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "contentID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543874;
          v25 = v18;
          v26 = 2048;
          v27 = v15;
          v28 = 1024;
          v29 = v16;
          _os_log_impl(&dword_21C672000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) Attached PDF has %lu pages, isLocked=%{BOOL}d", (uint8_t *)&v24, 0x1Cu);

        }
        if (v15 == 1)
          v19 = v16;
        else
          v19 = 1;
        if ((v19 & 1) == 0)
        {
          -[MSPDFAttachmentController delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (v21)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSPDFAttachmentController.m"), 44, CFSTR("Delegate is missing to update attachment"));

          }
          -[MSPDFAttachmentController delegate](self, "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "attachmentController:updateToInlineAttachment:", self, v5);

        }
      }
    }
    else
    {
      +[MSPDFAttachmentController log](MSPDFAttachmentController, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "contentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPDFAttachmentController updateToInlinePDFAttachmentIfNeeded:].cold.1(v12, (uint64_t)&v24, v9);
      }
    }

  }
  else
  {
    +[MSPDFAttachmentController log](MSPDFAttachmentController, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "contentID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPDFAttachmentController updateToInlinePDFAttachmentIfNeeded:].cold.3(v11, (uint64_t)&v24, v8);
    }
  }

}

- (MSPDFAttachmentControllerDelegate)delegate
{
  return (MSPDFAttachmentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateToInlinePDFAttachmentIfNeeded:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_21C672000, a2, a3, "(%{public}@) Data is missing", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)updateToInlinePDFAttachmentIfNeeded:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_21C672000, a2, a3, "(%{public}@) Could not create PDF document from data", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)updateToInlinePDFAttachmentIfNeeded:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_21C672000, a2, a3, "(%{public}@) Attachment is not a PDF", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

@end
