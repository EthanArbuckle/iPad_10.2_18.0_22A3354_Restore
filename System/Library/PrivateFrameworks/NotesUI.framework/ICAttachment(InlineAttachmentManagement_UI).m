@implementation ICAttachment(InlineAttachmentManagement_UI)

- (void)filterInlineAttachmentsInTableColumnTextStorage:()InlineAttachmentManagement_UI range:
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  objc_msgSend(v8, "beginSkippingTimestampUpdates");
  v9 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke;
  v11[3] = &unk_1E5C22B38;
  v11[4] = a1;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, a4, a5, 0, v11);
  objc_msgSend(v10, "endSkippingTimestampUpdates");

}

- (id)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v6 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "isInlineAttachment:", v6))
  {
    v7 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_22;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EECADDB0))
  {
    objc_msgSend(a1, "inlineAttachmentWithICTTAttachment:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_21;
  }
  else
  {
    v7 = 0;
  }
  if (a4)
  {
    v8 = v6;
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICAttachment(InlineAttachmentManagement_UI) inlineAttachmentFromObject:createIfNecessary:].cold.3((uint64_t)v8, a1, v9);

    objc_msgSend(v8, "attachmentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(a1, "addInlineAttachmentWithIdentifier:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsInitialFetchFromCloud:", 1);
      objc_msgSend(v8, "attachmentUTI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTypeUTI:", v11);

      objc_msgSend(v7, "typeUTI");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[ICAttachment(InlineAttachmentManagement_UI) inlineAttachmentFromObject:createIfNecessary:].cold.2((uint64_t)v8, a1);

        objc_msgSend(v7, "setTypeUTI:", *MEMORY[0x1E0D63870]);
      }
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ICAttachment(InlineAttachmentManagement_UI) inlineAttachmentFromObject:createIfNecessary:].cold.1((uint64_t)v8, a1);

      v7 = 0;
    }

  }
LABEL_21:
  if (v7)
  {
LABEL_22:
    objc_msgSend(v7, "setParentAttachment:", a1);
    objc_msgSend(a1, "addInlineAttachmentsObject:", v7);
    objc_msgSend(a1, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNote:", v15);

    objc_msgSend(a1, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addInlineAttachmentsObject:", v7);

  }
LABEL_23:

  return v7;
}

- (id)inlineAttachmentWithICTTAttachment:()InlineAttachmentManagement_UI
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "inlineAttachments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v14 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(a1, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attachmentWithIdentifier:context:", v4, v15);
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
}

- (void)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Found an inline attachment (%@) in text of note (%@) that doesn't have an identifier", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Found an inline attachment (%@) in text of attachment (%@) that doesn't have a typeUTI", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Trying to get an inline attachment (%@) that we haven't downloaded yet for an attachment (%@). Creating a temporary one.", v5, 0x16u);

  OUTLINED_FUNCTION_4();
}

@end
