@implementation ICInlineTextAttachment

+ (NSCache)imageCache
{
  if (imageCache_onceToken_1 != -1)
    dispatch_once(&imageCache_onceToken_1, &__block_literal_global_47);
  return (NSCache *)(id)imageCache_imageCache_1;
}

void __36__ICInlineTextAttachment_imageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)imageCache_imageCache_1;
  imageCache_imageCache_1 = (uint64_t)v0;

}

- (ICInlineTextAttachment)initWithAttachment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  ICInlineTextAttachment *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "typeUTI");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E0D63870];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)ICInlineTextAttachment;
  v10 = -[ICAbstractTextAttachment initWithData:ofType:](&v12, sel_initWithData_ofType_, v9, v8);

  if (v10)
    -[ICAbstractTextAttachment setAttachment:](v10, "setAttachment:", v4);

  return v10;
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (id)attachmentInContext:(id)a3
{
  return 0;
}

- (id)inlineAttachmentInContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__42;
  v16 = __Block_byref_object_dispose__42;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v13[5];
  if (v5)
  {
    objc_msgSend(v5, "managedObjectContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__ICInlineTextAttachment_inlineAttachmentInContext___block_invoke;
      v9[3] = &unk_1E5C1D9D0;
      v11 = &v12;
      v10 = v4;
      objc_msgSend(v10, "performBlockAndWait:", v9);

    }
  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__ICInlineTextAttachment_inlineAttachmentInContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v6, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)attachmentAttributesForAttributedString
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSUInteger v10;
  NSRange v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSRange v17;
  NSRange v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v18.location = objc_msgSend(v9, "ic_range");
  v18.length = v10;
  v17.location = location;
  v17.length = length;
  v11 = NSIntersectionRange(v17, v18);
  if (v11.length)
  {
    -[ICInlineTextAttachment attachmentAttributesForAttributedString](self, "attachmentAttributesForAttributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v12, v11.location, v11.length);
    v13 = *MEMORY[0x1E0DC10F8];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      objc_msgSend(v9, "removeAttribute:range:", v13, v11.location, v11.length);
    -[ICInlineTextAttachment displayText](self, "displayText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11.location, v11.length, v15);

  }
  else
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ICInlineTextAttachment fixAttachmentForAttributedString:range:forPlainText:forStandardizedText:].cold.1(self, v16);

  }
}

+ (ICInlineTextAttachment)textAttachmentWithAttachment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "textAttachmentClassForAttachment:", v4)), "initWithAttachment:", v4);

  return (ICInlineTextAttachment *)v5;
}

+ (Class)textAttachmentClassForAttachment:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "attachmentType") > 5)
    v3 = 0;
  else
    v3 = (void *)objc_opt_class();
  return (Class)v3;
}

- (Class)attachmentViewClassForTextContainer:(id)a3
{
  return (Class)objc_opt_class();
}

- (id)attachmentIdentifier
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ICInlineTextAttachment_attachmentIdentifier__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__ICInlineTextAttachment_attachmentIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)attachmentUTI
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__ICInlineTextAttachment_attachmentUTI__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__ICInlineTextAttachment_attachmentUTI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeUTI");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)altText
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ICInlineTextAttachment_altText__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__ICInlineTextAttachment_altText__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)displayText
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ICInlineTextAttachment_displayText__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__ICInlineTextAttachment_displayText__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a4;
  v9 = a6;
  objc_msgSend((id)objc_opt_class(), "imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineTextAttachment attachmentIdentifier](self, "attachmentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    objc_opt_class();
    -[ICAbstractTextAttachment newlyCreatedViewForTextContainer:](self, "newlyCreatedViewForTextContainer:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTintColor:", v17);

      objc_msgSend(v15, "updateStyleWithAttributes:", v8);
      objc_msgSend(v15, "intrinsicContentSize");
      v19 = v18;
      objc_msgSend(v15, "intrinsicContentSize");
      objc_msgSend(v15, "setFrame:", 0.0, 0.0, v19, v20);
      objc_msgSend(v15, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "imageCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInlineTextAttachment attachmentIdentifier](self, "attachmentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v21, v23);

      v13 = v21;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 styleAttributes:(id)a5 textContainer:(id)a6
{
  id v9;
  id v10;
  id v11;
  ICPrintableTextAttachment *v12;
  void *v13;
  void *v14;
  ICPrintableTextAttachment *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = [ICPrintableTextAttachment alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineTextAttachment attachmentUTI](self, "attachmentUTI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICPrintableTextAttachment initWithData:ofType:](v12, "initWithData:ofType:", v13, v14);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ICAbstractTextAttachment newlyCreatedViewForTextContainer:](self, "newlyCreatedViewForTextContainer:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_tintColorWithTraitCollection:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setTintColor:", v19);
  if (v18)
  {
    objc_msgSend(v18, "updateStyleWithAttributes:", v9);
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v18, "intrinsicContentSize");
      v21 = v20;
      objc_msgSend(v18, "intrinsicContentSize");
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, v21, v22);
    }
    objc_msgSend(v18, "imageForPrinting");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPrintableTextAttachment setImage:](v15, "setImage:", v23);

    objc_msgSend(v18, "baselineOffsetFromBottom");
    -[ICPrintableTextAttachment setFrameOffset:](v15, "setFrameOffset:", 0.0, -v24);
  }

  return v16;
}

- (void)fixAttachmentForAttributedString:(void *)a1 range:(NSObject *)a2 forPlainText:forStandardizedText:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Not fixing inline attachment for string because range is invalid {attachment: %@}", (uint8_t *)&v5, 0xCu);

}

@end
