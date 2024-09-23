@implementation CalDatabaseCleanUpOrphanedLocalAttachments

uint64_t __CalDatabaseCleanUpOrphanedLocalAttachments_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A5CCB000, v6, OS_LOG_TYPE_ERROR, "Attachment cleanup: Ignoring error for url %@: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

@end
