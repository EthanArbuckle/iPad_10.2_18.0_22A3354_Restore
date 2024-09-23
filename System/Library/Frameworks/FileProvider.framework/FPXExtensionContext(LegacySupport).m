@implementation FPXExtensionContext(LegacySupport)

- (void)importDocumentAtURL:()LegacySupport intoFolderWithIdentifier:originalName:extensionInstance:reply:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] importing item -> import document %@ in %@", (uint8_t *)&v3, 0x16u);
}

- (void)importDocumentAtURL:()LegacySupport intoFolderWithIdentifier:originalName:extensionInstance:reply:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fixed up filename to %@", (uint8_t *)&v4, 0xCu);

}

- (void)importDocumentAtURL:()LegacySupport intoFolderWithIdentifier:originalName:extensionInstance:reply:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't import filename %@; %@",
    (uint8_t *)&v6,
    0x16u);

}

@end
