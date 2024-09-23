@implementation ICAttachment(ICAttachmentPersistenceAdditions)

- (void)loadFromArchive:()ICAttachmentPersistenceAdditions dataPersister:withIdentifierMap:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, a3, "Error creating unarchiver: %@", (uint8_t *)&v3);
}

- (void)saveToArchive:()ICAttachmentPersistenceAdditions dataPersister:stripImageMarkupMetadata:error:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Failed to archive PaperKit bundle (%@) at: %@", buf, 0x16u);

  OUTLINED_FUNCTION_1_6();
}

- (void)saveToArchive:()ICAttachmentPersistenceAdditions dataPersister:stripImageMarkupMetadata:error:.cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a3, (uint64_t)a3, "Media (%@) has no data when archiving", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_6();
}

- (void)saveToArchive:()ICAttachmentPersistenceAdditions dataPersister:stripImageMarkupMetadata:error:.cold.3(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a3, (uint64_t)a3, "Media (%@) has no filename when archiving — falling back to identifier", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_6();
}

@end
