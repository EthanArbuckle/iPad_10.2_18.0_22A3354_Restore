@implementation ICBaseTextAttachment

void __44__ICBaseTextAttachment_attachmentIdentifier__block_invoke(uint64_t a1)
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
  v11 = __Block_byref_object_copy__49;
  v12 = __Block_byref_object_dispose__49;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICBaseTextAttachment_attachmentIdentifier__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (ICBaseTextAttachment)initWithAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __CFString *v11;
  void *v12;
  ICBaseTextAttachment *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v4, "typeUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "typeUTIIsInlineDrawing:", v6);

  if ((_DWORD)v5)
  {
    v7 = (id *)MEMORY[0x1E0CD12D8];
LABEL_6:
    v11 = (__CFString *)*v7;
    goto LABEL_9;
  }
  v8 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v4, "typeUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "typeUTIIsSystemPaper:", v9))
  {
    v10 = +[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled");

    if (v10)
    {
      v7 = (id *)MEMORY[0x1E0CD12E0];
      goto LABEL_6;
    }
  }
  else
  {

  }
  v11 = CFSTR("com.apple.notes.textattachment");
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICAbstractTextAttachment initWithData:ofType:](self, "initWithData:ofType:", v12, v11);

  if (v13)
    -[ICAbstractTextAttachment setAttachment:](v13, "setAttachment:", v4);

  return v13;
}

- (id)attachmentInContext:(id)a3
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
  v15 = __Block_byref_object_copy__49;
  v16 = __Block_byref_object_dispose__49;
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
      v9[2] = __44__ICBaseTextAttachment_attachmentInContext___block_invoke;
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

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)ICBaseTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v21, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = v7;
  if ((v12 == 0.0 || v7 == 0.0) && PKIsInlineDrawingOrPaperAttachment())
  {
    if (v13 == 0.0)
    {
      v15 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:].cold.2();

      v13 = 1.0;
    }
    if (v14 == 0.0)
    {
      v16 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:].cold.1();

      v14 = 1.0;
    }
  }
  v17 = v9;
  v18 = v11;
  v19 = v13;
  v20 = v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)image
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0C9DDC8], "emptyImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithCIImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isUnsupported
{
  return 0;
}

- (BOOL)canDragWithoutSelecting
{
  return 1;
}

- (double)viewCornerRadius
{
  return 0.0;
}

- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;

  length = a4.length;
  location = a4.location;
  v21 = a3;
  -[ICBaseTextAttachment attachmentAttributesForAttributedString](self, "attachmentAttributesForAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAttributes:range:", v9, location, length);
  v10 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v21, "removeAttribute:range:", v10, location, length);
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v13, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v21, "replaceCharactersInRange:withString:", location, length, v17);
  }
  else
  {
    -[ICBaseTextAttachment attachmentAsNSTextAttachment](self, "attachmentAsNSTextAttachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileWrapper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isDirectory");

    if (v20)
      objc_msgSend(v21, "replaceCharactersInRange:withString:", location, length, &stru_1E5C2F8C0);
  }

}

- (id)attachmentAttributesForAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextAttachment attachmentAsNSTextAttachment](self, "attachmentAsNSTextAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC10F8]);
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1160]);
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  return 0;
}

- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3
{
  void *v3;
  signed __int16 v4;

  -[ICAbstractTextAttachment attachment](self, "attachment", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredViewSize");

  return v4;
}

- (BOOL)supportsUserConfigurablePresentationSizeForTextContainer:(id)a3
{
  id v4;
  int v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICBaseTextAttachment;
  if (-[ICAbstractTextAttachment supportsUserConfigurablePresentationSizeForTextContainer:](&v9, sel_supportsUserConfigurablePresentationSizeForTextContainer_, v4))
  {
    v5 = -[ICBaseTextAttachment effectiveAttachmentViewSizeForTextContainer:](self, "effectiveAttachmentViewSizeForTextContainer:", v4);
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == objc_msgSend(v6, "preferredViewSize");

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  v11 = __Block_byref_object_copy__49;
  v12 = __Block_byref_object_dispose__49;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ICBaseTextAttachment_attachmentUTI__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__ICBaseTextAttachment_attachmentUTI__block_invoke(uint64_t a1)
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

void __44__ICBaseTextAttachment_attachmentInContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v6, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)inlineAttachmentInContext:(id)a3
{
  return 0;
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFirstResponder"))
  {
    objc_msgSend(v6, "nextResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          break;
        objc_msgSend(v8, "nextResponder");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
        if (!v9)
          goto LABEL_6;
      }
      objc_opt_class();
      ICDynamicCast();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_6:
      v10 = 0;
    }
    v11 = objc_msgSend(v10, "shouldAvoidBecomingFirstResponder");
    objc_msgSend(v10, "setShouldAvoidBecomingFirstResponder:", 1);
    objc_msgSend(v6, "resignFirstResponder");
    objc_msgSend(v10, "setShouldAvoidBecomingFirstResponder:", v11);
    objc_msgSend(v6, "superview");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v7)
      objc_msgSend(v6, "removeFromSuperview");

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextAttachment;
    -[ICBaseTextAttachment detachView:fromParentView:](&v13, sel_detachView_fromParentView_, v6, v7);
  }

}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)ICBaseTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v20, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v6;
  if ((v11 == 0.0 || v6 == 0.0) && PKIsInlineDrawingOrPaperAttachment())
  {
    if (v12 == 0.0)
    {
      v14 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:].cold.2();

      v12 = 1.0;
    }
    if (v13 == 0.0)
    {
      v15 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:].cold.1();

      v13 = 1.0;
    }
  }
  v16 = v8;
  v17 = v10;
  v18 = v12;
  v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Fixing zero-height inline drawing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Fixing zero-width inline drawing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
