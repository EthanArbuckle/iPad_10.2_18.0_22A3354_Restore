@implementation ICPaperImageInsertionController

- (void)setNoteEditor:(id)a3
{
  objc_storeWeak((id *)&self->_noteEditor, a3);
}

- (ICPaperImageInsertionController)initWithNoteEditorViewController:(id)a3
{
  id v4;
  ICPaperImageInsertionController *v5;
  ICPaperImageInsertionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICPaperImageInsertionController;
  v5 = -[ICPaperImageInsertionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICPaperImageInsertionController setNoteEditor:](v5, "setNoteEditor:", v4);

  return v6;
}

- (BOOL)shouldAddImagesToPaper
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSRange v13;
  NSRange v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  _QWORD v31[12];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  NSRange v40;

  if (!objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad"))
    return 0;
  -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_range");
  v8 = v7;

  -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "textViewVisibleRange");
  v12 = v11;

  if (v10 == v6 + v8 && v12 == 0)
    v13.length = 2;
  else
    v13.length = v12 + 1;
  v13.location = v10 - ((v10 == v6 + v8) & (v12 == 0));
  v40.location = v6;
  v40.length = v8;
  v14 = NSIntersectionRange(v13, v40);
  -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = v24;
  -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "note");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "textStorage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0DC10F8];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __57__ICPaperImageInsertionController_shouldAddImagesToPaper__block_invoke;
  v31[3] = &unk_1EA7E0B50;
  v31[6] = v6;
  v31[7] = v8;
  v31[4] = &v36;
  v31[5] = &v32;
  v31[8] = v18;
  v31[9] = v20;
  v31[10] = v22;
  v31[11] = v24;
  objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v28, v14.location, v14.length, 0, v31);

  v29 = v37[3] / v33[3] > 0.7;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return v29;
}

void __57__ICPaperImageInsertionController_shouldAddImagesToPaper__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v7 = a2;
  if (v7)
  {
    v15 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      objc_opt_class();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 24);
      if (a3 + a4 == *(_QWORD *)(a1 + 56))
      {
        v11 = *(double *)(a1 + 88);
        objc_msgSend(v9, "bounds");
        v13 = v11 - v12;
        objc_msgSend(v9, "bounds");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 24)
                                                                    - (v13
                                                                     - v14);
      }

      v7 = v15;
    }
  }

}

- (void)addImagesToPaperWithItemProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSRange v15;
  NSRange v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  os_log_t v40;
  void *v41;
  void *v42;
  void *v43;
  ICSystemPaperDocumentHelper *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  void *v55;
  ICPaperImageInsertionController *v56;
  NSObject *v57;
  _QWORD v58[8];
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  uint8_t buf[24];
  uint64_t v63;
  NSRange v64;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ic_range");
    v10 = v9;

    -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "textViewVisibleRange");
    v14 = v13;

    if (v12 == v8 + v10 && v14 == 0)
      v15.length = 2;
    else
      v15.length = v14 + 1;
    v15.location = v12 - ((v12 == v8 + v10) & (v14 == 0));
    v64.location = v8;
    v64.length = v10;
    v16 = NSIntersectionRange(v15, v64);
    -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v59 = 0;
    v60[0] = &v59;
    v60[1] = 0x3032000000;
    v60[2] = __Block_byref_object_copy__19;
    v60[3] = __Block_byref_object_dispose__19;
    v61 = 0;
    -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "note");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textStorage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0DC10F8];
    v31 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke;
    v58[3] = &unk_1EA7E0B78;
    v58[4] = self;
    v58[5] = &v59;
    *(double *)&v58[6] = v20 + v24 * 0.5;
    *(double *)&v58[7] = v22 + v26 * 0.5;
    objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v30, v16.location, v16.length, 0, v58);

    if (*(_QWORD *)(v60[0] + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "note");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "managedObjectContext");
        v34 = objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
          -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "note");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "textView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[ICInlineDrawingUpgradeHelper initWithNote:managedObjectContext:textView:](v35, "initWithNote:managedObjectContext:textView:", v37, v34, v39);

          objc_msgSend(*(id *)(v60[0] + 40), "attachment");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject upgradeWithAttachment:itemProviders:itemsAnchor:](v40, "upgradeWithAttachment:itemProviders:itemsAnchor:", v41, v4, 4);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
            v43 = (void *)MEMORY[0x1E0CD28B0];
            v52 = v31;
            v53 = 3221225472;
            v54 = __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke_14;
            v55 = &unk_1EA7DD498;
            v56 = self;
            v57 = v40;
            objc_msgSend(v43, "setCompletionBlock:", &v52);
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v52, v53, v54, v55, v56);

          }
          else
          {
            v49 = os_log_create("com.apple.notes", "SystemPaper");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(v60[0] + 40), "attachment");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "loggingDescription");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICPaperImageInsertionController addImagesToPaperWithItemProviders:].cold.2(v51, (uint64_t)buf, v49, v50);
            }

          }
        }
        else
        {
          v40 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[ICPaperImageInsertionController addImagesToPaperWithItemProviders:].cold.1(v40);
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v44 = [ICSystemPaperDocumentHelper alloc];
          objc_msgSend(*(id *)(v60[0] + 40), "attachment");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICPaperImageInsertionController noteEditor](self, "noteEditor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "textView");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[ICSystemPaperDocumentHelper initWithPaperAttachment:textView:](v44, "initWithPaperAttachment:textView:", v45, v47);

          -[NSObject addWithItemProviders:itemsAnchor:](v34, "addWithItemProviders:itemsAnchor:", v4, 4);
        }
        else
        {
          v34 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[ICPaperImageInsertionController addImagesToPaperWithItemProviders:].cold.3((uint64_t)v60, v34, v48);
        }
      }
    }
    else
    {
      v34 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD7B0000, v34, OS_LOG_TYPE_DEFAULT, "Unable to find paper attachment to add image to", buf, 2u);
      }
    }

    _Block_object_dispose(&v59, 8);
  }

}

void __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  int IsTextKit2Enabled;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id obj;
  CGRect v41;
  CGRect v42;

  v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(_QWORD *)(v10 + 40);
    v11 = (id *)(v10 + 40);
    if (!v12)
      objc_storeStrong(v11, obj);
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_msgSend(*(id *)(a1 + 32), "noteEditor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (IsTextKit2Enabled)
    {
      objc_msgSend(v15, "icTextLayoutManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_rectForRange:", a3, a4);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

    }
    else
    {
      objc_msgSend(v15, "layoutManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
      v29 = v28;

      objc_msgSend(*(id *)(a1 + 32), "noteEditor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "textView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "noteEditor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "textView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "textContainer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "boundingRectForGlyphRange:inTextContainer:", v27, v29, v35);
      v19 = v36;
      v21 = v37;
      v23 = v38;
      v25 = v39;

    }
    v41.origin.x = v19;
    v41.origin.y = v21;
    v41.size.width = v23;
    v41.size.height = v25;
    if (CGRectGetMinY(v41) <= *(double *)(a1 + 56))
    {
      v42.origin.x = v19;
      v42.origin.y = v21;
      v42.size.width = v23;
      v42.size.height = v25;
      if (CGRectGetMaxY(v42) >= *(double *)(a1 + 56))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
        *a5 = 1;
      }
    }
  }

}

void __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke_14(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "noteEditor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upgradeAllAttachmentsInNoteWithUpgradeHelper:", *(_QWORD *)(a1 + 40));

}

- (ICNoteEditorViewController)noteEditor
{
  return (ICNoteEditorViewController *)objc_loadWeakRetained((id *)&self->_noteEditor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noteEditor);
}

- (void)addImagesToPaperWithItemProviders:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Unable to upgrade drawing since note didn't have a MOC", v1, 2u);
}

- (void)addImagesToPaperWithItemProviders:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1DD7B0000, a3, (uint64_t)a3, "Upgrading drawing failed for: %@", (uint8_t *)a2);

}

- (void)addImagesToPaperWithItemProviders:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1DD7B0000, a2, a3, "Tried to insert image into %@, but couldn't find a matching type.", (uint8_t *)&v4);
}

@end
