@implementation ICNote(CloudKit)

- (void)mergeCloudKitRecord:()CloudKit mergePolicy:account:approach:mergeableFieldState:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "defaultFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_loggingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412802;
  v13 = v7;
  OUTLINED_FUNCTION_9_2();
  v14 = v11;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Setting default folder %@ in account %@ for shared note with no folder: %@", (uint8_t *)&v12, 0x20u);

}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Attempting to merge data, but document is nil — replacing local document", v1, 2u);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.2(void *a1)
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

  objc_msgSend(a1, "mergeableString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Failed to merge incoming delta %p for note %@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "mergeableString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed merge %p: Replacing local note content with cloud note.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "mergeableString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed merge %p: Keeping local note content.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "mergeableString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed merge %p: Coping note and replacing local note content with cloud note.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.6(void *a1)
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

  objc_msgSend(a1, "mergeableString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Failed to merge note %p %@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.7(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Skipping merge of the note body for note (%@) because it wasn't found on the incoming record", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:()CloudKit .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to serialize timestamp for note: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)folderReferenceFromRecord:()CloudKit .cold.1(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Falling back to folders reference array for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)folderReferenceFromRecord:()CloudKit .cold.2(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "'Folder' and 'Folders' key are different. Falling back to 'Folders' for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeFoldersFromRecord:()CloudKit account:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v3;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "%@ is marked for deletion but not in the trash. Moving to trash folder %@.", v6, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)mergeFoldersFromRecord:()CloudKit account:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Could not get a folder reference for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeFoldersFromRecord:()CloudKit account:.cold.3(void *a1, void *a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "shortLoggingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 138413058;
  v16 = v7;
  OUTLINED_FUNCTION_9_2();
  v17 = v10;
  v18 = v13;
  v19 = v14;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Trying to set a %@ (%@) for %@, but we couldn't find the %@. Creating a temporary one.", (uint8_t *)&v15, 0x2Au);

}

- (void)addNoteBodyToRecord:()CloudKit forApproach:mergeableFieldState:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ic_loggingIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "length");
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Unable to generate CRDT delta for note (%@) because the starting timestamp data (length=%lu) was invalid", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)addNoteBodyToRecord:()CloudKit forApproach:mergeableFieldState:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Generated delta was empty for note: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)makeUserSpecificCloudKitRecordForApproach:()CloudKit .cold.1(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "isSystemPaper");
  objc_msgSend(a2, "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_35(&dword_1BD918000, v4, v5, "Setting isSystemPaper to %d on record: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)makeUserSpecificCloudKitRecordForApproach:()CloudKit .cold.2(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not saving trash folder in user-specific note record for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeDataFromUserSpecificRecord:()CloudKit accountID:.cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "isSystemPaper");
  objc_msgSend(a1, "ic_loggingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_35(&dword_1BD918000, v3, v4, "Setting isSystemPaper on note %d from CK: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mergePolicyForRecord:()CloudKit .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Found a note (%@) in the cloud with a record whose creation date is not equal to our own cached version.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
