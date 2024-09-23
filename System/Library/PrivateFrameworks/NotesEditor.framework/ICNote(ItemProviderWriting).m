@implementation ICNote(ItemProviderWriting)

+ (void)writableTypeIdentifiersForItemProvider
{
  return &unk_1EA821ED0;
}

- (id)writableTypeIdentifiersForNoteContent
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", *MEMORY[0x1E0D637F0]);
  objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v1);

  v2 = (void *)*MEMORY[0x1E0CEC4E8];
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "containsObject:", v3);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "insertObject:atIndex:", v5, 1);

  }
  objc_msgSend(v0, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "isPasswordProtected") && !objc_msgSend(a1, "isAuthenticated"))
  {
    v3 = &unk_1EA821EE8;
  }
  else
  {
    objc_msgSend(a1, "writableTypeIdentifiersForNoteContent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayByAddingObject:", CFSTR("com.apple.notes.noteitemprovider"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (uint64_t)itemProviderType
{
  return 1;
}

- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting
{
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0D637F0]))
    return 3;
  else
    return 0;
}

- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.notes.noteitemprovider")))
  {
    v8 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICNote(ItemProviderWriting) loadDataWithTypeIdentifier:forItemProviderCompletionHandler:].cold.1(v8);

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    objc_msgSend(a1, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v13[3] = &unk_1EA7DD378;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v11 = v9;
    objc_msgSend(v10, "performBackgroundTask:", v13);

  }
  return 0;
}

- (void)prepareForCopyingData
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(a1, "textStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "filterAttachmentsInTextStorage:range:", v5, 0, objc_msgSend(v5, "length"));
  }
  else
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v3 = objc_alloc_init(MEMORY[0x1E0D64D48]);
      objc_msgSend(v3, "setNote:firstVisibleLocation:", a1, 0);
    }
    else
    {
      v3 = objc_alloc_init(MEMORY[0x1E0D64DB0]);
      v4 = -[ICLayoutManager initForTemporaryProcessing:]([ICLayoutManager alloc], "initForTemporaryProcessing:", 1);
      objc_msgSend(v3, "setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:", a1, 0, v4);

    }
    objc_msgSend(a1, "filterAttachmentsInTextStorage:range:", v5, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "setStyler:", 0);
  }

}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()ItemProviderWriting
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "_preferredRepresentationForItemProviderWritableTypeIdentifier:");
}

- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v14[3] = &unk_1EA7DD378;
  v15 = v8;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v14);

  return 0;
}

- (void)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Data should never be requested for the item provider UTI", v1, 2u);
}

@end
