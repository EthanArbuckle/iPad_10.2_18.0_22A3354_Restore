@implementation NoteContext(ICLegacyContext)

- (BOOL)nonEmptyNoteExistsForLegacyAccountWithObjectID:()ICLegacyContext
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "allVisibleNotesForAccountWithObjectID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (id)allVisibleNotesForAccountWithObjectID:()ICLegacyContext
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "collectionForObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "allVisibleNotesInCollection:sorted:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NoteContext(ICLegacyContext) allVisibleNotesForAccountWithObjectID:].cold.1((uint64_t)v4, v7, v8);

    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)allVisibleNotesInFolder:()ICLegacyContext
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteCollectionObject) != nil)", "-[NoteContext(ICLegacyContext) allVisibleNotesInFolder:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "noteCollectionObject");
  objc_msgSend(a1, "allVisibleNotesInCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)countOfVisibleNotesForAccountWithObjectID:()ICLegacyContext
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "collectionForObjectID:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteCollectionObject) != nil)", "-[NoteContext(ICLegacyContext) countOfVisibleNotesForAccountWithObjectID:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "noteCollectionObject");
  v3 = objc_msgSend(a1, "countOfVisibleNotesInCollection:", v2);

  return v3;
}

- (uint64_t)countOfVisibleNotesForAccount:()ICLegacyContext
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((accountObject) != nil)", "-[NoteContext(ICLegacyContext) countOfVisibleNotesForAccount:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "accountObject");
  v6 = objc_msgSend(a1, "countOfVisibleNotesInCollection:", v5);

  return v6;
}

- (id)allVisibleNoteObjectIDsForAccountWithObjectID:()ICLegacyContext
{
  id v4;
  void *v5;
  os_log_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "collectionForObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (os_log_t)objc_msgSend(a1, "newFetchRequestForNotes");
    objc_msgSend(MEMORY[0x1E0D629F0], "visibleNotesPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    objc_msgSend(v5, "predicateForNotes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v6, "setPredicate:", v10);

    -[NSObject setResultType:](v6, "setResultType:", 1);
    objc_msgSend(a1, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "executeFetchRequest:error:", v6, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    if (v13)
    {
      v14 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NoteContext(ICLegacyContext) allVisibleNoteObjectIDsForAccountWithObjectID:].cold.1((uint64_t)v4, (uint64_t)v13, v14);

    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Collection is nil fetching note IDs for account %@", buf, 0xCu);
    }
    v12 = 0;
  }

  if (v12)
    v15 = v12;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v16 = v15;

  return v16;
}

- (void)performBlock:()ICLegacyContext
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "concurrencyType");

  if (v6)
  {
    objc_msgSend(a1, "managedObjectContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performBlock:", v4);

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NoteContext(ICLegacyContext) performBlock:].cold.1();

    v4[2](v4);
  }
}

- (void)performBlockAndWait:()ICLegacyContext
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "concurrencyType");

  if (v6)
  {
    objc_msgSend(a1, "managedObjectContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performBlockAndWait:", v4);

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NoteContext(ICLegacyContext) performBlockAndWait:].cold.1();

    v4[2](v4);
  }
}

- (id)objectWithID:()ICLegacyContext
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingObjectWithID:()ICLegacyContext error:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingObjectWithID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ic_objectsWithIDs:()ICLegacyContext
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_objectsWithIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reset
{
  id v1;

  objc_msgSend(a1, "managedObjectContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

- (id)attachmentForIdentifier:()ICLegacyContext
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("NoteAttachment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(contentID ==[c] %@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(a1, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NoteContext(ICLegacyContext) attachmentForIdentifier:].cold.1((uint64_t)v4, v9, v10);

  }
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)allVisibleNotesForAccountWithObjectID:()ICLegacyContext .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[NoteContext(ICLegacyContext) allVisibleNotesForAccountWithObjectID:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a2, a3, "%s: noteCollectionObject is unexpectedly nil, objectID = %@", (uint8_t *)&v3);
}

- (void)allVisibleNoteObjectIDsForAccountWithObjectID:()ICLegacyContext .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, (uint64_t)a3, "Error fetching visible note object IDs for account %@: %@", (uint8_t *)&v3);
}

- (void)performBlock:()ICLegacyContext .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v1, v2, "Trying to call performBlock on a legacy context with confinement concurrency type: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)performBlockAndWait:()ICLegacyContext .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v1, v2, "Trying to call performBlockAndWait on a legacy context with confinement concurrency type: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)attachmentForIdentifier:()ICLegacyContext .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  v11 = 2112;
  v12 = v6;
  _os_log_fault_impl(&dword_1BD918000, a3, OS_LOG_TYPE_FAULT, "Error getting attachment with content ID (%@):  %@, %@", (uint8_t *)&v7, 0x20u);

}

@end
