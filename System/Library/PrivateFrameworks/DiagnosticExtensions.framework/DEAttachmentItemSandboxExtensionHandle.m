@implementation DEAttachmentItemSandboxExtensionHandle

- (DEAttachmentItemSandboxExtensionHandle)initWithSandboxExtensionToken:(id)a3 itemURL:(id)a4 errorOut:(id *)p_isa
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  int *v23;
  char *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    if (!p_isa)
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("nil sandbox extension token. Do not try attempt to consume a token more than once.");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (const __CFString **)v37;
    v15 = &v36;
    goto LABEL_13;
  }
  if (!v9)
  {
    if (!p_isa)
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("nil item URL");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v35;
    v15 = &v34;
LABEL_13:
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v17);
    *p_isa = v18;

    goto LABEL_14;
  }
  v31.receiver = self;
  v31.super_class = (Class)DEAttachmentItemSandboxExtensionHandle;
  self = -[DEAttachmentItemSandboxExtensionHandle init](&v31, sel_init);
  if (self)
  {
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    self->__handle = sandbox_extension_consume();
    self->_didInit = 1;
    if (-[DEAttachmentItemSandboxExtensionHandle _handle](self, "_handle") != -1)
    {
      objc_storeStrong((id *)&self->_itemURL, a4);
      goto LABEL_6;
    }
    if (!p_isa)
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[DEAttachmentItemSandboxExtensionHandle itemURL](self, "itemURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = __error();
    v24 = strerror(*v23);
    v25 = "Unknown";
    if (v24)
      v25 = v24;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to consume extension token for '%@' due to error: %s"), v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutorelease(v29);
    *p_isa = v30;

LABEL_14:
    p_isa = 0;
    goto LABEL_15;
  }
LABEL_6:
  +[DELogging fwHandle](DELogging, "fwHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DEAttachmentItemSandboxExtensionHandle initWithSandboxExtensionToken:itemURL:errorOut:].cold.1(self);

  self = self;
  p_isa = (id *)&self->super.isa;
LABEL_15:

  return (DEAttachmentItemSandboxExtensionHandle *)p_isa;
}

- (void)dealloc
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "itemURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v3, v4, "Released sandbox extension handle for file at path '%@'", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (BOOL)didInit
{
  return self->_didInit;
}

- (void)setDidInit:(BOOL)a3
{
  self->_didInit = a3;
}

- (int64_t)_handle
{
  return self->__handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemURL, 0);
}

- (void)initWithSandboxExtensionToken:(void *)a1 itemURL:errorOut:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "itemURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v3, v4, "Extending sandbox for file at path '%@'", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
