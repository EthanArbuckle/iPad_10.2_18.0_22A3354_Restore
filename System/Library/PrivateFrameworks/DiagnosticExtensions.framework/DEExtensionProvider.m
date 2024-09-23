@implementation DEExtensionProvider

- (DEExtensionProvider)init
{
  DEExtensionProvider *v2;
  DEExtensionProvider *v3;
  NSString *loggingConsent;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DEExtensionProvider;
  v2 = -[DEExtensionProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    loggingConsent = v2->_loggingConsent;
    v2->_loggingConsent = 0;

    v3->_isEnhancedLoggingStateOn = 0;
  }
  return v3;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_INFO, "Started extension with context: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.DiagnosticExtensions.extensionHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v7, "BOOLValue") & 1) == 0)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEExtensionProvider beginRequestWithExtensionContext:].cold.1((uint64_t)self, v8);

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Diagnostic Extension (%@) doesn't have com.apple.DiagnosticExtensions entitlement"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequestWithError:", v12);

  }
}

- (id)attachmentList
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)attachmentsForParameters:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setupWithParameters:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[DELogging fwHandle](DELogging, "fwHandle", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DEExtensionProvider setupWithParameters:]";
    _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DEExtensionProvider setIsEnhancedLoggingStateOn:](self, "setIsEnhancedLoggingStateOn:", 1);
}

- (void)teardownWithParameters:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[DELogging fwHandle](DELogging, "fwHandle", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DEExtensionProvider teardownWithParameters:]";
    _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DEExtensionProvider setIsEnhancedLoggingStateOn:](self, "setIsEnhancedLoggingStateOn:", 0);
}

- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3
{
  void (**v4)(id, BOOL);
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, BOOL))a3;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[DEExtensionProvider isExtensionEnhancedLoggingStateOnWithHandler:]";
    _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, -[DEExtensionProvider isEnhancedLoggingStateOn](self, "isEnhancedLoggingStateOn"));
}

- (id)filesInDir:(id)a3 matchingPattern:(id)a4 excludingPattern:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v8;
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("*"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = 0;
  v12 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", &v53);
  v13 = v53;
  v14 = v13;
  if (v12)
  {
    v35 = v13;
    v36 = v10;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0C99A90];
    v17 = *MEMORY[0x1E0C999D0];
    v59[0] = *MEMORY[0x1E0C99A90];
    v59[1] = v17;
    v43 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v7;
    objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v18, 5, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v20 = v19;
    v44 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v44)
    {
      v41 = *MEMORY[0x1E0C99998];
      v42 = *(_QWORD *)v50;
      v38 = *MEMORY[0x1E0C998D8];
      v39 = v16;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v50 != v42)
            objc_enumerationMutation(v20);
          v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v48 = 0;
          objc_msgSend(v22, "getResourceValue:forKey:error:", &v48, v16, 0);
          v23 = v48;
          v47 = 0;
          objc_msgSend(v22, "getResourceValue:forKey:error:", &v47, v43, 0);
          v24 = v47;
          v46 = 0;
          objc_msgSend(v22, "getResourceValue:forKey:error:", &v46, v41, 0);
          v25 = v46;
          if ((objc_msgSend(v24, "BOOLValue") & 1) == 0)
          {
            if (!v11
              || (objc_msgSend(v11, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length")),
                  v26 = (void *)objc_claimAutoreleasedReturnValue(),
                  v26,
                  v26))
            {
              if (!v9
                || (objc_msgSend(v9, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length")),
                    v27 = (void *)objc_claimAutoreleasedReturnValue(),
                    v27,
                    !v27))
              {
                v45 = 0;
                objc_msgSend(v22, "getResourceValue:forKey:error:", &v45, v38, 0);
                v28 = v45;
                objc_msgSend(v22, "lastPathComponent");
                v29 = v20;
                v30 = v11;
                v31 = v9;
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                +[DEAttachmentItem attachmentWithPath:withDisplayName:modificationDate:andFilesize:](DEAttachmentItem, "attachmentWithPath:withDisplayName:modificationDate:andFilesize:", v22, v32, v28, v25);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v40, "addObject:", v33);
                v9 = v31;
                v11 = v30;
                v20 = v29;
                v16 = v39;
              }
            }
          }

        }
        v44 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v44);
    }

    v10 = v36;
    v7 = v37;
    v14 = v35;
  }
  else
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v55 = v7;
      v56 = 2112;
      v57 = v14;
      _os_log_impl(&dword_1A4EEE000, v20, OS_LOG_TYPE_DEFAULT, "Unable to reach %@. Reason: %@", buf, 0x16u);
    }
  }

  return v40;
}

- (id)_getHostname
{
  if (_getHostname_onceToken != -1)
    dispatch_once(&_getHostname_onceToken, &__block_literal_global_4);
  return (id)_getHostname_hostname;
}

void __35__DEExtensionProvider__getHostname__block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[16];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(v2, 0, sizeof(v2));
  if (!gethostname((char *)v2, 0x100uLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_getHostname_hostname;
    _getHostname_hostname = v0;

  }
  if (!_getHostname_hostname)
  {
    _getHostname_hostname = (uint64_t)CFSTR("localhost");

  }
}

- (NSString)loggingConsent
{
  return self->_loggingConsent;
}

- (void)setLoggingConsent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)canGenerateNewAttachment
{
  return self->_canGenerateNewAttachment;
}

- (void)setCanGenerateNewAttachment:(BOOL)a3
{
  self->_canGenerateNewAttachment = a3;
}

- (BOOL)allowUserAttachmentSelection
{
  return self->_allowUserAttachmentSelection;
}

- (void)setAllowUserAttachmentSelection:(BOOL)a3
{
  self->_allowUserAttachmentSelection = a3;
}

- (BOOL)isEnhancedLoggingStateOn
{
  return self->_isEnhancedLoggingStateOn;
}

- (void)setIsEnhancedLoggingStateOn:(BOOL)a3
{
  self->_isEnhancedLoggingStateOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConsent, 0);
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A4EEE000, a2, OS_LOG_TYPE_ERROR, "Provider has no entitlement: %@", (uint8_t *)&v2, 0xCu);
}

@end
