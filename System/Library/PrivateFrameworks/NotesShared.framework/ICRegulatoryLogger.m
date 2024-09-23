@implementation ICRegulatoryLogger

- (ICRegulatoryLogger)init
{
  ICRegulatoryLogger *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _Unwind_Exception *v8;
  objc_super v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v9.receiver = self;
  v9.super_class = (Class)ICRegulatoryLogger;
  v2 = -[ICRegulatoryLogger init](&v9, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v3 = getct_green_tea_logger_createSymbolLoc_ptr;
    v13 = getct_green_tea_logger_createSymbolLoc_ptr;
    if (!getct_green_tea_logger_createSymbolLoc_ptr)
    {
      v4 = (void *)libCTGreenTeaLoggerLibrary();
      v3 = dlsym(v4, "ct_green_tea_logger_create");
      v11[3] = (uint64_t)v3;
      getct_green_tea_logger_createSymbolLoc_ptr = v3;
    }
    _Block_object_dispose(&v10, 8);
    if (!v3)
    {
      v8 = (_Unwind_Exception *)__35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v8);
    }
    -[ICRegulatoryLogger setGreenTeaLogger:](v2, "setGreenTeaLogger:", ((uint64_t (*)(const char *))v3)("com.apple.mobilenotes"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_didReadAttachment_, CFSTR("ICRegulatoryLoggerAttachmentAddedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_didReadAttachment_, CFSTR("ICRegulatoryLoggerAttachmentPlayedNotification"), 0);

  }
  return v2;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICRegulatoryLogger;
  -[ICRegulatoryLogger dealloc](&v4, sel_dealloc);
}

- (void)didReadAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICRegulatoryLogger *v12;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ICRegulatoryLoggerAttachmentKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__ICRegulatoryLogger_didReadAttachment___block_invoke;
  v10[3] = &unk_1E76C73B0;
  v11 = v7;
  v12 = self;
  v9 = v7;
  objc_msgSend(v8, "performBlock:", v10);

}

void __40__ICRegulatoryLogger_didReadAttachment___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  __int16 v7;
  __int16 v8;

  if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 4)
  {
    soft_getCTGreenTeaOsLogHandle(objc_msgSend(*(id *)(a1 + 40), "greenTeaLogger"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (!v2 || !os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v8 = 0;
    v4 = "Reading audio data";
    v5 = (uint8_t *)&v8;
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") != 5)
    return;
  soft_getCTGreenTeaOsLogHandle(objc_msgSend(*(id *)(a1 + 40), "greenTeaLogger"));
  v6 = objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 0;
    v4 = "Reading video data";
    v5 = (uint8_t *)&v7;
LABEL_9:
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
  }
LABEL_10:

}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

@end
