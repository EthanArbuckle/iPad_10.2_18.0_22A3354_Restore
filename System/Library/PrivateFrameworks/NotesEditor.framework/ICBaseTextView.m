@implementation ICBaseTextView

- (ICTTTextStorage)TTTextStorage
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  NSObject *v8;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[ICBaseTextView textStorage](self, "textStorage"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) == 0))
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICBaseTextView TTTextStorage].cold.1(self, v8);

    v7 = 0;
  }
  else
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (ICTTTextStorage *)v7;
}

void __51__ICBaseTextView_StyleAdditions__ic_canChangeStyle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "ic_selectedRanges");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "canChangeStyleForSelectedRanges:inTextStorage:", v8, v7);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v5;
}

- (void)ic_performBlock:(id)a3
{
  void (**v4)(id, id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id, void *))a3;
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v8, "styler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v8, v7);
}

- (BOOL)ic_canChangeStyle
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ICBaseTextView_StyleAdditions__ic_canChangeStyle__block_invoke;
  v4[3] = &unk_1EA7DFE68;
  v4[4] = self;
  v4[5] = &v5;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)typeIdentifiersSupportedAsGenericFiles
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC498], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC448], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setupTextViewDragAndDropDelegates
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_opt_class();
  -[ICBaseTextView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "insideSiriSnippet");

  if ((v5 & 1) == 0)
  {
    -[ICBaseTextView setTextDragDelegate:](self, "setTextDragDelegate:", self);
    -[ICBaseTextView setTextDropDelegate:](self, "setTextDropDelegate:", self);
    -[ICBaseTextView setPasteDelegate:](self, "setPasteDelegate:", self);
    -[ICBaseTextView pasteConfigurationForCurrentTextView](self, "pasteConfigurationForCurrentTextView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView setPasteConfiguration:](self, "setPasteConfiguration:", v6);

  }
}

- (id)pasteConfigurationForCurrentTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[15];

  v17[14] = *MEMORY[0x1E0C80C00];
  if (-[ICBaseTextView supportsAttachments](self, "supportsAttachments"))
  {
    v17[0] = *MEMORY[0x1E0D637F0];
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v3;
    objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v4;
    objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v5;
    objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DB0770];
    v17[4] = v6;
    v17[5] = v7;
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v8;
    v17[7] = CFSTR("com.apple.iwork.keynote.key");
    v17[8] = CFSTR("com.apple.iwork.numbers.numbers");
    v17[9] = CFSTR("com.apple.iwork.pages.pages");
    v9 = *MEMORY[0x1E0CD12D8];
    v17[10] = CFSTR("com.apple.calendar.ics");
    v17[11] = v9;
    v10 = *MEMORY[0x1E0D63D58];
    v17[12] = *MEMORY[0x1E0CD12E8];
    v17[13] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView typeIdentifiersSupportedAsGenericFiles](self, "typeIdentifiersSupportedAsGenericFiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA8]), "initWithAcceptableTypeIdentifiers:", v13);
  return v14;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)shouldAvoidResigningFirstResponder
{
  return self->_shouldAvoidResigningFirstResponder;
}

- (void)setupLinkTextAttributes
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICBaseTextView linkTextAttributes](self, "linkTextAttributes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA70];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v11 = (id)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0D64B60], "defaultLinkTextAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v7);

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v8 = (void *)objc_msgSend(v11, "copy");
    -[ICBaseTextView setLinkTextAttributes:](self, "setLinkTextAttributes:", v8);
  }
  else
  {
    objc_opt_class();
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIsSettingLinkTextAttributes:", 1);
    v10 = (void *)objc_msgSend(v11, "copy");
    -[ICBaseTextView setLinkTextAttributes:](self, "setLinkTextAttributes:", v10);

    objc_msgSend(v8, "setIsSettingLinkTextAttributes:", 0);
  }

}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setShouldAvoidResigningFirstResponder:(BOOL)a3
{
  self->_shouldAvoidResigningFirstResponder = a3;
}

- (void)setLanguageHasSpaces:(BOOL)a3
{
  self->_languageHasSpaces = a3;
}

- (void)setIcDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_icDelegate, a3);
}

- (void)setEditorController:(id)a3
{
  objc_storeWeak((id *)&self->_editorController, a3);
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  if (-[ICBaseTextView shouldAvoidResigningFirstResponder](self, "shouldAvoidResigningFirstResponder"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  return -[ICBaseTextView resignFirstResponder](&v4, sel_resignFirstResponder);
}

- (NSDictionary)pendingTypingAttributes
{
  return self->_pendingTypingAttributes;
}

- (BOOL)needsStylingRefreshOnNextLayout
{
  return self->_needsStylingRefreshOnNextLayout;
}

- (void)keyboardLocaleChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICBaseTextView textInputMode](self, "textInputMode", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v4, "primaryLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeWithLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView setLanguageHasSpaces:](self, "setLanguageHasSpaces:", ICLanguageUsesSpaces());
  }
  else
  {
    -[ICBaseTextView setLanguageHasSpaces:](self, "setLanguageHasSpaces:", 1);
  }

}

- (BOOL)isInProcessEditingForTextStorage
{
  return self->_isInProcessEditingForTextStorage;
}

- (ICBaseTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  ICBaseTextView *v4;
  ICBaseTextView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  v4 = -[ICBaseTextView initWithFrame:textContainer:](&v7, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[ICBaseTextView commonInit](v4, "commonInit");
  return v5;
}

- (ICBaseTextViewDelegate)icDelegate
{
  return (ICBaseTextViewDelegate *)objc_loadWeakRetained((id *)&self->_icDelegate);
}

- (ICNoteEditorViewController)editorController
{
  return (ICNoteEditorViewController *)objc_loadWeakRetained((id *)&self->_editorController);
}

- (BOOL)dd_ignoreSignatures
{
  return 1;
}

- (void)commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICTextViewRenderingSurfaceView *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;

  -[ICBaseTextView setAllowsEditingTextAttributes:](self, "setAllowsEditingTextAttributes:", 1);
  v3 = objc_alloc(MEMORY[0x1E0DC12E0]);
  -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTextLayoutManager:", v4);
  -[ICBaseTextView setHighlightShapeProvider:](self, "setHighlightShapeProvider:", v5);

  -[ICBaseTextView setupLinkTextAttributes](self, "setupLinkTextAttributes");
  -[ICBaseTextView _allowedTypingAttributes](self, "_allowedTypingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", *MEMORY[0x1E0DC10F8]);
  objc_msgSend(v7, "removeObject:", *MEMORY[0x1E0DC1100]);
  objc_msgSend(MEMORY[0x1E0D63C70], "allowedTypingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  -[ICBaseTextView _setAllowedTypingAttributes:](self, "_setAllowedTypingAttributes:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_respondToTapGesture_);
  -[ICBaseTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v9);

  -[ICBaseTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[ICBaseTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView addGestureRecognizer:](self, "addGestureRecognizer:", v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D64A90];
  -[ICBaseTextView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_textStorageDidEndEditingNotification_, v13, v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_keyboardLocaleChanged_, *MEMORY[0x1E0DC5528], 0);

  -[ICBaseTextView keyboardLocaleChanged:](self, "keyboardLocaleChanged:", 0);
  -[ICBaseTextView setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", ICInternalSettingsIsMathEnabled());
  v16 = objc_alloc_init(ICTextViewRenderingSurfaceView);
  -[ICBaseTextView setRenderingSurfaceView:](self, "setRenderingSurfaceView:", v16);

  -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textViewportLayoutController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __28__ICBaseTextView_commonInit__block_invoke;
  v19[3] = &unk_1EA7E0CA0;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v18, "setRenderingSurfaceUpdater:", v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)applyPendingTypingAttributesIfNeeded
{
  ICBaseTextView *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v2 = self;
  objc_sync_enter(v2);
  -[ICBaseTextView pendingTypingAttributes](v2, "pendingTypingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICBaseTextView setPendingTypingAttributes:](v2, "setPendingTypingAttributes:", 0);
    -[ICBaseTextView pendingTypingAttributes](v2, "pendingTypingAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView setCachedTypingAttributes:](v2, "setCachedTypingAttributes:", v4);

    -[ICBaseTextView pendingTypingAttributes](v2, "pendingTypingAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = v2;
    v6.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView setTypingAttributes:](&v6, sel_setTypingAttributes_, v5);

  }
  objc_sync_exit(v2);

}

+ (id)attachmentInNote:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  if (length == 1)
  {
    objc_msgSend(v6, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__ICBaseTextView_DragAndDrop__attachmentInNote_range___block_invoke;
    v13[3] = &unk_1EA7DD4E8;
    v13[4] = &v14;
    objc_msgSend(v9, "ic_enumerateAttachmentsInContext:range:usingBlock:", v10, location, 1, v13);

    v8 = (void *)v15[5];
  }
  v11 = v8;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __54__ICBaseTextView_DragAndDrop__attachmentInNote_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a5 = 1;
}

+ (id)copyTmpFileToTmpFileInSubDirectory:(id)a3 uti:(id)a4 suggestedName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v36;
  id v37;
  id v38;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || objc_msgSend(v11, "isEqualToString:", CFSTR("tmp")))
  {
    objc_msgSend(MEMORY[0x1E0D639F0], "filenameExtensionForUTI:", v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  if (objc_msgSend(v10, "containsString:", CFSTR("UIKit.ItemProvider")))
  {
    if (v9)
      objc_msgSend(v9, "ic_sanitizedFilenameString");
    else
      objc_msgSend(MEMORY[0x1E0D639F0], "filenameFromUTI:", v8);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v15 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v10, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v36 = v9;
  if (v12)
  {
    objc_msgSend(v21, "URLByDeletingPathExtension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathExtension:", v12);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }
  v25 = v8;
  v26 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    +[ICBaseTextView(DragAndDrop) copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:].cold.3();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v28 = objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v38);
  v29 = v38;

  if ((v28 & 1) == 0)
  {
    v30 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[ICBaseTextView(DragAndDrop) copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v29;
  v32 = objc_msgSend(v31, "copyItemAtURL:toURL:error:", v7, v22, &v37);
  v33 = v37;

  if ((v32 & 1) == 0)
  {

    v34 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[ICBaseTextView(DragAndDrop) copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:].cold.1((uint64_t)v7, (uint64_t)v33, v34);

    v22 = 0;
  }

  return v22;
}

- (CGPoint)renderTextInCharacterRange:(_NSRange)a3 inTextStorage:(id)a4 temporaryAttributes:(id)a5 forceOffsetCalculation:(BOOL)a6 image:(id *)a7 boundingRectangles:(id *)a8 renderedGlyphRange:(_NSRange *)a9
{
  NSUInteger length;
  NSUInteger location;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSUInteger v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  void *v43;
  double *v44;
  CGFloat MinX;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSUInteger v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t j;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  __int128 v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  id v89;
  id v90;
  _QWORD v91[6];
  _QWORD v92[4];
  id v93;
  _QWORD *v94;
  uint64_t v95;
  CGRect *v96;
  uint64_t v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  CGPoint result;
  CGRect v118;
  CGRect v119;

  length = a3.length;
  location = a3.location;
  v116 = *MEMORY[0x1E0C80C00];
  v90 = a4;
  v89 = a5;
  if (ICInternalSettingsIsTextKit2Enabled()
    && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    v16 = objc_alloc(MEMORY[0x1E0DC4470]);
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_textRangeForRange:", location, length);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithTextLayoutManager:range:unifyRects:", v17, v19, 1);

    if (v89)
      objc_msgSend(v20, "addRenderingAttributes:", v89);
    objc_msgSend(v20, "image");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "range");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    a9->location = objc_msgSend(v21, "ic_rangeForTextRange:", v22);
    a9->length = v23;

    if (v89)
    {
      objc_msgSend(v89, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeRenderingAttributes:", v24);

    }
    objc_msgSend(v20, "firstLineRect");
    v104 = v25;
    v105 = v26;
    v106 = v27;
    v107 = v28;
    objc_msgSend(v20, "bodyRect");
    v108 = v29;
    v109 = v30;
    v110 = v31;
    v111 = v32;
    objc_msgSend(v20, "lastLineRect");
    v112 = v33;
    v113 = v34;
    v114 = v35;
    v115 = v36;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 96; i += 32)
    {
      -[ICBaseTextView contentScaleFactor](self, "contentScaleFactor");
      UIRectIntegralWithScale();
      x = v118.origin.x;
      y = v118.origin.y;
      width = v118.size.width;
      height = v118.size.height;
      if (!CGRectIsEmpty(v118))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x, y, width, height);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v43);

      }
    }
    *a8 = (id)objc_msgSend(v37, "copy");
    v44 = (double *)MEMORY[0x1E0C9D538];
    if (-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem") || a6)
    {
      objc_msgSend(v20, "range");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = 0;
      v101[1] = v101;
      v101[2] = 0x4010000000;
      v101[3] = &unk_1DDA28851;
      v102 = 0u;
      v103 = 0u;
      v95 = 0;
      v96 = (CGRect *)&v95;
      v97 = 0x4010000000;
      v98 = &unk_1DDA28851;
      v79 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v99 = *MEMORY[0x1E0C9D648];
      v100 = v79;
      -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "location");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = MEMORY[0x1E0C809B0];
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke;
      v92[3] = &unk_1EA7DD510;
      v83 = v78;
      v93 = v83;
      v94 = v101;
      v84 = (id)objc_msgSend(v80, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v81, 0, v92);

      -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "range");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v82;
      v91[1] = 3221225472;
      v91[2] = __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke_2;
      v91[3] = &unk_1EA7DD538;
      v91[4] = v101;
      v91[5] = &v95;
      objc_msgSend(v85, "enumerateTextSegmentsInRange:type:options:usingBlock:", v86, 0, 1, v91);

      MinX = CGRectGetMinX(v96[1]);
      _Block_object_dispose(&v95, 8);
      _Block_object_dispose(v101, 8);

    }
    else
    {
      MinX = *v44;
    }

    v77 = v44[1];
  }
  else
  {
    objc_opt_class();
    -[ICBaseTextView textContainer](self, "textContainer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "layoutManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
    v51 = v50;
    objc_msgSend(v48, "setShouldManuallyRenderSeparateSubviews:", 1);
    objc_msgSend(v48, "setIsRenderingPreviewForDragAndDrop:", 1);
    objc_opt_class();
    objc_msgSend(v90, "styler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "styleText:inExactRange:fixModelAttributes:", v90, location, length, 0);
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64DB8]), "initWithLayoutManager:range:textStorage:", v48, location, length, v90);
    objc_msgSend(v54, "setIsDraggingChecklistItem:", -[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem"));
    objc_msgSend(v54, "image");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "styleText:inExactRange:fixModelAttributes:", v90, location, length, 0);
    a9->location = objc_msgSend(v54, "renderedGlyphRange");
    a9->length = v55;
    objc_msgSend(v48, "setShouldManuallyRenderSeparateSubviews:", 0);
    objc_msgSend(v48, "setIsRenderingPreviewForDragAndDrop:", 0);
    objc_msgSend(v48, "invalidateDisplayForGlyphRange:", v49, v51);
    objc_msgSend(v54, "firstLineRect");
    v104 = v56;
    v105 = v57;
    v106 = v58;
    v107 = v59;
    objc_msgSend(v54, "bodyRect");
    v108 = v60;
    v109 = v61;
    v110 = v62;
    v111 = v63;
    objc_msgSend(v54, "lastLineRect");
    v112 = v64;
    v113 = v65;
    v114 = v66;
    v115 = v67;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != 96; j += 32)
    {
      -[ICBaseTextView contentScaleFactor](self, "contentScaleFactor");
      UIRectIntegralWithScale();
      v70 = v119.origin.x;
      v71 = v119.origin.y;
      v72 = v119.size.width;
      v73 = v119.size.height;
      if (!CGRectIsEmpty(v119))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v70, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v74);

      }
    }
    *a8 = (id)objc_msgSend(v68, "copy");
    objc_msgSend(v54, "originAdjustment");
    MinX = v75;
    v77 = v76;

  }
  v87 = MinX;
  v88 = v77;
  result.y = v88;
  result.x = v87;
  return result;
}

BOOL __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  CGFloat *v16;
  CGRect v18;
  CGRect v19;

  v3 = a2;
  objc_msgSend(v3, "rangeInElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == -1)
  {
    objc_msgSend(v3, "layoutFragmentFrame");
    x = v8;
    y = v10;
    width = v12;
    height = v14;
    if (!CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)))
    {
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v18 = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v19);
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
    }
    v16 = *(CGFloat **)(*(_QWORD *)(a1 + 40) + 8);
    v16[4] = x;
    v16[5] = y;
    v16[6] = width;
    v16[7] = height;
  }

  return v7 == -1;
}

uint64_t __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke_2(uint64_t a1, double a2, double y, double width, double height)
{
  double x;
  double *v10;
  CGRect v12;
  CGRect v13;

  x = a2 - CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  if (!CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v12 = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v13);
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
  }
  v10 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v10[4] = x;
  v10[5] = y;
  v10[6] = width;
  v10[7] = height;
  return 1;
}

- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  length = a3.length;
  location = a3.location;
  v7 = (void *)MEMORY[0x1E0DC3DB0];
  v8 = a4;
  -[ICBaseTextView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedTextEffectsWindowForWindowScene:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:", location, length, v8, 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 inTextStorage:(id)a4 temporaryAttributes:(id)a5 forceOffsetCalculation:(BOOL)a6 containerView:(id)a7
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v8 = a6;
  length = a3.length;
  location = a3.location;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem"))
  {
    objc_msgSend(v13, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "ic_isLastCharacterInRangeANewlineForRange:", location, length);
    if (length == 1)
      v18 = 0;
    else
      v18 = v17;

    length -= v18 & 1;
  }
  v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  -[ICBaseTextView renderTextInCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:image:boundingRectangles:renderedGlyphRange:](self, "renderTextInCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:image:boundingRectangles:renderedGlyphRange:", location, length, v13, v14, v8, &v38, &v37, &v39);
  v20 = v19;
  v22 = v21;
  v23 = v38;
  v24 = (objc_class *)MEMORY[0x1E0DC3890];
  v25 = v37;
  v26 = v23;
  v27 = (void *)objc_msgSend([v24 alloc], "initWithImage:", v26);
  objc_msgSend(v27, "setContentMode:", 9);
  -[ICBaseTextView textOriginOffsetForGlyphRange:](self, "textOriginOffsetForGlyphRange:", v39, v40);
  -[ICBaseTextView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v15);
  v29 = v28;
  v31 = v30;
  objc_msgSend(v27, "bounds");
  objc_msgSend(v27, "setFrame:", v29 - v20, v31 - v22);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3768]), "initWithTextLineRects:", v25);

  v33 = objc_alloc(MEMORY[0x1E0DC3770]);
  objc_msgSend(v27, "frame");
  UIRectGetCenter();
  v34 = (void *)objc_msgSend(v33, "initWithContainer:center:", v15);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v27, v32, v34);
  return v35;
}

- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 uiRange:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  ICBaseTextView *v52;
  ICBaseTextView *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  id v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v88;
  void *v89;
  NSUInteger v90;
  void *v91;
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  NSObject *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICBaseTextView editorController](self, "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (location >= objc_msgSend(v10, "length"))
  {
    v12 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], location, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "_ic_textFindingResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v90 = length;
    v92 = v13;
    if (ICInternalSettingsIsTextKit2Enabled()
      && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      objc_opt_class();
      -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "viewIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "existingAttachmentViewForIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ICProtocolCast();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      -[ICBaseTextView layoutManager](self, "layoutManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "viewForTextAttachmentNoCreate:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ICProtocolCast();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v98 = 0;
    v99 = &v98;
    v100 = 0x3032000000;
    v101 = __Block_byref_object_copy__1;
    v102 = __Block_byref_object_dispose__1;
    v103 = 0;
    v91 = v19;
    if (v19)
    {
      v21 = dispatch_semaphore_create(0);
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke;
      v95[3] = &unk_1EA7DD560;
      v97 = &v98;
      v22 = v21;
      v96 = v22;
      objc_msgSend(v19, "imageForTextPreviewUsingFindingResult:inTextView:completion:", v92, self, v95);
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

      v23 = 0.0;
      if (v99[5])
        goto LABEL_29;
    }
    if (ICInternalSettingsIsTextKit2Enabled()
      && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v24))
    {
      objc_opt_class();
      -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "documentRange");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "location");
      v28 = objc_claimAutoreleasedReturnValue();

      -[ICBaseTextView textContainer](self, "textContainer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "textLayoutManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "locationFromLocation:withOffset:", v28, location);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v28;

      -[ICBaseTextView textContainer](self, "textContainer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textLayoutManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "locationFromLocation:withOffset:", v31, v90);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v31, v34);
      objc_msgSend(v35, "ensureLayoutForRange:", v36);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        -[ICBaseTextView _pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:](self, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v12, location, 0, v88);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[ICBaseTextView textContainer](self, "textContainer", v88);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "viewProviderForParentView:location:textContainer:", self, v31, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_opt_class();
      -[ICBaseTextView layoutManager](self, "layoutManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "viewProviderForParentView:characterIndex:layoutManager:", self, location, v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v38, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v38, "additionalXOffsetForTextDragPreviewInTextView:", self);
      v23 = v42;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v41, "additionalXOffsetForTextDragPreviewInTextView:", self);
      v23 = v43;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v38, "viewForTextDragPreview");
      v44 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v44;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v41, "viewForTextDragPreview");
      v45 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v45;
    }
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke_2;
    v93[3] = &unk_1EA7DD588;
    v46 = v41;
    v94 = v46;
    objc_msgSend(v46, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:fallback:", 0, v93);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v99[5];
    v99[5] = v47;

    if (v99[5])
    {
LABEL_29:
      -[ICBaseTextView subviews](self, "subviews");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "ic_objectPassingTest:", &__block_literal_global_0);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      if (v50)
        v52 = (ICBaseTextView *)v50;
      else
        v52 = self;
      v53 = v52;

      v54 = objc_alloc(MEMORY[0x1E0DC3890]);
      v55 = (void *)objc_msgSend(v54, "initWithImage:", v99[5]);
      if (ICInternalSettingsIsTextKit2Enabled()
        && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
            v56 = (void *)objc_claimAutoreleasedReturnValue(),
            v56,
            v56))
      {
        -[ICBaseTextView textOriginOffsetForGlyphRange:](self, "textOriginOffsetForGlyphRange:", location, v90);
      }
      else
      {
        -[ICBaseTextView layoutManager](self, "layoutManager");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "glyphRangeForCharacterRange:actualCharacterRange:", location, v90, 0);
        v60 = v59;

        -[ICBaseTextView textOriginOffsetForGlyphRange:](self, "textOriginOffsetForGlyphRange:", v58, v60);
      }
      -[ICBaseTextView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v53);
      v62 = v61;
      v64 = v63;
      objc_msgSend(v55, "bounds");
      objc_msgSend(v55, "setFrame:", v62, v64);
      if (v23 != 0.0)
      {
        objc_msgSend(v55, "frame");
        v105 = CGRectOffset(v104, v23, 0.0);
        objc_msgSend(v55, "setFrame:", v105.origin.x, v105.origin.y, v105.size.width, v105.size.height);
      }
      objc_opt_class();
      ICDynamicCast();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
      {
        objc_msgSend(v65, "attachmentBoundsMargins");
        v68 = v67;
        v70 = v69;
        objc_msgSend(v55, "frame");
        v107 = CGRectOffset(v106, v68, v70);
        objc_msgSend(v55, "setFrame:", v107.origin.x, v107.origin.y, v107.size.width, v107.size.height);
      }
      v71 = objc_alloc_init(MEMORY[0x1E0DC3768]);
      objc_opt_class();
      ICDynamicCast();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "viewCornerRadius");
      if (v73 > 0.0)
      {
        v74 = (void *)MEMORY[0x1E0DC3508];
        objc_msgSend(v55, "bounds");
        v76 = v75;
        v78 = v77;
        v80 = v79;
        v82 = v81;
        objc_msgSend(v72, "viewCornerRadius");
        objc_msgSend(v74, "bezierPathWithRoundedRect:cornerRadius:", v76, v78, v80, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setVisiblePath:", v84);

      }
      v85 = objc_alloc(MEMORY[0x1E0DC3770]);
      objc_msgSend(v55, "frame");
      UIRectGetCenter();
      v86 = (void *)objc_msgSend(v85, "initWithContainer:center:", v53);
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v55, v71, v86);

    }
    else
    {
      v39 = 0;
    }
    _Block_object_dispose(&v98, 8);

    v13 = v92;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

void __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSaveGState(v3);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderInContext:", v3);

  CGContextRestoreGState(v3);
}

uint64_t __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)targetedPreviewForPaperKitAttachment:(id)a3 textFindingResult:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  CGRect *v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  CGAffineTransform v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  CGRect *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  CGRect v53;
  CGRect v54;

  v6 = a3;
  v7 = a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  v41 = 0;
  v42 = (CGRect *)&v41;
  v43 = 0x4010000000;
  v44 = &unk_1DDA28851;
  v45 = 0u;
  v46 = 0u;
  v8 = dispatch_semaphore_create(0);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __86__ICBaseTextView_DragAndDrop__targetedPreviewForPaperKitAttachment_textFindingResult___block_invoke;
  v37[3] = &unk_1EA7DD5F0;
  v39 = &v47;
  v40 = &v41;
  v9 = v8;
  v38 = v9;
  objc_msgSend(v7, "generateFindPreviewImageForPaperKitAttachment:completion:", v6, v37);
  v10 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v9, v10);
  -[ICBaseTextView bounds](self, "bounds");
  +[ICPaperKitTextFindingResult scaleForDrawingBounds:](ICPaperKitTextFindingResult, "scaleForDrawingBounds:");
  v11 = v42;
  CGAffineTransformMakeScale(&v36, v12, v12);
  v53 = CGRectApplyAffineTransform(v11[1], &v36);
  v54 = CGRectIntegral(v53);
  x = v54.origin.x;
  y = v54.origin.y;
  width = v54.size.width;
  height = v54.size.height;
  objc_opt_class();
  ICDynamicCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "framesForHighlightInTextView:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CGRectValue");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = objc_alloc(MEMORY[0x1E0DC3890]);
  v29 = (void *)objc_msgSend(v28, "initWithImage:", v48[5]);
  objc_msgSend(v29, "setFrame:", x, y, width, height);
  UIRectGetCenter();
  objc_msgSend(v29, "setCenter:");
  v30 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v21, v23, v25, v27, 4.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setVisiblePath:", v31);

  v32 = objc_alloc(MEMORY[0x1E0DC3B88]);
  -[ICBaseTextView frame](self, "frame");
  UIRectGetCenter();
  v33 = (void *)objc_msgSend(v32, "initWithContainer:center:", self);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v29, v30, v33);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v34;
}

void __86__ICBaseTextView_DragAndDrop__targetedPreviewForPaperKitAttachment_textFindingResult___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double *v12;
  id v13;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v13 = a2;
  v12 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_targetedPreviewForHighlightRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_ic_textFindingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "range");
  if (!v5)
    goto LABEL_12;
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_opt_class();
  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachmentInNote:range:", v12, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "attachmentType") == 13 && v14)
  {
    -[ICBaseTextView targetedPreviewForPaperKitAttachment:textFindingResult:](self, "targetedPreviewForPaperKitAttachment:textFindingResult:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v16 = (void *)v15;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isAttachmentResult"))
  {
    -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:uiRange:](self, "correctlyPositionedPreviewForCharacterRange:uiRange:", v8, v9, v4);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v8, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (objc_msgSend(v28, "isList"))
  {
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_textRangeForRange:", v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __65__ICBaseTextView_DragAndDrop___targetedPreviewForHighlightRange___block_invoke;
    v31[3] = &unk_1EA7DD618;
    v31[4] = self;
    v31[5] = &v32;
    v31[6] = v8;
    v31[7] = v9;
    v21 = (id)objc_msgSend(v27, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v20, 0, v31);

  }
  v36[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v22;
  v36[1] = *MEMORY[0x1E0DC1100];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v22) = *((unsigned __int8 *)v33 + 24);
  -[ICBaseTextView window](self, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:", v8, v9, v29, v24, (_DWORD)v22 != 0, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v32, 8);
LABEL_11:

  if (!v16)
  {
LABEL_12:
    v30.receiver = self;
    v30.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _targetedPreviewForHighlightRange:](&v30, sel__targetedPreviewForHighlightRange_, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

uint64_t __65__ICBaseTextView_DragAndDrop___targetedPreviewForHighlightRange___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rangeInElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "ic_rangeForTextRange:", v6);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v7 == a1[6];
  return 0;
}

- (CGRect)enclosingRectForGlyphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  NSUInteger v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[7];
  uint64_t v41;
  double *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (ICInternalSettingsIsTextKit2Enabled()
    && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_textRangeForRange:", location, length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView textContainer](self, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textContainerOrigin");
    v11 = v10;
    v13 = v12;

    v41 = 0;
    v42 = (double *)&v41;
    v43 = 0x4010000000;
    v44 = &unk_1DDA28851;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v45 = *MEMORY[0x1E0C9D628];
    v46 = v14;
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke;
    v40[3] = &unk_1EA7DD640;
    v40[5] = v11;
    v40[6] = v13;
    v40[4] = &v41;
    objc_msgSend(v15, "enumerateTextSegmentsInRange:type:options:usingBlock:", v8, 1, 0, v40);

    v16 = v42[4];
    v17 = v42[5];
    v18 = v42[6];
    v19 = v42[7];
    _Block_object_dispose(&v41, 8);

  }
  else
  {
    v41 = 0;
    v42 = (double *)&v41;
    v43 = 0x4010000000;
    v44 = &unk_1DDA28851;
    v20 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v45 = *MEMORY[0x1E0C9D628];
    v46 = v20;
    -[ICBaseTextView textContainer](self, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textContainerOrigin");
    v23 = v22;
    v25 = v24;
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView textContainer](self, "textContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke_2;
    v33[3] = &unk_1EA7DD668;
    v33[4] = self;
    v36 = location;
    v37 = length;
    v28 = v21;
    v38 = v23;
    v39 = v25;
    v34 = v28;
    v35 = &v41;
    objc_msgSend(v26, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", location, length, location, length, v27, v33);

    v16 = v42[4];
    v17 = v42[5];
    v18 = v42[6];
    v19 = v42[7];

    _Block_object_dispose(&v41, 8);
  }
  v29 = v16;
  v30 = v17;
  v31 = v18;
  v32 = v19;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

uint64_t __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGRect v7;

  v7 = CGRectOffset(*(CGRect *)&a2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v7);
  return 1;
}

void __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke_2(uint64_t a1, CGFloat a2, double a3, CGFloat a4)
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;
  CGRect v13;

  objc_msgSend(*(id *)(a1 + 32), "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingRectForGlyphRange:inTextContainer:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v9 = v8;
  v11 = v10;

  v12.origin.x = a2;
  v12.origin.y = v9;
  v12.size.width = a4;
  v12.size.height = v11;
  v13 = CGRectOffset(v12, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 32), v13);
}

- (void)beginDrop
{
  void *v3;
  id v4;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "breakUndoCoalescing");

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginEditing");

  }
}

- (void)finishDropWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[ICBaseTextView icaxTextDidChange](self, "icaxTextDidChange");
    -[ICBaseTextView editorController](self, "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateChangeCountWithReason:", CFSTR("Finished string drop"));

  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endEditing");

  }
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fixupAfterEditing");

  -[ICBaseTextView editorController](self, "editorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "save");

  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_save");

  -[ICBaseTextView editorController](self, "editorController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShouldAddMediaAsynchronously:", 0);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "snapshotManagedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(-32768, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke;
  v21[3] = &unk_1EA7DD6E0;
  v22 = v17;
  v23 = v4;
  v19 = v4;
  v20 = v17;
  objc_copyWeak(&v24, &location);
  dispatch_async(v18, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_2;
  v3[3] = &unk_1EA7DD6E0;
  v2 = a1[4];
  v4 = a1[5];
  v5 = a1[4];
  objc_copyWeak(&v6, a1 + 6);
  objc_msgSend(v2, "performBlockAndWait:", v3);
  objc_destroyWeak(&v6);

}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_3;
  v7[3] = &unk_1EA7DD690;
  v5 = v2;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v3, "ic_enumerateAttachmentsInContext:usingBlock:", v4, v7);
  objc_msgSend(*(id *)(a1 + 40), "ic_save");
  if (*((_BYTE *)v11 + 24))
  {
    objc_copyWeak(&v6, (id *)(a1 + 48));
    dispatchMainAfterDelay();
    objc_destroyWeak(&v6);
  }

  _Block_object_dispose(&v10, 8);
}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatePreviewIfNeededForAttachmentWithObjectID:", v7);

  }
  objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Finished string drop"));
  objc_msgSend(v3, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateChangeCountWithReason:", CFSTR("Finished string drop"));

  v6 = objc_msgSend(v3, "attachmentType");
  if (v6 == 10)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "updatePKDrawingsWithHandwritingRecognitionEnabled:", objc_msgSend(v3, "isHandwritingRecognitionEnabled"));
}

- (BOOL)handleTopotextDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  ICBaseTextView *v26;
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = *MEMORY[0x1E0D637F0];
  v17 = objc_msgSend(v12, "hasRepresentationConformingToTypeIdentifier:fileOptions:", *MEMORY[0x1E0D637F0], 0);
  if (v17)
  {
    objc_initWeak(&location, self);
    v18 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[ICBaseTextView editorController](self, "editorController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "note");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortLoggingDescription");
      v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = (void *)v21;
      v31 = v21;
      v32 = 2112;
      v33 = v13;
      _os_log_debug_impl(&dword_1DD7B0000, v18, OS_LOG_TYPE_DEBUG, "Topotext drop in note: %@, position: %@", buf, 0x16u);

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v24[3] = &unk_1EA7DD730;
    objc_copyWeak(&v28, &location);
    v25 = v14;
    v26 = self;
    v27 = v15;
    objc_msgSend(v12, "loadDataRepresentationForTypeIdentifier:completionHandler:", v16, v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (v5
    && WeakRetained
    && (objc_msgSend(MEMORY[0x1E0D63BD8], "pasteboardDataFromPersistenceData:", v5),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
    v13[3] = &unk_1EA7DD708;
    v11 = *(void **)(a1 + 32);
    v13[4] = *(_QWORD *)(a1 + 40);
    v14 = v9;
    v16 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "supportsAttachments");
  if ((_DWORD)v4)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "existingObjectWithID:error:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(*(id *)(a1 + 40), "attributedStringData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dataPersister");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:", v12, v13, v3, v10, v4, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;

  objc_msgSend(v3, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_save");

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (v15)
    objc_msgSend(*(id *)(a1 + 48), "addErrorWithCode:", objc_msgSend(v15, "code"));

}

- (BOOL)handleInlineDrawingDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  ICBaseTextView *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (id)*MEMORY[0x1E0D63688];
  if ((objc_msgSend(v12, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v16, 0) & 1) == 0)
  {
    v17 = (id)*MEMORY[0x1E0D63680];

    if ((objc_msgSend(v12, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v17, 0) & 1) != 0)
    {
      v16 = v17;
    }
    else
    {
      v16 = (id)*MEMORY[0x1E0CD12E8];

      if ((objc_msgSend(v12, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v16, 0) & 1) == 0)
      {

        goto LABEL_10;
      }
    }
  }
  if (!v16)
  {
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v18 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shortLoggingDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v23;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v16;
    _os_log_debug_impl(&dword_1DD7B0000, v18, OS_LOG_TYPE_DEBUG, "Inline drawing drop in note: %@, position: %@, uti: %@", buf, 0x20u);

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
  v25[3] = &unk_1EA7DD758;
  v26 = v16;
  v27 = self;
  v28 = v14;
  v29 = v15;
  v19 = v16;
  objc_msgSend(v12, "loadDataRepresentationForTypeIdentifier:completionHandler:", v19, v25);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

  v20 = 1;
LABEL_11:

  return v20;
}

void __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = 0;
LABEL_9:
    v10 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x1E0D639F0], "typeUTIIsInlineDrawing:", a1[4]))
  {
    v14 = 0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD1158]), "initWithData:error:", v5, &v14);
    v8 = v14;
    if (v8)
    {
      v9 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CD1240], "strokeSelectionFromData:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_11:
  if (v10 | v7)
  {
    v11 = (void *)a1[5];
    v12 = a1[6];
    if (v7)
      objc_msgSend(v11, "attributedStringForDrawing:session:", v7, v12);
    else
      objc_msgSend(v11, "attributedStringForStrokeSelection:session:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

- (BOOL)handleInlinePaperDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a3;
  v11 = a5;
  v12 = a7;
  v13 = *MEMORY[0x1E0CD12E0];
  v14 = objc_msgSend(v10, "hasRepresentationConformingToTypeIdentifier:fileOptions:", *MEMORY[0x1E0CD12E0], 0);
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v16[3] = &unk_1EA7DD820;
    v18 = v12;
    v17 = v11;
    objc_msgSend(v10, "loadFileRepresentationForTypeIdentifier:completionHandler:", v13, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  void (**v32)(_QWORD);
  id v33;
  _QWORD *v34;
  char v35;
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];
  id v53;

  v5 = a2;
  v6 = a3;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__1;
  v52[4] = __Block_byref_object_dispose__1;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  v51 = 0;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
    v42[3] = &unk_1EA7DD780;
    v43 = v7;
    v44 = &v46;
    v45 = v52;
    objc_msgSend(v43, "performBlockAndWait:", v42);
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3;
    aBlock[3] = &unk_1EA7DD7D0;
    v40 = *(id *)(a1 + 32);
    v41 = &v46;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v10 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v6;
    LOBYTE(v13) = objc_msgSend(v16, "linkItemAtURL:toURL:error:", v5, v15, &v38);
    v17 = v38;

    if ((v13 & 1) != 0)
    {
      v6 = v17;
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_2();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v17;
      v20 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v5, v15, &v37);
      v6 = v37;

      if ((v20 & 1) == 0)
      {
        v29 = os_log_create("com.apple.notes", "DragAndDrop");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();

        v9[2](v9);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_16;
      }
    }
    v36 = 0;
    v21 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v36, *MEMORY[0x1E0C99968], 0);
    v22 = v36;
    v23 = v22;
    if (v21 && objc_msgSend(v22, "isEqual:", *MEMORY[0x1E0C99978]))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v15, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithDataRepresentation:relativeToURL:", v24, 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v26 = 0;
      v15 = (id)v25;
    }
    else
    {
      v26 = 1;
    }
    v27 = (void *)MEMORY[0x1E0D63C00];
    v28 = v47[5];
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_122;
    v30[3] = &unk_1EA7DD7F8;
    v32 = v9;
    v33 = *(id *)(a1 + 40);
    v34 = v52;
    v35 = v26;
    v15 = v15;
    v31 = v15;
    objc_msgSend(v27, "copyNewPaperBundleToAttachment:fromURL:completionHandler:", v28, v15, v30);

LABEL_16:
    goto LABEL_17;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(v52, 8);
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "incrementNumberOfAttachmentsAttemptedAdded");
  if ((objc_msgSend(v13, "canAddAttachment") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSystemPaperAttachmentWithIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64D30]), "initWithAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(v13, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_save");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addErrorWithCode:", 202);
  }

}

uint64_t __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_4;
  v3[3] = &unk_1EA7DD7A8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performBlockAndWait:", v3);
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "setNeedsInitialRelationshipSetup:", 0);
  objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v4, "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ic_save");
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_122(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (BOOL)handlePaperDocumentDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((ICInternalSettingsIsPDFsInNotesEnabled() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICInternalSettingsIsPDFsInNotesEnabled()", "-[ICBaseTextView(DragAndDrop) handlePaperDocumentDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:]", 1, 0, CFSTR("PDFsInNotes must be enabled"));
  objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v16, 0);
  if (v17)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v19[3] = &unk_1EA7DD898;
    objc_copyWeak(&v24, &location);
    v20 = v16;
    v21 = v12;
    v23 = v15;
    v22 = v14;
    objc_msgSend(v21, "loadFileRepresentationForTypeIdentifier:completionHandler:", v20, v19);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5
    && (v8 = (void *)objc_opt_class(),
        v9 = *(_QWORD *)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 40), "suggestedName"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (void *)objc_msgSend(v8, "copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:", v5, v9, v10),
        v10,
        v11))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__1;
    v32[4] = __Block_byref_object_dispose__1;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__1;
    v30 = __Block_byref_object_dispose__1;
    v31 = 0;
    v12 = *(void **)(a1 + 48);
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
    v21[3] = &unk_1EA7DD848;
    v22 = v12;
    v24 = &v26;
    v23 = *(id *)(a1 + 40);
    v25 = v32;
    objc_msgSend(v22, "performBlockAndWait:", v21);
    v14 = (void *)MEMORY[0x1E0D63C00];
    v15 = v27[5];
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3;
    v17[3] = &unk_1EA7DD870;
    v16 = v11;
    v18 = v16;
    v19 = *(id *)(a1 + 56);
    v20 = v32;
    objc_msgSend(v14, "createPaperDocumentForAttachment:fromLegacyMediaAtURL:completionHandler:", v15, v16, v17);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v32, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "incrementNumberOfAttachmentsAttemptedAdded");
  if ((objc_msgSend(v16, "canAddAttachment") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addPaperDocumentAttachmentWithIdentifier:subtype:", v4, *MEMORY[0x1E0D636A0]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 40), "suggestedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "suggestedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTitle:", v10);

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64CD8]), "initWithAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(v16, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ic_save");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addErrorWithCode:", 202);
  }

}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = -[NSObject removeItemAtURL:error:](v5, "removeItemAtURL:error:", v4, &v10);
  v7 = v10;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  v9 = objc_msgSend(v7, "code");

  if (v9 != 4)
  {
    v5 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3_cold_1((_QWORD *)(a1 + 32), (uint64_t)v8, v5);
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)hasSupportedImageInItemProvider:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = a3;
  objc_msgSend(v17, "registeredTypeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = (void *)*MEMORY[0x1E0CEC4F8];
    v8 = *MEMORY[0x1E0CEC520];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "conformsToType:", v8);

          if ((v13 & 1) != 0)
          {

            v15 = v17;
            v14 = objc_msgSend(v17, "canLoadObjectOfClass:", objc_opt_class());
            goto LABEL_13;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }

  v14 = 0;
  v15 = v17;
LABEL_13:

  return v14;
}

- (id)attributedStringForImageData:(id)a3 imageTypeUTI:(id)a4 itemProvider:(id)a5 pasteSession:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__ICBaseTextView_DragAndDrop__attributedStringForImageData_imageTypeUTI_itemProvider_pasteSession___block_invoke;
  v19[3] = &unk_1EA7DD8C0;
  v13 = v12;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v24 = &v25;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __99__ICBaseTextView_DragAndDrop__attributedStringForImageData_imageTypeUTI_itemProvider_pasteSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "incrementNumberOfAttachmentsAttemptedAdded");
  if ((objc_msgSend(v18, "canAddAttachment") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = 202;
    goto LABEL_5;
  }
  if (objc_msgSend(v18, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(*(id *)(a1 + 40), "length")))
  {
    v3 = *(void **)(a1 + 32);
    v4 = 207;
LABEL_5:
    objc_msgSend(v3, "addErrorWithCode:", v4);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D639F0], "filenameExtensionForUTI:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "suggestedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D639F0], "filenameFromUTI:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "ic_sanitizedFilenameString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Image"), &stru_1EA7E9860, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAttachmentWithData:filename:", *(_QWORD *)(a1 + 40), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64D98], "textAttachmentWithAttachment:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(v18, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_save");

LABEL_11:
}

- (id)attributedStringForStrokeSelection:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v34;
  CGAffineTransform v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0CD1158]);
  objc_msgSend(v5, "boundsWithoutLasso");
  v10 = v9;
  v11 = v9 < 760.0;
  v12 = 0.0;
  if (v11)
    v12 = 8.0;
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, v12 - v7, 8.0 - v8);
  if (v10 > 768.0)
  {
    CGAffineTransformMakeScale(&t2, 768.0 / v10, 768.0 / v10);
    t1 = v35;
    CGAffineTransformConcat(&v34, &t1, &t2);
    v35 = v34;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v5;
  objc_msgSend(v5, "strokes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    v17 = *MEMORY[0x1E0CD1300];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v19, "ink");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v17);

        if ((v22 & 1) == 0)
        {
          v34 = v35;

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v15);
  }

  -[ICBaseTextView attributedStringForDrawing:session:](self, "attributedStringForDrawing:session:", v6, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)attributedStringForDrawing:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  ICBaseTextView *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  CGRect v23;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "set_canvasBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), 768.0, CGRectGetMaxY(v23));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__ICBaseTextView_DragAndDrop__attributedStringForDrawing_session___block_invoke;
  v12[3] = &unk_1EA7DD8E8;
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = self;
  v16 = &v17;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __66__ICBaseTextView_DragAndDrop__attributedStringForDrawing_session___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "incrementNumberOfAttachmentsAttemptedAdded");
  if ((objc_msgSend(v16, "canAddAttachment") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addErrorWithCode:", 202);
    goto LABEL_8;
  }
  objc_msgSend(v16, "addAttachmentWithUTI:", *MEMORY[0x1E0D63680]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergeableData:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64C40]), "initWithAttachment:", v3);
  objc_msgSend(*(id *)(a1 + 48), "icDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 48), "icDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldInsertNewDrawingsAsPaper");

  if (v8)
  {
    objc_msgSend(v16, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICInlineDrawingUpgradeHelper initWithNote:managedObjectContext:textView:]([_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc], "initWithNote:managedObjectContext:textView:", v16, v6, *(_QWORD *)(a1 + 48));
    -[ICInlineDrawingUpgradeHelper upgradeWithAttachment:itemProviders:itemsLocation:](v9, "upgradeWithAttachment:itemProviders:itemsLocation:", v3, MEMORY[0x1E0C9AA60], *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64D30]), "initWithAttachment:", v10);

    objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", v3);
    v5 = (void *)v11;
LABEL_5:

  }
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(v16, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ic_save");

LABEL_8:
}

- (BOOL)handleImageDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  NSObject *v27;
  id *v28;
  id *v29;
  id *v30;
  uint64_t v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id location;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v38 = a4;
  v12 = a5;
  v13 = a7;
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v14, 0))
  {
    LODWORD(v15) = -[ICBaseTextView hasSupportedImageInItemProvider:](self, "hasSupportedImageInItemProvider:", v11);

    if ((_DWORD)v15)
    {
      objc_initWeak(&location, self);
      v16 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v11, "registeredTypeIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v51;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v51 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v21, "containsObject:", v26))
            {
              v23 = v26;
              goto LABEL_14;
            }
          }
          v23 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          if (v23)
            continue;
          break;
        }
      }
LABEL_14:

      v27 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        -[ICBaseTextView editorController](self, "editorController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "note");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "shortLoggingDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v56 = v36;
        v57 = 2112;
        v58 = v38;
        v59 = 2112;
        v60 = v23;
        _os_log_debug_impl(&dword_1DD7B0000, v27, OS_LOG_TYPE_DEBUG, "Image drop in note: %@, position: %@, uti: %@", buf, 0x20u);

      }
      if (v23)
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
        v44[3] = &unk_1EA7DD910;
        v28 = &v49;
        objc_copyWeak(&v49, &location);
        v45 = v23;
        v46 = v11;
        v47 = v12;
        v48 = v13;
        objc_msgSend(v46, "loadDataRepresentationForTypeIdentifier:completionHandler:", v45, v44);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v15 = &v45;
        v29 = &v46;
        v30 = &v47;
      }
      else
      {
        v31 = objc_opt_class();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
        v39[3] = &unk_1EA7DD938;
        v28 = &v43;
        objc_copyWeak(&v43, &location);
        v40 = v11;
        v41 = v12;
        v42 = v13;
        objc_msgSend(v40, "loadObjectOfClass:completionHandler:", v31, v39);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v15 = &v40;
        v29 = &v41;
        v30 = &v42;
        *a6 = v32;
      }

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
      LOBYTE(v15) = 1;
    }
  }
  else
  {

    LOBYTE(v15) = 0;
  }

  return (char)v15;
}

void __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (v9 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "attributedStringForImageData:imageTypeUTI:itemProvider:pasteSession:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  UIImage *v6;
  void *v7;
  id v8;
  id WeakRetained;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v7 = 0;
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_9;
  }
  UIImagePNGRepresentation(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(a1 + 56));
  WeakRetained = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_8;
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "attributedStringForImageData:imageTypeUTI:itemProvider:pasteSession:", v7, v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

- (BOOL)handleMovieOrAudioDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  void **v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  id v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id location;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v41 = a4;
  v44 = a5;
  v42 = a7;
  v11 = (void *)*MEMORY[0x1E0CEC568];
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v12, 0);
  v14 = (void **)MEMORY[0x1E0CEC450];
  if (v13)
  {

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC450], "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v15, 0);

    if (!v16)
    {
      v34 = 0;
      goto LABEL_27;
    }
  }
  objc_initWeak(&location, self);
  objc_msgSend(v11, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v17, 0);
  v19 = *v14;
  if (v18)
    v19 = v11;
  v20 = v19;

  objc_msgSend(v20, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v10, "registeredTypeIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v25, v41);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "conformsToType:", v20);

        if (v27)
        {
          v28 = v25;

          v45 = v28;
          goto LABEL_16;
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_16:

  -[ICBaseTextView editorController](self, "editorController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "note");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v30, "isPasswordProtected"))
  {

    goto LABEL_22;
  }
  v31 = objc_msgSend(MEMORY[0x1E0D639F0], "isTypeUTISupportedForPasswordProtectedNotes:", v45);

  if ((v31 & 1) != 0)
  {
LABEL_22:
    v35 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      -[ICBaseTextView editorController](self, "editorController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "note");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shortLoggingDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = v40;
      v59 = 2112;
      v60 = v41;
      _os_log_debug_impl(&dword_1DD7B0000, v35, OS_LOG_TYPE_DEBUG, "Movie/audio drop in note: %@, position: %@", buf, 0x16u);

    }
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v46[3] = &unk_1EA7DD960;
    objc_copyWeak(&v51, &location);
    v47 = v45;
    v48 = v10;
    v49 = v44;
    v50 = v42;
    v36 = (id)objc_msgSend(v48, "loadFileRepresentationForTypeIdentifier:completionHandler:", v47, v46);

    objc_destroyWeak(&v51);
    v34 = 1;
    goto LABEL_25;
  }
  if ((objc_msgSend(v44, "didWarnAboutNotSupportedForPasswordProtectedNotes") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D64B30], "cannotAddAttachmentsInfoAlertWithAttachmentCount:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView window](self, "window");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "presentInWindow:completionHandler:", v33, 0);

    objc_msgSend(v44, "setDidWarnAboutNotSupportedForPasswordProtectedNotes:", 1);
  }
  v34 = 0;
LABEL_25:

  objc_destroyWeak(&location);
LABEL_27:

  return v34;
}

void __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5
    && (v8 = (void *)objc_opt_class(),
        v9 = *(_QWORD *)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 40), "suggestedName"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (void *)objc_msgSend(v8, "copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:", v5, v9, v10),
        v10,
        v11))
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "suggestedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attributedStringForURL:uti:name:metadata:synapseData:session:", v11, v12, v13, 0, 0, *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(v11, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "removeItemAtURL:error:", v15, &v19);
    v17 = v19;

    if (v17 && objc_msgSend(v17, "code") != 4)
    {
      v18 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (BOOL)handleAttributedStringDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_initWeak(&location, self);
  v16 = objc_msgSend(v12, "canLoadObjectOfClass:", objc_opt_class());
  if (v16)
  {
    objc_msgSend(v14, "setShouldFilterAttributedString:", 1);
    v17 = objc_opt_class();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v19[3] = &unk_1EA7DD988;
    v22 = v15;
    v20 = v12;
    objc_copyWeak(&v23, &location);
    v21 = v14;
    objc_msgSend(v20, "loadObjectOfClass:completionHandler:", v17, v19);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);

  return v16;
}

void __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void (*)(void))*((_QWORD *)a1[6] + 2);
LABEL_6:
    v8();
    goto LABEL_7;
  }
  v9 = a1[4];
  v10 = (void *)*MEMORY[0x1E0CEC5C8];
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v11);

  if (!(_DWORD)v9)
  {
    v8 = (void (*)(void))*((_QWORD *)a1[6] + 2);
    goto LABEL_6;
  }
  v12 = a1[4];
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
  v15[3] = &unk_1EA7DD730;
  objc_copyWeak(&v19, a1 + 7);
  v16 = a1[4];
  v17 = a1[5];
  v18 = a1[6];
  v14 = (id)objc_msgSend(v12, "loadDataRepresentationForTypeIdentifier:completionHandler:", v13, v15);

  objc_destroyWeak(&v19);
LABEL_7:

}

void __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  v9 = 0;
  if (v5 && WeakRetained)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && objc_msgSend(v5, "writeToURL:atomically:", v15, 1))
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "suggestedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributedStringForURL:uti:name:metadata:synapseData:session:", v15, v16, v17, 0, 0, *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v18, "removeItemAtURL:error:", v15, &v21);
      v19 = v21;

      if (v19 && objc_msgSend(v19, "code") != 4)
      {
        v20 = os_log_create("com.apple.notes", "DragAndDrop");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();

      }
    }
    else
    {
      v9 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)handleMapKitItemDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(v12, "canLoadObjectOfClass:", objc_opt_class())
    && (v16 = *MEMORY[0x1E0D63D58],
        objc_msgSend(v12, "hasRepresentationConformingToTypeIdentifier:fileOptions:", *MEMORY[0x1E0D63D58], 0)))
  {
    objc_initWeak(&location, self);
    v17 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[ICBaseTextView editorController](self, "editorController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "note");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortLoggingDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v22;
      v31 = 2112;
      v32 = v13;
      _os_log_debug_impl(&dword_1DD7B0000, v17, OS_LOG_TYPE_DEBUG, "MapKitItem drop in note: %@, position: %@", buf, 0x16u);

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v23[3] = &unk_1EA7DD9D8;
    v24 = v12;
    objc_copyWeak(&v27, &location);
    v25 = v14;
    v26 = v15;
    objc_msgSend(v24, "loadDataRepresentationForTypeIdentifier:completionHandler:", v16, v23);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
  v11[3] = &unk_1EA7DD9B0;
  objc_copyWeak(&v16, a1 + 7);
  v9 = v5;
  v12 = v9;
  v13 = a1[4];
  v14 = a1[5];
  v15 = a1[6];
  v10 = (id)objc_msgSend(v7, "loadObjectOfClass:completionHandler:", v8, v11);

  objc_destroyWeak(&v16);
}

void __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (v9 = *(void **)(a1 + 32)) != 0 && WeakRetained)
  {
    v17 = *MEMORY[0x1E0D63628];
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "suggestedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v8, "_title");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(WeakRetained, "attributedStringForURL:uti:name:metadata:synapseData:session:", v8, 0, v15, v11, 0, *(_QWORD *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (BOOL)handleURLDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(v12, "canLoadObjectOfClass:", objc_opt_class()))
  {
    objc_initWeak(&location, self);
    v16 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[ICBaseTextView editorController](self, "editorController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "note");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortLoggingDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v23;
      v41 = 2112;
      v42 = v13;
      _os_log_debug_impl(&dword_1DD7B0000, v16, OS_LOG_TYPE_DEBUG, "Synapse drop in note: %@, position: %@", buf, 0x16u);

    }
    v17 = objc_opt_class();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v33[3] = &unk_1EA7DDA00;
    objc_copyWeak(&v37, &location);
    v36 = v15;
    v34 = v12;
    v35 = v14;
    objc_msgSend(v34, "loadObjectOfClass:completionHandler:", v17, v33);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!objc_msgSend(v12, "canLoadObjectOfClass:", objc_opt_class()))
    {
      v20 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v14, "setIsTypeURL:", 1);
    objc_initWeak(&location, self);
    v18 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[ICBaseTextView editorController](self, "editorController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "note");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortLoggingDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v25;
      v41 = 2112;
      v42 = v13;
      _os_log_debug_impl(&dword_1DD7B0000, v18, OS_LOG_TYPE_DEBUG, "URL drop in note: %@, position: %@", buf, 0x16u);

    }
    v19 = objc_opt_class();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_144;
    v28[3] = &unk_1EA7DD938;
    objc_copyWeak(&v32, &location);
    v29 = v12;
    v30 = v14;
    v31 = v15;
    objc_msgSend(v29, "loadObjectOfClass:completionHandler:", v19, v28);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  v20 = 1;
LABEL_11:

  return v20;
}

void __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "itemURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v16 = v5;
    objc_msgSend(v8, "dataRepresentationWithError:", &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v10)
    {
      objc_msgSend(v8, "displayTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "length"))
      {
        objc_msgSend(v9, "_title");
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      if (!objc_msgSend(v12, "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "suggestedName");
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }
      objc_msgSend(WeakRetained, "attributedStringForURL:uti:name:metadata:synapseData:session:", v9, 0, v12, 0, v10, *(_QWORD *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = v5;
  }

}

void __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_144(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "_title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "length"))
    {
      objc_msgSend(a1[4], "suggestedName");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    if (objc_msgSend(v9, "length") || !objc_msgSend(a1[4], "canLoadObjectOfClass:", objc_opt_class()))
    {
      objc_msgSend(WeakRetained, "attributedStringForURL:uti:name:metadata:synapseData:session:", v8, 0, v9, 0, 0, a1[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))a1[6] + 2))();

    }
    else
    {
      v11 = a1[4];
      v12 = objc_opt_class();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
      v15[3] = &unk_1EA7DDA28;
      v15[4] = WeakRetained;
      v16 = v8;
      v17 = a1[5];
      v18 = a1[6];
      v13 = (id)objc_msgSend(v11, "loadObjectOfClass:completionHandler:", v12, v15);

    }
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributedStringForURL:uti:name:metadata:synapseData:session:", v4, 0, v6, 0, 0, a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[7] + 16))();
}

- (id)preferredFileTypesExtensionDictionary
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = CFSTR("com.apple.iwork.keynote.key");
  v7[0] = CFSTR("pdf");
  v7[1] = CFSTR("key");
  v6[2] = CFSTR("com.apple.iwork.pages.pages");
  v6[3] = CFSTR("com.apple.iwork.numbers.numbers");
  v7[2] = CFSTR("pages");
  v7[3] = CFSTR("numbers");
  objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = v3;
  v7[4] = CFSTR("vcard");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preferredFileTypeForItemProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  -[ICBaseTextView preferredFileTypesExtensionDictionary](self, "preferredFileTypesExtensionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "registeredTypeIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "intersectSet:", v8);
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isPasswordProtected") & 1) == 0)
    {

      goto LABEL_6;
    }
    v15 = objc_msgSend(MEMORY[0x1E0D639F0], "isTypeUTISupportedForPasswordProtectedNotes:", v12);

    if ((v15 & 1) == 0)
    {
      v13 = v12;
      v12 = 0;
LABEL_6:

    }
  }

  return v12;
}

- (BOOL)shouldCheckURLFirstForItemProvider:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "registeredTypeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)*MEMORY[0x1E0CEC4D0], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObjects:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v5, "intersectsSet:", v8);
  return (char)v7;
}

- (id)attributedStringForURL:(id)a3 uti:(id)a4 name:(id)a5 metadata:(id)a6 synapseData:(id)a7 session:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_msgSend(v18, "supportsAttachments");
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  v42 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__ICBaseTextView_DragAndDrop__attributedStringForURL_uti_name_metadata_synapseData_session___block_invoke;
  v28[3] = &unk_1EA7DDA50;
  v20 = v13;
  v29 = v20;
  v21 = v18;
  v30 = v21;
  v36 = v19;
  v22 = v14;
  v31 = v22;
  v23 = v16;
  v32 = v23;
  v24 = v17;
  v33 = v24;
  v25 = v15;
  v34 = v25;
  v35 = &v37;
  objc_msgSend(v21, "performBlockAndWait:", v28);
  v26 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __92__ICBaseTextView_DragAndDrop__attributedStringForURL_uti_name_metadata_synapseData_session___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;

  v3 = a2;
  if (v3
    && objc_msgSend(*(id *)(a1 + 32), "ic_isSupportedAsAttachment")
    && objc_msgSend(v3, "canAddAttachment")
    && ((objc_msgSend(*(id *)(a1 + 40), "isForDragAndDrop") & 1) != 0
     || !objc_msgSend(*(id *)(a1 + 32), "ic_isWebURL")
     || objc_msgSend(*(id *)(a1 + 32), "ic_isMapURL"))
    && *(_BYTE *)(a1 + 88))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isFileURL");
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      v38 = 0;
      objc_msgSend(v5, "getResourceValue:forKey:error:", &v38, *MEMORY[0x1E0C99998], 0);
      v6 = v38;
      v7 = v6;
      if (v6)
        v8 = objc_msgSend(v6, "unsignedIntegerValue");
      else
        v8 = 0;
      objc_msgSend(*(id *)(a1 + 40), "incrementNumberOfAttachmentsAttemptedAdded");
      if (objc_msgSend(v3, "attachmentExceedsMaxSizeAllowed:", v8))
      {
        objc_msgSend(*(id *)(a1 + 40), "addErrorWithCode:", 207);
        v11 = 0;
      }
      else
      {
        v21 = *(_QWORD *)(a1 + 48);
        if (v21)
          objc_msgSend(v3, "addAttachmentWithUTI:withURL:", v21, *(_QWORD *)(a1 + 32));
        else
          objc_msgSend(v3, "addAttachmentWithFileURL:", *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(v3, "addURLAttachmentWithURL:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v11)
      goto LABEL_21;
    if (*(_QWORD *)(a1 + 56))
      objc_msgSend(v11, "setMetadata:");
    if (*(_QWORD *)(a1 + 64))
      objc_msgSend(v11, "setSynapseData:");
    if (*(_QWORD *)(a1 + 48)
      && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC570]),
          v22,
          v23))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithURL:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v24, "documentAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CD0E98]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "length"))
      {
        objc_msgSend(v11, "setTitle:", v26);
LABEL_51:

LABEL_52:
        objc_msgSend(MEMORY[0x1E0D64D98], "textAttachmentWithAttachment:", v11);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v33);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v36 = *(void **)(v35 + 40);
        *(_QWORD *)(v35 + 40) = v34;

        objc_msgSend(v3, "managedObjectContext");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ic_save");

        goto LABEL_21;
      }
      objc_msgSend(*(id *)(a1 + 72), "stringByDeletingPathExtension");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v30);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "ic_isMapURL")
        || (objc_msgSend(*(id *)(a1 + 32), "absoluteString"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(a1 + 72)),
            v27,
            !v28))
      {
        if (objc_msgSend(*(id *)(a1 + 72), "length"))
          objc_msgSend(v11, "setTitle:", *(_QWORD *)(a1 + 72));
        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(a1 + 32), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "queryItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name=%@"), CFSTR("q"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "filteredArrayUsingPredicate:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setTitle:", v32);
    }

    goto LABEL_51;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isFileURL") & 1) == 0)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    v10 = v9;
    if (*(_QWORD *)(a1 + 72))
    {
      v11 = (void *)objc_msgSend(v9, "initWithString:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "initWithString:", v12);

    }
    v13 = *MEMORY[0x1E0DC1160];
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v11, "length"));

    goto LABEL_20;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isFileURL")
    && (objc_msgSend(*(id *)(a1 + 32), "ic_isSupportedAsAttachment") & 1) == 0)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3778]);
    v19 = v18;
    if (*(_QWORD *)(a1 + 72))
    {
      v11 = (void *)objc_msgSend(v18, "initWithString:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v19, "initWithString:", v20);

    }
LABEL_20:
    v15 = objc_msgSend(v11, "copy");
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

LABEL_21:
    goto LABEL_22;
  }
  if ((objc_msgSend(v3, "canAddAttachment") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "incrementNumberOfAttachmentsAttemptedAdded");
    objc_msgSend(*(id *)(a1 + 40), "addErrorWithCode:", 202);
  }
LABEL_22:

}

- (BOOL)handleGenericFileForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 preferredTypeIdentifier:(id)a6 outProgress:(id *)a7 completionBlock:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE location[12];
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v36 = a4;
  v14 = a5;
  v15 = a6;
  v37 = a8;
  v16 = v15;
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D637F0], 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v13, "registeredTypeIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v45;
LABEL_12:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v29);
        if ((objc_msgSend(v25, "containsObject:", v30) & 1) == 0
          && -[ICBaseTextView isSupportedAsGenericFile:](self, "isSupportedAsGenericFile:", v30))
        {
          break;
        }
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v27)
            goto LABEL_12;
          goto LABEL_19;
        }
      }
      v17 = v30;

      if (v17)
        goto LABEL_2;
    }
    else
    {
LABEL_19:

      v17 = 0;
    }
    goto LABEL_21;
  }
LABEL_2:
  v18 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "note");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shortLoggingDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v34;
    v49 = 2112;
    v50 = v36;
    v51 = 2112;
    v52 = v17;
    _os_log_debug_impl(&dword_1DD7B0000, v18, OS_LOG_TYPE_DEBUG, "Generic file drop in note: %@, position: %@, UTI: %@", location, 0x20u);

  }
  -[ICBaseTextView editorController](self, "editorController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "note");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isPasswordProtected"))
  {
    v21 = objc_msgSend(MEMORY[0x1E0D639F0], "isTypeUTISupportedForPasswordProtectedNotes:", v17);

    if ((v21 & 1) == 0)
    {
      if ((objc_msgSend(v14, "didWarnAboutNotSupportedForPasswordProtectedNotes") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D64B30], "cannotAddAttachmentsInfoAlertWithAttachmentCount:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICBaseTextView window](self, "window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "presentInWindow:completionHandler:", v23, 0);

        objc_msgSend(v14, "setDidWarnAboutNotSupportedForPasswordProtectedNotes:", 1);
      }
LABEL_21:
      v24 = 0;
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_initWeak((id *)location, self);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __144__ICBaseTextView_DragAndDrop__handleGenericFileForItemProvider_atTextPosition_pasteSession_preferredTypeIdentifier_outProgress_completionBlock___block_invoke;
  v38[3] = &unk_1EA7DD960;
  objc_copyWeak(&v43, (id *)location);
  v17 = v17;
  v39 = v17;
  v40 = v13;
  v41 = v14;
  v42 = v37;
  objc_msgSend(v40, "loadFileRepresentationForTypeIdentifier:completionHandler:", v17, v38);
  *a7 = (id)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)location);
  v24 = 1;
LABEL_22:

  return v24;
}

void __144__ICBaseTextView_DragAndDrop__handleGenericFileForItemProvider_atTextPosition_pasteSession_preferredTypeIdentifier_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5
    && (v8 = (void *)objc_opt_class(),
        v9 = *(_QWORD *)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 40), "suggestedName"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (void *)objc_msgSend(v8, "copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:", v5, v9, v10),
        v10,
        v11))
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "suggestedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attributedStringForURL:uti:name:metadata:synapseData:session:", v11, v12, v13, 0, 0, *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(v11, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "removeItemAtURL:error:", v15, &v19);
    v17 = v19;

    if (v17 && objc_msgSend(v17, "code") != 4)
    {
      v18 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (BOOL)isSupportedAsGenericFile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICBaseTextView typeIdentifiersSupportedAsGenericFiles](self, "typeIdentifiersSupportedAsGenericFiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "conformsToType:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)shouldAcceptDropSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }
  v7 = (void *)v6;
  -[ICBaseTextView editorController](self, "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditable");

  if (!v10)
    goto LABEL_14;
  v11 = *MEMORY[0x1E0D629B8];
  v29[0] = CFSTR("com.apple.notes.noteitemprovider");
  v29[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_14;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "items", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "itemProvider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICBaseTextView itemProviderConsumerTypesForItemProvider:](self, "itemProviderConsumerTypesForItemProvider:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          v22 = 1;
          goto LABEL_17;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_17:

LABEL_15:
  return v22;
}

- (id)itemProviderConsumerTypesForItemProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  ICBaseTextView *v51;
  id obj;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v6, "isPasswordProtected");

  v51 = self;
  v7 = -[ICBaseTextView supportsAttachments](self, "supportsAttachments");
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v41 = v4;
  objc_msgSend(v4, "registeredTypeIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v53 = (id)objc_claimAutoreleasedReturnValue();

  if (itemProviderConsumerTypesForItemProvider__onceToken != -1)
    dispatch_once(&itemProviderConsumerTypesForItemProvider__onceToken, &__block_literal_global_176);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v4, "registeredTypeIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    v13 = !v7 | v49;
    v43 = *MEMORY[0x1E0CEC520];
    v44 = *MEMORY[0x1E0CEC570];
    v47 = *MEMORY[0x1E0CEC618];
    v42 = *MEMORY[0x1E0CEC568];
    v40 = *MEMORY[0x1E0CEC450];
    v45 = *MEMORY[0x1E0CEC610];
    v46 = *MEMORY[0x1E0CEC488];
    v48 = *(_QWORD *)v55;
    do
    {
      v14 = 0;
      v50 = v11;
      do
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v14);
        if (v7)
          v16 = &itemProviderConsumerTypesForItemProvider__utiToConsumer;
        else
          v16 = &itemProviderConsumerTypesForItemProvider__utiToConsumerNoAttachments;
        objc_msgSend((id)*v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v14), v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v53, "addObject:", v17);
          goto LABEL_47;
        }
        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "conformsToType:", v44) & 1) != 0)
          {
            v19 = ICInternalSettingsDefaultToPaperKitPDFsAndScans();

            if (v19)
            {
              v20 = v53;
              v21 = &unk_1EA821B08;
LABEL_22:
              objc_msgSend(v20, "addObject:", v21);
              goto LABEL_24;
            }
          }
          else
          {

          }
        }
        if (!v7)
          goto LABEL_24;
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "conformsToType:", v43) & 1) != 0)
        {
          v23 = -[ICBaseTextView hasSupportedImageInItemProvider:](v51, "hasSupportedImageInItemProvider:", v41);

          if (!v23)
            goto LABEL_24;
          v20 = v53;
          v21 = &unk_1EA821B20;
          goto LABEL_22;
        }

LABEL_24:
        v24 = v13;
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "conformsToType:", v47);

        if (v26)
          objc_msgSend(v53, "addObject:", &unk_1EA821B38);
        if (!v7)
        {
          if ((v49 & 1) != 0)
            goto LABEL_35;
          goto LABEL_34;
        }
        if ((v49 & 1) != 0)
          goto LABEL_35;
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "conformsToType:", v42))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "conformsToType:", v40);

          if (!v29)
            goto LABEL_34;
        }
        objc_msgSend(v53, "addObject:", &unk_1EA821B50);
LABEL_34:
        -[ICBaseTextView preferredFileTypesExtensionDictionary](v51, "preferredFileTypesExtensionDictionary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v15);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          goto LABEL_43;
LABEL_35:
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "conformsToType:", v45))
        {

LABEL_38:
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "conformsToType:", v46))
            v36 = &unk_1EA821B68;
          else
            v36 = &unk_1EA821B80;
          objc_msgSend(v53, "addObject:", v36);

          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "conformsToType:", v46);

        if (v34)
          goto LABEL_38;
LABEL_42:
        v31 = 0;
LABEL_43:
        v13 = v24;
        if ((v24 & 1) == 0 && -[ICBaseTextView isSupportedAsGenericFile:](v51, "isSupportedAsGenericFile:", v15))
          objc_msgSend(v53, "addObject:", &unk_1EA821B98);

        v12 = v48;
        v11 = v50;
LABEL_47:

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v11);
  }

  -[ICBaseTextView itemProviderPasteSession](v51, "itemProviderPasteSession");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "isForDragAndDrop") & 1) != 0)
  {

  }
  else
  {
    v38 = objc_msgSend(v53, "count");

    if (v38 >= 2)
      objc_msgSend(v53, "sortUsingSelector:", sel_compare_);
  }

  return v53;
}

void __72__ICBaseTextView_DragAndDrop__itemProviderConsumerTypesForItemProvider___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CD12E0];
  v10[0] = *MEMORY[0x1E0D637F0];
  v0 = v10[0];
  v10[1] = v1;
  v11[0] = &unk_1EA821A78;
  v11[1] = &unk_1EA821A90;
  v2 = *MEMORY[0x1E0CD12D8];
  v10[2] = *MEMORY[0x1E0CD12E8];
  v10[3] = v2;
  v3 = *MEMORY[0x1E0D63D58];
  v10[4] = *MEMORY[0x1E0D63680];
  v10[5] = v3;
  v11[2] = &unk_1EA821AA8;
  v11[3] = &unk_1EA821AC0;
  v11[4] = &unk_1EA821AC0;
  v11[5] = &unk_1EA821AD8;
  v10[6] = *MEMORY[0x1E0DB0770];
  v11[6] = &unk_1EA821AF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)itemProviderConsumerTypesForItemProvider__utiToConsumer;
  itemProviderConsumerTypesForItemProvider__utiToConsumer = v4;

  v8 = v0;
  v9 = &unk_1EA821A78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)itemProviderConsumerTypesForItemProvider__utiToConsumerNoAttachments;
  itemProviderConsumerTypesForItemProvider__utiToConsumerNoAttachments = v6;

}

- (id)standardizedAttributedString:(id)a3 attachmentIdentifiers:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  ICBaseTextView *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  if (a4)
    v7 = (void *)objc_opt_new();
  else
    v7 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workerContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke;
  v17 = &unk_1EA7DDAE0;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v21 = &v22;
  v11 = v7;
  v20 = v11;
  objc_msgSend(v9, "performBlockAndWait:", &v14);

  if (a4)
    *a4 = (id)objc_msgSend(v11, "copy", v14, v15, v16, v17, v18, v19);
  v12 = (void *)objc_msgSend((id)v23[5], "copy", v14, v15, v16, v17);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  _QWORD v17[4];
  __int128 v18;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D64D60];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemProviderPasteSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardizedAttributedStringFromAttributedString:withStyler:fixAttachments:translateICTTFont:context:", v4, v2, 0, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemProviderPasteSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workerContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "length");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke_2;
  v17[3] = &unk_1EA7DDAB8;
  v16 = *(_OWORD *)(a1 + 48);
  v15 = (id)v16;
  v18 = v16;
  objc_msgSend(v11, "ic_enumerateAttachmentsInContext:range:options:usingBlock:", v13, 0, v14, 2, v17);

}

void __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D64D98], "textAttachmentWithAttachment:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fixAttachmentForAttributedString:range:forPlainText:forStandardizedText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3, a4, 0, 1);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v10, "attachmentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v10, "attachmentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

- (BOOL)attributedStringContainsICTTAttachment:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = objc_msgSend(v3, "length");
  v5 = *MEMORY[0x1E0DC10F8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ICBaseTextView_DragAndDrop__attributedStringContainsICTTAttachment___block_invoke;
  v8[3] = &unk_1EA7DD260;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __70__ICBaseTextView_DragAndDrop__attributedStringContainsICTTAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)_shouldBecomeEditableUponDrop
{
  return 1;
}

- (BOOL)textDroppableView:(id)a3 dropSession:(id)a4 willMoveCaretToRange:(id)a5
{
  _BOOL4 v6;

  if (-[ICBaseTextView isDraggingOverChecklistItem](self, "isDraggingOverChecklistItem", a3, a4, a5))
    LOBYTE(v6) = 0;
  else
    v6 = !-[ICBaseTextView inhibitNextDropCursorUpdateAnimation](self, "inhibitNextDropCursorUpdateAnimation");
  -[ICBaseTextView setInhibitNextDropCursorUpdateAnimation:](self, "setInhibitNextDropCursorUpdateAnimation:", 0);
  return v6;
}

- (id)textDraggableView:(id)a3 textRangeForDragFromPosition:(id)a4 defaultRange:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  id v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  CGPoint v70;
  CGPoint v71;
  CGRect v72;
  CGRect v73;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v59 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v11;
  objc_msgSend(v12, "locationInView:", v10);
  v15 = v14;
  v17 = v16;
  -[ICBaseTextView containerViewForAttachments](self, "containerViewForAttachments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hitTest:forEvent:", 0, v15, v17);
  v19 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v58 = (void *)v19;
  ICDynamicCast();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView containerViewForAttachments](self, "containerViewForAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subviews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ic_objectsPassingTest:", &__block_literal_global_195);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v20;
  v25 = v24;
  v60 = v23;
  if (!v24)
  {
    v57 = v13;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v35 = v23;
    v39 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (!v39)
    {
      v36 = 0;
      v25 = 0;
      v33 = v13;
      goto LABEL_3;
    }
    v40 = v39;
    v56 = v12;
    v25 = 0;
    v41 = *(_QWORD *)v65;
    v63 = INFINITY;
    v61 = v17;
    v62 = v15;
    while (2)
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v65 != v41)
          objc_enumerationMutation(v35);
        v43 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v10, "convertPoint:toView:", 0, v15, v17);
        objc_msgSend(v43, "convertPoint:fromView:", 0);
        v45 = v44;
        v47 = v46;
        objc_msgSend(v43, "bounds");
        -[ICBaseTextView touchIsPointer](self, "touchIsPointer");
        objc_msgSend(v43, "bounds");
        TSDCenterOfRect();
        TSDDistance();
        v49 = v48;
        objc_msgSend(v43, "bounds");
        v70.x = v45;
        v70.y = v47;
        if (CGRectContainsPoint(v72, v70))
        {
          v55 = v43;

          v25 = v55;
          goto LABEL_23;
        }
        TSDMultiplySizeScalar();
        TSDMultiplySizeScalar();
        TSDAddSizes();
        TSDCenterOfRect();
        TSDRectWithCenterAndSize();
        v71.x = v45;
        v71.y = v47;
        if (CGRectContainsPoint(v73, v71) && v49 < v63)
        {
          v51 = v43;

          v63 = v49;
          v25 = v51;
        }
        objc_msgSend(v25, "trackedParagraph");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "characterRange");
        v54 = v53;

        v17 = v61;
        v15 = v62;
        if (v54 <= 1)
        {

          v25 = 0;
        }
      }
      v40 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      if (v40)
        continue;
      break;
    }
LABEL_23:

    v12 = v56;
    v13 = v57;
    v37 = v60;
    if (!v25)
    {
      v36 = 0;
      v33 = v57;
      goto LABEL_4;
    }
  }
  objc_msgSend(v25, "trackedParagraph");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "characterRange");
  v29 = v28;

  -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v27, v29);
  v30 = -[ICBaseTextView selectedRange](self, "selectedRange");
  -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView setSelectedTextRange:](self, "setSelectedTextRange:", v32);

  -[ICBaseTextView selectedTextRange](self, "selectedTextRange");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "imageFrame");
  -[ICBaseTextView setChecklistDragVerticalOffset:](self, "setChecklistDragVerticalOffset:", v34 * 0.75);
  objc_msgSend(v25, "trackedParagraph");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView setDraggedChecklistTrackedParagraph:](self, "setDraggedChecklistTrackedParagraph:", v35);
  v36 = 1;
LABEL_3:

  v37 = v60;
LABEL_4:
  -[ICBaseTextView setIsDraggingChecklistItem:](self, "setIsDraggingChecklistItem:", v36);

  return v33;
}

BOOL __99__ICBaseTextView_DragAndDrop__textDraggableView_textRangeForDragFromPosition_defaultRange_session___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (id)textDroppableView:(id)a3 positionForDrop:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = a4;
  objc_msgSend(v5, "dropPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem"))
  {
    objc_msgSend(v5, "dropSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self);
    v9 = v8;
    v11 = v10;

    objc_msgSend(v5, "icaxValueForKeyPath:", CFSTR("dropSession.sessionDestination.isAccessibilitySession"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    objc_opt_class();
    UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x1E0DC4588]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = v13;
    else
      v16 = 0;
    if (v16 == 1)
    {
      objc_msgSend(v15, "frame");
      TSDClampPointInRect();
      v9 = v17;
      v19 = v18;
    }
    else
    {
      -[ICBaseTextView checklistDragVerticalOffset](self, "checklistDragVerticalOffset");
      v19 = v11 - v20;
    }
    if (ICInternalSettingsIsTextKit2Enabled()
      && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v21))
    {
      -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "characterIndexForPoint:", v9, v19);

      -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trackedTodoParagraphAtIndex:", v23);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICBaseTextView textContainer](self, "textContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v27, 0, v9, v19);

      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trackedTodoParagraphAtIndexIfExists:", v23);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v25;

    if (!v28)
    {
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v23, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "start");
        v31 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v31;
      }
      -[ICBaseTextView setIsDraggingOverChecklistItem:](self, "setIsDraggingOverChecklistItem:", 0);
      -[ICBaseTextView setTrackedParagraphCurrentlyUnderDraggedChecklist:](self, "setTrackedParagraphCurrentlyUnderDraggedChecklist:", 0);
      -[ICBaseTextView tempHighlightLayerIfExists](self, "tempHighlightLayerIfExists");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeFromSuperlayer");
      goto LABEL_22;
    }
    if (v16)
    {
      v29 = objc_msgSend(v28, "characterRange");
    }
    else
    {
      v33 = +[ICChecklistDragUtilities shouldDropAboveForTrackedTodoParagraph:forPoint:textView:](ICChecklistDragUtilities, "shouldDropAboveForTrackedTodoParagraph:forPoint:textView:", v28, self, v9, v19);
      v34 = objc_msgSend(v28, "characterRange");
      v29 = v34;
      if (!v33)
      {
        v29 = v34 + v35;
        goto LABEL_21;
      }
    }
    v33 = 1;
LABEL_21:
    -[ICBaseTextView setIsDraggingOverChecklistItem:](self, "setIsDraggingOverChecklistItem:", 1);
    -[ICBaseTextView setTrackedParagraphCurrentlyUnderDraggedChecklist:](self, "setTrackedParagraphCurrentlyUnderDraggedChecklist:", v28);
    -[ICBaseTextView setShouldDropChecklistAbove:](self, "setShouldDropChecklistAbove:", v33);
    -[ICBaseTextView invalidateDropCaret](self, "invalidateDropCaret");
    -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v29, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "start");
    v36 = objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView setLastChecklistDropIndex:](self, "setLastChecklistDropIndex:", v29);
    v6 = (void *)v36;
LABEL_22:

  }
  return v6;
}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[7];
  uint64_t v80;
  uint64_t v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;
  NSRange v85;
  NSRange v86;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  -[ICBaseTextView textContainer](self, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "insideSiriSnippet");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "dragRange");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICBaseTextView ic_characterRangeFromTextRange:](self, "ic_characterRangeFromTextRange:");
    v12 = v11;
    v13 = (uint64_t *)MEMORY[0x1E0DC10F8];
    if (v11 == 1)
    {
      objc_opt_class();
      -[ICBaseTextView textStorage](self, "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attribute:atIndex:effectiveRange:", *v13, v10, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if ((objc_msgSend(v16, "canDragWithoutSelecting") & 1) == 0)
        {
          v86.location = -[ICBaseTextView selectedRange](self, "selectedRange");
          v86.length = v17;
          v85.location = v10;
          v85.length = 1;
          if (!NSIntersectionRange(v85, v86).length)
            goto LABEL_60;
        }
      }
      if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
      {
        UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x1E0DC4588]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_59:

LABEL_60:
            v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_56:

            goto LABEL_57;
          }
        }

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (ICInternalSettingsIsTextKit2Enabled()
          && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v19,
              v19))
        {
          -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "documentRange");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "location");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "locationFromLocation:withOffset:", v23, v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICBaseTextView textContainer](self, "textContainer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "viewProviderForParentView:location:textContainer:", self, v24, v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[ICBaseTextView layoutManager](self, "layoutManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "viewProviderForParentView:characterIndex:layoutManager:", self, v10, v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v18, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dragSession");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "locationInView:", v28);
        objc_msgSend(v26, "hitTest:withEvent:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          while (1)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            NSClassFromString(CFSTR("ICPaperDocumentTextAttachmentView"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v29, "superview");
              v30 = objc_claimAutoreleasedReturnValue();

              v29 = (void *)v30;
              if (v30)
                continue;
            }

            goto LABEL_22;
          }

          goto LABEL_59;
        }
LABEL_22:

        v13 = (uint64_t *)MEMORY[0x1E0DC10F8];
      }

    }
    -[ICBaseTextView editorController](self, "editorController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "note");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "managedObjectContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "ic_save");

    -[ICBaseTextView editorController](self, "editorController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "note");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "textStorage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView textStorage](self, "textStorage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36 != v37)
    {
      objc_opt_class();
      -[ICBaseTextView textStorage](self, "textStorage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v10, v12, v39);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "itemProviderForRange:andNote:", v10, v12, v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
      -[ICBaseTextView viewsGhostedForDrag](self, "viewsGhostedForDrag");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICBaseTextView setViewsGhostedForDrag:](self, "setViewsGhostedForDrag:", v53);

      }
      -[ICBaseTextView textStorage](self, "textStorage");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *v13;
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __62__ICBaseTextView_DragAndDrop__textDraggableView_itemsForDrag___block_invoke;
      v79[3] = &unk_1EA7DDB28;
      v79[4] = self;
      v79[5] = v10;
      v79[6] = v12;
      objc_msgSend(v54, "enumerateAttribute:inRange:options:usingBlock:", v55, v10, v12, 0, v79);

      if (ICInternalSettingsIsTextKit2Enabled()
        && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
            (v56 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v57 = (void *)v56;
        v58 = v5;
        -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "todoButtonsForCharacterRange:", v10, v12);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v58 = v5;
        -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "todoButtonsForCharacterRange:", v10, v12);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v61 = v60;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v76 != v64)
              objc_enumerationMutation(v61);
            v66 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            -[ICBaseTextView viewsGhostedForDrag](self, "viewsGhostedForDrag");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "addObject:", v66);

            objc_msgSend(v66, "setAlpha:", 0.2);
          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        }
        while (v63);
      }

      if (v40)
      {
        v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v40);
        v69 = v73;
        objc_msgSend(v68, "setLocalObject:", v73);
        v5 = v58;
        objc_msgSend(v58, "dragSession");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setLocalContext:", self);

        v82 = v68;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = v58;
        objc_msgSend(v58, "suggestedItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v73;
      }

      goto LABEL_56;
    }
    v41 = (void *)objc_opt_class();
    -[ICBaseTextView editorController](self, "editorController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "note");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "attachmentInNote:range:", v43, v10, v12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:uiRange:](self, "correctlyPositionedPreviewForCharacterRange:uiRange:", v10, v12, v74);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v73)
      {
        objc_msgSend(v35, "textStorage");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v10, v12, v45);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v44, "attachmentModel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "itemProvider");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
        goto LABEL_38;
    }
    else
    {
      v73 = 0;
    }
    v47 = v13;
    v80 = 0;
    v81 = 0;
    objc_msgSend(v35, "textStorage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], v10, &v80);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49 && v10 == v80 && v12 == v81)
    {
      v40 = 0;
    }
    else
    {
      objc_msgSend(v35, "textStorage");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v10, v12, v50);
      v72 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "textStorage");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "itemProviderForRange:andNote:", v10, v12, v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v73 = (void *)v72;
    }

    v13 = v47;
LABEL_38:

    goto LABEL_39;
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_57:

  return v9;
}

void __62__ICBaseTextView_DragAndDrop__textDraggableView_itemsForDrag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (ICInternalSettingsIsTextKit2Enabled()
      && (objc_msgSend(*(id *)(a1 + 32), "textLayoutManager"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationFromLocation:withOffset:", v8, *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "icTextLayoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ICDynamicCast();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "newViewProviderForTextAttachment:parentView:location:", v11, *(_QWORD *)(a1 + 32), v9);

    }
    else
    {
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v13, "layoutManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "viewProviderForParentView:characterIndex:layoutManager:", v13, v14, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v12, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewsGhostedForDrag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v15);

      objc_msgSend(*(id *)(a1 + 32), "viewsGhostedForDrag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 >= 2)
        objc_msgSend(v15, "setAlpha:", 0.2);
    }

  }
}

- (void)resetViewsGhostedForDrag
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ICBaseTextView setIsDraggingChecklistItem:](self, "setIsDraggingChecklistItem:", 0);
  -[ICBaseTextView setDraggedChecklistTrackedParagraph:](self, "setDraggedChecklistTrackedParagraph:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ICBaseTextView viewsGhostedForDrag](self, "viewsGhostedForDrag", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAlpha:", 1.0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[ICBaseTextView setViewsGhostedForDrag:](self, "setViewsGhostedForDrag:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (void)textDraggableView:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__ICBaseTextView_DragAndDrop__textDraggableView_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1EA7DDB50;
  v5[4] = self;
  objc_msgSend(a4, "addCompletion:", v5);
}

uint64_t __85__ICBaseTextView_DragAndDrop__textDraggableView_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "resetViewsGhostedForDrag");
  return result;
}

- (id)textDraggableView:(id)a3 dragPreviewForLiftingItem:(id)a4 session:(id)a5
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_opt_class();
  objc_msgSend(v5, "localObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLocalObject:", 0);
  return v7;
}

- (void)textDraggableView:(id)a3 dragSessionWillBegin:(id)a4
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textDraggableView:dragSessionWillBegin:].cold.1(self);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICBaseTextView viewsGhostedForDrag](self, "viewsGhostedForDrag", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "setAlpha:", 0.2);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentMergeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginBlockingMergeForReason:textView:", 2, self);

  -[ICBaseTextView setLastChecklistDropIndex:](self, "setLastChecklistDropIndex:", -1);
}

- (void)textDraggableView:(id)a3 dragSessionDidEnd:(id)a4 withOperation:(unint64_t)a5
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textDraggableView:dragSessionDidEnd:withOperation:].cold.1(self);

  -[ICBaseTextView editorController](self, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentMergeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endBlockingMergeForReason:textView:", 2, self);

  -[ICBaseTextView editorController](self, "editorController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveNote");

  -[ICBaseTextView setIsDraggingOverChecklistItem:](self, "setIsDraggingOverChecklistItem:", 0);
  -[ICBaseTextView setTrackedParagraphCurrentlyUnderDraggedChecklist:](self, "setTrackedParagraphCurrentlyUnderDraggedChecklist:", 0);
  -[ICBaseTextView setLastChecklistDropIndex:](self, "setLastChecklistDropIndex:", -1);
  -[ICBaseTextView resetViewsGhostedForDrag](self, "resetViewsGhostedForDrag");
}

- (id)textDroppableView:(id)a3 previewForDroppingAllItemsWithDefault:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cleanupStaleTodoButtons");

  }
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "styler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem")
    || !-[ICBaseTextView isDraggingOverChecklistItem](self, "isDraggingOverChecklistItem"))
  {
    goto LABEL_18;
  }
  -[ICBaseTextView lastChecklistDropIndex](self, "lastChecklistDropIndex");
  objc_msgSend(v6, "fixupAfterEditing");
  v9 = -[ICBaseTextView lastChecklistDropIndex](self, "lastChecklistDropIndex");
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
  {
    -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackedTodoParagraphAtIndex:", v9);
  }
  else
  {
    -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackedTodoParagraphAtIndexIfExists:", v9);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ICBaseTextView draggedChecklistTrackedParagraph](self, "draggedChecklistTrackedParagraph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "characterRange");

    if (v13 < v9)
    {
      objc_msgSend(v8, "expandedChecklistTrackedParagraphsInTextView:forIndex:", self, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "indexOfObject:", v11);
      if (v15)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v15 - 1);
        v16 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v16;
      }

    }
    v17 = objc_msgSend(v11, "characterRange");
    v19 = v18;
    if (v18 >= 2)
    {
      objc_msgSend(v6, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringWithRange:", v17, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "ic_isLastCharacterANewline");

      v19 -= v22;
    }
    -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v17, v19, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (ICInternalSettingsIsTextKit2Enabled()
      && (-[ICBaseTextView textLayoutManager](self, "textLayoutManager"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v24))
    {
      -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "documentRange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "location");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "locationFromLocation:withOffset:", v27, v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "locationFromLocation:withOffset:", v28, v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v28, v29);
      -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "invalidateLayoutForRange:", v30);

    }
    else
    {
      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "invalidateLayoutForCharacterRange:actualCharacterRange:", v17, v19, 0);
    }

  }
  else
  {
LABEL_18:
    v23 = 0;
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setShouldManuallyRenderSeparateSubviews:", 0);

    -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIsRenderingPreviewForDragAndDrop:", 0);

  }
  return v23;
}

- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4
{
  return 1;
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "dropSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICBaseTextView shouldAcceptDropSession:](self, "shouldAcceptDropSession:", v6);

  if (v7)
  {
    if ((objc_msgSend(v5, "isSameView") & 1) != 0)
    {
      v8 = 3;
    }
    else
    {
      objc_msgSend(v5, "dropSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICBaseTextView _isDropSessionLocalDragContextViewFromSubview:](self, "_isDropSessionLocalDragContextViewFromSubview:", v9))
      {
        v8 = 3;
      }
      else
      {
        v8 = 2;
      }

    }
  }
  else
  {
    v8 = 1;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DA8]), "initWithDropOperation:", v8);

  return v10;
}

- (BOOL)_isDropSessionLocalDragContextViewFromSubview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "localDragSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v4, "localDragSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICBaseTextView containsView:](self, "containsView:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textDroppableView:willPerformDrop:].cold.1(self);

  -[ICBaseTextView itemProviderPasteSessionCreateIfNecessary](self, "itemProviderPasteSessionCreateIfNecessary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsForDragAndDrop:", 1);
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsDropping:", 1);

  -[ICBaseTextView setPasteDelegate:](self, "setPasteDelegate:", self);
  LODWORD(v8) = objc_msgSend(v5, "isSameView");

  if ((_DWORD)v8)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasMadeEdits");

    -[ICBaseTextView editorController](self, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateModificationDateAndChangeCountAndSaveAfterDelay");

  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setShouldManuallyRenderSeparateSubviews:", 1);
    objc_msgSend(v13, "setIsRenderingPreviewForDragAndDrop:", 1);

  }
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textDroppableView:dropSessionDidEnter:].cold.1(self);

  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentMergeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginBlockingMergeForReason:textView:", 2, self);

}

- (void)textDroppableView:(id)a3 dropSessionDidExit:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textDroppableView:dropSessionDidExit:].cold.1(self);

  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentMergeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endBlockingMergeForReason:textView:", 2, self);

  -[ICBaseTextView editorController](self, "editorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveNote");

}

- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textDroppableView:dropSessionDidEnd:].cold.1(self);

  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentMergeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endBlockingMergeForReason:textView:", 2, self);

  -[ICBaseTextView editorController](self, "editorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveNote");

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsDropping:", 0);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setShouldManuallyRenderSeparateSubviews:", 0);
    objc_msgSend(v12, "setIsRenderingPreviewForDragAndDrop:", 0);

  }
  -[ICBaseTextView icaxClearCaches](self, "icaxClearCaches");
}

- (id)itemProviderPasteSessionCreateIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  ICBaseTextViewItemProviderPasteSession *v9;
  void *v10;
  ICBaseTextViewItemProviderPasteSession *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __72__ICBaseTextView_DragAndDrop__itemProviderPasteSessionCreateIfNecessary__block_invoke;
    v18 = &unk_1EA7DD498;
    v19 = v5;
    v20 = v6;
    v7 = v6;
    v8 = v5;
    objc_msgSend(v7, "performBlockAndWait:", &v15);
    v9 = [ICBaseTextViewItemProviderPasteSession alloc];
    objc_msgSend(v8, "objectID", v15, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICBaseTextViewItemProviderPasteSession initWithNoteObjectID:](v9, "initWithNoteObjectID:", v10);
    -[ICBaseTextView setItemProviderPasteSession:](self, "setItemProviderPasteSession:", v11);

    v12 = -[ICBaseTextView supportsAttachments](self, "supportsAttachments");
    -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSupportsAttachments:", v12);

    -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __72__ICBaseTextView_DragAndDrop__itemProviderPasteSessionCreateIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "save");
  return objc_msgSend(*(id *)(a1 + 40), "ic_save");
}

- (id)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  ICBaseTextView *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  id v28;
  id v29;
  id obj;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:transformPasteItem:].cold.2(self);

  -[ICBaseTextView itemProviderPasteSessionCreateIfNecessary](self, "itemProviderPasteSessionCreateIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:transformPasteItem:].cold.1(v9);

  -[ICBaseTextView selectedTextRange](self, "selectedTextRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "end");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke;
  aBlock[3] = &unk_1EA7DDBC8;
  v31 = v8;
  v48 = v31;
  v28 = v6;
  v49 = v28;
  v12 = _Block_copy(aBlock);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v9;
  -[ICBaseTextView itemProviderConsumerTypesForItemProvider:](self, "itemProviderConsumerTypesForItemProvider:", v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = self;
    v17 = 0;
    v18 = *(_QWORD *)v44;
LABEL_7:
    v19 = 0;
    while (2)
    {
      if (*(_QWORD *)v44 != v18)
        objc_enumerationMutation(obj);
      switch(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v19), "unsignedIntegerValue"))
      {
        case 0:
          v42 = 0;
          v20 = -[ICBaseTextView handleTopotextDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleTopotextDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v42, v12);
          v21 = v42;
          goto LABEL_20;
        case 1:
          v37 = 0;
          v20 = -[ICBaseTextView handlePaperDocumentDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handlePaperDocumentDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v37, v12);
          v21 = v37;
          goto LABEL_20;
        case 2:
          v38 = 0;
          v20 = -[ICBaseTextView handleInlinePaperDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleInlinePaperDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v38, v12);
          v21 = v38;
          goto LABEL_20;
        case 3:
        case 4:
          v36 = 0;
          v20 = -[ICBaseTextView handleInlineDrawingDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleInlineDrawingDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v36, v12);
          v21 = v36;
          goto LABEL_20;
        case 5:
          v33 = 0;
          v20 = -[ICBaseTextView handleMapKitItemDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleMapKitItemDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v33, v12);
          v21 = v33;
          goto LABEL_20;
        case 6:
          v39 = 0;
          v20 = -[ICBaseTextView handleMovieOrAudioDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleMovieOrAudioDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v39, v12);
          v21 = v39;
          goto LABEL_20;
        case 7:
        case 11:
          v41 = 0;
          v20 = -[ICBaseTextView handleAttributedStringDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleAttributedStringDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v41, v12);
          v21 = v41;
          goto LABEL_20;
        case 8:
          v40 = 0;
          v20 = -[ICBaseTextView handleImageDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleImageDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v40, v12);
          v21 = v40;
          goto LABEL_20;
        case 9:
        case 10:
          v34 = 0;
          v20 = -[ICBaseTextView handleURLDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:](v16, "handleURLDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:", v13, v32, v31, &v34, v12);
          v21 = v34;
LABEL_20:
          v22 = v21;

          v17 = v22;
          if (!v20)
            goto LABEL_21;
          goto LABEL_27;
        case 12:
          -[ICBaseTextView preferredFileTypeForItemProvider:](v16, "preferredFileTypeForItemProvider:", v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          v24 = -[ICBaseTextView handleGenericFileForItemProvider:atTextPosition:pasteSession:preferredTypeIdentifier:outProgress:completionBlock:](v16, "handleGenericFileForItemProvider:atTextPosition:pasteSession:preferredTypeIdentifier:outProgress:completionBlock:", v13, v32, v31, v23, &v35, v12);
          v22 = v35;

          v17 = v22;
          if (!v24)
            goto LABEL_21;
LABEL_27:

          goto LABEL_30;
        default:
LABEL_21:
          if (v15 != ++v19)
            continue;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
          v15 = v25;
          if (!v25)
            goto LABEL_29;
          goto LABEL_7;
      }
    }
  }
  v17 = 0;
LABEL_29:

  (*((void (**)(void *, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  v22 = v17;
LABEL_30:
  v26 = v22;

  return v26;
}

void __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsAttachments") & 1) == 0)
  {
    objc_msgSend(v5, "ic_stringWithoutAttachments");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "supportsAttachments")
      && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentImagesPreloaded") <= 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "workerContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_2;
      v10[3] = &unk_1EA7DDBA0;
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v5, "ic_enumerateAttachmentsInContext:usingBlock:", v8, v10);

    }
    objc_msgSend(*(id *)(a1 + 40), "setAttributedStringResult:", v5);
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "setNoResult");
  }

}

void __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_3;
  v16 = &unk_1EA7DDB78;
  v17 = v7;
  v18 = *(id *)(a1 + 32);
  v19 = a5;
  v9 = v7;
  objc_msgSend(v8, "performBlockAndWait:", &v13);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D63780];
  v20 = *MEMORY[0x1E0D63788];
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", v11, 0, v12);

}

unint64_t __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_3(uint64_t a1)
{
  unint64_t result;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 3
    || (result = objc_msgSend(*(id *)(a1 + 32), "attachmentType"), (_DWORD)result == 5))
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "image");
    objc_msgSend(*(id *)(a1 + 40), "setNumberOfAttachmentImagesPreloaded:", objc_msgSend(*(id *)(a1 + 40), "numberOfAttachmentImagesPreloaded") + 1);
    result = objc_msgSend(*(id *)(a1 + 40), "numberOfAttachmentImagesPreloaded");
    if (result >= 2)
      **(_BYTE **)(a1 + 48) = 1;
  }
  return result;
}

+ (id)temporaryTextStorageWithAttributedString:(id)a3 note:(id)a4 filterAttributedString:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _BOOL4 v24;
  _QWORD v25[4];
  id v26;

  v24 = a5;
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D64D60]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:replicaID:", 0, v9);

  objc_msgSend(v10, "setShouldInhibitAddingExtraNewlinesAtEndDuringFixup:", 1);
  v11 = objc_alloc_init(MEMORY[0x1E0D64DB0]);
  objc_msgSend(v7, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC10F8];
  v14 = objc_msgSend(v6, "length");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke;
  v25[3] = &unk_1EA7DDC18;
  v15 = v12;
  v26 = v15;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v25);
  objc_opt_class();
  objc_msgSend(v7, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "styler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "zoomController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "zoomFactor");
  v21 = v20;
  objc_msgSend(v11, "zoomController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setZoomFactor:", v21);

  objc_msgSend(v10, "setStyler:", v11);
  if (v24)
  {
    objc_msgSend(v10, "setConvertAttributes:", 1);
    objc_msgSend(v10, "setFilterPastedAttributes:", 1);
  }
  objc_msgSend(v10, "setWantsUndoCommands:", 0);
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v10, "length"), v6);
  objc_msgSend(v7, "filterAttachmentsInTextStorage:range:", v10, 0, objc_msgSend(v10, "length"));
  objc_msgSend(v10, "fixupAfterEditing");
  objc_msgSend(v10, "setFilterPastedAttributes:", 0);
  objc_msgSend(v10, "setConvertAttributes:", 0);
  objc_msgSend(v10, "setStyler:", 0);

  return v10;
}

void __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    objc_msgSend(v8, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke_2;
      v9[3] = &unk_1EA7DDBF0;
      v10 = v6;
      v11 = *(id *)(a1 + 32);
      v12 = v8;
      objc_msgSend(v7, "performBlockAndWait:", v9);

    }
    v4 = v8;
  }

}

void __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setAttachment:", v2);

}

- (id)textPasteConfigurationSupporting:(id)a3 combineItemAttributedStrings:(id)a4 forRange:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  BOOL v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  unint64_t i;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t);
  void *v71;
  ICBaseTextView *v72;
  id v73;
  id v74;
  _QWORD *v75;
  id v76;
  id v77;
  _QWORD v78[3];
  char v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t);
  void *v83;
  ICBaseTextView *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v8 = a4;
  v60 = a5;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v80 = MEMORY[0x1E0C809B0];
    v81 = 3221225472;
    v82 = __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke;
    v83 = &unk_1EA7DD2D8;
    v84 = self;
    performBlockOnMainThreadAndWait();
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v10 = objc_msgSend(v8, "count");
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v79 = 0;
  -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isForDragAndDrop");
  if (v10 == 2)
    v13 = v12;
  else
    v13 = 1;

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    -[ICBaseTextView standardizedAttributedString:attachmentIdentifiers:](self, "standardizedAttributedString:attachmentIdentifiers:", v14, &v77);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v77;

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    -[ICBaseTextView standardizedAttributedString:attachmentIdentifiers:](self, "standardizedAttributedString:attachmentIdentifiers:", v16, &v76);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v76;

    -[ICBaseTextView editorController](self, "editorController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_opt_class();
      ICDynamicCast();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "note");
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v21, "calculateDocumentController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v15);
      v25 = objc_msgSend(v24, "ic_range");
      objc_msgSend(v23, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v24, v25, v26, 0, 0);
      v27 = objc_msgSend(v24, "copy");

      v15 = (void *)v27;
    }
    objc_msgSend(v15, "string", v56);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqualToString:", v29);

    if (v30
      && ((objc_msgSend(v8, "objectAtIndexedSubscript:", 1),
           v31 = (void *)objc_claimAutoreleasedReturnValue(),
           v32 = -[ICBaseTextView attributedStringContainsICTTAttachment:](self, "attributedStringContainsICTTAttachment:", v31), v31, !objc_msgSend(v58, "count"))? (v33 = 1): (v33 = v32), (v33 & 1) != 0 || objc_msgSend(v58, "isEqualToArray:", v57)))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v35, "count");
      v8 = v35;
    }
    else
    {
      v10 = 2;
    }

  }
  -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "saveWorkerContext");

  v68 = MEMORY[0x1E0C809B0];
  v69 = 3221225472;
  v70 = __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_2;
  v71 = &unk_1EA7DDC40;
  v72 = self;
  v61 = v60;
  v73 = v61;
  v37 = v9;
  v74 = v37;
  v75 = v78;
  performBlockOnMainThreadAndWait();
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "appendAttributedString:", v39);
      if (i < v10 - 1)
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
        objc_msgSend(v37, "appendAttributedString:", v40);

      }
    }
  }
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__1;
  v66 = __Block_byref_object_dispose__1;
  v67 = 0;
  v41 = v37;
  performBlockOnMainThreadAndWait();
  if (-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem"))
  {
    v42 = -[ICBaseTextView ic_characterRangeFromTextRange:](self, "ic_characterRangeFromTextRange:", v61);
    v44 = v43;
    -[ICBaseTextView textStorage](self, "textStorage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "string");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "lineRangeForRange:", v42, v44);
    v49 = v48;

    -[ICBaseTextView textStorage](self, "textStorage");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "attributedSubstringFromRange:", v47, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView updateIndentForChecklistDragIfNecessaryForString:lineUnderDrop:](self, "updateIndentForChecklistDragIfNecessaryForString:lineUnderDrop:", v63[5], v51);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v63[5];
    v63[5] = v52;

  }
  v54 = (id)v63[5];

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(v78, 8);

  return v54;
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "itemProviderPasteSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForDragAndDrop");

  if (v3)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "layoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setShouldManuallyRenderSeparateSubviews:", 0);
  }
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "ic_characterRangeFromTextRange:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedSubstringFromRange:", v3 - 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendAttributedString:", v6);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_opt_class();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_4;
  v10[3] = &unk_1EA7DDC68;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v5;
  v13 = *(_OWORD *)(a1 + 48);
  v9 = v5;
  objc_msgSend(v7, "performBlockAndWait:", v10);

}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;

  v2 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "itemProviderPasteSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryTextStorageWithAttributedString:note:filterAttributedString:", v4, v3, objc_msgSend(v5, "shouldFilterAttributedString"));
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "attributedString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v9, "ic_containsNonWhitespaceAndAttachmentCharacters");

  if ((v3 & 1) == 0)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_attributedStringByFlatteningCalculateAttachmentsWithContext:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "attributedSubstringFromRange:", 1, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length") - 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  if ((!objc_msgSend(*(id *)(a1 + 32), "isDraggingChecklistItem")
     || (objc_msgSend(*(id *)(a1 + 32), "isDraggingOverChecklistItem") & 1) == 0)
    && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemProviderPasteSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isForDragAndDrop");

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length") - 1;
      v22 = -1;
      v23 = v21;
      while (v23)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "string");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "characterAtIndex:", v23);

        ++v22;
        --v23;
        if ((objc_msgSend(v20, "characterIsMember:", v25) & 1) == 0)
          goto LABEL_14;
      }
      v22 = v21;
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "itemProviderPasteSession");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setNumberOfTrailingNewlinesStripped:", v22);

      if (v22)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "attributedSubstringFromRange:", 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length") - v22);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v29 = *(void **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = v27;

      }
    }
  }

}

- (id)updateIndentForChecklistDragIfNecessaryForString:(id)a3 lineUnderDrop:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem"))
  {
    -[ICBaseTextView trackedParagraphCurrentlyUnderDraggedChecklist](self, "trackedParagraphCurrentlyUnderDraggedChecklist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICBaseTextView trackedParagraphCurrentlyUnderDraggedChecklist](self, "trackedParagraphCurrentlyUnderDraggedChecklist");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "paragraph");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indent");

    }
    else
    {
      v9 = v8;
      if (!objc_msgSend(v7, "length"))
        goto LABEL_9;
      objc_msgSend(v7, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_trimmedString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      v9 = v8;
      if (v19)
        goto LABEL_9;
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v21;
      if (v21)
        v13 = objc_msgSend(v21, "indent");
      else
        v13 = -1;
      objc_msgSend(v7, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[ICChecklistDragUtilities tabIndentationEqualivantForString:](ICChecklistDragUtilities, "tabIndentationEqualivantForString:", v22);

      if (v23)
      {
        -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setShouldRemoveLeadingWhitespaceForChecklistDrop:", 1);

        v13 += v23;
      }
    }

    v9 = v8;
    if ((v13 & 0x8000000000000000) == 0)
    {
      v9 = v8;
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)objc_msgSend(v8, "mutableCopy");
        v14 = (_QWORD *)MEMORY[0x1E0D63928];
        objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v16, "setIndent:", v13);
        objc_msgSend(v9, "addAttribute:value:range:", *v14, v16, 0, objc_msgSend(v9, "length"));

      }
    }
  }
LABEL_9:

  return v9;
}

- (id)textPasteConfigurationSupporting:(id)a3 performPasteOfAttributedString:(id)a4 toRange:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  NSRange v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  dispatch_time_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  double v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  ICBaseTextView *v89;
  void *v90;
  void *v91;
  id v92;
  NSUInteger range2;
  id v95;
  void *v96;
  uint64_t location;
  void *v98;
  id v99;
  id v100;
  ICBaseTextView *v101;
  _QWORD v102[6];
  _QWORD v103[7];
  _QWORD v104[5];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD block[4];
  id v110;
  id v111;
  ICBaseTextView *v112;
  NSRange v113;
  _QWORD v114[5];
  _QWORD v115[4];
  id v116;
  ICBaseTextView *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[4];
  id v122;
  _BYTE v123[128];
  uint64_t v124;
  NSRange v125;
  NSRange v126;

  v124 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v8 = a4;
  v9 = a5;
  v101 = self;
  -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isForDragAndDrop");

  if (v11)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShouldManuallyRenderSeparateSubviews:", 0);

      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIsRenderingPreviewForDragAndDrop:", 0);

    }
    -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numberOfTrailingNewlinesStripped");

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(v16, "appendString:", CFSTR("\n"));
        --v15;
      }
      while (v15);
      v17 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v17, "ic_appendString:", v16);
      v18 = objc_msgSend(v17, "copy");

      v8 = (id)v18;
    }
    -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNumberOfTrailingNewlinesStripped:", 0);

  }
  v20 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:].cold.4(self, v20);

  v120 = 0;
  v121[0] = &v120;
  v121[1] = 0x3032000000;
  v121[2] = __Block_byref_object_copy__1;
  v121[3] = __Block_byref_object_dispose__1;
  v99 = v8;
  v100 = v9;
  v122 = v100;
  if (-[ICBaseTextView exceedsMaxLengthIfSelectionReplacedWithAttributedString:](self, "exceedsMaxLengthIfSelectionReplacedWithAttributedString:", v99))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "warnUserNoteLengthExceeded");
    v98 = v99;
  }
  else
  {
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView setSelectedTextRange:](self, "setSelectedTextRange:", v100);
    v22 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:].cold.3();

    -[ICBaseTextView beginDrop](self, "beginDrop");
    -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "shouldFilterAttributedString");

    location = -[ICBaseTextView ic_characterRangeFromTextRange:](self, "ic_characterRangeFromTextRange:", v100);
    v26 = v25;
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (v24)
    {
      v29 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:].cold.2(v29);

      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFilterPastedAttributes:", 1);

      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setConvertAttributes:", 1);

      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPasteboardTypes:", 0);

    }
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke;
    v115[3] = &unk_1EA7DDCB8;
    v34 = v99;
    v118 = location;
    v119 = v26;
    v116 = v34;
    v117 = self;
    objc_msgSend(v33, "saveSelectionDuringBlock:affinity:", v115, 1);

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "managedObjectContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2;
    v114[3] = &unk_1EA7DDBA0;
    v114[4] = self;
    objc_msgSend(v34, "ic_enumerateAttachmentsInContext:usingBlock:", v36, v114);

    -[ICBaseTextView editorController](self, "editorController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "note");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "calculateDocumentController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scheduleUpdateAffectingChangeCounts:", 1);

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "length");

    if (v24)
    {
      objc_msgSend(v96, "setPasteboardTypes:", 0);
      objc_msgSend(v96, "setConvertAttributes:", 0);
      objc_msgSend(v96, "setFilterPastedAttributes:", 0);
      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "length");

      objc_msgSend(v96, "attributedSubstringFromRange:", location, v26 - v28 + v43);
      v44 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v96, "styler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "insertedText:replacementRange:inTextView:languageHasSpaces:", v44, location, v26, self, -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces"));
      v47 = (id)v44;
    }
    else
    {
      v47 = v34;
    }
    v98 = v47;
    -[ICBaseTextView finishDropWithString:](self, "finishDropWithString:");
    v48 = v41 - v28 + v26;
    if (v41 >= v48 + location)
      v49 = v48 + location;
    else
      v49 = v41;
    -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v49, 0, v48, v95);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = *(void **)(v121[0] + 40);
    *(_QWORD *)(v121[0] + 40) = v50;

    v52 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:].cold.1((uint64_t)v121, v52, v53);

    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICBaseTextView itemProviderPasteSession](self, "itemProviderPasteSession");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "isForDragAndDrop");

      if (v55)
      {
        objc_opt_class();
        objc_msgSend(v96, "attributedString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = (void *)objc_msgSend(v57, "mutableCopy");
        v125.location = objc_msgSend(v96, "ic_range");
        v126.length = range2;
        v126.location = location;
        v59 = NSIntersectionRange(v125, v126);
        v60 = *MEMORY[0x1E0DC1140];
        range2 = v59.length;
        objc_msgSend(v57, "removeAttribute:range:", *MEMORY[0x1E0DC1140], v59.location, v59.length);
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addAttribute:value:range:", v60, v61, v59.location, v59.length);
        location = v59.location;

        objc_msgSend(v57, "removeAttribute:range:", *MEMORY[0x1E0DC1160], v59.location, v59.length);
        objc_msgSend(v57, "removeAttribute:range:", *MEMORY[0x1E0DC1248], v59.location, v59.length);
        objc_msgSend(v57, "removeAttribute:range:", *MEMORY[0x1E0DC11D8], v59.location, v59.length);
        -[ICBaseTextView editorController](self, "editorController");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "note");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "documentMergeController");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "beginBlockingMergeForReason:textView:", 2, self);

        v65 = dispatch_time(0, 700000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_218;
        block[3] = &unk_1EA7DDCE0;
        v110 = v96;
        v111 = v58;
        v112 = self;
        v113 = v59;
        v66 = v58;
        dispatch_after(v65, MEMORY[0x1E0C80D38], block);

      }
      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "updateVisibleSupplementalViews");

      -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "todoButtonsForCharacterRange:", location, range2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v70 = v69;
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
      if (v71)
      {
        v72 = *(_QWORD *)v106;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v106 != v72)
              objc_enumerationMutation(v70);
            v74 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
            objc_msgSend(v74, "setAlpha:", 0.0);
            v75 = (void *)MEMORY[0x1E0DC3F10];
            -[ICBaseTextView itemProviderPasteSession](v101, "itemProviderPasteSession");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "isForDragAndDrop");
            v104[0] = MEMORY[0x1E0C809B0];
            if (v77)
              v78 = 0.5;
            else
              v78 = 0.0;
            v104[1] = 3221225472;
            v104[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2_219;
            v104[3] = &unk_1EA7DD2D8;
            v104[4] = v74;
            objc_msgSend(v75, "animateWithDuration:delay:options:animations:completion:", 0, v104, 0, 0.3, v78);

          }
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
        }
        while (v71);
      }

      if (-[ICBaseTextView supportsAttachments](v101, "supportsAttachments"))
      {
        -[ICBaseTextView editorController](v101, "editorController");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "visibleRange");
        v82 = v81;

        -[ICBaseTextView textStorage](v101, "textStorage");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = *MEMORY[0x1E0DC10F8];
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_3;
        v103[3] = &unk_1EA7DDB28;
        v103[5] = v80;
        v103[6] = v82;
        v103[4] = v101;
        objc_msgSend(v83, "enumerateAttribute:inRange:options:usingBlock:", v84, location, range2, 0, v103);

      }
    }

    v21 = v96;
  }

  -[ICBaseTextView itemProviderPasteSession](v101, "itemProviderPasteSession");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "isForDragAndDrop");

  if ((v86 & 1) == 0)
  {
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_6;
    v102[3] = &unk_1EA7DD7D0;
    v102[4] = v101;
    v102[5] = &v120;
    dispatch_async(MEMORY[0x1E0C80D38], v102);
  }
  -[ICBaseTextView itemProviderPasteSession](v101, "itemProviderPasteSession");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "errorCodes");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = v101;
  if (objc_msgSend(v88, "containsObject:", &unk_1EA821BB0))
  {
    -[ICBaseTextView editorController](v101, "editorController");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "warnUserAttachmentLimitExceeded");
LABEL_50:

    v89 = v101;
    goto LABEL_51;
  }
  if (objc_msgSend(v88, "containsObject:", &unk_1EA821BC8))
  {
    -[ICBaseTextView editorController](v101, "editorController");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView itemProviderPasteSession](v101, "itemProviderPasteSession");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "warnUserAttachmentSizeExceededWithAttachmentCount:", objc_msgSend(v91, "numberOfAttachmentsAttemptedAdded"));

    goto LABEL_50;
  }
LABEL_51:
  -[ICBaseTextView setItemProviderPasteSession:](v89, "setItemProviderPasteSession:", 0);
  -[ICBaseTextView didPasteOrDropText:toRange:](v89, "didPasteOrDropText:toRange:", v98, v100);
  v92 = *(id *)(v121[0] + 40);

  _Block_object_dispose(&v120, 8);
  return v92;
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v2 = (void *)MEMORY[0x1E0D64DB0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "TTTextStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedStringToPasteWithAdaptedParagraphStyles:pasteRange:textStorage:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], objc_msgSend(*(id *)(a1 + 40), "selectedRange"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56)
    && !v8
    && (objc_msgSend(*(id *)(a1 + 40), "itemProviderPasteSession"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isTypeURL"),
        v9,
        v10))
  {
    objc_msgSend(*(id *)(a1 + 40), "TTTextStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_attributedSubstringFromRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v12);
    v14 = *MEMORY[0x1E0DC1160];
    objc_msgSend(v6, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v13, "length"));

    objc_msgSend(*(id *)(a1 + 40), "TTTextStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "TTTextStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v17);
  }

}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "attachmentType") == 12)
  {
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventReporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "submitTableCreateEventForAttachment:inNote:", v7, v6);

  }
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_218(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "restoreAttributedString:", *(_QWORD *)(a1 + 40));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "textStorage", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutManagers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "invalidateDisplayForCharacterRange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 48), "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentMergeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endBlockingMergeForReason:textView:", 2, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 48), "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveNote");

}

uint64_t __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2_219(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_3(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[4];
  id v17;
  NSRange v18;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18.location = a3;
    v18.length = a4;
    if (NSIntersectionRange(v18, *(NSRange *)(a1 + 40)).length)
    {
      objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewForTextAttachment:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = 0.0;
        objc_msgSend(v10, "setAlpha:", 0.0);
        v12 = (void *)MEMORY[0x1E0DC3F10];
        objc_msgSend(*(id *)(a1 + 32), "itemProviderPasteSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isForDragAndDrop"))
          v11 = 0.5;
        v14 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_4;
        v16[3] = &unk_1EA7DD2D8;
        v17 = v10;
        v15[0] = v14;
        v15[1] = 3221225472;
        v15[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_5;
        v15[3] = &unk_1EA7DDD08;
        v15[4] = *(_QWORD *)(a1 + 32);
        v15[5] = a3;
        v15[6] = a4;
        objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0, v16, v15, 0.1, v11);

      }
    }
  }

}

uint64_t __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayoutForCharacterRange:actualCharacterRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

  objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureLayoutForCharacterRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_6(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if ((v3 & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1DD7B0000, v4, OS_LOG_TYPE_DEFAULT, "Corrected text selection range after paste: %@ => %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

- (void)didPasteOrDropText:(id)a3 toRange:(id)a4
{
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], objc_msgSend(v17, "length") - 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 1;
  }
  -[ICBaseTextView typingAttributes](self, "typingAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "CGColor");
  v11 = ICCGColorEquivalentToColor();

  if (!v6 && v11)
  {
    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v8);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D63920]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D63D50]);
    v14 = (void *)objc_msgSend(v13, "copy");
    -[ICBaseTextView setTypingAttributes:](self, "setTypingAttributes:", v14);

  }
  -[ICBaseTextView editorController](self, "editorController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "note");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateModificationDateAndChangeCountAndSaveAfterDelay");

}

- (void)icaxBeginEditingAtAttachment:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[ICBaseTextView _icaxRangeOfAttachment:](self, "_icaxRangeOfAttachment:", a3);
  -[ICBaseTextView icaxBeginEditingInStorageRange:](self, "icaxBeginEditingInStorageRange:", v4 + v5, 0);
}

- (void)icaxBeginEditingInStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  length = a3.length;
  location = a3.location;
  -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v6, location, length);
  v9 = v8;

  -[ICBaseTextView _accessibilitySetSelectedTextRange:](self, "_accessibilitySetSelectedTextRange:", v7, v9);
  -[ICBaseTextView editorController](self, "editorController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startEditing");

}

- (void)icaxTextDidChange
{
  -[ICBaseTextView set_icaxCachedModifiedAttributedString:](self, "set_icaxCachedModifiedAttributedString:", 0);
  if (-[ICBaseTextView isFirstResponder](self, "isFirstResponder"))
  {
    if (UIAccessibilityIsVoiceOverRunning())
      -[ICBaseTextView _icaxUpdateFakeTextSelectionRange](self, "_icaxUpdateFakeTextSelectionRange");
  }
}

- (void)icaxClearCaches
{
  -[ICBaseTextView set_icaxCachedModifiedAttributedString:](self, "set_icaxCachedModifiedAttributedString:", 0);
  -[ICBaseTextView icaxClearCachedChildrenForReparenting](self, "icaxClearCachedChildrenForReparenting");
  -[ICBaseTextView _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXLinks"));
  -[ICBaseTextView _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("LinkRotor"));
}

- (void)icaxUpdateLinkRanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  ICBaseTextView *v16;
  id v17;

  -[ICBaseTextView _icaxCachedModifiedAttributedString](self, "_icaxCachedModifiedAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[ICBaseTextView _icaxCachedModifiedAttributedString](self, "_icaxCachedModifiedAttributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[ICBaseTextView baseAttributedStringForAccessibility](self, "baseAttributedStringForAccessibility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC1160];
    v9 = objc_msgSend(v7, "length");
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __59__ICBaseTextView_ICAccessibility_iOS__icaxUpdateLinkRanges__block_invoke;
    v15 = &unk_1EA7DDF00;
    v16 = self;
    v17 = v6;
    v10 = v6;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 0, &v12);
    v11 = (void *)objc_msgSend(v10, "copy", v12, v13, v14, v15, v16);
    -[ICBaseTextView set_icaxCachedModifiedAttributedString:](self, "set_icaxCachedModifiedAttributedString:", v11);

  }
  -[ICBaseTextView _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXLinks"));
}

void __59__ICBaseTextView_ICAccessibility_iOS__icaxUpdateLinkRanges__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "_icaxCachedModifiedAttributedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_icaxRangeInModifiedAttributedString:forRange:", v10, a3, a4);
    v13 = v12;

    v14 = *(void **)(a1 + 40);
    v16 = *MEMORY[0x1E0CF4200];
    v17[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttributes:range:", v15, v11, v13);

  }
}

- (void)icaxClearCachedChildrenForReparenting
{
  void *v3;

  -[ICBaseTextView _icaxPencilKitAttachmentsDict](self, "_icaxPencilKitAttachmentsDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[ICBaseTextView set_icaxCachedChildrenForReparenting:](self, "set_icaxCachedChildrenForReparenting:", 0);
}

- (void)icaxSpeakIndentationLevelForCurrentSelectedRange
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[ICBaseTextView selectedRange](self, "selectedRange");
  -[ICBaseTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v3 <= v5)
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v3)
    {
      if (v3 >= v7)
      {
        -[ICBaseTextView textStorage](self, "textStorage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v8, "length") - 1;

      }
    }
    -[ICBaseTextView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v3, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Indentation level %lu"), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v11, objc_msgSend(v13, "indent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICAccessibilityPostAnnouncementNotification();

  }
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAttachmentBrowserVisible") ^ 1;

  return v4;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("note"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  __int128 v6;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v6 = xmmword_1DD9E7050;
    v3 = objc_alloc(MEMORY[0x1E0CF40C0]);
    v4 = -[ICBaseTextView _icaxAttributedStringForRange:](self, "_icaxAttributedStringForRange:", &v6);
    return (id)objc_msgSend(v3, "initWithCFAttributedString:", v4, v6);
  }
  else
  {
    -[ICBaseTextView text](self, "text");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Double tap to begin editing a new note"), &stru_1EA7E9860, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICBaseTextView;
  v3 = *MEMORY[0x1E0DC10B0] | -[ICBaseTextView accessibilityTraits](&v9, sel_accessibilityTraits);
  -[ICBaseTextView editorController](self, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditable");

  if (v6)
    v7 = ~*MEMORY[0x1E0DC46C0];
  else
    v7 = -1;
  return v7 & v3 & ~*MEMORY[0x1E0DC4688];
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  char v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MinX;
  double v22;
  void *v23;
  objc_super v24;
  CGPoint result;
  CGRect v26;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInkPickerShowing");

  v5 = -1.0;
  v6 = -1.0;
  if ((v4 & 1) == 0)
  {
    v7 = -[ICBaseTextView accessibilityTraits](self, "accessibilityTraits", -1.0, -1.0);
    if ((*MEMORY[0x1E0DC10A0] & v7) != 0)
    {
      v24.receiver = self;
      v24.super_class = (Class)ICBaseTextView;
      -[ICBaseTextView accessibilityActivationPoint](&v24, sel_accessibilityActivationPoint);
    }
    else
    {
      -[ICBaseTextView visibleTextRect](self, "visibleTextRect");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = objc_msgSend(MEMORY[0x1E0DC1290], "ic_isRTL");
      v17 = v9;
      v18 = v11;
      v19 = v13;
      v20 = v15;
      if (v16)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v17);
        v22 = 5.0;
      }
      else
      {
        MinX = CGRectGetMaxX(*(CGRect *)&v17);
        v22 = -5.0;
      }
      v26.origin.x = v9 + MinX + v22;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      CGRectGetMaxY(v26);
      -[ICBaseTextView editorController](self, "editorController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ic_safeAreaDistanceFromBottom");

      UIAccessibilityFrameForBounds();
    }
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeletedOrInTrash");

  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    LOBYTE(v8) = 0;
  else
    v8 = -[ICBaseTextView isEditable](self, "isEditable") ^ 1;

  v9 = v5 | v8;
  if ((v9 & 1) == 0)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startEditing");

  }
  return v9 ^ 1;
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v4;

  if (-[ICBaseTextView isFirstResponder](self, "isFirstResponder"))
  {
    -[ICBaseTextView resignFirstResponder](self, "resignFirstResponder");
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ICBaseTextView;
    return -[ICBaseTextView accessibilityPerformEscape](&v4, sel_accessibilityPerformEscape);
  }
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)childElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  ICBaseTextView *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView _accessibleSubviews](self, "_accessibleSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[ICBaseTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC10F8];
  v7 = objc_msgSend(v5, "length");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__ICBaseTextView_ICAccessibility_iOS__childElements__block_invoke;
  v14 = &unk_1EA7DDF28;
  v15 = self;
  v16 = v3;
  v8 = v3;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);

  return v9;
}

void __52__ICBaseTextView_ICAccessibility_iOS__childElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  char IsTextKit2Enabled;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (v3)
  {
    v14 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v14;
    if ((isKindOfClass & 1) != 0)
    {
      IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      v6 = *(void **)(a1 + 32);
      if ((IsTextKit2Enabled & 1) != 0)
      {
        objc_msgSend(v6, "icTextLayoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "viewIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "layoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "viewForLayoutManager:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (objc_msgSend(v9, "isAccessibilityElement"))
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      }
      else
      {
        objc_msgSend(v9, "accessibilityElements");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v9, "accessibilityElements");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObjectsFromArray:", v13);

        }
      }

      v3 = v14;
    }
  }

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;
  CGPoint v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;

  y = a3.y;
  x = a3.x;
  v42 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[ICBaseTextView _icaxLinkElements](self, "_icaxLinkElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
  v10 = v9;
  v12 = v11;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v8;
  v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "accessibilityFrame");
        v43.x = v10;
        v43.y = v12;
        if (CGRectContainsPoint(v45, v43))
        {
          v14 = v17;
          goto LABEL_11;
        }
      }
      v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  -[ICBaseTextView childElements](self, "childElements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
  v20 = v19;
  v22 = v21;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = v18;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v28, "accessibilityFrame");
          v44.x = v20;
          v44.y = v22;
          if (CGRectContainsPoint(v46, v44))
          {
            v29 = v28;

            v14 = v29;
            goto LABEL_22;
          }
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v25)
        continue;
      break;
    }
  }
LABEL_22:

  if (!v14)
  {
    v31.receiver = self;
    v31.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityHitTest:withEvent:](&v31, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v11;

  if (a3 == 3)
  {
    -[ICBaseTextView contentOffset](self, "contentOffset");
    v5 = v4;
    -[ICBaseTextView editorController](self, "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_safeAreaDistanceFromTop");
    v8 = -v7;

    if (v5 <= v8)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "showOverscrollContentAndScrollToTop");

    }
    return 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICBaseTextView;
    return -[ICBaseTextView accessibilityScroll:](&v11, sel_accessibilityScroll_);
  }
}

- (id)_accessibilityValueForRange:(_NSRange *)a3
{
  void *v5;
  objc_super v7;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[ICBaseTextView _icaxAttributedStringForRange:](self, "_icaxAttributedStringForRange:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityAttributedValueForRange:](&v7, sel__accessibilityAttributedValueForRange_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  void *v5;
  objc_super v7;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[ICBaseTextView _icaxAttributedStringForRange:](self, "_icaxAttributedStringForRange:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityAttributedValueForRange:](&v7, sel__accessibilityAttributedValueForRange_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)_accessibilityLineEndPosition
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return -[ICBaseTextView _icaxLinePositionForPosition:start:](self, "_icaxLinePositionForPosition:start:", -[ICBaseTextView _icaxModifiedCursorPosition](self, "_icaxModifiedCursorPosition"), 0);
  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  return -[ICBaseTextView _accessibilityLineEndPosition](&v4, sel__accessibilityLineEndPosition);
}

- (int64_t)_accessibilityLineStartPosition
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return -[ICBaseTextView _icaxLinePositionForPosition:start:](self, "_icaxLinePositionForPosition:start:", -[ICBaseTextView _icaxModifiedCursorPosition](self, "_icaxModifiedCursorPosition"), 1);
  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  return -[ICBaseTextView _accessibilityLineStartPosition](&v4, sel__accessibilityLineStartPosition);
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView _accessibilityLineNumberAndColumnForPoint:](&v12, sel__accessibilityLineNumberAndColumnForPoint_, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lineNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v7, v6, 0);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("lineNumber"));

  return v9;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lineNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = -[ICBaseTextView _accessibilityLineRangeForPosition:](self, "_accessibilityLineRangeForPosition:", v5);
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  objc_super v14;
  _NSRange result;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v5 = -[ICBaseTextView _icaxLinePositionForPosition:start:](self, "_icaxLinePositionForPosition:start:", a3, 1);
    v6 = -[ICBaseTextView _icaxLinePositionForPosition:start:](self, "_icaxLinePositionForPosition:start:", a3, 0);
    -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    if ((id)v6 != v5 || v5 == (id)v8)
      v10 = v6 - (_QWORD)v5;
    else
      v10 = 1;

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICBaseTextView;
    v5 = -[ICBaseTextView _accessibilityLineRangeForPosition:](&v14, sel__accessibilityLineRangeForPosition_, a3);
    v10 = v11;
  }
  v12 = (NSUInteger)v5;
  v13 = v10;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v3;
  NSUInteger v4;
  objc_super v5;
  _NSRange result;

  if (UIAccessibilityIsVoiceOverRunning()
    && !-[ICBaseTextView isAccessibilityTableTextView](self, "isAccessibilityTableTextView"))
  {
    v3 = (id)-[ICBaseTextView _icaxModifiedSelectionRange](self, "_icaxModifiedSelectionRange");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    v3 = -[ICBaseTextView _accessibilitySelectedTextRange](&v5, sel__accessibilitySelectedTextRange);
  }
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  length = a3.length;
  location = a3.location;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[ICBaseTextView set_icaxShouldPreventUpdatingFakeCursorRange:](self, "set_icaxShouldPreventUpdatingFakeCursorRange:", 1);
    -[ICBaseTextView set_icaxModifiedCursorPosition:](self, "set_icaxModifiedCursorPosition:", location + length);
    -[ICBaseTextView set_icaxModifiedSelectionRange:](self, "set_icaxModifiedSelectionRange:", location, length);
    v6 = -[ICBaseTextView selectedRange](self, "selectedRange");
    v8 = v7;
    -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", location, length, v9);
    -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v10, v11);

    if (-[ICBaseTextView selectedRange](self, "selectedRange") == v6 && v12 == v8)
      UIAccessibilityPostNotification(0x3F9u, 0);
    -[ICBaseTextView set_icaxShouldPreventUpdatingFakeCursorRange:](self, "set_icaxShouldPreventUpdatingFakeCursorRange:", 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilitySetSelectedTextRange:](&v13, sel__accessibilitySetSelectedTextRange_, location, length);
  }
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  NSUInteger v39;
  NSUInteger v40;
  objc_super v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v42 = 0;
  v43 = (double *)&v42;
  v44 = 0x4010000000;
  v45 = &unk_1DDA28851;
  v46 = 0u;
  v47 = 0u;
  if (-[ICBaseTextView isAccessibilityTableTextView](self, "isAccessibilityTableTextView"))
  {
    v35.receiver = self;
    v35.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityBoundsForRange:](&v35, sel__accessibilityBoundsForRange_, location, length);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = v43;
    v43[4] = v6;
    v14[5] = v8;
    v14[6] = v10;
    v14[7] = v12;
  }
  else
  {
    -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (location != 0x7FFFFFFFFFFFFFFFLL && !length)
      length = location != objc_msgSend(v15, "length");
    if (length + location > objc_msgSend(v16, "length"))
      length = objc_msgSend(v16, "length") - location;
    -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)-[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", location, length, v17);
    v20 = v19;

    v41.receiver = self;
    v41.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityBoundsForRange:](&v41, sel__accessibilityBoundsForRange_, v18, v20);
    v21 = 0;
    v22 = v43;
    *((_QWORD *)v43 + 4) = v23;
    *((_QWORD *)v22 + 5) = v24;
    *((_QWORD *)v22 + 6) = v25;
    *((_QWORD *)v22 + 7) = v26;
    if (location != 0x7FFFFFFF && location != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v16, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "ic_rangeIsValid:", location, length);
    }
    if (location != 0x7FFFFFFF && location != 0x7FFFFFFFFFFFFFFFLL)

    if (v21)
    {
      objc_msgSend(v16, "ic_attributedSubstringFromRange:", location, length);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0CF4138];
      v29 = objc_msgSend(v27, "length");
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __68__ICBaseTextView_ICAccessibility_iOS___accessibilityBoundsForRange___block_invoke;
      v36[3] = &unk_1EA7DDF50;
      v30 = v27;
      v39 = location;
      v40 = length;
      v37 = v30;
      v38 = &v42;
      objc_msgSend(v30, "enumerateAttribute:inRange:options:usingBlock:", v28, 0, v29, 0, v36);

    }
    v7 = v43[4];
    v9 = v43[5];
    v11 = v43[6];
    v13 = v43[7];
  }
  _Block_object_dispose(&v42, 8);
  v31 = v7;
  v32 = v9;
  v33 = v11;
  v34 = v13;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

void __68__ICBaseTextView_ICAccessibility_iOS___accessibilityBoundsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CGRect *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  v5 = a2;
  if (v5)
  {
    v14 = 0;
    v15 = 0;
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("ICAXAdditionalTextAttribute"), a3, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (*(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 48) <= (unint64_t)(v14 + *(_QWORD *)(a1 + 48) + v15))
      {
        objc_msgSend(v5, "accessibilityFrame");
        v7 = a1 + 40;
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 40);
        v7 = a1 + 40;
        v9 = *(CGRect **)(v8 + 8);
        objc_msgSend(v5, "accessibilityFrame");
        v17.origin.x = v10;
        v17.origin.y = v11;
        v17.size.width = v12;
        v17.size.height = v13;
        v16 = CGRectUnion(v9[1], v17);
      }
      *(CGRect *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 32) = v16;
    }
  }

}

- (BOOL)_accessibilityHasTextOperations
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeletedOrInTrash");

  if ((v5 & 1) != 0 || -[ICBaseTextView selectedRange](self, "selectedRange") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  return -[ICBaseTextView _accessibilityHasTextOperations](&v7, sel__accessibilityHasTextOperations);
}

- (id)_accessibilityTextOperations
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v56;
  __int16 v57;
  __int16 v58;
  objc_super v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICBaseTextView selectedRange](self, "selectedRange") == 0x7FFFFFFFFFFFFFFFLL)
    return v3;
  v59.receiver = self;
  v59.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView _accessibilityTextOperations](&v59, sel__accessibilityTextOperations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = -[ICBaseTextView selectedRange](self, "selectedRange");
  -[ICBaseTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "length"))
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    v7 = v10 - 1;
  }
  else
  {
    v7 = -[ICBaseTextView selectedRange](self, "selectedRange");
  }

  -[ICBaseTextView textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v7 < v12)
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v7, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView editorController](self, "editorController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "icaxTextController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICBaseTextView isAccessibilityTableTextView](self, "isAccessibilityTableTextView"))
    {
LABEL_29:
      v58 = 0;
      v57 = 0;
      -[ICBaseTextView _icaxGetBoldForCurrentRange:italic:underline:strikethrough:](self, "_icaxGetBoldForCurrentRange:italic:underline:strikethrough:", (char *)&v58 + 1, &v58, (char *)&v57 + 1, &v57);
      if (HIBYTE(v58))
        -[ICBaseTextView _icaxMakeNotBoldString](self, "_icaxMakeNotBoldString");
      else
        -[ICBaseTextView _icaxMakeBoldString](self, "_icaxMakeBoldString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v58)
        -[ICBaseTextView _icaxMakeNotItalicString](self, "_icaxMakeNotItalicString");
      else
        -[ICBaseTextView _icaxMakeItalicString](self, "_icaxMakeItalicString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (HIBYTE(v57))
        -[ICBaseTextView _icaxMakeNotUnderlinedString](self, "_icaxMakeNotUnderlinedString");
      else
        -[ICBaseTextView _icaxMakeUnderlinedString](self, "_icaxMakeUnderlinedString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v57)
        -[ICBaseTextView icaxMakeNotStrikethroughString](self, "icaxMakeNotStrikethroughString");
      else
        -[ICBaseTextView icaxMakeStrikethroughString](self, "icaxMakeStrikethroughString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v41);
      objc_msgSend(v3, "addObject:", v42);
      objc_msgSend(v3, "addObject:", v43);
      objc_msgSend(v3, "addObject:", v44);
      if (!-[ICBaseTextView isAccessibilityTableTextView](self, "isAccessibilityTableTextView"))
      {
        -[ICBaseTextView editorController](self, "editorController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "canPerformAction:withSender:", sel_increaseIndentation_, 0);

        if (v46)
        {
          -[ICBaseTextView _icaxIncreaseIndentationString](self, "_icaxIncreaseIndentationString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v47);

        }
        -[ICBaseTextView editorController](self, "editorController");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "canPerformAction:withSender:", sel_decreaseIndentation_, 0);

        if (v49)
        {
          -[ICBaseTextView _icaxDecreaseIndentationString](self, "_icaxDecreaseIndentationString");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v50);

        }
      }
      if (-[ICBaseTextView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel__insertDrawing_, 0))
      {
        -[ICBaseTextView _icaxInsertDrawingString](self, "_icaxInsertDrawingString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v51);

      }
      goto LABEL_49;
    }
    if (objc_msgSend(v14, "style") == 103)
    {
      v17 = -[ICBaseTextView selectedRange](self, "selectedRange");
      v19 = v18;
      -[ICBaseTextView textStorage](self, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "todoForRange:inTextStorage:", v17, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_28:

        goto LABEL_29;
      }
      if (objc_msgSend(v21, "done"))
        -[ICBaseTextView _icaxMarkAsIncompleteString](self, "_icaxMarkAsIncompleteString");
      else
        -[ICBaseTextView _icaxMarkAsCompletedString](self, "_icaxMarkAsCompletedString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v26);

      -[ICBaseTextView _icaxRemoveChecklistString](self, "_icaxRemoveChecklistString");
      v56 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:");
      v27 = (void *)MEMORY[0x1E0CB3B18];
      v28 = -[ICBaseTextView selectedRange](self, "selectedRange");
      objc_msgSend(v27, "valueWithRange:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(v16, "checklistItemExistsMarkedCompleted:inTextView:forRanges:", 1, self, v31);
      v33 = objc_msgSend(v16, "checklistItemExistsMarkedCompleted:inTextView:forRanges:", 0, self, v31);
      v34 = -[ICBaseTextView selectedRange](self, "selectedRange");
      v36 = objc_msgSend(v16, "canMoveCheckedChecklistsToBottomInTextView:forRange:", self, v34, v35);
      if (v33)
      {
        -[ICBaseTextView _icaxChecklistMarkAllItemsCompleteString](self, "_icaxChecklistMarkAllItemsCompleteString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v37);

      }
      if (v32)
      {
        -[ICBaseTextView _icaxChecklistUnmarkAllItemsCompleteString](self, "_icaxChecklistUnmarkAllItemsCompleteString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v38);

      }
      if ((v33 & v36) == 1)
      {
        -[ICBaseTextView _icaxChecklistMoveCheckedToBottomString](self, "_icaxChecklistMoveCheckedToBottomString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v39);

      }
      if (v32)
      {
        -[ICBaseTextView _icaxChecklistDeleteCheckedItemsString](self, "_icaxChecklistDeleteCheckedItemsString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v40);

      }
      v25 = (void *)v56;
    }
    else
    {
      -[ICBaseTextView _icaxAttachmentViewForCurrentSelectedRange](self, "_icaxAttachmentViewForCurrentSelectedRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        goto LABEL_28;
      -[ICBaseTextView editorController](self, "editorController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "navigationItemConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "canAddChecklist");

      if (!v24)
        goto LABEL_28;
      -[ICBaseTextView _icaxMakeChecklistString](self, "_icaxMakeChecklistString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v25);
    }

    goto LABEL_28;
  }
LABEL_49:
  if (!-[ICBaseTextView isAccessibilityTableTextView](self, "isAccessibilityTableTextView"))
  {
    -[ICBaseTextView _icaxAttachmentViewForCurrentSelectedRange](self, "_icaxAttachmentViewForCurrentSelectedRange");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      objc_msgSend(v52, "_accessibilityTextOperations");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "count"))
        objc_msgSend(v3, "addObjectsFromArray:", v54);

    }
  }
  return v3;
}

- (id)_icaxLinkEditActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ICBaseTextView textContainer](self, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[ICBaseTextView ic_isInSecureWindow](self, "ic_isInSecureWindow") & 1) == 0
    && !-[ICBaseTextView selectionContainsNonLinkAttachment](self, "selectionContainsNonLinkAttachment"))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isSharedReadOnly"))
    {
LABEL_10:

      goto LABEL_11;
    }
    v8 = objc_msgSend(v5, "insideSiriSnippet");

    if ((v8 & 1) == 0)
    {
      v9 = -[ICBaseTextView selectionContainsLink](self, "selectionContainsLink");
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
        v12 = CFSTR("Edit Link");
      else
        v12 = CFSTR("Add Link");
      objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1EA7E9860, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc(MEMORY[0x1E0DC33F0]);
      v14 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke;
      v21[3] = &unk_1EA7DDF78;
      v21[4] = self;
      v7 = (void *)objc_msgSend(v13, "initWithName:actionHandler:", v6, v21);
      objc_msgSend(v3, "ic_addNonNilObject:", v7);
      if (-[ICBaseTextView selectionContainsLink](self, "selectionContainsLink"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Remove Link"), &stru_1EA7E9860, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v20[0] = v14;
        v20[1] = 3221225472;
        v20[2] = __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke_2;
        v20[3] = &unk_1EA7DDF78;
        v20[4] = self;
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:actionHandler:", v16, v20);
        objc_msgSend(v3, "ic_addNonNilObject:", v17);

      }
      goto LABEL_10;
    }
  }
LABEL_11:
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

uint64_t __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "openLinkEditor:", *(_QWORD *)(a1 + 32));

  return 1;
}

uint64_t __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "conformsToProtocol:", &unk_1F0425160))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICProtocolCast();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "removeLinksFromCurrentSelection");
LABEL_4:

  }
  return 1;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  char v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  objc_super v60;

  v4 = a3;
  if (-[ICBaseTextView selectedRange](self, "selectedRange") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_16;
  -[ICBaseTextView _icaxMarkAsIncompleteString](self, "_icaxMarkAsIncompleteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[ICBaseTextView _icaxMarkTodoIncompleteForCurrentSelection](self, "_icaxMarkTodoIncompleteForCurrentSelection");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Incomplete: %@");
LABEL_10:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA7E9860, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3940];
    -[ICBaseTextView _icaxCurrentParagraph](self, "_icaxCurrentParagraph");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    ICAccessibilityPostAnnouncementNotification();
LABEL_11:
    v22 = 1;
    goto LABEL_12;
  }
  -[ICBaseTextView _icaxMarkAsCompletedString](self, "_icaxMarkAsCompletedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqualToString:", v10);

  if (v11)
  {
    -[ICBaseTextView _icaxMarkTodoCompleteForCurrentSelection](self, "_icaxMarkTodoCompleteForCurrentSelection");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Completed: %@");
    goto LABEL_10;
  }
  -[ICBaseTextView _icaxRemoveChecklistString](self, "_icaxRemoveChecklistString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isEqualToString:", v12);

  if (v13)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "icaxToggleTodoStyle");

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Body: %@");
    goto LABEL_10;
  }
  -[ICBaseTextView _icaxMakeChecklistString](self, "_icaxMakeChecklistString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "isEqualToString:", v15);

  if (v16)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "icaxToggleTodoStyle");

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Checklist item: %@");
    goto LABEL_10;
  }
  -[ICBaseTextView _icaxChecklistMarkAllItemsCompleteString](self, "_icaxChecklistMarkAllItemsCompleteString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v4, "isEqualToString:", v33);

  if (v34)
  {
    -[ICBaseTextView _icaxChecklistMarkAllComplete](self, "_icaxChecklistMarkAllComplete");
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxChecklistUnmarkAllItemsCompleteString](self, "_icaxChecklistUnmarkAllItemsCompleteString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v4, "isEqualToString:", v35);

  if (v36)
  {
    -[ICBaseTextView _icaxChecklistUnMarkAllComplete](self, "_icaxChecklistUnMarkAllComplete");
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxChecklistDeleteCheckedItemsString](self, "_icaxChecklistDeleteCheckedItemsString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v4, "isEqualToString:", v37);

  if (v38)
  {
    -[ICBaseTextView _icaxChecklistDeleteChecked](self, "_icaxChecklistDeleteChecked");
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxChecklistMoveCheckedToBottomString](self, "_icaxChecklistMoveCheckedToBottomString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v4, "isEqualToString:", v39);

  if (v40)
  {
    -[ICBaseTextView _icaxChecklistSortCheckedToBottom](self, "_icaxChecklistSortCheckedToBottom");
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxMakeBoldString](self, "_icaxMakeBoldString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v41))
  {

LABEL_31:
    -[ICBaseTextView toggleBoldface:](self, "toggleBoldface:", 0);
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxMakeNotBoldString](self, "_icaxMakeNotBoldString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v4, "isEqualToString:", v42);

  if (v43)
    goto LABEL_31;
  -[ICBaseTextView _icaxMakeItalicString](self, "_icaxMakeItalicString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v44))
  {

LABEL_35:
    -[ICBaseTextView toggleItalics:](self, "toggleItalics:", 0);
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxMakeNotItalicString](self, "_icaxMakeNotItalicString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v4, "isEqualToString:", v45);

  if (v46)
    goto LABEL_35;
  -[ICBaseTextView _icaxMakeUnderlinedString](self, "_icaxMakeUnderlinedString");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v47))
  {

LABEL_39:
    -[ICBaseTextView toggleUnderline:](self, "toggleUnderline:", 0);
    goto LABEL_11;
  }
  -[ICBaseTextView _icaxMakeNotUnderlinedString](self, "_icaxMakeNotUnderlinedString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v4, "isEqualToString:", v48);

  if (v49)
    goto LABEL_39;
  -[ICBaseTextView icaxMakeStrikethroughString](self, "icaxMakeStrikethroughString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v50))
  {

LABEL_43:
    -[ICBaseTextView toggleStrikethrough](self, "toggleStrikethrough");
    goto LABEL_11;
  }
  -[ICBaseTextView icaxMakeNotStrikethroughString](self, "icaxMakeNotStrikethroughString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v4, "isEqualToString:", v51);

  if (v52)
    goto LABEL_43;
  -[ICBaseTextView _icaxDecreaseIndentationString](self, "_icaxDecreaseIndentationString");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v4, "isEqualToString:", v53);

  if (v54)
  {
    -[ICBaseTextView targetForAction:withSender:](self, "targetForAction:withSender:", sel_decreaseIndentation_, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "decreaseIndentation:", 0);
LABEL_48:

    goto LABEL_11;
  }
  -[ICBaseTextView _icaxIncreaseIndentationString](self, "_icaxIncreaseIndentationString");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v4, "isEqualToString:", v56);

  if (v57)
  {
    -[ICBaseTextView targetForAction:withSender:](self, "targetForAction:withSender:", sel_increaseIndentation_, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "increaseIndentation:", 0);
    goto LABEL_48;
  }
  -[ICBaseTextView _icaxInsertDrawingString](self, "_icaxInsertDrawingString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v4, "isEqualToString:", v58);

  if (v59)
  {
    -[ICBaseTextView _insertDrawing:](self, "_insertDrawing:", 0);
    goto LABEL_11;
  }
  v22 = 0;
LABEL_12:
  -[ICBaseTextView _icaxAttachmentViewForCurrentSelectedRange](self, "_icaxAttachmentViewForCurrentSelectedRange");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_accessibilityTextOperations");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "containsObject:", v4);

  if (v25)
  {
    v26 = objc_msgSend(v23, "_accessibilityTextOperationAction:", v4);

    if ((v26 & 1) != 0)
    {
LABEL_14:
      v27 = 1;
      goto LABEL_19;
    }
  }
  else
  {

    if ((v22 & 1) != 0)
      goto LABEL_14;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Share Attachment"), &stru_1EA7E9860, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "isEqualToString:", v29);

  if (v30)
  {
    -[ICBaseTextView _icaxAttachmentViewForCurrentSelectedRange](self, "_icaxAttachmentViewForCurrentSelectedRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v31, "_accessibilityTextOperationAction:", v4);

  }
  else
  {
    v60.receiver = self;
    v60.super_class = (Class)ICBaseTextView;
    v27 = -[ICBaseTextView _accessibilityTextOperationAction:](&v60, sel__accessibilityTextOperationAction_, v4);
  }
LABEL_19:

  return v27;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v12.receiver = self;
  v12.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView automationElements](&v12, sel_automationElements);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView icaxRecursiveSubviewsPassingTest:](self, "icaxRecursiveSubviewsPassingTest:", &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);
  -[ICBaseTextView _icaxLinkElements](self, "_icaxLinkElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v7);
  -[ICBaseTextView ic_pkTiledView](self, "ic_pkTiledView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_addNonNilObject:", v8);

  -[ICBaseTextView _icaxAdditionalElementsForAutomation](self, "_icaxAdditionalElementsForAutomation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_addObjectsFromNonNilArray:", v9);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

uint64_t __57__ICBaseTextView_ICAccessibility_iOS__automationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_icaxAdditionalElementsForAutomation
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", NSClassFromString(CFSTR("ICCollaboratorStatusView")));
  objc_msgSend(v3, "ic_addNonNilObject:", NSClassFromString(CFSTR("ICCollaboratorSelectionView")));
  objc_msgSend(v3, "addObject:", objc_opt_class());
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxAdditionalElementsForAutomation__block_invoke;
  v7[3] = &unk_1EA7DDFE0;
  v8 = v3;
  v4 = v3;
  -[UIView icaxRecursiveSubviewsPassingTest:](self, "icaxRecursiveSubviewsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __75__ICBaseTextView_ICAccessibility_iOS___icaxAdditionalElementsForAutomation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_opt_class());
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v7 = objc_msgSend(v4, "paragraphRangeForRange:", v5, v6);
  v9 = v8;

  -[ICBaseTextView textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC10F8];
  v12 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke;
  v36[3] = &unk_1EA7DE008;
  v36[4] = self;
  v36[5] = &v37;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v7, v9, 0, v36);

  v13 = (void *)v38[5];
  -[ICBaseTextView _icaxLinkEditActions](self, "_icaxLinkEditActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  if (ICInternalSettingsIsPaperKitMathEnabled())
  {
    -[ICBaseTextView editorController](self, "editorController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEditable") & 1) == 0)
    {

LABEL_9:
      goto LABEL_10;
    }
    v17 = -[ICBaseTextView selectedRange](self, "selectedRange");

    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "calculateGraphingController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ICBaseTextView selectedRange](self, "selectedRange");
      objc_msgSend(v19, "insertionDecisionForExpressionsInRange:", v20, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "allowsInsertingNewGraph"))
      {
        v22 = (void *)v38[5];
        v23 = objc_alloc(MEMORY[0x1E0DC33F0]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Insert Graph"), &stru_1EA7E9860, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v12;
        v35[1] = 3221225472;
        v35[2] = __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_2;
        v35[3] = &unk_1EA7DE030;
        v35[4] = self;
        v35[5] = v15;
        v26 = (void *)objc_msgSend(v23, "initWithName:actionHandler:", v25, v35);
        objc_msgSend(v22, "addObject:", v26);

      }
      if (objc_msgSend(v15, "allowsAddingToGraph"))
      {
        v27 = (void *)v38[5];
        v28 = objc_alloc(MEMORY[0x1E0DC33F0]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Add to Existing Graph"), &stru_1EA7E9860, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v12;
        v34[1] = 3221225472;
        v34[2] = __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_3;
        v34[3] = &unk_1EA7DE030;
        v34[4] = v15;
        v34[5] = self;
        v31 = (void *)objc_msgSend(v28, "initWithName:actionHandler:", v30, v34);
        objc_msgSend(v27, "addObject:", v31);

      }
      goto LABEL_9;
    }
  }
LABEL_10:
  v32 = (void *)objc_msgSend((id)v38[5], "copy");
  _Block_object_dispose(&v37, 8);

  return v32;
}

void __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "icTextLayoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingAttachmentViewForIdentifier:", v9);
  }
  else
  {
    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForLayoutManager:", v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accessibilityCustomActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v11);
    *a5 = 1;
  }

}

uint64_t __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateGraphingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performDecision:", *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setPrefersExistingGraph:", 1);
  objc_msgSend(*(id *)(a1 + 40), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateGraphingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performDecision:", *(_QWORD *)(a1 + 32));

  return 1;
}

- (id)_icaxAttributedStringForRange:(_NSRange *)a3
{
  NSRange *v3;
  void *v4;
  void *v5;
  NSRange v6;
  void *v7;
  void *v8;
  NSRange v10;

  v3 = a3;
  if (a3)
  {
    -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v10.length = objc_msgSend(v5, "length");
    v10.location = 0;
    v6 = NSIntersectionRange(*v3, v10);
    objc_msgSend(v5, "ic_attributedSubstringFromRange:", v6.location, v6.length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeAttribute:range:", CFSTR("ICAXAdditionalTextAttribute"), 0, objc_msgSend(v8, "length"));
    v3 = (NSRange *)objc_msgSend(v8, "copy");

  }
  return v3;
}

- (id)_icaxModifiedAttributedStorageString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  ICBaseTextView *v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[4];

  -[ICBaseTextView _icaxCachedModifiedAttributedString](self, "_icaxCachedModifiedAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ICBaseTextView baseAttributedStringForAccessibility](self, "baseAttributedStringForAccessibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      -[ICBaseTextView editorController](self, "editorController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "note");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calculateDocumentController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "ic_range");
      objc_msgSend(v9, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v6, v10, v11, 0, 1);

      -[ICBaseTextView _accessibilityConvertStyleAttributesToAccessibility:](self, "_accessibilityConvertStyleAttributesToAccessibility:", v6);
      -[ICBaseTextView _accessibilityAddMispellingsToAttributedString:](self, "_accessibilityAddMispellingsToAttributedString:", v6);
      -[ICBaseTextView _icaxAddPredictiveTextToAttributedString:](self, "_icaxAddPredictiveTextToAttributedString:", v6);
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      v35[3] = 0;
      v12 = *MEMORY[0x1E0D63928];
      v13 = objc_msgSend(v5, "length");
      v14 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke;
      v30[3] = &unk_1EA7DE058;
      v34 = v35;
      v15 = v6;
      v31 = v15;
      v32 = self;
      v16 = v5;
      v33 = v16;
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v13, 0, v30);
      v17 = objc_msgSend(v16, "length");
      v18 = *MEMORY[0x1E0DC10F8];
      v28[0] = v14;
      v28[1] = 3221225472;
      v28[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_2;
      v28[3] = &unk_1EA7DDF00;
      v28[4] = self;
      v19 = v15;
      v29 = v19;
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v17, 0, v28);
      v20 = objc_msgSend(v19, "ic_range");
      v22 = v21;
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_3;
      v26[3] = &unk_1EA7DE080;
      v23 = v19;
      v27 = v23;
      objc_msgSend(v23, "enumerateAttributesInRange:options:usingBlock:", v20, v22, 0, v26);
      v24 = (void *)objc_msgSend(v23, "copy");
      -[ICBaseTextView set_icaxCachedModifiedAttributedString:](self, "set_icaxCachedModifiedAttributedString:", v24);

      -[ICBaseTextView icaxUpdateLinkRanges](self, "icaxUpdateLinkRanges");
      _Block_object_dispose(v35, 8);

    }
  }
  -[ICBaseTextView _icaxCachedModifiedAttributedString](self, "_icaxCachedModifiedAttributedString");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  ICTodoButtonProxyElement *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;

  v7 = a2;
  if (v7)
  {
    v59 = v7;
    v8 = v7;
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + a3;
    v62 = v8;
    if (objc_msgSend(v8, "isList"))
    {
      if (v9 < v9 + a4)
      {
        v60 = a3;
        v61 = a4;
        v10 = 1;
        v11 = v9;
        while (2)
        {
          objc_msgSend(*(id *)(a1 + 32), "string");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "paragraphRangeForRange:", v11, 0);
          v15 = v14;

          if (objc_msgSend(v8, "style") == 103)
          {
            v16 = objc_alloc(MEMORY[0x1E0CB3778]);
            v17 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "ic_attachmentCharacterString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR(" %@ "), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v16, "initWithString:", v19);

            v21 = v8;
            v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            objc_msgSend(*(id *)(a1 + 40), "_icaxTodoButtonForParagraphStyle:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = -[ICTodoButtonProxyElement initWithTodoButton:inTextRange:textView:]([ICTodoButtonProxyElement alloc], "initWithTodoButton:inTextRange:textView:", v23, 0, 3, *(_QWORD *)(a1 + 40));
              objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0CF4138], v24, 0, 3);

            }
            v25 = objc_msgSend(v20, "length");
            objc_msgSend(v20, "addAttribute:value:range:", CFSTR("ICAXAdditionalTextAttribute"), MEMORY[0x1E0C9AAB0], 0, v25);
            objc_msgSend(*(id *)(a1 + 32), "insertAttributedString:atIndex:", v20, v22 + v60);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v20, "length");
            v9 += objc_msgSend(v20, "length");
            v13 += objc_msgSend(v20, "length");

            v8 = v62;
          }
          v26 = v13 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v63 = v9;
          switch(objc_msgSend(v8, "style"))
          {
            case 'd':
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              v29 = CFSTR("bullet");
              goto LABEL_13;
            case 'e':
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              v29 = CFSTR("dash");
LABEL_13:
              objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_1EA7E9860, 0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = 0;
              goto LABEL_20;
            case 'f':
              objc_msgSend(*(id *)(a1 + 40), "textStorage");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D40], v26, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                ICAccessibilityLocalizedNumber();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = 0;
              }
              else
              {
                v30 = 0;
LABEL_22:
                v32 = 0;
              }
LABEL_23:
              v40 = v15;
              if (objc_msgSend(v32, "length") && v15)
              {
                objc_msgSend(*(id *)(a1 + 48), "string");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "substringWithRange:", v15 + v26 - 1, 1);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "characterAtIndex:", 0);

                objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v43) = objc_msgSend(v44, "characterIsMember:", v43);

                v40 = v15 - v43;
                v8 = v62;
              }
              if (v31)
              {
                if (!v32)
                  goto LABEL_29;
LABEL_28:
                objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0CF4210], v32, v13, v40);
                goto LABEL_29;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                goto LABEL_28;
LABEL_29:
              if (objc_msgSend(v8, "style") != 103)
                objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0CF4208], v31, v13, v40);
              ++v10;
              v11 = v13 + v15;

              a4 = v61;
              v9 = v63;
              if (v11 >= v63 + v61)
                break;
              continue;
            case 'g':
              objc_msgSend(*(id *)(a1 + 40), "editorController");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "icaxTextController");
              v35 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "textStorage");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v35, "todoForRange:inTextStorage:", v26, 0, v36);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v35) = objc_msgSend(v30, "done");
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if ((v35 & 1) != 0)
                v39 = CFSTR("checklist, completed");
              else
                v39 = CFSTR("checklist, incomplete");
              objc_msgSend(v37, "localizedStringForKey:value:table:", v39, &stru_1EA7E9860, 0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
              v31 = 0;
              goto LABEL_23;
            default:
              v30 = 0;
              v31 = 0;
              goto LABEL_22;
          }
          break;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64DC0], "icaxStyleDescriptionForNamedStyle:", objc_msgSend(v8, "style"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        objc_msgSend(*(id *)(a1 + 32), "string");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "substringWithRange:", a4 + v9 - 1, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "characterAtIndex:", 0);

        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v47) = objc_msgSend(v49, "characterIsMember:", v48);

        v50 = a4 - v47;
      }
      else
      {
        v50 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0CF4308], v45, v9, v50);
      v51 = *(void **)(a1 + 32);
      v52 = *MEMORY[0x1E0CF41E0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v62, "indent"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v51;
      v8 = v62;
      objc_msgSend(v54, "addAttribute:value:range:", v52, v53, v9, v50);

    }
    if (objc_msgSend(v8, "isBlockQuote"))
    {
      v55 = *(void **)(a1 + 32);
      v56 = *MEMORY[0x1E0CF4140];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v62, "blockQuoteLevel"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v56;
      v8 = v62;
      objc_msgSend(v55, "addAttribute:value:range:", v58, v57, v9, a4);

    }
    v7 = v59;
  }

}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char IsTextKit2Enabled;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "_icaxRangeInModifiedAttributedString:forRange:", *(_QWORD *)(a1 + 40), a3, a4);
    if (!ICInternalSettingsIsTextKit2Enabled())
    {
      v14 = *MEMORY[0x1E0CF4138];
      v15 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "layoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewForLayoutManager:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAttribute:value:range:", v14, v16, v9, 1);

LABEL_9:
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "icTextLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "existingAttachmentViewForIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v12;

    if (v13)
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0CF4138], v13, v9, 1);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "_icaxRangeInModifiedAttributedString:forRange:", *(_QWORD *)(a1 + 40), a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "_icaxPencilKitAttachmentsDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(*(id *)(a1 + 32), "_icaxRangeInModifiedAttributedString:forRange:", *(_QWORD *)(a1 + 40), a3, a4);
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v19 = *(void **)(a1 + 32);
  if ((IsTextKit2Enabled & 1) != 0)
  {
    objc_msgSend(v19, "icTextLayoutManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "existingAttachmentViewForIdentifier:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v19, "layoutManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForLayoutManager:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v22)
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0CF4138], v22, v17, 1);
  objc_opt_class();
  ICDynamicCast();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = objc_msgSend(v23, "expressionRangeInTextStorage");
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = v25;
      v28 = v26;
      v30 = *MEMORY[0x1E0DC45F0];
      v31[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addAttributes:range:", v29, v27, v28);

    }
  }

LABEL_10:
LABEL_11:

}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  +[ICTextViewAccessibility icaxEmphasisStyleNameFromAttributes:](ICTextViewAccessibility, "icaxEmphasisStyleNameFromAttributes:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = (_QWORD *)MEMORY[0x1E0CF4308];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4308]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D64E10];
    __ICAccessibilityStringForVariables();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v8, v10, a3, a4, v7, v11);

  }
}

- (void)_icaxAddParticipantEditHighlightsToString:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  ICBaseTextView *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[2];
  _QWORD v71[5];

  length = a4.length;
  location = a4.location;
  v71[3] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v8;
  objc_msgSend(v8, "collaborationColorManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", location, length, v11);
  v14 = v13;

  v58 = v10;
  objc_msgSend(v10, "mutableString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  v54 = v14;
  v17 = v12 + v14;
  v18 = objc_alloc(MEMORY[0x1E0CB3778]);
  v52 = self;
  -[ICBaseTextView textStorage](self, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v18, "initWithString:", v20);

  v55 = v12;
  v56 = *MEMORY[0x1E0CF4070];
  if (v12 < v17)
  {
    v21 = 0x1E0CB3000uLL;
    v22 = v54;
    v23 = v12;
    v53 = v16;
    while (1)
    {
      v24 = objc_msgSend(v16, "characterAtIndex:", v23);
      objc_msgSend(*(id *)(v21 + 1280), "newlineCharacterSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = objc_msgSend(v25, "characterIsMember:", v24);

      if ((v24 & 1) == 0)
        break;
LABEL_10:
      ++v23;
      if (!--v22)
        goto LABEL_11;
    }
    objc_msgSend(v58, "editAtIndex:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "replicaID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "userIDForReplicaID:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "highlightColorForUserID:note:", v28, v61);
    v66 = (void *)v28;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "participantAXDisplayNameForUserID:forNote:", v28, v61);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("added by %@"), &stru_1EA7E9860, 0);
    v31 = objc_claimAutoreleasedReturnValue();

    v64 = (void *)v31;
    v65 = (void *)v29;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v31, v29);
    v63 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("at %@"), &stru_1EA7E9860, 0);
    v33 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v26, "timestamp");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ic_briefFormattedDateForAccessibility");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v33;
    v37 = v33;
    v38 = v26;
    objc_msgSend(v34, "localizedStringWithFormat:", v37, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v67, "icaxApproximateColorDescription");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("%@ highlight"), &stru_1EA7E9860, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v42, v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timestamp");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44
      && (objc_msgSend(v38, "replicaID"),
          v60 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v61, "trustsTimestampsFromReplicaID:")))
    {
      v45 = (void *)v63;
      v71[0] = v63;
      v71[1] = v39;
      v71[2] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = (void *)v63;
      v70[0] = v63;
      v70[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
LABEL_9:

        objc_msgSend(v57, "addAttribute:value:range:", v56, v46, v55, v54);
        v16 = v53;
        v21 = 0x1E0CB3000;
        goto LABEL_10;
      }
    }

    goto LABEL_9;
  }
LABEL_11:
  objc_msgSend(v57, "ic_range");
  v47 = TSUClampRange();
  v49 = v48;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __90__ICBaseTextView_ICAccessibility_iOS___icaxAddParticipantEditHighlightsToString_forRange___block_invoke;
  v68[3] = &unk_1EA7DDF00;
  v68[4] = v52;
  v69 = v51;
  v50 = v51;
  objc_msgSend(v57, "enumerateAttribute:inRange:options:usingBlock:", v56, v47, v49, 0, v68);

}

void __90__ICBaseTextView_ICAccessibility_iOS___icaxAddParticipantEditHighlightsToString_forRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "_icaxModifiedAttributedStorageString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_icaxRangeInModifiedAttributedString:forRange:", v9, a3, a4);

    objc_msgSend(*(id *)(a1 + 40), "ic_range");
    v10 = TSUClampRange();
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0CF4070], v12, v10, v11);
  }

}

- (_NSRange)_icaxRangeInModifiedAttributedString:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[ICBaseTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = objc_msgSend(v7, "length");
  v11 = v10;
  if (location == v9)
  {
    length = 0;
  }
  else if (v10)
  {
    v11 = 0;
    v12 = location;
    v13 = length;
    while (v12)
    {
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("ICAXAdditionalTextAttribute"), v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;
      v16 = v14 != 0;

      LODWORD(v17) = v11 >= location && v16;
      if (length)
        v17 = v17;
      else
        v17 = 0;
      v13 += v17;
      v12 -= v15;
      if (++v11 >= objc_msgSend(v7, "length"))
      {
        v11 = 0;
        break;
      }
    }
    length = v13;
  }

  v18 = v11;
  v19 = length;
  result.length = v19;
  result.location = v18;
  return result;
}

- (_NSRange)_icaxRangeInTextStorageForRange:(_NSRange)a3 fromModifiedString:(id)a4
{
  unint64_t length;
  NSUInteger location;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  NSUInteger v16;
  void *v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = 0;
  if (objc_msgSend(v7, "length"))
  {
    v9 = location + length;
    if (location + length)
    {
      v8 = 0;
      v10 = 0;
      do
      {
        objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("ICAXAdditionalTextAttribute"), v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = length - (v10 >= location);
        if (!length)
          v12 = 0;
        if (v10 >= location)
          v13 = v8;
        else
          v13 = v8 + 1;
        if (v11)
          length = v12;
        else
          v8 = v13;
        ++v10;
      }
      while (v10 < objc_msgSend(v7, "length") && v10 < v9);
    }
  }
  -[ICBaseTextView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v8 >= v15)
    v16 = v15;
  else
    v16 = v8;
  -[ICBaseTextView textStorage](self, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length") - v16;

  if (length >= (v18 & (unint64_t)~(v18 >> 63)))
    length = v18 & ~(v18 >> 63);

  v19 = v16;
  v20 = length;
  result.length = v20;
  result.location = v19;
  return result;
}

- (unint64_t)_icaxModifiedPositionForPosition:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v5, a3, 0);

  return v6;
}

- (unint64_t)_icaxPositionForModifiedPosition:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", a3, 0, v5);

  return v6;
}

- (unint64_t)_icaxLinePositionForPosition:(unint64_t)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD v28[7];
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;

  v4 = a4;
  -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8 - 1 >= a3)
    v9 = a3;
  else
    v9 = v8 - 1;
  v10 = -[ICBaseTextView _icaxPositionForModifiedPosition:](self, "_icaxPositionForModifiedPosition:", v9);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3010000000;
  v33 = &unk_1DDA28851;
  v34 = xmmword_1DD9E6F90;
  -[ICBaseTextView textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v13 = v12 - v10;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ic_textRangeForRange:", v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke;
    v29[3] = &unk_1EA7DE0D0;
    v29[4] = self;
    v29[5] = &v30;
    v29[6] = v10;
    v18 = (id)objc_msgSend(v16, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v17, 0, v29);

  }
  else
  {
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v13, 0);
    v22 = v21;

    -[ICBaseTextView layoutManager](self, "layoutManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_3;
    v28[3] = &unk_1EA7DE0F8;
    v28[4] = self;
    v28[5] = &v30;
    v28[6] = v10;
    objc_msgSend(v23, "enumerateLineFragmentsForGlyphRange:usingBlock:", v20, v22, v28);

  }
  v24 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v7, v31[4], v31[5]);
  if (v4)
  {
    v25 = v24;
  }
  else
  {
    v26 = -[ICBaseTextView _icaxModifiedPositionForPosition:](self, "_icaxModifiedPositionForPosition:", v31[5] + v31[4]);
    v25 = v26 - (v26 < objc_msgSend(v7, "length"));
  }
  _Block_object_dispose(&v30, 8);

  return v25;
}

uint64_t __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  id obj;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v36 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rangeInElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "ic_rangeForTextRange:", v4);
  v7 = v6;

  v8 = *(_QWORD *)(a1 + 48);
  v31 = v7;
  v32 = v5;
  v9 = v5 > v8 || v8 >= v5 + v7;
  v10 = v9;
  v33 = v10;
  if (!v9)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v36, "textLineFragments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v11)
    {
      v35 = *(_QWORD *)v43;
      v12 = *MEMORY[0x1E0DC1178];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v38 = 0;
          v39 = &v38;
          v40 = 0x2020000000;
          v41 = 0;
          objc_msgSend(v14, "attributedString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "attributedString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "ic_range");
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_2;
          v37[3] = &unk_1EA7DE0A8;
          v37[4] = &v38;
          objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v12, v17, v18, 0, v37);

          v19 = objc_msgSend(v14, "characterRange");
          v21 = v20;
          objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "rangeInElement");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "ic_rangeForTextRange:", v23);
          v25 = v39[3];

          v26 = v24 + v19;
          v27 = *(_QWORD *)(a1 + 48);
          if (v24 + v19 <= v27 && v27 < v21 - v25 + v26)
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            *(_QWORD *)(v29 + 32) = v26;
            *(_QWORD *)(v29 + 40) = v21 - v25;
            _Block_object_dispose(&v38, 8);

            goto LABEL_19;
          }
          _Block_object_dispose(&v38, 8);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v11)
          continue;
        break;
      }
    }

    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v28 + 32) = v32;
    *(_QWORD *)(v28 + 40) = v31;
  }
LABEL_19:

  return v33;
}

void __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "textLists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v14, "textLists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "tabStops");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(v10, "markerFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v13, "length") + v12;

  }
  *a5 = 1;

}

void __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  v12 = v11;

  v13 = *(_QWORD *)(a1 + 48);
  if (v10 <= v13 && v13 < v10 + v12)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v15 + 32) = v10;
    *(_QWORD *)(v15 + 40) = v12;
    *a5 = 1;
  }
}

- (id)elementsForAccessibilityRotorType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeLinks")))
  {
    -[ICBaseTextView _icaxLinkElements](self, "_icaxLinkElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeChecklist")))
  {
    -[ICBaseTextView _icaxTodoElements](self, "_icaxTodoElements");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeAttachments")))
  {
    -[ICBaseTextView _icaxAttachmentElementsForRotor](self, "_icaxAttachmentElementsForRotor");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeTables")))
  {
    -[ICBaseTextView _icaxTableElementsForRotor](self, "_icaxTableElementsForRotor");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeTags")))
  {
    -[ICBaseTextView _icaxTagsElementsForRotor](self, "_icaxTagsElementsForRotor");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeMentions")))
  {
    -[ICBaseTextView _icaxMentionsElementsForRotor](self, "_icaxMentionsElementsForRotor");
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeCalculationResults")))
  {
    -[ICBaseTextView _icaxCalculationResultElementsForRotor](self, "_icaxCalculationResultElementsForRotor");
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICAccessibilityRotorTypeCalculationErrors")))
  {
    -[ICBaseTextView _icaxCalculationErrorElementsForRotor](self, "_icaxCalculationErrorElementsForRotor");
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }

  return v5;
}

- (id)accessibilityCustomRotors
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView accessibilityCustomRotors](&v13, sel_accessibilityCustomRotors);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  -[ICBaseTextView editorController](self, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNoteEditorViewController:", v7);

  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharedTextViewRotors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_icaxAttachmentElementsForRotor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v3, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __70__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElementsForRotor__block_invoke;
  v13 = &unk_1EA7DE120;
  v14 = self;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __70__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElementsForRotor__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char isKindOfClass;
  int IsTextKit2Enabled;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;

  v5 = a2;
  if (v5)
  {
    v19 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = v19;
      if ((isKindOfClass & 1) == 0)
      {
        IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
        v8 = *(void **)(a1 + 32);
        if (IsTextKit2Enabled)
        {
          objc_msgSend(v8, "textLayoutManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "documentRange");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "location");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "locationFromLocation:withOffset:", v12, a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = *(void **)(a1 + 32);
          objc_msgSend(v14, "textContainer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "viewProviderForParentView:location:textContainer:", v14, v13, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v8, "layoutManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "viewForLayoutManager:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_addPencilKitAccessibilityElementIfNeededForTextAttachment:toAttachmentElements:", v19, *(_QWORD *)(a1 + 40));
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICBaseTextView(ICAccessibility_iOS) _icaxAttachmentElementsForRotor]_block_invoke", 1, 0, CFSTR("%@ does not conform to 'ICAccessibilityRotorSearchElement'"), v17);
        }

        goto LABEL_15;
      }
    }
    else
    {
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();
      v5 = v19;
      if ((v18 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_addPencilKitAccessibilityElementIfNeededForTextAttachment:toAttachmentElements:", v19, *(_QWORD *)(a1 + 40));
LABEL_15:
        v5 = v19;
      }
    }
  }

}

- (id)_icaxTableElementsForRotor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v3, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __65__ICBaseTextView_ICAccessibility_iOS___icaxTableElementsForRotor__block_invoke;
  v13 = &unk_1EA7DE120;
  v14 = self;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __65__ICBaseTextView_ICAccessibility_iOS___icaxTableElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  char IsTextKit2Enabled;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  if (v3)
  {
    v16 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v16;
    if ((isKindOfClass & 1) != 0)
    {
      IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      v6 = *(void **)(a1 + 32);
      if ((IsTextKit2Enabled & 1) != 0)
      {
        objc_msgSend(v6, "icTextLayoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "viewIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "layoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "viewForLayoutManager:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_opt_class();
      objc_msgSend(v9, "accessibilityElements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "tableAXController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v13, "isEditable");

      if ((_DWORD)v11)
      {
        objc_msgSend(v12, "tableAXController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cellElementForColumnIndex:rowIndex:", 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v15);
      }

      v3 = v16;
    }
  }

}

- (id)_icaxTagsElementsForRotor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v3, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __64__ICBaseTextView_ICAccessibility_iOS___icaxTagsElementsForRotor__block_invoke;
  v13 = &unk_1EA7DE120;
  v14 = self;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __64__ICBaseTextView_ICAccessibility_iOS___icaxTagsElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char IsTextKit2Enabled;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    v5 = *(void **)(a1 + 32);
    if ((IsTextKit2Enabled & 1) != 0)
    {
      objc_msgSend(v5, "icTextLayoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "existingAttachmentViewForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "layoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewForLayoutManager:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v9);
  }

}

- (id)_icaxMentionsElementsForRotor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v3, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __68__ICBaseTextView_ICAccessibility_iOS___icaxMentionsElementsForRotor__block_invoke;
  v13 = &unk_1EA7DE120;
  v14 = self;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __68__ICBaseTextView_ICAccessibility_iOS___icaxMentionsElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char IsTextKit2Enabled;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    v5 = *(void **)(a1 + 32);
    if ((IsTextKit2Enabled & 1) != 0)
    {
      objc_msgSend(v5, "icTextLayoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "existingAttachmentViewForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "layoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewForLayoutManager:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v9);
  }

}

- (id)_icaxCalculationResultElementsForRotor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v3, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __77__ICBaseTextView_ICAccessibility_iOS___icaxCalculationResultElementsForRotor__block_invoke;
  v13 = &unk_1EA7DE120;
  v14 = self;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __77__ICBaseTextView_ICAccessibility_iOS___icaxCalculationResultElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char IsTextKit2Enabled;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    v5 = *(void **)(a1 + 32);
    if ((IsTextKit2Enabled & 1) != 0)
    {
      objc_msgSend(v5, "icTextLayoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "existingAttachmentViewForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "layoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewForLayoutManager:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v9);
  }

}

- (id)_icaxCalculationErrorElementsForRotor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v3, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __76__ICBaseTextView_ICAccessibility_iOS___icaxCalculationErrorElementsForRotor__block_invoke;
  v13 = &unk_1EA7DE120;
  v14 = self;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __76__ICBaseTextView_ICAccessibility_iOS___icaxCalculationErrorElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char IsTextKit2Enabled;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v13;
  if (v13)
  {
    objc_msgSend(v13, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValidCalculateAttachment");

    v4 = v13;
    if ((v6 & 1) == 0)
    {
      IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      objc_opt_class();
      v8 = *(void **)(a1 + 32);
      if ((IsTextKit2Enabled & 1) != 0)
      {
        objc_msgSend(v8, "icTextLayoutManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "existingAttachmentViewForIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v8, "layoutManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewForLayoutManager:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v12);
      v4 = v13;
    }
  }

}

- (void)_icaxMarkTodoIncompleteForCurrentSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[ICBaseTextView editorController](self, "editorController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icaxTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v6 = v5;
  -[ICBaseTextView textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDone:range:inTextStorage:", 0, v4, v6, v7);

}

- (void)_icaxMarkTodoCompleteForCurrentSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[ICBaseTextView editorController](self, "editorController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icaxTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v6 = v5;
  -[ICBaseTextView textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDone:range:inTextStorage:", 1, v4, v6, v7);

}

- (void)_icaxChecklistMarkAllComplete
{
  void *v3;
  void *v4;
  id v5;

  -[ICBaseTextView editorController](self, "editorController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icaxTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView ic_selectedRanges](self, "ic_selectedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markAllChecklistItemsCompleted:inTextview:forSelectedRanges:", 1, self, v4);

}

- (void)_icaxChecklistUnMarkAllComplete
{
  void *v3;
  void *v4;
  id v5;

  -[ICBaseTextView editorController](self, "editorController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icaxTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView ic_selectedRanges](self, "ic_selectedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markAllChecklistItemsCompleted:inTextview:forSelectedRanges:", 0, self, v4);

}

- (void)_icaxChecklistDeleteChecked
{
  void *v3;
  void *v4;
  id v5;

  -[ICBaseTextView editorController](self, "editorController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icaxTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView ic_selectedRanges](self, "ic_selectedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChecklistItemsMarkedCompleted:inTextView:forRanges:", 1, self, v4);

}

- (void)_icaxChecklistSortCheckedToBottom
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[ICBaseTextView editorController](self, "editorController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icaxTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICBaseTextView selectedRange](self, "selectedRange");
  objc_msgSend(v3, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", self, v4, v5, 1);

}

- (void)textStorageWillPerformMerge:(id)a3
{
  JUMPOUT(0x1DF0DEF70);
}

- (void)textStorageDidPerformMerge:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[ICBaseTextView icaxClearCaches](self, "icaxClearCaches", a3);
  v3 = *MEMORY[0x1E0DC1070];
  v5 = *MEMORY[0x1E0D64890];
  v6[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (id)_accessibilitySupplementaryHeaderViews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)childElementsForAccessibilityReparenting
{
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  void *v40;
  double v41;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  CGRect v47;
  CGRect v48;

  -[ICBaseTextView contentOffset](self, "contentOffset");
  v4 = v3;
  -[ICBaseTextView _icaxLastOffsetForBuildingReparentingCache](self, "_icaxLastOffsetForBuildingReparentingCache");
  if (vabdd_f64(v4, v5) > 200.0)
    -[ICBaseTextView icaxClearCachedChildrenForReparenting](self, "icaxClearCachedChildrenForReparenting");
  -[ICBaseTextView _icaxCachedChildrenForReparenting](self, "_icaxCachedChildrenForReparenting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[ICBaseTextView _accessibleSubviews](self, "_accessibleSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    -[ICBaseTextView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC10F8];
    -[ICBaseTextView textStorage](self, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __79__ICBaseTextView_ICAccessibility_iOS__childElementsForAccessibilityReparenting__block_invoke;
    v45[3] = &unk_1EA7DDF00;
    v45[4] = self;
    v13 = v7;
    v46 = v13;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v12, 0, v45);

    v44 = v13;
    objc_msgSend(v13, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    v43 = v14;
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    v17 = objc_msgSend(v16, "count");
    if (v17)
    {
      v18 = v17;
      for (i = 0; i < v18; ++i)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v22 = 0;
          while (1)
          {
            if (i != v22)
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v24 = objc_opt_isKindOfClass();

              objc_msgSend(v16, "objectAtIndexedSubscript:", i);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "accessibilityFrame");
              v27 = v26;
              v29 = v28;
              v31 = v30;
              v33 = v32;
              objc_msgSend(v16, "objectAtIndexedSubscript:", v22);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "accessibilityFrame");
              v48.origin.x = v35;
              v48.origin.y = v36;
              v48.size.width = v37;
              v48.size.height = v38;
              v47.origin.x = v27;
              v47.origin.y = v29;
              v47.size.width = v31;
              v47.size.height = v33;
              v39 = CGRectEqualToRect(v47, v48);

              if ((v24 & 1) != 0 && v39)
                break;
            }
            if (v18 == ++v22)
              goto LABEL_16;
          }
          objc_msgSend(v16, "exchangeObjectAtIndex:withObjectAtIndex:", i, v22);
          objc_msgSend(v16, "removeObjectAtIndex:", v22);
          --v18;
        }
LABEL_16:
        ;
      }
    }
    v40 = (void *)objc_msgSend(v16, "copy");

    -[ICBaseTextView set_icaxCachedChildrenForReparenting:](self, "set_icaxCachedChildrenForReparenting:", v40);
    -[ICBaseTextView contentOffset](self, "contentOffset");
    -[ICBaseTextView set_icaxLastOffsetForBuildingReparentingCache:](self, "set_icaxLastOffsetForBuildingReparentingCache:", v41);
    UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);

  }
  return -[ICBaseTextView _icaxCachedChildrenForReparenting](self, "_icaxCachedChildrenForReparenting");
}

void __79__ICBaseTextView_ICAccessibility_iOS__childElementsForAccessibilityReparenting__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char IsTextKit2Enabled;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ICPencilKitAttachmentAccessibilityElement *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    v6 = *(void **)(a1 + 32);
    if ((IsTextKit2Enabled & 1) != 0)
    {
      objc_msgSend(v6, "icTextLayoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "viewIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "layoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewForTextAttachment:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v10, "isAccessibilityElement"))
  {
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
      goto LABEL_25;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "_accessibleSubviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }
    objc_msgSend(v10, "accessibilityElements");
    v18 = (ICPencilKitAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v18);
LABEL_22:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_icaxPencilKitAttachmentsDict");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(*(id *)(a1 + 32), "set_icaxPencilKitAttachmentsDict:", v20);

      }
      objc_msgSend(v4, "attachment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "_icaxPencilKitAttachmentsDict");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v12);
        v18 = (ICPencilKitAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v18 = -[ICPencilKitAttachmentAccessibilityElement initWithTextAttachment:textView:]([ICPencilKitAttachmentAccessibilityElement alloc], "initWithTextAttachment:textView:", v4, *(_QWORD *)(a1 + 32));
          if (v18)
          {
            objc_msgSend(*(id *)(a1 + 32), "_icaxPencilKitAttachmentsDict");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v12);

            -[ICPencilKitAttachmentAccessibilityElement resizeHandleElements](v18, "resizeHandleElements");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "count"))
              objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v24);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);

          }
        }
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_22;
    }
  }
LABEL_25:

}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  id *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if ((-[ICBaseTextView isEditing](self, "isEditing") & 1) == 0)
  {
    if (UIAccessibilityIsVoiceOverRunning())
    {
      v4 = (id *)MEMORY[0x1E0DC4588];
    }
    else
    {
      if (!UIAccessibilityIsSwitchControlRunning())
      {
        v5 = 0;
LABEL_9:
        UIAccessibilityFocusedElement(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          ICDynamicCast();
          v7 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "tableAXController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "hostingTableAttachmentView");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          v10 = v9;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v9 = v6;
              objc_msgSend(v9, "accessibilityLabel");
              v25 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v11 = 0;
                goto LABEL_22;
              }
              v9 = v6;
              objc_msgSend(v9, "icaxDragSourceName");
              v25 = objc_claimAutoreleasedReturnValue();
            }
            v11 = (void *)v25;
            if (v9)
              goto LABEL_14;
LABEL_22:
            v3 = 0;
            goto LABEL_23;
          }
          v7 = v6;
          objc_msgSend(v7, "attachmentDrawingView");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = v7;
        }
        objc_msgSend(v10, "accessibilityLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
LABEL_14:
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Drag %@"), &stru_1EA7E9860, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v13, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "center");
          v16 = v15;
          v18 = v17;
          objc_msgSend(v9, "superview");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICBaseTextView convertPoint:fromView:](self, "convertPoint:fromView:", v19, v16, v18);
          v21 = v20;
          v23 = v22;

          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3420]), "initWithName:point:inView:", v14, self, v21, v23);
          v28[0] = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
          return v3;
        }
        goto LABEL_22;
      }
      v4 = (id *)MEMORY[0x1E0DC4580];
    }
    v5 = (NSString *)*v4;
    goto LABEL_9;
  }
  v27.receiver = self;
  v27.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView accessibilityDragSourceDescriptors](&v27, sel_accessibilityDragSourceDescriptors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  id *v4;
  NSString *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double MidX;
  double v19;
  double v20;
  objc_super v22;
  _QWORD v23[2];
  CGRect v24;
  CGRect v25;

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!-[ICBaseTextView isEditable](self, "isEditable"))
  {
    v3 = 0;
    return v3;
  }
  if ((-[ICBaseTextView isEditing](self, "isEditing") & 1) == 0)
  {
    if (UIAccessibilityIsVoiceOverRunning())
    {
      v4 = (id *)MEMORY[0x1E0DC4588];
    }
    else
    {
      if (!UIAccessibilityIsSwitchControlRunning())
      {
        v5 = 0;
LABEL_11:
        UIAccessibilityFocusedElement(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *MEMORY[0x1E0C9D538];
        v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          ICDynamicCast();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "tableAXController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hostingTableAttachmentView");
          v11 = (id)objc_claimAutoreleasedReturnValue();

          v12 = v11;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = v6;
              objc_msgSend(v11, "accessibilityLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v13 = 0;
                goto LABEL_23;
              }
              v11 = v6;
              objc_msgSend(v11, "icaxDragSourceName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "bounds");
              MidX = CGRectGetMidX(v24);
              objc_msgSend(v11, "bounds");
              -[ICBaseTextView convertPoint:fromView:](self, "convertPoint:fromView:", v11, MidX, CGRectGetMinY(v25));
              v7 = v19;
              v8 = v20;
            }
LABEL_16:
            if (v11)
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Drop before %@"), &stru_1EA7E9860, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v15, v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3420]), "initWithName:point:inView:", v16, self, v7, v8);
              v23[0] = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
              v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
              return v3;
            }
LABEL_23:
            v3 = 0;
            goto LABEL_24;
          }
          v9 = v6;
          objc_msgSend(v9, "attachmentDrawingView");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v9;
        }
        objc_msgSend(v12, "accessibilityLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v4 = (id *)MEMORY[0x1E0DC4580];
    }
    v5 = (NSString *)*v4;
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView accessibilityDropPointDescriptors](&v22, sel_accessibilityDropPointDescriptors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)_icaxCurrentParagraph
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v7 = objc_msgSend(v4, "paragraphRangeForRange:", v5 + v6, 0);
  v9 = v8;

  -[ICBaseTextView textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringWithRange:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_NSRange)_icaxRangeOfAttachment:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeForAttachment:", v3);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)_icaxFirstTextAttachmentInRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger length;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  location = a3.location;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  if (a3.length)
  {
    length = a3.length;
    -[ICBaseTextView textStorage](self, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0DC10F8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__ICBaseTextView_ICAccessibility_iOS___icaxFirstTextAttachmentInRange___block_invoke;
    v13[3] = &unk_1EA7DD260;
    v13[4] = &v14;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, location, length, 0, v13);
  }
  else
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", location, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v15[5];
    v15[5] = v9;

  }
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __71__ICBaseTextView_ICAccessibility_iOS___icaxFirstTextAttachmentInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a2)
  {
    v7 = a2;
    objc_opt_class();
    ICDynamicCast();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a5 = 1;
  }
}

- (id)_icaxAttachmentViewForCurrentSelectedRange
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char IsTextKit2Enabled;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[ICBaseTextView selectedRange](self, "selectedRange");
  -[ICBaseTextView _icaxFirstTextAttachmentInRange:](self, "_icaxFirstTextAttachmentInRange:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    if ((IsTextKit2Enabled & 1) != 0)
    {
      -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICBaseTextView layoutManager](self, "layoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewForBaseTextAttachmentNoCreate:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_icaxAttachmentElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v4, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __62__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElements__block_invoke;
  v13 = &unk_1EA7DDF28;
  v14 = self;
  v15 = v3;
  v7 = v3;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __62__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  char IsTextKit2Enabled;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (v3)
  {
    v10 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      v6 = *(void **)(a1 + 32);
      if ((IsTextKit2Enabled & 1) != 0)
      {
        objc_msgSend(v6, "icTextLayoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "layoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewForLayoutManager:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      v3 = v10;
    }
  }

}

- (id)_icaxLinkElements
{
  void *v3;

  if ((-[ICBaseTextView isEditing](self, "isEditing") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[ICBaseTextView _accessibilityInternalTextLinks](self, "_accessibilityInternalTextLinks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_icaxTodoElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ICBaseTextView *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D63928];
  v6 = objc_msgSend(v4, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__ICBaseTextView_ICAccessibility_iOS___icaxTodoElements__block_invoke;
  v13 = &unk_1EA7DE148;
  v14 = self;
  v15 = v3;
  v7 = v3;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __56__ICBaseTextView_ICAccessibility_iOS___icaxTodoElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "todo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_icaxTodoButtonForParagraphStyle:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

    v4 = v6;
  }

}

- (void)_icaxUpdateFakeTextSelectionRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (UIAccessibilityIsVoiceOverRunning()
    && !-[ICBaseTextView _icaxShouldPreventUpdatingFakeCursorRange](self, "_icaxShouldPreventUpdatingFakeCursorRange"))
  {
    -[ICBaseTextView _icaxModifiedAttributedStorageString](self, "_icaxModifiedAttributedStorageString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ICBaseTextView selectedRange](self, "selectedRange");
    v6 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v3, v4, v5);
    -[ICBaseTextView set_icaxModifiedSelectionRange:](self, "set_icaxModifiedSelectionRange:", v6, v7);

    -[ICBaseTextView set_icaxModifiedCursorPosition:](self, "set_icaxModifiedCursorPosition:", -[ICBaseTextView _icaxModifiedSelectionRange](self, "_icaxModifiedSelectionRange"));
  }
}

- (void)_icaxGetBoldForCurrentRange:(BOOL *)a3 italic:(BOOL *)a4 underline:(BOOL *)a5 strikethrough:(BOOL *)a6
{
  void *v11;
  char v12;
  void *v13;
  id v14;

  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "currentBIUSForStyleSelector");

  *a3 = v12 & 1;
  *a4 = (v12 & 2) != 0;
  *a5 = (v12 & 4) != 0;
  -[ICBaseTextView typingAttributes](self, "typingAttributes");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D63930]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *a6 = objc_msgSend(v13, "integerValue") != 0;

}

- (id)_icaxFirstAttachmentViewSupportingAction:(SEL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[ICBaseTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ICBaseTextView_ICAccessibility_iOS___icaxFirstAttachmentViewSupportingAction___block_invoke;
  v11[3] = &unk_1EA7DE170;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a3;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __80__ICBaseTextView_ICAccessibility_iOS___icaxFirstAttachmentViewSupportingAction___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char IsTextKit2Enabled;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    v9 = (void *)a1[4];
    if ((IsTextKit2Enabled & 1) != 0)
    {
      objc_msgSend(v9, "icTextLayoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "existingAttachmentViewForIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v9, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewForTextAttachment:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (objc_msgSend(v13, "canPerformAction:withSender:", a1[6], 0))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v13);
      *a5 = 1;
    }

  }
}

- (BOOL)isAccessibilityTableTextView
{
  return 0;
}

- (id)_icaxTodoButtonForParagraphStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "todoTrackingUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "trackedTodoParagraphForTrackingUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "todoButtonForTrackedParagraph:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "icaxTodoButtonForParagraphStyle:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_7:
  return v9;
}

- (void)_icaxAddPredictiveTextToAttributedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v24.receiver = self;
  v24.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView accessibilityValue](&v24, sel_accessibilityValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CF40F8];
  v26[0] = *MEMORY[0x1E0CF4100];
  v26[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_msgSend(v6, "length");
        v15 = objc_msgSend(v4, "length");
        v17[0] = v11;
        if (v14 >= v15)
          v14 = v15;
        v17[1] = 3221225472;
        v17[2] = __80__ICBaseTextView_ICAccessibility_iOS___icaxAddPredictiveTextToAttributedString___block_invoke;
        v17[3] = &unk_1EA7DDF00;
        v18 = v4;
        v19 = v13;
        objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v17);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

}

uint64_t __80__ICBaseTextView_ICAccessibility_iOS___icaxAddPredictiveTextToAttributedString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *(_QWORD *)(result + 40), a2, a3, a4);
  return result;
}

- (void)_addPencilKitAccessibilityElementIfNeededForTextAttachment:(id)a3 toAttachmentElements:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView _icaxPencilKitAttachmentsDict](self, "_icaxPencilKitAttachmentsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ic_addNonNilObject:", v9);
}

- (id)_icaxMakeBoldString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set bold"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMakeNotBoldString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not bold"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMakeItalicString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set italic"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMakeNotItalicString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not italic"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMakeUnderlinedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set underline"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMakeNotUnderlinedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not underline"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)icaxMakeStrikethroughString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set strike-through"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)icaxMakeNotStrikethroughString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not strike-through"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMarkAsCompletedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Mark as checked"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMarkAsIncompleteString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Mark as unchecked"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxMakeChecklistString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Make checklist item"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxRemoveChecklistString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Remove checklist item"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxChecklistMarkAllItemsCompleteString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Check all items"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxChecklistUnmarkAllItemsCompleteString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Uncheck all items"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxChecklistDeleteCheckedItemsString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete all checked items"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxChecklistMoveCheckedToBottomString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move Checked items to the Bottom"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxShareAttachmentString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Share Attachment"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxIncreaseIndentationString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Increase Indentation"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxDecreaseIndentationString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Decrease Indentation"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_icaxInsertDrawingString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Insert Drawing"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)ic_canIndentByDelta:(int64_t)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ICBaseTextView_StyleAdditions__ic_canIndentByDelta___block_invoke;
  v5[3] = &unk_1EA7DFE90;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__ICBaseTextView_StyleAdditions__ic_canIndentByDelta___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "canIndentTextView:byDelta:", a1[4], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)ic_setTextStyleForCurrentSelection:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke;
  v3[3] = &unk_1EA7DFEE0;
  v3[4] = self;
  v4 = a3;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v3);
}

void __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;

  v5 = a2;
  v6 = a3;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke_2;
  v17 = &unk_1EA7DFEB8;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = v6;
  v21 = *(_DWORD *)(a1 + 40);
  v20 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "saveSelectionDuringBlock:affinity:", &v14, 0);
  v9 = objc_msgSend(*(id *)(a1 + 32), "selectedRange", v14, v15, v16, v17, v18);
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typingAttributesForSettingTextStyleForRange:currentTypingAttributes:inTextStorage:", v9, v11, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTypingAttributes:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setIsSettingTextStyle:", 0);
}

void __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setIsSettingTextStyle:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "rangeValue");
        objc_msgSend(*(id *)(a1 + 40), "setTextStyle:range:inTextStorage:inTextView:", *(unsigned int *)(a1 + 56), v7, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "setTypingTextStyle:textView:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textViewDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)ic_indentByAmount:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__ICBaseTextView_StyleAdditions__ic_indentByAmount___block_invoke;
  v3[3] = &unk_1EA7DFF08;
  v3[4] = self;
  v3[5] = a3;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v3);
}

void __52__ICBaseTextView_StyleAdditions__ic_indentByAmount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "rangeValue");
        v12 = v11;
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "textStorage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "indentRange:byAmount:inTextStorage:textView:", v10, v12, v13, v14, *(_QWORD *)(a1 + 32));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)ic_toggleBoldface
{
  -[ICBaseTextView ic_toggleFontHint:](self, "ic_toggleFontHint:", 1);
}

- (void)ic_enableBoldface
{
  -[ICBaseTextView ic_setFontHint:enabled:](self, "ic_setFontHint:enabled:", 1, 1);
}

- (void)ic_disableBoldface
{
  -[ICBaseTextView ic_setFontHint:enabled:](self, "ic_setFontHint:enabled:", 1, 0);
}

- (void)ic_toggleItalics
{
  -[ICBaseTextView ic_toggleFontHint:](self, "ic_toggleFontHint:", 2);
}

- (void)ic_enableItalics
{
  -[ICBaseTextView ic_setFontHint:enabled:](self, "ic_setFontHint:enabled:", 2, 1);
}

- (void)ic_disableItalics
{
  -[ICBaseTextView ic_setFontHint:enabled:](self, "ic_setFontHint:enabled:", 2, 0);
}

- (void)ic_toggleUnderline
{
  -[ICBaseTextView ic_toggleAttributeWithName:](self, "ic_toggleAttributeWithName:", *MEMORY[0x1E0D63948]);
}

- (void)ic_enableUnderline
{
  -[ICBaseTextView ic_setAttributeWithName:enabled:](self, "ic_setAttributeWithName:enabled:", *MEMORY[0x1E0D63948], 1);
}

- (void)ic_disableUnderline
{
  -[ICBaseTextView ic_setAttributeWithName:enabled:](self, "ic_setAttributeWithName:enabled:", *MEMORY[0x1E0D63948], 0);
}

- (void)ic_toggleStrikethrough
{
  -[ICBaseTextView ic_toggleAttributeWithName:](self, "ic_toggleAttributeWithName:", *MEMORY[0x1E0D63930]);
}

- (void)ic_enableStrikethrough
{
  -[ICBaseTextView ic_setAttributeWithName:enabled:](self, "ic_setAttributeWithName:enabled:", *MEMORY[0x1E0D63930], 1);
}

- (void)ic_disableStrikethrough
{
  -[ICBaseTextView ic_setAttributeWithName:enabled:](self, "ic_setAttributeWithName:enabled:", *MEMORY[0x1E0D63930], 0);
}

- (void)ic_toggleEmphasisWithType:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;

  if (a3 && ic_currentEmphasisColorTypeDefault() != a3)
    ic_setCurrentEmphasisColorTypeDefault();
  -[ICBaseTextView ic_toggleAttributeWithName:withEmphasisColorType:](self, "ic_toggleAttributeWithName:withEmphasisColorType:", *MEMORY[0x1E0D63908], a3);
  v5 = -[ICBaseTextView selectedRange](self, "selectedRange");
  -[ICBaseTextView updateStyleLayersInRange:](self, "updateStyleLayersInRange:", v5, v6);
}

- (id)ic_selectedStyles
{
  return -[ICBaseTextView ic_selectedStylesIgnoreTypingAttributes:](self, "ic_selectedStylesIgnoreTypingAttributes:", 0);
}

- (id)ic_selectedStylesIgnoreTypingAttributes:(BOOL)a3
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke;
  v9[3] = &unk_1EA7DFF58;
  v9[4] = self;
  v10 = v5;
  v11 = a3;
  v6 = v5;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "rangeValue");
        v13 = v12;
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v5, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke_2;
          v23[3] = &unk_1EA7DFF30;
          v17 = v6;
          v18 = *(_QWORD *)(a1 + 32);
          v24 = v17;
          v25 = v18;
          v26 = v5;
          v27 = *(id *)(a1 + 40);
          objc_msgSend(v16, "ic_enumerateParagraphsInRange:usingBlock:", v13, v15, v23);

        }
        else if (v12 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "length") >= v12)
        {
          objc_msgSend(v5, "string");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "paragraphRangeForRange:", v13, 0);
          v22 = v21;

          objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v6, "paragraphStyleForRange:inTextView:inTextStorage:ignoreTypingAttributes:", v20, v22, *(_QWORD *)(a1 + 32), v5, *(unsigned __int8 *)(a1 + 48)));
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

}

uint64_t __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(*(id *)(a1 + 32), "paragraphStyleForRange:inTextView:inTextStorage:", a2, a3 - a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
}

- (unint64_t)ic_selectedBIUS
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  unint64_t v20;

  v3 = -[ICBaseTextView selectedRange](self, "selectedRange");
  if (v4)
  {
    v5 = v3;
    v6 = v4;
    -[ICBaseTextView textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesAtIndex:longestEffectiveRange:inRange:", v5, 0, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) != 0 || objc_msgSend(v12, "ic_hasSymbolicBoldTrait"))
  {
    v13 = 1;
    if ((v10 & 2) != 0)
      goto LABEL_10;
LABEL_9:
    if (!objc_msgSend(v12, "ic_hasSymbolicItalicTrait"))
      goto LABEL_11;
    goto LABEL_10;
  }
  v13 = 0;
  if ((v10 & 2) == 0)
    goto LABEL_9;
LABEL_10:
  v13 |= 2uLL;
LABEL_11:
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63948]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
    v13 |= 4uLL;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63930]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    v13 |= 8uLL;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
    v20 = v13 | 0x10;
  else
    v20 = v13;

  return v20;
}

- (int64_t)ic_currentWritingDirection
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__ICBaseTextView_StyleAdditions__ic_currentWritingDirection__block_invoke;
  v4[3] = &unk_1EA7DFE68;
  v4[4] = self;
  v4[5] = &v5;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __60__ICBaseTextView_StyleAdditions__ic_currentWritingDirection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v5, "selectedRange");
  v10 = objc_msgSend(v6, "writingDirectionForRange:inTextView:inTextStorage:", v8, v9, *(_QWORD *)(a1 + 32), v7);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
}

- (void)ic_enumerateTableAttachmentViewControllersInRanges:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id obj;
  id obja;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v10)
    {
      v11 = v10;
      v26 = v6;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(obj);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "rangeValue", v26);
          v16 = v15;
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke;
          v36[3] = &unk_1EA7DFF80;
          v17 = v9;
          v37 = v17;
          v38 = v7;
          objc_msgSend(v17, "enumerateAttachmentViewsInRange:usingBlock:", v14, v16, v36);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v11);
LABEL_17:
      v9 = v17;
      v6 = v26;
    }
  }
  else
  {
    objc_opt_class();
    -[ICBaseTextView layoutManager](self, "layoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obja = v6;
    v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v19)
    {
      v20 = v19;
      v26 = v6;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(obja);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "rangeValue", v26);
          v25 = v24;
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke_2;
          v29[3] = &unk_1EA7DFF80;
          v17 = v9;
          v30 = v17;
          v31 = v7;
          objc_msgSend(v17, "enumerateAttachmentViewsInRange:usingBlock:", v23, v25, v29);

        }
        v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v20);
      goto LABEL_17;
    }
  }

}

void __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v8 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableViewControllerForAttachment:createIfNeeded:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (v7)
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
    }

    v5 = (void *)v8;
  }

}

void __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "attachmentType");

  if (v5 == 12)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "viewControllerForTextAttachment:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
    }

  }
}

- (BOOL)ic_allSelectedRangesContainFontHint:(unsigned int)a3
{
  char v3;
  _QWORD v5[5];
  unsigned int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainFontHint___block_invoke;
  v5[3] = &unk_1EA7DFFA8;
  v6 = a3;
  v5[4] = &v7;
  -[ICBaseTextView ic_enumerateAttributesInSelectedRanges:](self, "ic_enumerateAttributesInSelectedRanges:", v5);
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __70__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainFontHint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if ((*(_DWORD *)(a1 + 40) & v4) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

- (BOOL)ic_allSelectedRangesContainAttributeName:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainAttributeName___block_invoke;
  v7[3] = &unk_1EA7DFFD0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICBaseTextView ic_enumerateAttributesInSelectedRanges:](self, "ic_enumerateAttributesInSelectedRanges:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __75__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainAttributeName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

- (void)ic_enumerateAttributesInSelectedRanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke;
  v6[3] = &unk_1EA7E0020;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v6);

}

void __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v6), "rangeValue");
        v9 = v8;
        objc_msgSend(*(id *)(a1 + 32), "textStorage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke_2;
        v12[3] = &unk_1EA7DFFF8;
        v13 = *(id *)(a1 + 40);
        objc_msgSend(v10, "ic_enumerateAttributesInClampedRange:options:usingBlock:", v7, v9, 0, v12);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

uint64_t __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ic_toggleAttributeWithName:(id)a3
{
  -[ICBaseTextView ic_toggleAttributeWithName:withEmphasisColorType:](self, "ic_toggleAttributeWithName:withEmphasisColorType:", a3, 0);
}

- (void)ic_toggleAttributeWithName:(id)a3 withEmphasisColorType:(int64_t)a4
{
  id v6;
  BOOL v7;
  _BOOL8 v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  BOOL v13;

  v6 = a3;
  v7 = -[ICBaseTextView ic_allSelectedRangesContainAttributeName:](self, "ic_allSelectedRangesContainAttributeName:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v8 = a4 != 0;
  v10[2] = __83__ICBaseTextView_StyleAdditions__ic_toggleAttributeWithName_withEmphasisColorType___block_invoke;
  v10[3] = &unk_1EA7E0048;
  v11 = v6;
  v12 = a4;
  v13 = v7;
  v9 = v6;
  -[ICBaseTextView ic_editAttributesInSelectedRanges:shouldSkipAttachments:](self, "ic_editAttributesInSelectedRanges:shouldSkipAttachments:", v10, v8);

}

void __83__ICBaseTextView_StyleAdditions__ic_toggleAttributeWithName_withEmphasisColorType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (*(_QWORD *)(a1 + 32) == *MEMORY[0x1E0D63908])
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      if (!a4)
        v9 = ic_currentEmphasisColorTypeDefault();
      objc_msgSend(v10, "numberWithInteger:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 32));

      ICNSTextHighlightColorSchemeForEmphasisColorType();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC11E0]);

    }
    else
    {
      objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    if (a4)
      v8 = *(_BYTE *)(a1 + 48) == 0;
    else
      v8 = v7 ^ 1u;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 32));

  }
}

- (void)ic_setAttributeWithName:(id)a3 enabled:(BOOL)a4
{
  -[ICBaseTextView ic_setAttributeWithName:enabled:withEmphasisColorType:](self, "ic_setAttributeWithName:enabled:withEmphasisColorType:", a3, a4, 0);
}

- (void)ic_setAttributeWithName:(id)a3 enabled:(BOOL)a4 withEmphasisColorType:(int64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  BOOL v13;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__ICBaseTextView_StyleAdditions__ic_setAttributeWithName_enabled_withEmphasisColorType___block_invoke;
  v10[3] = &unk_1EA7E0048;
  v11 = v8;
  v12 = a5;
  v13 = a4;
  v9 = v8;
  -[ICBaseTextView ic_editAttributesInSelectedRanges:](self, "ic_editAttributesInSelectedRanges:", v10);

}

void __88__ICBaseTextView_StyleAdditions__ic_setAttributeWithName_enabled_withEmphasisColorType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (*(_QWORD *)(a1 + 32) != *MEMORY[0x1E0D63908])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = (void *)v6;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));

    goto LABEL_10;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v9 = ic_currentEmphasisColorTypeDefault();
      v8 = v7;
    }
    objc_msgSend(v8, "numberWithInteger:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v11, "removeObjectForKey:");
LABEL_10:

}

- (void)ic_toggleFontHint:(unsigned int)a3
{
  BOOL v5;
  _QWORD v6[4];
  unsigned int v7;
  BOOL v8;

  v5 = -[ICBaseTextView ic_allSelectedRangesContainFontHint:](self, "ic_allSelectedRangesContainFontHint:");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ICBaseTextView_StyleAdditions__ic_toggleFontHint___block_invoke;
  v6[3] = &__block_descriptor_37_e44_v32__0__NSMutableDictionary_8__NSRange_QQ_16l;
  v7 = a3;
  v8 = v5;
  -[ICBaseTextView ic_editAttributesInSelectedRanges:](self, "ic_editAttributesInSelectedRanges:", v6);
}

void __52__ICBaseTextView_StyleAdditions__ic_toggleFontHint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  unsigned int v17;
  unsigned int v18;
  id v19;

  v6 = (_QWORD *)MEMORY[0x1E0D63918];
  v7 = *MEMORY[0x1E0D63918];
  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (a4)
  {
    v11 = *(_DWORD *)(a1 + 32);
    v12 = v11 | v10;
    v13 = v10 & ~v11;
    if (*(_BYTE *)(a1 + 36))
      v14 = v13;
    else
      v14 = v12;
  }
  else
  {
    v15 = *(_DWORD *)(a1 + 32);
    v16 = (v15 & v10) == 0;
    v17 = v15 | v10;
    v18 = v10 & ~v15;
    if (v16)
      v14 = v17;
    else
      v14 = v18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *v6);

}

- (void)ic_setFontHint:(unsigned int)a3 enabled:(BOOL)a4
{
  _QWORD v4[4];
  unsigned int v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ICBaseTextView_StyleAdditions__ic_setFontHint_enabled___block_invoke;
  v4[3] = &__block_descriptor_37_e44_v32__0__NSMutableDictionary_8__NSRange_QQ_16l;
  v6 = a4;
  v5 = a3;
  -[ICBaseTextView ic_editAttributesInSelectedRanges:](self, "ic_editAttributesInSelectedRanges:", v4);
}

void __57__ICBaseTextView_StyleAdditions__ic_setFontHint_enabled___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  id v12;

  v3 = (_QWORD *)MEMORY[0x1E0D63918];
  v4 = *MEMORY[0x1E0D63918];
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  v8 = *(_DWORD *)(a1 + 32);
  v9 = v8 | v7;
  v10 = v7 & ~v8;
  if (*(_BYTE *)(a1 + 36))
    v11 = v9;
  else
    v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *v3);

}

- (void)ic_editAttributesInSelectedRanges:(id)a3
{
  -[ICBaseTextView ic_editAttributesInSelectedRanges:shouldSkipAttachments:](self, "ic_editAttributesInSelectedRanges:shouldSkipAttachments:", a3, 0);
}

- (void)ic_editAttributesInSelectedRanges:(id)a3 shouldSkipAttachments:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke;
  v8[3] = &unk_1EA7E00B8;
  v10 = a4;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v8);

}

void __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "beginEditing");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "rangeValue");
        v11 = v10;
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "textStorage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke_2;
          v15[3] = &unk_1EA7E0090;
          v20 = *(_BYTE *)(a1 + 48);
          v17 = *(id *)(a1 + 40);
          v18 = v9;
          v19 = v11;
          v16 = v3;
          objc_msgSend(v12, "ic_enumerateAttributesInClampedRange:options:usingBlock:", v9, v11, 0, v15);

          v13 = v17;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v14, "mutableCopy");

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          objc_msgSend(*(id *)(a1 + 32), "setTypingAttributes:", v13);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "endEditing");
}

void __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = (void *)objc_msgSend(a2, "mutableCopy");
  v15 = v7;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 0;
    if (!v11)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v12 = *(void **)(a1 + 32);
      v13 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v12, "setAttributes:range:", v13, a3, a4);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v14 = *(void **)(a1 + 32);
    v8 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v14, "setAttributes:range:", v8, a3, a4);
  }

}

- (void)updateMonostyledLayerForParagraphStyle:(id)a3 inRange:(_NSRange)a4 ioPreviousMonoRect:(CGRect *)a5 ioPreviousBlockQuoteLevel:(unint64_t *)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGRect *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  int v41;
  double v42;
  _QWORD v43[5];
  uint64_t v44;
  double *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  CGRect v50;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICBaseTextView editorController](self, "editorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calculateDocumentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsExpressionFormattingEnabled:", 0);

    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ic_textRangeForRange:", location, length);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0;
    v45 = (double *)&v44;
    v46 = 0x4010000000;
    v47 = &unk_1DDA28851;
    v17 = (CGRect *)MEMORY[0x1E0C9D628];
    v18 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v48 = *MEMORY[0x1E0C9D628];
    v49 = v18;
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __126__ICBaseTextView_StyleAdditions__updateMonostyledLayerForParagraphStyle_inRange_ioPreviousMonoRect_ioPreviousBlockQuoteLevel___block_invoke;
    v43[3] = &unk_1EA7E00E0;
    v43[4] = &v44;
    objc_msgSend(v19, "enumerateTextSegmentsInRange:type:options:usingBlock:", v16, 0, 12, v43);

    -[ICBaseTextView editorController](self, "editorController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calculateDocumentController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setIsExpressionFormattingEnabled:", 1);

    v23 = objc_msgSend(v11, "blockQuoteLevel");
    v25 = v45[4];
    v24 = v45[5];
    v27 = v45[6];
    v26 = v45[7];
    v28 = objc_msgSend(v11, "blockQuoteLevel");
    v29 = *MEMORY[0x1E0D64E38] * (double)v23;
    v30 = v29 + v25;
    v31 = v27 - v29;
    if (v28 == *a6)
    {
      if (!CGRectEqualToRect(*v17, *a5))
      {
        v50.origin.x = v30;
        v50.origin.y = v24;
        v50.size.width = v31;
        v50.size.height = v26;
        *a5 = CGRectUnion(*a5, v50);
LABEL_13:
        _Block_object_dispose(&v44, 8);

        goto LABEL_14;
      }
    }
    else
    {
      -[ICBaseTextView drawMonostyledLayerInRect:](self, "drawMonostyledLayerInRect:", a5->origin.x, a5->origin.y, a5->size.width, a5->size.height);
    }
    a5->origin.x = v30;
    a5->origin.y = v24;
    a5->size.width = v31;
    a5->size.height = v26;
    goto LABEL_13;
  }
  -[ICBaseTextView ic_rectForRange:](self, "ic_rectForRange:", location, length);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  if (objc_msgSend(v11, "isBlockQuote"))
    v40 = *MEMORY[0x1E0D64E38];
  else
    v40 = 0.0;
  v41 = objc_msgSend(v11, "isBlockQuote");
  v42 = v33 + v40;
  if (!v41)
    v42 = 0.0;
  -[ICBaseTextView drawMonostyledLayerInRect:](self, "drawMonostyledLayerInRect:", v42, v35, v37 - v40, v39);
LABEL_14:

}

uint64_t __126__ICBaseTextView_StyleAdditions__updateMonostyledLayerForParagraphStyle_inRange_ioPreviousMonoRect_ioPreviousBlockQuoteLevel___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v6;

  v6.size.height = a5;
  v6.size.width = a4;
  v6.origin.y = a3;
  v6.origin.x = a2;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v6);
  return 1;
}

- (void)updateBlockQuoteLayerForParagraphStyle:(id)a3 inRange:(_NSRange)a4 ioPreviousBlockQuoteRect:(CGRect *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect *v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[5];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  CGRect v37;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICBaseTextView editorController](self, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calculateDocumentController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIsExpressionFormattingEnabled:", 0);

    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_textRangeForRange:", location, length);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x4010000000;
    v34 = &unk_1DDA28851;
    v15 = (CGRect *)MEMORY[0x1E0C9D628];
    v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v35 = *MEMORY[0x1E0C9D628];
    v36 = v16;
    -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __106__ICBaseTextView_StyleAdditions__updateBlockQuoteLayerForParagraphStyle_inRange_ioPreviousBlockQuoteRect___block_invoke;
    v30[3] = &unk_1EA7E00E0;
    v30[4] = &v31;
    objc_msgSend(v17, "enumerateTextSegmentsInRange:type:options:usingBlock:", v14, 0, 12, v30);

    -[ICBaseTextView editorController](self, "editorController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "calculateDocumentController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsExpressionFormattingEnabled:", 1);

    v21 = objc_msgSend(v9, "isRTL");
    v22 = v32[4];
    if (v21)
      v22 = v22 + v32[6];
    v23 = v32[5];
    v24 = v32[7];
    v25 = CGRectEqualToRect(*v15, *a5);
    v26 = 4.0;
    if (!v25)
    {
      v37.size.width = 4.0;
      v37.origin.x = v22;
      v37.origin.y = v23;
      v37.size.height = v24;
      *(CGRect *)(&v26 - 2) = CGRectUnion(*a5, v37);
      v22 = v27;
      v23 = v28;
      v24 = v29;
    }
    a5->origin.x = v22;
    a5->origin.y = v23;
    a5->size.width = v26;
    a5->size.height = v24;
    _Block_object_dispose(&v31, 8);

  }
}

uint64_t __106__ICBaseTextView_StyleAdditions__updateBlockQuoteLayerForParagraphStyle_inRange_ioPreviousBlockQuoteRect___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v6;

  v6.size.height = a5;
  v6.size.width = a4;
  v6.origin.y = a3;
  v6.origin.x = a2;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v6);
  return 1;
}

- (unint64_t)firstValidEmphasisLocationWithinSelection:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  length = a3.length;
  location = a3.location;
  -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_textRangeForRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__ICBaseTextView_StyleAdditions__firstValidEmphasisLocationWithinSelection___block_invoke;
  v11[3] = &unk_1EA7E0108;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateTextSegmentsInRange:type:options:usingBlock:", v7, 0, 12, v11);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __76__ICBaseTextView_StyleAdditions__firstValidEmphasisLocationWithinSelection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_rangeForTextRange:", v4);
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICProtocolCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !v11 || objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v11))
  {
    v12 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)updateStyleLayersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[10];
  _QWORD v21[4];
  __int128 v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[4];
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;

  length = a3.length;
  location = a3.location;
  -[ICBaseTextView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[ICBaseTextView renderingSurfaceView](self, "renderingSurfaceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      return;
  }
  -[ICBaseTextView textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[ICBaseTextView renderingSurfaceView](self, "renderingSurfaceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSublayers:", 0);

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x4010000000;
    v29[3] = &unk_1DDA28851;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v30 = *MEMORY[0x1E0C9D628];
    v31 = v13;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x4010000000;
    v26[3] = &unk_1DDA28851;
    v27 = v30;
    v28 = v13;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3010000000;
    v21[3] = &unk_1DDA28851;
    v22 = xmmword_1DD9E6F90;
    if (!length)
    {
      -[ICBaseTextView textStorage](self, "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      location = objc_msgSend(v14, "ic_range");
      length = v15;

    }
    -[ICBaseTextView textStorage](self, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__ICBaseTextView_StyleAdditions__updateStyleLayersInRange___block_invoke;
    v20[3] = &unk_1EA7E0130;
    v20[4] = self;
    v20[5] = v21;
    v20[6] = v29;
    v20[7] = v25;
    v20[8] = v23;
    v20[9] = v26;
    objc_msgSend(v17, "ic_enumerateParagraphsInRange:usingBlock:", location, length, v20);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    -[ICBaseTextView renderingSurfaceView](self, "renderingSurfaceView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSublayers:", 0);

  }
}

void __59__ICBaseTextView_StyleAdditions__updateStyleLayersInRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3 - a2;
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a2, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 && objc_msgSend(v23, "style") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateMonostyledLayerForParagraphStyle:inRange:ioPreviousMonoRect:ioPreviousBlockQuoteLevel:", v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  else if (!NSIsEmptyRect(*(NSRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "drawMonostyledLayerInRect:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v7 + 32) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v7 + 48) = v8;
  }
  if (!NSIsEmptyRect(*(NSRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ic_range");
    v13 = v11 + v12;

    if (v9 == v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "drawMonostyledLayerInRect:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v14 + 32) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v14 + 48) = v15;
    }
  }
  if (v23 && objc_msgSend(v23, "blockQuoteLevel"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v23, "blockQuoteLevel");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v23, "style") == 4;
    objc_msgSend(*(id *)(a1 + 32), "updateBlockQuoteLayerForParagraphStyle:inRange:ioPreviousBlockQuoteRect:", v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    goto LABEL_18;
  }
  if (!NSIsEmptyRect(*(NSRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32)))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
LABEL_17:
    objc_msgSend(*(id *)(a1 + 32), "drawBlockQuoteAndCleanup:pendingBlockQuoteLevelToDraw:pendingBlockQuoteRectToDraw:ps:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, v17 + 24, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32, v23);
    goto LABEL_18;
  }
  if (v23)
  {
    v16 = objc_msgSend(v23, "blockQuoteLevel");
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v16 != *(_QWORD *)(v17 + 24))
      goto LABEL_17;
  }
LABEL_18:
  if (!NSIsEmptyRect(*(NSRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32)))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
        + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "ic_range");
    v22 = v20 + v21;

    if (v18 == v22)
      objc_msgSend(*(id *)(a1 + 32), "drawBlockQuoteAndCleanup:pendingBlockQuoteLevelToDraw:pendingBlockQuoteRectToDraw:ps:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32, v23);
  }

}

- (void)drawMonostyledLayerInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(MEMORY[0x1E0DC3658], "ICMonostyledBackgroundColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  LODWORD(v9) = 0.25;
  objc_msgSend(v15, "setOpacity:", v9);
  objc_msgSend(v15, "setCornerRadius:", 10.0);
  objc_msgSend(v15, "setBorderWidth:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "ICMonostyledBorderColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setBorderColor:", objc_msgSend(v10, "CGColor"));

  objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  -[ICBaseTextView ic_textContainerOrigin](self, "ic_textContainerOrigin");
  objc_msgSend(v15, "setFrame:", x + v11, y + v12 - *MEMORY[0x1E0D64E40], width, height + *MEMORY[0x1E0D64E30] + 2.0);
  -[ICBaseTextView renderingSurfaceView](self, "renderingSurfaceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", v15);

}

- (void)drawBlockQuoteAndCleanup:(BOOL *)a3 pendingBlockQuoteLevelToDraw:(unint64_t *)a4 pendingBlockQuoteRectToDraw:(CGRect *)a5 ps:(id)a6
{
  unint64_t v10;
  _BOOL8 v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  CGSize v17;
  unint64_t v18;

  v10 = *a4;
  v11 = *a3;
  x = a5->origin.x;
  y = a5->origin.y;
  width = a5->size.width;
  height = a5->size.height;
  v16 = a6;
  -[ICBaseTextView drawBlockQuoteLayerInRectForTK2:blockQuoteLevel:isMonostyled:](self, "drawBlockQuoteLayerInRectForTK2:blockQuoteLevel:isMonostyled:", v10, v11, x, y, width, height);
  v17 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  a5->origin = (CGPoint)*MEMORY[0x1E0C9D628];
  a5->size = v17;
  v18 = objc_msgSend(v16, "blockQuoteLevel");

  *a4 = v18;
  *a3 = 0;
}

- (void)drawBlockQuoteLayerInRectForTK2:(CGRect)a3 blockQuoteLevel:(int64_t)a4 isMonostyled:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  id v21;
  id v22;
  double v23;
  void *v24;
  void *v25;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICBaseTextView ic_textContainerOrigin](self, "ic_textContainerOrigin");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(MEMORY[0x1E0DC1290], "ic_isRTL");
  if (a4)
  {
    if (v16)
      v17 = x;
    else
      v17 = 5.0;
    v18 = *MEMORY[0x1E0CD2A68];
    if (v5)
      v19 = y + v15 + -5.0;
    else
      v19 = y + v15;
    if (v5)
      height = height + 10.0;
    v20 = 1;
    do
    {
      v21 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      objc_msgSend(MEMORY[0x1E0DC3658], "ICBlockQuoteBackgroundColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "setBackgroundColor:", objc_msgSend(v22, "CGColor"));

      LODWORD(v23) = 1.0;
      objc_msgSend(v21, "setOpacity:", v23);
      objc_msgSend(v21, "setCornerRadius:", 2.0);
      objc_msgSend(v21, "setCornerCurve:", v18);
      objc_msgSend(v21, "setFrame:", v17 + v13 + (float)((float)(v20 - 1) * 13.0), v19, width, height);
      -[ICBaseTextView renderingSurfaceView](self, "renderingSurfaceView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSublayer:", v21);

      ++v20;
    }
    while (v20 <= a4);
  }
}

- (id)pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (!-[ICBaseTextView supportsAttachments](self, "supportsAttachments"))
  {
    objc_msgSend(v6, "ic_stringWithoutAttachments");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  if (!objc_msgSend(v6, "length"))
    goto LABEL_7;
  if (-[ICBaseTextView exceedsMaxLengthIfSelectionReplacedWithAttributedString:](self, "exceedsMaxLengthIfSelectionReplacedWithAttributedString:", v6))
  {
    if ((objc_msgSend(v7, "didWarnAboutExceedingMaxLength") & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "warnUserNoteLengthExceeded");

      objc_msgSend(v7, "setDidWarnAboutExceedingMaxLength:", 1);
    }
LABEL_7:

    v6 = 0;
    goto LABEL_10;
  }
  if (v6)
    -[ICBaseTextView _pasteAttributedString:pasteAsRichText:](self, "_pasteAttributedString:pasteAsRichText:", v6, 1);
LABEL_10:

  return v6;
}

- (BOOL)exceedsMaxLengthIfSelectionReplacedWithAttributedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;

  v4 = a3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = objc_msgSend(v4, "length");
  -[ICBaseTextView selectedRange](self, "selectedRange");
  v9 = v8;

  v10 = objc_msgSend(v4, "length");
  -[ICBaseTextView selectedRange](self, "selectedRange");
  if (v10 <= v11)
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    v12 = v7 + v6 - v9;
    -[ICBaseTextView icDelegate](self, "icDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "allowsNewTextLength:", v12) ^ 1;

  }
  return v14;
}

- (id)pasteNotePasteboardData:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  os_log_t v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  ICBaseTextView *v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[16];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__13;
  v48 = __Block_byref_object_dispose__13;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__13;
  v42 = __Block_byref_object_dispose__13;
  v43 = 0;
  objc_msgSend(v8, "attributedStringData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  objc_msgSend(v8, "dataPersister");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "accumulatedDataSize");
  -[ICBaseTextView editorController](self, "editorController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShouldAddMediaAsynchronously:", (unint64_t)(v13 + v11) > *MEMORY[0x1E0D63D78]);

  -[ICBaseTextView editorController](self, "editorController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "note");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedStringData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v17, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v18, "length"));

  if ((_DWORD)v11)
  {
    if ((objc_msgSend(v9, "didWarnAboutAttachmentSizeExceeded") & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "warnUserAttachmentSizeExceededWithAttachmentCount:", 1);

      objc_msgSend(v9, "setDidWarnAboutAttachmentSizeExceeded:", 1);
    }
  }
  else
  {
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __72__ICBaseTextView_PasteUtilities__pasteNotePasteboardData_session_error___block_invoke;
    v32[3] = &unk_1EA7E0250;
    v36 = &v38;
    v33 = v8;
    v34 = self;
    v37 = &v44;
    v35 = v9;
    objc_msgSend(v20, "saveSelectionDuringBlock:affinity:", v32, 1);

  }
  if (!v39[5])
  {
    v23 = (void *)v45[5];
    if (v23)
    {
      v24 = objc_msgSend(v23, "code");
      if (v24 == 205)
      {
        if ((objc_msgSend(v9, "didWarnAboutNotSupportedForPasswordProtectedNotes") & 1) != 0)
          goto LABEL_6;
        objc_msgSend((id)v45[5], "userInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D63F50]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          v28 = objc_msgSend(v27, "unsignedIntegerValue");
        else
          v28 = 1;
        objc_msgSend(MEMORY[0x1E0D64B30], "cannotAddAttachmentsInfoAlertWithAttachmentCount:", v28);
        v29 = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[ICBaseTextView window](self, "window");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject presentInWindow:completionHandler:](v29, "presentInWindow:completionHandler:", v31, 0);

        objc_msgSend(v9, "setDidWarnAboutNotSupportedForPasswordProtectedNotes:", 1);
      }
      else
      {
        if (v24 == 202)
        {
          if ((objc_msgSend(v9, "didWarnAboutAttachmentLimitExceeded") & 1) == 0)
          {
            -[ICBaseTextView editorController](self, "editorController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "warnUserAttachmentLimitExceeded");

            objc_msgSend(v9, "setDidWarnAboutAttachmentLimitExceeded:", 1);
          }
          goto LABEL_6;
        }
        v29 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v45[5], "description");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICBaseTextView(PasteUtilities) pasteNotePasteboardData:session:error:].cold.1(v30, buf, v29);
        }
        v27 = v29;
      }

    }
  }
LABEL_6:
  if (a5)
    *a5 = objc_retainAutorelease((id)v45[5]);
  v21 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v21;
}

void __72__ICBaseTextView_PasteUtilities__pasteNotePasteboardData_session_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v2 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(*(id *)(a1 + 32), "attributedStringData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataPersister");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:error:", v3, v4, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:session:", v11, *(_QWORD *)(a1 + 48));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (id)pasteImagesDataArray:(id)a3 typesArray:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  ICBaseTextView *v31;
  id v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a4;
  v27 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__13;
  v42 = __Block_byref_object_dispose__13;
  v43 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v8;
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
        -[ICBaseTextView editorController](self, "editorController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "note");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v14, "length"));

        if (v17)
        {
          v22 = objc_msgSend(v27, "didWarnAboutAttachmentSizeExceeded");
          v21 = v9;
          if ((v22 & 1) == 0)
          {
            -[ICBaseTextView editorController](self, "editorController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "warnUserAttachmentSizeExceededWithAttachmentCount:", objc_msgSend(v9, "count"));

            objc_msgSend(v27, "setDidWarnAboutAttachmentSizeExceeded:", 1);
            v21 = v9;
          }
          goto LABEL_12;
        }
        v10 += objc_msgSend(v14, "length");
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[ICBaseTextView editorController](self, "editorController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "note");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldAddMediaAsynchronously:", v10 > *MEMORY[0x1E0D63D78]);

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke;
  v28[3] = &unk_1EA7E02C8;
  v29 = v9;
  v30 = v26;
  v31 = self;
  v32 = v27;
  v33 = &v38;
  objc_msgSend(v20, "saveSelectionDuringBlock:affinity:", v28, 1);

  v21 = v29;
LABEL_12:

  v24 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  v25 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_2;
  v15 = &unk_1EA7E02A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v16 = v3;
  v17 = v4;
  v18 = v5;
  v19 = &v20;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v12);
  objc_msgSend(*(id *)(a1 + 56), "setNumberOfImagesPasted:", objc_msgSend(*(id *)(a1 + 56), "numberOfImagesPasted") + objc_msgSend(*(id *)(a1 + 32), "count", v12, v13, v14, v15));
  v6 = objc_msgSend((id)v21[5], "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 48), "pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:session:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  _Block_object_dispose(&v20, 8);
}

void __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__13;
  v31 = __Block_byref_object_dispose__13;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v32 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canAddAttachment");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 >= 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_3;
      v26[3] = &unk_1EA7E0278;
      v26[4] = &v27;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);

    }
    objc_msgSend(MEMORY[0x1E0D639F0], "filenameExtensionForUTI:", v28[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Pasted Image %lu"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v16, objc_msgSend(*(id *)(a1 + 48), "numberOfImagesPasted") + a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringByAppendingPathExtension:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "editorController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "note");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttachmentWithData:filename:", v5, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D64D98], "textAttachmentWithAttachment:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendAttributedString:", v24);

  }
  else if ((objc_msgSend(*(id *)(a1 + 48), "didWarnAboutAttachmentLimitExceeded") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "warnUserAttachmentLimitExceeded");

    objc_msgSend(*(id *)(a1 + 48), "setDidWarnAboutAttachmentLimitExceeded:", 1);
  }
  _Block_object_dispose(&v27, 8);

}

void __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC520]);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)pasteURL:(id)a3 uti:(id)a4 name:(id)a5 metadata:(id)a6 session:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  ICBaseTextView *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICBaseTextView editorController](self, "editorController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "note");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "canAddAttachment") & 1) != 0)
  {

    goto LABEL_7;
  }
  v19 = objc_msgSend(v12, "isFileURL");

  if (!v19)
  {
LABEL_7:
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__13;
    v42 = __Block_byref_object_dispose__13;
    v43 = 0;
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __69__ICBaseTextView_PasteUtilities__pasteURL_uti_name_metadata_session___block_invoke;
    v29 = &unk_1EA7E02F0;
    v30 = v12;
    v31 = self;
    v36 = &v44;
    v32 = v13;
    v33 = v15;
    v34 = v14;
    v37 = &v38;
    v23 = v16;
    v35 = v23;
    objc_msgSend(v22, "saveSelectionDuringBlock:affinity:", &v26, 1);

    if (*((_BYTE *)v45 + 24)
      && (objc_msgSend(v23, "didWarnAboutAttachmentSizeExceeded", v26, v27, v28, v29, v30, v31, v32, v33, v34) & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "warnUserAttachmentSizeExceededWithAttachmentCount:", 1);

      objc_msgSend(v23, "setDidWarnAboutAttachmentSizeExceeded:", 1);
    }
    v21 = (id)v39[5];

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v44, 8);
    goto LABEL_11;
  }
  if ((objc_msgSend(v16, "didWarnAboutAttachmentLimitExceeded") & 1) == 0)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "warnUserAttachmentLimitExceeded");

    objc_msgSend(v16, "setDidWarnAboutAttachmentLimitExceeded:", 1);
  }
  v21 = 0;
LABEL_11:

  return v21;
}

void __69__ICBaseTextView_PasteUtilities__pasteURL_uti_name_metadata_session___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;

  if (!objc_msgSend(*(id *)(a1 + 32), "ic_isSupportedAsAttachment"))
  {
LABEL_5:
    v4 = objc_alloc(MEMORY[0x1E0CB3778]);
    v5 = v4;
    if (*(_QWORD *)(a1 + 64))
    {
      v6 = (void *)objc_msgSend(v4, "initWithString:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "initWithString:", v7);

    }
    v8 = *MEMORY[0x1E0DC1160];
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v6, "length"));

    v10 = objc_msgSend(v6, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "canAddAttachment")
    || objc_msgSend(*(id *)(a1 + 32), "ic_isWebURL"))
  {

    goto LABEL_5;
  }
  v17 = objc_msgSend(*(id *)(a1 + 40), "supportsAttachments");

  if (!v17)
    goto LABEL_5;
  if (objc_msgSend(*(id *)(a1 + 32), "isFileURL"))
  {
    v18 = *(void **)(a1 + 32);
    v33 = 0;
    objc_msgSend(v18, "getResourceValue:forKey:error:", &v33, *MEMORY[0x1E0C99998], 0);
    v19 = v33;
    v20 = v19;
    if (v19)
      v21 = objc_msgSend(v19, "unsignedIntegerValue");
    else
      v21 = 0;
    objc_msgSend(*(id *)(a1 + 40), "editorController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "note");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "attachmentExceedsMaxSizeAllowed:", v21);

    if (v25)
    {
      v6 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_25;
    }
    v26 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "editorController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "note");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26)
      objc_msgSend(v27, "addAttachmentWithUTI:withURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v27, "addAttachmentWithFileURL:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "editorController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addURLAttachmentWithURL:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_25:
  if (v6)
  {
    if (*(_QWORD *)(a1 + 56))
      objc_msgSend(v6, "setMetadata:");
    if (objc_msgSend(*(id *)(a1 + 64), "length"))
      objc_msgSend(v6, "setTitle:", *(_QWORD *)(a1 + 64));
    objc_msgSend(MEMORY[0x1E0D64D98], "textAttachmentWithAttachment:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

  }
LABEL_9:

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:session:", v13, *(_QWORD *)(a1 + 72));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (id)pasteStringUsingBlock:(id)a3 approxPasteString:(id)a4 pasteboardTypes:(id)a5 session:(id)a6
{
  void (**v10)(_QWORD);
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v46;
  unint64_t v47;
  id v48;
  void (**v49)(_QWORD);

  v10 = (void (**)(_QWORD))a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v16 = v15;
  if (objc_msgSend(v11, "length") <= v15)
    goto LABEL_3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");
  v19 = v18 - v16 + objc_msgSend(v11, "length");

  -[ICBaseTextView icDelegate](self, "icDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v20, "allowsNewTextLength:", v19);

  if ((v19 & 1) != 0)
  {
LABEL_3:
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFilterPastedAttributes:", 1);

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConvertAttributes:", 1);

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPasteboardTypes:", v12);

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    v10[2](v10);
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    v47 = v27 - v25 + v16;
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v49 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "attributedSubstringFromRange:", v14, v47);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "string");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v48 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPasteboardTypes:", 0);

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setConvertAttributes:", 0);

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFilterPastedAttributes:", 0);

    objc_opt_class();
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v33 = v16;
    v34 = v14;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "styler");
    v36 = v13;
    v37 = v11;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v37;
    v13 = v36;

    objc_msgSend(v39, "insertedText:replacementRange:inTextView:languageHasSpaces:", v46, v34, v33, self, -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces"));
    if (v27 >= v47 + v34)
      v40 = v47 + v34;
    else
      v40 = v27;
    -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v40, 0);
    v41 = -[ICBaseTextView selectedRange](self, "selectedRange");
    -[ICBaseTextView scrollRangeToVisible:](self, "scrollRangeToVisible:", v41, v42);
    -[ICBaseTextView informDelegateOfPastedAttributedString:](self, "informDelegateOfPastedAttributedString:", v29);

    v12 = v48;
    v10 = v49;
  }
  else
  {
    if ((objc_msgSend(v13, "didWarnAboutExceedingMaxLength") & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "warnUserNoteLengthExceeded");

      objc_msgSend(v13, "setDidWarnAboutExceedingMaxLength:", 1);
    }
    if ((objc_msgSend(v13, "didWarnAboutExceedingMaxLength") & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "warnUserNoteLengthExceeded");

      objc_msgSend(v13, "setDidWarnAboutExceedingMaxLength:", 1);
    }
    v29 = 0;
  }

  return v29;
}

- (ICBaseTextView)initWithCoder:(id)a3
{
  ICBaseTextView *v3;
  ICBaseTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  v3 = -[ICBaseTextView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICBaseTextView commonInit](v3, "commonInit");
  return v4;
}

void __28__ICBaseTextView_commonInit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id to;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    v8 = objc_loadWeakRetained(&to);
    objc_msgSend(v8, "renderingSurfaceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addRenderingSurface:key:group:placement:", v9, CFSTR("RenderingSurfaceView"), 1, 1);

  }
  objc_destroyWeak(&to);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView dealloc](&v4, sel_dealloc);
}

- (id)textController
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ICLayoutManager)icLayoutManager
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICBaseTextView layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICLayoutManager *)v4;
}

- (ICTK2TextLayoutManager)icTextLayoutManager
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICBaseTextView textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTK2TextLayoutManager *)v4;
}

- (ICTTTextStoragePersistenceHelper)persistenceHelper
{
  void *v2;
  void *v3;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextStoragePersistenceHelper *)v3;
}

- (BOOL)supportsAttachments
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  ICEmptyTextSelectionRect *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICBaseTextView textSelectionHidden](self, "textSelectionHidden"))
  {
    v5 = objc_alloc_init(ICEmptyTextSelectionRect);
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView selectionRectsForRange:](&v8, sel_selectionRectsForRange_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (CALayer)tempHighlightLayer
{
  CALayer *tempHighlightLayer;
  CALayer *v4;
  CALayer *v5;
  id v6;
  void *v7;

  tempHighlightLayer = self->_tempHighlightLayer;
  if (!tempHighlightLayer)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v5 = self->_tempHighlightLayer;
    self->_tempHighlightLayer = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBorderColor:](self->_tempHighlightLayer, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    -[CALayer setBorderWidth:](self->_tempHighlightLayer, "setBorderWidth:", 1.0);
    -[ICBaseTextView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", self->_tempHighlightLayer);

    tempHighlightLayer = self->_tempHighlightLayer;
  }
  return tempHighlightLayer;
}

- (CALayer)tempHighlightLayerIfExists
{
  return self->_tempHighlightLayer;
}

- (id)singleSelectedAttachment
{
  return 0;
}

- (BOOL)selectionSupportsFindInNote
{
  return 0;
}

- (id)attachmentsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;

  length = a3.length;
  location = a3.location;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICBaseTextView textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__ICBaseTextView_attachmentsInRange___block_invoke;
  v11[3] = &unk_1EA7DDC18;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v11);

  return v9;
}

void __37__ICBaseTextView_attachmentsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_addNonNilObject:", v5);

}

- (id)textAttachmentsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;

  length = a3.length;
  location = a3.location;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICBaseTextView textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__ICBaseTextView_textAttachmentsInRange___block_invoke;
  v11[3] = &unk_1EA7DDC18;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v11);

  return v9;
}

void __41__ICBaseTextView_textAttachmentsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v4);
}

- (BOOL)canBecomeFirstResponder
{
  unsigned __int8 v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v9.receiver = self;
    v9.super_class = (Class)ICBaseTextView;
    return -[ICBaseTextView canBecomeFirstResponder](&v9, sel_canBecomeFirstResponder);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICBaseTextView;
    v4 = -[ICBaseTextView canBecomeFirstResponder](&v8, sel_canBecomeFirstResponder);
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      objc_opt_class();
      -[ICBaseTextView layoutManager](self, "layoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isRenderingPreviewForDragAndDrop") ^ 1;

    }
    return v4 & v5;
  }
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  objc_super v11;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "modalPresentationStyle");
  if (-[ICBaseTextView isEditable](self, "isEditable"))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEditable");

    if (!v8 || v5 == 5)
      -[ICBaseTextView setEditable:](self, "setEditable:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)ICBaseTextView;
  v9 = -[ICBaseTextView becomeFirstResponder](&v11, sel_becomeFirstResponder);
  -[ICBaseTextView keyboardLocaleChanged:](self, "keyboardLocaleChanged:", 0);

  return v9;
}

- (id)firstResponderMatchingPredicate:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;

  v4 = (uint64_t (**)(id, void *))a3;
  -[ICBaseTextView firstResponder](self, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    do
    {
      if ((v4[2](v4, v5) & 1) != 0)
        break;
      objc_msgSend(v5, "nextResponder");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }

  return v5;
}

- (void)toggleBoldface:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConvertAttributes:", 1);

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView toggleBoldface:](&v7, sel_toggleBoldface_, v4);
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConvertAttributes:", 0);

  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 6, v4);
}

- (void)toggleItalics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConvertAttributes:", 1);

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView toggleItalics:](&v7, sel_toggleItalics_, v4);
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConvertAttributes:", 0);

  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 7, v4);
}

- (void)toggleUnderline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConvertAttributes:", 1);

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView toggleUnderline:](&v7, sel_toggleUnderline_, v4);
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConvertAttributes:", 0);

  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 8, v4);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConvertAttributes:", 1);
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView makeTextWritingDirectionLeftToRight:](&v8, sel_makeTextWritingDirectionLeftToRight_, v4);
  objc_msgSend(v5, "styler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserChangedWritingDirection:", 1);
  -[ICBaseTextView editorController](self, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textViewDidChange:", self);

  objc_msgSend(v5, "setConvertAttributes:", 0);
  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 10, v4);

}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConvertAttributes:", 1);
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView makeTextWritingDirectionRightToLeft:](&v8, sel_makeTextWritingDirectionRightToLeft_, v4);
  objc_msgSend(v5, "styler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserChangedWritingDirection:", 1);
  -[ICBaseTextView editorController](self, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textViewDidChange:", self);

  objc_msgSend(v5, "setConvertAttributes:", 0);
  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 10, v4);

}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3AC0];
  v6 = -[ICBaseTextView _dataOwnerForPaste](self, "_dataOwnerForPaste");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __24__ICBaseTextView_paste___block_invoke;
  v8[3] = &unk_1EA7DD498;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "_performAsDataOwner:block:", v6, v8);

}

uint64_t __24__ICBaseTextView_paste___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICBaseTextViewPasteSession *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  id v44;
  objc_super v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pasteDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "TTTextStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsReadingSelectionFromPasteboard:", 1);

    objc_msgSend(*(id *)(a1 + 32), "TTTextStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "breakUndoCoalescing");

    objc_msgSend(*(id *)(a1 + 32), "TTTextStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginEditing");

    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = *MEMORY[0x1E0D637F0];
    v8 = v47[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemSetWithPasteboardTypes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dataForPasteboardType:inItemSet:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D63BD8], "pasteboardDataFromPersistenceData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_alloc_init(ICBaseTextViewPasteSession);
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextViewPasteSession setPreviousShouldAddMediaAsynchronously:](v14, "setPreviousShouldAddMediaAsynchronously:", objc_msgSend(v16, "shouldAddMediaAsynchronously"));

    if (v13)
    {
      v17 = *(void **)(a1 + 32);
      v44 = 0;
      objc_msgSend(v17, "pasteNotePasteboardData:session:error:", v13, v14, &v44);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v44;
      if (!v18)
      {
LABEL_9:
        objc_msgSend(*(id *)(a1 + 32), "TTTextStorage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endEditing");

        objc_msgSend(*(id *)(a1 + 32), "TTTextStorage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setIsReadingSelectionFromPasteboard:", 0);

        objc_msgSend(*(id *)(a1 + 32), "editorController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "note");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "save");

        return objc_msgSend(*(id *)(a1 + 32), "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 3, *(_QWORD *)(a1 + 40));
      }
    }
    else
    {
      v40 = v10;
      v29 = (void *)*MEMORY[0x1E0CEC520];
      objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemSetWithPasteboardTypes:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataForPasteboardType:inItemSet:", v33, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v34, "count"))
      {
        objc_msgSend(v7, "pasteboardTypesForItemSet:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pasteImagesDataArray:typesArray:session:", v34, v35, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "string");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __24__ICBaseTextView_paste___block_invoke_2;
        v41[3] = &unk_1EA7DD498;
        v36 = *(void **)(a1 + 32);
        v37 = *(id *)(a1 + 40);
        v38 = *(_QWORD *)(a1 + 32);
        v42 = v37;
        v43 = v38;
        objc_msgSend(v7, "pasteboardTypes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "pasteStringUsingBlock:approxPasteString:pasteboardTypes:session:", v41, v35, v39, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
      v10 = v40;
      if (!v18)
        goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "icaxTextDidChange");
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateChangeCountWithReason:", CFSTR("Pasted string"));

    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "note");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "save");

    objc_msgSend(*(id *)(a1 + 32), "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x1E0CF45D8]);
    goto LABEL_9;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v45.receiver = *(id *)(a1 + 32);
  v45.super_class = (Class)ICBaseTextView;
  objc_msgSendSuper2(&v45, sel_paste_, v3);
  return objc_msgSend(*(id *)(a1 + 32), "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 3, *(_QWORD *)(a1 + 40));
}

id __24__ICBaseTextView_paste___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ICBaseTextView;
  return objc_msgSendSuper2(&v3, sel_paste_, v1);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  unsigned __int8 v13;
  Class v14;
  void *v15;
  void *v17;
  ICBaseTextView *v18;
  objc_super v19;
  objc_super v20;
  _QWORD v21[5];
  objc_super v22;
  objc_super v23;
  objc_super v24;

  v6 = a4;
  -[ICBaseTextView icDelegate](self, "icDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICBaseTextView icDelegate](self, "icDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldShowMenuItems");

    if (!v9)
      goto LABEL_26;
  }
  else
  {

  }
  if (NSSelectorFromString(CFSTR("_showTextFormattingOptions:")) == a3)
    goto LABEL_26;
  if (sel_copy_ == a3 || sel_cut_ == a3)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICBaseTextView;
    if (-[ICBaseTextView canPerformAction:withSender:](&v24, sel_canPerformAction_withSender_, a3, v6))
    {
      v13 = -[ICBaseTextView isSelectionCopyableSize](self, "isSelectionCopyableSize");
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  if (sel__share_ == a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)ICBaseTextView;
    if (!-[ICBaseTextView canPerformAction:withSender:](&v23, sel_canPerformAction_withSender_, a3, v6)
      || !-[ICBaseTextView isSelectionCopyableSize](self, "isSelectionCopyableSize"))
    {
      goto LABEL_26;
    }
    LODWORD(self) = -[ICBaseTextView ic_isInSecureWindow](self, "ic_isInSecureWindow") ^ 1;
    goto LABEL_27;
  }
  -[ICBaseTextView singleSelectedAttachment](self, "singleSelectedAttachment");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    if (NSSelectorFromString(CFSTR("_define:")) == a3)
    {

      goto LABEL_26;
    }
    v12 = NSSelectorFromString(CFSTR("_promptForReplace:"));

    if (v12 == a3)
    {
LABEL_26:
      LOBYTE(self) = 0;
      goto LABEL_27;
    }
  }
  if (sel_toggleStrikethrough == a3)
  {
    v22.receiver = self;
    v22.super_class = (Class)ICBaseTextView;
    v13 = -[ICBaseTextView canPerformAction:withSender:](&v22, sel_canPerformAction_withSender_, sel_toggleBoldface_, v6);
    goto LABEL_23;
  }
  if (sel__findSelected_ == a3)
  {
    if (-[ICBaseTextView selectionSupportsFindInNote](self, "selectionSupportsFindInNote"))
    {
      v14 = NSClassFromString(CFSTR("ICPaperDocumentTextAttachmentView"));
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __46__ICBaseTextView_canPerformAction_withSender___block_invoke;
      v21[3] = &__block_descriptor_40_e21_B16__0__UIResponder_8lu32l8;
      v21[4] = v14;
      -[ICBaseTextView firstResponderMatchingPredicate:](self, "firstResponderMatchingPredicate:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = v15 == 0;

      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (sel_captureTextFromCamera_ != a3)
  {
    v19.receiver = self;
    v19.super_class = (Class)ICBaseTextView;
    v13 = -[ICBaseTextView canPerformAction:withSender:](&v19, sel_canPerformAction_withSender_, a3, v6);
LABEL_23:
    LOBYTE(self) = v13;
    goto LABEL_27;
  }
  objc_opt_class();
  -[ICBaseTextView firstResponder](self, "firstResponder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v18 = (ICBaseTextView *)objc_claimAutoreleasedReturnValue();

  if (v18
    && v18 != self
    && -[ICBaseTextView isDescendantOfView:](v18, "isDescendantOfView:", self)
    && (-[ICBaseTextView conformsToProtocol:](v18, "conformsToProtocol:", &unk_1F0435998) & 1) != 0)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICBaseTextView;
    LOBYTE(self) = -[ICBaseTextView canPerformAction:withSender:](&v20, sel_canPerformAction_withSender_, a3, v6);
  }

LABEL_27:
  return (char)self;
}

uint64_t __46__ICBaseTextView_canPerformAction_withSender___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isDocumentCopyableSize
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ic_isCopyableSize");

  return v5;
}

- (BOOL)isSelectionCopyableSize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergeableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICBaseTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v8, "ic_isCopyableSize");
  return (char)v3;
}

- (BOOL)selectionContainsDDResultAttribute
{
  BOOL v3;
  void *v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL result;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  if ((-[ICBaseTextView isEditing](self, "isEditing") & 1) != 0)
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ICBaseTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v5 = (id *)getDDResultAttributeNameSymbolLoc_ptr;
  v20 = getDDResultAttributeNameSymbolLoc_ptr;
  v6 = MEMORY[0x1E0C809B0];
  if (!getDDResultAttributeNameSymbolLoc_ptr)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getDDResultAttributeNameSymbolLoc_block_invoke;
    v16[3] = &unk_1EA7DECF8;
    v16[4] = &v17;
    __getDDResultAttributeNameSymbolLoc_block_invoke((uint64_t)v16);
    v5 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v5)
  {
    v7 = *v5;
    v8 = -[ICBaseTextView selectedRange](self, "selectedRange");
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __52__ICBaseTextView_selectionContainsDDResultAttribute__block_invoke;
    v11[3] = &unk_1EA7DD260;
    v11[4] = &v12;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v7, v8, v9, 0, v11);

    v3 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
    return v3;
  }
  dlerror();
  result = abort_report_np();
  __break(1u);
  return result;
}

uint64_t __52__ICBaseTextView_selectionContainsDDResultAttribute__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)copy:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = (void *)MEMORY[0x1E0DC3AC0];
  v5 = -[ICBaseTextView _dataOwnerForCopy](self, "_dataOwnerForCopy", a3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __23__ICBaseTextView_copy___block_invoke;
  v6[3] = &unk_1EA7DD2D8;
  v6[4] = self;
  objc_msgSend(v4, "_performAsDataOwner:block:", v5, v6);
}

void __23__ICBaseTextView_copy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v43 = objc_msgSend(*(id *)(a1 + 32), "selectionContainsDDResultAttribute");
  if (v43)
    objc_msgSend(*(id *)(a1 + 32), "ic_resetDataDetectorsResults");
  objc_msgSend(*(id *)(a1 + 32), "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistenceHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  v41 = v7;
  v42 = v6;
  objc_msgSend(*(id *)(a1 + 32), "textController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  v11 = objc_msgSend(v8, "extendedSelectionRangeForCollapsedSectionHeadingWithRange:textView:", v9, v10, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", v11, v12);

  v13 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  v15 = v14;
  v16 = (void *)*MEMORY[0x1E0CEC658];
  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v2;
  v19 = objc_msgSend(v2, "copyDataForUTI:range:persistenceHelper:", v17, v13, v15, v3);

  if (v19)
  {
    objc_msgSend(v16, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v20);

  }
  v44 = (void *)v4;
  v21 = (void *)*MEMORY[0x1E0CEC518];
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v18, "copyDataForUTI:range:persistenceHelper:", v22, v13, v15, v3);

  if (v23)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 4);
    objc_msgSend(v21, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v25);

  }
  v40 = (void *)v19;
  v26 = (void *)*MEMORY[0x1E0CEC4E8];
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v18, "copyDataForUTI:range:persistenceHelper:", v27, v13, v15, v3);

  if (v28)
  {
    objc_msgSend(v26, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, v29);

  }
  v30 = (void *)*MEMORY[0x1E0CEC630];
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v18, "copyDataForUTI:range:persistenceHelper:", v31, v13, v15, v3);

  if (v32)
  {
    objc_msgSend(v30, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, v33);

  }
  v34 = *MEMORY[0x1E0D637F0];
  v35 = (void *)objc_msgSend(v18, "copyDataForUTI:range:persistenceHelper:", *MEMORY[0x1E0D637F0], v13, v15, v3);
  if (v35)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, v34);
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("iOS rich content paste pasteboard type"));

  v45[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setItems:", v37);

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x1E0CF45A0]);
  if (v43)
    objc_msgSend(*(id *)(a1 + 32), "ic_startDataDetectors");
  if (v42 != objc_msgSend(*(id *)(a1 + 32), "selectedRange") || v41 != v38)
    objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:");

}

- (void)cut:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v7 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __22__ICBaseTextView_cut___block_invoke;
  v9[3] = &unk_1EA7DE8D0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 1, v5, v7, v9);

}

uint64_t __22__ICBaseTextView_cut___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reallyCut:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_reallyCut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ICBaseTextView *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  ICBaseTextView *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  -[ICBaseTextView copy:](self, "copy:", v4);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__22;
  v23[4] = __Block_byref_object_dispose__22;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3AC0];
  v7 = -[ICBaseTextView _dataOwnerForCopy](self, "_dataOwnerForCopy");
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __29__ICBaseTextView__reallyCut___block_invoke;
  v18[3] = &unk_1EA7E0CE8;
  v22 = v23;
  v9 = v5;
  v19 = v9;
  v20 = self;
  v10 = v4;
  v21 = v10;
  objc_msgSend(v6, "_performAsDataOwner:block:", v7, v18);
  v11 = (void *)MEMORY[0x1E0DC3AC0];
  v12 = -[ICBaseTextView _dataOwnerForCopy](self, "_dataOwnerForCopy");
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __29__ICBaseTextView__reallyCut___block_invoke_2;
  v14[3] = &unk_1EA7E0D10;
  v13 = v9;
  v16 = self;
  v17 = v23;
  v15 = v13;
  objc_msgSend(v11, "_performAsDataOwner:block:", v12, v14);

  _Block_object_dispose(v23, 8);
}

void __29__ICBaseTextView__reallyCut___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_super v25;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 40), "textController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "selectedRange");
  v10 = objc_msgSend(v7, "extendedSelectionRangeForCollapsedSectionHeadingWithRange:textView:", v8, v9, *(_QWORD *)(a1 + 40));
  v12 = v11;

  if (v10 != objc_msgSend(*(id *)(a1 + 40), "selectedRange") || v12 != v13)
    objc_msgSend(*(id *)(a1 + 40), "setSelectedRange:", v10, v12);
  v15 = objc_msgSend(*(id *)(a1 + 40), "selectedRange");
  v17 = v16;
  v18 = objc_msgSend(*(id *)(a1 + 40), "selectedRange");
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 40), "TTTextStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v18, v20, v21);

  v22 = *(void **)(a1 + 40);
  objc_msgSend(v22, "TTTextStorage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:textStorage:rangeToBeDeleted:blockBeforeEndEditing:", v22, v23, v15, v17, 0);

  v24 = *(_QWORD *)(a1 + 48);
  v25.receiver = *(id *)(a1 + 40);
  v25.super_class = (Class)ICBaseTextView;
  objc_msgSendSuper2(&v25, sel_cut_, v24);

}

uint64_t __29__ICBaseTextView__reallyCut___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "icaxTextDidChange");
  return objc_msgSend(*(id *)(a1 + 40), "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x1E0CF45A8]);
}

- (void)insertAttributedText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  ICBaseTextView *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICBaseTextView willInsertText:](self, "willInsertText:", v5);
  v8 = v7;

  -[ICBaseTextView textController](self, "textController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorHighlightsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v13 = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__ICBaseTextView_insertAttributedText___block_invoke;
  v16[3] = &unk_1EA7E0D38;
  v17 = v10;
  v18 = v4;
  v19 = self;
  v20 = v6;
  v21 = v8;
  v14 = v4;
  v15 = v10;
  -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 2, v11, v13, v16);

}

void __39__ICBaseTextView_insertAttributedText___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCoalesceAuthorHighlightUpdates:", 1);
    v3 = *(_QWORD *)(a1 + 40);
    v6.receiver = *(id *)(a1 + 48);
    v6.super_class = (Class)ICBaseTextView;
    objc_msgSendSuper2(&v6, sel_insertAttributedText_, v3);
    objc_msgSend(*(id *)(a1 + 32), "setCoalesceAuthorHighlightUpdates:", 0);
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didInsertText:range:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

- (void)insertText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ICBaseTextView *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = -[ICBaseTextView willInsertText:](self, "willInsertText:", v4);
  v7 = v6;
  -[ICBaseTextView textController](self, "textController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorHighlightsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v12 = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __29__ICBaseTextView_insertText___block_invoke;
  v15[3] = &unk_1EA7E0D38;
  v16 = v9;
  v17 = v4;
  v18 = self;
  v19 = v5;
  v20 = v7;
  v13 = v4;
  v14 = v9;
  -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 2, v10, v12, v15);

}

uint64_t __29__ICBaseTextView_insertText___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  objc_super v4;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "setCoalesceAuthorHighlightUpdates:", 1);
    v3 = *(_QWORD *)(v2 + 40);
    v4.receiver = *(id *)(v2 + 48);
    v4.super_class = (Class)ICBaseTextView;
    objc_msgSendSuper2(&v4, sel_insertText_, v3);
    objc_msgSend(*(id *)(v2 + 32), "setCoalesceAuthorHighlightUpdates:", 0);
    return objc_msgSend(*(id *)(v2 + 48), "didInsertText:range:", *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64));
  }
  return result;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (-[ICBaseTextView selectedRangeBeforeMarking](self, "selectedRangeBeforeMarking") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[ICBaseTextView selectedRange](self, "selectedRange");
    -[ICBaseTextView setSelectedRangeBeforeMarking:](self, "setSelectedRangeBeforeMarking:", v8, v9);
  }
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsTypingOrMarkingText:", 1);

  v14.receiver = self;
  v14.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView setMarkedText:selectedRange:](&v14, sel_setMarkedText_selectedRange_, v7, location, length);

  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsTypingOrMarkingText:", 0);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (-[ICBaseTextView selectedRangeBeforeMarking](self, "selectedRangeBeforeMarking") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[ICBaseTextView selectedRange](self, "selectedRange");
    -[ICBaseTextView setSelectedRangeBeforeMarking:](self, "setSelectedRangeBeforeMarking:", v8, v9);
  }
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsTypingOrMarkingText:", 1);

  v14.receiver = self;
  v14.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView setAttributedMarkedText:selectedRange:](&v14, sel_setAttributedMarkedText_selectedRange_, v7, location, length);

  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsTypingOrMarkingText:", 0);

}

- (void)unmarkText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateRecognitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discardPreviewedResult");

  v5 = -[ICBaseTextView ic_markedTextRange](self, "ic_markedTextRange");
  v7 = v6;
  -[ICBaseTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v5;
  objc_msgSend(v8, "attributedSubstringFromRange:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView setSelectedRangeBeforeMarking:](self, "setSelectedRangeBeforeMarking:", 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsTypingOrMarkingText:", 1);

  v36.receiver = self;
  v36.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView unmarkText](&v36, sel_unmarkText);
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIsTypingOrMarkingText:", 0);

  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView editorController](self, "editorController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mentionsController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v21 = v20;
  -[ICBaseTextView editorController](self, "editorController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "note");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v33) = -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces");
  LOBYTE(v33) = 0;
  LOBYTE(v19) = objc_msgSend(v18, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v19, v21, v16, v23, self, 1, v33, 0);

  if ((v19 & 1) == 0)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hashtagController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[ICBaseTextView selectedRange](self, "selectedRange");
    v28 = v27;
    -[ICBaseTextView editorController](self, "editorController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "note");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v34) = -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces");
    LOBYTE(v34) = 0;
    objc_msgSend(v25, "checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", v26, v28, v16, v30, self, 1, v34, 0);

  }
  -[ICBaseTextView editorController](self, "editorController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "calculateRecognitionController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "didUnmarkString:atRange:", v10, v35, v7);

}

- (void)deleteBackward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[7];

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateRecognitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discardPreviewedResult");

  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView selectedTextRange](self, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICBaseTextView ic_characterRangeFromTextRange:](self, "ic_characterRangeFromTextRange:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "outlineController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isUUIDCollapsed:", v13);

    }
    else
    {
      v9 = 0;
    }

  }
  -[ICBaseTextView textController](self, "textController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView selectedTextRange](self, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEmpty");

  if ((v16 & 1) != 0 || v9)
  {
    if ((objc_msgSend(v14, "deleteBackwardForSpecialCasesInTextView:", self) & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((objc_msgSend(v14, "deleteWordBackwardForSpecialCasesInTextView:", self) & 1) == 0)
  {
LABEL_10:
    v17 = -[ICBaseTextView selectedRange](self, "selectedRange");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __32__ICBaseTextView_deleteBackward__block_invoke;
    v19[3] = &unk_1EA7DDD08;
    v19[4] = self;
    v19[5] = v17;
    v19[6] = v18;
    -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 0, v17, v18, v19);
  }
LABEL_11:

}

void __32__ICBaseTextView_deleteBackward__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsTypingOrMarkingText:", 1);

    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)ICBaseTextView;
    objc_msgSendSuper2(&v7, sel_deleteBackward);
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsTypingOrMarkingText:", 0);

  }
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    -[ICBaseTextView deleteBackward](self, "deleteBackward");
  }
  else
  {
    v6 = v3;
    v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _deleteBackwardAndNotify:](&v5, sel__deleteBackwardAndNotify_);
  }
}

- (void)_removeDrawingAttachment:(id)a3 withView:(id)a4 forDeletion:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICBaseTextView *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "ic_arrayFromNonNilObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__ICBaseTextView__removeDrawingAttachment_withView_forDeletion___block_invoke;
    v14[3] = &unk_1EA7DE880;
    v15 = v8;
    v16 = v9;
    v17 = self;
    -[ICBaseTextView showDeleteInlineDrawingAlertWithType:attachments:completionHandler:](self, "showDeleteInlineDrawingAlertWithType:attachments:completionHandler:", 1, v12, v14);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _removeDrawingAttachment:withView:forDeletion:](&v13, sel__removeDrawingAttachment_withView_forDeletion_, v8, v9, 0);
  }

}

id __64__ICBaseTextView__removeDrawingAttachment_withView_forDeletion___block_invoke(id result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  objc_super v4;

  if (a2)
  {
    v2 = *((_QWORD *)result + 5);
    v3 = *((_QWORD *)result + 4);
    v4.receiver = (id)*((_QWORD *)result + 6);
    v4.super_class = (Class)ICBaseTextView;
    return objc_msgSendSuper2(&v4, sel__removeDrawingAttachment_withView_forDeletion_, v3, v2, 1);
  }
  return result;
}

- (BOOL)isPreviewing
{
  int v3;
  objc_super v5;

  v3 = objc_msgSend(MEMORY[0x1E0DC3E50], "instancesRespondToSelector:", sel_isPreviewing);
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    LOBYTE(v3) = -[ICBaseTextView isPreviewing](&v5, sel_isPreviewing);
  }
  return v3;
}

- (void)_insertDrawing:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  v4 = a3;
  -[ICBaseTextView _insertDrawing:](&v5, sel__insertDrawing_, self);
  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 4, v4, v5.receiver, v5.super_class);

}

- (void)select:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  v4 = a3;
  -[ICBaseTextView select:](&v5, sel_select_, v4);
  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 1, v4, v5.receiver, v5.super_class);

}

- (void)selectAll:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView selectAll:](&v5, sel_selectAll_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 2, v4);

}

- (void)toggleStrikethrough
{
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[ICBaseTextView selectedRange](self, "selectedRange");
  v3 = (uint64_t *)MEMORY[0x1E0D63930];
  if (!v4)
  {
    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v13, "BOOLValue");

LABEL_8:
    goto LABEL_9;
  }
  -[ICBaseTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *v3, -[ICBaseTextView selectedRange](self, "selectedRange"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[ICBaseTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v3;
  v11 = -[ICBaseTextView selectedRange](self, "selectedRange");
  if ((v7 & 1) != 0)
    objc_msgSend(v8, "removeAttribute:range:", v9, v11, v10);
  else
    objc_msgSend(v8, "addAttribute:value:range:", v9, MEMORY[0x1E0C9AAB0], v11, v10);

  -[ICBaseTextView delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[ICBaseTextView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textViewDidChange:", self);
    goto LABEL_8;
  }
LABEL_9:
  v16 = v7 ^ 1u;
  -[ICBaseTextView typingAttributes](self, "typingAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, *v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC11A8]);

  -[ICBaseTextView setTypingAttributes:](self, "setTypingAttributes:", v20);
}

- (id)typingAttributes
{
  ICBaseTextView *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  -[ICBaseTextView cachedTypingAttributes](v2, "cachedTypingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v7.receiver = v2;
    v7.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView typingAttributes](&v7, sel_typingAttributes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ICBaseTextView setCachedTypingAttributes:](v2, "setCachedTypingAttributes:", v4);
  if (!v3)

  -[ICBaseTextView cachedTypingAttributes](v2, "cachedTypingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v5;
}

- (void)setTypingAttributes:(id)a3
{
  id v4;
  ICBaseTextView *v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((typingAttributes) != nil)", "-[ICBaseTextView setTypingAttributes:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "typingAttributes");
  objc_opt_class();
  -[ICBaseTextView textStorage](v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditing");

  if (v8)
  {
    -[ICBaseTextView setPendingTypingAttributes:](v5, "setPendingTypingAttributes:", v4);
  }
  else
  {
    -[ICBaseTextView setPendingTypingAttributes:](v5, "setPendingTypingAttributes:", 0);
    -[ICBaseTextView setCachedTypingAttributes:](v5, "setCachedTypingAttributes:", v4);
    v9.receiver = v5;
    v9.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView setTypingAttributes:](&v9, sel_setTypingAttributes_, v4);
  }
  objc_sync_exit(v5);

}

- (id)internalTypingAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView typingAttributes](&v3, sel_typingAttributes);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setInternalTypingAttributes:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView setTypingAttributes:](&v3, sel_setTypingAttributes_, a3);
}

- (void)ic_startDataDetectors
{
  if (-[ICBaseTextView ic_shouldStartDataDetectors](self, "ic_shouldStartDataDetectors"))
  {
    if (objc_msgSend(MEMORY[0x1E0DC3E50], "instancesRespondToSelector:", sel__startDataDetectors))
      -[ICBaseTextView _startDataDetectors](self, "_startDataDetectors");
  }
}

- (void)ic_resetDataDetectorsResults
{
  if (-[ICBaseTextView ic_shouldStartDataDetectors](self, "ic_shouldStartDataDetectors"))
  {
    if (objc_msgSend(MEMORY[0x1E0DC3E50], "instancesRespondToSelector:", sel__resetDataDetectorsResults))
      -[ICBaseTextView _resetDataDetectorsResults](self, "_resetDataDetectorsResults");
  }
}

- (BOOL)ic_shouldStartDataDetectors
{
  if (-[ICBaseTextView dataDetectorTypes](self, "dataDetectorTypes")
    && (-[ICBaseTextView isEditable](self, "isEditable") & 1) == 0)
  {
    return -[ICBaseTextView isSelectable](self, "isSelectable");
  }
  else
  {
    return 0;
  }
}

- (BOOL)hasFullWidthTextAttachmentAtCaretLocation:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  BOOL v14;

  if (a3 < 0)
    return 0;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 <= a3)
    return 0;
  objc_opt_class();
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0DC10F8], a3, 0, a3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "preferredViewSize");

  if (v12 != 1)
  {
    v14 = 1;
  }
  else
  {
LABEL_6:
    if (v9 && objc_msgSend(v9, "embeddingType") == 1)
    {
      objc_msgSend(v9, "bounds");
      v14 = v13 > 0.0;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  _BOOL4 v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t rect;
  uint64_t v93;
  uint64_t v94;
  objc_super v95;
  CGRect v96;
  CGRect result;

  v4 = a3;
  -[ICBaseTextView beginningOfDocument](self, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICBaseTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v5, v4);

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "logicalRangeForLocation:", v6);
  v10 = v8 + v9;
  if (v6 == v8 + v9)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textController");
    v12 = objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v6, 0, 0, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v15);

    if ((v12 & 1) == 0)
      -[ICBaseTextView setTypingAttributes:](self, "setTypingAttributes:", v14);

  }
  v95.receiver = self;
  v95.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView caretRectForPosition:](&v95, sel_caretRectForPosition_, v4);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (_QWORD *)MEMORY[0x1E0DC1178];
  v25 = 0x1E0DC1000;
  if (v6 == v10)
  {
    objc_msgSend(v7, "styler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", *v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = v24;
      v30 = objc_msgSend(v28, "baseWritingDirection");
      -[ICBaseTextView typingAttributes](self, "typingAttributes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = (void *)MEMORY[0x1E0D64DB0];
        v34 = -[ICBaseTextView selectedRange](self, "selectedRange");
        objc_msgSend(v33, "indentForStyle:range:attributedString:textView:", v32, v34, v35, v7, self);
      }
      else
      {
        objc_msgSend(v28, "firstLineHeadIndent");
      }
      v48 = v36;
      v24 = v29;

      v46 = v30 == -1;
      v47 = (double)(unint64_t)v48;
    }
    else
    {
      v46 = 1;
      v47 = 0.0;
    }
    v93 = 0x7FFFFFFFFFFFFFFFLL;
    v94 = 0;
    objc_msgSend(v7, "string");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[ICBaseTextView selectedRange](self, "selectedRange");
    objc_msgSend(v49, "getParagraphStart:end:contentsEnd:forRange:", &v94, 0, &v93, v50, v51);

    if (v46 && v94 == v93)
    {
      objc_msgSend(v26, "keyboardLanguageForTextView:", self);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0x1E0DC1000uLL;
      if (v52)
      {
        v53 = v24;
        v54 = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", v52);
        -[ICBaseTextView bounds](self, "bounds");
        v56 = v55;
        v90 = v57;
        v91 = v58;
        rect = v59;
        -[ICBaseTextView textContainer](self, "textContainer");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "lineFragmentPadding");
        v62 = v61;
        -[ICBaseTextView textContainerInset](self, "textContainerInset");
        v64 = v63;
        v66 = v65;

        v67 = v56;
        v68 = v90;
        v69 = v91;
        v70 = rect;
        if (v54 == 1)
          v17 = CGRectGetMaxX(*(CGRect *)&v67) - (v62 + v66) - v47;
        else
          v17 = v47 + CGRectGetMinX(*(CGRect *)&v67) + v62 + v64;
        v24 = v53;
        v25 = 0x1E0DC1000uLL;
      }

    }
    else
    {
      v25 = 0x1E0DC1000;
    }
  }
  else
  {
    if (v6 <= v8)
      goto LABEL_29;
    objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0DC10F8], v6 - 1, 0, v6 - 1, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v37;
    if (v37)
    {
      objc_msgSend(v37, "attachmentBoundsMargins");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v44 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[ICBaseTextView semanticContentAttribute](self, "semanticContentAttribute"));
      v45 = v17 + v39 + -2.0;
      if (v44 != 1)
        v45 = v17 - (v39 + -2.0);
      if (v39 > 2.0)
        v17 = v45;
      v19 = v19 + v41;
      v23 = v23 - (v41 + v43);
    }
  }

LABEL_29:
  v71 = objc_msgSend(*(id *)(v25 + 656), "ic_isRTL");
  -[ICBaseTextView textStorage](self, "textStorage");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "length");

  if (v6 < v73)
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "attribute:atIndex:effectiveRange:", *v24, v6, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
      v71 = objc_msgSend(v75, "baseWritingDirection") == 1;

  }
  -[ICBaseTextView bounds](self, "bounds");
  if (v17 >= CGRectGetMidX(v96))
  {
    v84 = v6 - (v71 ^ 1);
    if (v84 >= 0
      && -[ICBaseTextView hasFullWidthTextAttachmentAtCaretLocation:](self, "hasFullWidthTextAttachmentAtCaretLocation:", v84))
    {
      -[ICBaseTextView bounds](self, "bounds");
      v17 = v85 + -3.0;
    }
  }
  else
  {
    v76 = v6 - v71;
    if (v76 >= 0)
    {
      if (-[ICBaseTextView hasFullWidthTextAttachmentAtCaretLocation:](self, "hasFullWidthTextAttachmentAtCaretLocation:", v76))
      {
        -[ICBaseTextView ink](self, "ink");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "_isHandwritingInk");

        v17 = 1.0;
        if (v78)
        {
          -[ICBaseTextView textStorage](self, "textStorage");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], v76, 0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICBaseTextView textContainer](self, "textContainer");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "textContainerOrigin");
          v17 = v82;

          if (v80)
          {
            objc_msgSend(v80, "lineHeight");
            v23 = v83;
          }
          else
          {
            v23 = 18.0;
          }

        }
      }
    }
  }

  v86 = v17;
  v87 = v19;
  v88 = v21;
  v89 = v23;
  result.size.height = v89;
  result.size.width = v88;
  result.origin.y = v87;
  result.origin.x = v86;
  return result;
}

- (void)updateTextViewForDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__ICBaseTextView_updateTextViewForDidChange__block_invoke;
  v2[3] = &unk_1EA7E0D60;
  v2[4] = self;
  -[ICBaseTextView ic_performBlock:](self, "ic_performBlock:", v2);
}

void __44__ICBaseTextView_updateTextViewForDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "internalTypingAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v22)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(v12, "fontDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pointSize");
      objc_msgSend(v14, "fontWithDescriptor:size:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v9);
    }

  }
  objc_msgSend(v7, "fixupAfterEditing");
  v17 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  objc_msgSend(v6, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v17, v18, 0, v11, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToDictionary:", v20);

  if ((v21 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setTypingAttributes:", v19);
  objc_msgSend(*(id *)(a1 + 32), "icaxTextDidChange");

}

- (double)zoomFactor
{
  return 1.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  ICBaseTextView *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  void *v14;
  objc_super v15;

  v4 = a3;
  -[ICBaseTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)ICBaseTextView;
    v6 = -[ICBaseTextView gestureRecognizerShouldBegin:](&v15, sel_gestureRecognizerShouldBegin_, v4);
    -[ICBaseTextView editorController](self, "editorController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "auxiliaryResponder");
    v8 = (ICBaseTextView *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEditing") || (LOBYTE(v6) = 1, v8) && v8 != self)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
        -[ICBaseTextView linkTappedByGesture:](self, "linkTappedByGesture:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = v9 != 0;
      }

    }
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v4, "numberOfTouches")
    && (-[ICBaseTextView editorController](self, "editorController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "shouldIgnoreTapToStartEditingTextView:", self),
        v11,
        (v12 & 1) == 0))
  {
    -[ICBaseTextView linkTappedByGesture:](self, "linkTappedByGesture:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = v14 == 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
LABEL_14:

  return v6;
}

- (void)respondToTapGesture:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  uint64_t v31;
  id v32;

  v32 = a3;
  objc_opt_class();
  -[ICBaseTextView textContainer](self, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "insideSiriSnippet");

  if (v6)
  {
    objc_opt_class();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D639E0], "appURLForNote:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      +[ICExtensionSafeAPIShims openURL:originatingView:completionHandler:](ICExtensionSafeAPIShims, "openURL:originatingView:completionHandler:", v9, self, 0);
  }
  else
  {
    -[ICBaseTextView editorController](self, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calculateScrubberController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isShowing");

    if (v12)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "calculateScrubberController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hideScrubber");

    }
    objc_opt_class();
    -[ICBaseTextView textStorage](self, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isMarkingTextForHeadingRename"))
    {
      -[ICBaseTextView endHeadingRenameCommittingMarkedText:](self, "endHeadingRenameCommittingMarkedText:", 1);
      goto LABEL_18;
    }
    -[ICBaseTextView tapGestureRecognizer](self, "tapGestureRecognizer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 != v32)
    {

      goto LABEL_18;
    }
    v17 = objc_msgSend(v32, "state");

    if (v17 != 3)
      goto LABEL_18;
    -[ICBaseTextView editorController](self, "editorController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v32, "numberOfTouches"))
      {
        -[ICBaseTextView icDelegate](self, "icDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_opt_respondsToSelector();

        if ((v20 & 1) == 0
          || (-[ICBaseTextView icDelegate](self, "icDelegate"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "handleTapGestureForAttribution:", v32),
              v21,
              (v22 & 1) == 0))
        {
          -[ICBaseTextView calculateRecognitionController](self, "calculateRecognitionController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isPreviewingResult");

          if (v24)
          {
            -[ICBaseTextView calculateRecognitionController](self, "calculateRecognitionController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "discardPreviewedResult");
          }
          else
          {
            if (objc_msgSend(v9, "isEditable"))
            {
              -[ICBaseTextView icDelegate](self, "icDelegate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_opt_respondsToSelector();

              if ((v28 & 1) == 0
                || (-[ICBaseTextView icDelegate](self, "icDelegate"),
                    v29 = (void *)objc_claimAutoreleasedReturnValue(),
                    v30 = objc_msgSend(v29, "shouldStartEditingForTapGesture:", v32),
                    v29,
                    v30))
              {
                -[ICBaseTextView startEditingForTapGesture:](self, "startEditingForTapGesture:", v32);
              }
              goto LABEL_4;
            }
            -[ICBaseTextView selectedRange](self, "selectedRange");
            if (v31)
              -[ICBaseTextView setSelectedTextRange:](self, "setSelectedTextRange:", 0);
            if (!objc_msgSend(v9, "isDeletedOrInTrash"))
              goto LABEL_4;
            -[ICBaseTextView editorController](self, "editorController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "showRecoverNoteAlert");
          }

        }
      }
    }
    else
    {
      -[ICBaseTextView editorController](self, "editorController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addNote:", self);

    }
  }
LABEL_4:

LABEL_18:
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[ICBaseTextView icDelegate](self, "icDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  -[ICBaseTextView icDelegate](self, "icDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldBlockHitTestOnTextView:event:", self, v7);

  if ((v10 & 1) == 0)
  {
LABEL_5:
    -[ICBaseTextView setHitTestPoint:](self, "setHitTestPoint:", x, y);
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)linkTappedByGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v8;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "numberOfTouches"))
  {
    objc_msgSend(v4, "locationOfTouch:inView:", 0, self);
    v10 = 0;
    -[ICBaseTextView distanceFromContentToGivenPoint:charIndexAtPoint:](self, "distanceFromContentToGivenPoint:charIndexAtPoint:", &v10);
    v5 = 0;
    if (v6 < 28.2842712 && v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ICBaseTextView textStorage](self, "textStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], v10, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)distanceFromContentToGivenPoint:(CGPoint)a3 charIndexAtPoint:(unint64_t *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;

  if (a4)
    *a4 = 0x7FFFFFFFFFFFFFFFLL;
  -[ICBaseTextView closestPositionToPoint:](self, "closestPositionToPoint:", a3.x, a3.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICBaseTextView beginningOfDocument](self, "beginningOfDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICBaseTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v7, v6);

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICBaseTextView ic_rectForRange:](self, "ic_rectForRange:", v8, 0);
    }
    else
    {
      objc_opt_class();
      -[ICBaseTextView layoutManager](self, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "glyphIndexForCharacterAtIndex:", v8);
      -[ICBaseTextView textContainer](self, "textContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "boundingRectForGlyphRange:inTextContainer:", v12, 0, v13);

    }
    -[ICBaseTextView textContainer](self, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textContainerOrigin");

    UIDistanceBetweenPointAndRect();
    v9 = v15;
    if (a4)
      *a4 = v8;
  }
  else
  {
    v9 = 1.79769313e308;
  }

  return v9;
}

- (void)setIsDraggingChecklistItem:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  if (self->_isDraggingChecklistItem != a3)
  {
    self->_isDraggingChecklistItem = a3;
    if (a3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DC3C60]);
      -[ICBaseTextView setChecklistDragFeedbackGenerator:](self, "setChecklistDragFeedbackGenerator:", v4);

      -[ICBaseTextView checklistDragFeedbackGenerator](self, "checklistDragFeedbackGenerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prepare");

      -[ICBaseTextView checklistDragFeedbackGenerator](self, "checklistDragFeedbackGenerator");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectionChanged");

    }
    else
    {
      -[ICBaseTextView setChecklistDragFeedbackGenerator:](self, "setChecklistDragFeedbackGenerator:", 0);
    }
  }
}

- (void)setIsDraggingOverChecklistItem:(BOOL)a3
{
  if (self->_isDraggingOverChecklistItem != a3)
  {
    self->_isDraggingOverChecklistItem = a3;
    if (!a3)
      -[ICBaseTextView setInhibitNextDropCursorUpdateAnimation:](self, "setInhibitNextDropCursorUpdateAnimation:", 1);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[ICBaseTextView setTouchIsPointer:](self, "setTouchIsPointer:", objc_msgSend(v7, "ic_containsObjectPassingTest:", &__block_literal_global_23));
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);

}

uint64_t __41__ICBaseTextView_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isPointerTouch");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView touchesMoved:withEvent:](&v4, sel_touchesMoved_withEvent_, a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[ICBaseTextView setTouchIsPointer:](self, "setTouchIsPointer:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[ICBaseTextView setTouchIsPointer:](self, "setTouchIsPointer:", 0);
}

- (void)beginSelectionChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView beginSelectionChange](&v6, sel_beginSelectionChange);
  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentMergeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginBlockingMergeForReason:textView:", 0, self);

}

- (void)endSelectionChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentMergeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBlockingMergeForReason:textView:", 0, self);

  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView endSelectionChange](&v6, sel_endSelectionChange);
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  -[ICBaseTextView distanceFromContentToGivenPoint:charIndexAtPoint:](self, "distanceFromContentToGivenPoint:charIndexAtPoint:", 0);
  if (v6 >= 28.2842712)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  return -[ICBaseTextView willInteractWithLinkAtPoint:](&v8, sel_willInteractWithLinkAtPoint_, x, y);
}

- (void)speakAccessibilityAutoListItemIfNecessaryForInsertedText:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v5 = -[ICBaseTextView selectedRange](self, "selectedRange");
    -[ICBaseTextView textStorage](self, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v6, "length"))
    {
LABEL_16:

      goto LABEL_17;
    }
    v7 = objc_msgSend(v4, "length");

    if (v7 == 1)
    {
      -[ICBaseTextView textStorage](self, "textStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributesAtIndex:effectiveRange:", -[ICBaseTextView selectedRange](self, "selectedRange"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isList"))
      {
        v10 = objc_msgSend(v4, "characterAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v11, "characterIsMember:", v10);

        if ((_DWORD)v10)
        {
          UIAccessibilityPostNotification(*MEMORY[0x1E0DC10C0], self);
          switch(objc_msgSend(v9, "style"))
          {
            case 'd':
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              v14 = CFSTR("bullet");
              goto LABEL_12;
            case 'e':
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              v14 = CFSTR("dash");
              goto LABEL_12;
            case 'f':
              v16 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D40]);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "localizedStringWithFormat:", CFSTR("%lu"), objc_msgSend(v13, "unsignedIntegerValue"));
              v17 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            case 'g':
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              v14 = CFSTR("checklist");
LABEL_12:
              objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1EA7E9860, 0);
              v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
              v15 = (void *)v17;

              break;
            default:
              v15 = 0;
              break;
          }
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("New list item"), &stru_1EA7E9860, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          __ICAccessibilityStringForVariables();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v21;
          dispatchMainAfterDelay();

        }
      }

      goto LABEL_16;
    }
  }
LABEL_17:

}

uint64_t __75__ICBaseTextView_speakAccessibilityAutoListItemIfNecessaryForInsertedText___block_invoke()
{
  return ICAccessibilityPostHighPriorityAnnouncementNotification();
}

- (void)_share:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showStyleSelector:animated:sender:", 0, 1, v4);

  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView _share:](&v6, sel__share_, v4);

}

- (void)_define:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showStyleSelector:animated:sender:", 0, 1, v4);

  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView _define:](&v6, sel__define_, v4);

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  Class v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  uint64_t v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  char isKindOfClass;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  id v139;
  id location;
  objc_super v141;
  _QWORD v142[5];
  void *v143;
  void *v144;
  void *v145;
  _QWORD v146[3];
  _QWORD v147[2];
  _QWORD v148[6];

  v148[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = NSClassFromString(CFSTR("ICPaperDocumentTextAttachmentView"));
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke;
  v142[3] = &__block_descriptor_40_e21_B16__0__UIResponder_8lu32l8;
  v142[4] = v5;
  -[ICBaseTextView firstResponderMatchingPredicate:](self, "firstResponderMatchingPredicate:", v142);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_31;
  v141.receiver = self;
  v141.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView buildMenuWithBuilder:](&v141, sel_buildMenuWithBuilder_, v4);
  v117 = *MEMORY[0x1E0DC5158];
  objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:");
  v7 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Check All"), &stru_1EA7E9860, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandWithTitle:image:action:propertyList:", v9, v10, sel_checkAll_, 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Uncheck All"), &stru_1EA7E9860, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandWithTitle:image:action:propertyList:", v13, v14, sel_uncheckAll_, 0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Delete Checked"), &stru_1EA7E9860, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commandWithTitle:image:action:propertyList:", v17, v18, sel_removeChecked_, 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v132, "setAttributes:", objc_msgSend(v132, "attributes") | 2);
  v19 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Move Checked to Bottom"), &stru_1EA7E9860, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commandWithTitle:image:action:propertyList:", v21, 0, sel_moveCheckedToBottom_, 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Checklist"), &stru_1EA7E9860, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checklist"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v127;
  v148[1] = v126;
  v148[2] = v132;
  v148[3] = v125;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "menuWithTitle:image:identifier:options:children:", v24, v25, 0, 0, v26);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Decrease"), &stru_1EA7E9860, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("decrease.indent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commandWithTitle:image:action:propertyList:", v29, v30, sel_decreaseIndentation_, 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Increase"), &stru_1EA7E9860, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("increase.indent"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commandWithTitle:image:action:propertyList:", v33, v34, sel_increaseIndentation_, 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v131, "setAttributes:", objc_msgSend(v131, "attributes") | 8);
  objc_msgSend(v130, "setAttributes:", objc_msgSend(v130, "attributes") | 8);
  v35 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Indentation"), &stru_1EA7E9860, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v131;
  v147[1] = v130;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "menuWithTitle:image:identifier:options:children:", v37, 0, 0, 0, v38);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView editorController](self, "editorController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "calculateGraphingController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[ICBaseTextView selectedRange](self, "selectedRange");
  objc_msgSend(v40, "insertionDecisionForExpressionsInRange:", v41, v42);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v124, "makeMenu");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Convert to Text"), &stru_1EA7E9860, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commandWithTitle:image:action:propertyList:", v45, 0, sel_convertToText_, 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Convert to Tag"), &stru_1EA7E9860, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commandWithTitle:image:action:propertyList:", v48, 0, sel_convertToTag_, 0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Add to Tags"), &stru_1EA7E9860, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commandWithTitle:image:action:propertyList:", v51, 0, sel_addToTags_, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0C99DE8];
  v146[0] = v123;
  v146[1] = v128;
  v146[2] = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "arrayWithArray:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView editorController](self, "editorController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "note");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = objc_msgSend(v56, "isPasswordProtected");

  if ((_DWORD)v53)
    objc_msgSend(v54, "removeObject:", v128);
  if (ICDebugModeEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC3678], "commandWithTitle:image:action:propertyList:", CFSTR("Tags"), 0, sel_openExperimentalHashtagUI_, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v57);

  }
  if (ICInternalSettingsIsScrubbingEnabled())
  {
    -[ICBaseTextView editorController](self, "editorController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "note");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v59, "isEditable"))
    {
LABEL_12:

      goto LABEL_13;
    }
    -[ICBaseTextView editorController](self, "editorController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "note");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v61, "isCalculateMathEnabled"))
    {

      goto LABEL_12;
    }
    -[ICBaseTextView editorController](self, "editorController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "note");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v63, "isDeletedOrInTrash") & 1) != 0)
    {

      goto LABEL_12;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "note");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "calculateDocumentController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "numberLiteralAtLocation:", -[ICBaseTextView selectedRange](self, "selectedRange"));
      v59 = (id)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_initWeak(&location, self);
        v99 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("Adjust"), &stru_1EA7E9860, 0);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v137[0] = MEMORY[0x1E0C809B0];
        v137[1] = 3221225472;
        v137[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_3;
        v137[3] = &unk_1EA7E0E08;
        objc_copyWeak(&v139, &location);
        v59 = v59;
        v138 = v59;
        objc_msgSend(v99, "ic_actionWithTitle:handler:", v101, v137);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        v103 = (void *)MEMORY[0x1E0DC39D0];
        v145 = v102;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "insertSiblingMenu:beforeMenuForIdentifier:", v105, *MEMORY[0x1E0DC5078]);
        objc_destroyWeak(&v139);
        objc_destroyWeak(&location);
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  v64 = (void *)MEMORY[0x1E0DC39D0];
  v65 = (void *)objc_msgSend(v54, "copy");
  objc_msgSend(v64, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[ICBaseTextView textContainer](self, "textContainer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[ICBaseTextView ic_isInSecureWindow](self, "ic_isInSecureWindow") & 1) == 0)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "note");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v69, "isSharedReadOnly") & 1) != 0
      || -[ICBaseTextView selectionContainsNonLinkAttachment](self, "selectionContainsNonLinkAttachment"))
    {

    }
    else
    {
      v95 = objc_msgSend(v118, "insideSiriSnippet");

      if ((v95 & 1) == 0)
      {
        objc_initWeak(&location, self);
        if (-[ICBaseTextView selectionContainsLink](self, "selectionContainsLink"))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("Edit Link"), &stru_1EA7E9860, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("Add Link"), &stru_1EA7E9860, 0);
        }
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        v106 = (void *)MEMORY[0x1E0DC3428];
        v135[0] = MEMORY[0x1E0C809B0];
        v135[1] = 3221225472;
        v135[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_4;
        v135[3] = &unk_1EA7DF3F8;
        objc_copyWeak(&v136, &location);
        objc_msgSend(v106, "ic_actionWithTitle:handler:", v116, v135);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v115, 0);
        if (-[ICBaseTextView selectionContainsLink](self, "selectionContainsLink"))
        {
          v114 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "localizedStringForKey:value:table:", CFSTR("Remove Link"), &stru_1EA7E9860, 0);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v133[0] = MEMORY[0x1E0C809B0];
          v133[1] = 3221225472;
          v133[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_5;
          v133[3] = &unk_1EA7DF3F8;
          objc_copyWeak(&v134, &location);
          objc_msgSend(v114, "ic_actionWithTitle:handler:", v109, v133);
          v110 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v107, "ic_addNonNilObject:", v110);
          objc_destroyWeak(&v134);
        }
        v111 = (void *)MEMORY[0x1E0DC39D0];
        v112 = (void *)objc_msgSend(v107, "copy");
        objc_msgSend(v111, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "insertSiblingMenu:beforeMenuForIdentifier:", v113, *MEMORY[0x1E0DC5078]);
        objc_destroyWeak(&v136);

        objc_destroyWeak(&location);
      }
    }
  }
  if ((-[ICBaseTextView ic_isInSecureWindow](self, "ic_isInSecureWindow") & 1) != 0)
    goto LABEL_22;
  -[ICBaseTextView editorController](self, "editorController");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "note");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v71, "isPasswordProtected") & 1) != 0)
    goto LABEL_21;
  -[ICBaseTextView editorController](self, "editorController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "note");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "isSharedReadOnly");

  if ((v74 & 1) == 0)
  {
    v75 = (void *)MEMORY[0x1E0DC3678];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("Attach File"), &stru_1EA7E9860, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:", CFSTR("document"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "commandWithTitle:image:action:propertyList:", v77, v78, sel_attachFile_, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = (void *)MEMORY[0x1E0DC39D0];
    v144 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v80);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "insertSiblingMenu:beforeMenuForIdentifier:", v71, *MEMORY[0x1E0DC5078]);
LABEL_21:

  }
LABEL_22:
  -[ICBaseTextView editorController](self, "editorController");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "note");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "isSharedReadOnly");

  if ((v83 & 1) == 0)
    objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v120, *MEMORY[0x1E0DC5078]);
  objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v121, v117);
  v84 = *MEMORY[0x1E0DC50E0];
  if (v129)
    objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v129, *MEMORY[0x1E0DC50E0]);
  objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v66, v84);
  if (ICInternalSettingsIsGenerationToolEnabled())
  {
    if ((-[ICBaseTextView ic_isInSecureWindow](self, "ic_isInSecureWindow") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD1180], "sharedInstance");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "isGenerationModelAvailable");

      if (v86)
      {
        v87 = (void *)MEMORY[0x1E0DC3678];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("Create Image"), &stru_1EA7E9860, 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_generativePlaygroundImage");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "commandWithTitle:image:action:propertyList:", v89, v90, sel_createImage_, 0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        v92 = (void *)MEMORY[0x1E0DC39D0];
        v143 = v91;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v94, *MEMORY[0x1E0DC5078]);
      }
    }
  }

LABEL_31:
}

uint64_t __39__ICBaseTextView_buildMenuWithBuilder___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0DC3678];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Strikethrough"), &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("strikethrough"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandWithTitle:image:action:propertyList:", v6, v7, sel_toggleStrikethrough, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateScrubberController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showScrubberForNumberLiteral:isCompact:", *(_QWORD *)(a1 + 32), 0);

}

void __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "auxiliaryResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "editorController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "auxiliaryResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "openLinkEditor:", WeakRetained);

}

void __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "conformsToProtocol:", &unk_1F0425160))
    goto LABEL_4;
  objc_msgSend(WeakRetained, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  v4 = WeakRetained;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICProtocolCast();
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "removeLinksFromCurrentSelection");
LABEL_4:

    v4 = WeakRetained;
  }

}

- (BOOL)selectionContainsLink
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], -[ICBaseTextView selectedRange](self, "selectedRange"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[ICBaseTextView textStorage](self, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], -[ICBaseTextView selectedRange](self, "selectedRange"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentUTI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D63878]);

  }
  return v5;
}

- (BOOL)selectionContainsNonLinkAttachment
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ICBaseTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v5 = *MEMORY[0x1E0DC10F8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICBaseTextView_selectionContainsNonLinkAttachment__block_invoke;
  v8[3] = &unk_1EA7DD260;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, v4, v6, 0, v8);

  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __52__ICBaseTextView_selectionContainsNonLinkAttachment__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11)
  {
    objc_msgSend(v11, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isLinkAttachment") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }

    v8 = v11;
  }

}

- (void)updateKeyboardSuggestions:(id)a3 hashtagController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  ICBaseTextView *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ICBaseTextView inputDelegate](self, "inputDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    v27 = self;
    v28 = (void *)v8;
    v29 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v16, "displayText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = (void *)MEMORY[0x1E0D64DF0];
            objc_msgSend(v16, "displayText");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "displayText");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "ic_withHashtagPrefix");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hashtagTextSuggestionWithIdentifier:displayText:", v19, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObject:", v22);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v13);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__ICBaseTextView_updateKeyboardSuggestions_hashtagController___block_invoke;
    block[3] = &unk_1EA7DDBF0;
    v9 = v28;
    v32 = v28;
    v33 = v10;
    v7 = v29;
    v23 = v29;
    v34 = v23;
    v24 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[ICBaseTextView setHashtagController:](v27, "setHashtagController:", v23);

    v6 = v30;
  }
  else
  {
    objc_msgSend(v7, "setIsUpdatingKeyboard:", 0);
    -[ICBaseTextView setHashtagController:](self, "setHashtagController:", v7);
    -[ICBaseTextView mentionsController](self, "mentionsController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isUpdatingKeyboard");

    if ((v26 & 1) == 0)
      objc_msgSend(v9, "setSuggestions:", 0);
  }

}

uint64_t __62__ICBaseTextView_updateKeyboardSuggestions_hashtagController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSuggestions:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "setIsUpdatingKeyboard:", 1);
}

- (void)updateKeyboardSuggestions:(id)a3 mentionsController:(id)a4 mentionString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((participants) != nil)", "-[ICBaseTextView updateKeyboardSuggestions:mentionsController:mentionString:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "participants");
  -[ICBaseTextView setParticipants:](self, "setParticipants:", v8);
  -[ICBaseTextView inputDelegate](self, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v8, "count"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke;
    v27[3] = &__block_descriptor_48_e54___ICThumbnailConfiguration_16__0__CKShareParticipant_8l;
    v27[4] = 0x403C000000000000;
    v27[5] = 0x403C000000000000;
    objc_msgSend(v8, "ic_compactMap:", v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D64DD0], "sharedThumbnailService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_2;
    v19[3] = &unk_1EA7E0E78;
    objc_copyWeak(&v25, &location);
    v20 = v8;
    v15 = v13;
    v21 = v15;
    v22 = v10;
    v16 = v9;
    v23 = v16;
    v24 = v11;
    objc_msgSend(v14, "thumbnailsWithConfigurations:completion:", v15, v19);

    -[ICBaseTextView setMentionsController:](self, "setMentionsController:", v16);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v9, "setIsUpdatingKeyboard:", 0);
    -[ICBaseTextView setMentionsController:](self, "setMentionsController:", v9);
    -[ICBaseTextView hashtagController](self, "hashtagController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isUpdatingKeyboard");

    if ((v18 & 1) == 0)
      objc_msgSend(v11, "setSuggestions:", 0);
  }

}

id __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D64DC8];
  v4 = a2;
  v5 = [v3 alloc];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initForAvatarWithParticipants:preferredSize:hasBorder:", v6, 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  return v7;
}

void __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_3;
  block[3] = &unk_1EA7E0E50;
  objc_copyWeak(&v12, a1 + 9);
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = v3;
  v11 = a1[8];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v1 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v31 = WeakRetained;
    objc_msgSend(WeakRetained, "participants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v31;
    if (v4)
    {
      v5 = *(_QWORD *)(v1 + 32);

      v3 = v31;
      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v31, "participants");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setWithArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(v1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToSet:", v9))
        {
          v29 = v9;
          v30 = v8;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 32), "count"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v1 + 32), "count"))
          {
            v10 = 0;
            do
            {
              objc_msgSend(*(id *)(v1 + 32), "objectAtIndexedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v1 + 40), "objectAtIndexedSubscript:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "ic_cachedDisplayNameFromContacts");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (!v13 || !objc_msgSend(v13, "length"))
              {
                objc_msgSend(v11, "ic_participantName");
                v15 = objc_claimAutoreleasedReturnValue();

                v14 = (void *)v15;
              }
              objc_msgSend(v11, "ic_participantNameMatchingString:returnFullName:", *(_QWORD *)(v1 + 48), 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (!v16 || !objc_msgSend(v16, "length"))
              {
                objc_msgSend(v11, "ic_shortParticipantName");
                v18 = objc_claimAutoreleasedReturnValue();

                v17 = (void *)v18;
              }
              v19 = (void *)MEMORY[0x1E0D64DF0];
              objc_msgSend(*(id *)(v1 + 56), "note");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "ic_userRecordNameInNote:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "ic_trimmedString");
              v34 = v14;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "ic_mentionString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v11;
              v24 = *(void **)(v1 + 64);
              objc_msgSend(v12, "associatedObjectIdentifier");
              v33 = v12;
              v25 = v1;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "mentionTextSuggestionWithIdentifier:displayText:inputText:image:", v21, v22, v23, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v1 = v25;
              objc_msgSend(v32, "addObject:", v28);

              ++v10;
            }
            while (v10 < objc_msgSend(*(id *)(v25 + 32), "count"));
          }
          objc_msgSend(*(id *)(v1 + 72), "setSuggestions:", v32);
          objc_msgSend(*(id *)(v1 + 56), "setIsUpdatingKeyboard:", 1);

          v9 = v29;
          v8 = v30;
        }

        v3 = v31;
      }
    }
  }

}

- (void)calculateRecognitionController:(id)a3 didUpdateTextSuggestions:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICBaseTextView inputDelegate](self, "inputDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuggestions:", v6);

  -[ICBaseTextView setCalculateRecognitionController:](self, "setCalculateRecognitionController:", v7);
}

- (void)insertTextSuggestion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    switch(objc_msgSend(v7, "type"))
    {
      case 0:
      case 1:
        -[ICBaseTextView calculateRecognitionController](self, "calculateRecognitionController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "discardPreviewedResult");
        goto LABEL_13;
      case 2:
        -[ICBaseTextView hashtagController](self, "hashtagController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertHashtagWithText:viaAutoComplete:parentAttachment:", v10, 1, v6);
        goto LABEL_9;
      case 3:
        -[ICBaseTextView mentionsController](self, "mentionsController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "inputText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertMentionWithText:uuidString:parentAttachment:", v10, v11, v6);

LABEL_9:
        goto LABEL_13;
      case 4:
        -[ICBaseTextView calculateRecognitionController](self, "calculateRecognitionController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ICBaseTextView selectedRange](self, "selectedRange");
        v13 = v9;
        v15 = v14;
        v16 = 0;
        goto LABEL_12;
      case 5:
        -[ICBaseTextView calculateRecognitionController](self, "calculateRecognitionController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ICBaseTextView selectedRange](self, "selectedRange");
        v13 = v9;
        v15 = v17;
        v16 = 1;
LABEL_12:
        objc_msgSend(v13, "commitPreviewedResultAtRange:asLiteral:", v12, v15, v16);
LABEL_13:

        break;
      default:
        break;
    }
  }

}

- (void)endHeadingRenameCommittingMarkedText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isMarkingTextForHeadingRename"))
  {
    v6 = -[ICBaseTextView ic_markedTextRange](self, "ic_markedTextRange");
    v8 = v7;
    -[ICBaseTextView markedTextRange](self, "markedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v3)
      {
        objc_msgSend(v12, "attributedSubstringFromRange:", v6, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICBaseTextView setMarkedText:selectedRange:](self, "setMarkedText:selectedRange:", v11, 0x7FFFFFFFFFFFFFFFLL, 0);

        -[ICBaseTextView unmarkText](self, "unmarkText");
      }
      else
      {
        -[ICBaseTextView unmarkText](self, "unmarkText");
        objc_msgSend(v12, "deleteCharactersInRange:", v6, v8);
      }
    }
    objc_msgSend(v12, "setIsMarkingTextForHeadingRename:", 0);
  }

}

- (_NSRange)willInsertText:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  -[ICBaseTextView endHeadingRenameCommittingMarkedText:](self, "endHeadingRenameCommittingMarkedText:", 0);
  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsTypingOrMarkingText:", 1);
  v6 = -[ICBaseTextView selectedRange](self, "selectedRange");
  v8 = v7;
  -[ICBaseTextView markedTextRange](self, "markedTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v6 = -[ICBaseTextView selectedRangeBeforeMarking](self, "selectedRangeBeforeMarking");
    v8 = v10;
  }
  -[ICBaseTextView textController](self, "textController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v6, v8, v5);

  v12 = v6;
  v13 = v8;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)didInsertText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  length = a4.length;
  location = a4.location;
  v22 = a3;
  -[ICBaseTextView textController](self, "textController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView editorController](self, "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hashtagController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView editorController](self, "editorController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mentionsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHashtagTableKeyboardDelegate:", v12);

    objc_opt_class();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMentionsTableKeyboardDelegate:", v13);

    objc_opt_class();
    ICDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v21) = -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces");
    objc_msgSend(v7, "insertedText:replacementRange:inTextView:hashtagController:mentionsController:languageHasSpaces:parentAttachment:", v22, location, length, self, v9, v11, v21, v16);
  }
  else
  {
    objc_opt_class();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHashtagKeyboardDelegate:", v17);

    objc_opt_class();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMentionsKeyboardDelegate:", v18);

    objc_msgSend(v7, "insertedText:replacementRange:inTextView:languageHasSpaces:", v22, location, length, self, -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces"));
    -[ICBaseTextView editorController](self, "editorController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "calculateRecognitionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didInsertString:atRange:", v22, location, length);
  }

  objc_opt_class();
  -[ICBaseTextView textStorage](self, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setIsTypingOrMarkingText:", 0);
  -[ICBaseTextView speakAccessibilityAutoListItemIfNecessaryForInsertedText:](self, "speakAccessibilityAutoListItemIfNecessaryForInsertedText:", v22);

}

- (void)informDelegateOfAnalyticsCalloutBarButtonActionOfType:(int64_t)a3 sender:(id)a4
{
  id v6;
  char isKindOfClass;
  void *v8;
  char v9;
  id v10;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICBaseTextView icDelegate](self, "icDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ICBaseTextView icDelegate](self, "icDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didInvokeAnalyticsCalloutBarButtonActionOfType:", a3);

    }
  }
}

- (void)informDelegateOfPastedAttributedString:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICBaseTextView icDelegate](self, "icDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICBaseTextView icDelegate](self, "icDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didInvokePasteWithAttributedString:", v7);

  }
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  void *v5;
  ICNAEventReporter *v6;
  ICNAEventReporter *eventReporter;
  void *v8;

  if (!self->_eventReporter && objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D62A30]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:view:", v5, self);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (BOOL)isDraggingChecklistItem
{
  return self->_isDraggingChecklistItem;
}

- (BOOL)isDraggingOverChecklistItem
{
  return self->_isDraggingOverChecklistItem;
}

- (BOOL)inhibitNextDropCursorUpdateAnimation
{
  return self->_inhibitNextDropCursorUpdateAnimation;
}

- (void)setInhibitNextDropCursorUpdateAnimation:(BOOL)a3
{
  self->_inhibitNextDropCursorUpdateAnimation = a3;
}

- (BOOL)touchIsPointer
{
  return self->_touchIsPointer;
}

- (void)setTouchIsPointer:(BOOL)a3
{
  self->_touchIsPointer = a3;
}

- (UISelectionFeedbackGenerator)checklistDragFeedbackGenerator
{
  return self->_checklistDragFeedbackGenerator;
}

- (void)setChecklistDragFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_checklistDragFeedbackGenerator, a3);
}

- (ICTrackedParagraph)draggedChecklistTrackedParagraph
{
  return self->_draggedChecklistTrackedParagraph;
}

- (void)setDraggedChecklistTrackedParagraph:(id)a3
{
  objc_storeStrong((id *)&self->_draggedChecklistTrackedParagraph, a3);
}

- (ICTrackedParagraph)trackedParagraphCurrentlyUnderDraggedChecklist
{
  return self->_trackedParagraphCurrentlyUnderDraggedChecklist;
}

- (void)setTrackedParagraphCurrentlyUnderDraggedChecklist:(id)a3
{
  objc_storeStrong((id *)&self->_trackedParagraphCurrentlyUnderDraggedChecklist, a3);
}

- (BOOL)shouldDropChecklistAbove
{
  return self->_shouldDropChecklistAbove;
}

- (void)setShouldDropChecklistAbove:(BOOL)a3
{
  self->_shouldDropChecklistAbove = a3;
}

- (double)checklistDragVerticalOffset
{
  return self->_checklistDragVerticalOffset;
}

- (void)setChecklistDragVerticalOffset:(double)a3
{
  self->_checklistDragVerticalOffset = a3;
}

- (unint64_t)lastChecklistDropIndex
{
  return self->_lastChecklistDropIndex;
}

- (void)setLastChecklistDropIndex:(unint64_t)a3
{
  self->_lastChecklistDropIndex = a3;
}

- (void)setTempHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_tempHighlightLayer, a3);
}

- (CGPoint)hitTestPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_hitTestPoint.x;
  y = self->_hitTestPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setHitTestPoint:(CGPoint)a3
{
  self->_hitTestPoint = a3;
}

- (ICTextViewRenderingSurfaceView)renderingSurfaceView
{
  return self->_renderingSurfaceView;
}

- (void)setRenderingSurfaceView:(id)a3
{
  objc_storeStrong((id *)&self->_renderingSurfaceView, a3);
}

- (NSTextHighlightShapeProvider)highlightShapeProvider
{
  return self->_highlightShapeProvider;
}

- (void)setHighlightShapeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_highlightShapeProvider, a3);
}

- (BOOL)textSelectionHidden
{
  return self->_textSelectionHidden;
}

- (void)setTextSelectionHidden:(BOOL)a3
{
  self->_textSelectionHidden = a3;
}

- (BOOL)isSettingTextStyle
{
  return self->_isSettingTextStyle;
}

- (void)setIsSettingTextStyle:(BOOL)a3
{
  self->_isSettingTextStyle = a3;
}

- (BOOL)languageHasSpaces
{
  return self->_languageHasSpaces;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (ICHashtagController)hashtagController
{
  return (ICHashtagController *)objc_loadWeakRetained((id *)&self->_hashtagController);
}

- (void)setHashtagController:(id)a3
{
  objc_storeWeak((id *)&self->_hashtagController, a3);
}

- (ICMentionsController)mentionsController
{
  return (ICMentionsController *)objc_loadWeakRetained((id *)&self->_mentionsController);
}

- (void)setMentionsController:(id)a3
{
  objc_storeWeak((id *)&self->_mentionsController, a3);
}

- (ICCalculateRecognitionController)calculateRecognitionController
{
  return (ICCalculateRecognitionController *)objc_loadWeakRetained((id *)&self->_calculateRecognitionController);
}

- (void)setCalculateRecognitionController:(id)a3
{
  objc_storeWeak((id *)&self->_calculateRecognitionController, a3);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  self->_participants = (NSArray *)a3;
}

- (NSAttributedString)_icaxUnfilteredAttributedString
{
  return self->__icaxUnfilteredAttributedString;
}

- (unint64_t)_icaxModifiedCursorPosition
{
  return self->__icaxModifiedCursorPosition;
}

- (void)set_icaxModifiedCursorPosition:(unint64_t)a3
{
  self->__icaxModifiedCursorPosition = a3;
}

- (_NSRange)_icaxModifiedSelectionRange
{
  _NSRange *p_icaxModifiedSelectionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_icaxModifiedSelectionRange = &self->__icaxModifiedSelectionRange;
  location = self->__icaxModifiedSelectionRange.location;
  length = p_icaxModifiedSelectionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)set_icaxModifiedSelectionRange:(_NSRange)a3
{
  self->__icaxModifiedSelectionRange = a3;
}

- (NSAttributedString)_icaxCachedModifiedAttributedString
{
  return self->__icaxCachedModifiedAttributedString;
}

- (void)set_icaxCachedModifiedAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2936);
}

- (BOOL)_icaxShouldPreventUpdatingFakeCursorRange
{
  return self->__icaxShouldPreventUpdatingFakeCursorRange;
}

- (void)set_icaxShouldPreventUpdatingFakeCursorRange:(BOOL)a3
{
  self->__icaxShouldPreventUpdatingFakeCursorRange = a3;
}

- (NSArray)_icaxCachedChildrenForReparenting
{
  return self->__icaxCachedChildrenForReparenting;
}

- (void)set_icaxCachedChildrenForReparenting:(id)a3
{
  objc_storeStrong((id *)&self->__icaxCachedChildrenForReparenting, a3);
}

- (double)_icaxLastOffsetForBuildingReparentingCache
{
  return self->__icaxLastOffsetForBuildingReparentingCache;
}

- (void)set_icaxLastOffsetForBuildingReparentingCache:(double)a3
{
  self->__icaxLastOffsetForBuildingReparentingCache = a3;
}

- (NSMutableDictionary)_icaxPencilKitAttachmentsDict
{
  return self->__icaxPencilKitAttachmentsDict;
}

- (void)set_icaxPencilKitAttachmentsDict:(id)a3
{
  objc_storeStrong((id *)&self->__icaxPencilKitAttachmentsDict, a3);
}

- (NSDictionary)cachedTypingAttributes
{
  return self->_cachedTypingAttributes;
}

- (void)setCachedTypingAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTypingAttributes, a3);
}

- (void)setPendingTypingAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTypingAttributes, a3);
}

- (_NSRange)selectedRangeBeforeMarking
{
  _NSRange *p_selectedRangeBeforeMarking;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRangeBeforeMarking = &self->_selectedRangeBeforeMarking;
  location = self->_selectedRangeBeforeMarking.location;
  length = p_selectedRangeBeforeMarking->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedRangeBeforeMarking:(_NSRange)a3
{
  self->_selectedRangeBeforeMarking = a3;
}

- (void)setIsInProcessEditingForTextStorage:(BOOL)a3
{
  self->_isInProcessEditingForTextStorage = a3;
}

- (ICBaseTextView)dragTextViewStrongReference
{
  return self->_dragTextViewStrongReference;
}

- (void)setDragTextViewStrongReference:(id)a3
{
  objc_storeStrong((id *)&self->_dragTextViewStrongReference, a3);
}

- (ICBaseTextViewItemProviderPasteSession)itemProviderPasteSession
{
  return self->_itemProviderPasteSession;
}

- (void)setItemProviderPasteSession:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviderPasteSession, a3);
}

- (NSMutableArray)viewsGhostedForDrag
{
  return self->_viewsGhostedForDrag;
}

- (void)setViewsGhostedForDrag:(id)a3
{
  objc_storeStrong((id *)&self->_viewsGhostedForDrag, a3);
}

- (void)setNeedsStylingRefreshOnNextLayout:(BOOL)a3
{
  self->_needsStylingRefreshOnNextLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsGhostedForDrag, 0);
  objc_storeStrong((id *)&self->_itemProviderPasteSession, 0);
  objc_storeStrong((id *)&self->_dragTextViewStrongReference, 0);
  objc_storeStrong((id *)&self->_pendingTypingAttributes, 0);
  objc_storeStrong((id *)&self->_cachedTypingAttributes, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__icaxPencilKitAttachmentsDict, 0);
  objc_storeStrong((id *)&self->__icaxCachedChildrenForReparenting, 0);
  objc_storeStrong((id *)&self->__icaxCachedModifiedAttributedString, 0);
  objc_storeStrong((id *)&self->__icaxUnfilteredAttributedString, 0);
  objc_destroyWeak((id *)&self->_calculateRecognitionController);
  objc_destroyWeak((id *)&self->_mentionsController);
  objc_destroyWeak((id *)&self->_hashtagController);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_highlightShapeProvider, 0);
  objc_storeStrong((id *)&self->_renderingSurfaceView, 0);
  objc_storeStrong((id *)&self->_tempHighlightLayer, 0);
  objc_storeStrong((id *)&self->_trackedParagraphCurrentlyUnderDraggedChecklist, 0);
  objc_storeStrong((id *)&self->_draggedChecklistTrackedParagraph, 0);
  objc_storeStrong((id *)&self->_checklistDragFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_icDelegate);
  objc_destroyWeak((id *)&self->_editorController);
}

- (void)showRemoveAttachmentAlertIfNecessaryForOperation:(unint64_t)a3 selectedRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  ICBaseTextView *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  int v37;
  ICBaseTextView *v38;
  void *v39;
  uint64_t v40;
  NSUInteger v41;
  NSUInteger v42;
  ICBaseTextView *v43;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  length = a4.length;
  location = a4.location;
  v54 = *MEMORY[0x1E0C80C00];
  v46 = a5;
  v42 = location;
  v43 = self;
  v41 = length;
  -[ICBaseTextView attachmentsInRange:](self, "attachmentsInRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
        if (objc_msgSend(v15, "attachmentType") == 10
          || objc_msgSend(v15, "attachmentType") == 13)
        {
          v16 = v9;
LABEL_9:
          objc_msgSend(v16, "addObject:", v15);
          goto LABEL_10;
        }
        if (objc_msgSend(v15, "attachmentType") == 4)
        {
          if (objc_msgSend(v15, "isBeingEditedLocallyOnDevice"))
          {
            objc_msgSend(v15, "audioModel");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "audioDocument");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isCallRecording");

            if ((v19 & 1) == 0)
            {
              v16 = v48;
              goto LABEL_9;
            }
          }
        }
        if (objc_msgSend(v15, "attachmentType") == 4)
        {
          objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "currentAttachment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 == v15)
          {
            objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isPlaying");

            if (v23)
            {
              v16 = v47;
              goto LABEL_9;
            }
          }
          else
          {

          }
        }
LABEL_10:
        ++v14;
      }
      while (v12 != v14);
      v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      v12 = v24;
    }
    while (v24);
  }

  if (!objc_msgSend(v48, "count"))
  {
    v26 = v47;
    v25 = v46;
    if (objc_msgSend(v47, "count"))
    {
      -[ICBaseTextView showRemoveInProgressRecordingAlertWithOperation:type:attachments:completionHandler:](v43, "showRemoveInProgressRecordingAlertWithOperation:type:attachments:completionHandler:", a3, 1, v47, v46);
      goto LABEL_28;
    }
    if (!a3 && objc_msgSend(v9, "count"))
    {
      if (objc_msgSend(v9, "count") == 1)
      {
        v27 = v43;
        -[ICBaseTextView selectedRange](v43, "selectedRange");
        if (v28 >= 2)
          v29 = 2;
        else
          v29 = 3;
      }
      else
      {
        v29 = 4;
        v27 = v43;
      }
      if ((unint64_t)-[ICBaseTextView selectedRange](v27, "selectedRange") <= 4)
      {
        -[ICBaseTextView textStorage](v27, "textStorage");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "string");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "ic_trimmedString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v29;
        v33 = objc_msgSend(v32, "length");

        v34 = v33 == 1;
        v29 = v45;
        if (v34 && objc_msgSend(v10, "count") == 1)
        {
          objc_msgSend(v10, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "attachmentType") == 10)
          {

            v27 = v43;
LABEL_42:
            v38 = v27;
LABEL_46:
            -[ICBaseTextView showDeleteInlineDrawingAlertWithType:attachments:completionHandler:](v38, "showDeleteInlineDrawingAlertWithType:attachments:completionHandler:", v29, v9, v46);
            goto LABEL_28;
          }
          objc_msgSend(v10, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "attachmentType");

          v27 = v43;
          if (v37 == 13)
            goto LABEL_42;
        }
      }
      -[ICBaseTextView textStorage](v27, "textStorage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "length");

      if (!v42 && v41 == v40)
      {
        v38 = v43;
        goto LABEL_46;
      }
    }
    (*((void (**)(id, uint64_t))v46 + 2))(v46, 1);
    goto LABEL_28;
  }
  v25 = v46;
  -[ICBaseTextView showRemoveInProgressRecordingAlertWithOperation:type:attachments:completionHandler:](v43, "showRemoveInProgressRecordingAlertWithOperation:type:attachments:completionHandler:", a3, 0, v48, v46);
  v26 = v47;
LABEL_28:

}

- (void)showDeleteInlineDrawingAlertWithType:(unint64_t)a3 attachments:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Delete Drawing?"), &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1EA7E9860, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICBaseTextView(DeleteConfirmation) showDeleteInlineDrawingAlertWithType:attachments:completionHandler:]", 1, 0, CFSTR("Undefined type in delete drawing alert"));
      goto LABEL_3;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Selection contains a drawing."), &stru_1EA7E9860, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Delete Drawings?"), &stru_1EA7E9860, 0);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Selection contains multiple drawings."), &stru_1EA7E9860, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)v14;
      break;
    default:
LABEL_3:
      v11 = 0;
      break;
  }
  -[ICBaseTextView showRemoveAttachmentAlertWithTitle:message:primaryActionTitle:completionHandler:](self, "showRemoveAttachmentAlertWithTitle:message:primaryActionTitle:completionHandler:", v8, v11, v10, v16);

}

- (void)showRemoveInProgressRecordingAlertWithOperation:(unint64_t)a3 type:(unint64_t)a4 attachments:(id)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  id v38;

  v10 = a6;
  objc_msgSend(a5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "audioModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "audioDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCallRecording");

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v14)
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Stop Call Recording?"), &stru_1EA7E9860, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("Replacing this attachment will stop the recording and remove it from the note.");
      goto LABEL_10;
    }
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Delete Audio Recording?"), &stru_1EA7E9860, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = CFSTR("Replacing this attachment will stop the recording and remove it from the note.");
    goto LABEL_15;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICBaseTextView(DeleteConfirmation) showRemoveInProgressRecordingAlertWithOperation:type:attachments:completionHandler:]", 1, 0, CFSTR("Unexpected ICRemoveAttachmentOperation: %ld"), a3);
      v17 = 0;
      v25 = 0;
      v29 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Stop Call Recording?"), &stru_1EA7E9860, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("Deleting this attachment will stop the recording and remove it from the note.");
      goto LABEL_10;
    }
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Delete Audio Recording?"), &stru_1EA7E9860, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = CFSTR("Deleting this attachment will stop the recording and remove it from the note.");
LABEL_15:
    objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_1EA7E9860, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("Delete");
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v14)
  {
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Cut Audio Recording?"), &stru_1EA7E9860, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Cutting this attachment will stop the recording and remove it from the note."), &stru_1EA7E9860, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("Cut");
    goto LABEL_16;
  }
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Stop Call Recording?"), &stru_1EA7E9860, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = CFSTR("Cutting this attachment will stop the recording and remove it from the note.");
LABEL_10:
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1EA7E9860, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v28 = CFSTR("OK");
LABEL_16:
  objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1EA7E9860, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("This will stop the audio that’s playing and remove it from the note."), &stru_1EA7E9860, 0);
    v35 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v35;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke;
  v37[3] = &unk_1EA7E1870;
  v38 = v10;
  v36 = v10;
  -[ICBaseTextView showRemoveAttachmentAlertWithTitle:message:primaryActionTitle:completionHandler:](self, "showRemoveAttachmentAlertWithTitle:message:primaryActionTitle:completionHandler:", v17, v25, v29, v37);

}

void __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0D63A50];
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke_2;
    v3[3] = &unk_1EA7E1848;
    v4 = *(id *)(a1 + 32);
    v5 = 1;
    objc_msgSend(v2, "cancelCurrentAudioRecordingSessionWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)showRemoveAttachmentAlertWithTitle:(id)a3 message:(id)a4 primaryActionTitle:(id)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  ICBaseTextView *v29;
  id v30;
  char v31;
  _QWORD v32[5];
  id v33;
  char v34;

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0DC3450];
  v12 = a5;
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView editorController](self, "editorController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v14, "isEditing");

  v15 = (void *)MEMORY[0x1E0DC3448];
  v16 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke;
  v32[3] = &unk_1EA7E1898;
  v17 = v10;
  v34 = (char)a4;
  v32[4] = self;
  v33 = v17;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v12, 2, v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v18);
  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16;
  v26 = 3221225472;
  v27 = __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_3;
  v28 = &unk_1EA7E1898;
  v31 = (char)a4;
  v29 = self;
  v30 = v17;
  v22 = v17;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, &v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v23, v25, v26, v27, v28, v29);

  -[ICBaseTextView resignFirstResponder](self, "resignFirstResponder");
  -[ICBaseTextView editorController](self, "editorController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
    return dispatchMainAfterDelay();
  return result;
}

void __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEditing:", 1);

}

uint64_t __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
    return dispatchMainAfterDelay();
  return result;
}

void __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEditing:", 1);

}

void __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "handleInlineDrawingDropForItemProvider error creating currentDrawing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Failed to copy PaperKit bundle URL; aborting -- error %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Failed to create link to PaperKit bundle url, falling back to copying -- error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_1DD7B0000, a2, a3, "Failed to remove temporary file: %@, %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_6();
}

void __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_1DD7B0000, v0, v1, "Failed to remove temporary file: %@, %@");
  OUTLINED_FUNCTION_6();
}

void __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Dropping paste item failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)TTTextStorage
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2048;
  v11 = v7;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Expects textStorage be a ICTTTextStorage %@ %p", (uint8_t *)&v8, 0x16u);

}

@end
