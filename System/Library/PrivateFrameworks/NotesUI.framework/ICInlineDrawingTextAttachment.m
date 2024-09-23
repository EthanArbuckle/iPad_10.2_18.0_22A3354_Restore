@implementation ICInlineDrawingTextAttachment

- (BOOL)canDragWithoutSelecting
{
  return 0;
}

- (void)saveIfNeeded
{
  -[ICInlineDrawingChangeCoalescer updateNowIfNecessary](self->_changeCoalescer, "updateNowIfNecessary");
}

- (void)detachView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICInlineDrawingTextAttachment detachView:fromParentView:](self, "detachView:fromParentView:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)inlineViews
{
  void *v2;
  void *v3;

  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        ICCheckedDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (ICInlineDrawingChangeCoalescer)changeCoalescer
{
  void *v3;
  ICInlineDrawingChangeCoalescer *v4;
  void *v5;
  ICInlineDrawingChangeCoalescer *v6;
  ICInlineDrawingChangeCoalescer *changeCoalescer;

  if (!self->_changeCoalescer)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [ICInlineDrawingChangeCoalescer alloc];
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ICInlineDrawingChangeCoalescer initWithAttachment:](v4, "initWithAttachment:", v5);
      changeCoalescer = self->_changeCoalescer;
      self->_changeCoalescer = v6;

    }
  }
  return self->_changeCoalescer;
}

- (ICDrawingHashtagsAndMentionsController)hashtagsAndMentionsController
{
  void *v3;
  ICDrawingHashtagsAndMentionsController *v4;
  void *v5;
  ICDrawingHashtagsAndMentionsController *v6;
  ICDrawingHashtagsAndMentionsController *hashtagsAndMentionsController;

  if (!self->_hashtagsAndMentionsController)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [ICDrawingHashtagsAndMentionsController alloc];
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ICDrawingHashtagsAndMentionsController initWithAttachment:](v4, "initWithAttachment:", v5);
      hashtagsAndMentionsController = self->_hashtagsAndMentionsController;
      self->_hashtagsAndMentionsController = v6;

    }
  }
  return self->_hashtagsAndMentionsController;
}

- (NSHashTable)inlineDrawingViews
{
  NSHashTable *inlineDrawingViews;
  NSHashTable *v4;
  NSHashTable *v5;

  inlineDrawingViews = self->_inlineDrawingViews;
  if (!inlineDrawingViews)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_inlineDrawingViews;
    self->_inlineDrawingViews = v4;

    inlineDrawingViews = self->_inlineDrawingViews;
  }
  return inlineDrawingViews;
}

- (id)contents
{
  void *v2;
  void *v3;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentAsNSTextAttachment
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:ofType:", v3, v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  return v6;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  ICPrintableTextAttachment *v13;
  void *v14;
  ICPrintableTextAttachment *v15;
  void *v16;
  uint64_t v17;
  __int128 *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  void *v29;
  id v31;
  void *v32;
  id v33;
  _OWORD v34[2];
  __int128 v35;
  _QWORD v36[6];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[6];

  v33 = a4;
  v31 = a5;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke;
  aBlock[3] = &unk_1E5C1D540;
  aBlock[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[ICInlineDrawingChangeCoalescer hasChanges](self->_changeCoalescer, "hasChanges"))
    v9[2](v9);
  -[ICAbstractTextAttachment attachment](self, "attachment", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fallbackImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v9[2](v9);
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fallbackImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v13 = [ICPrintableTextAttachment alloc];
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICPrintableTextAttachment initWithData:ofType:](v13, "initWithData:ofType:", v11, v14);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "length");
  v18 = (__int128 *)MEMORY[0x1E0C9BAA8];
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18[1];
    v40 = *v18;
    v41 = v20;
    v42 = v18[2];
    v37 = v40;
    v38 = v20;
    v39 = v42;
    +[ICAttachmentPreviewImageLoader orientedImage:withTransform:background:backgroundTransform:](ICAttachmentPreviewImageLoader, "orientedImage:withTransform:background:backgroundTransform:", v19, &v40, 1, &v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICPrintableTextAttachment setImage:](v15, "setImage:", v21);
  }
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = &v40;
  *(_QWORD *)&v41 = 0x3032000000;
  *((_QWORD *)&v41 + 1) = __Block_byref_object_copy__54;
  *(_QWORD *)&v42 = __Block_byref_object_dispose__54;
  *((_QWORD *)&v42 + 1) = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "managedObjectContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke_17;
  v36[3] = &unk_1E5C1D9D0;
  v36[4] = self;
  v36[5] = &v40;
  objc_msgSend(v23, "performBlockAndWait:", v36);

  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0D63A10];
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "generateImageForAttachment:fromDrawing:fullResolution:appearanceInfo:", v26, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 40), 1, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v18[1];
    v34[0] = *v18;
    v34[1] = v28;
    v35 = v18[2];
    v37 = v34[0];
    v38 = v28;
    v39 = v35;
    +[ICAttachmentPreviewImageLoader orientedImage:withTransform:background:backgroundTransform:](ICAttachmentPreviewImageLoader, "orientedImage:withTransform:background:backgroundTransform:", v27, &v37, 0, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICPrintableTextAttachment setImage:](v15, "setImage:", v29);
  }

  _Block_object_dispose(&v40, 8);
  return v16;
}

void __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "updateNowIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatePreviewsInOperation:", 0);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_save");

}

void __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inlineDrawingModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "newDrawingFromMergeableData");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v30.receiver = self;
    v30.super_class = (Class)ICInlineDrawingTextAttachment;
    -[ICInlineDrawingTextAttachment viewProviderForParentView:location:textContainer:](&v30, sel_viewProviderForParentView_location_textContainer_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if ((v14 & 1) == 0)
    {
      -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      objc_initWeak(&location, self);
      objc_msgSend(v11, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __82__ICInlineDrawingTextAttachment_viewProviderForParentView_location_textContainer___block_invoke;
      v27 = &unk_1E5C1E020;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v17, "ic_addDidMoveToWindowHandler:", &v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v8, "window", v24, v25, v26, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICInkPaletteController sharedToolPickerForWindow:](ICInkPaletteController, "sharedToolPickerForWindow:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v20, "isVisible");
      objc_msgSend(v11, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setVisible:forFirstResponder:", v21, v22);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __82__ICInlineDrawingTextAttachment_viewProviderForParentView_location_textContainer___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "configureHashtagAndMentionsForView:", v3);

}

- (void)configureHashtagAndMentionsForView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsMentionDetection:", objc_msgSend(v5, "isSharedViaICloud"));

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsHashtagDetection:", objc_msgSend(v7, "isPasswordProtected") ^ 1);

  objc_msgSend(v14, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICInlineDrawingTextAttachment hashtagsAndMentionsController](self, "hashtagsAndMentionsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHashtagAndMentionsDelegate:", v9);

  }
  else
  {
    objc_msgSend(v4, "setHashtagAndMentionsDelegate:", 0);
  }

  objc_msgSend(v14, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "containsObject:", v14);

    if ((v13 & 1) == 0)
      -[ICInlineCanvasTextAttachment updatePaletteVisibility](self, "updatePaletteVisibility");
    -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);
  }
  else
  {
    objc_msgSend(v11, "removeObject:", v14);
  }

}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)ICInlineDrawingTextAttachment;
    -[ICInlineDrawingTextAttachment viewProviderForParentView:characterIndex:layoutManager:](&v17, sel_viewProviderForParentView_characterIndex_layoutManager_, v8, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICInkPaletteController sharedToolPickerForWindow:](ICInkPaletteController, "sharedToolPickerForWindow:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "isVisible");
      objc_msgSend(v10, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVisible:forFirstResponder:", v15, v16);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v16 = a7;
  v17 = a5;
  -[ICInlineDrawingTextAttachment setCachedDrawingViewForPlaceView:](self, "setCachedDrawingViewForPlaceView:", v15);
  -[ICInlineDrawingTextAttachment setCachedControlViewForPlaceView:](self, "setCachedControlViewForPlaceView:", v17);
  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v15);

  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v15);

  v28.receiver = self;
  v28.super_class = (Class)ICInlineDrawingTextAttachment;
  -[ICInlineDrawingTextAttachment placeView:withFrame:inParentView:characterIndex:layoutManager:](&v28, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v15, v17, a6, v16, x, y, width, height);

  if ((v19 & 1) == 0)
    -[ICInlineCanvasTextAttachment updatePaletteVisibility](self, "updatePaletteVisibility");
  objc_opt_class();
  ICDynamicCast();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[ICAbstractTextAttachment foregroundAlpha](self, "foregroundAlpha");
    objc_msgSend(v21, "ic_setAlpha:");
    objc_msgSend(v21, "hashtagAndMentionsDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineDrawingTextAttachment hashtagsAndMentionsController](self, "hashtagsAndMentionsController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 != v23)
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWantsMentionDetection:", objc_msgSend(v24, "isSharedViaICloud"));

      -[ICAbstractTextAttachment attachment](self, "attachment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "note");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWantsHashtagDetection:", objc_msgSend(v26, "isPasswordProtected") ^ 1);

      -[ICInlineDrawingTextAttachment hashtagsAndMentionsController](self, "hashtagsAndMentionsController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHashtagAndMentionsDelegate:", v27);

    }
  }
  -[ICInlineDrawingTextAttachment setCachedDrawingViewForPlaceView:](self, "setCachedDrawingViewForPlaceView:", 0);
  -[ICInlineDrawingTextAttachment setCachedControlViewForPlaceView:](self, "setCachedControlViewForPlaceView:", 0);

}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ICInlineDrawingChangeCoalescer *changeCoalescer;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICInlineDrawingTextAttachment;
  -[ICBaseTextAttachment detachView:fromParentView:](&v14, sel_detachView_fromParentView_, v6, v7);
  -[ICInlineDrawingTextAttachment cachedDrawingViewForPlaceView](self, "cachedDrawingViewForPlaceView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    -[ICInlineDrawingTextAttachment cachedControlViewForPlaceView](self, "cachedControlViewForPlaceView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v7)
      goto LABEL_7;
  }
  else
  {

  }
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "setHashtagAndMentionsDelegate:", 0);

LABEL_7:
  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v6);

  -[ICInlineDrawingChangeCoalescer updateNowIfNecessary](self->_changeCoalescer, "updateNowIfNecessary");
  changeCoalescer = self->_changeCoalescer;
  self->_changeCoalescer = 0;

}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect result;

  y = a7.y;
  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  v11 = a6.origin.y;
  v12 = a6.origin.x;
  v16 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ICInlineDrawingTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v37, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, v16, v12, v11, width, height, x, y);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v16, "textLayoutManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    objc_msgSend(v16, "layoutManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v30 = v29;
      v32 = v31;

      v24 = width / (v30 / v32);
      v18 = 0.0;
      v20 = 0.0;
      v22 = width;
    }
  }

  v33 = v18;
  v34 = v20;
  v35 = v22;
  v36 = v24;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v34.receiver = self;
  v34.super_class = (Class)ICInlineDrawingTextAttachment;
  v14 = a3;
  -[ICBaseTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v34, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v14, a6, v12, v11, width, height, x, y);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "layoutManager", v34.receiver, v34.super_class);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;

    v22 = width / (v27 / v29);
    v16 = 0.0;
    v18 = 0.0;
    v20 = width;
  }
  v30 = v16;
  v31 = v18;
  v32 = v20;
  v33 = v22;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)_image
{
  return 0;
}

- (void)resetZoom
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "conformsToProtocol:", &unk_1EED6F730))
        {
          ICProtocolCast();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "resetZoom");

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)drawingDataDidChange:(id)a3 view:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  ICInlineDrawingTextAttachment *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  -[ICInlineDrawingTextAttachment fileType](self, "fileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD12D8]);

  if (v6 && v8)
  {
    -[ICInlineDrawingTextAttachment changeCoalescer](self, "changeCoalescer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "drawingDataDidChange:", v6);

    -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {

    }
    else
    {
      v11 = -[ICInlineDrawingTextAttachment isHandlingDrawingDidChange](self, "isHandlingDrawingDidChange");

      if (!v11)
      {
        -[ICInlineDrawingTextAttachment setIsHandlingDrawingDidChange:](self, "setIsHandlingDrawingDidChange:", 1);
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v14)
        {
          v15 = v14;
          v33 = self;
          v34 = v6;
          v16 = 0;
          v17 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v45 != v17)
                objc_enumerationMutation(v13);
              v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              objc_msgSend(v19, "gestureRecognizers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v41;
                do
                {
                  for (j = 0; j != v22; ++j)
                  {
                    if (*(_QWORD *)v41 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                    if (objc_msgSend(v25, "state") == 2 || objc_msgSend(v25, "state") == 3)
                      v16 = 1;
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
                }
                while (v22);
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
          }
          while (v15);

          self = v33;
          v6 = v34;
          if ((v16 & 1) != 0)
            goto LABEL_38;
        }
        else
        {

        }
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        -[ICInlineDrawingTextAttachment inlineDrawingViews](self, "inlineDrawingViews");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copy");

        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v37 != v30)
                objc_enumerationMutation(v27);
              v32 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * k);
              if (v32 != v35
                && objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "conformsToProtocol:", &unk_1EED6F730)&& (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v32, "drawingDataDidChange:", v6);
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v29);
        }

LABEL_38:
        -[ICInlineDrawingTextAttachment setIsHandlingDrawingDidChange:](self, "setIsHandlingDrawingDidChange:", 0);
      }
    }
  }

}

- (void)setChangeCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_changeCoalescer, a3);
}

- (void)setInlineDrawingViews:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingViews, a3);
}

- (BOOL)isHandlingDrawingDidChange
{
  return self->_isHandlingDrawingDidChange;
}

- (void)setIsHandlingDrawingDidChange:(BOOL)a3
{
  self->_isHandlingDrawingDidChange = a3;
}

- (void)setHashtagsAndMentionsController:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagsAndMentionsController, a3);
}

- (UIView)cachedDrawingViewForPlaceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cachedDrawingViewForPlaceView);
}

- (void)setCachedDrawingViewForPlaceView:(id)a3
{
  objc_storeWeak((id *)&self->_cachedDrawingViewForPlaceView, a3);
}

- (UIView)cachedControlViewForPlaceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cachedControlViewForPlaceView);
}

- (void)setCachedControlViewForPlaceView:(id)a3
{
  objc_storeWeak((id *)&self->_cachedControlViewForPlaceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedControlViewForPlaceView);
  objc_destroyWeak((id *)&self->_cachedDrawingViewForPlaceView);
  objc_storeStrong((id *)&self->_hashtagsAndMentionsController, 0);
  objc_storeStrong((id *)&self->_inlineDrawingViews, 0);
  objc_storeStrong((id *)&self->_changeCoalescer, 0);
}

@end
