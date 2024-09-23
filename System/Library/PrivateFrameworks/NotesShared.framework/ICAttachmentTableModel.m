@implementation ICAttachmentTableModel

- (void)attachmentAwakeFromFetch
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentTableModel;
  -[ICAttachmentModel attachmentAwakeFromFetch](&v8, sel_attachmentAwakeFromFetch);
  if (self->_tableDocument)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentMergeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__ICAttachmentTableModel_attachmentAwakeFromFetch__block_invoke;
      v7[3] = &unk_1E76C73F8;
      v7[4] = self;
      objc_msgSend(v6, "requestMergeWithBlock:", v7);

    }
    else
    {
      -[ICAttachmentTableModel mergeTablePrimitiveData](self, "mergeTablePrimitiveData");
    }
  }
}

uint64_t __50__ICAttachmentTableModel_attachmentAwakeFromFetch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeTablePrimitiveData");
}

- (void)attachmentWillTurnIntoFault
{
  ICTableVersionedDocument *tableDocument;

  if (!-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty"))
  {
    tableDocument = self->_tableDocument;
    self->_tableDocument = 0;

  }
}

- (void)attachmentWillRefresh:(BOOL)a3
{
  ICTableVersionedDocument *tableDocument;

  if (!-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty", a3))
  {
    tableDocument = self->_tableDocument;
    self->_tableDocument = 0;

  }
}

- (void)attachmentDidRefresh:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;

  -[ICAttachmentModel attachment](self, "attachment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTableAttachmentProvider notifyProviderForRefreshToAttachment:](ICTableAttachmentProvider, "notifyProviderForRefreshToAttachment:", v4);

  if (self->_tableDocument && -[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty"))
  {
    v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentTableModel attachmentDidRefresh:].cold.3(self, v5);

    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = os_log_create("com.apple.notes", "CoreData");
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
        -[ICAttachmentTableModel attachmentDidRefresh:].cold.2();
    }
    else if (v9)
    {
      -[ICAttachmentTableModel attachmentDidRefresh:].cold.1();
    }

  }
}

- (id)stringsAtRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentTableModel table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rowCount");

  if (v7 > a3)
  {
    -[ICAttachmentTableModel table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__ICAttachmentTableModel_stringsAtRow___block_invoke;
    v12[3] = &unk_1E76CBA48;
    v13 = v5;
    objc_msgSend(v8, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, v9, 0, v12);

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

uint64_t __39__ICAttachmentTableModel_stringsAtRow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v4);
  return 0;
}

- (id)searchableTextContent
{
  void *v2;
  void *v3;

  -[ICAttachmentTableModel searchableTextContentInNote](self, "searchableTextContentInNote");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchableTextContentInNote
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];

  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  -[ICAttachmentTableModel table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__ICAttachmentTableModel_searchableTextContentInNote__block_invoke;
  v15[3] = &unk_1E76CBA70;
  v9 = v7;
  v16 = v9;
  v10 = v5;
  v17 = v10;
  v11 = v3;
  v18 = v11;
  v19 = v20;
  objc_msgSend(v8, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v15);

  v12 = v18;
  v13 = v11;

  _Block_object_dispose(v20, 8);
  return v13;
}

uint64_t __53__ICAttachmentTableModel_searchableTextContentInNote__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "string");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = *(_QWORD *)(a1 + 40);
    v17[0] = CFSTR("SearchTableIdentifier");
    v17[1] = CFSTR("SearchTableColumn");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    v17[2] = CFSTR("SearchTableRow");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v14);
    objc_msgSend(*(id *)(a1 + 48), "appendAttributedString:", v15);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v11, "length");

  }
  return 0;
}

- (BOOL)providesTextContentInNote
{
  return 1;
}

- (id)textContentInNote
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)regenerateTextContentInNote
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[ICAttachmentTableModel table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__ICAttachmentTableModel_regenerateTextContentInNote__block_invoke;
  v11[3] = &unk_1E76CBA98;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v10 = v4;
  objc_msgSend(v6, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSummary:", v8);

}

uint64_t __53__ICAttachmentTableModel_regenerateTextContentInNote__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "appendString:", v6);
  }
  return 0;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

- (void)willMarkAttachmentForDeletion
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICAttachmentTableModel;
  -[ICAttachmentModel willMarkAttachmentForDeletion](&v2, sel_willMarkAttachmentForDeletion);
}

- (void)persistPendingChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "concurrencyType");

  if (v5 == 2)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[ICTableAttachmentProvider saveAttachmentOnMainThread:](ICTableAttachmentProvider, "saveAttachmentOnMainThread:", v6);

  }
}

- (BOOL)usesChildAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentTableModel table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__ICAttachmentTableModel_usesChildAttachment___block_invoke;
  v11[3] = &unk_1E76CBAC0;
  v8 = v6;
  v12 = v8;
  v9 = v4;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v7, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v11);

  LOBYTE(v7) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v7;
}

uint64_t __46__ICAttachmentTableModel_usesChildAttachment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "ic_range");
  v9 = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__ICAttachmentTableModel_usesChildAttachment___block_invoke_2;
  v13[3] = &unk_1E76C7FF8;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v14 = v10;
  v15 = v11;
  objc_msgSend(v4, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v5, v7, v9, 0, v13);

  return 0;
}

uint64_t __46__ICAttachmentTableModel_usesChildAttachment___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) == a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (void)replaceChildInlineAttachment:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t, void *, uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v7 = a4;
  -[ICAttachmentTableModel table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke;
  v19 = &unk_1E76CBA70;
  v11 = v10;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v13 = v7;
  v22 = v13;
  v23 = &v24;
  objc_msgSend(v8, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, &v16);
  if (*((_BYTE *)v25 + 24))
  {
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1, v16, v17, v18, v19, v20, v21);
    -[ICAttachmentModel attachment](self, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "saveMergeableDataIfNeeded");

    -[ICAttachmentModel attachment](self, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Replaced inline attachment"));

  }
  _Block_object_dispose(&v24, 8);

}

id __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a2;
  objc_msgSend(v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = objc_msgSend(v8, "ic_range");
  v12 = v11;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke_2;
  v18[3] = &unk_1E76CBAE8;
  v19 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = *(_QWORD *)(a1 + 56);
  v21 = v13;
  v22 = v14;
  v23 = a5;
  objc_msgSend(v8, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v9, v10, v12, 0, v18);
  v15 = v21;
  v16 = v13;

  return v16;
}

void __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BYTE *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "attachmentType") == 1)
  {
    objc_msgSend(v14, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "replaceCharactersInRange:withAttributedString:", a3, a4, v12);
      v13 = *(_BYTE **)(a1 + 64);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *a5 = 1;
      *v13 = 1;

    }
  }

}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_TABLES_%lu"), CFSTR("NOTE_LIST_TABLES_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICTable)table
{
  void *v2;
  void *v3;

  -[ICAttachmentTableModel tableDocument](self, "tableDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTable *)v3;
}

- (ICTableVersionedDocument)tableDocument
{
  ICTableVersionedDocument *tableDocument;
  void *v4;
  void *v5;
  ICTableVersionedDocument *v6;
  ICTableVersionedDocument *v7;
  ICTableVersionedDocument *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  tableDocument = self->_tableDocument;
  if (!tableDocument)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__30;
    v21 = __Block_byref_object_dispose__30;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__30;
    v15 = __Block_byref_object_dispose__30;
    v16 = 0;
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__ICAttachmentTableModel_tableDocument__block_invoke;
    v10[3] = &unk_1E76C7A60;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = &v11;
    objc_msgSend(v5, "performBlockAndWait:", v10);

    v6 = [ICTableVersionedDocument alloc];
    v7 = -[ICTTVersionedDocument initWithData:replicaID:](v6, "initWithData:replicaID:", v18[5], v12[5]);
    v8 = self->_tableDocument;
    self->_tableDocument = v7;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v17, 8);

    tableDocument = self->_tableDocument;
  }
  return tableDocument;
}

void __39__ICAttachmentTableModel_tableDocument__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "currentReplicaID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)mergeableDataForCopying:(id *)a3
{
  void *v5;
  ICTableVersionedDocument *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  ICTableVersionedDocument *v12;
  void *v13;
  void *v14;
  void *v15;
  ICTableVersionedDocument *v16;
  void *v17;
  _QWORD v19[5];
  ICTableVersionedDocument *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)ICAttachmentTableModel;
  -[ICAttachmentModel mergeableDataForCopying:](&v28, sel_mergeableDataForCopying_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [ICTableVersionedDocument alloc];
    -[ICAttachmentTableModel table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "columnCount");
    -[ICAttachmentTableModel table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rowCount");
    -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICTableVersionedDocument initWithColumnCount:rowCount:replicaID:](v6, "initWithColumnCount:rowCount:replicaID:", v8, v10, v11);

    -[ICAttachmentTableModel table](self, "table");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v13, "isRightToLeft");

    if ((_DWORD)v8)
    {
      -[ICTableVersionedDocument table](v12, "table");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reverseColumnDirection");

    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__30;
    v26 = __Block_byref_object_dispose__30;
    v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[ICAttachmentTableModel table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke;
    v19[3] = &unk_1E76CBAC0;
    v19[4] = self;
    v16 = v12;
    v20 = v16;
    v21 = &v22;
    objc_msgSend(v15, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v19);

    if (a3)
      *a3 = (id)objc_msgSend((id)v23[5], "copy");
    -[ICTTVersionedDocument serialize](v16, "serialize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];

  objc_msgSend(a2, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedString:columnIndex:rowIndex:", v10, a3, a4);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "ic_range");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke_2;
  v17[3] = &unk_1E76C7E80;
  v17[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v10, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v13, v14, v15, 0, v17);

  return 0;
}

void __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "markedForDeletion") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "ic_addNonNilObject:", v3);

}

- (BOOL)isReadyToPresent
{
  return 0;
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ICTableVersionedDocument *v16;
  void *v17;
  ICTableVersionedDocument *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a4;
  if (a3)
  {
    v7 = a3;
    v8 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentTableModel mergeWithMergeableData:mergeableFieldState:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = [ICTableVersionedDocument alloc];
    -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ICTTVersionedDocument initWithData:replicaID:](v16, "initWithData:replicaID:", v7, v17);

    -[ICAttachmentTableModel tableDocument](self, "tableDocument");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mergeWithTableVersionedDocument:", v18);

    v21 = v20 == 2;
    if (v20 == 2)
    {
      v22 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[ICAttachmentTableModel mergeWithMergeableData:mergeableFieldState:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

      -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
      -[ICAttachmentTableModel writeCurrentTimestampToMergeableFieldStateIfNecessary:](self, "writeCurrentTimestampToMergeableFieldStateIfNecessary:", v6);
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C95048], "ic_encryptedKeyForKeyPrefix:", CFSTR("MergeableData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentTableModel table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ttDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sharedTopotextTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "serialize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v4, "setObject:forKey:", v9, v5);
    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICAttachmentTableModel writeCurrentTimestampToMergeableFieldStateIfNecessary:].cold.1(self, v10);

    }
  }

}

- (void)writeMergeableData
{
  void *v3;
  void *v4;
  id v5;

  if (-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty"))
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 0);
  -[ICAttachmentTableModel tableDocument](self, "tableDocument");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMergeableData:", v3);

}

- (void)updateAttachmentByMergingWithTableData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[ICAttachmentTableModel table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mergeWithData:", v4);

  if (v7 == 2)
  {
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
    -[ICAttachmentModel attachment](self, "attachment");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentDidChange");

  }
}

- (void)mergeTablePrimitiveData
{
  void *v3;
  void *v4;
  id v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primitiveValueForEncryptableKey:", CFSTR("mergeableData"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    -[ICAttachmentModel mergeWithMergeableData:](self, "mergeWithMergeableData:", v5);
    v4 = v5;
  }

}

- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a5;
  -[ICAttachmentModel attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPasswordProtected");

  if (v10)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.attachment.isPasswordProtected", "-[ICAttachmentTableModel addMergeableDataToCloudKitRecord:approach:mergeableFieldState:]", 1, 0, CFSTR("Locked notes should use encrypted values JSON instead"));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C95048], "ic_encryptedKeyForKeyPrefix:", CFSTR("MergeableData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v8, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      +[ICCRTTCompatibleDocument makeSharedTopotextTimestampFromData:](ICCRTTCompatibleDocument, "makeSharedTopotextTimestampFromData:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentTableModel table](self, "table");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ttDocument");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sharedTopotextTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v18 = objc_msgSend(v14, "compareTo:", v17);

        if (!v18)
          goto LABEL_13;
        goto LABEL_10;
      }

    }
  }
LABEL_10:
  -[ICAttachmentModel attachment](self, "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mergeableData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v21, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v20, CFSTR("MergeableData"), a4);

LABEL_13:
  -[ICAttachmentTableModel writeCurrentTimestampToMergeableFieldStateIfNecessary:](self, "writeCurrentTimestampToMergeableFieldStateIfNecessary:", v8);

}

+ (id)tableFromAttributedString:(id)a3 managedObjectContext:(id)a4 replicaID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICTableVersionedDocument *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length"))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_truncated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[ICTTVersionedDocument initWithData:replicaID:]([ICTableVersionedDocument alloc], "initWithData:replicaID:", 0, v9);
    -[ICTableVersionedDocument table](v14, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "insertColumnAtIndex:", 0);
    v17 = objc_msgSend(v7, "length");
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke;
    v25 = &unk_1E76CBB38;
    v26 = v7;
    v18 = v15;
    v27 = v18;
    v19 = v13;
    v28 = v19;
    v29 = v8;
    objc_msgSend(v26, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v17, 0, &v22);
    if (!objc_msgSend(v18, "rowCount", v22, v23, v24, v25))
      v20 = (id)objc_msgSend(v18, "insertRowAtIndex:", 0);
    if (!objc_msgSend(v18, "rowCount") || !objc_msgSend(v18, "columnCount"))
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "icTable.rowCount > 0 && icTable.columnCount > 0", "+[ICAttachmentTableModel tableFromAttributedString:managedObjectContext:replicaID:]", 1, 0, CFSTR("Table from attributed string must have at least one row and one column"));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;

  v7 = a2;
  if (!v7)
  {
    v8 = 0;
LABEL_17:
    objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "length");
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke_2;
    v30[3] = &unk_1E76CBB10;
    v34 = a3;
    v35 = a4;
    v31 = v25;
    v32 = *(id *)(a1 + 40);
    v33 = *(id *)(a1 + 48);
    v28 = v25;
    objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", 0, v27, 1, v30);

    goto LABEL_18;
  }
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || +[ICTTAttachment isInlineAttachment:](ICTTAttachment, "isInlineAttachment:", v8))
    goto LABEL_17;
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v8, "attachmentInContext:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isTable"))
    {
      objc_msgSend(v9, "tableModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(*(id *)(a1 + 40), "rowCount");
      v12 = (id)objc_msgSend(*(id *)(a1 + 40), "insertRows:atIndex:", objc_msgSend(v11, "rowCount"), v29);
      v13 = objc_msgSend(v11, "columnCount");
      if (v13 > objc_msgSend(*(id *)(a1 + 40), "columnCount"))
        v14 = (id)objc_msgSend(*(id *)(a1 + 40), "insertColumns:atIndex:", objc_msgSend(v11, "columnCount")- objc_msgSend(*(id *)(a1 + 40), "columnCount"), objc_msgSend(*(id *)(a1 + 40), "columnCount"));
      if (objc_msgSend(v11, "rowCount"))
      {
        v15 = 0;
        do
        {
          if (objc_msgSend(v11, "columnCount"))
          {
            v16 = 0;
            do
            {
              objc_msgSend(v11, "stringForColumnIndex:rowIndex:", v16, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(v17, "mutableCopy");

              v19 = ICTTAttributeNameTimestamp;
              v20 = *(_QWORD *)(a1 + 48);
              v21 = objc_msgSend(v18, "ic_range");
              objc_msgSend(v18, "addAttribute:value:range:", v19, v20, v21, v22);
              v23 = *(void **)(a1 + 40);
              v24 = (void *)objc_msgSend(v18, "copy");
              objc_msgSend(v23, "setAttributedString:columnIndex:rowIndex:", v24, v16, v15 + v29);

              ++v16;
            }
            while (v16 < objc_msgSend(v11, "columnCount"));
          }
          ++v15;
        }
        while (v15 < objc_msgSend(v11, "rowCount"));
      }

    }
  }
LABEL_18:

}

void __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id obj;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (*(_QWORD *)(a1 + 56))
    v8 = a4 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\t"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "columnCount");
    v11 = objc_msgSend(v9, "count");
    v12 = v11 - v10;
    if (v11 > v10)
      v13 = (id)objc_msgSend(*(id *)(a1 + 40), "insertColumns:atIndex:", v12, v10);
    v34 = objc_msgSend(*(id *)(a1 + 40), "rowCount", v12);
    v14 = (id)objc_msgSend(*(id *)(a1 + 40), "insertRowAtIndex:");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(obj);
          objc_msgSend(v35, "attributedSubstringFromRange:", v18, objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v20), "length"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          v23 = objc_msgSend(v22, "ic_range");
          objc_msgSend(v22, "ic_convertParagraphStyleToBodyInRange:", v23, v24);
          v25 = ICTTAttributeNameTimestamp;
          v26 = *(_QWORD *)(a1 + 48);
          v27 = objc_msgSend(v22, "ic_range");
          objc_msgSend(v22, "addAttribute:value:range:", v25, v26, v27, v28);
          v29 = *(void **)(a1 + 40);
          v30 = (void *)objc_msgSend(v22, "copy");
          objc_msgSend(v29, "setAttributedString:columnIndex:rowIndex:", v30, v17 + v20, v34);

          v31 = objc_msgSend(v22, "length");
          v18 += v31 + objc_msgSend(CFSTR("\t"), "length");

          ++v20;
        }
        while (v16 != v20);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        v17 += v20;
      }
      while (v16);
    }

    v7 = v32;
  }

}

- (void)updateAfterLoadWithInlineAttachmentIdentifierMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[ICAttachmentTableModel table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke;
  v9[3] = &unk_1E76CBB88;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v7, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v9);
  if (*((_BYTE *)v14 + 24))
  {
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
    -[ICAttachmentModel attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveMergeableDataIfNeeded");

  }
  _Block_object_dispose(&v13, 8);

}

uint64_t __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a2;
  objc_msgSend(v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v10 = objc_msgSend(v9, "length");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2;
  v15[3] = &unk_1E76CBB60;
  v18 = &v19;
  v16 = *(id *)(a1 + 32);
  v11 = v9;
  v17 = v11;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v10, 0, v15);
  if (*((_BYTE *)v20 + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v12 = *(void **)(a1 + 40);
    v13 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v12, "setAttributedString:columnIndex:rowIndex:", v13, a3, a4);

  }
  _Block_object_dispose(&v19, 8);

  return 0;
}

void __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  ICTTAttachment *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v7 = a2;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF53E378))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v8 = v7;
    v9 = objc_alloc_init(ICTTAttachment);
    objc_msgSend(v8, "attachmentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_2();

    if (v11)
    {
      -[ICTTAttachment setAttachmentIdentifier:](v9, "setAttachmentIdentifier:", v11);
    }
    else
    {
      v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_1();

    }
    objc_msgSend(v8, "attachmentUTI");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTAttachment setAttachmentUTI:](v9, "setAttachmentUTI:", v14);

    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", CFSTR("NSAttachment"), v9, a3, a4);
  }

}

- (id)localizedFallbackTitle
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Table"), CFSTR("Table"), 0, 1);
}

- (id)localizedFallbackSubtitleIOS
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Upgrade iOS to view this table."), CFSTR("Upgrade iOS to view this table."), 0, 1);
}

- (id)localizedFallbackSubtitleMac
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Upgrade macOS to view this table."), CFSTR("Upgrade macOS to view this table."), 0, 1);
}

- (void)removeTimestampsForReplicaID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[ICAttachmentTableModel table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke;
  v7[3] = &unk_1E76CBA48;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v7);

  -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
  -[ICAttachmentTableModel writeMergeableData](self, "writeMergeableData");

}

id __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "edits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke_2;
  v8[3] = &unk_1E76CBBB0;
  v9 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "ic_containsObjectPassingTest:", v8);

  if (v5)
  {
    objc_msgSend(v3, "removeTimestampsForReplicaID:", *(_QWORD *)(a1 + 32));
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "replicaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setTableDocument:(id)a3
{
  objc_storeStrong((id *)&self->_tableDocument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableDocument, 0);
}

- (void)attachmentDidRefresh:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Unable to fault %@ after being refreshed", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)attachmentDidRefresh:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Faulted %@ after being refreshed", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)attachmentDidRefresh:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v5, "Had a dirty table document after refresh: %@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "ICAttachmentTableModel: Attachment Updated from Merge", a5, a6, a7, a8, 0);
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "ICAttachmentTableModel: mergeWithMergeableData", a5, a6, a7, a8, 0);
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_loggingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v5, "Failed to snapshot CRDT timestamp for table: %@", v6);

  OUTLINED_FUNCTION_2();
}

void __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Unable to map from %@ to new identifier", v2);
  OUTLINED_FUNCTION_1_0();
}

void __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1BD918000, v1, OS_LOG_TYPE_DEBUG, "Update inline attachment after load: %@ => %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
