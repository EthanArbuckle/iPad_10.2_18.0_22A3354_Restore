@implementation ICBaseTextView(DragAndDrop)

+ (void)copyTmpFileToTmpFileInSubDirectory:()DragAndDrop uti:suggestedName:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = 0;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Failed to copy URL from %@ to %@: %@", (uint8_t *)&v3, 0x20u);
}

+ (void)copyTmpFileToTmpFileInSubDirectory:()DragAndDrop uti:suggestedName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Failed to create directory with error %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)copyTmpFileToTmpFileInSubDirectory:()DragAndDrop uti:suggestedName:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_1DD7B0000, v0, OS_LOG_TYPE_DEBUG, "Copy file: %@ => %@", v1, 0x16u);
  OUTLINED_FUNCTION_6();
}

- (void)textDraggableView:()DragAndDrop dragSessionWillBegin:.cold.1(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Drag will begin: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textDraggableView:()DragAndDrop dragSessionDidEnd:withOperation:.cold.1(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Drag did end: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textDroppableView:()DragAndDrop willPerformDrop:.cold.1(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Will perform drop: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textDroppableView:()DragAndDrop dropSessionDidEnter:.cold.1(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Drop did enter: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textDroppableView:()DragAndDrop dropSessionDidExit:.cold.1(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Drop did exit: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textDroppableView:()DragAndDrop dropSessionDidEnd:.cold.1(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Drop did end: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textPasteConfigurationSupporting:()DragAndDrop transformPasteItem:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "registeredTypeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Transform paste item types: %@", v4, v5, v6, v7, v8);

}

- (void)textPasteConfigurationSupporting:()DragAndDrop transformPasteItem:.cold.2(void *a1)
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

  objc_msgSend(a1, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v4, v5, "Transform paste item: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, a3, "Inserting dropped text end: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Filtering string for dropped text", v1, 2u);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, v0, v1, "Inserting dropped text begin to range: %@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, v6, "Perform paste: %@", v7);

  OUTLINED_FUNCTION_0_0();
}

@end
