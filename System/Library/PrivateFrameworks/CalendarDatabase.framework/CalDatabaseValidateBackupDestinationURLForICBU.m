@implementation CalDatabaseValidateBackupDestinationURLForICBU

uint64_t __CalDatabaseValidateBackupDestinationURLForICBU_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1A5CCB000, v7, OS_LOG_TYPE_ERROR, "Failed to list destination URL (%@): %@", (uint8_t *)&v9, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

  return 0;
}

@end
