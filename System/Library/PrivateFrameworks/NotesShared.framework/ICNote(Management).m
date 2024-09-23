@implementation ICNote(Management)

+ (void)newObjectWithIdentifier:()Management context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to add note to a read only persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)newObjectWithIdentifier:()Management context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Trying to create a new note with Identifier %@ with a nil context", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deleteEmptyNote:()Management .cold.1(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Deleting empty note %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)deleteNote:()Management .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Trying to delete note with a read only persistent store %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deleteNote:()Management .cold.2(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Marking note %@ for deletion from deleteNote", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)purgeNote:()Management .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Trying to purge note with a read only persistent store %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "hash");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v1, v2, "POST REFRESH noteData.hash %lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_0();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.2(void *a1)
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

  objc_msgSend(a1, "noteData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v3, v4, "POST REFRESH noteData objectID = %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "noteData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "committedValuesForKeys:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v4, v5, "POST REFRESH noteData all keys of committedValuesForKeys:nil %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.4(void *a1)
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

  objc_msgSend(a1, "noteData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v3, v4, "POST REFRESH noteData.changedValues %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "POST REFRESH note objectID = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.6(void *a1)
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

  objc_msgSend(a1, "noteData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v3, v4, "PRE REFRESH noteData objectID = %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.7(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "PRE REFRESH note objectID = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "PRE FETCH fetchRequest %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)noteIdentifiersMatchingPredicate:()Management context:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Error fetching note identifiers for predicate %@: %@", v1);
  OUTLINED_FUNCTION_1_0();
}

@end
