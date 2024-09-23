@implementation ICFolder(CloudKit)

- (void)mergeParentFromRecord:()CloudKit .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint8_t v11[14];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "className");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  v12 = v7;
  v13 = v9;
  v14 = a2;
  v15 = v9;
  v16 = v10;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Trying to set a parent for %@ (%@), but we couldn't find the parent (%@). Creating a temporary %@", v11, 0x2Au);

}

- (void)mergeParentFromRecord:()CloudKit .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Folder has no local parent modification date %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeParentFromRecord:()CloudKit .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Folder record has no parent modification date %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeParentFromRecord:()CloudKit .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  __int16 v9;
  uint8_t v10[14];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parentModificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  v11 = v8;
  v12 = v9;
  v13 = a2;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Folder has local and cloud parent modification date: %@ local=%@ cloud=%@", v10, 0x20u);

}

- (void)fixBrokenReferences
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Moving note (%@) to trash folder", a1, 0xCu);

}

@end
