@implementation ICAttachment(Management)

- (ICAssetGenerationManager)fallbackImageGenerationManager
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICAssetGenerationManager *v12;
  ICAssetGenerationManager *fallbackImageGenerationManager;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICAssetGenerationManager *v18;
  ICAssetGenerationManager *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[ICAttachment account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v5 = v7;
    }
    else
    {
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "folder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "account");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[ICAttachment identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v11 && v5)
  {
    fallbackImageGenerationManager = self->_fallbackImageGenerationManager;
    if (!fallbackImageGenerationManager)
    {
      NSStringFromSelector(sel_fallbackImageGeneration);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fallbackImageContainerURLForIdentifier:account:", v16, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[ICAssetGenerationManager initWithObject:generationKeyPath:containerURL:]([ICAssetGenerationManager alloc], "initWithObject:generationKeyPath:containerURL:", self, v14, v17);
      v19 = self->_fallbackImageGenerationManager;
      self->_fallbackImageGenerationManager = v18;

      v20 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fallbackImageFallbackURLForIdentifier:account:", v21, v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v22;
      v23 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fallbackImageEncryptedFallbackURLForIdentifier:account:", v24, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager setFallbackURLs:](self->_fallbackImageGenerationManager, "setFallbackURLs:", v26);

      fallbackImageGenerationManager = self->_fallbackImageGenerationManager;
    }
    v12 = fallbackImageGenerationManager;
  }

  return v12;
}

- (ICAssetGenerationManager)fallbackPDFGenerationManager
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICAssetGenerationManager *v12;
  ICAssetGenerationManager *fallbackPDFGenerationManager;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICAssetGenerationManager *v18;
  ICAssetGenerationManager *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[ICAttachment account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v5 = v7;
    }
    else
    {
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "folder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "account");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[ICAttachment identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v11 && v5)
  {
    fallbackPDFGenerationManager = self->_fallbackPDFGenerationManager;
    if (!fallbackPDFGenerationManager)
    {
      NSStringFromSelector(sel_fallbackPDFGeneration);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fallbackPDFContainerURLForIdentifier:account:", v16, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[ICAssetGenerationManager initWithObject:generationKeyPath:containerURL:]([ICAssetGenerationManager alloc], "initWithObject:generationKeyPath:containerURL:", self, v14, v17);
      v19 = self->_fallbackPDFGenerationManager;
      self->_fallbackPDFGenerationManager = v18;

      v20 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fallbackPDFFallbackURLForIdentifier:account:", v21, v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v22;
      v23 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fallbackPDFEncryptedFallbackURLForIdentifier:account:", v24, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager setFallbackURLs:](self->_fallbackPDFGenerationManager, "setFallbackURLs:", v26);

      fallbackPDFGenerationManager = self->_fallbackPDFGenerationManager;
    }
    v12 = fallbackPDFGenerationManager;
  }

  return v12;
}

- (void)fallbackImageData
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot retrieve fallback image data because URL is nil {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeFallbackImageData:()Management .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot write fallback image data because generation manager is nil {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeFallbackImageData:()Management .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot begin attachment fallback image generation {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)fallbackPDFData
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot retrieve fallback PDF data because URL is nil {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeFallbackPDFData:()Management .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot write fallback PDF data because generation manager is nil {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeFallbackPDFData:()Management .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot begin attachment fallback PDF generation {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)temporaryPaperBundleURLForIdentifier:()Management account:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "No identifier when trying to get temporary paper bundle URL", v1, 2u);
}

- (void)temporaryPaperBundleURL
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "No identifier or account when trying to get temporary paper bundle URL for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeTemporaryPaperBundle
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a4, a3, "Cannot remove temporary paper bundle {attachment: %@, error: %@}", (uint8_t *)a3);

}

@end
