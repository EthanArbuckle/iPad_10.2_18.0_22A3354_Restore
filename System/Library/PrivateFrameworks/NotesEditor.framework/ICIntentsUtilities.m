@implementation ICIntentsUtilities

+ (id)interactionForCreateNote:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a3;
  objc_msgSend(v3, "contentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CBD820]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithSpokenPhrase:", v5);
  v8 = (void *)objc_msgSend(v6, "initWithTitle:content:groupName:", v7, 0, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v8, 0);
  objc_msgSend(v3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setGroupIdentifier:", v10);
  v11 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[ICIntentsUtilities interactionForCreateNote:].cold.1(v9);

  return v9;
}

+ (id)interactionForAppendToNote:(id)a3 withAppendedText:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v27 = a4;
  v5 = a3;
  objc_msgSend(v5, "contentIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modificationDate");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "folderName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CBDA00]);
  v31 = (void *)v7;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithSpokenPhrase:", v7);
  v28 = (void *)v10;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithSpokenPhrase:", v10);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v8;
  objc_msgSend(v14, "components:fromDate:", 64, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v9;
  objc_msgSend(v16, "components:fromDate:", 64, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v6;
  v19 = (void *)objc_msgSend(v11, "initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:", v12, MEMORY[0x1E0C9AA60], v13, v15, v17, v6);

  v20 = objc_alloc(MEMORY[0x1E0CBD768]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC68]), "initWithText:", v27);

  v22 = (void *)objc_msgSend(v20, "initWithTargetNote:content:", v19, v21);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v22, 0);
  objc_msgSend(v5, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setGroupIdentifier:", v24);
  v25 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[ICIntentsUtilities interactionForAppendToNote:withAppendedText:].cold.1(v23);

  return v23;
}

+ (id)interactionForSearchString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = (objc_class *)MEMORY[0x1E0CBDB68];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithSpokenPhrase:", v4);
  v7 = (void *)objc_msgSend(v5, "initWithTitle:content:itemType:status:location:locationSearchType:dateTime:dateSearchType:temporalEventTriggerTypes:taskPriority:notebookItemIdentifier:", v6, v4, 1, 0, 0, 0, 0, 0, 1, 0, 0);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v7, 0);
  v9 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ICIntentsUtilities interactionForSearchString:].cold.1(v8, v9);

  return v8;
}

+ (id)interactionForDeleteNote:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSObject *v14;

  v3 = a3;
  objc_msgSend(v3, "contentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("title"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD970]), "initWithDomain:verb:parametersByName:", CFSTR("Notes"), CFSTR("DeleteNote"), v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v7, 0);
  v9 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ICIntentsUtilities interactionForDeleteNote:].cold.2(v8);

  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0CBD9A8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke;
    v13[3] = &unk_1EA7E0228;
    v14 = v4;
    objc_msgSend(v10, "deleteInteractionsWithGroupIdentifier:completion:", v14, v13);
    v11 = v14;
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICIntentsUtilities interactionForDeleteNote:].cold.1(v3, v11);

  }
  return v8;
}

void __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Intents");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_2((uint64_t)v3, a1, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_1(a1, v5, v6);
  }

}

+ (void)donateInteraction:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ICIntentsUtilities_donateInteraction___block_invoke;
  v6[3] = &unk_1EA7E0228;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "donateInteractionWithCompletion:", v6);

}

void __40__ICIntentsUtilities_donateInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Intents");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_2(a1, (uint64_t)v3, v4);
  }
  else if (v5)
  {
    __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_1(a1, v4, v6);
  }

}

+ (void)interactionForCreateNote:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "Created interaction %@ from INCreateNoteIntent with note identifier %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

+ (void)interactionForAppendToNote:(void *)a1 withAppendedText:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "Created interaction %@ from INAppendToNoteIntent with note identifier %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

+ (void)interactionForSearchString:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, v4, "Created interaction %@ from INSearchForNotebookItemsIntent.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

+ (void)interactionForDeleteNote:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "searchIndexingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Received a note without contentIdentifier when creating a delete intent. Its searchIndexingIdentifier is %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_3();
}

+ (void)interactionForDeleteNote:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "Created interaction %@ from DeleteNote intent with note identifier %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, a3, "Success deleting an interaction for note %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

void __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Error deleting an interaction %@ for note %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_6();
}

void __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, a3, "Successfully donated interaction %@.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

void __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Failed to donate interaction %@, error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_6();
}

@end
