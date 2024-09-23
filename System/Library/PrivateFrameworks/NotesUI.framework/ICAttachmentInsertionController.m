@implementation ICAttachmentInsertionController

- (void)setAttachmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentDelegate, a3);
}

- (ICAttachmentInsertionController)initWithNote:(id)a3
{
  id v4;
  ICAttachmentInsertionController *v5;
  ICAttachmentInsertionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentInsertionController;
  v5 = -[ICAttachmentInsertionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_note, v4);

  return v6;
}

- (ICAttachmentInsertionController)init
{
  -[ICAttachmentInsertionController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)addAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAttachmentInsertionController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentInsertionController addAttachment:atTextLocation:](self, "addAttachment:atTextLocation:", v4, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addAttachment:(id)a3 atTextLocation:(unint64_t)a4
{
  return -[ICAttachmentInsertionController addAttachment:atTextRange:](self, "addAttachment:atTextRange:", a3, a4, 0);
}

- (id)addAttachment:(id)a3 atTextRange:(_NSRange)a4
{
  NSUInteger length;
  unint64_t location;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  ICAttachmentInsertionController *v31;
  NSRange v32;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v31 = self;
  -[ICAttachmentInsertionController note](self, "note");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (location > objc_msgSend(v8, "length"))
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v32.location = location;
      v32.length = length;
      -[ICAttachmentInsertionController addAttachment:atTextRange:].cold.1(v32);
    }

    location = objc_msgSend(v8, "length");
  }
  -[ICAttachmentInsertionController attachmentDelegate](v31, "attachmentDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "attachmentInsertionController:willAddAttachment:atRange:", v31, v7, location, length);
  +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v11, 0, objc_msgSend(v13, "length"));
  objc_msgSend(v30, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (uint64_t *)MEMORY[0x1E0D63928];
  objc_msgSend(v14, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0D63C90]);
  v29 = v16;
  objc_msgSend(v17, "setBlockQuoteLevel:", objc_msgSend(v16, "blockQuoteLevel"));
  v18 = *v15;
  v19 = objc_msgSend(v13, "ic_range");
  objc_msgSend(v13, "addAttribute:value:range:", v18, v17, v19, v20);
  objc_msgSend(v8, "beginSkippingTimestampUpdates");
  objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", location, length, v13);
  objc_msgSend(v8, "endSkippingTimestampUpdates");
  objc_msgSend(v8, "fixupAfterEditing");
  objc_msgSend(v7, "updateChangeCountWithReason:", CFSTR("Added attachment"));
  objc_msgSend(v7, "media");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateChangeCountWithReason:", CFSTR("Added attachment"));

  objc_msgSend(v7, "attachmentModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v22, "showThumbnailInNoteList");

  if ((_DWORD)v21)
    v23 = (id)objc_msgSend(v7, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E0D63660]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = objc_msgSend(v8, "ic_rangeForAttachment:withTextAttachment:", v7, 0);
    v26 = v25;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimestamp:range:", v27, v24, v26);

    objc_msgSend(v10, "attachmentInsertionController:didAddAttachment:atRange:", v31, v7, v24, v26);
  }

  return v11;
}

- (id)addInlineAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAttachmentInsertionController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentInsertionController addInlineAttachment:atTextRange:](self, "addInlineAttachment:atTextRange:", v4, objc_msgSend(v6, "length"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addInlineAttachment:(id)a3 atTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[ICAttachmentInsertionController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentInsertionController _addInlineAttachment:inTextStorage:atTextRange:](self, "_addInlineAttachment:inTextStorage:atTextRange:", v7, v9, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addInlineAttachment:(id)a3 atTextRange:(_NSRange)a4 textView:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  objc_opt_class();
  objc_msgSend(v9, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentInsertionController _addInlineAttachment:inTextStorage:atTextRange:](self, "_addInlineAttachment:inTextStorage:atTextRange:", v10, v12, location, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_addInlineAttachment:(id)a3 inTextStorage:(id)a4 atTextRange:(_NSRange)a5
{
  NSUInteger length;
  unint64_t location;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSRange v22;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  if (location > objc_msgSend(v10, "length"))
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v22.location = location;
      v22.length = length;
      -[ICAttachmentInsertionController _addInlineAttachment:inTextStorage:atTextRange:].cold.1(v22);
    }

    location = objc_msgSend(v10, "length");
  }
  -[ICAttachmentInsertionController attachmentDelegate](self, "attachmentDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "attachmentInsertionController:willAddInlineAttachment:atRange:textStorage:", self, v9, location, length, v10);
  objc_msgSend(v10, "attributesAtIndex:effectiveRange:", location, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInlineAttachmentUIModel filteredStyleAttributes:](ICInlineAttachmentUIModel, "filteredStyleAttributes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  +[ICInlineTextAttachment textAttachmentWithAttachment:](ICInlineTextAttachment, "textAttachmentWithAttachment:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DC10F8]);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "addAttributes:range:", v15, 0, objc_msgSend(v18, "length"));
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", location, length, v18);
  objc_msgSend(v10, "fixupAfterEditing");
  objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Added inline attachment"));
  -[ICAttachmentInsertionController note](self, "note");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateChangeCountWithReason:", CFSTR("Added inline attachment"));

  -[ICAttachmentInsertionController note](self, "note");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "save");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "attachmentInsertionController:didAddInlineAttachment:atRange:textStorage:", self, v9, location + 1, 0, v10);

  return v16;
}

- (ICAttachmentInsertionDelegate)attachmentDelegate
{
  return (ICAttachmentInsertionDelegate *)objc_loadWeakRetained((id *)&self->_attachmentDelegate);
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
}

- (void)addAttachment:(NSRange)a1 atTextRange:.cold.1(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v2, v3, "Attempted to addAttachment:atTextRange: with an out of bound range: %@. Adding attachment to the end of text storage instead, %lu.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)_addInlineAttachment:(NSRange)a1 inTextStorage:atTextRange:.cold.1(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v2, v3, "Attempted to addInlineAttachment:atTextRange: with an out of bound range: %@. Adding token attachment to the end of text storage instead, %lu.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

@end
